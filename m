From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 12 Oct 2017 15:50:30 +0200
Subject: [PATCH u-boot 1/3] ARM: dts: Synchronize Amlogic from Linux Mainline
 4.13.5
In-Reply-To: <1507816232-8227-1-git-send-email-narmstrong@baylibre.com>
References: <1507816232-8227-1-git-send-email-narmstrong@baylibre.com>
Message-ID: <1507816232-8227-2-git-send-email-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Synchronize the Amlogic ARM64 dts from mainline Linux 4.13.5

In the preparation of the support of the Amlogic P212 board,
import the corresponding meson-gxl-s905x-p212.dts file.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/dts/Makefile                     |   3 +-
 arch/arm/dts/meson-gx.dtsi                |  13 +-
 arch/arm/dts/meson-gxbb-odroidc2.dts      | 108 ++---
 arch/arm/dts/meson-gxbb.dtsi              | 220 +++++++----
 arch/arm/dts/meson-gxl-mali.dtsi          |  43 ++
 arch/arm/dts/meson-gxl-s905x-p212.dts     |  95 +++++
 arch/arm/dts/meson-gxl-s905x-p212.dtsi    | 173 ++++++++
 arch/arm/dts/meson-gxl-s905x.dtsi         |  55 +++
 arch/arm/dts/meson-gxl.dtsi               | 628 ++++++++++++++++++++++++++++++
 include/dt-bindings/gpio/meson-gxl-gpio.h | 131 +++++++
 10 files changed, 1326 insertions(+), 143 deletions(-)
 create mode 100644 arch/arm/dts/meson-gxl-mali.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x-p212.dts
 create mode 100644 arch/arm/dts/meson-gxl-s905x-p212.dtsi
 create mode 100644 arch/arm/dts/meson-gxl-s905x.dtsi
 create mode 100644 arch/arm/dts/meson-gxl.dtsi
 create mode 100644 include/dt-bindings/gpio/meson-gxl-gpio.h

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 5b90280..8a07f53 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -54,7 +54,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += \
 	rk3399-puma-ddr1866.dtb \
 	rv1108-evb.dtb
 dtb-$(CONFIG_ARCH_MESON) += \
-	meson-gxbb-odroidc2.dtb
+	meson-gxbb-odroidc2.dtb \
+	meson-gxl-s905x-p212.dtb
 dtb-$(CONFIG_TEGRA) += tegra20-harmony.dtb \
 	tegra20-medcom-wide.dtb \
 	tegra20-paz00.dtb \
diff --git a/arch/arm/dts/meson-gx.dtsi b/arch/arm/dts/meson-gx.dtsi
index 436b875..738ed68 100644
--- a/arch/arm/dts/meson-gx.dtsi
+++ b/arch/arm/dts/meson-gx.dtsi
@@ -200,7 +200,7 @@
 		};
 
 		scpi_sensors: sensors {
-			compatible = "arm,scpi-sensors";
+			compatible = "amlogic,meson-gxbb-scpi-sensors", "arm,scpi-sensors";
 			#thermal-sensor-cells = <1>;
 		};
 	};
@@ -304,6 +304,15 @@
 				status = "disabled";
 			};
 
+			spicc: spi at 8d80 {
+				compatible = "amlogic,meson-gx-spicc";
+				reg = <0x0 0x08d80 0x0 0x80>;
+				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			spifc: spi at 8c80 {
 				compatible = "amlogic,meson-gx-spifc", "amlogic,meson-gxbb-spifc";
 				reg = <0x0 0x08c80 0x0 0x80>;
@@ -391,7 +400,7 @@
 			};
 
 			pwm_AO_ab: pwm at 550 {
-				compatible = "amlogic,meson-gx-pwm", "amlogic,meson-gxbb-pwm";
+				compatible = "amlogic,meson-gx-ao-pwm", "amlogic,meson-gxbb-ao-pwm";
 				reg = <0x0 0x00550 0x0 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
diff --git a/arch/arm/dts/meson-gxbb-odroidc2.dts b/arch/arm/dts/meson-gxbb-odroidc2.dts
index 54a9c6a..d147c85 100644
--- a/arch/arm/dts/meson-gxbb-odroidc2.dts
+++ b/arch/arm/dts/meson-gxbb-odroidc2.dts
@@ -137,16 +137,6 @@
 	};
 };
 
