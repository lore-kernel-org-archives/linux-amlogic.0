From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 26 Mar 2018 23:17:48 +0200
Subject: [PATCH v2 7/7] ARM64: dts: meson-gxm-khadas-vim2: enable the USB
 controller
In-Reply-To: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
References: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180326211748.16488-8-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Khadas VIM2 board connects the dwc3 controller to an internal 4-port
USB hub which. Two of these ports are accessible directly soldered to
the board, while the other two are accessible through the 40-pin "GPIO"
header.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 447b9e22cf8e..6fda7283c732 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -412,3 +412,7 @@
 	status = "okay";
 	vref-supply = <&vddio_ao18>;
 };
+
+&usb0 {
+	status = "okay";
+};
-- 
2.16.3
