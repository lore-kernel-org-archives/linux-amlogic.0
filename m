From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 28 Dec 2017 23:21:26 +0100
Subject: [RFT net-next v3 3/5] net: stmmac: dwmac-meson8b: fix internal RGMII
 clock configuration
In-Reply-To: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
References: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171228222128.15215-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

While testing the dwmac-meson8b with an RGMII PHY on Meson8b we
discovered that the m25_div is not actually a divider but rather a gate.
This matches with the datasheet which describes bit 10 as "Generate
25MHz clock for PHY". Back when the driver was written it was assumed
that this was a divider (which could divide by 5 or 10) because other
clock bits in the datasheet were documented incorrectly.

Tests have shown that without bit 10 set the RTL8211F RGMII PHY on
Odroid-C1 (using a Meson8b SoC) does not work.
On GXBB and newer SoCs (where the driver was initially tested with RGMII
PHYs) this is not a problem because the input clock is running at 1GHz.
The m250_div clock's biggest possible divider is 7 (3-bit divider, with
value 0 being reserved). Thus we end up with a m250_div of 4 and a
"m25_div" of 10 (= register value 1).

Instead it turns out that the Ethernet IP block seems to have a fixed
"divide by 10" clock internally. This means that bit 10 is a gate clock
which enables the RGMII clock output.

This replaces the "m25_div" clock with a clock gate called "m25_en"
which ensures that we can set this bit to 1 whenever we enable RGMII
mode. This however means that we are now missing a "divide by 10" after
the m250_div (and before our new m25_en), otherwise the common clock
framework thinks that the rate of the m25_en clock is 10-times higher
than it is in the actual hardware. That is solved by adding a
fixed-factor clock which divides the m250_div output by 10.

Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
Reported-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 66 +++++++++++++---------
 1 file changed, 38 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 1c14210df465..7199e8c08536 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -40,9 +40,7 @@
 #define PRG_ETH0_CLK_M250_DIV_SHIFT	7
 #define PRG_ETH0_CLK_M250_DIV_WIDTH	3
 
-/* divides the result of m25_sel by either 5 (bit unset) or 10 (bit set) */
-#define PRG_ETH0_CLK_M25_DIV_SHIFT	10
-#define PRG_ETH0_CLK_M25_DIV_WIDTH	1
+#define PRG_ETH0_GENERATE_25M_PHY_CLOCK	10
 
 #define PRG_ETH0_INVERTED_RMII_CLK	BIT(11)
 #define PRG_ETH0_TX_AND_PHY_REF_CLK	BIT(12)
@@ -63,8 +61,11 @@ struct meson8b_dwmac {
 	struct clk_divider	m250_div;
 	struct clk		*m250_div_clk;
 
-	struct clk_divider	m25_div;
-	struct clk		*m25_div_clk;
+	struct clk_fixed_factor	fixed_div10;
+	struct clk		*fixed_div10_clk;
+
+	struct clk_gate		m25_en;
+	struct clk		*m25_en_clk;
 
 	u32			tx_delay_ns;
 };
@@ -88,11 +89,6 @@ static int meson8b_init_rgmii_clk(struct meson8b_dwmac *dwmac)
 	struct device *dev = &dwmac->pdev->dev;
 	const char *clk_div_parents[1];
 	const char *mux_parent_names[MUX_CLK_NUM_PARENTS];
-	static const struct clk_div_table clk_25m_div_table[] = {
-		{ .val = 0, .div = 5 },
-		{ .val = 1, .div = 10 },
-		{ /* sentinel */ },
-	};
 
 	/* get the mux parents from DT */
 	for (i = 0; i < MUX_CLK_NUM_PARENTS; i++) {
@@ -149,25 +145,39 @@ static int meson8b_init_rgmii_clk(struct meson8b_dwmac *dwmac)
 	if (WARN_ON(IS_ERR(dwmac->m250_div_clk)))
 		return PTR_ERR(dwmac->m250_div_clk);
 
-	/* create the m25_div */
-	init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#m25_div",
+	/* create the fixed_div10 */
+	init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#fixed_div10",
 				   dev_name(dev));
