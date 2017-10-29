From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 30 Oct 2017 00:17:15 +0100
Subject: [PATCH 2/2] ARM: dts: meson: fix the memory region of the GPIO
 interrupt controller
In-Reply-To: <20171029231715.13391-1-martin.blumenstingl@googlemail.com>
References: <20171029231715.13391-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171029231715.13391-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

commit 200a575b68d2 ("ARM: dts: meson: organize devices in their corresponding busses")
organized all peripherals in busses so that the base register offset of
the bus doesn't have to be included in all child-nodes anymore.
The GPIO interrupt controller however specifies the register offset
without subtracting the "cbus" base address. This leads to a problem
where of_iomap inside the irq-meson-gpio driver fails because it
actually tries to map 0x182209880 (cbus base = 0xc1100000 + 0xc1109880
for the GPIO interrupt controller). Fix this by using 0x9880 as register
offset.

Fixes: 7d32bc03bcfb ("ARM: dts: meson8b: enable gpio interrupt controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index b750c837ec39..0d9faf1a51ea 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -184,7 +184,7 @@
 
 			gpio_intc: interrupt-controller at 9880 {
 				compatible = "amlogic,meson-gpio-intc";
-				reg = <0xc1109880 0x10>;
+				reg = <0x9880 0x10>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
-- 
2.14.3
