From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 15 Jun 2017 23:33:52 +0200
Subject: [PATCH v2 10/10] ARM: dts: meson: use the real ethernet clock on
 Meson8 and Meson8b
In-Reply-To: <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
References: <20170611101644.28581-1-martin.blumenstingl@googlemail.com>
 <20170615213352.25134-1-martin.blumenstingl@googlemail.com>
Message-ID: <20170615213352.25134-11-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Until now clk81 was used as gate clock for the ethernet controller on
Meson8 whereas Meson8b did not configure a gate clock at all. Use
CLKID_ETH for both SoCs, which is the real gate clock for the ethernet
controller.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson8.dtsi  | 2 +-
 arch/arm/boot/dts/meson8b.dtsi | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index dfe83364eceb..cada35828931 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -242,7 +242,7 @@
 };
 
 &ethmac {
-	clocks = <&clkc CLKID_CLK81>;
+	clocks = <&clkc CLKID_ETH>;
 	clock-names = "stmmaceth";
 };
 
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 173b12a999e6..72e4f425f190 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -176,6 +176,11 @@
 	};
 };
 
+&ethmac {
+	clocks = <&clkc CLKID_ETH>;
+	clock-names = "stmmaceth";
+};
+
 &hwrng {
 	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
 	clocks = <&clkc CLKID_RNG0>;
-- 
2.13.1
