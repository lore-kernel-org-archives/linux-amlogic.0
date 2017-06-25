From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 25 Jun 2017 17:55:09 +0200
Subject: [PATCH 1/3] arm: dts: meson: import dts files from Linux 4.12-rc6
In-Reply-To: <20170625155511.28447-1-b.galvani@gmail.com>
References: <20170625155511.28447-1-b.galvani@gmail.com>
Message-ID: <20170625155511.28447-2-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Import Amlogic Meson DTS files from Linux kernel version 4.12-rc6.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 arch/arm/dts/meson-gx.dtsi            |  97 ++++++++++++++++--
 arch/arm/dts/meson-gxbb-odroidc2.dts  |  82 ++++++++++++++-
 arch/arm/dts/meson-gxbb.dtsi          | 187 ++++++++++++++++++++++++++++------
 include/dt-bindings/clock/gxbb-clkc.h |  14 ++-
 4 files changed, 335 insertions(+), 45 deletions(-)

diff --git a/arch/arm/dts/meson-gx.dtsi b/arch/arm/dts/meson-gx.dtsi
index c129100..436b875 100644
--- a/arch/arm/dts/meson-gx.dtsi
+++ b/arch/arm/dts/meson-gx.dtsi
@@ -71,6 +71,14 @@
 			reg = <0x0 0x10000000 0x0 0x200000>;
 			no-map;
 		};
+
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x0 0xbc00000>;
+			alignment = <0x0 0x400000>;
+			linux,cma-default;
+		};
 	};
 
 	cpus {
@@ -233,7 +241,7 @@
 			};
 
 			i2c_A: i2c at 8500 {
-				compatible = "amlogic,meson-gxbb-i2c";
+				compatible = "amlogic,meson-gx-i2c", "amlogic,meson-gxbb-i2c";
 				reg = <0x0 0x08500 0x0 0x20>;
 				interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
@@ -255,6 +263,14 @@
 				status = "disabled";
 			};
 
