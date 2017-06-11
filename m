From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 11 Jun 2017 12:16:38 +0200
Subject: [PATCH 07/13] ARM: dts: meson8: add the pins for the SDIO controller
In-Reply-To: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170611101644.28581-8-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 93e437c91c61..1bbfc04c3f10 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -158,6 +158,30 @@
 			gpio-ranges = <&pinctrl_cbus 0 0 120>;
 		};
 
+		sd_a_pins: sd-a {
+			mux {
+				groups = "sd_d0_a", "sd_d1_a", "sd_d2_a",
+					"sd_d3_a", "sd_clk_a", "sd_cmd_a";
+				function = "sd_a";
+			};
+		};
+
+		sd_b_pins: sd-b {
+			mux {
+				groups = "sd_d0_b", "sd_d1_b", "sd_d2_b",
+					"sd_d3_b", "sd_clk_b", "sd_cmd_b";
+				function = "sd_b";
+			};
+		};
+
+		sd_c_pins: sd-c {
+			mux {
+				groups = "sd_d0_c", "sd_d1_c", "sd_d2_c",
+					"sd_d3_c", "sd_clk_c", "sd_cmd_c";
+				function = "sd_c";
+			};
+		};
+
 		spi_nor_pins: nor {
 			mux {
 				groups = "nor_d", "nor_q", "nor_c", "nor_cs";
-- 
2.13.1
