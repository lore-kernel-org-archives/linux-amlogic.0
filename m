From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 20 Sep 2017 16:40:09 +0200
Subject: [PATCH] ARM: dts: meson: enabling the USB Host controller on
 Odroid-C1/C1+ board
Message-ID: <20170920144009.GA27374@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch enables the USB Host controller (USB1) and the relative USB2 PHY
on Odroid-C1/C1+ board.

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index e50f1a1fdbc7..9ff6ca4e20d0 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -76,3 +76,26 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&gpio_ao {
+	/*
+	 * WARNING: The USB Hub on the Odroid-C1/C1+ needs a reset signal
+	 * to be turned high in order to be detected by the USB Controller.
+	 * This signal should be handled by a USB specific power sequence
+	 * in order to reset the Hub when USB bus is powered down.
+	 */
+	usb-hub {
+		gpio-hog;
+		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "usb-hub-reset";
+	};
+};
+
+&usb1_phy {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
-- 
2.14.1
