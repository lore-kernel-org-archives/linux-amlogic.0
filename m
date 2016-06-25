From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 25 Jun 2016 18:34:46 +0200
Subject: [PATCH 3/3] ARM64: dts: amlogic: enable sd_emmc_b on all Tronsmart
 Vega S95 devices
In-Reply-To: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
Message-ID: <20160625163446.7245-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

sd_emmc_b is routed to the SD-card. Unlike p20x there is no GPIO
regulator, meaning it only supports 3.3V (which seems to be hard-wired).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index b003729..3a77829 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -53,6 +53,17 @@
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	mmc_iv: fixed-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "mmc-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &uart_A {
@@ -73,3 +84,19 @@
 	pinctrl-0 = <&eth_pins>;
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
+	vmmc-supply = <&mmc_iv>;
+	voltage-ranges = <3300 3300>;
+};
-- 
2.9.0
