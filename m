From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 20 Sep 2017 16:38:55 +0200
Subject: ARM: dts: meson: fixing USB support on Meson8b
Message-ID: <20170920143855.GA27243@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch fixes the Meson8b USB1 dts node, changing the IRQ type
from edge rising to level high.
This avoids errors like "usb 1-1-port1: cannot reset (err = -110)" on
Odroid-C1+ board.

The patch also improves the same node adding the description of the digital
and analog regulators found in DWC2 USB controller.

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index bc278da7df0d..3306bff3d44d 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -87,6 +87,22 @@
 		compatible = "arm,cortex-a5-scu";
 		reg = <0xc4300000 0x100>;
 	};
+
+	soc {
+		vusb_d: regulator-vusb_d {
+			compatible = "regulator-fixed";
+			regulator-name = "vusb_d";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		vusb_a: regulator-vusb_a {
+			compatible = "regulator-fixed";
+			regulator-name = "vusb_a";
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+	};
 }; /* end of / */
 
 &aobus {
@@ -214,6 +230,9 @@
 
 &usb1 {
 	compatible = "amlogic,meson8b-usb", "snps,dwc2";
+	interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+	vusb_d-supply = <&vusb_d>;
+	vusb_a-supply = <&vusb_a>;
 	clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
 	clock-names = "otg";
 };
-- 
2.14.1
