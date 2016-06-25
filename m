From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 25 Jun 2016 18:34:44 +0200
Subject: [PATCH 1/3] ARM64: dts: amlogic: enable ethernet on all Tronsmart
 Vega S95 devices
In-Reply-To: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
References: <20160625163446.7245-1-martin.blumenstingl@googlemail.com>
Message-ID: <20160625163446.7245-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

All of these have a Realtek Gbit RGMII PHY.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 54bb7c7..e36b509 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -60,3 +60,9 @@
 	pinctrl-names = "default";
 
 };
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+};
-- 
2.9.0
