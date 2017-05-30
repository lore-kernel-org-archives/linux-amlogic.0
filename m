From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 30 May 2017 22:26:38 +0200
Subject: [PATCH v5 4/9] ARM: dts: meson: add GPIO interrupt-controller support
In-Reply-To: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
References: <66c57893-0a9e-4f8c-a017-ab346abbdfd0@gmail.com>
Message-ID: <dc97f555-a4f6-e320-a0f3-b20e1d60b8dd@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add support for the GPIO interupt controller of certain Amlogic Meson
Soc's.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
v5:
- split ARM and ARM64 into separate patches
- added Reviewed-by
---
 arch/arm/boot/dts/meson8.dtsi  | 8 ++++++++
 arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 69930773..b4c4175d 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -126,6 +126,14 @@
 };
 
 &cbus {
+	gpio_intc: interrupt-controller at 9880 {
+		compatible = "amlogic,meson-gpio-intc";
+		reg = <0x9880 0x10>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		parent-interrupts = <64 65 66 67 68 79 70 71>;
+	};
+
 	pinctrl_cbus: pinctrl at 9880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0x9880 0x10>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d9f116a4..fedfef24 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -112,6 +112,14 @@
 };
 
 &cbus {
+	gpio_intc: interrupt-controller at 9880 {
+		compatible = "amlogic,meson-gpio-intc";
+		reg = <0x9880 0x10>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		parent-interrupts = <64 65 66 67 68 79 70 71>;
+	};
+
 	clkc: clock-controller at 4000 {
 		#clock-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
-- 
2.13.0