-	init.ops = &clk_divider_ops;
-	init.flags = CLK_IS_BASIC | CLK_SET_RATE_PARENT;
+	init.ops = &clk_fixed_factor_ops;
+	init.flags = CLK_SET_RATE_PARENT;
 	clk_div_parents[0] = __clk_get_name(dwmac->m250_div_clk);
 	init.parent_names = clk_div_parents;
 	init.num_parents = ARRAY_SIZE(clk_div_parents);
 
-	dwmac->m25_div.reg = dwmac->regs + PRG_ETH0;
-	dwmac->m25_div.shift = PRG_ETH0_CLK_M25_DIV_SHIFT;
-	dwmac->m25_div.width = PRG_ETH0_CLK_M25_DIV_WIDTH;
-	dwmac->m25_div.table = clk_25m_div_table;
-	dwmac->m25_div.hw.init = &init;
-	dwmac->m25_div.flags = CLK_DIVIDER_ALLOW_ZERO;
+	dwmac->fixed_div10.mult = 1;
+	dwmac->fixed_div10.div = 10;
+	dwmac->fixed_div10.hw.init = &init;
+
+	dwmac->fixed_div10_clk = devm_clk_register(dev, &dwmac->fixed_div10.hw);
+	if (WARN_ON(IS_ERR(dwmac->fixed_div10_clk)))
+		return PTR_ERR(dwmac->fixed_div10_clk);
+
+	/* create the m25_en */
+	init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#m25_en",
+				   dev_name(dev));
+	init.ops = &clk_gate_ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	clk_div_parents[0] = __clk_get_name(dwmac->fixed_div10_clk);
+	init.parent_names = clk_div_parents;
+	init.num_parents = ARRAY_SIZE(clk_div_parents);
+
+	dwmac->m25_en.reg = dwmac->regs + PRG_ETH0;
+	dwmac->m25_en.bit_idx = PRG_ETH0_GENERATE_25M_PHY_CLOCK;
+	dwmac->m25_en.hw.init = &init;
 
-	dwmac->m25_div_clk = devm_clk_register(dev, &dwmac->m25_div.hw);
-	if (WARN_ON(IS_ERR(dwmac->m25_div_clk)))
-		return PTR_ERR(dwmac->m25_div_clk);
+	dwmac->m25_en_clk = devm_clk_register(dev, &dwmac->m25_en.hw);
+	if (WARN_ON(IS_ERR(dwmac->m25_en_clk)))
+		return PTR_ERR(dwmac->m25_en_clk);
 
 	return 0;
 }
@@ -200,16 +210,16 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 		meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK,
 					tx_dly_val << PRG_ETH0_TXDLY_SHIFT);
 
-		ret = clk_prepare_enable(dwmac->m25_div_clk);
+		ret = clk_prepare_enable(dwmac->m25_en_clk);
 		if (ret) {
 			dev_err(&dwmac->pdev->dev, "failed to enable the PHY clock\n");
 			return ret;
 		}
 
 		/* Generate the 25MHz RGMII clock for the PHY */
-		ret = clk_set_rate(dwmac->m25_div_clk, 25 * 1000 * 1000);
+		ret = clk_set_rate(dwmac->m25_en_clk, 25 * 1000 * 1000);
 		if (ret) {
-			clk_disable_unprepare(dwmac->m25_div_clk);
+			clk_disable_unprepare(dwmac->m25_en_clk);
 
 			dev_err(&dwmac->pdev->dev, "failed to set PHY clock\n");
 			return ret;
@@ -305,7 +315,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 err_clk_disable:
 	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
-		clk_disable_unprepare(dwmac->m25_div_clk);
+		clk_disable_unprepare(dwmac->m25_en_clk);
 err_remove_config_dt:
 	stmmac_remove_config_dt(pdev, plat_dat);
 
@@ -317,7 +327,7 @@ static int meson8b_dwmac_remove(struct platform_device *pdev)
 	struct meson8b_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
 
 	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
-		clk_disable_unprepare(dwmac->m25_div_clk);
+		clk_disable_unprepare(dwmac->m25_en_clk);
 
 	return stmmac_pltfr_remove(pdev);
 }
-- 
2.15.1
