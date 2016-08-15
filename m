From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 15 Aug 2016 15:38:10 +0200
Subject: [PATCH 2/3] ARM64: dts: amlogic: eMMC support for all Tronsmart Vega
 S95 devices
In-Reply-To: <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
 <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
Message-ID: <20160815133811.19646-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This adds eMMC support for all Tronsmart Vega S95 devices using
sd_emmc_c. This is implemented similar to the p20x boards (meaning it
uses fixed regulators).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 4572ce2..af2e38e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -62,6 +62,21 @@
 
 		regulator-always-on;
 	};
+
+	vcc_1v8: regulator at 1 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VCC1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &uart_AO {
@@ -86,3 +101,23 @@
 	vmmc-supply = <&vcc_3v3>;
 	voltage-ranges = <3300 3300>;
 };
+
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
+	voltage-ranges = <1800 3300>;
+	vmmc-supply = <&vcc_3v3>;
+	vmmcq-sumpply = <&vcc_1v8>;
+};
-- 
2.9.3