-&scpi_clocks {
-	status = "disabled";
-};
-
-&uart_AO {
-	status = "okay";
-	pinctrl-0 = <&uart_ao_a_pins>;
-	pinctrl-names = "default";
-};
-
 &ethmac {
 	status = "okay";
 	pinctrl-0 = <&eth_rgmii_pins>;
@@ -172,6 +162,33 @@
 	};
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
+&i2c_A {
+	status = "okay";
+	pinctrl-0 = <&i2c_a_pins>;
+	pinctrl-names = "default";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
 &pinctrl_aobus {
 	gpio-line-names = "UART TX", "UART RX", "VCCK En", "TF 3V3/1V8 En",
 			  "USB HUB nRESET", "USB OTG Power En",
@@ -223,55 +240,15 @@
 			  "";
 };
 
-&ir {
-	status = "okay";
-	pinctrl-0 = <&remote_input_ao_pins>;
-	pinctrl-names = "default";
-};
-
-&i2c_A {
-	status = "okay";
-	pinctrl-0 = <&i2c_a_pins>;
-	pinctrl-names = "default";
-};
-
-&gpio_ao {
-	/*
-	 * WARNING: The USB Hub on the Odroid-C2 needs a reset signal
-	 * to be turned high in order to be detected by the USB Controller
-	 * This signal should be handled by a USB specific power sequence
-	 * in order to reset the Hub when USB bus is powered down.
-	 */
-	usb-hub {
-		gpio-hog;
-		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
-		output-high;
-		line-name = "usb-hub-reset";
-	};
-};
-
-&usb0_phy {
-	status = "okay";
-	phy-supply = <&usb_otg_pwr>;
-};
-
-&usb1_phy {
-	status = "okay";
-};
-
-&usb0 {
-	status = "okay";
-};
-
-&usb1 {
-	status = "okay";
-};
-
 &saradc {
 	status = "okay";
 	vref-supply = <&vcc1v8>;
 };
 
+&scpi_clocks {
+	status = "disabled";
+};
+
 /* SD */
 &sd_emmc_b {
 	status = "okay";
@@ -309,3 +286,26 @@
 	vmmc-supply = <&vcc3v3>;
 	vqmmc-supply = <&vcc1v8>;
 };
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb0_phy {
+	status = "okay";
+	phy-supply = <&usb_otg_pwr>;
+};
+
+&usb1_phy {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
diff --git a/arch/arm/dts/meson-gxbb.dtsi b/arch/arm/dts/meson-gxbb.dtsi
index 86105a6..17d3efd 100644
--- a/arch/arm/dts/meson-gxbb.dtsi
+++ b/arch/arm/dts/meson-gxbb.dtsi
@@ -97,13 +97,6 @@
 	};
 };
 
-&ethmac {
-	clocks = <&clkc CLKID_ETH>,
-		 <&clkc CLKID_FCLK_DIV2>,
-		 <&clkc CLKID_MPLL2>;
-	clock-names = "stmmaceth", "clkin0", "clkin1";
-};
-
 &aobus {
 	pinctrl_aobus: pinctrl at 14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
@@ -249,9 +242,119 @@
 				function = "spdif_out_ao";
 			};
 		};
