From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu,  8 Nov 2018 14:07:44 +0100
Subject: [PATCH] arm64: dts: meson-axg: add secure monitor
Message-ID: <20181108130744.32323-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the secure monitor device to the axg platform.
With this, we can read the SoC serial number.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index e0139f174726..3cc0044d3468 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -110,6 +110,10 @@
 		};
 	};
 
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.19.1
