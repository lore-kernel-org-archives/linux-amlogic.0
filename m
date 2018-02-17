From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 17 Feb 2018 15:08:18 +0100
Subject: [net-next PATCH v1 1/3] net: stmmac: dwmac-meson8b: simplify clock
 registration
In-Reply-To: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
References: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180217140820.30257-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

To goal of this patch is to simplify the registration of the RGMII TX
clock (and it's parent clocks). This is achieved by:
- introducing the meson8b_dwmac_register_clk helper-function to remove
  code duplication when registering a single clock (this saves a few
  lines since we have 4 clocks internally)
- using devm_add_action_or_reset to disable the RGMII TX clock
  automatically when needed. This also allows us to re-use the standard
  stmmac_pltfr_remove function.
- devm_kasprintf() and devm_kstrdup() are not used anymore to generate
  the clock name (these are replaced by a variable on the stack) because
  the common clock framework already uses kstrdup() internally.

No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 156 +++++++++------------
 1 file changed, 65 insertions(+), 91 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 5270d26f0bc6..84a9a900e74e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -55,17 +55,11 @@ struct meson8b_dwmac {
 	phy_interface_t		phy_mode;
 
 	struct clk_mux		m250_mux;
-	struct clk		*m250_mux_clk;
-	struct clk		*m250_mux_parent[MUX_CLK_NUM_PARENTS];
-
 	struct clk_divider	m250_div;
-	struct clk		*m250_div_clk;
-
 	struct clk_fixed_factor	fixed_div2;
-	struct clk		*fixed_div2_clk;
-
 	struct clk_gate		rgmii_tx_en;
-	struct clk		*rgmii_tx_en_clk;
+
+	struct clk		*rgmii_tx_clk;
 
 	u32			tx_delay_ns;
 };
@@ -82,106 +76,95 @@ static void meson8b_dwmac_mask_bits(struct meson8b_dwmac *dwmac, u32 reg,
 	writel(data, dwmac->regs + reg);
 }
 
-static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
+static struct clk *meson8b_dwmac_register_clk(struct meson8b_dwmac *dwmac,
+					      const char *name_suffix,
+					      const char **parent_names,
+					      int num_parents,
+					      const struct clk_ops *ops,
+					      struct clk_hw *hw)
 {
+	struct device *dev = &dwmac->pdev->dev;
 	struct clk_init_data init;
+	char clk_name[32];
+
+	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(dev),
+		 name_suffix);
+
+	init.name = clk_name;
+	init.ops = ops;
+	init.flags = CLK_SET_RATE_PARENT;
+	init.parent_names = parent_names;
+	init.num_parents = num_parents;
+
+	hw->init = &init;
+
+	return devm_clk_register(dev, hw);
+}
+
+static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
+{
 	int i, ret;
+	struct clk *clk;
 	struct device *dev = &dwmac->pdev->dev;
-	char clk_name[32];
-	const char *clk_div_parents[1];
-	const char *mux_parent_names[MUX_CLK_NUM_PARENTS];
+	const char *parent_name, *mux_parent_names[MUX_CLK_NUM_PARENTS];
 
 	/* get the mux parents from DT */
 	for (i = 0; i < MUX_CLK_NUM_PARENTS; i++) {
 		char name[16];
 
 		snprintf(name, sizeof(name), "clkin%d", i);
-		dwmac->m250_mux_parent[i] = devm_clk_get(dev, name);
-		if (IS_ERR(dwmac->m250_mux_parent[i])) {
-			ret = PTR_ERR(dwmac->m250_mux_parent[i]);
+		clk = devm_clk_get(dev, name);
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
 			if (ret != -EPROBE_DEFER)
 				dev_err(dev, "Missing clock %s\n", name);
 			return ret;
 		}
 
-		mux_parent_names[i] =
-			__clk_get_name(dwmac->m250_mux_parent[i]);
+		mux_parent_names[i] = __clk_get_name(clk);
 	}
 
-	/* create the m250_mux */
-	snprintf(clk_name, sizeof(clk_name), "%s#m250_sel", dev_name(dev));
-	init.name = clk_name;
-	init.ops = &clk_mux_ops;
-	init.flags = CLK_SET_RATE_PARENT;
-	init.parent_names = mux_parent_names;
-	init.num_parents = MUX_CLK_NUM_PARENTS;
-
 	dwmac->m250_mux.reg = dwmac->regs + PRG_ETH0;
 	dwmac->m250_mux.shift = PRG_ETH0_CLK_M250_SEL_SHIFT;
 	dwmac->m250_mux.mask = PRG_ETH0_CLK_M250_SEL_MASK;
-	dwmac->m250_mux.flags = 0;
-	dwmac->m250_mux.table = NULL;
-	dwmac->m250_mux.hw.init = &init;
-
-	dwmac->m250_mux_clk = devm_clk_register(dev, &dwmac->m250_mux.hw);
-	if (WARN_ON(IS_ERR(dwmac->m250_mux_clk)))
-		return PTR_ERR(dwmac->m250_mux_clk);
-
-	/* create the m250_div */
-	snprintf(clk_name, sizeof(clk_name), "%s#m250_div", dev_name(dev));
-	init.name = devm_kstrdup(dev, clk_name, GFP_KERNEL);
-	init.ops = &clk_divider_ops;
-	init.flags = CLK_SET_RATE_PARENT;
-	clk_div_parents[0] = __clk_get_name(dwmac->m250_mux_clk);
-	init.parent_names = clk_div_parents;
-	init.num_parents = ARRAY_SIZE(clk_div_parents);
+	clk = meson8b_dwmac_register_clk(dwmac, "m250_sel", mux_parent_names,
+					 MUX_CLK_NUM_PARENTS, &clk_mux_ops,
+					 &dwmac->m250_mux.hw);
+	if (WARN_ON(IS_ERR(clk)))
+		return PTR_ERR(clk);
 
+	parent_name = __clk_get_name(clk);
 	dwmac->m250_div.reg = dwmac->regs + PRG_ETH0;
 	dwmac->m250_div.shift = PRG_ETH0_CLK_M250_DIV_SHIFT;
 	dwmac->m250_div.width = PRG_ETH0_CLK_M250_DIV_WIDTH;
-	dwmac->m250_div.hw.init = &init;
 	dwmac->m250_div.flags = CLK_DIVIDER_ONE_BASED |
 				CLK_DIVIDER_ALLOW_ZERO |
 				CLK_DIVIDER_ROUND_CLOSEST;
+	clk = meson8b_dwmac_register_clk(dwmac, "m250_div", &parent_name, 1,
+					 &clk_divider_ops,
+					 &dwmac->m250_div.hw);
+	if (WARN_ON(IS_ERR(clk)))
+		return PTR_ERR(clk);
 
-	dwmac->m250_div_clk = devm_clk_register(dev, &dwmac->m250_div.hw);
-	if (WARN_ON(IS_ERR(dwmac->m250_div_clk)))
-		return PTR_ERR(dwmac->m250_div_clk);
-
-	/* create the fixed_div2 */
-	snprintf(clk_name, sizeof(clk_name), "%s#fixed_div2", dev_name(dev));
-	init.name = devm_kstrdup(dev, clk_name, GFP_KERNEL);
-	init.ops = &clk_fixed_factor_ops;
-	init.flags = CLK_SET_RATE_PARENT;
-	clk_div_parents[0] = __clk_get_name(dwmac->m250_div_clk);
-	init.parent_names = clk_div_parents;
-	init.num_parents = ARRAY_SIZE(clk_div_parents);
-
+	parent_name = __clk_get_name(clk);
 	dwmac->fixed_div2.mult = 1;
 	dwmac->fixed_div2.div = 2;
-	dwmac->fixed_div2.hw.init = &init;
-
-	dwmac->fixed_div2_clk = devm_clk_register(dev, &dwmac->fixed_div2.hw);
-	if (WARN_ON(IS_ERR(dwmac->fixed_div2_clk)))
-		return PTR_ERR(dwmac->fixed_div2_clk);
-
-	/* create the rgmii_tx_en */
-	init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#rgmii_tx_en",
-				   dev_name(dev));
-	init.ops = &clk_gate_ops;
-	init.flags = CLK_SET_RATE_PARENT;
-	clk_div_parents[0] = __clk_get_name(dwmac->fixed_div2_clk);
-	init.parent_names = clk_div_parents;
-	init.num_parents = ARRAY_SIZE(clk_div_parents);
+	clk = meson8b_dwmac_register_clk(dwmac, "fixed_div2", &parent_name, 1,
+					 &clk_fixed_factor_ops,
+					 &dwmac->fixed_div2.hw);
+	if (WARN_ON(IS_ERR(clk)))
+		return PTR_ERR(clk);
 
