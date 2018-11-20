From: ldevulder@suse.de (Loic Devulder)
Date: Wed, 21 Nov 2018 00:50:20 +0100
Subject: [PATCH v2 3/3] ARM: dts: meson: Update dts files from Linux v4.19
In-Reply-To: <20181120235020.14812-1-ldevulder@suse.de>
References: <20181120235020.14812-1-ldevulder@suse.de>
Message-ID: <20181120235020.14812-4-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch modifies Device Tree of meson boards.
    
The dts files are synchronized from Linux 4.19.

Signed-off-by: Loic Devulder <ldevulder@suse.de>
---
 arch/arm/dts/meson-gx.dtsi                    | 31 +++++++++++++----
 arch/arm/dts/meson-gxbb-nanopi-k2.dts         | 48 +++++++++++++++++++++++++++
 arch/arm/dts/meson-gxbb.dtsi                  | 14 ++++----
 arch/arm/dts/meson-gxl-mali.dtsi              |  2 +-
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts |  5 +--
 arch/arm/dts/meson-gxl-s905x-p212.dtsi        |  8 ++---
 arch/arm/dts/meson-gxl.dtsi                   | 26 ++++++---------
 arch/arm/dts/meson-gxm-khadas-vim2.dts        | 24 ++++++++++++++
 8 files changed, 121 insertions(+), 37 deletions(-)

diff --git a/arch/arm/dts/meson-gx.dtsi b/arch/arm/dts/meson-gx.dtsi
index 3c31e21cbe..f1e5cdbade 100644
--- a/arch/arm/dts/meson-gx.dtsi
+++ b/arch/arm/dts/meson-gx.dtsi
@@ -35,10 +35,16 @@
 			no-map;
 		};
 
+		/* Alternate 3 MiB reserved for ARM Trusted Firmware (BL31) */
+		secmon_reserved_alt: secmon at 5000000 {
+			reg = <0x0 0x05000000 0x0 0x300000>;
+			no-map;
+		};
+
 		linux,cma {
 			compatible = "shared-dma-pool";
 			reusable;
-			size = <0x0 0xbc00000>;
+			size = <0x0 0x10000000>;
 			alignment = <0x0 0x400000>;
 			linux,cma-default;
 		};
@@ -338,7 +344,7 @@
 			ranges = <0x0 0x0 0x0 0xc8100000 0x0 0x100000>;
 
 			sysctrl_AO: sys-ctrl at 0 {
-				compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
+				compatible = "amlogic,meson-gx-ao-sysctrl", "simple-mfd", "syscon";
 				reg =  <0x0 0x0 0x0 0x100>;
 
 				pwrc_vpu: power-controller-vpu {
@@ -417,6 +423,19 @@
 			};
 		};
 
+		dmcbus: bus at c8838000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xc8838000 0x0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xc8838000 0x0 0x400>;
+
+			canvas: video-lut at 48 {
+				compatible = "amlogic,canvas";
+				reg = <0x0 0x48 0x0 0x14>;
+			};
+		};
+
 		hiubus: bus at c883c000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc883c000 0x0 0x2000>;
@@ -425,7 +444,7 @@
 			ranges = <0x0 0x0 0x0 0xc883c000 0x0 0x2000>;
 
 			sysctrl: system-controller at 0 {
-				compatible = "amlogic,meson-gx-hhi-sysctrl", "syscon", "simple-mfd";
+				compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
 				reg = <0 0 0 0x400>;
 			};
 
@@ -457,21 +476,21 @@
 
 			sd_emmc_a: mmc at 70000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
-				reg = <0x0 0x70000 0x0 0x2000>;
+				reg = <0x0 0x70000 0x0 0x800>;
 				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			sd_emmc_b: mmc at 72000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
-				reg = <0x0 0x72000 0x0 0x2000>;
+				reg = <0x0 0x72000 0x0 0x800>;
 				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			sd_emmc_c: mmc at 74000 {
 				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
-				reg = <0x0 0x74000 0x0 0x2000>;
+				reg = <0x0 0x74000 0x0 0x800>;
 				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
diff --git a/arch/arm/dts/meson-gxbb-nanopi-k2.dts b/arch/arm/dts/meson-gxbb-nanopi-k2.dts
index 7d5709c37e..cbe99bd4e0 100644
--- a/arch/arm/dts/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm/dts/meson-gxbb-nanopi-k2.dts
@@ -106,6 +106,42 @@
 		compatible = "mmc-pwrseq-emmc";
 		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
 	};
