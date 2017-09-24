From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 24 Sep 2017 21:49:59 +0200
Subject: [PATCH 1/2] dt-bindings: phy: Add support for the USB3 PHY on Amlogic
 Meson GXL SoCs
In-Reply-To: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
References: <20170924195000.13276-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170924195000.13276-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Amlogic Meson GXL SoCs use a dwc3 controller with two (GXM - a variant
for GXL, has three) USB2 ports. The first USB2 port supports host and
peripheral (also called "device") mode.
While the dwc3 controller has no USB3 port enabled we still need the
USB3 PHY to be initialized, otherwise some boards (probably those where
the bootloader does not initialize the USB3 PHY) show errors with
high-speed USB devices connected to any of the USB2 ports.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt b/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
new file mode 100644
index 000000000000..2b7c3715d52d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
@@ -0,0 +1,19 @@
+* Amlogic Meson GXL and GXM USB3 PHY and OTG detection binding
+
+Required properties:
+- compatible:	Should be "amlogic,meson-gxl-usb3-phy"
+- reg:		The base address and length of the registers
+- #phys-cells:	must be 0 (see phy-bindings.txt in this directory)
+
+Optional properties:
+- interrupts:	the interrupt specifier for the OTG detection
+- phy-supply:	see phy-bindings.txt in this directory
+
+
+Example:
+	usb3_phy0: phy at 78080 {
+		compatible = "amlogic,meson-gxl-usb3-phy";
+		#phy-cells = <0>;
+		reg = <0x0 0x78080 0x0 0x20>;
+		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+	};
-- 
2.14.1