+	parent_name = __clk_get_name(clk);
 	dwmac->rgmii_tx_en.reg = dwmac->regs + PRG_ETH0;
 	dwmac->rgmii_tx_en.bit_idx = PRG_ETH0_RGMII_TX_CLK_EN;
-	dwmac->rgmii_tx_en.hw.init = &init;
+	clk = meson8b_dwmac_register_clk(dwmac, "rgmii_tx_en", &parent_name, 1,
+					 &clk_gate_ops,
+					 &dwmac->rgmii_tx_en.hw);
+	if (WARN_ON(IS_ERR(clk)))
+		return PTR_ERR(clk);
 
-	dwmac->rgmii_tx_en_clk = devm_clk_register(dev,
-						   &dwmac->rgmii_tx_en.hw);
-	if (WARN_ON(IS_ERR(dwmac->rgmii_tx_en_clk)))
-		return PTR_ERR(dwmac->rgmii_tx_en_clk);
+	dwmac->rgmii_tx_clk = clk;
 
 	return 0;
 }
@@ -219,19 +202,23 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 		 * a register) based on the line-speed (125MHz for Gbit speeds,
 		 * 25MHz for 100Mbit/s and 2.5MHz for 10Mbit/s).
 		 */
-		ret = clk_set_rate(dwmac->rgmii_tx_en_clk, 125 * 1000 * 1000);
+		ret = clk_set_rate(dwmac->rgmii_tx_clk, 125 * 1000 * 1000);
 		if (ret) {
 			dev_err(&dwmac->pdev->dev,
 				"failed to set RGMII TX clock\n");
 			return ret;
 		}
 
