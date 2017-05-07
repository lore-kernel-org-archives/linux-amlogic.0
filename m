From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sun, 7 May 2017 18:34:20 +0200
Subject: [PATCH 4/5] pintrl: meson: add DT node for GPIO IRQ on Meson 8 / 8b
In-Reply-To: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com>
Message-ID: <da407841-43cc-8797-2289-2bda7474576f@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the DT node for GPIO IRQ support on AMlogic Meson 8 and 8b.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/boot/dts/meson8.dtsi  | 13 +++++++++++++
 arch/arm/boot/dts/meson8b.dtsi | 13 +++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index ebc763ea..bf76a120 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -91,6 +91,19 @@
 		clock-frequency = <141666666>;
 	};
 
+	gpio_irq at c1109880 {
+		compatible = "amlogic,meson-gpio-interrupt", "syscon";
+		reg = <0xc1109880 0x10>;
+		interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+			     <GIC_SPI 65 IRQ_TYPE_NONE>,
+			     <GIC_SPI 66 IRQ_TYPE_NONE>,
+			     <GIC_SPI 67 IRQ_TYPE_NONE>,
+			     <GIC_SPI 68 IRQ_TYPE_NONE>,
+			     <GIC_SPI 69 IRQ_TYPE_NONE>,
+			     <GIC_SPI 70 IRQ_TYPE_NONE>,
+			     <GIC_SPI 71 IRQ_TYPE_NONE>;
+	};
+
 	pinctrl_cbus: pinctrl at c1109880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0xc1109880 0x10>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 828aa49c..b5a92461 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -183,6 +183,19 @@
 			status = "disabled";
 		};
 
+		gpio_irq at c1109880 {
+			compatible = "amlogic,meson-gpio-interrupt", "syscon";
+			reg = <0xc1109880 0x10>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+				     <GIC_SPI 65 IRQ_TYPE_NONE>,
+				     <GIC_SPI 66 IRQ_TYPE_NONE>,
+				     <GIC_SPI 67 IRQ_TYPE_NONE>,
+				     <GIC_SPI 68 IRQ_TYPE_NONE>,
+				     <GIC_SPI 69 IRQ_TYPE_NONE>,
+				     <GIC_SPI 70 IRQ_TYPE_NONE>,
+				     <GIC_SPI 71 IRQ_TYPE_NONE>;
+		};
+
 		pinctrl_cbus: pinctrl at c1109880 {
 			compatible = "amlogic,meson8b-cbus-pinctrl";
 			reg = <0xc1109880 0x10>;
-- 
2.12.2
