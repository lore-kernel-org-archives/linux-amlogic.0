From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 22 Jul 2017 20:58:05 +0200
Subject: [PATCH v2 1/3] dt-bindings: clock: meson8b: describe the embedded
 reset controller
In-Reply-To: <20170722185807.10504-1-martin.blumenstingl@googlemail.com>
References: <20170722185807.10504-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170722185807.10504-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Amlogic Meson8/Meson8b/Meson8m2 clock controller provides some reset
lines. These are used for example to boot the secondary CPU cores.

This patch describes the reset controller which is embedded into the
clock controller on these SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index 606da38c0959..e1af4764114d 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -16,18 +16,24 @@ Required Properties:
 	   mapped region.
 
 - #clock-cells: should be 1.
+- #reset-cells: should be 1.
 
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
 preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
 used in device tree sources.
+This is also valid for the reset lines provided by the clock controller: a
+preprocessor macro for each reset line is defined (in the same header file as
+the clock identifiers).
+
 
 Example: Clock controller node:
 
 	clkc: clock-controller at c1104000 {
-		#clock-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
 		reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 
-- 
2.13.3
