From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 12 Jul 2017 00:20:15 +0200
Subject: [PATCH 2/2] ARM: dts: meson8: add the PWM controller nodes
In-Reply-To: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
References: <20170711222015.10401-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170711222015.10401-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

pwm_ab and pwm_cd are already inherited from meson.dtsi, we only need to
define the correct "compatible" string so the pwm-meson driver can
choose the parent clocks correctly.
pwm_ef is added to meson8.dtsi directly (similar to how it's done in
meson8b.dtsi) as this controller only exists on Meson8 and Meson8b.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index cada35828931..6fe6a159e960 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -172,6 +172,13 @@
 		reg = <0x8000 0x4>, <0x4000 0x460>;
 	};
 
+	pwm_ef: pwm at 86c0 {
+		compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+		reg = <0x86c0 0x10>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	pinctrl_cbus: pinctrl at 9880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0x9880 0x10>;
@@ -270,6 +277,14 @@
 	arm,filter-ranges = <0x100000 0xc0000000>;
 };
 
+&pwm_ab {
+	compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+};
+
+&pwm_cd {
+	compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
+};
+
 &saradc {
 	compatible = "amlogic,meson8-saradc", "amlogic,meson-saradc";
 	clocks = <&clkc CLKID_XTAL>,
-- 
2.13.2
