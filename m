From: mturquette@baylibre.com (Michael Turquette)
Date: Wed, 22 Jun 2016 19:12:23 -0700
Subject: [PATCH v2 3/3] arm64: dts: gxbb clock controller
In-Reply-To: <1466647943-23193-1-git-send-email-mturquette@baylibre.com>
References: <1466647943-23193-1-git-send-email-mturquette@baylibre.com>
Message-ID: <1466647943-23193-4-git-send-email-mturquette@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add the clock controller node for the AmLogic GXBB machine.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
Changed in v2:
* nest the clock-controller node inside the hiubus node; suggested by
  Kevin Hilman

 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 806b90392402..e502c24b0ac7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -315,6 +315,12 @@
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xc883c000 0x0 0x2000>;
+
+			clkc: clock-controller at 0 {
+				compatible = "amlogic,gxbb-clkc";
+				#clock-cells = <1>;
+				reg = <0x0 0x0 0x0 0x3db>;
+			};
 		};
 
 		apb: apb at d0000000 {
-- 
2.1.4
