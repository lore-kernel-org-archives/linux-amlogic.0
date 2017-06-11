From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 11 Jun 2017 12:16:42 +0200
Subject: [PATCH 11/13] ARM: dts: meson: add USB support on Meson8 and Meson8b
In-Reply-To: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170611101644.28581-12-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds the DWC2 USB controller nodes and the corresponding USB2 PHY
nodes to meson.dtsi (as the same - or at least a very similar) IP block
is used on all SoCs (at the same physical address).
Additionally meson8.dtsi and meson8b.dtsi add the required clocks to the
DWC2 and USB2 PHY nodes, otherwise the DWC2 controller cannot be
initialized by the dwc2 driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi   | 38 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8.dtsi  | 24 ++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 26 ++++++++++++++++++++++++++
 3 files changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index a210084398dc..1a7a72005954 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -130,6 +130,20 @@
 				status = "disabled";
 			};
 
+			usb0_phy: phy at 8800 {
+				compatible = "amlogic,meson-mx-usb2-phy";
+				#phy-cells = <0>;
+				reg = <0x8800 0x20>;
+				status = "disabled";
+			};
+
+			usb1_phy: phy at 8820 {
+				compatible = "amlogic,meson-mx-usb2-phy";
+				#phy-cells = <0>;
+				reg = <0x8820 0x20>;
+				status = "disabled";
+			};
+
 			spifc: spi at 8c80 {
 				compatible = "amlogic,meson6-spifc";
 				reg = <0x8c80 0x80>;
@@ -182,6 +196,30 @@
 			};
 		};
 
+		usb0: usb at c9040000 {
+			compatible = "snps,dwc2";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xc9040000 0x40000>;
+			interrupts = <0 30 1>;
+			phys = <&usb0_phy>;
+			phy-names = "usb2-phy";
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb1: usb at c90c0000 {
+			compatible = "snps,dwc2";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0xc90c0000 0x40000>;
+			interrupts = <0 31 1>;
+			phys = <&usb1_phy>;
+			phy-names = "usb2-phy";
+			dr_mode = "host";
+			status = "disabled";
+		};
+
 		ethmac: ethernet at c9410000 {
 			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
 			reg = <0xc9410000 0x10000
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index a80181ddd416..7bfce6d8d0af 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -291,3 +291,27 @@
 &uart_C {
 	clocks = <&clkc CLKID_CLK81>;
 };
+
+&usb0 {
+	compatible = "amlogic,meson8-usb", "snps,dwc2";
+	clocks = <&clkc CLKID_USB0_DDR_BRIDGE>;
+	clock-names = "otg";
+};
+
+&usb1 {
+	compatible = "amlogic,meson8-usb", "snps,dwc2";
+	clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
+	clock-names = "otg";
+};
+
+&usb0_phy {
+	compatible = "amlogic,meson8-usb2-phy", "amlogic,meson-mx-usb2-phy";
+	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
+	clock-names = "usb_general", "usb";
+};
+
+&usb1_phy {
+	compatible = "amlogic,meson8-usb2-phy", "amlogic,meson-mx-usb2-phy";
+	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
+	clock-names = "usb_general", "usb";
+};
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 52aa3f68a6bd..aa4664713b66 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -205,3 +205,29 @@
 &uart_C {
 	clocks = <&clkc CLKID_CLK81>;
 };
+
+&usb0 {
+	compatible = "amlogic,meson8b-usb", "snps,dwc2";
+	clocks = <&clkc CLKID_USB0_DDR_BRIDGE>;
+	clock-names = "otg";
+};
+
+&usb1 {
+	compatible = "amlogic,meson8b-usb", "snps,dwc2";
+	clocks = <&clkc CLKID_USB1_DDR_BRIDGE>;
+	clock-names = "otg";
+};
+
+&usb0_phy {
+	compatible = "amlogic,meson8b-usb2-phy", "amlogic,meson-mx-usb2-phy";
+	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
+	clock-names = "usb_general", "usb";
+	resets = <&reset RESET_USB_OTG>;
+};
+
+&usb1_phy {
+	compatible = "amlogic,meson8b-usb2-phy", "amlogic,meson-mx-usb2-phy";
+	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
+	clock-names = "usb_general", "usb";
+	resets = <&reset RESET_USB_OTG>;
+};
-- 
2.13.1
