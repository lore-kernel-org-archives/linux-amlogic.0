From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 28 Oct 2018 13:35:13 +0100
Subject: [PATCH 1/2] dt-bindings: timer: meson6_timer: document all interrupts
In-Reply-To: <20181028123514.12660-1-martin.blumenstingl@googlemail.com>
References: <20181028123514.12660-1-martin.blumenstingl@googlemail.com>
Message-ID: <20181028123514.12660-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The meson6_timer IP block supports four timers - each of them has it's
own interrupt line. Update the documentation to reflect that all four
interrupts should be passed.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/timer/amlogic,meson6-timer.txt     | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
index a092053f7902..dbdda92cffb7 100644
--- a/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
+++ b/Documentation/devicetree/bindings/timer/amlogic,meson6-timer.txt
@@ -4,12 +4,15 @@ Required properties:
 
 - compatible : should be "amlogic,meson6-timer"
 - reg : Specifies base physical address and size of the registers.
-- interrupts : The interrupt of the first timer
+- interrupts : The four interrupts, one for each timer event
 
 Example:
 
 timer at c1109940 {
 	compatible = "amlogic,meson6-timer";
 	reg = <0xc1109940 0x14>;
-	interrupts = <0 10 1>;
+	interrupts = <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
+		     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
 };
-- 
2.19.1
