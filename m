From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 11 Apr 2018 17:40:40 +0200
Subject: [PATCH u-boot 1/2] ARM64: meson: Sync DT and Bindings with Linux 4.16
In-Reply-To: <1523461241-30436-1-git-send-email-narmstrong@baylibre.com>
References: <1523461241-30436-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1523461241-30436-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Synchronize the Linux Device Tree for Amlogic Meson GX boards from Linux 4.16.0.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/dts/meson-gx.dtsi                    |  87 ++++++++++-----
 arch/arm/dts/meson-gxbb-odroidc2.dts          |  56 ++++++++--
 arch/arm/dts/meson-gxbb.dtsi                  | 137 ++++++++++++++++++++++--
 arch/arm/dts/meson-gxl-s905x-khadas-vim.dts   |  63 +++++++++++
 arch/arm/dts/meson-gxl-s905x-libretech-cc.dts | 108 ++++++++++++++++++-
 arch/arm/dts/meson-gxl-s905x-p212.dts         |   7 ++
 arch/arm/dts/meson-gxl-s905x-p212.dtsi        |  24 ++++-
 arch/arm/dts/meson-gxl.dtsi                   | 147 ++++++++++++++++++++++++--
 include/dt-bindings/clock/gxbb-aoclkc.h       |   1 +
 include/dt-bindings/clock/gxbb-clkc.h         |  75 +++++++++++++
 include/dt-bindings/gpio/meson-gxbb-gpio.h    |   2 +-
 include/dt-bindings/gpio/meson-gxl-gpio.h     |   2 +-
 12 files changed, 645 insertions(+), 64 deletions(-)

diff --git a/arch/arm/dts/meson-gx.dtsi b/arch/arm/dts/meson-gx.dtsi
index 738ed68..4ee2e79 100644
--- a/arch/arm/dts/meson-gx.dtsi
+++ b/arch/arm/dts/meson-gx.dtsi
@@ -211,32 +211,39 @@
 		#size-cells = <2>;
 		ranges;
 
-		cbus: cbus at c1100000 {
+		cbus: bus at c1100000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc1100000 0x0 0x100000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc1100000 0x0 0x100000>;
 
+			gpio_intc: interrupt-controller at 9880 {
+				compatible = "amlogic,meson-gpio-intc";
+				reg = <0x0 0x9880 0x0 0x10>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
+				status = "disabled";
+			};
+
 			reset: reset-controller at 4404 {
 				compatible = "amlogic,meson-gx-reset", "amlogic,meson-gxbb-reset";
-				reg = <0x0 0x04404 0x0 0x20>;
+				reg = <0x0 0x04404 0x0 0x9c>;
 				#reset-cells = <1>;
 			};
 
 			uart_A: serial at 84c0 {
-				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x84c0 0x0 0x14>;
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x84c0 0x0 0x18>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>;
 				status = "disabled";
 			};
 
 			uart_B: serial at 84dc {
-				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x84dc 0x0 0x14>;
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x84dc 0x0 0x18>;
 				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>;
 				status = "disabled";
 			};
 
@@ -279,10 +286,9 @@
 			};
 
 			uart_C: serial at 8700 {
-				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x8700 0x0 0x14>;
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x8700 0x0 0x18>;
 				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>;
 				status = "disabled";
 			};
 
@@ -360,33 +366,53 @@
 			};
 		};
 
-		aobus: aobus at c8100000 {
+		aobus: bus at c8100000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc8100000 0x0 0x100000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc8100000 0x0 0x100000>;
 
-			clkc_AO: clock-controller at 040 {
-				compatible = "amlogic,gx-aoclkc", "amlogic,gxbb-aoclkc";
-				reg = <0x0 0x00040 0x0 0x4>;
-				#clock-cells = <1>;
-				#reset-cells = <1>;
+			sysctrl_AO: sys-ctrl at 0 {
+				compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
+				reg =  <0x0 0x0 0x0 0x100>;
+
+				pwrc_vpu: power-controller-vpu {
+					compatible = "amlogic,meson-gx-pwrc-vpu";
+					#power-domain-cells = <0>;
+					amlogic,hhi-sysctrl = <&sysctrl>;
+				};
+
+				clkc_AO: clock-controller {
+					compatible = "amlogic,meson-gx-aoclkc";
+					#clock-cells = <1>;
+					#reset-cells = <1>;
+				};
+			};
+
+			cec_AO: cec at 100 {
+				compatible = "amlogic,meson-gx-ao-cec";
+				reg = <0x0 0x00100 0x0 0x14>;
+				interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
+			};
+
+			sec_AO: ao-secure at 140 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
+				reg = <0x0 0x140 0x0 0x140>;
+				amlogic,has-chip-id;
 			};
 
 			uart_AO: serial at 4c0 {
-				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x004c0 0x0 0x14>;
+				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
+				reg = <0x0 0x004c0 0x0 0x18>;
 				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>;
 				status = "disabled";
 			};
 
 			uart_AO_B: serial at 4e0 {
-				compatible = "amlogic,meson-uart";
-				reg = <0x0 0x004e0 0x0 0x14>;
+				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
+				reg = <0x0 0x004e0 0x0 0x18>;
 				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>;
 				status = "disabled";
 			};
 
@@ -427,19 +453,24 @@
 			};
 		};
 
