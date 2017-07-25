From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Tue, 25 Jul 2017 17:23:30 +0200
Subject: [PATCH] ARM: dts: meson: Fixing L2 cache controller node for Meson8
 and Meson8b
Message-ID: <20170725152330.GA11792@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Changing address filtering range to support the entire DDR region.
The previous range prevents ODROID-C1+ board from booting.

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 72e4f425f190..3f0850cf3403 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -190,7 +190,7 @@
 &L2 {
 	arm,data-latency = <3 3 3>;
 	arm,tag-latency = <2 2 2>;
-	arm,filter-ranges = <0x100000 0xc0000000>;
+	arm,filter-ranges = <0x0 0xc0000000>;
 };
 
 &saradc {
-- 
2.13.2
