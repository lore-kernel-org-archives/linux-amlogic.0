From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 30 Oct 2018 11:22:30 +0100
Subject: [PATCH 3/4] arm64: dts: meson-gx: add efuse pclk
In-Reply-To: <20181030102231.4851-1-jbrunet@baylibre.com>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
Message-ID: <20181030102231.4851-4-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the required peripheral clock for the efuse device.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 1ade7e486828..524f533e41d4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -282,6 +282,10 @@
 	compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
 };
 
+&efuse {
+	clocks = <&clkc CLKID_EFUSE>;
+};
+
 &ethmac {
 	clocks = <&clkc CLKID_ETH>,
 		 <&clkc CLKID_FCLK_DIV2>,
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 8f0bb3c44bd6..8ccab9a1ebcc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -75,6 +75,10 @@
 	};
 };
 
+&efuse {
+	clocks = <&clkc CLKID_EFUSE>;
+};
+
 &ethmac {
 	reg = <0x0 0xc9410000 0x0 0x10000
 	       0x0 0xc8834540 0x0 0x4>;
-- 
2.17.2
