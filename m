From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 26 Mar 2018 23:17:45 +0200
Subject: [PATCH v2 4/7] ARM64: dts: meson-gx-p23x-q20x: enable the USB
 controller
In-Reply-To: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
References: <20180326211748.16488-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180326211748.16488-5-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

All S905D (GXL) and S912 (GXM) reference boards (namely these are
P230, P231, Q200 and Q201) provide USB connectors.
This enables the USB controller on these boards to make the USB ports
actually usable.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index 4eef36b22538..88e712ea757a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -212,3 +212,7 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb0 {
+	status = "okay";
+};
-- 
2.16.3
