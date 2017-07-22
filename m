From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 22 Jul 2017 20:58:07 +0200
Subject: [PATCH v2 3/3] ARM: dts: meson: mark the clock controller also as
 reset controller
In-Reply-To: <20170722185807.10504-1-martin.blumenstingl@googlemail.com>
References: <20170722185807.10504-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170722185807.10504-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The clock controller provides a few reset lines as well. Add the
#reset-cells property so we can pass the CPU soft reset lines to their
corresponding CPU cores.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi  | 1 +
 arch/arm/boot/dts/meson8b.dtsi | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 6fe6a159e960..b98d44fde6b6 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -168,6 +168,7 @@
 &cbus {
 	clkc: clock-controller at 4000 {
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 		compatible = "amlogic,meson8-clkc";
 		reg = <0x8000 0x4>, <0x4000 0x460>;
 	};
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 8fce13844b0c..bc278da7df0d 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -119,6 +119,7 @@
 &cbus {
 	clkc: clock-controller at 4000 {
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
 		reg = <0x8000 0x4>, <0x4000 0x460>;
 	};
-- 
2.13.3
