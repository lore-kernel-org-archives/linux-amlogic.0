From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 17 May 2017 22:16:44 +0200
Subject: [PATCH RfC v3 3/7] pinctrl: meson: add DT node for GPIO IRQ on Meson
 GX
In-Reply-To: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
References: <16950080-b19d-e25c-fb48-bc79cfe4acc0@gmail.com>
Message-ID: <d41eab00-2074-789d-045d-ac9ce3b4349f@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the DT node for GPIO IRQ support on AMlogic Meson GX.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove syscon
v3:
- no changes
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 436b8750..44422b85 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -312,6 +312,19 @@
 				status = "disabled";
 			};
 
+			gpio_irq at 9880 {
+				compatible = "amlogic,meson-gpio-interrupt";
+				reg = <0x0 0x09880 0x0 0x10>;
+				interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+					     <GIC_SPI 65 IRQ_TYPE_NONE>,
+					     <GIC_SPI 66 IRQ_TYPE_NONE>,
+					     <GIC_SPI 67 IRQ_TYPE_NONE>,
+					     <GIC_SPI 68 IRQ_TYPE_NONE>,
+					     <GIC_SPI 69 IRQ_TYPE_NONE>,
+					     <GIC_SPI 70 IRQ_TYPE_NONE>,
+					     <GIC_SPI 71 IRQ_TYPE_NONE>;
+			};
+
 			watchdog at 98d0 {
 				compatible = "amlogic,meson-gx-wdt", "amlogic,meson-gxbb-wdt";
 				reg = <0x0 0x098d0 0x0 0x10>;
-- 
2.13.0
