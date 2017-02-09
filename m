From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Fri, 10 Feb 2017 00:09:47 +0100
Subject: [PATCH] ARM64: dts: meson-gxbb-odroidc2: switch ethernet phy mode to
 rgmii-txid
Message-ID: <5baa94a2-f45c-2ab3-0085-422436e12a84@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Documentation/networking/phy.txt states:
Whenever possible,use the PHY side RGMII delay.

The board uses a RTl8211F phy which supports creating the needed
tx delay internally. Therefore switch to rgmii-txid mode.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 3877dda6..94896139 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -152,6 +152,7 @@
 	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 	phy-handle = <&eth_phy0>;
+	phy-mode = "rgmii-txid";
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
-- 
2.11.0
