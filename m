From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 8 Feb 2017 22:49:29 +0100
Subject: [PATCH 4/4] ARM64: dts: meson-gxbb-odroidc2: add hw-reset capability
 flag for emmc port
In-Reply-To: <75ad5eac-412b-fe73-ff53-3d8b975937e4@gmail.com>
References: <75ad5eac-412b-fe73-ff53-3d8b975937e4@gmail.com>
Message-ID: <2b339eac-d139-563f-5c6d-a990429ff558@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add hw-reset capability flag for emmc port.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index c59403ad..2b68994a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -219,6 +219,7 @@
 	pinctrl-names = "default";
 
 	bus-width = <8>;
+	cap-mmc-hw-reset;
 	cap-sd-highspeed;
 	max-frequency = <200000000>;
 	non-removable;
-- 
2.11.0
