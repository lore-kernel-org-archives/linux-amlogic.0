From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Jan 2018 21:03:33 +0100
Subject: [PATCH 3/3] usb: dwc3: of-simple: add support for the Amlogic Meson
 GXL and AXG SoCs
In-Reply-To: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
References: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180128200333.20093-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Amlogic Meson GXL and AXG SoCs come with a (host-only) dwc3 USB
controller. To use this controller a clock has to be enabled and a reset
line has to be pulsed.
Enabling the clock works identical to other SoCs. However, the reset
line has to be pulsed (using reset_control_reset) instead of using a
level reset (reset_control_{assert,deassert}).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/usb/dwc3/dwc3-of-simple.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-of-simple.c b/drivers/usb/dwc3/dwc3-of-simple.c
index ceb9f0cd822a..d9e4b8b09eaf 100644
--- a/drivers/usb/dwc3/dwc3-of-simple.c
+++ b/drivers/usb/dwc3/dwc3-of-simple.c
@@ -217,6 +217,11 @@ static const struct dwc3_of_simple_params dwc3_of_simple_default_params = {
 	.pulse_resets = false,
 };
 
+static const struct dwc3_of_simple_params dwc3_of_simple_amlogic_params = {
+	.shared_resets = true,
+	.pulse_resets = true,
+};
+
 static const struct of_device_id of_dwc3_simple_match[] = {
 	{
 		.compatible = "qcom,dwc3",
@@ -238,6 +243,14 @@ static const struct of_device_id of_dwc3_simple_match[] = {
 		.compatible = "sprd,sc9860-dwc3",
 		.data = &dwc3_of_simple_default_params
 	},
+	{
+		.compatible = "amlogic,meson-axg-dwc3",
+		.data = &dwc3_of_simple_amlogic_params
+	},
+	{
+		.compatible = "amlogic,meson-gxl-dwc3",
+		.data = &dwc3_of_simple_amlogic_params
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, of_dwc3_simple_match);
-- 
2.16.1
