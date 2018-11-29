From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 29 Nov 2018 17:54:51 +0100
Subject: [PATCH] arm64: dts: meson-axg: remove alternate xtal
Message-ID: <20181129165451.21446-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

There is actually no alternate xtal on any of the axg board I have
seen so far. The 32k is actually generated internally, deriving from
the 24MHz main xtal.

Amlogic SoC also have the option to provide the 32k reference externally,
through one of the AO pads, but no platform is using this ATM.

Fixes: 5e395e146667 ("ARM64: dts: meson-axg: add an 32K alt aoclk")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index f2e9fbfff4ea..63adf54b00c5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -53,13 +53,6 @@
 		status = "disabled";
 	};
 
-	ao_alt_xtal: ao_alt_xtal-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <32000000>;
-		clock-output-names = "ao_alt_xtal";
-		#clock-cells = <0>;
-	};
-
 	arm-pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.19.1
