From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 23 Jun 2018 16:59:59 +0200
Subject: [PATCH 1/1] ARM64: dts: meson: enable the saradc node in
 meson-gx-p23x-q20x.dtsi
In-Reply-To: <20180623145959.445-1-martin.blumenstingl@googlemail.com>
References: <20180623145959.445-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180623145959.445-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

meson-gxl-s905d-p230.dts and meson-gxm-q200.dts enable the saradc node
(and configure it's vref-supply "VDDIO_AO18") in their corresponding
.dts file.
Move both (the saradc node as well as the VDDIO_AO18 regulator) to
remove some duplicate code.

As a positive side-effect this enables the saradc also for the P231 (GXL
S905D) and Q201 (GXM S912) development boards which are similar to the
P230/Q200 boards (P231 and Q201 use the internal 100Mbit/s PHY, while
P230 and Q200 have an external RGMII PHY).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  | 12 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts | 12 ------------
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts       | 12 ------------
 3 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 88e712ea757a..01616982af0d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -35,6 +35,13 @@
 		regulator-always-on;
 	};
 
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	vddio_boot: regulator-vddio_boot {
 		compatible = "regulator-fixed";
 		regulator-name = "VDDIO_BOOT";
@@ -140,6 +147,11 @@
 	clock-names = "clkin0";
 };
 
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
 /* Wireless SDIO Module */
 &sd_emmc_a {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
index a9f9bb90a877..9c5be060fd5e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-p230.dts
@@ -41,13 +41,6 @@
 		};
 	};
 
-	vddio_ao18: regulator-vddio_ao18 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDDIO_AO18";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
-
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -107,8 +100,3 @@
 		remote-endpoint = <&hdmi_connector_in>;
 	};
 };
-
-&saradc {
-	status = "okay";
-	vref-supply = <&vddio_ao18>;
-};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 101417298a1d..432f7a435fba 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -40,13 +40,6 @@
 			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
 		};
 	};
-
-	vddio_ao18: regulator-vddio_ao18 {
-		compatible = "regulator-fixed";
-		regulator-name = "VDDIO_AO18";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-	};
 };
 
 /* Q200 has exclusive choice between internal or external PHY */
@@ -78,8 +71,3 @@
 		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
-
-&saradc {
-	status = "okay";
-	vref-supply = <&vddio_ao18>;
-};
-- 
2.18.0
