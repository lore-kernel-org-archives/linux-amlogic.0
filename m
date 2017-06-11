From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 11 Jun 2017 12:16:41 +0200
Subject: [PATCH 10/13] ARM: dts: meson: add the hardware random number
 generator
In-Reply-To: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170611101644.28581-11-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

All supported Meson SoCs have a random number generator in CBUS.
Newer SoCs (GXBB, GXL and GXM) provide only one 32-bit random number
register, whereas the older SoCs (Meson6, Meson8 and Meson8b) have two
32-bit random number registers. The existing meson-rng driver only
supports the lower 32-bit - but it still works fine on the older SoCs
apart from this small limitation.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi   | 5 +++++
 arch/arm/boot/dts/meson8.dtsi  | 5 +++++
 arch/arm/boot/dts/meson8b.dtsi | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index b05796bee088..a210084398dc 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -78,6 +78,11 @@
 			#size-cells = <1>;
 			ranges = <0x0 0xc1100000 0x200000>;
 
+			hwrng: rng at 8100 {
+				compatible = "amlogic,meson-rng";
+				reg = <0x8100 0x8>;
+			};
+
 			uart_A: serial at 84c0 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x84c0 0x18>;
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index cf011dfe050e..a80181ddd416 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -241,6 +241,11 @@
 	clock-names = "stmmaceth";
 };
 
+&hwrng {
+	clocks = <&clkc CLKID_RNG0>;
+	clock-names = "core";
+};
+
 &i2c_AO {
 	clocks = <&clkc CLKID_CLK81>;
 };
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 1c09090ff4a5..52aa3f68a6bd 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -171,6 +171,11 @@
 	};
 };
 
+&hwrng {
+	clocks = <&clkc CLKID_RNG0>;
+	clock-names = "core";
+};
+
 &L2 {
 	arm,data-latency = <3 3 3>;
 	arm,tag-latency = <2 2 2>;
-- 
2.13.1