-		hiubus: hiubus at c883c000 {
+		hiubus: bus at c883c000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc883c000 0x0 0x2000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc883c000 0x0 0x2000>;
 
+			sysctrl: system-controller at 0 {
+				compatible = "amlogic,meson-gx-hhi-sysctrl", "syscon", "simple-mfd";
+				reg = <0 0 0 0x400>;
+			};
+
 			mailbox: mailbox at 404 {
 				compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
 				reg = <0 0x404 0 0x4c>;
-				interrupts = <0 208 IRQ_TYPE_EDGE_RISING>,
-					     <0 209 IRQ_TYPE_EDGE_RISING>,
-					     <0 210 IRQ_TYPE_EDGE_RISING>;
+				interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
+					     <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>;
 				#mbox-cells = <1>;
 			};
 		};
@@ -448,7 +479,7 @@
 			compatible = "amlogic,meson-gx-dwmac", "amlogic,meson-gxbb-dwmac", "snps,dwmac";
 			reg = <0x0 0xc9410000 0x0 0x10000
 			       0x0 0xc8834540 0x0 0x4>;
-			interrupts = <0 8 1>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "macirq";
 			status = "disabled";
 		};
diff --git a/arch/arm/dts/meson-gxbb-odroidc2.dts b/arch/arm/dts/meson-gxbb-odroidc2.dts
index d147c85..ee4ada6 100644
--- a/arch/arm/dts/meson-gxbb-odroidc2.dts
+++ b/arch/arm/dts/meson-gxbb-odroidc2.dts
@@ -50,7 +50,7 @@
 / {
 	compatible = "hardkernel,odroid-c2", "amlogic,meson-gxbb";
 	model = "Hardkernel ODROID-C2";
-	
+
 	aliases {
 		serial0 = &uart_AO;
 	};
@@ -135,6 +135,24 @@
 		compatible = "mmc-pwrseq-emmc";
 		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
 	};
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
 };
 
 &ethmac {
@@ -156,7 +174,11 @@
 		#size-cells = <0>;
 
 		eth_phy0: ethernet-phy at 0 {
+			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
+			interrupt-parent = <&gpio_intc>;
+			/* MAC_INTR on GPIOZ_15 */
+			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 			eee-broken-1000t;
 		};
 	};
