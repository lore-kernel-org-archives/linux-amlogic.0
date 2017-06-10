From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 10 Jun 2017 23:57:20 +0200
Subject: [PATCH v7 2/9] dt-bindings: add Amlogic Meson GPIO
 interrupt-controller DT binding documentation
In-Reply-To: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Message-ID: <d7c3fd04-d3d7-c128-1dcc-921e99677130@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add dt binding documentation for Amlogic meson GPIO interrupt controller.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v5:
- added Reviewed-by
v6:
- rename parent-interrupts to interrupts
v7:
- no changes
---
 .../amlogic,meson-gpio-intc.txt                    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
new file mode 100644
index 00000000..4c9bb323
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
@@ -0,0 +1,26 @@
+Amlogic meson GPIO interrupt controller
+
+Meson SoCs contains an interrupt controller which is able watch the SoC pads
+and generate an interrupt on edges or level. The controller is essentially a
+256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
+or level and polarity. The actual number of interrupt exposed depends on the
+SoC.
+
+Required properties:
+
+- compatible : should be "amlogic,meson-gpio-intc".
+- reg : Specifies base physical address and size of the registers.
+- interrupt-controller : Identifies the node as an interrupt controller.
+- #interrupt-cells : should be 2.
+- interrupts : list of GIC interrupts which can be used with the
+	       GPIO IRQ multiplexer
+
+Example:
+
+gpio_intc: interrupt-controller at 9880 {
+	compatible = "amlogic,meson-gpio-intc";
+	reg = <0x0 0x09880 0x0 0x10>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	interrupts = <64 65 66 67 68 69 70 71>;
+};
-- 
2.13.1
