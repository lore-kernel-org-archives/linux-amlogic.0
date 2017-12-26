From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 26 Dec 2017 12:50:41 +0100
Subject: [PATCH] reset: meson: enable level reset support on Meson8b
Message-ID: <20171226115041.4786-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Commit a5a10afe04ef ("reset: meson: add level reset support for GX SoC
family") only enabled the level resets for the newer GX SoC family.
However, the older 32-Meson SoCs (Meson8, Meson8b and Meson8m2) also
support level resets using the same offset as the newer GX SoCs.

This removes the separation between Meson8b and the GX SoCs from the
reset-meson driver to enable the level resets also on Meson8b.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/reset/reset-meson.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index 93cbee1ae8ef..5242e0679df7 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -124,29 +124,21 @@ static int meson_reset_deassert(struct reset_controller_dev *rcdev,
 	return meson_reset_level(rcdev, id, false);
 }
 
-static const struct reset_control_ops meson_reset_meson8_ops = {
-	.reset		= meson_reset_reset,
-};
-
-static const struct reset_control_ops meson_reset_gx_ops = {
+static const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
 	.deassert	= meson_reset_deassert,
 };
 
 static const struct of_device_id meson_reset_dt_ids[] = {
-	 { .compatible = "amlogic,meson8b-reset",
-	   .data = &meson_reset_meson8_ops, },
-	 { .compatible = "amlogic,meson-gxbb-reset",
-	   .data = &meson_reset_gx_ops, },
-	 { .compatible = "amlogic,meson-axg-reset",
-	   .data = &meson_reset_gx_ops, },
+	 { .compatible = "amlogic,meson8b-reset" },
+	 { .compatible = "amlogic,meson-gxbb-reset" },
+	 { .compatible = "amlogic,meson-axg-reset" },
 	 { /* sentinel */ },
 };
 
 static int meson_reset_probe(struct platform_device *pdev)
 {
-	const struct reset_control_ops *ops;
 	struct meson_reset *data;
 	struct resource *res;
 
@@ -154,10 +146,6 @@ static int meson_reset_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	ops = of_device_get_match_data(&pdev->dev);
-	if (!ops)
-		return -EINVAL;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	data->reg_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(data->reg_base))
@@ -169,7 +157,7 @@ static int meson_reset_probe(struct platform_device *pdev)
 
 	data->rcdev.owner = THIS_MODULE;
 	data->rcdev.nr_resets = REG_COUNT * BITS_PER_REG;
-	data->rcdev.ops = ops;
+	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = pdev->dev.of_node;
 
 	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
-- 
2.15.1