+			saradc: adc at 8680 {
+				compatible = "amlogic,meson-saradc";
+				reg = <0x0 0x8680 0x0 0x34>;
+				#io-channel-cells = <1>;
+				interrupts = <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
+
 			pwm_ef: pwm at 86c0 {
 				compatible = "amlogic,meson-gx-pwm", "amlogic,meson-gxbb-pwm";
 				reg = <0x0 0x086c0 0x0 0x10>;
@@ -271,7 +287,7 @@
 			};
 
 			i2c_B: i2c at 87c0 {
-				compatible = "amlogic,meson-gxbb-i2c";
+				compatible = "amlogic,meson-gx-i2c", "amlogic,meson-gxbb-i2c";
 				reg = <0x0 0x087c0 0x0 0x20>;
 				interrupts = <GIC_SPI 214 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
@@ -280,7 +296,7 @@
 			};
 
 			i2c_C: i2c at 87e0 {
-				compatible = "amlogic,meson-gxbb-i2c";
+				compatible = "amlogic,meson-gx-i2c", "amlogic,meson-gxbb-i2c";
 				reg = <0x0 0x087e0 0x0 0x20>;
 				interrupts = <GIC_SPI 215 IRQ_TYPE_EDGE_RISING>;
 				#address-cells = <1>;
@@ -288,6 +304,14 @@
 				status = "disabled";
 			};
 
+			spifc: spi at 8c80 {
+				compatible = "amlogic,meson-gx-spifc", "amlogic,meson-gxbb-spifc";
+				reg = <0x0 0x08c80 0x0 0x80>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			watchdog at 98d0 {
 				compatible = "amlogic,meson-gx-wdt", "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0x098d0 0x0 0x10>;
@@ -309,7 +333,7 @@
 		};
 
 		sram: sram at c8000000 {
-			compatible = "amlogic,meson-gxbb-sram", "mmio-sram";
+			compatible = "amlogic,meson-gx-sram", "amlogic,meson-gxbb-sram", "mmio-sram";
 			reg = <0x0 0xc8000000 0x0 0x14000>;
 
 			#address-cells = <1>;
@@ -317,12 +341,12 @@
 			ranges = <0 0x0 0xc8000000 0x14000>;
 
 			cpu_scp_lpri: scp-shmem at 0 {
-				compatible = "amlogic,meson-gxbb-scp-shmem";
+				compatible = "amlogic,meson-gx-scp-shmem", "amlogic,meson-gxbb-scp-shmem";
 				reg = <0x13000 0x400>;
 			};
 
 			cpu_scp_hpri: scp-shmem at 200 {
-				compatible = "amlogic,meson-gxbb-scp-shmem";
+				compatible = "amlogic,meson-gx-scp-shmem", "amlogic,meson-gxbb-scp-shmem";
 				reg = <0x13400 0x400>;
 			};
 		};
@@ -334,6 +358,13 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc8100000 0x0 0x100000>;
 
+			clkc_AO: clock-controller at 040 {
+				compatible = "amlogic,gx-aoclkc", "amlogic,gxbb-aoclkc";
+				reg = <0x0 0x00040 0x0 0x4>;
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			uart_AO: serial at 4c0 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x0 0x004c0 0x0 0x14>;
@@ -350,8 +381,24 @@
 				status = "disabled";
 			};
 
+			i2c_AO: i2c at 500 {
+				compatible = "amlogic,meson-gx-i2c", "amlogic,meson-gxbb-i2c";
+				reg = <0x0 0x500 0x0 0x20>;
+				interrupts = <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			pwm_AO_ab: pwm at 550 {
+				compatible = "amlogic,meson-gx-pwm", "amlogic,meson-gxbb-pwm";
+				reg = <0x0 0x00550 0x0 0x10>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			ir: ir at 580 {
-				compatible = "amlogic,meson-gxbb-ir";
+				compatible = "amlogic,meson-gx-ir", "amlogic,meson-gxbb-ir";
 				reg = <0x0 0x00580 0x0 0x40>;
 				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
@@ -365,13 +412,12 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc8834000 0x0 0x2000>;
 
-			rng {
+			hwrng: rng {
 				compatible = "amlogic,meson-rng";
 				reg = <0x0 0x0 0x0 0x4>;
 			};
 		};
 
-
 		hiubus: hiubus at c883c000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc883c000 0x0 0x2000>;
@@ -395,7 +441,6 @@
 			       0x0 0xc8834540 0x0 0x4>;
 			interrupts = <0 8 1>;
 			interrupt-names = "macirq";
-			phy-mode = "rgmii";
 			status = "disabled";
 		};
 
@@ -442,6 +487,38 @@
 			cvbs_vdac_port: port at 0 {
 				reg = <0>;
 			};
+
+			/* HDMI-TX output port */
+			hdmi_tx_port: port at 1 {
+				reg = <1>;
+
+				hdmi_tx_out: endpoint {
+					remote-endpoint = <&hdmi_tx_in>;
+				};
+			};
+		};
+
+		hdmi_tx: hdmi-tx at c883a000 {
+			compatible = "amlogic,meson-gx-dw-hdmi";
+			reg = <0x0 0xc883a000 0x0 0x1c>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_EDGE_RISING>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			/* VPU VENC Input */
+			hdmi_tx_venc_port: port at 0 {
+				reg = <0>;
+
+				hdmi_tx_in: endpoint {
+					remote-endpoint = <&hdmi_tx_out>;
+				};
+			};
+
+			/* TMDS Output */
+			hdmi_tx_tmds_port: port at 1 {
+				reg = <1>;
+			};
 		};
 	};
 };
diff --git a/arch/arm/dts/meson-gxbb-odroidc2.dts b/arch/arm/dts/meson-gxbb-odroidc2.dts
index c737183..54a9c6a 100644
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
@@ -96,7 +96,7 @@
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&gpio_ao GPIOAO_12 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
 
@@ -152,6 +152,13 @@
 	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 	phy-handle = <&eth_phy0>;
+	phy-mode = "rgmii";
+
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+
+	amlogic,tx-delay-ns = <2>;
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
@@ -165,6 +172,57 @@
 	};
 };
 
