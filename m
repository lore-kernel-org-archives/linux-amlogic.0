From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon,  4 Dec 2017 11:05:04 +0100
Subject: [PATCH] ARM64: dts: meson-gxm: fix q200 interrupt number
Message-ID: <20171204100504.7741-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Correct the interrupt number assigned to the Realtek PHY in the q200

Fixes: b94d22d94ad2 ("ARM64: dts: meson-gx: add external PHY interrupt on some platforms")
Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

 This change depends on the related series from Martin [0]
 Thanks for catching it Martin !

[0]: https://lkml.kernel.org/r/20171202214037.17017-1-martin.blumenstingl at googlemail.com

 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 9847fce443a8..388fac4f2d97 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -111,8 +111,8 @@
 		reg = <0>;
 		max-speed = <1000>;
 		interrupt-parent = <&gpio_intc>;
-		/* MAC_INTR on GPIOH_3 */
-		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.14.3
