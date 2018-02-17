From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 17 Feb 2018 15:08:19 +0100
Subject: [net-next PATCH v1 2/3] net: stmmac: dwmac-meson8b: only keep struct
 device around
In-Reply-To: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
References: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180217140820.30257-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Nothing in the dwmac-meson8b driver (except .probe itself) requires the
platform_device anymore after .probe has finished. Replace it with a
pointer to struct device since this is what the functions inside the
driver are actually accessing.
No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 84a9a900e74e..0dfce35c5583 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -48,7 +48,7 @@
 #define MUX_CLK_NUM_PARENTS		2
 
 struct meson8b_dwmac {
-	struct platform_device	*pdev;
+	struct device		*dev;
 
 	void __iomem		*regs;
 
@@ -83,11 +83,10 @@ static struct clk *meson8b_dwmac_register_clk(struct meson8b_dwmac *dwmac,
 					      const struct clk_ops *ops,
 					      struct clk_hw *hw)
 {
-	struct device *dev = &dwmac->pdev->dev;
 	struct clk_init_data init;
 	char clk_name[32];
 
-	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(dev),
+	snprintf(clk_name, sizeof(clk_name), "%s#%s", dev_name(dwmac->dev),
 		 name_suffix);
 
 	init.name = clk_name;
@@ -98,14 +97,14 @@ static struct clk *meson8b_dwmac_register_clk(struct meson8b_dwmac *dwmac,
 
 	hw->init = &init;
 
-	return devm_clk_register(dev, hw);
+	return devm_clk_register(dwmac->dev, hw);
 }
 
 static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 {
 	int i, ret;
 	struct clk *clk;
-	struct device *dev = &dwmac->pdev->dev;
+	struct device *dev = dwmac->dev;
 	const char *parent_name, *mux_parent_names[MUX_CLK_NUM_PARENTS];
 
 	/* get the mux parents from DT */
@@ -204,19 +203,19 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 		 */
 		ret = clk_set_rate(dwmac->rgmii_tx_clk, 125 * 1000 * 1000);
 		if (ret) {
-			dev_err(&dwmac->pdev->dev,
+			dev_err(dwmac->dev,
 				"failed to set RGMII TX clock\n");
 			return ret;
 		}
 
 		ret = clk_prepare_enable(dwmac->rgmii_tx_clk);
 		if (ret) {
-			dev_err(&dwmac->pdev->dev,
+			dev_err(dwmac->dev,
 				"failed to enable the RGMII TX clock\n");
 			return ret;
 		}
 
-		devm_add_action_or_reset(&dwmac->pdev->dev,
+		devm_add_action_or_reset(dwmac->dev,
 					(void(*)(void *))clk_disable_unprepare,
 					dwmac->rgmii_tx_clk);
 		break;
@@ -238,7 +237,7 @@ static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 		break;
 
 	default:
-		dev_err(&dwmac->pdev->dev, "unsupported phy-mode %s\n",
+		dev_err(dwmac->dev, "unsupported phy-mode %s\n",
 			phy_modes(dwmac->phy_mode));
 		return -EINVAL;
 	}
@@ -279,7 +278,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 		goto err_remove_config_dt;
 	}
 
-	dwmac->pdev = pdev;
+	dwmac->dev = &pdev->dev;
 	dwmac->phy_mode = of_get_phy_mode(pdev->dev.of_node);
 	if (dwmac->phy_mode < 0) {
 		dev_err(&pdev->dev, "missing phy-mode property\n");
-- 
2.16.1