+&pinctrl_aobus {
+	gpio-line-names = "UART TX", "UART RX", "VCCK En", "TF 3V3/1V8 En",
+			  "USB HUB nRESET", "USB OTG Power En",
+			  "J7 Header Pin2", "IR In", "J7 Header Pin4",
+			  "J7 Header Pin6", "J7 Header Pin5", "J7 Header Pin7",
+			  "HDMI CEC", "SYS LED";
+};
+
+&pinctrl_periphs {
+	gpio-line-names = /* Bank GPIOZ */
+			  "Eth MDIO", "Eth MDC", "Eth RGMII RX Clk",
+			  "Eth RX DV", "Eth RX D0", "Eth RX D1", "Eth RX D2",
+			  "Eth RX D3", "Eth RGMII TX Clk", "Eth TX En",
+			  "Eth TX D0", "Eth TX D1", "Eth TX D2", "Eth TX D3",
+			  "Eth PHY nRESET", "Eth PHY Intc",
+			  /* Bank GPIOH */
+			  "HDMI HPD", "HDMI DDC SDA", "HDMI DDC SCL", "",
+			  /* Bank BOOT */
+			  "eMMC D0", "eMMC D1", "eMMC D2", "eMMC D3", "eMMC D4",
+			  "eMMC D5", "eMMC D6", "eMMC D7", "eMMC Clk",
+			  "eMMC Reset", "eMMC CMD",
+			  "", "", "", "", "", "", "",
+			  /* Bank CARD */
+			  "SDCard D1", "SDCard D0", "SDCard CLK", "SDCard CMD",
+			  "SDCard D3", "SDCard D2", "SDCard Det",
+			  /* Bank GPIODV */
+			  "", "", "", "", "", "", "", "", "", "", "", "", "",
+			  "", "", "", "", "", "", "", "", "", "", "",
+			  "I2C A SDA", "I2C A SCK", "I2C B SDA", "I2C B SCK",
+			  "PWM D", "PWM B",
+			  /* Bank GPIOY */
+			  "Revision Bit0", "Revision Bit1", "",
+			  "J2 Header Pin35", "", "", "", "J2 Header Pin36",
+			  "J2 Header Pin31", "", "", "", "TF VDD En",
+			  "J2 Header Pin32", "J2 Header Pin26", "", "",
+			  /* Bank GPIOX */
+			  "J2 Header Pin29", "J2 Header Pin24",
+			  "J2 Header Pin23", "J2 Header Pin22",
+			  "J2 Header Pin21", "J2 Header Pin18",
+			  "J2 Header Pin33", "J2 Header Pin19",
+			  "J2 Header Pin16", "J2 Header Pin15",
+			  "J2 Header Pin12", "J2 Header Pin13",
+			  "J2 Header Pin8", "J2 Header Pin10",
+			  "", "", "", "", "",
+			  "J2 Header Pin11", "", "J2 Header Pin7",
+			  /* Bank GPIOCLK */
+			  "", "", "", "",
+			  /* GPIO_TEST_N */
+			  "";
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
@@ -177,6 +235,21 @@
 	pinctrl-names = "default";
 };
 
+&gpio_ao {
+	/*
+	 * WARNING: The USB Hub on the Odroid-C2 needs a reset signal
+	 * to be turned high in order to be detected by the USB Controller
+	 * This signal should be handled by a USB specific power sequence
+	 * in order to reset the Hub when USB bus is powered down.
+	 */
+	usb-hub {
+		gpio-hog;
+		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "usb-hub-reset";
+	};
+};
+
 &usb0_phy {
 	status = "okay";
 	phy-supply = <&usb_otg_pwr>;
@@ -194,6 +267,11 @@
 	status = "okay";
 };
 
+&saradc {
+	status = "okay";
+	vref-supply = <&vcc1v8>;
+};
+
 /* SD */
 &sd_emmc_b {
 	status = "okay";
diff --git a/arch/arm/dts/meson-gxbb.dtsi b/arch/arm/dts/meson-gxbb.dtsi
index 39a774a..86105a6 100644
--- a/arch/arm/dts/meson-gxbb.dtsi
+++ b/arch/arm/dts/meson-gxbb.dtsi
@@ -97,17 +97,6 @@
 	};
 };
 
-&cbus {
-	spifc: spi at 8c80 {
-		compatible = "amlogic,meson-gxbb-spifc";
-		reg = <0x0 0x08c80 0x0 0x80>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		clocks = <&clkc CLKID_SPI>;
-		status = "disabled";
-	};
-};
-
 &ethmac {
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_FCLK_DIV2>,
@@ -129,6 +118,7 @@
 			reg-names = "mux", "pull", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aobus 0 0 14>;
 		};
 
 		uart_ao_a_pins: uart_ao_a {
@@ -203,30 +193,62 @@
 				function = "pwm_ao_b";
 			};
 		};
