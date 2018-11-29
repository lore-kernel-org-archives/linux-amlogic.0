From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 30 Nov 2018 00:00:44 +0100
Subject: [PATCH 2/2] ARM: dts: meson: meson8b: add the CPU OPP tables
In-Reply-To: <20181129230044.21358-1-martin.blumenstingl@googlemail.com>
References: <20181129230044.21358-1-martin.blumenstingl@googlemail.com>
Message-ID: <20181129230044.21358-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The values are taken from Amlogic's 3.10 kernel sources.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 66 ++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index a38d187d3d6e..22d775460767 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -62,6 +62,8 @@
 			reg = <0x200>;
 			enable-method = "amlogic,meson8b-smp";
 			resets = <&clkc CLKC_RESET_CPU0_SOFT_RESET>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPUCLK>;
 		};
 
 		cpu1: cpu at 201 {
@@ -71,6 +73,8 @@
 			reg = <0x201>;
 			enable-method = "amlogic,meson8b-smp";
 			resets = <&clkc CLKC_RESET_CPU1_SOFT_RESET>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPUCLK>;
 		};
 
 		cpu2: cpu at 202 {
@@ -80,6 +84,8 @@
 			reg = <0x202>;
 			enable-method = "amlogic,meson8b-smp";
 			resets = <&clkc CLKC_RESET_CPU2_SOFT_RESET>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPUCLK>;
 		};
 
 		cpu3: cpu at 203 {
@@ -89,6 +95,66 @@
 			reg = <0x203>;
 			enable-method = "amlogic,meson8b-smp";
 			resets = <&clkc CLKC_RESET_CPU3_SOFT_RESET>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPUCLK>;
+		};
+	};
+
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-96000000 {
+			opp-hz = /bits/ 64 <96000000>;
+			opp-microvolt = <860000>;
+		};
+		opp-192000000 {
+			opp-hz = /bits/ 64 <192000000>;
+			opp-microvolt = <860000>;
+		};
+		opp-312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+			opp-microvolt = <860000>;
+		};
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <860000>;
+		};
+		opp-504000000 {
+			opp-hz = /bits/ 64 <504000000>;
+			opp-microvolt = <860000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <860000>;
+		};
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-microvolt = <860000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <900000>;
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1140000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1140000>;
+		};
+		opp-1320000000 {
+			opp-hz = /bits/ 64 <1320000000>;
+			opp-microvolt = <1140000>;
+		};
+		opp-1488000000 {
+			opp-hz = /bits/ 64 <1488000000>;
+			opp-microvolt = <1140000>;
+		};
+		opp-1536000000 {
+			opp-hz = /bits/ 64 <1536000000>;
+			opp-microvolt = <1140000>;
 		};
 	};
 
-- 
2.19.2
