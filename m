From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Fri, 17 Nov 2017 23:58:57 +0100
Subject: [PATCH v2 2/2] ARM: dts: meson8b: use stable UART bindings with
 correct gate clock
In-Reply-To: <20171117225857.9571-1-martin.blumenstingl@googlemail.com>
References: <20171117225857.9571-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171117225857.9571-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Switch to the stable UART bindings and add the correct gate clocks
to the non-AO UART nodes.
This fixes the non-AO UARTs if the bootloader didn't un-gate the clocks.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d75e0ceda8bb..db296e5bd88a 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -248,19 +248,27 @@
 };
 
 &uart_AO {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_CLK81>;
+	clock-names = "baud", "xtal", "pclk";
 };
 
 &uart_A {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_UART0>;
+	clock-names = "baud", "xtal", "pclk";
 };
 
 &uart_B {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_UART1>;
+	clock-names = "baud", "xtal", "pclk";
 };
 
 &uart_C {
-	clocks = <&clkc CLKID_CLK81>;
+	compatible = "amlogic,meson8b-uart", "amlogic,meson-uart";
+	clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_XTAL>, <&clkc CLKID_UART2>;
+	clock-names = "baud", "xtal", "pclk";
 };
 
 &usb0 {
-- 
2.15.0