@@ -177,6 +199,18 @@
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
 &i2c_A {
 	status = "okay";
 	pinctrl-0 = <&i2c_a_pins>;
@@ -194,7 +228,9 @@
 			  "USB HUB nRESET", "USB OTG Power En",
 			  "J7 Header Pin2", "IR In", "J7 Header Pin4",
 			  "J7 Header Pin6", "J7 Header Pin5", "J7 Header Pin7",
-			  "HDMI CEC", "SYS LED";
+			  "HDMI CEC", "SYS LED",
+			  /* GPIO_TEST_N */
+			  "";
 };
 
 &pinctrl_periphs {
@@ -233,11 +269,9 @@
 			  "J2 Header Pin12", "J2 Header Pin13",
 			  "J2 Header Pin8", "J2 Header Pin10",
 			  "", "", "", "", "",
-			  "J2 Header Pin11", "", "J2 Header Pin7",
+			  "J2 Header Pin11", "", "J2 Header Pin7", "",
 			  /* Bank GPIOCLK */
-			  "", "", "", "",
-			  /* GPIO_TEST_N */
-			  "";
+			  "", "", "", "";
 };
 
 &saradc {
@@ -253,7 +287,8 @@
 &sd_emmc_b {
 	status = "okay";
 	pinctrl-0 = <&sdcard_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <4>;
 	cap-sd-highspeed;
@@ -270,11 +305,11 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>;
-	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
-	cap-sd-highspeed;
 	max-frequency = <200000000>;
 	non-removable;
 	disable-wp;
@@ -300,6 +335,7 @@
 
 &usb1_phy {
 	status = "okay";
+	phy-supply = <&usb_otg_pwr>;
 };
 
 &usb0 {
diff --git a/arch/arm/dts/meson-gxbb.dtsi b/arch/arm/dts/meson-gxbb.dtsi
index 17d3efd..3290a4d 100644
--- a/arch/arm/dts/meson-gxbb.dtsi
+++ b/arch/arm/dts/meson-gxbb.dtsi
@@ -307,6 +307,15 @@
 	};
 };
 
+&cec_AO {
+	clocks = <&clkc_AO CLKID_AO_CEC_32K>;
+	clock-names = "core";
+};
+
+&clkc_AO {
+	compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
+};
+
 &ethmac {
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_FCLK_DIV2>,
@@ -314,6 +323,12 @@
 	clock-names = "stmmaceth", "clkin0", "clkin1";
 };
 
+&gpio_intc {
+	compatible = "amlogic,meson-gpio-intc",
+		     "amlogic,meson-gxbb-gpio-intc";
+	status = "okay";
+};
+
 &hdmi_tx {
 	compatible = "amlogic,meson-gxbb-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
 	resets = <&reset RESET_HDMITX_CAPB3>,
@@ -370,19 +385,36 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_periphs 0 14 120>;
+			gpio-ranges = <&pinctrl_periphs 0 0 119>;
 		};
 
 		emmc_pins: emmc {
 			mux {
 				groups = "emmc_nand_d07",
 				       "emmc_cmd",
-				       "emmc_clk",
-				       "emmc_ds";
+				       "emmc_clk";
+				function = "emmc";
+			};
+		};
+
+		emmc_ds_pins: emmc-ds {
+			mux {
+				groups = "emmc_ds";
 				function = "emmc";
 			};
 		};
 
+		emmc_clk_gate_pins: emmc_clk_gate {
+			mux {
+				groups = "BOOT_8";
+				function = "gpio_periphs";
+			};
+			cfg-pull-down {
+				pins = "BOOT_8";
+				bias-pull-down;
+			};
+		};
+
 		nor_pins: nor {
 			mux {
 				groups = "nor_d",
@@ -421,6 +453,17 @@
 			};
 		};
 
+		sdcard_clk_gate_pins: sdcard_clk_gate {
+			mux {
+				groups = "CARD_2";
+				function = "gpio_periphs";
+			};
+			cfg-pull-down {
+				pins = "CARD_2";
+				bias-pull-down;
+			};
+		};
+
 		sdio_pins: sdio {
 			mux {
 				groups = "sdio_d0",
@@ -433,6 +476,17 @@
 			};
 		};
 
+		sdio_clk_gate_pins: sdio_clk_gate {
+			mux {
+				groups = "GPIOX_4";
+				function = "gpio_periphs";
+			};
+			cfg-pull-down {
+				pins = "GPIOX_4";
+				bias-pull-down;
+			};
+		};
+
 		sdio_irq_pins: sdio_irq {
 			mux {
 				groups = "sdio_irq";
@@ -640,33 +694,74 @@
 	};
 };
 
+&pwrc_vpu {
+	resets = <&reset RESET_VIU>,
+		 <&reset RESET_VENC>,
+		 <&reset RESET_VCBUS>,
+		 <&reset RESET_BT656>,
+		 <&reset RESET_DVIN_RESET>,
+		 <&reset RESET_RDMA>,
+		 <&reset RESET_VENCI>,
+		 <&reset RESET_VENCP>,
+		 <&reset RESET_VDAC>,
+		 <&reset RESET_VDI6>,
+		 <&reset RESET_VENCL>,
+		 <&reset RESET_VID_LOCK>;
+	clocks = <&clkc CLKID_VPU>,
+	         <&clkc CLKID_VAPB>;
+	clock-names = "vpu", "vapb";
+	/*
+	 * VPU clocking is provided by two identical clock paths
+	 * VPU_0 and VPU_1 muxed to a single clock by a glitch
+	 * free mux to safely change frequency while running.
+	 * Same for VAPB but with a final gate after the glitch free mux.
+	 */
+	assigned-clocks = <&clkc CLKID_VPU_0_SEL>,
+			  <&clkc CLKID_VPU_0>,
+			  <&clkc CLKID_VPU>, /* Glitch free mux */
+			  <&clkc CLKID_VAPB_0_SEL>,
+			  <&clkc CLKID_VAPB_0>,
+			  <&clkc CLKID_VAPB_SEL>; /* Glitch free mux */
+	assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
+				 <0>, /* Do Nothing */
+				 <&clkc CLKID_VPU_0>,
+				 <&clkc CLKID_FCLK_DIV4>,
+				 <0>, /* Do Nothing */
+				 <&clkc CLKID_VAPB_0>;
+	assigned-clock-rates = <0>, /* Do Nothing */
+			       <666666666>,
+			       <0>, /* Do Nothing */
+			       <0>, /* Do Nothing */
+			       <250000000>,
+			       <0>; /* Do Nothing */
+};
+
 &saradc {
 	compatible = "amlogic,meson-gxbb-saradc", "amlogic,meson-saradc";
 	clocks = <&xtal>,
 		 <&clkc CLKID_SAR_ADC>,
-		 <&clkc CLKID_SANA>,
 		 <&clkc CLKID_SAR_ADC_CLK>,
 		 <&clkc CLKID_SAR_ADC_SEL>;
-	clock-names = "clkin", "core", "sana", "adc_clk", "adc_sel";
+	clock-names = "clkin", "core", "adc_clk", "adc_sel";
 };
 
 &sd_emmc_a {
 	clocks = <&clkc CLKID_SD_EMMC_A>,
-		 <&xtal>,
+		 <&clkc CLKID_SD_EMMC_A_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 };
 
 &sd_emmc_b {
 	clocks = <&clkc CLKID_SD_EMMC_B>,
-		 <&xtal>,
+		 <&clkc CLKID_SD_EMMC_B_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 };
 
 &sd_emmc_c {
 	clocks = <&clkc CLKID_SD_EMMC_C>,
-		 <&xtal>,
+		 <&clkc CLKID_SD_EMMC_C_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 };
@@ -682,6 +777,32 @@
 	clocks = <&clkc CLKID_SPI>;
 };
 
