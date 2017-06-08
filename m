From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 8 Jun 2017 21:38:50 +0200
Subject: [PATCH v6 3/9] dt-bindings: add Amlogic Meson GPIO
 interrupt-controller DT binding documentation
In-Reply-To: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
References: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
Message-ID: <deadf248-5dc4-3cac-a108-3057944c135e@gmail.com>
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
---
 .../amlogic,meson-gpio-intc.txt                    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
new file mode 100644
index 00000000..2f20d212
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
2.13.0
