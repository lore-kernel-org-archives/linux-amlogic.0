From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Oct 2018 13:35:14 +0100
Subject: [PATCH 2/2] dt-bindings: timer: meson6_timer: document the clock
 inputs
In-Reply-To: <20181028123514.12660-1-martin.blumenstingl@googlemail.com>
References: <20181028123514.12660-1-martin.blumenstingl@googlemail.com>
Message-ID: <20181028123514.12660-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Meson Timer IP has two clock inputs:
- pclk which is used as "system clock" timebase of Timer E
- xtal which is used for the 1us, 10us, 100us and 1ms timebases of Timer
  A, B, C, D and E

The IP block has four internal dividers (XTAL is running at 24MHz):
- "xtal div 24" for 1us resolution
- "xtal div 240" for 10us resolution
- "xtal div 2400" for 100us resolution
- "xtal div 24000" for 1ms resolution

Suggested-by: Jianxin Pan <jianxin.pan@amlogic.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/timer/amlogic,meson6-timer.txt        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
index dbdda92cffb7..a9da22bda912 100644
--- a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
+++ b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
@@ -5,6 +5,8 @@ Required properties:
 - compatible : should be "amlogic,meson6-timer"
 - reg : Specifies base physical address and size of the registers.
 - interrupts : The four interrupts, one for each timer event
+- clocks : phandles to the pclk (system clock) and XTAL clocks
+- clock-names : must contain "pclk" and "xtal"
 
 Example:
 
@@ -15,4 +17,6 @@ timer at c1109940 {
 		     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
 		     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
 		     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+	clocks = <&xtal>, <&clk81>;
+	clock-names = "xtal", "pclk";
 };
-- 
2.19.1