+&uart_A {
+	clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
+&uart_AO {
+	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
+&uart_AO_B {
+	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
+&uart_B {
+	clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
+&uart_C {
+	clocks = <&xtal>, <&clkc CLKID_UART2>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
 &vpu {
 	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
+	power-domains = <&pwrc_vpu>;
 };
diff --git a/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts b/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
index 94567eb..71a6e1c 100644
--- a/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm/dts/meson-gxl-s905x-khadas-vim.dts
@@ -67,6 +67,13 @@
 	};
 };
 
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
 &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmi_hpd_pins>, <&hdmi_i2c_pins>;
@@ -105,6 +112,62 @@
 	linux,rc-map-name = "rc-geekbox";
 };
 
+&pinctrl_aobus {
+	gpio-line-names = "UART TX",
+			  "UART RX",
+			  "Power Key In",
+			  "J9 Header Pin35",
+			  "J9 Header Pin16",
+			  "J9 Header Pin15",
+			  "J9 Header Pin33",
+			  "IR In",
+			  "HDMI CEC",
+			  "SYS LED",
+			  /* GPIO_TEST_N */
+			  "";
+};
+
+&pinctrl_periphs {
+	gpio-line-names = /* Bank GPIOZ */
+			  "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "",
+			  "Power OFF",
+			  "VCCK Enable",
+			  /* Bank GPIOH */
+			  "HDMI HPD", "HDMI SDA", "HDMI SCL",
+			  "HDMI_5V_EN", "SPDIF",
+			  "J9 Header Pin37",
+			  "J9 Header Pin30",
+			  "J9 Header Pin29",
+			  "J9 Header Pin32",
+			  "J9 Header Pin31",
+			  /* Bank BOOT */
+			  "eMMC D0", "eMMC D1", "eMMC D2", "eMMC D3",
+			  "eMMC D4", "eMMC D5", "eMMC D6", "eMMC D7",
+			  "eMMC Clk", "eMMC Reset", "eMMC CMD",
+			  "", "BOOT_MODE", "", "", "eMMC Data Strobe",
+			  /* Bank CARD */
+			  "SDCard D1", "SDCard D0", "SDCard CLK", "SDCard CMD",
+			  "SDCard D3", "SDCard D2", "SDCard Det",
+			  /* Bank GPIODV */
+			  "", "", "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "", "", "",
+			  "I2C A SDA", "I2C A SCK", "I2C B SDA", "I2C B SCK",
+			  "VCCK Regulator", "VDDEE Regulator",
+			  /* Bank GPIOX */
+			  "WIFI SDIO D0", "WIFI SDIO D1", "WIFI SDIO D2",
+			  "WIFI SDIO D3", "WIFI SDIO CLK", "WIFI SDIO CMD",
+			  "WIFI Power Enable", "WIFI WAKE HOST",
+			  "Bluetooth PCM DOUT", "Bluetooth PCM DIN",
+			  "Bluetooth PCM SYNC", "Bluetooth PCM CLK",
+			  "Bluetooth UART TX", "Bluetooth UART RX",
+			  "Bluetooth UART CTS", "Bluetooth UART RTS",
+			  "WIFI 32K", "Bluetooth Enable",
+			  "Bluetooth WAKE HOST",
+			  /* Bank GPIOCLK */
+			  "", "J9 Header Pin39";
+};
+
 &pwm_AO_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_ao_a_3_pins>, <&pwm_ao_b_pins>;
diff --git a/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts b/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
index 266fbcf..9671f1e 100644
--- a/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm/dts/meson-gxl-s905x-libretech-cc.dts
@@ -72,6 +72,18 @@
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
+	hdmi_5v: regulator-hdmi-5v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "HDMI_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio GPIOH_3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	vcc_3v3: regulator-vcc_3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
@@ -91,6 +103,16 @@
 
 		states = <3300000 0>,
 			 <1800000 1>;
+
+		regulator-settling-time-up-us = <200>;
+		regulator-settling-time-down-us = <50000>;
+	};
+
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
 	};
 
 	vddio_boot: regulator-vddio_boot {
@@ -101,6 +123,13 @@
 	};
 };
 
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
 &cvbs_vdac_port {
 	cvbs_vdac_out: endpoint {
 		remote-endpoint = <&cvbs_connector_in>;
@@ -111,6 +140,11 @@
 	status = "okay";
 };
 
+&internal_phy {
+	pinctrl-0 = <&eth_link_led_pins>, <&eth_act_led_pins>;
+	pinctrl-names = "default";
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
@@ -129,14 +163,80 @@
 	};
 };
 