-	};
 
-	clkc_AO: clock-controller at 040 {
-		compatible = "amlogic,gxbb-aoclkc";
-		reg = <0x0 0x00040 0x0 0x4>;
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-	};
+		i2s_am_clk_pins: i2s_am_clk {
+			mux {
+				groups = "i2s_am_clk";
+				function = "i2s_out_ao";
+			};
+		};
 
-	pwm_ab_AO: pwm at 550 {
-		compatible = "amlogic,meson-gxbb-pwm";
-		reg = <0x0 0x0550 0x0 0x10>;
-		#pwm-cells = <3>;
-		status = "disabled";
-	};
+		i2s_out_ao_clk_pins: i2s_out_ao_clk {
+			mux {
+				groups = "i2s_out_ao_clk";
+				function = "i2s_out_ao";
+			};
+		};
+
+		i2s_out_lr_clk_pins: i2s_out_lr_clk {
+			mux {
+				groups = "i2s_out_lr_clk";
+				function = "i2s_out_ao";
+			};
+		};
+
+		i2s_out_ch01_ao_pins: i2s_out_ch01_ao {
+			mux {
+				groups = "i2s_out_ch01_ao";
+				function = "i2s_out_ao";
+			};
+		};
+
+		i2s_out_ch23_ao_pins: i2s_out_ch23_ao {
+			mux {
+				groups = "i2s_out_ch23_ao";
+				function = "i2s_out_ao";
+			};
+		};
+
+		i2s_out_ch45_ao_pins: i2s_out_ch45_ao {
+			mux {
+				groups = "i2s_out_ch45_ao";
+				function = "i2s_out_ao";
+			};
+		};
+
+		spdif_out_ao_6_pins: spdif_out_ao_6 {
+			mux {
+				groups = "spdif_out_ao_6";
+				function = "spdif_out_ao";
+			};
+		};
 
-	i2c_AO: i2c at 500 {
-		compatible = "amlogic,meson-gxbb-i2c";
-		reg = <0x0 0x500 0x0 0x20>;
-		interrupts = <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&clkc CLKID_AO_I2C>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "disabled";
+		spdif_out_ao_13_pins: spdif_out_ao_13 {
+			mux {
+				groups = "spdif_out_ao_13";
+				function = "spdif_out_ao";
+			};
+		};
 	};
 };
 
@@ -245,6 +267,7 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_periphs 0 14 120>;
 		};
 
 		emmc_pins: emmc {
@@ -467,6 +490,34 @@
 				function = "hdmi_i2c";
 			};
 		};
+
+		i2sout_ch23_y_pins: i2sout_ch23_y {
+			mux {
+				groups = "i2sout_ch23_y";
+				function = "i2s_out";
+			};
+		};
+
+		i2sout_ch45_y_pins: i2sout_ch45_y {
+			mux {
+				groups = "i2sout_ch45_y";
+				function = "i2s_out";
+			};
+		};
+
+		i2sout_ch67_y_pins: i2sout_ch67_y {
+			mux {
+				groups = "i2sout_ch67_y";
+				function = "i2s_out";
+			};
+		};
+
+		spdif_out_y_pins: spdif_out_y {
+			mux {
+				groups = "spdif_out_y";
+				function = "spdif_out";
+			};
+		};
 	};
 };
 
@@ -478,10 +529,51 @@
 	};
 };
 
+&apb {
+	mali: gpu at c0000 {
+		compatible = "amlogic,meson-gxbb-mali", "arm,mali-450";
+		reg = <0x0 0xc0000 0x0 0x40000>;
+		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "gp", "gpmmu", "pp", "pmu",
+			"pp0", "ppmmu0", "pp1", "ppmmu1",
+			"pp2", "ppmmu2";
+		clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
+		clock-names = "bus", "core";
+
+		/*
+		 * Mali clocking is provided by two identical clock paths
+		 * MALI_0 and MALI_1 muxed to a single clock by a glitch
+		 * free mux to safely change frequency while running.
+		 */
+		assigned-clocks = <&clkc CLKID_MALI_0_SEL>,
+				  <&clkc CLKID_MALI_0>,
+				  <&clkc CLKID_MALI>; /* Glitch free mux */
+		assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
+					 <0>, /* Do Nothing */
+					 <&clkc CLKID_MALI_0>;
+		assigned-clock-rates = <0>, /* Do Nothing */
+				       <666666666>,
+				       <0>; /* Do Nothing */
+	};
+};
+
 &i2c_A {
 	clocks = <&clkc CLKID_I2C>;
 };
 
