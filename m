From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 8 Jun 2017 21:39:04 +0200
Subject: [PATCH v6 5/9] ARM64: dts: meson: add GPIO interrupt-controller
 support
In-Reply-To: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
References: <04378047-4194-bb0f-3da3-e1d62345a86b@gmail.com>
Message-ID: <0c1cd8dd-ff54-1272-1d11-7594dda84a47@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add support for the GPIO interupt controller of certain Amlogic Meson
Soc's.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
v5:
- split ARM and ARM64 into separate patches
- added Reviewed-by
v6:
- change parent-interrupts to interrupts
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 436b8750..66dde761 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -312,6 +312,14 @@
 				status = "disabled";
 			};
 
+			gpio_intc: interrupt-controller at 9880 {
+				compatible = "amlogic,meson-gpio-intc";
+				reg = <0x0 0x09880 0x0 0x10>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <64 65 66 67 68 79 70 71>;
+			};
+
 			watchdog at 98d0 {
 				compatible = "amlogic,meson-gx-wdt", "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0x098d0 0x0 0x10>;
-- 
2.13.0
