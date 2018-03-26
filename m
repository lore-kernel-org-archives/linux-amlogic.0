From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 26 Mar 2018 23:17:47 +0200
Subject: [PATCH v2 6/7] ARM64: dts: meson-gxl-nexbox-a95x: enable the USB
 controller
In-Reply-To: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
References: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180326211748.16488-7-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The Nexbox A95X provides two USB ports. Enable the SoC's USB controller
on this board to make these USB ports usable.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
index 69c721a70e44..6739697be1de 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts
@@ -215,3 +215,7 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb0 {
+	status = "okay";
+};
-- 
2.16.3
