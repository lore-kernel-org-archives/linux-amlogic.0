From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 17 Feb 2018 15:08:20 +0100
Subject: [net-next PATCH v1 3/3] net: stmmac: dwmac-meson8b: make the clock
 configurations private
In-Reply-To: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
References: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180217140820.30257-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The common clock framework needs access to the "clock configuration"
structs during runtime.
However, only the common clock framework should access these. Ensure
this by moving the configuration structs out of struct meson8b_dwmac,
so only meson8b_init_rgmii_tx_clk() and the common clock framework know
about these configurations.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 45 ++++++++++++----------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 0dfce35c5583..2d5d4aea3bcb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -49,19 +49,17 @@
 
 struct meson8b_dwmac {
 	struct device		*dev;
-
 	void __iomem		*regs;
-
 	phy_interface_t		phy_mode;
+	struct clk		*rgmii_tx_clk;
+	u32			tx_delay_ns;
+};
 
+struct meson8b_dwmac_clk_configs {
 	struct clk_mux		m250_mux;
 	struct clk_divider	m250_div;
 	struct clk_fixed_factor	fixed_div2;
 	struct clk_gate		rgmii_tx_en;
-
-	struct clk		*rgmii_tx_clk;
-
-	u32			tx_delay_ns;
 };
 
 static void meson8b_dwmac_mask_bits(struct meson8b_dwmac *dwmac, u32 reg,
@@ -106,6 +104,11 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 	struct clk *clk;
 	struct device *dev = dwmac->dev;
 	const char *parent_name, *mux_parent_names[MUX_CLK_NUM_PARENTS];
+	struct meson8b_dwmac_clk_configs *clk_configs;
+
+	clk_configs = devm_kzalloc(dev, sizeof(*clk_configs), GFP_KERNEL);
+	if (!clk_configs)
+		return -ENOMEM;
 
 	/* get the mux parents from DT */
 	for (i = 0; i < MUX_CLK_NUM_PARENTS; i++) {
@@ -123,43 +126,43 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 		mux_parent_names[i] = __clk_get_name(clk);
 	}
 
-	dwmac->m250_mux.reg = dwmac->regs + PRG_ETH0;
-	dwmac->m250_mux.shift = PRG_ETH0_CLK_M250_SEL_SHIFT;
-	dwmac->m250_mux.mask = PRG_ETH0_CLK_M250_SEL_MASK;
+	clk_configs->m250_mux.reg = dwmac->regs + PRG_ETH0;
+	clk_configs->m250_mux.shift = PRG_ETH0_CLK_M250_SEL_SHIFT;
+	clk_configs->m250_mux.mask = PRG_ETH0_CLK_M250_SEL_MASK;
 	clk = meson8b_dwmac_register_clk(dwmac, "m250_sel", mux_parent_names,
 					 MUX_CLK_NUM_PARENTS, &clk_mux_ops,
-					 &dwmac->m250_mux.hw);
+					 &clk_configs->m250_mux.hw);
 	if (WARN_ON(IS_ERR(clk)))
 		return PTR_ERR(clk);
 
 	parent_name = __clk_get_name(clk);
-	dwmac->m250_div.reg = dwmac->regs + PRG_ETH0;
-	dwmac->m250_div.shift = PRG_ETH0_CLK_M250_DIV_SHIFT;
-	dwmac->m250_div.width = PRG_ETH0_CLK_M250_DIV_WIDTH;
-	dwmac->m250_div.flags = CLK_DIVIDER_ONE_BASED |
+	clk_configs->m250_div.reg = dwmac->regs + PRG_ETH0;
+	clk_configs->m250_div.shift = PRG_ETH0_CLK_M250_DIV_SHIFT;
+	clk_configs->m250_div.width = PRG_ETH0_CLK_M250_DIV_WIDTH;
+	clk_configs->m250_div.flags = CLK_DIVIDER_ONE_BASED |
 				CLK_DIVIDER_ALLOW_ZERO |
 				CLK_DIVIDER_ROUND_CLOSEST;
 	clk = meson8b_dwmac_register_clk(dwmac, "m250_div", &parent_name, 1,
 					 &clk_divider_ops,
-					 &dwmac->m250_div.hw);
+					 &clk_configs->m250_div.hw);
 	if (WARN_ON(IS_ERR(clk)))
 		return PTR_ERR(clk);
 
 	parent_name = __clk_get_name(clk);
-	dwmac->fixed_div2.mult = 1;
-	dwmac->fixed_div2.div = 2;
+	clk_configs->fixed_div2.mult = 1;
+	clk_configs->fixed_div2.div = 2;
 	clk = meson8b_dwmac_register_clk(dwmac, "fixed_div2", &parent_name, 1,
 					 &clk_fixed_factor_ops,
-					 &dwmac->fixed_div2.hw);
+					 &clk_configs->fixed_div2.hw);
 	if (WARN_ON(IS_ERR(clk)))
 		return PTR_ERR(clk);
 
 	parent_name = __clk_get_name(clk);
-	dwmac->rgmii_tx_en.reg = dwmac->regs + PRG_ETH0;
-	dwmac->rgmii_tx_en.bit_idx = PRG_ETH0_RGMII_TX_CLK_EN;
+	clk_configs->rgmii_tx_en.reg = dwmac->regs + PRG_ETH0;
+	clk_configs->rgmii_tx_en.bit_idx = PRG_ETH0_RGMII_TX_CLK_EN;
 	clk = meson8b_dwmac_register_clk(dwmac, "rgmii_tx_en", &parent_name, 1,
 					 &clk_gate_ops,
-					 &dwmac->rgmii_tx_en.hw);
+					 &clk_configs->rgmii_tx_en.hw);
 	if (WARN_ON(IS_ERR(clk)))
 		return PTR_ERR(clk);
 
-- 
2.16.1
