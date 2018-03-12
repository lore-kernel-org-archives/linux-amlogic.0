From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 12 Mar 2018 22:42:47 +0100
Subject: [RFC v1 5/7] ARM64: dts: meson-gxl-s905x-libretech-cc: enable the USB
 controller
In-Reply-To: <20180312214249.17846-1-martin.blumenstingl@googlemail.com>
References: <20180312214249.17846-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180312214249.17846-6-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The LibreTech CC ("Le Potato") board provides four USB connectors.
These are provided by a hub which is connected to the SoC's USB
controller.
Enable the SoC's USB controller to make the USB ports usable. Also turn
on the HDMI_5V regulator when powering on the PHY because (even though
it's not shown in the schematics) HDMI_5V also supplies the USB VBUS.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 22bf37404ff1..3e3eb31748a3 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -271,3 +271,15 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb0 {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	/*
+	 * even though the schematics don't show it:
+	 * HDMI_5V is also used as supply for the USB VBUS.
+	 */
+	phy-supply = <&hdmi_5v>;
+};
-- 
2.16.2
