From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 30 Nov 2018 00:00:43 +0100
Subject: [PATCH 1/2] ARM: dts: meson: meson8: add the CPU OPP table
In-Reply-To: <20181129230044.21358-1-martin.blumenstingl@googlemail.com>
References: <20181129230044.21358-1-martin.blumenstingl@googlemail.com>
Message-ID: <20181129230044.21358-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The values are taken from Amlogic's 3.10 kernel sources. Their sources
have a "meson8m2_n200_2G.dtd" which defines a different voltage table:
- 0.86V for 96MHz
- (values in between omitted)
- 1.14V for 1.992GHz

The reason for this is simply the hardware design because the voltage
regulator on this board is has a minimum output of 0.86V and a maximum
output of 1.14V. The recommended settings are added with this patch
instead of using the values that are only valid for one board.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 72 +++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 2575a5835567..e5cd325d7ea8 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -64,6 +64,8 @@
 			reg = <0x200>;
 			enable-method = "amlogic,meson8-smp";
 			resets = <&clkc CLKC_RESET_CPU0_SOFT_RESET>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPUCLK>;
 		};
 
 		cpu1: cpu at 201 {
@@ -73,6 +75,8 @@
 			reg = <0x201>;
 			enable-method = "amlogic,meson8-smp";
 			resets = <&clkc CLKC_RESET_CPU1_SOFT_RESET>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPUCLK>;
 		};
 
 		cpu2: cpu at 202 {
@@ -82,6 +86,8 @@
 			reg = <0x202>;
 			enable-method = "amlogic,meson8-smp";
 			resets = <&clkc CLKC_RESET_CPU2_SOFT_RESET>;
+			operating-points-v2 = <&cpu_opp_table>;
+			clocks = <&clkc CLKID_CPUCLK>;
 		};
 
 		cpu3: cpu at 203 {
@@ -91,6 +97,72 @@
 			reg = <0x203>;
 			enable-method = "amlogic,meson8-smp";
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
+			opp-microvolt = <825000>;
+		};
+		opp-192000000 {
+			opp-hz = /bits/ 64 <192000000>;
+			opp-microvolt = <825000>;
+		};
+		opp-312000000 {
+			opp-hz = /bits/ 64 <312000000>;
+			opp-microvolt = <825000>;
+		};
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <825000>;
+		};
+		opp-504000000 {
+			opp-hz = /bits/ 64 <504000000>;
+			opp-microvolt = <825000>;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <850000>;
+		};
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-microvolt = <850000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <875000>;
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <925000>;
+		};
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <975000>;
+		};
+		opp-1416000000 {
+			opp-hz = /bits/ 64 <1416000000>;
+			opp-microvolt = <1025000>;
+		};
+		opp-1608000000 {
+			opp-hz = /bits/ 64 <1608000000>;
+			opp-microvolt = <1100000>;
+		};
+		opp-1800000000 {
+			status = "disabled";
+			opp-hz = /bits/ 64 <1800000000>;
+			opp-microvolt = <1125000>;
+		};
+		opp-1992000000 {
+			status = "disabled";
+			opp-hz = /bits/ 64 <1992000000>;
+			opp-microvolt = <1150000>;
 		};
 	};
 
-- 
2.19.2