+
+	/* CVBS is available on CON1 pin 36, disabled by default */
+	cvbs-connector {
+		compatible = "composite-video-connector";
+		status = "disabled";
+
+		port {
+			cvbs_connector_in: endpoint {
+				remote-endpoint = <&cvbs_vdac_out>;
+			};
+		};
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_tmds_out>;
+			};
+		};
+	};
+};
+
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
 };
 
 &ethmac {
@@ -137,6 +173,18 @@
 	};
 };
 
+&hdmi_tx {
+	status = "okay";
+	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
+	pinctrl-names = "default";
+};
+
+&hdmi_tx_tmds_port {
+	hdmi_tx_tmds_out: endpoint {
+		remote-endpoint = <&hdmi_connector_in>;
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
diff --git a/arch/arm/dts/meson-gxbb.dtsi b/arch/arm/dts/meson-gxbb.dtsi
index 562c26a0ba..1ade7e4868 100644
--- a/arch/arm/dts/meson-gxbb.dtsi
+++ b/arch/arm/dts/meson-gxbb.dtsi
@@ -307,11 +307,10 @@
 	clock-names = "isfr", "iahb", "venci";
 };
 
-&hiubus {
-	clkc: clock-controller at 0 {
+&sysctrl {
+	clkc: clock-controller {
 		compatible = "amlogic,gxbb-clkc";
 		#clock-cells = <1>;
-		reg = <0x0 0x0 0x0 0x3db>;
 	};
 };
 
@@ -391,7 +390,7 @@
 			};
 		};
 
-		spi_pins: spi {
+		spi_pins: spi-pins {
 			mux {
 				groups = "spi_miso",
 					"spi_mosi",
@@ -716,6 +715,7 @@
 		 <&clkc CLKID_SD_EMMC_A_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
+	resets = <&reset RESET_SD_EMMC_A>;
 };
 
 &sd_emmc_b {
@@ -723,6 +723,7 @@
 		 <&clkc CLKID_SD_EMMC_B_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
+	resets = <&reset RESET_SD_EMMC_B>;
 };
 
 &sd_emmc_c {
@@ -730,6 +731,7 @@
 		 <&clkc CLKID_SD_EMMC_C_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
+	resets = <&reset RESET_SD_EMMC_C>;
 };
 
 &spicc {
@@ -749,12 +751,12 @@
 };
 
 &uart_AO {
-	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
+	clocks = <&xtal>, <&clkc_AO CLKID_AO_UART1>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_AO_B {
-	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
+	clocks = <&xtal>, <&clkc_AO CLKID_AO_UART2>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
 
diff --git a/arch/arm/dts/meson-gxl-mali.dtsi b/arch/arm/dts/meson-gxl-mali.dtsi
index eb327664a4..6aaafff674 100644
--- a/arch/arm/dts/meson-gxl-mali.dtsi
+++ b/arch/arm/dts/meson-gxl-mali.dtsi
@@ -6,7 +6,7 @@
 
 &apb {
 	mali: gpu at c0000 {
-		compatible = "amlogic,meson-gxbb-mali", "arm,mali-450";
+		compatible = "amlogic,meson-gxl-mali", "arm,mali-450";
 		reg = <0x0 0xc0000 0x0 0x40000>;
 		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts b/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
index 3e3eb31748..90a56af967 100644
--- a/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
@@ -13,7 +13,7 @@
 
 / {
 	compatible = "libretech,cc", "amlogic,s905x", "amlogic,meson-gxl";
-	model = "Libre Technology CC";
+	model = "Libre Computer Board AML-S905X-CC";
 
 	aliases {
 		serial0 = &uart_AO;
@@ -234,9 +234,6 @@
 
 	bus-width = <4>;
 	cap-sd-highspeed;
-	sd-uhs-sdr12;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
 	max-frequency = <100000000>;
 	disable-wp;
 
diff --git a/arch/arm/dts/meson-gxl-s905x-p212.dtsi b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
index 3bd405079b..a1b31013ab 100644
--- a/arch/arm/dts/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
@@ -191,8 +191,8 @@
 };
 
 &usb2_phy0 {
-        /*
-         * HDMI_5V is also used as supply for the USB VBUS.
-         */
-        phy-supply = <&hdmi_5v>;
+	/*
+	 * HDMI_5V is also used as supply for the USB VBUS.
+	 */
+	phy-supply = <&hdmi_5v>;
 };
diff --git a/arch/arm/dts/meson-gxl.dtsi b/arch/arm/dts/meson-gxl.dtsi
index dba365ed4b..8f0bb3c44b 100644
--- a/arch/arm/dts/meson-gxl.dtsi
+++ b/arch/arm/dts/meson-gxl.dtsi
@@ -13,14 +13,6 @@
 / {
 	compatible = "amlogic,meson-gxl";
 
-	reserved-memory {
-		/* Alternate 3 MiB reserved for ARM Trusted Firmware (BL31) */
-		secmon_reserved_alt: secmon at 5000000 {
-			reg = <0x0 0x05000000 0x0 0x300000>;
-			no-map;
-		};
-	};
-
 	soc {
 		usb0: usb at c9000000 {
 			status = "disabled";
@@ -267,11 +259,10 @@
 	clock-names = "isfr", "iahb", "venci";
 };
 
-&hiubus {
-	clkc: clock-controller at 0 {
-		compatible = "amlogic,gxl-clkc", "amlogic,gxbb-clkc";
+&sysctrl {
+	clkc: clock-controller {
+		compatible = "amlogic,gxl-clkc";
 		#clock-cells = <1>;
-		reg = <0x0 0x0 0x0 0x3db>;
 	};
 };
 
@@ -346,7 +337,7 @@
 			};
 		};
 
-		spi_pins: spi {
+		spi_pins: spi-pins {
 			mux {
 				groups = "spi_miso",
 					"spi_mosi",
@@ -725,13 +716,15 @@
 		 <&clkc CLKID_SD_EMMC_A_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
+	resets = <&reset RESET_SD_EMMC_A>;
 };
 
 &sd_emmc_b {
 	clocks = <&clkc CLKID_SD_EMMC_B>,
 		 <&clkc CLKID_SD_EMMC_B_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
-       clock-names = "core", "clkin0", "clkin1";
+	clock-names = "core", "clkin0", "clkin1";
+	resets = <&reset RESET_SD_EMMC_B>;
 };
 
 &sd_emmc_c {
@@ -739,6 +732,7 @@
 		 <&clkc CLKID_SD_EMMC_C_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
+	resets = <&reset RESET_SD_EMMC_C>;
 };
 
 &spicc {
@@ -758,12 +752,12 @@
 };
 
 &uart_AO {
-	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
+	clocks = <&xtal>, <&clkc_AO CLKID_AO_UART1>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_AO_B {
-	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
+	clocks = <&xtal>, <&clkc_AO CLKID_AO_UART2>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
 
diff --git a/arch/arm/dts/meson-gxm-khadas-vim2.dts b/arch/arm/dts/meson-gxm-khadas-vim2.dts
index 0868da476e..313f88f875 100644
--- a/arch/arm/dts/meson-gxm-khadas-vim2.dts
+++ b/arch/arm/dts/meson-gxm-khadas-vim2.dts
@@ -209,10 +209,34 @@
 	#cooling-cells = <2>;
 };
 
+&cpu1 {
+	#cooling-cells = <2>;
+};
+
+&cpu2 {
+	#cooling-cells = <2>;
+};
+
+&cpu3 {
+	#cooling-cells = <2>;
+};
+
 &cpu4 {
 	#cooling-cells = <2>;
 };
 
+&cpu5 {
+	#cooling-cells = <2>;
+};
+
+&cpu6 {
+	#cooling-cells = <2>;
+};
+
+&cpu7 {
+	#cooling-cells = <2>;
+};
+
 &ethmac {
 	pinctrl-0 = <&eth_pins>;
 	pinctrl-names = "default";
-- 
2.16.4
