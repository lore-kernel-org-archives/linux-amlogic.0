From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 22 Nov 2018 10:07:36 +0100
Subject: [PATCH u-boot v2 15/19] ARM: dts: Sync Amlogic Meson AXG DT from
 Linux 4.20-rc1
In-Reply-To: <20181122090740.29739-1-narmstrong@baylibre.com>
References: <20181122090740.29739-1-narmstrong@baylibre.com>
Message-ID: <20181122090740.29739-16-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Synchronize the Amlogic AXG Device Tree files and bindings include from
the recent Linux 4.20-rc1, because it includes patches fixing support for
U-boot.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/dts/Makefile                         |    3 +-
 arch/arm/dts/meson-axg-s400.dts               |  554 ++++++
 arch/arm/dts/meson-axg.dtsi                   | 1589 +++++++++++++++++
 include/dt-bindings/clock/axg-aoclkc.h        |   26 +
 include/dt-bindings/clock/axg-audio-clkc.h    |   94 +
 include/dt-bindings/clock/axg-clkc.h          |   76 +
 include/dt-bindings/gpio/meson-axg-gpio.h     |  116 ++
 .../reset/amlogic,meson-axg-audio-arb.h       |   17 +
 .../reset/amlogic,meson-axg-reset.h           |  124 ++
 include/dt-bindings/reset/axg-aoclkc.h        |   20 +
 10 files changed, 2618 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/meson-axg-s400.dts
 create mode 100644 arch/arm/dts/meson-axg.dtsi
 create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
 create mode 100644 include/dt-bindings/clock/axg-audio-clkc.h
 create mode 100644 include/dt-bindings/clock/axg-clkc.h
 create mode 100644 include/dt-bindings/gpio/meson-axg-gpio.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson-axg-reset.h
 create mode 100644 include/dt-bindings/reset/axg-aoclkc.h

diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
index 84b7e5335c..1fa2f2d8dc 100644
--- a/arch/arm/dts/Makefile
+++ b/arch/arm/dts/Makefile
@@ -59,7 +59,8 @@ dtb-$(CONFIG_ARCH_MESON) += \
 	meson-gxl-s905x-p212.dtb \
 	meson-gxl-s905x-libretech-cc.dtb \
 	meson-gxl-s905x-khadas-vim.dtb \
-	meson-gxm-khadas-vim2.dtb
+	meson-gxm-khadas-vim2.dtb \
+	meson-axg-s400.dtb
 dtb-$(CONFIG_TEGRA) += tegra20-harmony.dtb \
 	tegra20-medcom-wide.dtb \
 	tegra20-paz00.dtb \
