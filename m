From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 22:40:36 +0100
Subject: [PATCH 1/2] ARM64: dts: meson: add comments with the GPIO for the PHY
 interrupts
In-Reply-To: <20171202214037.17017-1-martin.blumenstingl@googlemail.com>
References: <20171202214037.17017-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171202214037.17017-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Currently one has to look/calculate the GPIO for the PHY interrupts
manually. Add a comment for the existing PHY interrupt lines to make it
easier to find out which GPIO is used.
This is done using the following calculation:
- number of GPIO AO pins (14 on GXBB: GPIOAO_0..13)
- add the offset of the pin which is used for the interrupt (for example
  GPIOZ_15 = 15 on Odroid-C2)

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 2 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts      | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts       | 1 +
 4 files changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 4a4251001bfd..011e8e08e429 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -169,6 +169,7 @@
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
 			interrupt-parent = <&gpio_intc>;
+			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index f8d221463c60..dde3cb894c19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -156,8 +156,10 @@
 		#size-cells = <0>;
 
 		eth_phy0: ethernet-phy at 0 {
+			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
 			interrupt-parent = <&gpio_intc>;
+			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 			eee-broken-1000t;
 		};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index 9bf16bb7c491..09f34f7ef084 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -118,6 +118,7 @@
 			/* Micrel KSZ9031 (0x00221620) */
 			reg = <3>;
 			interrupt-parent = <&gpio_intc>;
+			/* MAC_INTR on GPIOZ_15 */
 			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
index 66c6da7e112c..9847fce443a8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-q200.dts
@@ -111,6 +111,7 @@
 		reg = <0>;
 		max-speed = <1000>;
 		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOH_3 */
 		interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
-- 
2.15.1
