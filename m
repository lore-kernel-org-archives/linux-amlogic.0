From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 26 Dec 2017 12:43:44 +0100
Subject: [PATCH 2/3] ARM: dts: meson8: add the reset controller
In-Reply-To: <20171226114345.23905-1-martin.blumenstingl@googlemail.com>
References: <20171226114345.23905-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171226114345.23905-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Meson8 uses the same reset controller as Meson8b. Add the node along
with the #include for the reset lines to meson8.dtsi so we can use it
from there as well.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index ff619f2b3495..ad4cfbeaf706 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -46,6 +46,7 @@
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8-gpio.h>
 #include <dt-bindings/reset/amlogic,meson8b-clkc-reset.h>
+#include <dt-bindings/reset/amlogic,meson8b-reset.h>
 #include "meson.dtsi"
 
 / {
@@ -292,6 +293,12 @@
 		reg = <0x8000 0x4>, <0x4000 0x460>;
 	};
 
+	reset: reset-controller at 4404 {
+		compatible = "amlogic,meson8b-reset";
+		reg = <0x4404 0x9c>;
+		#reset-cells = <1>;
+	};
+
 	analog_top: analog-top at 81a8 {
 		compatible = "amlogic,meson8-analog-top", "syscon";
 		reg = <0x81a8 0x14>;
-- 
2.15.1
