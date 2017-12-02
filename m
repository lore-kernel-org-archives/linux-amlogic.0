From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 22:40:37 +0100
Subject: [PATCH 2/2] ARM64: dts: meson-gxm: add the PHY interrupt line on
 Khadas VIM2
In-Reply-To: <20171202214037.17017-1-martin.blumenstingl@googlemail.com>
References: <20171202214037.17017-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171202214037.17017-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The INTB/PMEB pin of the RTL8211F PHY on the Khadas VIM2 is routed to
GPIOZ_15. Add the corresponding interrupt using the GPIO interrupt
controller so the PHY framework doesn't have to poll the PHY for it's
status.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 34a41b26a4ed..5c2bc2989519 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -232,6 +232,9 @@
 	external_phy: ethernet-phy at 0 {
 		/* Realtek RTL8211F (0x001cc916) */
 		reg = <0>;
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_15 */
+		interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.15.1
