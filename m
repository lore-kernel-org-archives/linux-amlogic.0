From: linus.luessing@c0d3.blue (=?UTF-8?q?Linus=20L=C3=BCssing?=)
Date: Sat, 17 Mar 2018 21:11:14 +0100
Subject: [PATCH] ARM: dts: meson8b-odroidc1: add microSD support
Message-ID: <20180317201114.25503-1-linus.luessing@c0d3.blue>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Odroid C1 features a microSD slot. This patch adds the necessary
DT bindings to support it.

Signed-off-by: Linus L?ssing <linus.luessing@c0d3.blue>
---

Should probably be applied only after:
"[PATCH v3 1/1] ARM: dts: meson8b: the CBUS GPIO controller only has 83 GPIOs"
-> https://patchwork.kernel.org/patch/10277473/

Changes since "RFC":
- none

But retested with the following patches on top of 4.16-rc5:
- "[PATCH v2 1/2] pinctrl: meson: meson8b: fix requesting GPIOs greater than GPIOZ_3"
  -> https://patchwork.kernel.org/patch/10240807/
- "[PATCH v3 1/1] ARM: dts: meson8b: the CBUS GPIO controller only has 83 GPIOs"
  -> https://patchwork.kernel.org/patch/10277473/

 arch/arm/boot/dts/meson8b-odroidc1.dts | 58 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi         |  8 +++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index d5e83051bb54..3a5603d95b70 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -54,6 +54,7 @@
 
 	aliases {
 		serial0 = &uart_AO;
+		mmc0 = &sd_card_slot;
 	};
 
 	memory {
@@ -69,6 +70,37 @@
 			default-state = "off";
 		};
 	};
+
+	tflash_vdd: regulator-tflash_vdd {
+		/*
+		 * signal name from schematics: TFLASH_VDD_EN
+		 */
+		compatible = "regulator-fixed";
+
+		regulator-name = "TFLASH_VDD";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio GPIOY_12 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	tf_io: gpio-regulator-tf_io {
+		compatible = "regulator-gpio";
+
+		regulator-name = "TF_IO";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+
+		/*
+		 * signal name from schematics: TF_3V3N_1V8_EN
+		 */
+		gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
+		gpios-states = <0>;
+
+		states = <3300000 0
+			  1800000 1>;
+	};
 };
 
 &uart_AO {
@@ -100,6 +132,32 @@
 	status = "okay";
 };
 
+&sdio {
+	status = "okay";
+
+	pinctrl-0 = <&sd_b_pins>;
+	pinctrl-names = "default";
+
+	/* SD card */
+	sd_card_slot: slot at 1 {
+		compatible = "mmc-slot";
+		reg = <1>;
+		status = "okay";
+
+		bus-width = <4>;
+		no-sdio;
+		cap-mmc-highspeed;
+		cap-sd-highspeed;
+		disable-wp;
+
+		cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
+		cd-inverted;
+
+		vmmc-supply = <&tflash_vdd>;
+		vqmmc-supply = <&tf_io>;
+	};
+};
+
 &ethmac {
 	status = "okay";
 
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 202c2b8c79b8..92e240d08fb2 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -206,6 +206,14 @@
 				function = "ethernet";
 			};
 		};
+
+		sd_b_pins: sd-b {
+			mux {
+				groups = "sd_d0_b", "sd_d1_b", "sd_d2_b",
+					"sd_d3_b", "sd_clk_b", "sd_cmd_b";
+				function = "sd_b";
+			};
+		};
 	};
 };
 
-- 
2.11.0