diff --git a/arch/arm/dts/meson-axg-s400.dts b/arch/arm/dts/meson-axg-s400.dts
new file mode 100644
index 0000000000..18778ada7b
--- /dev/null
+++ b/arch/arm/dts/meson-axg-s400.dts
@@ -0,0 +1,554 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "meson-axg.dtsi"
+#include <dt-bindings/input/input.h>
+
+/ {
+	compatible = "amlogic,s400", "amlogic,a113d", "amlogic,meson-axg";
+	model = "Amlogic Meson AXG S400 Development Board";
+
+	adc_keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+
+		button-next {
+			label = "Next";
+			linux,code = <KEY_NEXT>;
+			press-threshold-microvolt = <1116000>; /* 62% */
+		};
+
+		button-prev {
+			label = "Previous";
+			linux,code = <KEY_PREVIOUS>;
+			press-threshold-microvolt = <900000>; /* 50% */
+		};
+
+		button-wifi {
+			label = "Wifi";
+			linux,code = <KEY_WLAN>;
+			press-threshold-microvolt = <684000>; /* 38% */
+		};
+
+		button-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			press-threshold-microvolt = <468000>; /* 26% */
+		};
+
+		button-down {
+			label = "Volume Down";
+			linux,code = <KEY_VOLUMEDOWN>;
+			press-threshold-microvolt = <252000>; /* 14% */
+		};
+
+		button-voice {
+			label = "Voice";
+			linux,code = <KEY_VOICECOMMAND>;
+			press-threshold-microvolt = <0>; /* 0% */
+		};
+	};
+
+	aliases {
+		serial0 = &uart_AO;
+		serial1 = &uart_A;
+	};
+
+	linein: audio-codec at 0 {
+		#sound-dai-cells = <0>;
+		compatible = "everest,es7241";
+		VDDA-supply = <&vcc_3v3>;
+		VDDP-supply = <&vcc_3v3>;
+		VDDD-supply = <&vcc_3v3>;
+		status = "okay";
+		sound-name-prefix = "Linein";
+	};
+
+	lineout: audio-codec at 1 {
+		#sound-dai-cells = <0>;
+		compatible = "everest,es7154";
+		VDD-supply = <&vcc_3v3>;
+		PVDD-supply = <&vcc_5v>;
+		status = "okay";
+		sound-name-prefix = "Lineout";
+	};
+
+	spdif_dit: audio-codec at 2 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
+	dmics: audio-codec at 3 {
+		#sound-dai-cells = <0>;
+		compatible = "dmic-codec";
+		num-channels = <7>;
+		wakeup-delay-ms = <50>;
+		status = "okay";
+		sound-name-prefix = "MIC";
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory at 0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	main_12v: regulator-main_12v {
+		compatible = "regulator-fixed";
+		regulator-name = "12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+	};
+
+	vcc_3v3: regulator-vcc_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vcc_5v: regulator-vcc_5v {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&main_12v>;
+
+		gpio = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vddao_3v3: regulator-vddao_3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&main_12v>;
+		regulator-always-on;
+	};
+
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	vddio_boot: regulator-vddio_boot {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_BOOT";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	usb_pwr: regulator-usb_pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_PWR";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_5v>;
+
+		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_7 GPIO_ACTIVE_LOW>;
+		clocks = <&wifi32k>;
+		clock-names = "ext_clock";
+	};
+
+	speaker-leds {
+		compatible = "gpio-leds";
+
+		aled1 {
+			label = "speaker:aled1";
+			gpios = <&gpio_speaker 7 0>;
+		};
+
+		aled2 {
+			label = "speaker:aled2";
+			gpios = <&gpio_speaker 6 0>;
+		};
+
+		aled3 {
+			label = "speaker:aled3";
+			gpios = <&gpio_speaker 5 0>;
+		};
+
+		aled4 {
+			label = "speaker:aled4";
+			gpios = <&gpio_speaker 4 0>;
+		};
+
+		aled5 {
+			label = "speaker:aled5";
+			gpios = <&gpio_speaker 3 0>;
+		};
+
+		aled6 {
+			label = "speaker:aled6";
+			gpios = <&gpio_speaker 2 0>;
+		};
+	};
+
+	sound {
+		compatible = "amlogic,axg-sound-card";
+		model = "AXG-S400";
+		audio-aux-devs = <&tdmin_a>, <&tdmin_b>,  <&tdmin_c>,
+				 <&tdmin_lb>, <&tdmout_c>;
+		audio-widgets = "Line", "Lineout",
+				"Line", "Linein",
+				"Speaker", "Speaker1 Left",
+				"Speaker", "Speaker1 Right";
+		audio-routing = "TDMOUT_C IN 0", "FRDDR_A OUT 2",
+				"SPDIFOUT IN 0", "FRDDR_A OUT 3",
+				"TDMOUT_C IN 1", "FRDDR_B OUT 2",
+				"SPDIFOUT IN 1", "FRDDR_B OUT 3",
+				"TDMOUT_C IN 2", "FRDDR_C OUT 2",
+				"SPDIFOUT IN 2", "FRDDR_C OUT 3",
+				"TDM_C Playback", "TDMOUT_C OUT",
+				"TDMIN_A IN 2", "TDM_C Capture",
+				"TDMIN_A IN 5", "TDM_C Loopback",
+				"TDMIN_B IN 2", "TDM_C Capture",
+				"TDMIN_B IN 5", "TDM_C Loopback",
+				"TDMIN_C IN 2", "TDM_C Capture",
+				"TDMIN_C IN 5", "TDM_C Loopback",
+				"TDMIN_LB IN 2", "TDM_C Loopback",
+				"TDMIN_LB IN 5", "TDM_C Capture",
+				"TODDR_A IN 0", "TDMIN_A OUT",
+				"TODDR_B IN 0", "TDMIN_A OUT",
+				"TODDR_C IN 0", "TDMIN_A OUT",
+				"TODDR_A IN 1", "TDMIN_B OUT",
+				"TODDR_B IN 1", "TDMIN_B OUT",
+				"TODDR_C IN 1", "TDMIN_B OUT",
+				"TODDR_A IN 2", "TDMIN_C OUT",
+				"TODDR_B IN 2", "TDMIN_C OUT",
+				"TODDR_C IN 2", "TDMIN_C OUT",
+				"TODDR_A IN 4", "PDM Capture",
+				"TODDR_B IN 4", "PDM Capture",
+				"TODDR_C IN 4", "PDM Capture",
+				"TODDR_A IN 6", "TDMIN_LB OUT",
+				"TODDR_B IN 6", "TDMIN_LB OUT",
+				"TODDR_C IN 6", "TDMIN_LB OUT",
+				"Lineout", "Lineout AOUTL",
+				"Lineout", "Lineout AOUTR",
+				"Speaker1 Left", "SPK1 OUT_A",
+				"Speaker1 Left", "SPK1 OUT_B",
+				"Speaker1 Right", "SPK1 OUT_C",
+				"Speaker1 Right", "SPK1 OUT_D",
+				"Linein AINL", "Linein",
+				"Linein AINR", "Linein";
+		assigned-clocks = <&clkc CLKID_HIFI_PLL>,
+				  <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <589824000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link at 0 {
+			sound-dai = <&frddr_a>;
+		};
+
+		dai-link at 1 {
+			sound-dai = <&frddr_b>;
+		};
+
+		dai-link at 2 {
+			sound-dai = <&frddr_c>;
+		};
+
+		dai-link at 3 {
+			sound-dai = <&toddr_a>;
+		};
+
+		dai-link at 4 {
+			sound-dai = <&toddr_b>;
+		};
+
+		dai-link at 5 {
+			sound-dai = <&toddr_c>;
+		};
+
+		dai-link at 6 {
+			sound-dai = <&tdmif_c>;
+			dai-format = "i2s";
+			dai-tdm-slot-tx-mask-2 = <1 1>;
+			dai-tdm-slot-rx-mask-1 = <1 1>;
+			mclk-fs = <256>;
+
+			codec at 0 {
+				sound-dai = <&lineout>;
+			};
+
+			codec at 1 {
+				sound-dai = <&speaker_amp1>;
+			};
+
+			codec at 2 {
+				sound-dai = <&linein>;
+			};
+
+		};
+
+		dai-link at 7 {
+			sound-dai = <&spdifout>;
+
+			codec {
+				sound-dai = <&spdif_dit>;
+			};
+		};
+
+		dai-link at 8 {
+			sound-dai = <&pdm>;
+
+			codec {
+				sound-dai = <&dmics>;
+			};
+		};
+	};
+
+	wifi32k: wifi32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ab 0 30518 0>; /* PWM_A at 32.768KHz */
+	};
+};
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_rgmii_y_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&eth_phy0>;
+	phy-mode = "rgmii";
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
+&frddr_a {
+	status = "okay";
+};
+
+&frddr_b {
+	status = "okay";
+};
+
+&frddr_c {
+	status = "okay";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
+&i2c1 {
+	status = "okay";
+	pinctrl-0 = <&i2c1_z_pins>;
+	pinctrl-names = "default";
+
+	speaker_amp1: audio-codec at 1b {
+		compatible = "ti,tas5707";
+		reg = <0x1b>;
+		reset-gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		AVDD-supply = <&vcc_3v3>;
+		DVDD-supply = <&vcc_3v3>;
+		PVDD_A-supply = <&main_12v>;
+		PVDD_B-supply = <&main_12v>;
+		PVDD_C-supply = <&main_12v>;
+		PVDD_D-supply = <&main_12v>;
+		sound-name-prefix = "SPK1";
+	};
+};
+
+&i2c_AO {
+	status = "okay";
+	pinctrl-0 = <&i2c_ao_sck_10_pins>, <&i2c_ao_sda_11_pins>;
+	pinctrl-names = "default";
+
+	gpio_speaker: gpio-controller at 1f {
+		compatible = "nxp,pca9557";
+		reg = <0x1f>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&vddao_3v3>;
+	};
+};
+
+&pdm {
+	pinctrl-0 = <&pdm_dclk_a14_pins>, <&pdm_din0_pins>,
+		    <&pdm_din1_pins>, <&pdm_din2_pins>, <&pdm_din3_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm_ab {
+	status = "okay";
+	pinctrl-0 = <&pwm_a_x20_pins>;
+	pinctrl-names = "default";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
+/* wifi module */
+&sd_emmc_b {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&sdio_pwrseq>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+
+	brcmf: wifi at 1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
+};
+
+/* emmc storage */
+&sd_emmc_c {
+	status = "disabled";
+	pinctrl-0 = <&emmc_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
+	max-frequency = <180000000>;
+	non-removable;
+	disable-wp;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vddio_boot>;
+};
+
+&spdifout {
+	pinctrl-0 = <&spdif_out_a20_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&tdmif_a {
+	pinctrl-0 = <&tdma_sclk_pins>, <&tdma_fs_pins>,
+		    <&tdma_din0_pins>, <&tdma_dout0_x15_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&tdmif_b {
+	pinctrl-0 = <&tdmb_sclk_pins>, <&tdmb_fs_pins>,
+		    <&tdmb_din3_pins>, <&mclk_b_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&tdmif_c {
+	pinctrl-0 = <&tdmc_sclk_pins>, <&tdmc_fs_pins>,
+		    <&tdmc_din1_pins>, <&tdmc_dout2_pins>,
+		    <&mclk_c_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&tdmin_a {
+	status = "okay";
+};
+
+&tdmin_b {
+	status = "okay";
+};
+
+&tdmin_c {
+	status = "okay";
+};
+
+&tdmin_lb {
+	status = "okay";
+};
+
+&tdmout_c {
+	status = "okay";
+};
+
+&toddr_a {
+	status = "okay";
+};
+
+&toddr_b {
+	status = "okay";
+};
+
+&toddr_c {
+	status = "okay";
+};
+
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>;
+	pinctrl-names = "default";
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm/dts/meson-axg.dtsi b/arch/arm/dts/meson-axg.dtsi
new file mode 100644
index 0000000000..df017dbd2e
--- /dev/null
+++ b/arch/arm/dts/meson-axg.dtsi
@@ -0,0 +1,1589 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/clock/axg-aoclkc.h>
+#include <dt-bindings/clock/axg-audio-clkc.h>
+#include <dt-bindings/clock/axg-clkc.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/meson-axg-gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
+#include <dt-bindings/reset/amlogic,meson-axg-reset.h>
+
+/ {
+	compatible = "amlogic,meson-axg";
+
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	tdmif_a: audio-controller at 0 {
+		compatible = "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_A";
+		clocks = <&clkc_audio AUD_CLKID_MST_A_MCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_A_LRCLK>;
+		clock-names = "mclk", "sclk", "lrclk";
+		status = "disabled";
+	};
+
+	tdmif_b: audio-controller at 1 {
+		compatible = "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_B";
+		clocks = <&clkc_audio AUD_CLKID_MST_B_MCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_B_LRCLK>;
+		clock-names = "mclk", "sclk", "lrclk";
+		status = "disabled";
+	};
+
+	tdmif_c: audio-controller at 2 {
+		compatible = "amlogic,axg-tdm-iface";
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TDM_C";
+		clocks = <&clkc_audio AUD_CLKID_MST_C_MCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_SCLK>,
+			 <&clkc_audio AUD_CLKID_MST_C_LRCLK>;
+		clock-names = "mclk", "sclk", "lrclk";
+		status = "disabled";
+	};
+
+	ao_alt_xtal: ao_alt_xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <32000000>;
+		clock-output-names = "ao_alt_xtal";
+		#clock-cells = <0>;
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	cpus {
+		#address-cells = <0x2>;
+		#size-cells = <0x0>;
+
+		cpu0: cpu at 0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu at 1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu2: cpu at 2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu3: cpu at 3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 16 MiB reserved for Hardware ROM Firmware */
+		hwrom_reserved: hwrom at 0 {
+			reg = <0x0 0x0 0x0 0x1000000>;
+			no-map;
+		};
+
+		/* Alternate 3 MiB reserved for ARM Trusted Firmware (BL31) */
+		secmon_reserved: secmon at 5000000 {
+			reg = <0x0 0x05000000 0x0 0x300000>;
+			no-map;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ethmac: ethernet at ff3f0000 {
+			compatible = "amlogic,meson-axg-dwmac", "snps,dwmac";
+			reg = <0x0 0xff3f0000 0x0 0x10000
+			       0x0 0xff634540 0x0 0x8>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "macirq";
+			clocks = <&clkc CLKID_ETH>,
+				 <&clkc CLKID_FCLK_DIV2>,
+				 <&clkc CLKID_MPLL2>;
+			clock-names = "stmmaceth", "clkin0", "clkin1";
+			status = "disabled";
+		};
+
+		pdm: audio-controller at ff632000 {
+			compatible = "amlogic,axg-pdm";
+			reg = <0x0 0xff632000 0x0 0x34>;
+			#sound-dai-cells = <0>;
+			sound-name-prefix = "PDM";
+			clocks = <&clkc_audio AUD_CLKID_PDM>,
+				 <&clkc_audio AUD_CLKID_PDM_DCLK>,
+				 <&clkc_audio AUD_CLKID_PDM_SYSCLK>;
+			clock-names = "pclk", "dclk", "sysclk";
+			status = "disabled";
+		};
+
+		periphs: bus at ff634000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xff634000 0x0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xff634000 0x0 0x2000>;
+
+			hwrng: rng at 18 {
+				compatible = "amlogic,meson-rng";
+				reg = <0x0 0x18 0x0 0x4>;
+				clocks = <&clkc CLKID_RNG0>;
+				clock-names = "core";
+			};
+
+			pinctrl_periphs: pinctrl at 480 {
+				compatible = "amlogic,meson-axg-periphs-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio: bank at 480 {
+					reg = <0x0 0x00480 0x0 0x40>,
+					      <0x0 0x004e8 0x0 0x14>,
+					      <0x0 0x00520 0x0 0x14>,
+					      <0x0 0x00430 0x0 0x3c>;
+					reg-names = "mux", "pull", "pull-enable", "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&pinctrl_periphs 0 0 86>;
+				};
+
+				i2c0_pins: i2c0 {
+					mux {
+						groups = "i2c0_sck",
+							 "i2c0_sda";
+						function = "i2c0";
+					};
+				};
+
+				i2c1_x_pins: i2c1_x {
+					mux {
+						groups = "i2c1_sck_x",
+							 "i2c1_sda_x";
+						function = "i2c1";
+					};
+				};
+
+				i2c1_z_pins: i2c1_z {
+					mux {
+						groups = "i2c1_sck_z",
+							 "i2c1_sda_z";
+						function = "i2c1";
+					};
+				};
+
+				i2c2_a_pins: i2c2_a {
+					mux {
+						groups = "i2c2_sck_a",
+							 "i2c2_sda_a";
+						function = "i2c2";
+					};
+				};
+
+				i2c2_x_pins: i2c2_x {
+					mux {
+						groups = "i2c2_sck_x",
+							 "i2c2_sda_x";
+						function = "i2c2";
+					};
+				};
+
+				i2c3_a6_pins: i2c3_a6 {
+					mux {
+						groups = "i2c3_sda_a6",
+							 "i2c3_sck_a7";
+						function = "i2c3";
+					};
+				};
+
+				i2c3_a12_pins: i2c3_a12 {
+					mux {
+						groups = "i2c3_sda_a12",
+							 "i2c3_sck_a13";
+						function = "i2c3";
+					};
+				};
+
+				i2c3_a19_pins: i2c3_a19 {
+					mux {
+						groups = "i2c3_sda_a19",
+							 "i2c3_sck_a20";
+						function = "i2c3";
+					};
+				};
+
+				emmc_pins: emmc {
+					mux {
+						groups = "emmc_nand_d0",
+							 "emmc_nand_d1",
+							 "emmc_nand_d2",
+							 "emmc_nand_d3",
+							 "emmc_nand_d4",
+							 "emmc_nand_d5",
+							 "emmc_nand_d6",
+							 "emmc_nand_d7",
+							 "emmc_clk",
+							 "emmc_cmd",
+							 "emmc_ds";
+						function = "emmc";
+					};
+				};
+
+				emmc_clk_gate_pins: emmc_clk_gate {
+					mux {
+						groups = "BOOT_8";
+						function = "gpio_periphs";
+					};
+					cfg-pull-down {
+						pins = "BOOT_8";
+						bias-pull-down;
+					};
+				};
+
+				eth_rgmii_x_pins: eth-x-rgmii {
+					mux {
+						groups = "eth_mdio_x",
+							 "eth_mdc_x",
+							 "eth_rgmii_rx_clk_x",
+							 "eth_rx_dv_x",
+							 "eth_rxd0_x",
+							 "eth_rxd1_x",
+							 "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txen_x",
+							 "eth_txd0_x",
+							 "eth_txd1_x",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+					};
+				};
+
+				eth_rgmii_y_pins: eth-y-rgmii {
+					mux {
+						groups = "eth_mdio_y",
+							 "eth_mdc_y",
+							 "eth_rgmii_rx_clk_y",
+							 "eth_rx_dv_y",
+							 "eth_rxd0_y",
+							 "eth_rxd1_y",
+							 "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txen_y",
+							 "eth_txd0_y",
+							 "eth_txd1_y",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+					};
+				};
+
+				eth_rmii_x_pins: eth-x-rmii {
+					mux {
+						groups = "eth_mdio_x",
+							 "eth_mdc_x",
+							 "eth_rgmii_rx_clk_x",
+							 "eth_rx_dv_x",
+							 "eth_rxd0_x",
+							 "eth_rxd1_x",
+							 "eth_txen_x",
+							 "eth_txd0_x",
+							 "eth_txd1_x";
+						function = "eth";
+					};
+				};
+
+				eth_rmii_y_pins: eth-y-rmii {
+					mux {
+						groups = "eth_mdio_y",
+							 "eth_mdc_y",
+							 "eth_rgmii_rx_clk_y",
+							 "eth_rx_dv_y",
+							 "eth_rxd0_y",
+							 "eth_rxd1_y",
+							 "eth_txen_y",
+							 "eth_txd0_y",
+							 "eth_txd1_y";
+						function = "eth";
+					};
+				};
+
+				mclk_b_pins: mclk_b {
+					mux {
+						groups = "mclk_b";
+						function = "mclk_b";
+					};
+				};
+
+				mclk_c_pins: mclk_c {
+					mux {
+						groups = "mclk_c";
+						function = "mclk_c";
+					};
+				};
+
+				pdm_dclk_a14_pins: pdm_dclk_a14 {
+					mux {
+						groups = "pdm_dclk_a14";
+						function = "pdm";
+					};
+				};
+
+				pdm_dclk_a19_pins: pdm_dclk_a19 {
+					mux {
+						groups = "pdm_dclk_a19";
+						function = "pdm";
+					};
+				};
+
+				pdm_din0_pins: pdm_din0 {
+					mux {
+						groups = "pdm_din0";
+						function = "pdm";
+					};
+				};
+
+				pdm_din1_pins: pdm_din1 {
+					mux {
+						groups = "pdm_din1";
+						function = "pdm";
+					};
+				};
+
+				pdm_din2_pins: pdm_din2 {
+					mux {
+						groups = "pdm_din2";
+						function = "pdm";
+					};
+				};
+
+				pdm_din3_pins: pdm_din3 {
+					mux {
+						groups = "pdm_din3";
+						function = "pdm";
+					};
+				};
+
+				pwm_a_a_pins: pwm_a_a {
+					mux {
+						groups = "pwm_a_a";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_x18_pins: pwm_a_x18 {
+					mux {
+						groups = "pwm_a_x18";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_x20_pins: pwm_a_x20 {
+					mux {
+						groups = "pwm_a_x20";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_a_z_pins: pwm_a_z {
+					mux {
+						groups = "pwm_a_z";
+						function = "pwm_a";
+					};
+				};
+
+				pwm_b_a_pins: pwm_b_a {
+					mux {
+						groups = "pwm_b_a";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_b_x_pins: pwm_b_x {
+					mux {
+						groups = "pwm_b_x";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_b_z_pins: pwm_b_z {
+					mux {
+						groups = "pwm_b_z";
+						function = "pwm_b";
+					};
+				};
+
+				pwm_c_a_pins: pwm_c_a {
+					mux {
+						groups = "pwm_c_a";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_c_x10_pins: pwm_c_x10 {
+					mux {
+						groups = "pwm_c_x10";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_c_x17_pins: pwm_c_x17 {
+					mux {
+						groups = "pwm_c_x17";
+						function = "pwm_c";
+					};
+				};
+
+				pwm_d_x11_pins: pwm_d_x11 {
+					mux {
+						groups = "pwm_d_x11";
+						function = "pwm_d";
+					};
+				};
+
+				pwm_d_x16_pins: pwm_d_x16 {
+					mux {
+						groups = "pwm_d_x16";
+						function = "pwm_d";
+					};
+				};
+
+				sdio_pins: sdio {
+					mux {
+						groups = "sdio_d0",
+							 "sdio_d1",
+							 "sdio_d2",
+							 "sdio_d3",
+							 "sdio_cmd",
+							 "sdio_clk";
+						function = "sdio";
+					};
+				};
+
+				sdio_clk_gate_pins: sdio_clk_gate {
+					mux {
+						groups = "GPIOX_4";
+						function = "gpio_periphs";
+					};
+					cfg-pull-down {
+						pins = "GPIOX_4";
+						bias-pull-down;
+					};
+				};
+
+				spdif_in_z_pins: spdif_in_z {
+					mux {
+						groups = "spdif_in_z";
+						function = "spdif_in";
+					};
+				};
+
+				spdif_in_a1_pins: spdif_in_a1 {
+					mux {
+						groups = "spdif_in_a1";
+						function = "spdif_in";
+					};
+				};
+
+				spdif_in_a7_pins: spdif_in_a7 {
+					mux {
+						groups = "spdif_in_a7";
+						function = "spdif_in";
+					};
+				};
+
+				spdif_in_a19_pins: spdif_in_a19 {
+					mux {
+						groups = "spdif_in_a19";
+						function = "spdif_in";
+					};
+				};
+
+				spdif_in_a20_pins: spdif_in_a20 {
+					mux {
+						groups = "spdif_in_a20";
+						function = "spdif_in";
+					};
+				};
+
+				spdif_out_a1_pins: spdif_out_a1 {
+					mux {
+						groups = "spdif_out_a1";
+						function = "spdif_out";
+					};
+				};
+
+				spdif_out_a11_pins: spdif_out_a11 {
+					mux {
+						groups = "spdif_out_a11";
+						function = "spdif_out";
+					};
+				};
+
+				spdif_out_a19_pins: spdif_out_a19 {
+					mux {
+						groups = "spdif_out_a19";
+						function = "spdif_out";
+					};
+				};
+
+				spdif_out_a20_pins: spdif_out_a20 {
+					mux {
+						groups = "spdif_out_a20";
+						function = "spdif_out";
+					};
+				};
+
+				spdif_out_z_pins: spdif_out_z {
+					mux {
+						groups = "spdif_out_z";
+						function = "spdif_out";
+					};
+				};
+
+				spi0_pins: spi0 {
+					mux {
+						groups = "spi0_miso",
+							 "spi0_mosi",
+							 "spi0_clk";
+						function = "spi0";
+					};
+				};
+
+				spi0_ss0_pins: spi0_ss0 {
+					mux {
+						groups = "spi0_ss0";
+						function = "spi0";
+					};
+				};
+
+				spi0_ss1_pins: spi0_ss1 {
+					mux {
+						groups = "spi0_ss1";
+						function = "spi0";
+					};
+				};
+
+				spi0_ss2_pins: spi0_ss2 {
+					mux {
+						groups = "spi0_ss2";
+						function = "spi0";
+					};
+				};
+
+				spi1_a_pins: spi1_a {
+					mux {
+						groups = "spi1_miso_a",
+							 "spi1_mosi_a",
+							 "spi1_clk_a";
+						function = "spi1";
+					};
+				};
+
+				spi1_ss0_a_pins: spi1_ss0_a {
+					mux {
+						groups = "spi1_ss0_a";
+						function = "spi1";
+					};
+				};
+
+				spi1_ss1_pins: spi1_ss1 {
+					mux {
+						groups = "spi1_ss1";
+						function = "spi1";
+					};
+				};
+
+				spi1_x_pins: spi1_x {
+					mux {
+						groups = "spi1_miso_x",
+							 "spi1_mosi_x",
+							 "spi1_clk_x";
+						function = "spi1";
+					};
+				};
+
+				spi1_ss0_x_pins: spi1_ss0_x {
+					mux {
+						groups = "spi1_ss0_x";
+						function = "spi1";
+					};
+				};
+
+				tdma_din0_pins: tdma_din0 {
+					mux {
+						groups = "tdma_din0";
+						function = "tdma";
+					};
+				};
+
+				tdma_dout0_x14_pins: tdma_dout0_x14 {
+					mux {
+						groups = "tdma_dout0_x14";
+						function = "tdma";
+					};
+				};
+
+				tdma_dout0_x15_pins: tdma_dout0_x15 {
+					mux {
+						groups = "tdma_dout0_x15";
+						function = "tdma";
+					};
+				};
+
+				tdma_dout1_pins: tdma_dout1 {
+					mux {
+						groups = "tdma_dout1";
+						function = "tdma";
+					};
+				};
+
+				tdma_din1_pins: tdma_din1 {
+					mux {
+						groups = "tdma_din1";
+						function = "tdma";
+					};
+				};
+
+				tdma_fs_pins: tdma_fs {
+					mux {
+						groups = "tdma_fs";
+						function = "tdma";
+					};
+				};
+
+				tdma_fs_slv_pins: tdma_fs_slv {
+					mux {
+						groups = "tdma_fs_slv";
+						function = "tdma";
+					};
+				};
+
+				tdma_sclk_pins: tdma_sclk {
+					mux {
+						groups = "tdma_sclk";
+						function = "tdma";
+					};
+				};
+
+				tdma_sclk_slv_pins: tdma_sclk_slv {
+					mux {
+						groups = "tdma_sclk_slv";
+						function = "tdma";
+					};
+				};
+
+				tdmb_din0_pins: tdmb_din0 {
+					mux {
+						groups = "tdmb_din0";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_din1_pins: tdmb_din1 {
+					mux {
+						groups = "tdmb_din1";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_din2_pins: tdmb_din2 {
+					mux {
+						groups = "tdmb_din2";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_din3_pins: tdmb_din3 {
+					mux {
+						groups = "tdmb_din3";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_dout0_pins: tdmb_dout0 {
+					mux {
+						groups = "tdmb_dout0";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_dout1_pins: tdmb_dout1 {
+					mux {
+						groups = "tdmb_dout1";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_dout2_pins: tdmb_dout2 {
+					mux {
+						groups = "tdmb_dout2";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_dout3_pins: tdmb_dout3 {
+					mux {
+						groups = "tdmb_dout3";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_fs_pins: tdmb_fs {
+					mux {
+						groups = "tdmb_fs";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_fs_slv_pins: tdmb_fs_slv {
+					mux {
+						groups = "tdmb_fs_slv";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_sclk_pins: tdmb_sclk {
+					mux {
+						groups = "tdmb_sclk";
+						function = "tdmb";
+					};
+				};
+
+				tdmb_sclk_slv_pins: tdmb_sclk_slv {
+					mux {
+						groups = "tdmb_sclk_slv";
+						function = "tdmb";
+					};
+				};
+
+				tdmc_fs_pins: tdmc_fs {
+					mux {
+						groups = "tdmc_fs";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_fs_slv_pins: tdmc_fs_slv {
+					mux {
+						groups = "tdmc_fs_slv";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_sclk_pins: tdmc_sclk {
+					mux {
+						groups = "tdmc_sclk";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_sclk_slv_pins: tdmc_sclk_slv {
+					mux {
+						groups = "tdmc_sclk_slv";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_din0_pins: tdmc_din0 {
+					mux {
+						groups = "tdmc_din0";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_din1_pins: tdmc_din1 {
+					mux {
+						groups = "tdmc_din1";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_din2_pins: tdmc_din2 {
+					mux {
+						groups = "tdmc_din2";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_din3_pins: tdmc_din3 {
+					mux {
+						groups = "tdmc_din3";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_dout0_pins: tdmc_dout0 {
+					mux {
+						groups = "tdmc_dout0";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_dout1_pins: tdmc_dout1 {
+					mux {
+						groups = "tdmc_dout1";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_dout2_pins: tdmc_dout2 {
+					mux {
+						groups = "tdmc_dout2";
+						function = "tdmc";
+					};
+				};
+
+				tdmc_dout3_pins: tdmc_dout3 {
+					mux {
+						groups = "tdmc_dout3";
+						function = "tdmc";
+					};
+				};
+
+				uart_a_pins: uart_a {
+					mux {
+						groups = "uart_tx_a",
+							 "uart_rx_a";
+						function = "uart_a";
+					};
+				};
+
+				uart_a_cts_rts_pins: uart_a_cts_rts {
+					mux {
+						groups = "uart_cts_a",
+							 "uart_rts_a";
+						function = "uart_a";
+					};
+				};
+
+				uart_b_x_pins: uart_b_x {
+					mux {
+						groups = "uart_tx_b_x",
+							 "uart_rx_b_x";
+						function = "uart_b";
+					};
+				};
+
+				uart_b_x_cts_rts_pins: uart_b_x_cts_rts {
+					mux {
+						groups = "uart_cts_b_x",
+							 "uart_rts_b_x";
+						function = "uart_b";
+					};
+				};
+
+				uart_b_z_pins: uart_b_z {
+					mux {
+						groups = "uart_tx_b_z",
+							 "uart_rx_b_z";
+						function = "uart_b";
+					};
+				};
+
+				uart_b_z_cts_rts_pins: uart_b_z_cts_rts {
+					mux {
+						groups = "uart_cts_b_z",
+							 "uart_rts_b_z";
+						function = "uart_b";
+					};
+				};
+
+				uart_ao_b_z_pins: uart_ao_b_z {
+					mux {
+						groups = "uart_ao_tx_b_z",
+							 "uart_ao_rx_b_z";
+						function = "uart_ao_b_z";
+					};
+				};
+
+				uart_ao_b_z_cts_rts_pins: uart_ao_b_z_cts_rts {
+					mux {
+						groups = "uart_ao_cts_b_z",
+							 "uart_ao_rts_b_z";
+						function = "uart_ao_b_z";
+					};
+				};
+			};
+		};
+
+		hiubus: bus at ff63c000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xff63c000 0x0 0x1c00>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1c00>;
+
+			sysctrl: system-controller at 0 {
+				compatible = "amlogic,meson-axg-hhi-sysctrl",
+					     "simple-mfd", "syscon";
+				reg = <0 0 0 0x400>;
+
+				clkc: clock-controller {
+					compatible = "amlogic,axg-clkc";
+					#clock-cells = <1>;
+				};
+			};
+		};
+
+		mailbox: mailbox at ff63dc00 {
+			compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
+			reg = <0 0xff63dc00 0 0x400>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>;
+			#mbox-cells = <1>;
+		};
+
+		audio: bus at ff642000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xff642000 0x0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xff642000 0x0 0x2000>;
+
+			clkc_audio: clock-controller at 0 {
+				compatible = "amlogic,axg-audio-clkc";
+				reg = <0x0 0x0 0x0 0xb4>;
+				#clock-cells = <1>;
+
+				clocks = <&clkc CLKID_AUDIO>,
+					 <&clkc CLKID_MPLL0>,
+					 <&clkc CLKID_MPLL1>,
+					 <&clkc CLKID_MPLL2>,
+					 <&clkc CLKID_MPLL3>,
+					 <&clkc CLKID_HIFI_PLL>,
+					 <&clkc CLKID_FCLK_DIV3>,
+					 <&clkc CLKID_FCLK_DIV4>,
+					 <&clkc CLKID_GP0_PLL>;
+				clock-names = "pclk",
+					      "mst_in0",
+					      "mst_in1",
+					      "mst_in2",
+					      "mst_in3",
+					      "mst_in4",
+					      "mst_in5",
+					      "mst_in6",
+					      "mst_in7";
+
+				resets = <&reset RESET_AUDIO>;
+			};
+
+			toddr_a: audio-controller at 100 {
+				compatible = "amlogic,axg-toddr";
+				reg = <0x0 0x100 0x0 0x1c>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "TODDR_A";
+				interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_audio AUD_CLKID_TODDR_A>;
+				resets = <&arb AXG_ARB_TODDR_A>;
+				status = "disabled";
+			};
+
+			toddr_b: audio-controller at 140 {
+				compatible = "amlogic,axg-toddr";
+				reg = <0x0 0x140 0x0 0x1c>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "TODDR_B";
+				interrupts = <GIC_SPI 85 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_audio AUD_CLKID_TODDR_B>;
+				resets = <&arb AXG_ARB_TODDR_B>;
+				status = "disabled";
+			};
+
+			toddr_c: audio-controller at 180 {
+				compatible = "amlogic,axg-toddr";
+				reg = <0x0 0x180 0x0 0x1c>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "TODDR_C";
+				interrupts = <GIC_SPI 86 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_audio AUD_CLKID_TODDR_C>;
+				resets = <&arb AXG_ARB_TODDR_C>;
+				status = "disabled";
+			};
+
+			frddr_a: audio-controller at 1c0 {
+				compatible = "amlogic,axg-frddr";
+				reg = <0x0 0x1c0 0x0 0x1c>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "FRDDR_A";
+				interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
+				resets = <&arb AXG_ARB_FRDDR_A>;
+				status = "disabled";
+			};
+
+			frddr_b: audio-controller at 200 {
+				compatible = "amlogic,axg-frddr";
+				reg = <0x0 0x200 0x0 0x1c>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "FRDDR_B";
+				interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_audio AUD_CLKID_FRDDR_B>;
+				resets = <&arb AXG_ARB_FRDDR_B>;
+				status = "disabled";
+			};
+
+			frddr_c: audio-controller at 240 {
+				compatible = "amlogic,axg-frddr";
+				reg = <0x0 0x240 0x0 0x1c>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "FRDDR_C";
+				interrupts = <GIC_SPI 90 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_audio AUD_CLKID_FRDDR_C>;
+				resets = <&arb AXG_ARB_FRDDR_C>;
+				status = "disabled";
+			};
+
+			arb: reset-controller at 280 {
+				compatible = "amlogic,meson-axg-audio-arb";
+				reg = <0x0 0x280 0x0 0x4>;
+				#reset-cells = <1>;
+				clocks = <&clkc_audio AUD_CLKID_DDR_ARB>;
+			};
+
+			tdmin_a: audio-controller at 300 {
+				compatible = "amlogic,axg-tdmin";
+				reg = <0x0 0x300 0x0 0x40>;
+				sound-name-prefix = "TDMIN_A";
+				clocks = <&clkc_audio AUD_CLKID_TDMIN_A>,
+					 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK>,
+					 <&clkc_audio AUD_CLKID_TDMIN_A_SCLK_SEL>,
+					 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>,
+					 <&clkc_audio AUD_CLKID_TDMIN_A_LRCLK>;
+				clock-names = "pclk", "sclk", "sclk_sel",
+					      "lrclk", "lrclk_sel";
+				status = "disabled";
+			};
+
+			tdmin_b: audio-controller at 340 {
+				compatible = "amlogic,axg-tdmin";
+				reg = <0x0 0x340 0x0 0x40>;
+				sound-name-prefix = "TDMIN_B";
+				clocks = <&clkc_audio AUD_CLKID_TDMIN_B>,
+					 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK>,
+					 <&clkc_audio AUD_CLKID_TDMIN_B_SCLK_SEL>,
+					 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>,
+					 <&clkc_audio AUD_CLKID_TDMIN_B_LRCLK>;
+				clock-names = "pclk", "sclk", "sclk_sel",
+					      "lrclk", "lrclk_sel";
+				status = "disabled";
+			};
+
+			tdmin_c: audio-controller at 380 {
+				compatible = "amlogic,axg-tdmin";
+				reg = <0x0 0x380 0x0 0x40>;
+				sound-name-prefix = "TDMIN_C";
+				clocks = <&clkc_audio AUD_CLKID_TDMIN_C>,
+					 <&clkc_audio AUD_CLKID_TDMIN_C_SCLK>,
+					 <&clkc_audio AUD_CLKID_TDMIN_C_SCLK_SEL>,
+					 <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>,
+					 <&clkc_audio AUD_CLKID_TDMIN_C_LRCLK>;
+				clock-names = "pclk", "sclk", "sclk_sel",
+					      "lrclk", "lrclk_sel";
+				status = "disabled";
+			};
+
+			tdmin_lb: audio-controller at 3c0 {
+				compatible = "amlogic,axg-tdmin";
+				reg = <0x0 0x3c0 0x0 0x40>;
+				sound-name-prefix = "TDMIN_LB";
+				clocks = <&clkc_audio AUD_CLKID_TDMIN_LB>,
+					 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK>,
+					 <&clkc_audio AUD_CLKID_TDMIN_LB_SCLK_SEL>,
+					 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>,
+					 <&clkc_audio AUD_CLKID_TDMIN_LB_LRCLK>;
+				clock-names = "pclk", "sclk", "sclk_sel",
+					      "lrclk", "lrclk_sel";
+				status = "disabled";
+			};
+
+			spdifout: audio-controller at 480 {
+				compatible = "amlogic,axg-spdifout";
+				reg = <0x0 0x480 0x0 0x50>;
+				#sound-dai-cells = <0>;
+				sound-name-prefix = "SPDIFOUT";
+				clocks = <&clkc_audio AUD_CLKID_SPDIFOUT>,
+					 <&clkc_audio AUD_CLKID_SPDIFOUT_CLK>;
+				clock-names = "pclk", "mclk";
+				status = "disabled";
+			};
+
+			tdmout_a: audio-controller at 500 {
+				compatible = "amlogic,axg-tdmout";
+				reg = <0x0 0x500 0x0 0x40>;
+				sound-name-prefix = "TDMOUT_A";
+				clocks = <&clkc_audio AUD_CLKID_TDMOUT_A>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_A_SCLK_SEL>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_A_LRCLK>;
+				clock-names = "pclk", "sclk", "sclk_sel",
+					      "lrclk", "lrclk_sel";
+				status = "disabled";
+			};
+
+			tdmout_b: audio-controller at 540 {
+				compatible = "amlogic,axg-tdmout";
+				reg = <0x0 0x540 0x0 0x40>;
+				sound-name-prefix = "TDMOUT_B";
+				clocks = <&clkc_audio AUD_CLKID_TDMOUT_B>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_B_SCLK_SEL>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_B_LRCLK>;
+				clock-names = "pclk", "sclk", "sclk_sel",
+					      "lrclk", "lrclk_sel";
+				status = "disabled";
+			};
+
+			tdmout_c: audio-controller at 580 {
+				compatible = "amlogic,axg-tdmout";
+				reg = <0x0 0x580 0x0 0x40>;
+				sound-name-prefix = "TDMOUT_C";
+				clocks = <&clkc_audio AUD_CLKID_TDMOUT_C>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_C_SCLK_SEL>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>,
+					 <&clkc_audio AUD_CLKID_TDMOUT_C_LRCLK>;
+				clock-names = "pclk", "sclk", "sclk_sel",
+					      "lrclk", "lrclk_sel";
+				status = "disabled";
+			};
+		};
+
+		aobus: bus at ff800000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xff800000 0x0 0x100000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
+
+			sysctrl_AO: sys-ctrl at 0 {
+				compatible = "amlogic,meson-axg-ao-sysctrl", "simple-mfd", "syscon";
+				reg =  <0x0 0x0 0x0 0x100>;
+
+				clkc_AO: clock-controller {
+					compatible = "amlogic,meson-axg-aoclkc";
+					#clock-cells = <1>;
+					#reset-cells = <1>;
+				};
+			};
+
+			pinctrl_aobus: pinctrl at 14 {
+				compatible = "amlogic,meson-axg-aobus-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio_ao: bank at 14 {
+					reg = <0x0 0x00014 0x0 0x8>,
+					      <0x0 0x0002c 0x0 0x4>,
+					      <0x0 0x00024 0x0 0x8>;
+					reg-names = "mux", "pull", "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&pinctrl_aobus 0 0 15>;
+				};
+
+				i2c_ao_sck_4_pins: i2c_ao_sck_4 {
+					mux {
+						groups = "i2c_ao_sck_4";
+						function = "i2c_ao";
+					};
+				};
+
+				i2c_ao_sck_8_pins: i2c_ao_sck_8 {
+					mux {
+						groups = "i2c_ao_sck_8";
+						function = "i2c_ao";
+					};
+				};
+
+				i2c_ao_sck_10_pins: i2c_ao_sck_10 {
+					mux {
+						groups = "i2c_ao_sck_10";
+						function = "i2c_ao";
+					};
+				};
+
+				i2c_ao_sda_5_pins: i2c_ao_sda_5 {
+					mux {
+						groups = "i2c_ao_sda_5";
+						function = "i2c_ao";
+					};
+				};
+
+				i2c_ao_sda_9_pins: i2c_ao_sda_9 {
+					mux {
+						groups = "i2c_ao_sda_9";
+						function = "i2c_ao";
+					};
+				};
+
+				i2c_ao_sda_11_pins: i2c_ao_sda_11 {
+					mux {
+						groups = "i2c_ao_sda_11";
+						function = "i2c_ao";
+					};
+				};
+
+				remote_input_ao_pins: remote_input_ao {
+					mux {
+						groups = "remote_input_ao";
+						function = "remote_input_ao";
+					};
+				};
+
+				uart_ao_a_pins: uart_ao_a {
+					mux {
+						groups = "uart_ao_tx_a",
+							 "uart_ao_rx_a";
+						function = "uart_ao_a";
+					};
+				};
+
+				uart_ao_a_cts_rts_pins: uart_ao_a_cts_rts {
+					mux {
+						groups = "uart_ao_cts_a",
+							 "uart_ao_rts_a";
+						function = "uart_ao_a";
+					};
+				};
+
+				uart_ao_b_pins: uart_ao_b {
+					mux {
+						groups = "uart_ao_tx_b",
+							 "uart_ao_rx_b";
+						function = "uart_ao_b";
+					};
+				};
+
+				uart_ao_b_cts_rts_pins: uart_ao_b_cts_rts {
+					mux {
+						groups = "uart_ao_cts_b",
+							 "uart_ao_rts_b";
+						function = "uart_ao_b";
+					};
+				};
+			};
+
+			sec_AO: ao-secure at 140 {
+				compatible = "amlogic,meson-gx-ao-secure", "syscon";
+				reg = <0x0 0x140 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
+
+			pwm_AO_cd: pwm at 2000 {
+				compatible = "amlogic,meson-axg-ao-pwm";
+				reg = <0x0 0x02000  0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			uart_AO: serial at 3000 {
+				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
+				reg = <0x0 0x3000 0x0 0x18>;
+				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART1>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			uart_AO_B: serial at 4000 {
+				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
+				reg = <0x0 0x4000 0x0 0x18>;
+				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>, <&clkc_AO CLKID_AO_UART2>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+				status = "disabled";
+			};
+
+			i2c_AO: i2c at 5000 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x05000 0x0 0x20>;
+				interrupts = <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_AO_I2C>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			pwm_AO_ab: pwm at 7000 {
+				compatible = "amlogic,meson-axg-ao-pwm";
+				reg = <0x0 0x07000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			ir: ir at 8000 {
+				compatible = "amlogic,meson-gxbb-ir";
+				reg = <0x0 0x8000 0x0 0x20>;
+				interrupts = <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+			};
+
+			saradc: adc at 9000 {
+				compatible = "amlogic,meson-axg-saradc",
+					"amlogic,meson-saradc";
+				reg = <0x0 0x9000 0x0 0x38>;
+				#io-channel-cells = <1>;
+				interrupts = <GIC_SPI 73 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&xtal>,
+					 <&clkc_AO CLKID_AO_SAR_ADC>,
+					 <&clkc_AO CLKID_AO_SAR_ADC_CLK>,
+					 <&clkc_AO CLKID_AO_SAR_ADC_SEL>;
+				clock-names = "clkin", "core", "adc_clk", "adc_sel";
+				status = "disabled";
+			};
+		};
+
+		gic: interrupt-controller at ffc01000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0xffc01000 0 0x1000>,
+			      <0x0 0xffc02000 0 0x2000>,
+			      <0x0 0xffc04000 0 0x2000>,
+			      <0x0 0xffc06000 0 0x2000>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+		};
+
+		cbus: bus at ffd00000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xffd00000 0x0 0x25000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x25000>;
+
+			reset: reset-controller at 1004 {
+				compatible = "amlogic,meson-axg-reset";
+				reg = <0x0 0x01004 0x0 0x9c>;
+				#reset-cells = <1>;
+			};
+
+			gpio_intc: interrupt-controller at f080 {
+				compatible = "amlogic,meson-gpio-intc";
+				reg = <0x0 0xf080 0x0 0x10>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
+				status = "disabled";
+			};
+
+			pwm_ab: pwm at 1b000 {
+				compatible = "amlogic,meson-axg-ee-pwm";
+				reg = <0x0 0x1b000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm at 1a000 {
+				compatible = "amlogic,meson-axg-ee-pwm";
+				reg = <0x0 0x1a000 0x0 0x20>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			spicc0: spi at 13000 {
+				compatible = "amlogic,meson-axg-spicc";
+				reg = <0x0 0x13000 0x0 0x3c>;
+				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_SPICC0>;
+				clock-names = "core";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			spicc1: spi at 15000 {
+				compatible = "amlogic,meson-axg-spicc";
+				reg = <0x0 0x15000 0x0 0x3c>;
+				interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_SPICC1>;
+				clock-names = "core";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c3: i2c at 1c000 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x1c000 0x0 0x20>;
+				interrupts = <GIC_SPI 39 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_I2C>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c2: i2c at 1d000 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x1d000 0x0 0x20>;
+				interrupts = <GIC_SPI 215 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_I2C>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c1: i2c at 1e000 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x1e000 0x0 0x20>;
+				interrupts = <GIC_SPI 214 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_I2C>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			i2c0: i2c at 1f000 {
+				compatible = "amlogic,meson-axg-i2c";
+				reg = <0x0 0x1f000 0x0 0x20>;
+				interrupts = <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc CLKID_I2C>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
+			uart_B: serial at 23000 {
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x23000 0x0 0x18>;
+				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+			};
+
+			uart_A: serial at 24000 {
+				compatible = "amlogic,meson-gx-uart";
+				reg = <0x0 0x24000 0x0 0x18>;
+				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;
+				clock-names = "xtal", "pclk", "baud";
+			};
+		};
+
+		apb: bus at ffe00000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xffe00000 0x0 0x200000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x200000>;
+
+			sd_emmc_b: sd at 5000 {
+				compatible = "amlogic,meson-axg-mmc";
+				reg = <0x0 0x5000 0x0 0x800>;
+				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+				clocks = <&clkc CLKID_SD_EMMC_B>,
+					<&clkc CLKID_SD_EMMC_B_CLK0>,
+					<&clkc CLKID_FCLK_DIV2>;
+				clock-names = "core", "clkin0", "clkin1";
+				resets = <&reset RESET_SD_EMMC_B>;
+			};
+
+			sd_emmc_c: mmc at 7000 {
+				compatible = "amlogic,meson-axg-mmc";
+				reg = <0x0 0x7000 0x0 0x800>;
+				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+				clocks = <&clkc CLKID_SD_EMMC_C>,
+					<&clkc CLKID_SD_EMMC_C_CLK0>,
+					<&clkc CLKID_FCLK_DIV2>;
+				clock-names = "core", "clkin0", "clkin1";
+				resets = <&reset RESET_SD_EMMC_C>;
+			};
+		};
+
+		sram: sram at fffc0000 {
+			compatible = "amlogic,meson-axg-sram", "mmio-sram";
+			reg = <0x0 0xfffc0000 0x0 0x20000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x0 0xfffc0000 0x20000>;
+
+			cpu_scp_lpri: scp-shmem at 0 {
+				compatible = "amlogic,meson-axg-scp-shmem";
+				reg = <0x13000 0x400>;
+			};
+
+			cpu_scp_hpri: scp-shmem at 200 {
+				compatible = "amlogic,meson-axg-scp-shmem";
+				reg = <0x13400 0x400>;
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	xtal: xtal-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
+};
diff --git a/include/dt-bindings/clock/axg-aoclkc.h b/include/dt-bindings/clock/axg-aoclkc.h
new file mode 100644
index 0000000000..61955016a5
--- /dev/null
+++ b/include/dt-bindings/clock/axg-aoclkc.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * Copyright (c) 2018 Amlogic, inc.
+ * Author: Qiufang Dai <qiufang.dai@amlogic.com>
+ */
+
+#ifndef DT_BINDINGS_CLOCK_AMLOGIC_MESON_AXG_AOCLK
+#define DT_BINDINGS_CLOCK_AMLOGIC_MESON_AXG_AOCLK
+
+#define CLKID_AO_REMOTE		0
+#define CLKID_AO_I2C_MASTER	1
+#define CLKID_AO_I2C_SLAVE	2
+#define CLKID_AO_UART1		3
+#define CLKID_AO_UART2		4
+#define CLKID_AO_IR_BLASTER	5
+#define CLKID_AO_SAR_ADC	6
+#define CLKID_AO_CLK81		7
+#define CLKID_AO_SAR_ADC_SEL	8
+#define CLKID_AO_SAR_ADC_DIV	9
+#define CLKID_AO_SAR_ADC_CLK	10
+#define CLKID_AO_ALT_XTAL	11
+
+#endif
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
new file mode 100644
index 0000000000..fd9c362099
--- /dev/null
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2018 Baylibre SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef __AXG_AUDIO_CLKC_BINDINGS_H
+#define __AXG_AUDIO_CLKC_BINDINGS_H
+
+#define AUD_CLKID_SLV_SCLK0		9
+#define AUD_CLKID_SLV_SCLK1		10
+#define AUD_CLKID_SLV_SCLK2		11
+#define AUD_CLKID_SLV_SCLK3		12
+#define AUD_CLKID_SLV_SCLK4		13
+#define AUD_CLKID_SLV_SCLK5		14
+#define AUD_CLKID_SLV_SCLK6		15
+#define AUD_CLKID_SLV_SCLK7		16
+#define AUD_CLKID_SLV_SCLK8		17
+#define AUD_CLKID_SLV_SCLK9		18
+#define AUD_CLKID_SLV_LRCLK0		19
+#define AUD_CLKID_SLV_LRCLK1		20
+#define AUD_CLKID_SLV_LRCLK2		21
+#define AUD_CLKID_SLV_LRCLK3		22
+#define AUD_CLKID_SLV_LRCLK4		23
+#define AUD_CLKID_SLV_LRCLK5		24
+#define AUD_CLKID_SLV_LRCLK6		25
+#define AUD_CLKID_SLV_LRCLK7		26
+#define AUD_CLKID_SLV_LRCLK8		27
+#define AUD_CLKID_SLV_LRCLK9		28
+#define AUD_CLKID_DDR_ARB		29
+#define AUD_CLKID_PDM			30
+#define AUD_CLKID_TDMIN_A		31
+#define AUD_CLKID_TDMIN_B		32
+#define AUD_CLKID_TDMIN_C		33
+#define AUD_CLKID_TDMIN_LB		34
+#define AUD_CLKID_TDMOUT_A		35
+#define AUD_CLKID_TDMOUT_B		36
+#define AUD_CLKID_TDMOUT_C		37
+#define AUD_CLKID_FRDDR_A		38
+#define AUD_CLKID_FRDDR_B		39
+#define AUD_CLKID_FRDDR_C		40
+#define AUD_CLKID_TODDR_A		41
+#define AUD_CLKID_TODDR_B		42
+#define AUD_CLKID_TODDR_C		43
+#define AUD_CLKID_LOOPBACK		44
+#define AUD_CLKID_SPDIFIN		45
+#define AUD_CLKID_SPDIFOUT		46
+#define AUD_CLKID_RESAMPLE		47
+#define AUD_CLKID_POWER_DETECT		48
+#define AUD_CLKID_MST_A_MCLK		49
+#define AUD_CLKID_MST_B_MCLK		50
+#define AUD_CLKID_MST_C_MCLK		51
+#define AUD_CLKID_MST_D_MCLK		52
+#define AUD_CLKID_MST_E_MCLK		53
+#define AUD_CLKID_MST_F_MCLK		54
+#define AUD_CLKID_SPDIFOUT_CLK		55
+#define AUD_CLKID_SPDIFIN_CLK		56
+#define AUD_CLKID_PDM_DCLK		57
+#define AUD_CLKID_PDM_SYSCLK		58
+#define AUD_CLKID_MST_A_SCLK		79
+#define AUD_CLKID_MST_B_SCLK		80
+#define AUD_CLKID_MST_C_SCLK		81
+#define AUD_CLKID_MST_D_SCLK		82
+#define AUD_CLKID_MST_E_SCLK		83
+#define AUD_CLKID_MST_F_SCLK		84
+#define AUD_CLKID_MST_A_LRCLK		86
+#define AUD_CLKID_MST_B_LRCLK		87
+#define AUD_CLKID_MST_C_LRCLK		88
+#define AUD_CLKID_MST_D_LRCLK		89
+#define AUD_CLKID_MST_E_LRCLK		90
+#define AUD_CLKID_MST_F_LRCLK		91
+#define AUD_CLKID_TDMIN_A_SCLK_SEL	116
+#define AUD_CLKID_TDMIN_B_SCLK_SEL	117
+#define AUD_CLKID_TDMIN_C_SCLK_SEL	118
+#define AUD_CLKID_TDMIN_LB_SCLK_SEL	119
+#define AUD_CLKID_TDMOUT_A_SCLK_SEL	120
+#define AUD_CLKID_TDMOUT_B_SCLK_SEL	121
+#define AUD_CLKID_TDMOUT_C_SCLK_SEL	122
+#define AUD_CLKID_TDMIN_A_SCLK		123
+#define AUD_CLKID_TDMIN_B_SCLK		124
+#define AUD_CLKID_TDMIN_C_SCLK		125
+#define AUD_CLKID_TDMIN_LB_SCLK		126
+#define AUD_CLKID_TDMOUT_A_SCLK		127
+#define AUD_CLKID_TDMOUT_B_SCLK		128
+#define AUD_CLKID_TDMOUT_C_SCLK		129
+#define AUD_CLKID_TDMIN_A_LRCLK		130
+#define AUD_CLKID_TDMIN_B_LRCLK		131
+#define AUD_CLKID_TDMIN_C_LRCLK		132
+#define AUD_CLKID_TDMIN_LB_LRCLK	133
+#define AUD_CLKID_TDMOUT_A_LRCLK	134
+#define AUD_CLKID_TDMOUT_B_LRCLK	135
+#define AUD_CLKID_TDMOUT_C_LRCLK	136
+
+#endif /* __AXG_AUDIO_CLKC_BINDINGS_H */
diff --git a/include/dt-bindings/clock/axg-clkc.h b/include/dt-bindings/clock/axg-clkc.h
new file mode 100644
index 0000000000..fd1f938c38
--- /dev/null
+++ b/include/dt-bindings/clock/axg-clkc.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Meson-AXG clock tree IDs
+ *
+ * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __AXG_CLKC_H
+#define __AXG_CLKC_H
+
+#define CLKID_SYS_PLL				0
+#define CLKID_FIXED_PLL				1
+#define CLKID_FCLK_DIV2				2
+#define CLKID_FCLK_DIV3				3
+#define CLKID_FCLK_DIV4				4
+#define CLKID_FCLK_DIV5				5
+#define CLKID_FCLK_DIV7				6
+#define CLKID_GP0_PLL				7
+#define CLKID_CLK81				10
+#define CLKID_MPLL0				11
+#define CLKID_MPLL1				12
+#define CLKID_MPLL2				13
+#define CLKID_MPLL3				14
+#define CLKID_DDR				15
+#define CLKID_AUDIO_LOCKER			16
+#define CLKID_MIPI_DSI_HOST			17
+#define CLKID_ISA				18
+#define CLKID_PL301				19
+#define CLKID_PERIPHS				20
+#define CLKID_SPICC0				21
+#define CLKID_I2C				22
+#define CLKID_RNG0				23
+#define CLKID_UART0				24
+#define CLKID_MIPI_DSI_PHY			25
+#define CLKID_SPICC1				26
+#define CLKID_PCIE_A				27
+#define CLKID_PCIE_B				28
+#define CLKID_HIU_IFACE				29
+#define CLKID_ASSIST_MISC			30
+#define CLKID_SD_EMMC_B				31
+#define CLKID_SD_EMMC_C				32
+#define CLKID_DMA				33
+#define CLKID_SPI				34
+#define CLKID_AUDIO				35
+#define CLKID_ETH				36
+#define CLKID_UART1				37
+#define CLKID_G2D				38
+#define CLKID_USB0				39
+#define CLKID_USB1				40
+#define CLKID_RESET				41
+#define CLKID_USB				42
+#define CLKID_AHB_ARB0				43
+#define CLKID_EFUSE				44
+#define CLKID_BOOT_ROM				45
+#define CLKID_AHB_DATA_BUS			46
+#define CLKID_AHB_CTRL_BUS			47
+#define CLKID_USB1_DDR_BRIDGE			48
+#define CLKID_USB0_DDR_BRIDGE			49
+#define CLKID_MMC_PCLK				50
+#define CLKID_VPU_INTR				51
+#define CLKID_SEC_AHB_AHB3_BRIDGE		52
+#define CLKID_GIC				53
+#define CLKID_AO_MEDIA_CPU			54
+#define CLKID_AO_AHB_SRAM			55
+#define CLKID_AO_AHB_BUS			56
+#define CLKID_AO_IFACE				57
+#define CLKID_AO_I2C				58
+#define CLKID_SD_EMMC_B_CLK0			59
+#define CLKID_SD_EMMC_C_CLK0			60
+#define CLKID_HIFI_PLL				69
+#define CLKID_PCIE_CML_EN0			79
+#define CLKID_PCIE_CML_EN1			80
+#define CLKID_MIPI_ENABLE			81
+#define CLKID_GEN_CLK				84
+
+#endif /* __AXG_CLKC_H */
diff --git a/include/dt-bindings/gpio/meson-axg-gpio.h b/include/dt-bindings/gpio/meson-axg-gpio.h
new file mode 100644
index 0000000000..25bb1fffa9
--- /dev/null
+++ b/include/dt-bindings/gpio/meson-axg-gpio.h
@@ -0,0 +1,116 @@
+/*
+ * Copyright (c) 2017 Amlogic, Inc. All rights reserved.
+ * Author: Xingyu Chen <xingyu.chen@amlogic.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0+
+ */
+
+#ifndef _DT_BINDINGS_MESON_AXG_GPIO_H
+#define _DT_BINDINGS_MESON_AXG_GPIO_H
+
+/* First GPIO chip */
+#define GPIOAO_0	0
+#define GPIOAO_1	1
+#define GPIOAO_2	2
+#define GPIOAO_3	3
+#define GPIOAO_4	4
+#define GPIOAO_5	5
+#define GPIOAO_6	6
+#define GPIOAO_7	7
+#define GPIOAO_8	8
+#define GPIOAO_9	9
+#define GPIOAO_10	10
+#define GPIOAO_11	11
+#define GPIOAO_12	12
+#define GPIOAO_13	13
+#define GPIO_TEST_N 14
+
+/* Second GPIO chip */
+#define GPIOZ_0		0
+#define GPIOZ_1		1
+#define GPIOZ_2		2
+#define GPIOZ_3		3
+#define GPIOZ_4		4
+#define GPIOZ_5		5
+#define GPIOZ_6		6
+#define GPIOZ_7		7
+#define GPIOZ_8		8
+#define GPIOZ_9		9
+#define GPIOZ_10	10
+#define BOOT_0		11
+#define BOOT_1		12
+#define BOOT_2		13
+#define BOOT_3		14
+#define BOOT_4		15
+#define BOOT_5		16
+#define BOOT_6		17
+#define BOOT_7		18
+#define BOOT_8		19
+#define BOOT_9		20
+#define BOOT_10		21
+#define BOOT_11		22
+#define BOOT_12		23
+#define BOOT_13		24
+#define BOOT_14		25
+#define GPIOA_0	    26
+#define GPIOA_1		27
+#define GPIOA_2		28
+#define GPIOA_3		29
+#define GPIOA_4		30
+#define GPIOA_5		31
+#define GPIOA_6		32
+#define GPIOA_7		33
+#define GPIOA_8		34
+#define GPIOA_9		35
+#define GPIOA_10	36
+#define GPIOA_11	37
+#define GPIOA_12	38
+#define GPIOA_13	39
+#define GPIOA_14	40
+#define GPIOA_15	41
+#define GPIOA_16	42
+#define GPIOA_17	43
+#define GPIOA_18	44
+#define GPIOA_19	45
+#define GPIOA_20	46
+#define GPIOX_0		47
+#define GPIOX_1		48
+#define GPIOX_2		49
+#define GPIOX_3		50
+#define GPIOX_4		51
+#define GPIOX_5		52
+#define GPIOX_6		53
+#define GPIOX_7		54
+#define GPIOX_8		55
+#define GPIOX_9		56
+#define GPIOX_10	57
+#define GPIOX_11	58
+#define GPIOX_12	59
+#define GPIOX_13	60
+#define GPIOX_14	61
+#define GPIOX_15	62
+#define GPIOX_16	63
+#define GPIOX_17	64
+#define GPIOX_18	65
+#define GPIOX_19	66
+#define GPIOX_20	67
+#define GPIOX_21	68
+#define GPIOX_22	69
+#define GPIOY_0		70
+#define GPIOY_1		71
+#define GPIOY_2		72
+#define GPIOY_3		73
+#define GPIOY_4		74
+#define GPIOY_5		75
+#define GPIOY_6		76
+#define GPIOY_7		77
+#define GPIOY_8		78
+#define GPIOY_9		79
+#define GPIOY_10	80
+#define GPIOY_11	81
+#define GPIOY_12	82
+#define GPIOY_13	83
+#define GPIOY_14	84
+#define GPIOY_15	85
+
+#endif /* _DT_BINDINGS_MESON_AXG_GPIO_H */
diff --git a/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h b/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
new file mode 100644
index 0000000000..05c3636787
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT)
+ *
+ * Copyright (c) 2018 Baylibre SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H
+#define _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H
+
+#define AXG_ARB_TODDR_A	0
+#define AXG_ARB_TODDR_B	1
+#define AXG_ARB_TODDR_C	2
+#define AXG_ARB_FRDDR_A	3
+#define AXG_ARB_FRDDR_B	4
+#define AXG_ARB_FRDDR_C	5
+
+#endif /* _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H */
diff --git a/include/dt-bindings/reset/amlogic,meson-axg-reset.h b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
new file mode 100644
index 0000000000..ad6f55dabd
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson-axg-reset.h
@@ -0,0 +1,124 @@
+/*
+ *
+ * Copyright (c) 2016 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * Copyright (c) 2017 Amlogic, inc.
+ * Author: Yixun Lan <yixun.lan@amlogic.com>
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR BSD)
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON_AXG_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON_AXG_RESET_H
+
+/*	RESET0					*/
+#define RESET_HIU			0
+#define RESET_PCIE_A			1
+#define RESET_PCIE_B			2
+#define RESET_DDR_TOP			3
+/*					4	*/
+#define RESET_VIU			5
+#define RESET_PCIE_PHY			6
+#define RESET_PCIE_APB			7
+/*					8	*/
+/*					9	*/
+#define RESET_VENC			10
+#define RESET_ASSIST			11
+/*					12	*/
+#define RESET_VCBUS			13
+/*					14	*/
+/*					15	*/
+#define RESET_GIC			16
+#define RESET_CAPB3_DECODE		17
+/*					18-21	*/
+#define RESET_SYS_CPU_CAPB3		22
+#define RESET_CBUS_CAPB3		23
+#define RESET_AHB_CNTL			24
+#define RESET_AHB_DATA			25
+#define RESET_VCBUS_CLK81		26
+#define RESET_MMC			27
+/*					28-31	*/
+/*	RESET1					*/
+/*					32	*/
+/*					33	*/
+#define RESET_USB_OTG			34
+#define RESET_DDR			35
+#define RESET_AO_RESET			36
+/*					37	*/
+#define RESET_AHB_SRAM			38
+/*					39	*/
+/*					40	*/
+#define RESET_DMA			41
+#define RESET_ISA			42
+#define RESET_ETHERNET			43
+/*					44	*/
+#define RESET_SD_EMMC_B			45
+#define RESET_SD_EMMC_C			46
+#define RESET_ROM_BOOT			47
+#define RESET_SYS_CPU_0			48
+#define RESET_SYS_CPU_1			49
+#define RESET_SYS_CPU_2			50
+#define RESET_SYS_CPU_3			51
+#define RESET_SYS_CPU_CORE_0		52
+#define RESET_SYS_CPU_CORE_1		53
+#define RESET_SYS_CPU_CORE_2		54
+#define RESET_SYS_CPU_CORE_3		55
+#define RESET_SYS_PLL_DIV		56
+#define RESET_SYS_CPU_AXI		57
+#define RESET_SYS_CPU_L2		58
+#define RESET_SYS_CPU_P			59
+#define RESET_SYS_CPU_MBIST		60
+/*					61-63	*/
+/*	RESET2					*/
+/*					64	*/
+/*					65	*/
+#define RESET_AUDIO			66
+/*					67	*/
+#define RESET_MIPI_HOST			68
+#define RESET_AUDIO_LOCKER		69
+#define RESET_GE2D			70
+/*					71-76	*/
+#define RESET_AO_CPU_RESET		77
+/*					78-95	*/
+/*	RESET3					*/
+#define RESET_RING_OSCILLATOR		96
+/*					97-127	*/
+/*	RESET4					*/
+/*					128	*/
+/*					129	*/
+#define RESET_MIPI_PHY			130
+/*					131-140	*/
+#define RESET_VENCL			141
+#define RESET_I2C_MASTER_2		142
+#define RESET_I2C_MASTER_1		143
+/*					144-159	*/
+/*	RESET5					*/
+/*					160-191	*/
+/*	RESET6					*/
+#define RESET_PERIPHS_GENERAL		192
+#define RESET_PERIPHS_SPICC		193
+/*					194	*/
+/*					195	*/
+#define RESET_PERIPHS_I2C_MASTER_0	196
+/*					197-200	*/
+#define RESET_PERIPHS_UART_0		201
+#define RESET_PERIPHS_UART_1		202
+/*					203-204	*/
+#define RESET_PERIPHS_SPI_0		205
+#define RESET_PERIPHS_I2C_MASTER_3	206
+/*					207-223	*/
+/*	RESET7					*/
+#define RESET_USB_DDR_0			224
+#define RESET_USB_DDR_1			225
+#define RESET_USB_DDR_2			226
+#define RESET_USB_DDR_3			227
+/*					228	*/
+#define RESET_DEVICE_MMC_ARB		229
+/*					230	*/
+#define RESET_VID_LOCK			231
+#define RESET_A9_DMC_PIPEL		232
+#define RESET_DMC_VPU_PIPEL		233
+/*					234-255	*/
+
+#endif
diff --git a/include/dt-bindings/reset/axg-aoclkc.h b/include/dt-bindings/reset/axg-aoclkc.h
new file mode 100644
index 0000000000..d342c0b6b2
--- /dev/null
+++ b/include/dt-bindings/reset/axg-aoclkc.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2016 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ *
+ * Copyright (c) 2018 Amlogic, inc.
+ * Author: Qiufang Dai <qiufang.dai@amlogic.com>
+ */
+
+#ifndef DT_BINDINGS_RESET_AMLOGIC_MESON_AXG_AOCLK
+#define DT_BINDINGS_RESET_AMLOGIC_MESON_AXG_AOCLK
+
+#define RESET_AO_REMOTE		0
+#define RESET_AO_I2C_MASTER	1
+#define RESET_AO_I2C_SLAVE	2
+#define RESET_AO_UART1		3
+#define RESET_AO_UART2		4
+#define RESET_AO_IR_BLASTER	5
+
+#endif
-- 
2.19.1
