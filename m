From: linus.luessing@c0d3.blue (=?UTF-8?q?Linus=20L=C3=BCssing?=)
Date: Tue, 26 Sep 2017 03:08:47 +0200
Subject: [RFC PATCH] ARM: meson: Add Ethernet for Odroid C1/C1+
In-Reply-To: <20170926010847.30219-1-linus.luessing@c0d3.blue>
References: <20170926010847.30219-1-linus.luessing@c0d3.blue>
Message-ID: <20170926010847.30219-2-linus.luessing@c0d3.blue>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch adds the necessary DT bindings to enable the
Realtek RTL8211F chip used in the Odroid C1/C1+.

---

Do not apply, this patch does not work yet!
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 26 ++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi         | 31 +++++++++++++++++++++++++++++--
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 9ff6ca4..071a568 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -77,6 +77,32 @@
 	pinctrl-names = "default";
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&eth_phy0>;
+	phy-mode = "rgmii";
+
+	snps,reset-gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+
+	amlogic,tx-delay-ns = <2>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy at 0 {
+			/* Realtek RTL8211F (0x001cc916) */
+			reg = <0>;
+			eee-broken-1000t;
+		};
+	};
+};
+
 &gpio_ao {
 	/*
 	 * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index b9b6600..259ef0f 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -184,6 +184,28 @@
 			#gpio-cells = <2>;
 			gpio-ranges = <&pinctrl_cbus 0 0 130>;
 		};
+
+		eth_rgmii_pins: eth-rgmii {
+			mux {
+				groups =
+					"eth_rxd1",
+					"eth_rxd0",
+					"eth_rx_clk",
+					"eth_rx_dv",
+					"eth_txd0_1",
+					"eth_txd1_1",
+					"eth_ref_clk",
+					"eth_tx_en",
+					"eth_mdio_en",
+					"eth_mdc",
+					"eth_txd1_0",
+					"eth_txd0_0",
+					"eth_txd3",
+					"eth_txd2",
+					"eth_tx_clk";
+				function = "ethernet";
+			};
+		};
 	};
 };
 
@@ -195,8 +217,13 @@
 };
 
 &ethmac {
-	clocks = <&clkc CLKID_ETH>;
-	clock-names = "stmmaceth";
+	compatible = "amlogic,meson8b-dwmac", "snps,dwmac";
+	reg = <0xc9410000 0x10000
+	       0xc1108140 0x4>;
+	clocks = <&clkc CLKID_ETH>,
+		 <&clkc CLKID_FCLK_DIV2>,
+		 <&clkc CLKID_MPLL2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1";
 };
 
 &hwrng {
-- 
2.1.4
