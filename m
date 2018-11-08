From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu,  8 Nov 2018 10:56:40 +0100
Subject: [PATCH] arm64: dts: meson-axg: s400: add cts-rts to the bluetooth uart
Message-ID: <20181108095640.27876-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The uart used with bluetooth chipset on the s400 has flow control
available. Let's enable it.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index ba44b0419404..29ccb8ad0de6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -543,8 +543,9 @@
 
 &uart_A {
 	status = "okay";
-	pinctrl-0 = <&uart_a_pins>;
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
 	pinctrl-names = "default";
+	uart-has-rtscts;
 };
 
 &uart_AO {
-- 
2.19.1
