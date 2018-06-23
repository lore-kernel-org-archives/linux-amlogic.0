From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 23 Jun 2018 17:00:56 +0200
Subject: [PATCH] ARM64: dts: meson-gxl: fix Mali GPU compatible string
Message-ID: <20180623150056.1442-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

meson-gxl-mali.dtsi is only used on GXL SoCs. Thus it should use the GXL
specific compatible string instead of the GXBB one.
For now this is purely cosmetic since the (out-of-tree) lima driver for
this GPU currently uses the "arm,mali-450" match instead of the SoC
specific one. However, update the .dts to match the documentation since
this driver behavior might change in the future.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
index eb327664a4d8..6aaafff674f9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-mali.dtsi
@@ -6,7 +6,7 @@
 
 &apb {
 	mali: gpu at c0000 {
-		compatible = "amlogic,meson-gxbb-mali", "arm,mali-450";
+		compatible = "amlogic,meson-gxl-mali", "arm,mali-450";
 		reg = <0x0 0xc0000 0x0 0x40000>;
 		interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.18.0