+&pinctrl_aobus {
+	gpio-line-names = "UART TX",
+			  "UART RX",
+			  "Blue LED",
+			  "SDCard Voltage Switch",
+			  "7J1 Header Pin5",
+			  "7J1 Header Pin3",
+			  "7J1 Header Pin12",
+			  "IR In",
+			  "9J3 Switch HDMI CEC/7J1 Header Pin11",
+			  "7J1 Header Pin13",
+			  /* GPIO_TEST_N */
+			  "7J1 Header Pin15";
+};
+
+&pinctrl_periphs {
+	gpio-line-names = /* Bank GPIOZ */
+			  "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "",
+			  "Eth Link LED", "Eth Activity LED",
+			  /* Bank GPIOH */
+			  "HDMI HPD", "HDMI SDA", "HDMI SCL",
+			  "HDMI_5V_EN", "9J1 Header Pin2",
+			  "Analog Audio Mute",
+			  "2J3 Header Pin6",
+			  "2J3 Header Pin5",
+			  "2J3 Header Pin4",
+			  "2J3 Header Pin3",
+			  /* Bank BOOT */
+			  "eMMC D0", "eMMC D1", "eMMC D2", "eMMC D3",
+			  "eMMC D4", "eMMC D5", "eMMC D6", "eMMC D7",
+			  "eMMC Clk", "eMMC Reset", "eMMC CMD",
+			  "ALT BOOT MODE", "", "", "", "eMMC Data Strobe",
+			  /* Bank CARD */
+			  "SDCard D1", "SDCard D0", "SDCard CLK", "SDCard CMD",
+			  "SDCard D3", "SDCard D2", "SDCard Det",
+			  /* Bank GPIODV */
+			  "", "", "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "", "", "",
+			  "Green LED", "VCCK Enable",
+			  "7J1 Header Pin27", "7J1 Header Pin28",
+			  "VCCK Regulator", "VDDEE Regulator",
+			  /* Bank GPIOX */
+			  "7J1 Header Pin22", "7J1 Header Pin26",
+			  "7J1 Header Pin36", "7J1 Header Pin38",
+			  "7J1 Header Pin40", "7J1 Header Pin37",
+			  "7J1 Header Pin33", "7J1 Header Pin35",
+			  "7J1 Header Pin19", "7J1 Header Pin21",
+			  "7J1 Header Pin24", "7J1 Header Pin23",
+			  "7J1 Header Pin8", "7J1 Header Pin10",
+			  "7J1 Header Pin16", "7J1 Header Pin18",
+			  "7J1 Header Pin32", "7J1 Header Pin29",
+			  "7J1 Header Pin31",
+			  /* Bank GPIOCLK */
+			  "7J1 Header Pin7", "";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
 	pinctrl-0 = <&sdcard_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <4>;
 	cap-sd-highspeed;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
 	max-frequency = <100000000>;
 	disable-wp;
 
@@ -150,11 +250,13 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>;
-	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
 	cap-mmc-highspeed;
+	mmc-ddr-3_3v;
 	max-frequency = <50000000>;
 	non-removable;
 	disable-wp;
diff --git a/arch/arm/dts/meson-gxl-s905x-p212.dts b/arch/arm/dts/meson-gxl-s905x-p212.dts
index 6ab17c1..6e2bf85 100644
--- a/arch/arm/dts/meson-gxl-s905x-p212.dts
+++ b/arch/arm/dts/meson-gxl-s905x-p212.dts
@@ -71,6 +71,13 @@
 	};
 };
 
