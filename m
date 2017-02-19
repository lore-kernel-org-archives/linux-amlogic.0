From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sun, 19 Feb 2017 21:35:52 +0100
Subject: [PATCH 2/2] hwrng: meson: add clock handling to driver
In-Reply-To: <00b2a4cc-686e-0cc0-43e8-552b70a1e868@gmail.com>
References: <00b2a4cc-686e-0cc0-43e8-552b70a1e868@gmail.com>
Message-ID: <eff6bfbe-3257-5d74-35c7-226a29c61fcb@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add handling of RNG0 clock to the driver.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/char/hw_random/meson-rng.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
index 119d6984..1f586e48 100644
--- a/drivers/char/hw_random/meson-rng.c
+++ b/drivers/char/hw_random/meson-rng.c
@@ -62,6 +62,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 #include <linux/of.h>
+#include <linux/clk.h>
 
 #define RNG_DATA 0x00
 
@@ -69,6 +70,7 @@ struct meson_rng_data {
 	void __iomem *base;
 	struct platform_device *pdev;
 	struct hwrng rng;
+	struct clk *core_clk;
 };
 
 static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
@@ -86,6 +88,7 @@ static int meson_rng_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct meson_rng_data *data;
 	struct resource *res;
+	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -98,12 +101,33 @@ static int meson_rng_probe(struct platform_device *pdev)
 	if (IS_ERR(data->base))
 		return PTR_ERR(data->base);
 
+	data->core_clk = devm_clk_get(dev, "core");
+	if (IS_ERR(data->core_clk))
+		return PTR_ERR(data->core_clk);
+
+	ret = clk_prepare_enable(data->core_clk);
+	if (ret)
+		return ret;
+
 	data->rng.name = pdev->name;
 	data->rng.read = meson_rng_read;
 
 	platform_set_drvdata(pdev, data);
 
-	return devm_hwrng_register(dev, &data->rng);
+	ret = devm_hwrng_register(dev, &data->rng);
+	if (ret)
+		clk_disable_unprepare(data->core_clk);
+
+	return ret;
+}
+
+static int meson_rng_remove(struct platform_device *pdev)
+{
+	struct meson_rng_data *data = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(data->core_clk);
+
+	return 0;
 }
 
 static const struct of_device_id meson_rng_of_match[] = {
@@ -114,6 +138,7 @@ MODULE_DEVICE_TABLE(of, meson_rng_of_match);
 
 static struct platform_driver meson_rng_driver = {
 	.probe	= meson_rng_probe,
+	.remove	= meson_rng_remove,
 	.driver	= {
 		.name = "meson-rng",
 		.of_match_table = meson_rng_of_match,
-- 
2.11.1
