From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 21 Jan 2018 23:14:14 +0100
Subject: [PATCH v2 3/3] ARM: dts: meson8: add the USB reset line
In-Reply-To: <20180121221414.1060-1-martin.blumenstingl@googlemail.com>
References: <20180121221414.1060-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180121221414.1060-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Now that we support the reset controller on Meson8 we can add the reset
line to the USB PHYs (just like on Meson8b).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson8.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index efd854c0f9e3..1c6647685655 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -391,10 +391,12 @@
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
2.16.0
