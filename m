From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Jan 2018 21:03:31 +0100
Subject: [PATCH 1/3] dt-bindings: usb: add support for dwc3 controller on
 Amlogic Meson GX
In-Reply-To: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
References: <20180128200333.20093-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180128200333.20093-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Amlogic Meson GX SoCs (GXL and AXG) come with a (host-only) dwc3 USB
controller. This requires a clock to be enabled and a reset line to be
pulsed to get the hardware into a known state.
Add the documentation for this IP block, similar to "qcom,dwc3.txt".

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/usb/amlogic,dwc3.txt       | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
new file mode 100644
index 000000000000..9a8b631904fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
@@ -0,0 +1,42 @@
+Amlogic Meson GX DWC3 USB SoC controller
+
+Required properties:
+- compatible:	depending on the SoC this should contain one of:
+			* amlogic,meson-axg-dwc3
+			* amlogic,meson-gxl-dwc3
+- clocks:	a handle for the "USB general" clock
+- clock-names:	must be "usb_general"
+- resets:	a handle for the shared "USB OTG" reset line
+- reset-names:	must be "usb_otg"
+
+Required child node:
+A child node must exist to represent the core DWC3 IP block. The name of
+the node is not important. The content of the node is defined in dwc3.txt.
+
+PHY documentation is provided in the following places:
+- Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
+- Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
+
+Example device nodes:
+		usb0: usb at ff500000 {
+			compatible = "amlogic,meson-axg-dwc3";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&clkc CLKID_USB>;
+			clock-names = "usb_general";
+			resets = <&reset RESET_USB_OTG>;
+			reset-names = "usb_otg";
+
+			dwc3: dwc3 at ff500000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff500000 0x0 0x100000>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				dr_mode = "host";
+				maximum-speed = "high-speed";
+				snps,dis_u2_susphy_quirk;
+				phys = <&usb3_phy>, <&usb2_phy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
-- 
2.16.1
