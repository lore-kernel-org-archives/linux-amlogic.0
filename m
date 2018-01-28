From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Jan 2018 21:03:32 +0100
Subject: [PATCH 2/3] usb: dwc3: of-simple: add support for shared and pulsed
 reset lines
In-Reply-To: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
References: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180128200333.20093-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Some SoCs (such as Amlogic Meson GXL for example) share the reset line
with other components (in case of the Meson GXL example there's a shared
reset line between the USB2 PHYs, USB3 PHYs and the dwc3 controller).
Additionally SoC implementations may prefer a reset pulse over level
resets.

Add an internal per-of_device_id struct which can be used to configure
whether the reset lines are shared and whether they use level or pulse
resets.

For now this falls back to the old defaults, which are:
- reset lines are exclusive
- level resets are being used

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 65 ++++++++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index 7ae0eefc7cc7..ceb9f0cd822a 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -22,11 +22,22 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
+/**
+ * struct dwc3_of_simple_params - hardware specific parameters
+ * @shared_resets: indicates that the resets are shared or exclusive
+ * @pulse_resets: use a reset pulse instead of level based resets
+ */
+struct dwc3_of_simple_params {
+	bool			shared_resets;
+	bool			pulse_resets;
+};
+
 struct dwc3_of_simple {
 	struct device		*dev;
 	struct clk		**clks;
 	int			num_clocks;
 	struct reset_control	*resets;
+	const struct dwc3_of_simple_params	*params;
 };
 
 static int dwc3_of_simple_clk_init(struct dwc3_of_simple *simple, int count)
@@ -90,17 +101,26 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, simple);
 	simple->dev = dev;
+	simple->params = of_device_get_match_data(dev);
 
-	simple->resets = of_reset_control_array_get_optional_exclusive(np);
+	simple->resets = of_reset_control_array_get(np,
+						simple->params->shared_resets,
+						true);
 	if (IS_ERR(simple->resets)) {
 		ret = PTR_ERR(simple->resets);
 		dev_err(dev, "failed to get device resets, err=%d\n", ret);
 		return ret;
 	}
 
-	ret = reset_control_deassert(simple->resets);
-	if (ret)
-		goto err_resetc_put;
+	if (simple->params->pulse_resets) {
+		ret = reset_control_reset(simple->resets);
+		if (ret)
+			goto err_resetc_put;
+	} else {
+		ret = reset_control_deassert(simple->resets);
+		if (ret)
+			goto err_resetc_put;
+	}
 
 	ret = dwc3_of_simple_clk_init(simple, of_count_phandle_with_args(np,
 						"clocks", "#clock-cells"));
@@ -124,7 +144,8 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	return 0;
 
 err_resetc_assert:
-	reset_control_assert(simple->resets);
+	if (!simple->params->pulse_resets)
+		reset_control_assert(simple->resets);
 
 err_resetc_put:
 	reset_control_put(simple->resets);
@@ -144,7 +165,9 @@ static int dwc3_of_simple_remove(struct platform_device *pdev)
 		clk_put(simple->clks[i]);
 	}
 
-	reset_control_assert(simple->resets);
+	if (!simple->params->pulse_resets)
+		reset_control_assert(simple->resets);
+
 	reset_control_put(simple->resets);
 
 	pm_runtime_put_sync(dev);
@@ -189,12 +212,32 @@ static const struct dev_pm_ops dwc3_of_simple_dev_pm_ops = {
 			dwc3_of_simple_runtime_resume, NULL)
 };
 
+static const struct dwc3_of_simple_params dwc3_of_simple_default_params = {
+	.shared_resets = false,
+	.pulse_resets = false,
+};
+
 static const struct of_device_id of_dwc3_simple_match[] = {
-	{ .compatible = "qcom,dwc3" },
-	{ .compatible = "rockchip,rk3399-dwc3" },
-	{ .compatible = "xlnx,zynqmp-dwc3" },
-	{ .compatible = "cavium,octeon-7130-usb-uctl" },
-	{ .compatible = "sprd,sc9860-dwc3" },
+	{
+		.compatible = "qcom,dwc3",
+		.data = &dwc3_of_simple_default_params
+	},
+	{
+		.compatible = "rockchip,rk3399-dwc3",
+		.data = &dwc3_of_simple_default_params
+	},
+	{
+		.compatible = "xlnx,zynqmp-dwc3",
+		.data = &dwc3_of_simple_default_params
+	},
+	{
+		.compatible = "cavium,octeon-7130-usb-uctl",
+		.data = &dwc3_of_simple_default_params
+	},
+	{
+		.compatible = "sprd,sc9860-dwc3",
+		.data = &dwc3_of_simple_default_params
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
-- 
2.16.1
