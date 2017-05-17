From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 17 May 2017 22:16:35 +0200
Subject: [PATCH RfC v3 2/7] pinctrl: meson: document GPIO IRQ driver DT binding
In-Reply-To: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
References: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
Message-ID: <7c09969b-ac04-cfa4-7459-7ad25b7c5cbf@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Document the DT binding for GPIO IRQ support on Amlogic Meson SoC's.

This documentation is intentionally not placed under
interrupt-controllers as GPIO IRQ support on these SoC's acts more
like an interrupt multiplexer.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove syscon
v3:
- no changes
---
 .../bindings/gpio/amlogic,meson-gpio-interrupt.txt | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt

diff --git a/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt b/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
new file mode 100644
index 00000000..ba7d3015
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/amlogic,meson-gpio-interrupt.txt
@@ -0,0 +1,30 @@
+Amlogic meson GPIO interrupt controller
+
+Meson SoCs contains an interrupt controller which is able watch the SoC pads
+and generate an interrupt on edges or level. The controller is essentially a
+256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
+or level and polarity. We don't expose all 256 mux inputs because the
+documentation shows that upper part is not mapped to any pad. The actual number
+of interrupt exposed depends on the SoC.
+
+Required properties:
+
+- compatible : should be "amlogic,meson-gpio-interrupt".
+- reg : Specifies base physical address and size of the registers.
+- interrupts : list of GIC interrupts which can be used with the
+	       GPIO IRQ multiplexer
+
+Example:
+
+gpio_irq at 9880 {
+	compatible = "amlogic,meson-gpio-interrupt";
+	reg = <0x0 0x09880 0x0 0x10>;
+	interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+		     <GIC_SPI 65 IRQ_TYPE_NONE>,
+		     <GIC_SPI 66 IRQ_TYPE_NONE>,
+		     <GIC_SPI 67 IRQ_TYPE_NONE>,
+		     <GIC_SPI 68 IRQ_TYPE_NONE>,
+		     <GIC_SPI 69 IRQ_TYPE_NONE>,
+		     <GIC_SPI 70 IRQ_TYPE_NONE>,
+		     <GIC_SPI 71 IRQ_TYPE_NONE>;
+	};
-- 
2.13.0
