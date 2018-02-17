From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 17 Feb 2018 17:06:50 +0100
Subject: [PATCH] ARM: dts: meson8b: add the I2C clocks
Message-ID: <20180217160650.9959-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the I2C clocks so the I2C busses can be used. The clock input is not
device specific (the AO I2C bus uses clk81 as input, while the two I2C
busses in CBUS have a separate "CLKID_I2C" gate, provided by the clock
controller.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 1a7c16640ea5..5f7841b2d163 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -250,6 +250,18 @@
 	clock-names = "core";
 };
 
+&i2c_AO {
+	clocks = <&clkc CLKID_CLK81>;
+};
+
+&i2c_A {
+	clocks = <&clkc CLKID_I2C>;
+};
+
+&i2c_B {
+	clocks = <&clkc CLKID_I2C>;
+};
+
 &L2 {
 	arm,data-latency = <3 3 3>;
 	arm,tag-latency = <2 2 2>;
-- 
2.16.1
