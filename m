From: ldevulder@suse.de (Loic Devulder)
Date: Mon,  9 Jul 2018 17:34:06 +0200
Subject: [PATCH v2 1/2] ARM64: meson: Add 'usb2_phy0' in P212 DT file
In-Reply-To: <20180709153407.29138-1-ldevulder@suse.de>
References: <20180709153407.29138-1-ldevulder@suse.de>
Message-ID: <20180709153407.29138-2-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Enable power supply for USB Amlogic Meson GXL P212 based boards.

Signed-off-by: Loic Devulder <ldevulder@suse.de>
---
 arch/arm/dts/meson-gxl-s905x-p212.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/dts/meson-gxl-s905x-p212.dtsi b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
index 0cfd701809..4e61ec8f5b 100644
--- a/arch/arm/dts/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
@@ -189,3 +189,11 @@
 &usb0 {
 	status = "okay";
 };
+
+&usb2_phy0 {
+        /*
+         * even though the schematics don't show it:
+         * HDMI_5V is also used as supply for the USB VBUS.
+         */
+        phy-supply = <&hdmi_5v>;
+};
-- 
2.13.7
