From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 15 Aug 2016 15:38:09 +0200
Subject: [PATCH 1/3] ARM64: dts: amlogic: SD card support for all Tronsmart
 Vega S95 devices
In-Reply-To: <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
 <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
Message-ID: <20160815133811.19646-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

sd_emmc_b is routed to the SD-card. Unlike p20x there is no GPIO
regulator, meaning it only supports 3.3V (which seems to be hard-wired).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Andreas F?rber <afaerber@suse.de>
---
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 54bb7c7..4572ce2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -52,6 +52,16 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vcc_3v3: regulator at 0 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+	};
 };
 
 &uart_AO {
@@ -60,3 +70,19 @@
 	pinctrl-names = "default";
 
 };
+
+&sd_emmc_b {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-names = "default";
+
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <100000000>;
+
+	cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+
+	vmmc-supply = <&vcc_3v3>;
+	voltage-ranges = <3300 3300>;
+};
-- 
2.9.3
