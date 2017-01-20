From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 20 Jan 2017 08:20:24 -0800
Subject: [PATCH 1/2] ARM64: dts: meson-gxbb-odroidc2: fix GbE tx link breakage
In-Reply-To: <20170120162025.31806-1-khilman@baylibre.com>
References: <20170120162025.31806-1-khilman@baylibre.com>
Message-ID: <20170120162025.31806-2-khilman@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

OdroidC2 GbE link breaks under heavy tx transfer. This happens even if the
MAC does not enable Energy Efficient Ethernet (No Low Power state Idle on
the Tx path). The problem seems to come from the phy Rx path, entering the
LPI state.

Disabling EEE advertisement on the phy prevent this feature to be
negociated with the link partner and solve the issue.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5d28e1cdc998..c59403adb387 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -151,6 +151,18 @@
 	status = "okay";
 	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
+	phy-handle = <&eth_phy0>;
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy at 0 {
+			reg = <0>;
+			eee-broken-1000t;
+		};
+	};
 };
 
 &ir {
-- 
2.9.3
