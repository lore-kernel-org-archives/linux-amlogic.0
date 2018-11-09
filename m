From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri,  9 Nov 2018 14:23:31 +0100
Subject: [PATCH] arm64: dts: meson: s400: add bcm bluetooth device
Message-ID: <20181109132331.12010-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add broadcom bluetooth device on the s400

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 29ccb8ad0de6..7759fda3ddfd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -546,6 +546,11 @@
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
 	pinctrl-names = "default";
 	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		shutdown-gpios = <&gpio GPIOX_21 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &uart_AO {
-- 
2.19.1
