From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Wed, 12 Jul 2017 00:22:22 +0200
Subject: [PATCH] ARM: dts: meson8b: use the existing wdt node to override the
 compatible
Message-ID: <20170711222222.11023-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Meson8b has to define it's own compatible string for the watchdog. This
patch removes the duplicate resource (register region and interrupt)
definition from meson8b.dtsi and simply re-uses these values from
meson.dtsi (as the register offset, size and interrupt are identical).

This is purely cosmetic and does not change any functionality.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 65b36c944b45..8fce13844b0c 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -136,12 +136,6 @@
 		status = "disabled";
 	};
 
-	wdt: watchdog at 9900 {
-		compatible = "amlogic,meson8b-wdt";
-		reg = <0x9900 0x8>;
-		interrupts = <0 0 1>;
-	};
-
 	pinctrl_cbus: pinctrl at 9880 {
 		compatible = "amlogic,meson8b-cbus-pinctrl";
 		reg = <0x9880 0x10>;
@@ -236,3 +230,7 @@
 	clock-names = "usb_general", "usb";
 	resets = <&reset RESET_USB_OTG>;
 };
+
+&wdt {
+	compatible = "amlogic,meson8b-wdt";
+};
-- 
2.13.2
