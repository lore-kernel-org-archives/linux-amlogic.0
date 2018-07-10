From: ldevulder@suse.de (Loic Devulder)
Date: Tue, 10 Jul 2018 10:01:07 +0200
Subject: [PATCH v4 1/2] ARM64: meson: Sync DT with Linux 4.17.5
In-Reply-To: <20180710080108.9976-1-ldevulder@suse.de>
References: <20180710080108.9976-1-ldevulder@suse.de>
Message-ID: <20180710080108.9976-2-ldevulder@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Synchronize the Linux Device Tree for Amlogic Meson GX boards from Linux 4.17.5
(Linux commit 54fb3c180d05e9dfda892a93413514e99f0cbb19).

This will enable HDMI_5V for USB Amlogic Meson GXL P212 based boards.

Signed-off-by: Loic Devulder <ldevulder@suse.de>
---
 arch/arm/dts/meson-gxl-s905x-p212.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/dts/meson-gxl-s905x-p212.dtsi b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
index 0cfd701809..3bd405079b 100644
--- a/arch/arm/dts/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm/dts/meson-gxl-s905x-p212.dtsi
@@ -189,3 +189,10 @@
 &usb0 {
 	status = "okay";
 };
+
+&usb2_phy0 {
+        /*
+         * HDMI_5V is also used as supply for the USB VBUS.
+         */
+        phy-supply = <&hdmi_5v>;
+};
-- 
2.13.7
