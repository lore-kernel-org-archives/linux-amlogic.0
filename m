From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 28 Oct 2017 14:34:30 +0200
Subject: [PATCH 2/2] ARM: dts: meson8b: use stable UART bindings with correct
 gate clock
In-Reply-To: <20171028123430.7796-1-martin.blumenstingl@googlemail.com>
References: <20171028123430.7796-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171028123430.7796-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Switch to the stable UART bindings and add the correct gate clocks
to the non-AO UART nodes.
This fixes the non-AO UARTs if the bootloader didn't un-gate the clocks.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 15ed84441d8d..070a28ec293f 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -242,19 +242,27 @@
 };
 
 &uart_AO {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_CLK81>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_A {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_B {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_UART1>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &uart_C {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
+	clock-names = "xtal", "pclk", "baud";
 };
 
 &usb0 {
-- 
2.14.3