+&i2c_AO {
+	clocks = <&clkc CLKID_AO_I2C>;
+};
+
 &i2c_B {
 	clocks = <&clkc CLKID_I2C>;
 };
@@ -490,6 +582,16 @@
 	clocks = <&clkc CLKID_I2C>;
 };
 
+&saradc {
+	compatible = "amlogic,meson-gxbb-saradc", "amlogic,meson-saradc";
+	clocks = <&xtal>,
+		 <&clkc CLKID_SAR_ADC>,
+		 <&clkc CLKID_SANA>,
+		 <&clkc CLKID_SAR_ADC_CLK>,
+		 <&clkc CLKID_SAR_ADC_SEL>;
+	clock-names = "clkin", "core", "sana", "adc_clk", "adc_sel";
+};
+
 &sd_emmc_a {
 	clocks = <&clkc CLKID_SD_EMMC_A>,
 		 <&xtal>,
@@ -511,6 +613,27 @@
 	clock-names = "core", "clkin0", "clkin1";
 };
 
+&spifc {
+	clocks = <&clkc CLKID_SPI>;
+};
+
 &vpu {
 	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
 };
+
+&hwrng {
+	clocks = <&clkc CLKID_RNG0>;
+	clock-names = "core";
+};
+
+&hdmi_tx {
+	compatible = "amlogic,meson-gxbb-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
+	resets = <&reset RESET_HDMITX_CAPB3>,
+		 <&reset RESET_HDMI_SYSTEM_RESET>,
+		 <&reset RESET_HDMI_TX>;
+	reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
+	clocks = <&clkc CLKID_HDMI_PCLK>,
+		 <&clkc CLKID_CLK81>,
+		 <&clkc CLKID_GCLK_VENCI_INT0>;
+	clock-names = "isfr", "iahb", "venci";
+};
diff --git a/include/dt-bindings/clock/gxbb-clkc.h b/include/dt-bindings/clock/gxbb-clkc.h
index 692846c..3190e30 100644
--- a/include/dt-bindings/clock/gxbb-clkc.h
+++ b/include/dt-bindings/clock/gxbb-clkc.h
@@ -10,12 +10,18 @@
 #define CLKID_FCLK_DIV2		4
 #define CLKID_FCLK_DIV3		5
 #define CLKID_FCLK_DIV4		6
+#define CLKID_GP0_PLL		9
 #define CLKID_CLK81		12
 #define CLKID_MPLL2		15
-#define CLKID_SPI		34
 #define CLKID_I2C		22
 #define CLKID_SAR_ADC		23
+#define CLKID_RNG0		25
+#define CLKID_SPI		34
 #define CLKID_ETH		36
+#define CLKID_AIU_GLUE		38
+#define CLKID_I2S_OUT		40
+#define CLKID_MIXER_IFACE	44
+#define CLKID_AIU		47
 #define CLKID_USB0		50
 #define CLKID_USB1		51
 #define CLKID_USB		55
@@ -24,11 +30,17 @@
 #define CLKID_USB0_DDR_BRIDGE	65
 #define CLKID_SANA		69
 #define CLKID_GCLK_VENCI_INT0	77
+#define CLKID_AOCLK_GATE	80
 #define CLKID_AO_I2C		93
 #define CLKID_SD_EMMC_A		94
 #define CLKID_SD_EMMC_B		95
 #define CLKID_SD_EMMC_C		96
 #define CLKID_SAR_ADC_CLK	97
 #define CLKID_SAR_ADC_SEL	98
+#define CLKID_MALI_0_SEL	100
+#define CLKID_MALI_0		102
+#define CLKID_MALI_1_SEL	103
+#define CLKID_MALI_1		105
+#define CLKID_MALI		106
 
 #endif /* __GXBB_CLKC_H */
-- 
2.9.3
