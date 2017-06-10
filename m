From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 10 Jun 2017 23:57:23 +0200
Subject: [PATCH v7 3/9] ARM: dts: meson: add GPIO interrupt-controller support
In-Reply-To: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
Message-ID: <95704321-1783-8ad0-e35d-3b439339e427@gmail.com>
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
v6:
- change parent-interrupts to interrupts
v7:
- no changes
---
 arch/arm/boot/dts/meson8.dtsi  | 8 ++++++++
 arch/arm/boot/dts/meson8b.dtsi | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 69930773..6c3a68af 100644
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
+		interrupts = <64 65 66 67 68 79 70 71>;
+	};
+
 	pinctrl_cbus: pinctrl at 9880 {
 		compatible = "amlogic,meson8-cbus-pinctrl";
 		reg = <0x9880 0x10>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d9f116a4..64d02932 100644
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
+		interrupts = <64 65 66 67 68 79 70 71>;
+	};
+
 	clkc: clock-controller at 4000 {
 		#clock-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
-- 
2.13.1
