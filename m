From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sun, 21 Jan 2018 23:14:12 +0100
Subject: [PATCH v2 1/3] ARM: dts: meson8b: grow the reset controller memory
 zone
In-Reply-To: <20180121221414.1060-1-martin.blumenstingl@googlemail.com>
References: <20180121221414.1060-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180121221414.1060-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The reset controller in the Meson8b SoCs also supports level resets.
These use the same defines (from
dt-bindings/reset/amlogic,meson8b-reset.h) as the reset pulses.

The reset-meson driver internally handles the difference if a consumer
requests a reset pulse or a level reset. However, for this to work we
must extend the memory zone of the reset controller.

Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index c0f35acb5b4b..ac161a77aa40 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -152,7 +152,7 @@
 
 	reset: reset-controller at 4404 {
 		compatible = "amlogic,meson8b-reset";
-		reg = <0x4404 0x20>;
+		reg = <0x4404 0x9c>;
 		#reset-cells = <1>;
 	};
 
-- 
2.16.0
