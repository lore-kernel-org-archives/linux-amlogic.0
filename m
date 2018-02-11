From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 11 Feb 2018 22:15:17 +0100
Subject: [PATCH usb-next v2 3/3] usb: dwc3: of-simple: add support for the
 Amlogic Meson GXL and AXG SoCs
In-Reply-To: <20180211211517.5846-1-martin.blumenstingl@googlemail.com>
References: <20180211211517.5846-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180211211517.5846-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Amlogic Meson GXL and AXG SoCs come with a (host-only) dwc3 USB
controller. To use this controller a clock has to be enabled and a reset
line has to be pulsed.
Enabling the clock works identical to other SoCs. However, the reset
line has to be pulsed (using reset_control_reset) instead of using a
level reset (reset_control_{assert,deassert}).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index d2e4928c8d62..66cdc79017cf 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -93,6 +93,12 @@ static int dwc3_of_simple_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, simple);
 	simple->dev = dev;
 
+	if (of_device_is_compatible(np, "amlogic,meson-axg-dwc3") ||
+	    of_device_is_compatible(np, "amlogic,meson-gxl-dwc3")) {
+		shared_resets = true;
+		simple->pulse_resets = true;
+	}
+
 	simple->resets = of_reset_control_array_get(np, shared_resets, true);
 	if (IS_ERR(simple->resets)) {
 		ret = PTR_ERR(simple->resets);
@@ -206,6 +212,8 @@ static const struct of_device_id of_dwc3_simple_match[] = {
 	{ .compatible = "xlnx,zynqmp-dwc3" },
 	{ .compatible = "cavium,octeon-7130-usb-uctl" },
 	{ .compatible = "sprd,sc9860-dwc3" },
+	{ .compatible = "amlogic,meson-axg-dwc3" },
+	{ .compatible = "amlogic,meson-gxl-dwc3" },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
-- 
2.16.1
