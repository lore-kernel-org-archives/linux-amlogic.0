From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 9 Mar 2017 07:37:44 +0100
Subject: [PATCH v2 02/10] i2c: meson: remove member irq from struct meson_i2c
In-Reply-To: <f39c9314-4314-3d98-aef2-3bc3c815e63b@gmail.com>
References: <f39c9314-4314-3d98-aef2-3bc3c815e63b@gmail.com>
Message-ID: <2c5301d4-1e55-06e9-b4b6-d477c818353f@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Member irq can be replaced with a local variable in probe
because it's nowhere else accessed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
---
v2:
- added Reviewed-by
---
 drivers/i2c/busses/i2c-meson.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 40e5da9a..50059d09 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -82,7 +82,6 @@ struct meson_i2c {
 	struct device		*dev;
 	void __iomem		*regs;
 	struct clk		*clk;
-	int			irq;
 
 	struct i2c_msg		*msg;
 	int			state;
@@ -391,7 +390,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	struct meson_i2c *i2c;
 	struct resource *mem;
-	int ret = 0;
+	int irq, ret = 0;
 
 	i2c = devm_kzalloc(&pdev->dev, sizeof(struct meson_i2c), GFP_KERNEL);
 	if (!i2c)
@@ -418,14 +417,14 @@ static int meson_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(i2c->regs))
 		return PTR_ERR(i2c->regs);
 
-	i2c->irq = platform_get_irq(pdev, 0);
-	if (i2c->irq < 0) {
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
 		dev_err(&pdev->dev, "can't find IRQ\n");
-		return i2c->irq;
+		return irq;
 	}
 
-	ret = devm_request_irq(&pdev->dev, i2c->irq, meson_i2c_irq,
-			       0, dev_name(&pdev->dev), i2c);
+	ret = devm_request_irq(&pdev->dev, irq, meson_i2c_irq, 0,
+			       dev_name(&pdev->dev), i2c);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "can't request IRQ\n");
 		return ret;
-- 
2.12.0
