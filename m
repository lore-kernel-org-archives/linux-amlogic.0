From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 15 Jun 2017 23:33:43 +0200
Subject: [PATCH v2 01/10] ARM: dts: meson: use C preprocessor friendly include
 syntax
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170615213352.25134-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This replaces the "/include/" syntax with the "#include" syntax in all
Amlogic Meson .dts and .dtsi files. That is required to use preprocessor
defines (like GIC_SPI and IRQ_TYPE_EDGE_RISING) in meson.dtsi (all files
which directly or indirectly include meson.dtsi need to use the
"#include" syntax, otherwise the .dts files cannot be compiled).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson6-atv1200.dts | 2 +-
 arch/arm/boot/dts/meson6.dtsi        | 2 +-
 arch/arm/boot/dts/meson8.dtsi        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/meson6-atv1200.dts b/arch/arm/boot/dts/meson6-atv1200.dts
index 1237faa63ce6..9444b0d9628f 100644
--- a/arch/arm/boot/dts/meson6-atv1200.dts
+++ b/arch/arm/boot/dts/meson6-atv1200.dts
@@ -46,7 +46,7 @@
  */
 
 /dts-v1/;
-/include/ "meson6.dtsi"
+#include "meson6.dtsi"
 
 / {
 	model = "Geniatech ATV1200";
diff --git a/arch/arm/boot/dts/meson6.dtsi b/arch/arm/boot/dts/meson6.dtsi
index b0fc91ffd6a1..8557b6117a4b 100644
--- a/arch/arm/boot/dts/meson6.dtsi
+++ b/arch/arm/boot/dts/meson6.dtsi
@@ -45,7 +45,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
-/include/ "meson.dtsi"
+#include "meson.dtsi"
 
 / {
 	model = "Amlogic Meson6 SoC";
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index e4f7357b4b31..c5d73b999773 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -45,7 +45,7 @@
 
 #include <dt-bindings/clock/meson8b-clkc.h>
 #include <dt-bindings/gpio/meson8-gpio.h>
-/include/ "meson.dtsi"
+#include "meson.dtsi"
 
 / {
 	model = "Amlogic Meson8 SoC";
-- 
2.13.1
