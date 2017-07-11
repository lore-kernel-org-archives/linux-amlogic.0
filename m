From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 12 Jul 2017 00:20:14 +0200
Subject: [PATCH 1/2] ARM: dts: move the pwm_ab and pwm_cd nodes to meson.dtsi
In-Reply-To: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
References: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170711222015.10401-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

According to the vendor kernel sources these also exist (at the same
address) on Meson6 and Meson8. This can be found by running
$ grep -R "define PWM_PWM_[A-D]" arch/arm/
in the Amlogic GPL kernel tree (arm-src-kernel-2015-01-15-321cfb5a46).
pwm_ef does not seem to exist on older SoCs, so we keep it in
meson8b.dtsi for now.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi   | 14 ++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 22 ++++++++--------------
 2 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 15204e44161d..4c27ca083afb 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -108,6 +108,20 @@
 				status = "disabled";
 			};
 
+			pwm_ab: pwm at 8550 {
+				compatible = "amlogic,meson-pwm";
+				reg = <0x8550 0x10>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
+			pwm_cd: pwm at 8650 {
+				compatible = "amlogic,meson-pwm";
+				reg = <0x8650 0x10>;
+				#pwm-cells = <3>;
+				status = "disabled";
+			};
+
 			saradc: adc at 8680 {
 				compatible = "amlogic,meson-saradc";
 				reg = <0x8680 0x34>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 72e4f425f190..65b36c944b45 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -129,20 +129,6 @@
 		#reset-cells = <1>;
 	};
 
-	pwm_ab: pwm at 8550 {
-		compatible = "amlogic,meson8b-pwm";
-		reg = <0x8550 0x10>;
-		#pwm-cells = <3>;
-		status = "disabled";
-	};
-
-	pwm_cd: pwm at 8650 {
-		compatible = "amlogic,meson8b-pwm";
-		reg = <0x8650 0x10>;
-		#pwm-cells = <3>;
-		status = "disabled";
-	};
-
 	pwm_ef: pwm at 86c0 {
 		compatible = "amlogic,meson8b-pwm";
 		reg = <0x86c0 0x10>;
@@ -193,6 +179,14 @@
 	arm,filter-ranges = <0x100000 0xc0000000>;
 };
 
+&pwm_ab {
+	compatible = "amlogic,meson8b-pwm";
+};
+
+&pwm_cd {
+	compatible = "amlogic,meson8b-pwm";
+};
+
 &saradc {
 	compatible = "amlogic,meson8b-saradc", "amlogic,meson-saradc";
 	clocks = <&clkc CLKID_XTAL>,
-- 
2.13.2