+&cec_AO {
+	status = "okay";
+	pinctrl-0 = <&ao_cec_pins>;
+	pinctrl-names = "default";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
 &cvbs_vdac_port {
 	cvbs_vdac_out: endpoint {
 		remote-endpoint = <&cvbs_connector_in>;
diff --git a/arch/arm/dts/meson-gxl-s905x-p212.dtsi b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
index f3eea8e..7005068 100644
--- a/arch/arm/dts/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
@@ -28,6 +28,18 @@
 		reg = <0x0 0x0 0x0 0x80000000>;
 	};
 
+	hdmi_5v: regulator-hdmi-5v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "HDMI_5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		gpio = <&gpio GPIOH_3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	vddio_boot: regulator-vddio_boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
@@ -95,7 +107,8 @@
 &sd_emmc_a {
 	status = "okay";
 	pinctrl-0 = <&sdio_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 	#address-cells = <1>;
 	#size-cells = <0>;
 
@@ -116,7 +129,8 @@
 &sd_emmc_b {
 	status = "okay";
 	pinctrl-0 = <&sdcard_pins>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <4>;
 	cap-sd-highspeed;
@@ -133,11 +147,11 @@
 /* eMMC */
 &sd_emmc_c {
 	status = "okay";
-	pinctrl-0 = <&emmc_pins>;
-	pinctrl-names = "default";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
 
 	bus-width = <8>;
-	cap-sd-highspeed;
 	cap-mmc-highspeed;
 	max-frequency = <200000000>;
 	non-removable;
diff --git a/arch/arm/dts/meson-gxl.dtsi b/arch/arm/dts/meson-gxl.dtsi
index 8d4f316..c851411 100644
--- a/arch/arm/dts/meson-gxl.dtsi
+++ b/arch/arm/dts/meson-gxl.dtsi
@@ -43,11 +43,20 @@
 
 #include "meson-gx.dtsi"
 #include <dt-bindings/clock/gxbb-clkc.h>
+#include <dt-bindings/clock/gxbb-aoclkc.h>
 #include <dt-bindings/gpio/meson-gxl-gpio.h>
 #include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 
 / {
 	compatible = "amlogic,meson-gxl";
+
+	reserved-memory {
+		/* Alternate 3 MiB reserved for ARM Trusted Firmware (BL31) */
+		secmon_reserved_alt: secmon at 5000000 {
+			reg = <0x0 0x05000000 0x0 0x300000>;
+			no-map;
+		};
+	};
 };
 
 &ethmac {
@@ -207,6 +216,21 @@
 	};
 };
 
+&cec_AO {
+	clocks = <&clkc_AO CLKID_AO_CEC_32K>;
+	clock-names = "core";
+};
+
+&clkc_AO {
+	compatible = "amlogic,meson-gxl-aoclkc", "amlogic,meson-gx-aoclkc";
+};
+
+&gpio_intc {
+	compatible = "amlogic,meson-gpio-intc",
+		     "amlogic,meson-gxl-gpio-intc";
+	status = "okay";
+};
+
 &hdmi_tx {
 	compatible = "amlogic,meson-gxl-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
 	resets = <&reset RESET_HDMITX_CAPB3>,
@@ -258,19 +282,36 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_periphs 0 10 101>;
+			gpio-ranges = <&pinctrl_periphs 0 0 100>;
 		};
 
 		emmc_pins: emmc {
 			mux {
 				groups = "emmc_nand_d07",
 				       "emmc_cmd",
-				       "emmc_clk",
-				       "emmc_ds";
+				       "emmc_clk";
 				function = "emmc";
 			};
 		};
 
+		emmc_ds_pins: emmc-ds {
+			mux {
+				groups = "emmc_ds";
+				function = "emmc";
+			};
+		};
+
+		emmc_clk_gate_pins: emmc_clk_gate {
+			mux {
+				groups = "BOOT_8";
+				function = "gpio_periphs";
+			};
+			cfg-pull-down {
+				pins = "BOOT_8";
+				bias-pull-down;
+			};
+		};
+
 		nor_pins: nor {
 			mux {
 				groups = "nor_d",
@@ -309,6 +350,17 @@
 			};
 		};
 
+		sdcard_clk_gate_pins: sdcard_clk_gate {
+			mux {
+				groups = "CARD_2";
+				function = "gpio_periphs";
+			};
+			cfg-pull-down {
+				pins = "CARD_2";
+				bias-pull-down;
+			};
+		};
+
 		sdio_pins: sdio {
 			mux {
 				groups = "sdio_d0",
@@ -321,6 +373,17 @@
 			};
 		};
 
+		sdio_clk_gate_pins: sdio_clk_gate {
+			mux {
+				groups = "GPIOX_4";
+				function = "gpio_periphs";
+			};
+			cfg-pull-down {
+				pins = "GPIOX_4";
+				bias-pull-down;
+			};
+		};
+
 		sdio_irq_pins: sdio_irq {
 			mux {
 				groups = "sdio_irq";
@@ -568,6 +631,7 @@
 
 			internal_phy: ethernet-phy at 8 {
 				compatible = "ethernet-phy-id0181.4400", "ethernet-phy-ieee802.3-c22";
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <8>;
 				max-speed = <100>;
 			};
@@ -581,33 +645,74 @@
 	};
 };
 
+&pwrc_vpu {
+	resets = <&reset RESET_VIU>,
+		 <&reset RESET_VENC>,
+		 <&reset RESET_VCBUS>,
+		 <&reset RESET_BT656>,
+		 <&reset RESET_DVIN_RESET>,
+		 <&reset RESET_RDMA>,
+		 <&reset RESET_VENCI>,
+		 <&reset RESET_VENCP>,
+		 <&reset RESET_VDAC>,
+		 <&reset RESET_VDI6>,
+		 <&reset RESET_VENCL>,
+		 <&reset RESET_VID_LOCK>;
+	clocks = <&clkc CLKID_VPU>,
+	         <&clkc CLKID_VAPB>;
+	clock-names = "vpu", "vapb";
+	/*
+	 * VPU clocking is provided by two identical clock paths
+	 * VPU_0 and VPU_1 muxed to a single clock by a glitch
+	 * free mux to safely change frequency while running.
+	 * Same for VAPB but with a final gate after the glitch free mux.
+	 */
+	assigned-clocks = <&clkc CLKID_VPU_0_SEL>,
+			  <&clkc CLKID_VPU_0>,
+			  <&clkc CLKID_VPU>, /* Glitch free mux */
+			  <&clkc CLKID_VAPB_0_SEL>,
+			  <&clkc CLKID_VAPB_0>,
+			  <&clkc CLKID_VAPB_SEL>; /* Glitch free mux */
+	assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
+				 <0>, /* Do Nothing */
+				 <&clkc CLKID_VPU_0>,
+				 <&clkc CLKID_FCLK_DIV4>,
+				 <0>, /* Do Nothing */
+				 <&clkc CLKID_VAPB_0>;
+	assigned-clock-rates = <0>, /* Do Nothing */
+			       <666666666>,
+			       <0>, /* Do Nothing */
+			       <0>, /* Do Nothing */
+			       <250000000>,
+			       <0>; /* Do Nothing */
+};
+
 &saradc {
 	compatible = "amlogic,meson-gxl-saradc", "amlogic,meson-saradc";
 	clocks = <&xtal>,
 		 <&clkc CLKID_SAR_ADC>,
-		 <&clkc CLKID_SANA>,
 		 <&clkc CLKID_SAR_ADC_CLK>,
 		 <&clkc CLKID_SAR_ADC_SEL>;
-	clock-names = "clkin", "core", "sana", "adc_clk", "adc_sel";
+	clock-names = "clkin", "core", "adc_clk", "adc_sel";
 };
 
 &sd_emmc_a {
 	clocks = <&clkc CLKID_SD_EMMC_A>,
-		 <&xtal>,
+		 <&clkc CLKID_SD_EMMC_A_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 };
 
 &sd_emmc_b {
 	clocks = <&clkc CLKID_SD_EMMC_B>,
-		 <&xtal>,
+		 <&clkc CLKID_SD_EMMC_B_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
        clock-names = "core", "clkin0", "clkin1";
 };
 
 &sd_emmc_c {
 	clocks = <&clkc CLKID_SD_EMMC_C>,
-		 <&xtal>,
+		 <&clkc CLKID_SD_EMMC_C_CLK0>,
 		 <&clkc CLKID_FCLK_DIV2>;
 	clock-names = "core", "clkin0", "clkin1";
 };
@@ -623,6 +728,32 @@
 	clocks = <&clkc CLKID_SPI>;
 };
 
+&uart_A {
+	clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
+&uart_AO {
+	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
+&uart_AO_B {
+	clocks = <&xtal>, <&clkc CLKID_CLK81>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
+&uart_B {
+	clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
+&uart_C {
+	clocks = <&xtal>, <&clkc CLKID_UART2>, <&xtal>;
+	clock-names = "xtal", "pclk", "baud";
+};
+
 &vpu {
 	compatible = "amlogic,meson-gxl-vpu", "amlogic,meson-gx-vpu";
+	power-domains = <&pwrc_vpu>;
 };
diff --git a/include/dt-bindings/clock/gxbb-aoclkc.h b/include/dt-bindings/clock/gxbb-aoclkc.h
index 3175148..9d15e22 100644
--- a/include/dt-bindings/clock/gxbb-aoclkc.h
+++ b/include/dt-bindings/clock/gxbb-aoclkc.h
@@ -62,5 +62,6 @@
 #define CLKID_AO_UART1		3
 #define CLKID_AO_UART2		4
 #define CLKID_AO_IR_BLASTER	5
+#define CLKID_AO_CEC_32K	6
 
 #endif
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index e3e9f79..8ba99a5 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * GXBB clock tree IDs
  */
@@ -5,37 +6,96 @@
 #ifndef __GXBB_CLKC_H
 #define __GXBB_CLKC_H
 
+#define CLKID_SYS_PLL		0
 #define CLKID_HDMI_PLL		2
+#define CLKID_FIXED_PLL		3
 #define CLKID_FCLK_DIV2		4
 #define CLKID_FCLK_DIV3		5
 #define CLKID_FCLK_DIV4		6
+#define CLKID_FCLK_DIV5		7
+#define CLKID_FCLK_DIV7		8
 #define CLKID_GP0_PLL		9
 #define CLKID_CLK81		12
+#define CLKID_MPLL0		13
+#define CLKID_MPLL1		14
 #define CLKID_MPLL2		15
+#define CLKID_DDR		16
+#define CLKID_DOS		17
+#define CLKID_ISA		18
+#define CLKID_PL301		19
+#define CLKID_PERIPHS		20
 #define CLKID_SPICC		21
 #define CLKID_I2C		22
 #define CLKID_SAR_ADC		23
+#define CLKID_SMART_CARD	24
 #define CLKID_RNG0		25
 #define CLKID_UART0		26
+#define CLKID_SDHC		27
+#define CLKID_STREAM		28
+#define CLKID_ASYNC_FIFO	29
+#define CLKID_SDIO		30
+#define CLKID_ABUF		31
+#define CLKID_HIU_IFACE		32
+#define CLKID_ASSIST_MISC	33
 #define CLKID_SPI		34
 #define CLKID_ETH		36
+#define CLKID_I2S_SPDIF		35
+#define CLKID_DEMUX		37
 #define CLKID_AIU_GLUE		38
 #define CLKID_IEC958		39
 #define CLKID_I2S_OUT		40
+#define CLKID_AMCLK		41
+#define CLKID_AIFIFO2		42
+#define CLKID_MIXER		43
 #define CLKID_MIXER_IFACE	44
+#define CLKID_ADC		45
+#define CLKID_BLKMV		46
 #define CLKID_AIU		47
 #define CLKID_UART1		48
+#define CLKID_G2D		49
 #define CLKID_USB0		50
 #define CLKID_USB1		51
+#define CLKID_RESET		52
+#define CLKID_NAND		53
+#define CLKID_DOS_PARSER	54
 #define CLKID_USB		55
+#define CLKID_VDIN1		56
+#define CLKID_AHB_ARB0		57
+#define CLKID_EFUSE		58
+#define CLKID_BOOT_ROM		59
+#define CLKID_AHB_DATA_BUS	60
+#define CLKID_AHB_CTRL_BUS	61
+#define CLKID_HDMI_INTR_SYNC	62
 #define CLKID_HDMI_PCLK		63
 #define CLKID_USB1_DDR_BRIDGE	64
 #define CLKID_USB0_DDR_BRIDGE	65
+#define CLKID_MMC_PCLK		66
+#define CLKID_DVIN		67
 #define CLKID_UART2		68
 #define CLKID_SANA		69
+#define CLKID_VPU_INTR		70
+#define CLKID_SEC_AHB_AHB3_BRIDGE 71
+#define CLKID_CLK81_A53		72
+#define CLKID_VCLK2_VENCI0	73
+#define CLKID_VCLK2_VENCI1	74
+#define CLKID_VCLK2_VENCP0	75
+#define CLKID_VCLK2_VENCP1	76
 #define CLKID_GCLK_VENCI_INT0	77
+#define CLKID_GCLK_VENCI_INT	78
+#define CLKID_DAC_CLK		79
 #define CLKID_AOCLK_GATE	80
 #define CLKID_IEC958_GATE	81
+#define CLKID_ENC480P		82
+#define CLKID_RNG1		83
+#define CLKID_GCLK_VENCI_INT1	84
+#define CLKID_VCLK2_VENCLMCC	85
+#define CLKID_VCLK2_VENCL	86
+#define CLKID_VCLK_OTHER	87
+#define CLKID_EDP		88
+#define CLKID_AO_MEDIA_CPU	89
+#define CLKID_AO_AHB_SRAM	90
+#define CLKID_AO_AHB_BUS	91
+#define CLKID_AO_IFACE		92
 #define CLKID_AO_I2C		93
 #define CLKID_SD_EMMC_A		94
 #define CLKID_SD_EMMC_B		95
@@ -50,5 +110,20 @@
 #define CLKID_CTS_AMCLK		107
 #define CLKID_CTS_MCLK_I958	110
 #define CLKID_CTS_I958		113
+#define CLKID_32K_CLK		114
+#define CLKID_SD_EMMC_A_CLK0	119
+#define CLKID_SD_EMMC_B_CLK0	122
+#define CLKID_SD_EMMC_C_CLK0	125
+#define CLKID_VPU_0_SEL		126
+#define CLKID_VPU_0		128
+#define CLKID_VPU_1_SEL		129
+#define CLKID_VPU_1		131
+#define CLKID_VPU		132
+#define CLKID_VAPB_0_SEL	133
+#define CLKID_VAPB_0		135
+#define CLKID_VAPB_1_SEL	136
+#define CLKID_VAPB_1		138
+#define CLKID_VAPB_SEL		139
+#define CLKID_VAPB		140
 
 #endif /* __GXBB_CLKC_H */
diff --git a/include/dt-bindings/gpio/meson-gxbb-gpio.h b/include/dt-bindings/gpio/meson-gxbb-gpio.h
index 58654fd..43a68a1 100644
--- a/include/dt-bindings/gpio/meson-gxbb-gpio.h
+++ b/include/dt-bindings/gpio/meson-gxbb-gpio.h
@@ -29,6 +29,7 @@
 #define	GPIOAO_11	11
 #define	GPIOAO_12	12
 #define	GPIOAO_13	13
+#define	GPIO_TEST_N	14
 
 #define	GPIOZ_0		0
 #define	GPIOZ_1		1
@@ -149,6 +150,5 @@
 #define	GPIOCLK_1	116
 #define	GPIOCLK_2	117
 #define	GPIOCLK_3	118
-#define	GPIO_TEST_N	119
 
 #endif
diff --git a/include/dt-bindings/gpio/meson-gxl-gpio.h b/include/dt-bindings/gpio/meson-gxl-gpio.h
index 684d0d7..01f2a2a 100644
--- a/include/dt-bindings/gpio/meson-gxl-gpio.h
+++ b/include/dt-bindings/gpio/meson-gxl-gpio.h
@@ -25,6 +25,7 @@
 #define	GPIOAO_7	7
 #define	GPIOAO_8	8
 #define	GPIOAO_9	9
+#define	GPIO_TEST_N	10
 
 #define	GPIOZ_0		0
 #define	GPIOZ_1		1
@@ -126,6 +127,5 @@
 #define	GPIOX_18	97
 #define	GPIOCLK_0	98
 #define	GPIOCLK_1	99
-#define	GPIO_TEST_N	100
 
 #endif
-- 
2.7.4
