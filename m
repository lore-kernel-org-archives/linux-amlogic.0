From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 25 Jun 2016 18:34:45 +0200
Subject: [PATCH 2/3] ARM64: dts: amlogic: enable uart_A on all Tronsmart Vega
 S95 devices
In-Reply-To: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
Message-ID: <20160625163446.7245-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

An UART bluetooth device is attached to this serial port.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index e36b509..b003729 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -47,6 +47,7 @@
 
 	aliases {
 		serial0 = &uart_AO;
+		serial1 = &uart_A;
 	};
 
 	chosen {
@@ -54,6 +55,12 @@
 	};
 };
 
+&uart_A {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>;
+	pinctrl-names = "default";
+};
+
 &uart_AO {
 	status = "okay";
 	pinctrl-0 = <&uart_ao_a_pins>;
-- 
2.9.0
