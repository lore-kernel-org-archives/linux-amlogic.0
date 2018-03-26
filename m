From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 26 Mar 2018 23:17:44 +0200
Subject: [PATCH v2 3/7] ARM64: dts: meson-gxl-s905x-p212: enable the USB
 controller
In-Reply-To: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
References: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180326211748.16488-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

All boards based on the P212 reference design (the P212 reference board
itself and the Khadas VIM) have USB connectors (in case of the Khadas
VIM the first port is exposed through the USB Type-C connector, the
second port is connected to a 4-port USB hub).
This enables the USB controller on these boards to make the USB ports
actually usable.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 0a0953fbc7d4..0cfd701809de 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -185,3 +185,7 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb0 {
+	status = "okay";
+};
-- 
2.16.3
