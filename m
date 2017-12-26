From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue, 26 Dec 2017 12:43:45 +0100
Subject: [PATCH 3/3] ARM: dts: meson8: add the USB reset line
In-Reply-To: <20171226114345.23905-1-martin.blumenstingl@googlemail.com>
References: <20171226114345.23905-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171226114345.23905-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Now that we support the reset controller on Meson8 we can add the reset
line to the USB PHYs (just like on Meson8b).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index ad4cfbeaf706..77f7c992ff70 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -539,10 +539,12 @@
 	compatible = "amlogic,meson8-usb2-phy", "amlogic,meson-mx-usb2-phy";
 	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
 	clock-names = "usb_general", "usb";
+	resets = <&reset RESET_USB_OTG>;
 };
 
 &usb1_phy {
 	compatible = "amlogic,meson8-usb2-phy", "amlogic,meson-mx-usb2-phy";
 	clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
 	clock-names = "usb_general", "usb";
+	resets = <&reset RESET_USB_OTG>;
 };
-- 
2.15.1
