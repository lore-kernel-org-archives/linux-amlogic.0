From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 22 Apr 2018 12:45:01 +0200
Subject: [PATCH 1/2] ARM: dts: meson8: add the cortex-a9-pmu compatible PMU
In-Reply-To: <20180422104502.2942-1-martin.blumenstingl@googlemail.com>
References: <20180422104502.2942-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180422104502.2942-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Enable the performance monitor unit on Meson8.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index dcc9292d2ffa..7b16ea61e914 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -57,7 +57,7 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu at 200 {
+		cpu0: cpu at 200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
@@ -66,7 +66,7 @@
 			resets = <&clkc CLKC_RESET_CPU0_SOFT_RESET>;
 		};
 
-		cpu at 201 {
+		cpu1: cpu at 201 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
@@ -75,7 +75,7 @@
 			resets = <&clkc CLKC_RESET_CPU1_SOFT_RESET>;
 		};
 
-		cpu at 202 {
+		cpu2: cpu at 202 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
@@ -84,7 +84,7 @@
 			resets = <&clkc CLKC_RESET_CPU2_SOFT_RESET>;
 		};
 
-		cpu at 203 {
+		cpu3: cpu at 203 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			next-level-cache = <&L2>;
@@ -94,6 +94,15 @@
 		};
 	};
 
+	pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.17.0
