From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 30 May 2017 22:26:41 +0200
Subject: [PATCH v5 5/9] ARM64: dts: meson: add GPIO interrupt-controller
 support
In-Reply-To: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
References: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
Message-ID: <1378b278-1d27-c2e4-2ebd-3526c3c82e45@gmail.com>
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
+				parent-interrupts = <64 65 66 67 68 79 70 71>;
+			};
+
 			watchdog at 98d0 {
 				compatible = "amlogic,meson-gx-wdt", "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0x098d0 0x0 0x10>;
-- 
2.13.0