+
+		ao_cec_pins: ao_cec {
+			mux {
+				groups = "ao_cec";
+				function = "cec_ao";
+			};
+		};
+
+		ee_cec_pins: ee_cec {
+			mux {
+				groups = "ee_cec";
+				function = "cec_ao";
+			};
+		};
+	};
+};
+
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
+&cbus {
+	spifc: spi at 8c80 {
+		compatible = "amlogic,meson-gxbb-spifc";
+		reg = <0x0 0x08c80 0x0 0x80>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&clkc CLKID_SPI>;
+		status = "disabled";
+	};
+};
+
+&ethmac {
+	clocks = <&clkc CLKID_ETH>,
+		 <&clkc CLKID_FCLK_DIV2>,
+		 <&clkc CLKID_MPLL2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1";
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
+
+&hiubus {
+	clkc: clock-controller at 0 {
+		compatible = "amlogic,gxbb-clkc";
+		#clock-cells = <1>;
+		reg = <0x0 0x0 0x0 0x3db>;
 	};
 };
 
+&hwrng {
+	clocks = <&clkc CLKID_RNG0>;
+	clock-names = "core";
+};
+
+&i2c_A {
+	clocks = <&clkc CLKID_I2C>;
+};
+
+&i2c_AO {
+	clocks = <&clkc CLKID_AO_I2C>;
+};
+
+&i2c_B {
+	clocks = <&clkc CLKID_I2C>;
+};
+
+&i2c_C {
+	clocks = <&clkc CLKID_I2C>;
+};
+
 &periphs {
 	pinctrl_periphs: pinctrl at 4b0 {
 		compatible = "amlogic,meson-gxbb-periphs-pinctrl";
@@ -262,7 +365,7 @@
 		gpio: bank at 4b0 {
 			reg = <0x0 0x004b0 0x0 0x28>,
 			      <0x0 0x004e8 0x0 0x14>,
-			      <0x0 0x00120 0x0 0x14>,
+			      <0x0 0x00520 0x0 0x14>,
 			      <0x0 0x00430 0x0 0x40>;
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
@@ -290,6 +393,22 @@
 			};
 		};
 
+		spi_pins: spi {
+			mux {
+				groups = "spi_miso",
+					"spi_mosi",
+					"spi_sclk";
+				function = "spi";
+			};
+		};
+
+		spi_ss0_pins: spi-ss0 {
+			mux {
+				groups = "spi_ss0";
+				function = "spi";
+			};
+		};
+
 		sdcard_pins: sdcard {
 			mux {
 				groups = "sdcard_d0",
@@ -521,67 +640,6 @@
 	};
 };
 
-&hiubus {
-	clkc: clock-controller at 0 {
-		compatible = "amlogic,gxbb-clkc";
-		#clock-cells = <1>;
-		reg = <0x0 0x0 0x0 0x3db>;
-	};
-};
-
-&apb {
-	mali: gpu at c0000 {
-		compatible = "amlogic,meson-gxbb-mali", "arm,mali-450";
-		reg = <0x0 0xc0000 0x0 0x40000>;
-		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "gp", "gpmmu", "pp", "pmu",
-			"pp0", "ppmmu0", "pp1", "ppmmu1",
-			"pp2", "ppmmu2";
-		clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
-		clock-names = "bus", "core";
-
-		/*
-		 * Mali clocking is provided by two identical clock paths
-		 * MALI_0 and MALI_1 muxed to a single clock by a glitch
-		 * free mux to safely change frequency while running.
-		 */
-		assigned-clocks = <&clkc CLKID_MALI_0_SEL>,
-				  <&clkc CLKID_MALI_0>,
-				  <&clkc CLKID_MALI>; /* Glitch free mux */
-		assigned-clock-parents = <&clkc CLKID_FCLK_DIV3>,
-					 <0>, /* Do Nothing */
-					 <&clkc CLKID_MALI_0>;
-		assigned-clock-rates = <0>, /* Do Nothing */
-				       <666666666>,
-				       <0>; /* Do Nothing */
-	};
-};
-
-&i2c_A {
-	clocks = <&clkc CLKID_I2C>;
-};
-
-&i2c_AO {
-	clocks = <&clkc CLKID_AO_I2C>;
-};
-
-&i2c_B {
-	clocks = <&clkc CLKID_I2C>;
-};
-
-&i2c_C {
-	clocks = <&clkc CLKID_I2C>;
-};
-
 &saradc {
 	compatible = "amlogic,meson-gxbb-saradc", "amlogic,meson-saradc";
 	clocks = <&xtal>,
@@ -613,6 +671,13 @@
 	clock-names = "core", "clkin0", "clkin1";
 };
 
+&spicc {
+	clocks = <&clkc CLKID_SPICC>;
+	clock-names = "core";
+	resets = <&reset RESET_PERIPHS_SPICC>;
+	num-cs = <1>;
+};
+
 &spifc {
 	clocks = <&clkc CLKID_SPI>;
 };
@@ -620,20 +685,3 @@
 &vpu {
 	compatible = "amlogic,meson-gxbb-vpu", "amlogic,meson-gx-vpu";
 };
-
-&hwrng {
-	clocks = <&clkc CLKID_RNG0>;
-	clock-names = "core";
-};
-
-&hdmi_tx {
-	compatible = "amlogic,meson-gxbb-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
-	resets = <&reset RESET_HDMITX_CAPB3>,
-		 <&reset RESET_HDMI_SYSTEM_RESET>,
-		 <&reset RESET_HDMI_TX>;
-	reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
-	clocks = <&clkc CLKID_HDMI_PCLK>,
-		 <&clkc CLKID_CLK81>,
-		 <&clkc CLKID_GCLK_VENCI_INT0>;
-	clock-names = "isfr", "iahb", "venci";
-};
diff --git a/arch/arm/dts/meson-gxl-mali.dtsi b/arch/arm/dts/meson-gxl-mali.dtsi
new file mode 100644
index 0000000..f06cc23
--- /dev/null
+++ b/arch/arm/dts/meson-gxl-mali.dtsi
@@ -0,0 +1,43 @@
+/*
+ * Copyright (c) 2017 BayLibre SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
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
diff --git a/arch/arm/dts/meson-gxl-s905x-p212.dts b/arch/arm/dts/meson-gxl-s905x-p212.dts
new file mode 100644
index 0000000..6ab17c1
--- /dev/null
+++ b/arch/arm/dts/meson-gxl-s905x-p212.dts
@@ -0,0 +1,95 @@
+/*
+ * Copyright (c) 2016 Endless Computers, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+
+#include "meson-gxl-s905x-p212.dtsi"
+
+/ {
+	compatible = "amlogic,p212", "amlogic,s905x", "amlogic,meson-gxl";
+	model = "Amlogic Meson GXL (S905X) P212 Development Board";
+
+	cvbs-connector {
+		compatible = "composite-video-connector";
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
+&cvbs_vdac_port {
+	cvbs_vdac_out: endpoint {
+		remote-endpoint = <&cvbs_connector_in>;
+	};
+};
+
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
+/* This UART is brought out to the DB9 connector */
+&uart_AO {
+	status = "okay";
+};
diff --git a/arch/arm/dts/meson-gxl-s905x-p212.dtsi b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
new file mode 100644
index 0000000..f3eea8e
--- /dev/null
+++ b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
@@ -0,0 +1,173 @@
+/*
+ * Copyright (c) 2016 Martin Blumenstingl <martin.blumenstingl@googlemail.com>.
+ * Based on meson-gx-p23x-q20x.dtsi:
+ * - Copyright (c) 2016 Endless Computers, Inc.
+ *   Author: Carlo Caione <carlo@endlessm.com>
+ * - Copyright (c) 2016 BayLibre, SAS.
+ *   Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+/* Common DTSI for devices which are based on the P212 reference board. */
+
+#include "meson-gxl-s905x.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart_AO;
+		serial1 = &uart_A;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory at 0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+
+	vddio_boot: regulator-vddio_boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	vcc_3v3: regulator-vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+};
+
+&ethmac {
+	status = "okay";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
+/* Wireless SDIO Module */
+&sd_emmc_a {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* SD card */
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-names = "default";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+/* eMMC */
+&sd_emmc_c {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>;
+	pinctrl-names = "default";
+
+	bus-width = <8>;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&clkc CLKID_FCLK_DIV4>;
+	clock-names = "clkin0";
+};
+
+/* This is connected to the Bluetooth module: */
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm/dts/meson-gxl-s905x.dtsi b/arch/arm/dts/meson-gxl-s905x.dtsi
new file mode 100644
index 0000000..3314a0b
--- /dev/null
+++ b/arch/arm/dts/meson-gxl-s905x.dtsi
@@ -0,0 +1,55 @@
+/*
+ * Copyright (c) 2016 Endless Computers, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "meson-gxl.dtsi"
+#include "meson-gxl-mali.dtsi"
+
+/ {
+	compatible = "amlogic,s905x", "amlogic,meson-gxl";
+};
+
+/* S905X only has access to its internal PHY */
+&ethmac {
+	phy-mode = "rmii";
+	phy-handle = <&internal_phy>;
+};
diff --git a/arch/arm/dts/meson-gxl.dtsi b/arch/arm/dts/meson-gxl.dtsi
new file mode 100644
index 0000000..8d4f316
--- /dev/null
+++ b/arch/arm/dts/meson-gxl.dtsi
@@ -0,0 +1,628 @@
+/*
+ * Copyright (c) 2016 Endless Computers, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "meson-gx.dtsi"
+#include <dt-bindings/clock/gxbb-clkc.h>
+#include <dt-bindings/gpio/meson-gxl-gpio.h>
+#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
+
+/ {
+	compatible = "amlogic,meson-gxl";
+};
+
+&ethmac {
+	reg = <0x0 0xc9410000 0x0 0x10000
+	       0x0 0xc8834540 0x0 0x4>;
+
+	clocks = <&clkc CLKID_ETH>,
+		 <&clkc CLKID_FCLK_DIV2>,
+		 <&clkc CLKID_MPLL2>;
+	clock-names = "stmmaceth", "clkin0", "clkin1";
+
+	mdio0: mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "snps,dwmac-mdio";
+	};
+};
+
+&aobus {
+	pinctrl_aobus: pinctrl at 14 {
+		compatible = "amlogic,meson-gxl-aobus-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio_ao: bank at 14 {
+			reg = <0x0 0x00014 0x0 0x8>,
+			      <0x0 0x0002c 0x0 0x4>,
+			      <0x0 0x00024 0x0 0x8>;
+			reg-names = "mux", "pull", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_aobus 0 0 14>;
+		};
+
+		uart_ao_a_pins: uart_ao_a {
+			mux {
+				groups = "uart_tx_ao_a", "uart_rx_ao_a";
+				function = "uart_ao";
+			};
+		};
+
+		uart_ao_a_cts_rts_pins: uart_ao_a_cts_rts {
+			mux {
+				groups = "uart_cts_ao_a",
+				       "uart_rts_ao_a";
+				function = "uart_ao";
+			};
+		};
+
+		uart_ao_b_pins: uart_ao_b {
+			mux {
+				groups = "uart_tx_ao_b", "uart_rx_ao_b";
+				function = "uart_ao_b";
+			};
+		};
+
+		uart_ao_b_0_1_pins: uart_ao_b_0_1 {
+			mux {
+				groups = "uart_tx_ao_b_0", "uart_rx_ao_b_1";
+				function = "uart_ao_b";
+			};
+		};
+
+		uart_ao_b_cts_rts_pins: uart_ao_b_cts_rts {
+			mux {
+				groups = "uart_cts_ao_b",
+				       "uart_rts_ao_b";
+				function = "uart_ao_b";
+			};
+		};
+
+		remote_input_ao_pins: remote_input_ao {
+			mux {
+				groups = "remote_input_ao";
+				function = "remote_input_ao";
+			};
+		};
+
+		i2c_ao_pins: i2c_ao {
+			mux {
+				groups = "i2c_sck_ao",
+				       "i2c_sda_ao";
+				function = "i2c_ao";
+			};
+		};
+
+		pwm_ao_a_3_pins: pwm_ao_a_3 {
+			mux {
+				groups = "pwm_ao_a_3";
+				function = "pwm_ao_a";
+			};
+		};
+
+		pwm_ao_a_8_pins: pwm_ao_a_8 {
+			mux {
+				groups = "pwm_ao_a_8";
+				function = "pwm_ao_a";
+			};
+		};
+
+		pwm_ao_b_pins: pwm_ao_b {
+			mux {
+				groups = "pwm_ao_b";
+				function = "pwm_ao_b";
+			};
+		};
+
+		pwm_ao_b_6_pins: pwm_ao_b_6 {
+			mux {
+				groups = "pwm_ao_b_6";
+				function = "pwm_ao_b";
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
+
+		spdif_out_ao_9_pins: spdif_out_ao_9 {
+			mux {
+				groups = "spdif_out_ao_9";
+				function = "spdif_out_ao";
+			};
+		};
+
+		ao_cec_pins: ao_cec {
+			mux {
+				groups = "ao_cec";
+				function = "cec_ao";
+			};
+		};
+
+		ee_cec_pins: ee_cec {
+			mux {
+				groups = "ee_cec";
+				function = "cec_ao";
+			};
+		};
+	};
+};
+
+&hdmi_tx {
+	compatible = "amlogic,meson-gxl-dw-hdmi", "amlogic,meson-gx-dw-hdmi";
+	resets = <&reset RESET_HDMITX_CAPB3>,
+		 <&reset RESET_HDMI_SYSTEM_RESET>,
+		 <&reset RESET_HDMI_TX>;
+	reset-names = "hdmitx_apb", "hdmitx", "hdmitx_phy";
+	clocks = <&clkc CLKID_HDMI_PCLK>,
+		 <&clkc CLKID_CLK81>,
+		 <&clkc CLKID_GCLK_VENCI_INT0>;
+	clock-names = "isfr", "iahb", "venci";
+};
+
+&hiubus {
+	clkc: clock-controller at 0 {
+		compatible = "amlogic,gxl-clkc", "amlogic,gxbb-clkc";
+		#clock-cells = <1>;
+		reg = <0x0 0x0 0x0 0x3db>;
+	};
+};
+
+&i2c_A {
+	clocks = <&clkc CLKID_I2C>;
+};
+
+&i2c_AO {
+	clocks = <&clkc CLKID_AO_I2C>;
+};
+
+&i2c_B {
+	clocks = <&clkc CLKID_I2C>;
+};
+
+&i2c_C {
+	clocks = <&clkc CLKID_I2C>;
+};
+
+&periphs {
+	pinctrl_periphs: pinctrl at 4b0 {
+		compatible = "amlogic,meson-gxl-periphs-pinctrl";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gpio: bank at 4b0 {
+			reg = <0x0 0x004b0 0x0 0x28>,
+			      <0x0 0x004e8 0x0 0x14>,
+			      <0x0 0x00520 0x0 0x14>,
+			      <0x0 0x00430 0x0 0x40>;
+			reg-names = "mux", "pull", "pull-enable", "gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl_periphs 0 10 101>;
+		};
+
+		emmc_pins: emmc {
+			mux {
+				groups = "emmc_nand_d07",
+				       "emmc_cmd",
+				       "emmc_clk",
+				       "emmc_ds";
+				function = "emmc";
+			};
+		};
+
+		nor_pins: nor {
+			mux {
+				groups = "nor_d",
+				       "nor_q",
+				       "nor_c",
+				       "nor_cs";
+				function = "nor";
+			};
+		};
+
+		spi_pins: spi {
+			mux {
+				groups = "spi_miso",
+					"spi_mosi",
+					"spi_sclk";
+				function = "spi";
+			};
+		};
+
+		spi_ss0_pins: spi-ss0 {
+			mux {
+				groups = "spi_ss0";
+				function = "spi";
+			};
+		};
+
+		sdcard_pins: sdcard {
+			mux {
+				groups = "sdcard_d0",
+				       "sdcard_d1",
+				       "sdcard_d2",
+				       "sdcard_d3",
+				       "sdcard_cmd",
+				       "sdcard_clk";
+				function = "sdcard";
+			};
+		};
+
+		sdio_pins: sdio {
+			mux {
+				groups = "sdio_d0",
+				       "sdio_d1",
+				       "sdio_d2",
+				       "sdio_d3",
+				       "sdio_cmd",
+				       "sdio_clk";
+				function = "sdio";
+			};
+		};
+
+		sdio_irq_pins: sdio_irq {
+			mux {
+				groups = "sdio_irq";
+				function = "sdio";
+			};
+		};
+
+		uart_a_pins: uart_a {
+			mux {
+				groups = "uart_tx_a",
+				       "uart_rx_a";
+				function = "uart_a";
+			};
+		};
+
+		uart_a_cts_rts_pins: uart_a_cts_rts {
+			mux {
+				groups = "uart_cts_a",
+				       "uart_rts_a";
+				function = "uart_a";
+			};
+		};
+
+		uart_b_pins: uart_b {
+			mux {
+				groups = "uart_tx_b",
+				       "uart_rx_b";
+				function = "uart_b";
+			};
+		};
+
+		uart_b_cts_rts_pins: uart_b_cts_rts {
+			mux {
+				groups = "uart_cts_b",
+				       "uart_rts_b";
+				function = "uart_b";
+			};
+		};
+
+		uart_c_pins: uart_c {
+			mux {
+				groups = "uart_tx_c",
+				       "uart_rx_c";
+				function = "uart_c";
+			};
+		};
+
+		uart_c_cts_rts_pins: uart_c_cts_rts {
+			mux {
+				groups = "uart_cts_c",
+				       "uart_rts_c";
+				function = "uart_c";
+			};
+		};
+
+		i2c_a_pins: i2c_a {
+			mux {
+				groups = "i2c_sck_a",
+				     "i2c_sda_a";
+				function = "i2c_a";
+			};
+		};
+
+		i2c_b_pins: i2c_b {
+			mux {
+				groups = "i2c_sck_b",
+				      "i2c_sda_b";
+				function = "i2c_b";
+			};
+		};
+
+		i2c_c_pins: i2c_c {
+			mux {
+				groups = "i2c_sck_c",
+				      "i2c_sda_c";
+				function = "i2c_c";
+			};
+		};
+
+		eth_pins: eth_c {
+			mux {
+				groups = "eth_mdio",
+				       "eth_mdc",
+				       "eth_clk_rx_clk",
+				       "eth_rx_dv",
+				       "eth_rxd0",
+				       "eth_rxd1",
+				       "eth_rxd2",
+				       "eth_rxd3",
+				       "eth_rgmii_tx_clk",
+				       "eth_tx_en",
+				       "eth_txd0",
+				       "eth_txd1",
+				       "eth_txd2",
+				       "eth_txd3";
+				function = "eth";
+			};
+		};
+
+		eth_link_led_pins: eth_link_led {
+			mux {
+				groups = "eth_link_led";
+				function = "eth_led";
+			};
+		};
+
+		eth_act_led_pins: eth_act_led {
+			mux {
+				groups = "eth_act_led";
+				function = "eth_led";
+			};
+		};
+		
+		pwm_a_pins: pwm_a {
+			mux {
+				groups = "pwm_a";
+				function = "pwm_a";
+			};
+		};
+
+		pwm_b_pins: pwm_b {
+			mux {
+				groups = "pwm_b";
+				function = "pwm_b";
+			};
+		};
+
+		pwm_c_pins: pwm_c {
+			mux {
+				groups = "pwm_c";
+				function = "pwm_c";
+			};
+		};
+
+		pwm_d_pins: pwm_d {
+			mux {
+				groups = "pwm_d";
+				function = "pwm_d";
+			};
+		};
+
+		pwm_e_pins: pwm_e {
+			mux {
+				groups = "pwm_e";
+				function = "pwm_e";
+			};
+		};
+
+		pwm_f_clk_pins: pwm_f_clk {
+			mux {
+				groups = "pwm_f_clk";
+				function = "pwm_f";
+			};
+		};
+
+		pwm_f_x_pins: pwm_f_x {
+			mux {
+				groups = "pwm_f_x";
+				function = "pwm_f";
+			};
+		};
+
+		hdmi_hpd_pins: hdmi_hpd {
+			mux {
+				groups = "hdmi_hpd";
+				function = "hdmi_hpd";
+			};
+		};
+
+		hdmi_i2c_pins: hdmi_i2c {
+			mux {
+				groups = "hdmi_sda", "hdmi_scl";
+				function = "hdmi_i2c";
+			};
+		};
+
+		i2s_am_clk_pins: i2s_am_clk {
+			mux {
+				groups = "i2s_am_clk";
+				function = "i2s_out";
+			};
+		};
+
+		i2s_out_ao_clk_pins: i2s_out_ao_clk {
+			mux {
+				groups = "i2s_out_ao_clk";
+				function = "i2s_out";
+			};
+		};
+
+		i2s_out_lr_clk_pins: i2s_out_lr_clk {
+			mux {
+				groups = "i2s_out_lr_clk";
+				function = "i2s_out";
+			};
+		};
+
+		i2s_out_ch01_pins: i2s_out_ch01 {
+			mux {
+				groups = "i2s_out_ch01";
+				function = "i2s_out";
+			};
+		};
+		i2sout_ch23_z_pins: i2sout_ch23_z {
+			mux {
+				groups = "i2sout_ch23_z";
+				function = "i2s_out";
+			};
+		};
+
+		i2sout_ch45_z_pins: i2sout_ch45_z {
+			mux {
+				groups = "i2sout_ch45_z";
+				function = "i2s_out";
+			};
+		};
+
+		i2sout_ch67_z_pins: i2sout_ch67_z {
+			mux {
+				groups = "i2sout_ch67_z";
+				function = "i2s_out";
+			};
+		};
+
+		spdif_out_h_pins: spdif_out_ao_h {
+			mux {
+				groups = "spdif_out_h";
+				function = "spdif_out";
+			};
+		};
+	};
+
+	eth-phy-mux {
+		compatible = "mdio-mux-mmioreg", "mdio-mux";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x0 0x55c 0x0 0x4>;
+		mux-mask = <0xffffffff>;
+		mdio-parent-bus = <&mdio0>;
+
+		internal_mdio: mdio at e40908ff {
+			reg = <0xe40908ff>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			internal_phy: ethernet-phy at 8 {
+				compatible = "ethernet-phy-id0181.4400", "ethernet-phy-ieee802.3-c22";
+				reg = <8>;
+				max-speed = <100>;
+			};
+		};
+
+		external_mdio: mdio at 2009087f {
+			reg = <0x2009087f>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
+&saradc {
+	compatible = "amlogic,meson-gxl-saradc", "amlogic,meson-saradc";
+	clocks = <&xtal>,
+		 <&clkc CLKID_SAR_ADC>,
+		 <&clkc CLKID_SANA>,
+		 <&clkc CLKID_SAR_ADC_CLK>,
+		 <&clkc CLKID_SAR_ADC_SEL>;
+	clock-names = "clkin", "core", "sana", "adc_clk", "adc_sel";
+};
+
+&sd_emmc_a {
+	clocks = <&clkc CLKID_SD_EMMC_A>,
+		 <&xtal>,
+		 <&clkc CLKID_FCLK_DIV2>;
+	clock-names = "core", "clkin0", "clkin1";
+};
+
+&sd_emmc_b {
+	clocks = <&clkc CLKID_SD_EMMC_B>,
+		 <&xtal>,
+		 <&clkc CLKID_FCLK_DIV2>;
+       clock-names = "core", "clkin0", "clkin1";
+};
+
+&sd_emmc_c {
+	clocks = <&clkc CLKID_SD_EMMC_C>,
+		 <&xtal>,
+		 <&clkc CLKID_FCLK_DIV2>;
+	clock-names = "core", "clkin0", "clkin1";
+};
+
+&spicc {
+	clocks = <&clkc CLKID_SPICC>;
+	clock-names = "core";
+	resets = <&reset RESET_PERIPHS_SPICC>;
+	num-cs = <1>;
+};
+
+&spifc {
+	clocks = <&clkc CLKID_SPI>;
+};
+
+&vpu {
+	compatible = "amlogic,meson-gxl-vpu", "amlogic,meson-gx-vpu";
+};
diff --git a/include/dt-bindings/gpio/meson-gxl-gpio.h b/include/dt-bindings/gpio/meson-gxl-gpio.h
new file mode 100644
index 0000000..684d0d7
--- /dev/null
+++ b/include/dt-bindings/gpio/meson-gxl-gpio.h
@@ -0,0 +1,131 @@
+/*
+ * GPIO definitions for Amlogic Meson GXL SoCs
+ *
+ * Copyright (C) 2016 Endless Mobile, Inc.
+ * Author: Carlo Caione <carlo@endlessm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * version 2 as published by the Free Software Foundation.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef _DT_BINDINGS_MESON_GXL_GPIO_H
+#define _DT_BINDINGS_MESON_GXL_GPIO_H
+
+#define	GPIOAO_0	0
+#define	GPIOAO_1	1
+#define	GPIOAO_2	2
+#define	GPIOAO_3	3
+#define	GPIOAO_4	4
+#define	GPIOAO_5	5
+#define	GPIOAO_6	6
+#define	GPIOAO_7	7
+#define	GPIOAO_8	8
+#define	GPIOAO_9	9
+
+#define	GPIOZ_0		0
+#define	GPIOZ_1		1
+#define	GPIOZ_2		2
+#define	GPIOZ_3		3
+#define	GPIOZ_4		4
+#define	GPIOZ_5		5
+#define	GPIOZ_6		6
+#define	GPIOZ_7		7
+#define	GPIOZ_8		8
+#define	GPIOZ_9		9
+#define	GPIOZ_10	10
+#define	GPIOZ_11	11
+#define	GPIOZ_12	12
+#define	GPIOZ_13	13
+#define	GPIOZ_14	14
+#define	GPIOZ_15	15
+#define	GPIOH_0		16
+#define	GPIOH_1		17
+#define	GPIOH_2		18
+#define	GPIOH_3		19
+#define	GPIOH_4		20
+#define	GPIOH_5		21
+#define	GPIOH_6		22
+#define	GPIOH_7		23
+#define	GPIOH_8		24
+#define	GPIOH_9		25
+#define	BOOT_0		26
+#define	BOOT_1		27
+#define	BOOT_2		28
+#define	BOOT_3		29
+#define	BOOT_4		30
+#define	BOOT_5		31
+#define	BOOT_6		32
+#define	BOOT_7		33
+#define	BOOT_8		34
+#define	BOOT_9		35
+#define	BOOT_10		36
+#define	BOOT_11		37
+#define	BOOT_12		38
+#define	BOOT_13		39
+#define	BOOT_14		40
+#define	BOOT_15		41
+#define	CARD_0		42
+#define	CARD_1		43
+#define	CARD_2		44
+#define	CARD_3		45
+#define	CARD_4		46
+#define	CARD_5		47
+#define	CARD_6		48
+#define	GPIODV_0	49
+#define	GPIODV_1	50
+#define	GPIODV_2	51
+#define	GPIODV_3	52
+#define	GPIODV_4	53
+#define	GPIODV_5	54
+#define	GPIODV_6	55
+#define	GPIODV_7	56
+#define	GPIODV_8	57
+#define	GPIODV_9	58
+#define	GPIODV_10	59
+#define	GPIODV_11	60
+#define	GPIODV_12	61
+#define	GPIODV_13	62
+#define	GPIODV_14	63
+#define	GPIODV_15	64
+#define	GPIODV_16	65
+#define	GPIODV_17	66
+#define	GPIODV_18	67
+#define	GPIODV_19	68
+#define	GPIODV_20	69
+#define	GPIODV_21	70
+#define	GPIODV_22	71
+#define	GPIODV_23	72
+#define	GPIODV_24	73
+#define	GPIODV_25	74
+#define	GPIODV_26	75
+#define	GPIODV_27	76
+#define	GPIODV_28	77
+#define	GPIODV_29	78
+#define	GPIOX_0		79
+#define	GPIOX_1		80
+#define	GPIOX_2		81
+#define	GPIOX_3		82
+#define	GPIOX_4		83
+#define	GPIOX_5		84
+#define	GPIOX_6		85
+#define	GPIOX_7		86
+#define	GPIOX_8		87
+#define	GPIOX_9		88
+#define	GPIOX_10	89
+#define	GPIOX_11	90
+#define	GPIOX_12	91
+#define	GPIOX_13	92
+#define	GPIOX_14	93
+#define	GPIOX_15	94
+#define	GPIOX_16	95
+#define	GPIOX_17	96
+#define	GPIOX_18	97
+#define	GPIOCLK_0	98
+#define	GPIOCLK_1	99
+#define	GPIO_TEST_N	100
+
+#endif
-- 
2.7.4