-		ret = clk_prepare_enable(dwmac->rgmii_tx_en_clk);
+		ret = clk_prepare_enable(dwmac->rgmii_tx_clk);
 		if (ret) {
 			dev_err(&dwmac->pdev->dev,
 				"failed to enable the RGMII TX clock\n");
 			return ret;
 		}
+
+		devm_add_action_or_reset(&dwmac->pdev->dev,
+					(void(*)(void *))clk_disable_unprepare,
+					dwmac->rgmii_tx_clk);
 		break;
 
 	case PHY_INTERFACE_MODE_RMII:
@@ -317,29 +304,16 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
-		goto err_clk_disable;
+		goto err_remove_config_dt;
 
 	return 0;
 
-err_clk_disable:
-	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
-		clk_disable_unprepare(dwmac->rgmii_tx_en_clk);
 err_remove_config_dt:
 	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
 
-static int meson8b_dwmac_remove(struct platform_device *pdev)
-{
-	struct meson8b_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
-
-	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
-		clk_disable_unprepare(dwmac->rgmii_tx_en_clk);
-
-	return stmmac_pltfr_remove(pdev);
-}
-
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{ .compatible = "amlogic,meson8b-dwmac" },
 	{ .compatible = "amlogic,meson-gxbb-dwmac" },
@@ -349,7 +323,7 @@ MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
 
 static struct platform_driver meson8b_dwmac_driver = {
 	.probe  = meson8b_dwmac_probe,
-	.remove = meson8b_dwmac_remove,
+	.remove = stmmac_pltfr_remove,
 	.driver = {
 		.name           = "meson8b-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.16.1
