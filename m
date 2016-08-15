From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 15 Aug 2016 15:38:11 +0200
Subject: [PATCH 3/3] ARM64: dts: amlogic: enable ethernet on all Tronsmart
 Vega S95 devices
In-Reply-To: <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
 <20160815133811.19646-1-martin.blumenstingl@googlemail.com>
Message-ID: <20160815133811.19646-4-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

All of these have a Realtek Gbit RGMII PHY.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Andreas F?rber <afaerber@suse.de>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index af2e38e..5f50109 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -86,6 +86,12 @@
 
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
