From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  1 Oct 2016 17:21:34 +0200
Subject: [PATCH 3/3] ARM64: dts: meson-gxbb: add the USB reset also to the
 second USB PHY
In-Reply-To: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
References: <20161001152134.8168-1-martin.blumenstingl@googlemail.com>
Message-ID: <20161001152134.8168-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

When the USB PHY driver was introduced the reset framework did not
have support for triggering a reset pulse for shared resets. On GXBB
however there is only one reset line for both PHYs (meaning we have a
shared reset line). With the latest changes to the reset framework and
the corresponding updates to the phy-meson8b-usb2 driver we can now pass
the reset to the second PHY as well.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index cfa3902..2e89ec4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -165,6 +165,7 @@
 			compatible = "amlogic,meson-gxbb-usb2-phy";
 			#phy-cells = <0>;
 			reg = <0x0 0xc0000020 0x0 0x20>;
+			resets = <&reset RESET_USB_OTG>;
 			clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
 			clock-names = "usb_general", "usb";
 			status = "disabled";
-- 
2.10.0
