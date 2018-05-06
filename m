From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun,  6 May 2018 22:57:48 +0200
Subject: [PATCH 1/2] ARM: dts: meson8b: odroid-c1: sort nodes alphabetically
In-Reply-To: <20180506205749.18719-1-martin.blumenstingl@googlemail.com>
References: <20180506205749.18719-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180506205749.18719-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This makes it easier to find existing nodes. No functional changes.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 68 +++++++++++++-------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 3a5603d95b70..7d8ad468a25b 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -103,10 +103,34 @@
 	};
 };
 
-&uart_AO {
+&ethmac {
 	status = "okay";
-	pinctrl-0 = <&uart_ao_a_pins>;
+
+	snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 30000>;
+
+	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
+
+	phy-mode = "rgmii";
+	phy-handle = <&eth_phy>;
+	amlogic,tx-delay-ns = <4>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Realtek RTL8211F (0x001cc916) */
+		eth_phy: ethernet-phy at 0 {
+			reg = <0>;
+			eee-broken-1000t;
+			interrupt-parent = <&gpio_intc>;
+			/* GPIOH_3 */
+			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
 };
 
 &gpio_ao {
@@ -124,14 +148,6 @@
 	};
 };
 
-&usb1_phy {
-	status = "okay";
-};
-
-&usb1 {
-	status = "okay";
-};
-
 &sdio {
 	status = "okay";
 
@@ -158,32 +174,16 @@
 	};
 };
 
-&ethmac {
+&uart_AO {
 	status = "okay";
-
-	snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 10000 30000>;
-
-	pinctrl-0 = <&eth_rgmii_pins>;
+	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
+};
 
-	phy-mode = "rgmii";
-	phy-handle = <&eth_phy>;
-	amlogic,tx-delay-ns = <4>;
-
-	mdio {
-		compatible = "snps,dwmac-mdio";
-		#address-cells = <1>;
-		#size-cells = <0>;
+&usb1_phy {
+	status = "okay";
+};
 
-		/* Realtek RTL8211F (0x001cc916) */
-		eth_phy: ethernet-phy at 0 {
-			reg = <0>;
-			eee-broken-1000t;
-			interrupt-parent = <&gpio_intc>;
-			/* GPIOH_3 */
-			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
-		};
-	};
+&usb1 {
+	status = "okay";
 };
-- 
2.17.0
