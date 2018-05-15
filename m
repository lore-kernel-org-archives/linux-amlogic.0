From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 15 May 2018 11:57:47 +0200
Subject: [PATCH 1/2] dt-bindings: mmc: meson-gx: add reset
In-Reply-To: <20180515095748.6794-1-jbrunet@baylibre.com>
References: <20180515095748.6794-1-jbrunet@baylibre.com>
Message-ID: <20180515095748.6794-2-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the reset to the documentation of the meson-gx mmc controller
bindings.

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
index 50bf611a4d2c..2d54a08487f5 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
@@ -19,6 +19,7 @@ Required properties:
 	"clkin1" - Other parent clock of internal mux
   The driver has an internal mux clock which switches between clkin0 and clkin1 depending on the
   clock rate requested by the MMC core.
+- resets     : phandle of the internal reset line
 
 Example:
 
@@ -29,4 +30,5 @@ Example:
 		clocks = <&clkc CLKID_SD_EMMC_A>, <&xtal>, <&clkc CLKID_FCLK_DIV2>;
 		clock-names = "core", "clkin0", "clkin1";
 		pinctrl-0 = <&emmc_pins>;
+		resets = <&reset RESET_SD_EMMC_A>;
 	};
-- 
2.14.3
