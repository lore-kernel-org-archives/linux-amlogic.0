From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 29 Nov 2018 17:45:24 +0100
Subject: [PATCH 3/3] arm64: dts: meson: add clock controller clock inputs
In-Reply-To: <20181129164524.18670-1-jbrunet@baylibre.com>
References: <20181129164524.18670-1-jbrunet@baylibre.com>
Message-ID: <20181129164524.18670-4-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the clock inputs of the clock controllers

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 3 +++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 5f512c91471e..f2e9fbfff4ea 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1089,6 +1089,7 @@
 				clkc: clock-controller {
 					compatible = "amlogic,axg-clkc";
 					#clock-cells = <1>;
+					clocks = <&xtal>;
 				};
 			};
 		};
@@ -1334,6 +1335,8 @@
 					compatible = "amlogic,meson-axg-aoclkc";
 					#clock-cells = <1>;
 					#reset-cells = <1>;
+					clocks = <&xtal>, <&clkc CLKID_CLK81>;
+					clock-names = "xtal", "mpeg-clk";
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 6796d250985a..3322da6da962 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -299,6 +299,8 @@
 
 &clkc_AO {
 	compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "mpeg-clk";
 };
 
 &efuse {
@@ -334,6 +336,7 @@
 	clkc: clock-controller {
 		compatible = "amlogic,gxbb-clkc";
 		#clock-cells = <1>;
+		clocks = <&xtal>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index ed278097825b..223f34959844 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -260,6 +260,8 @@
 
 &clkc_AO {
 	compatible = "amlogic,meson-gxl-aoclkc", "amlogic,meson-gx-aoclkc";
+	clocks = <&xtal>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "mpeg-clk";
 };
 
 &gpio_intc {
@@ -284,6 +286,7 @@
 	clkc: clock-controller {
 		compatible = "amlogic,gxl-clkc";
 		#clock-cells = <1>;
+		clocks = <&xtal>;
 	};
 };
 
-- 
2.19.1
