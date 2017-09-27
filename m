From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 27 Sep 2017 12:41:17 +0200
Subject: [PATCH 3/4] ARM: dts: meson8b-odroidc1: enabling ethernet support
In-Reply-To: <cover.1506507688.git.ingrassia@epigenesys.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
Message-ID: <c298d8fe0c887c21b427f715825e90037e4ab7f8.1506507688.git.ingrassia@epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds ethernet PHY description and enables ethernet
support on Odroid-C1/C1+ boards.

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 9ff6ca4e20d0..6ac357ee3de6 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -54,6 +54,7 @@
 
 	aliases {
 		serial0 = &uart_AO;
+		ethernet = &ethmac;
 	};
 
 	memory {
@@ -77,6 +78,35 @@
 	pinctrl-names = "default";
 };
 
+&ethmac {
+	status = "okay";
+
+	snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
+	snps,reset-active-low;
+	snps,reset-delays-us = <0 10000 30000>;
+
+	pinctrl-0 = <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+
+	phy-mode = "rgmii";
+	phy-handle = <&eth_phy>;
+	amlogic,tx-delay-ns = <2>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy: ethernet-phy at 0 {
+			/* ethernet PHY RTL8211F */
+			compatible = "ethernet-phy-id001c.c916",
+				     "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			max-speed = <1000>;
+		};
+	};
+};
+
 &gpio_ao {
 	/*
 	 * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
-- 
2.14.1
