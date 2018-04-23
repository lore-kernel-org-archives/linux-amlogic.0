From: geert+renesas@glider.be (Geert Uytterhoeven)
Date: Mon, 23 Apr 2018 09:32:40 +0200
Subject: [PATCH] dt-bindings: meson-uart: DT fix s/clocks-names/clock-names/
Message-ID: <1524468760-22912-1-git-send-email-geert+renesas@glider.be>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
index 8ff65fa632fdedd7..c06c045126fc9070 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.txt
@@ -21,7 +21,7 @@ Required properties:
 - interrupts : identifier to the device interrupt
 - clocks : a list of phandle + clock-specifier pairs, one for each
 	   entry in clock names.
-- clocks-names :
+- clock-names :
    * "xtal" for external xtal clock identifier
    * "pclk" for the bus core clock, either the clk81 clock or the gate clock
    * "baud" for the source of the baudrate generator, can be either the xtal
-- 
2.7.4
