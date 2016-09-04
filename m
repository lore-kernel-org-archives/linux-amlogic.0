From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun,  4 Sep 2016 20:29:03 +0200
Subject: [PATCH v2 3/3] ARM64: dts: amlogic: enable ethernet on all Tronsmart
 Vega S95 devices
In-Reply-To: <20160904182903.1841-1-martin.blumenstingl@googlemail.com>
References: <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
 <20160904182903.1841-1-martin.blumenstingl@googlemail.com>
Message-ID: <20160904182903.1841-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

All of these have a Realtek Gbit RGMII PHY.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Andreas F?rber <afaerber@suse.de>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 4573bac..463185d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -92,6 +92,12 @@
 	pinctrl-names = "default";
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+};
+
 &sd_emmc_b {
 	status = "okay";
 	pinctrl-0 = <&sdcard_pins>;
-- 
2.9.3
