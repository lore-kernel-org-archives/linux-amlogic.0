From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 30 Oct 2017 00:17:14 +0100
Subject: [PATCH 1/2] ARM: dts: meson: correct the sort order for the the
 gpio_intc node
In-Reply-To: <20171029231715.13391-1-martin.blumenstingl@googlemail.com>
References: <20171029231715.13391-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171029231715.13391-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Nodes are sorted by their register start address. Move gpio_intc to the
correct position.
No functional changes intended.

Fixes: 7d32bc03bcfb ("ARM: dts: meson8b: enable gpio interrupt controller")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 4926133077b3..b750c837ec39 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -85,15 +85,6 @@
 				reg = <0x7c00 0x200>;
 			};
 
-			gpio_intc: interrupt-controller at 9880 {
-				compatible = "amlogic,meson-gpio-intc";
-				reg = <0xc1109880 0x10>;
-				interrupt-controller;
-				#interrupt-cells = <2>;
-				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
-				status = "disabled";
-			};
-
 			hwrng: rng at 8100 {
 				compatible = "amlogic,meson-rng";
 				reg = <0x8100 0x8>;
@@ -191,6 +182,15 @@
 				status = "disabled";
 			};
 
+			gpio_intc: interrupt-controller at 9880 {
+				compatible = "amlogic,meson-gpio-intc";
+				reg = <0xc1109880 0x10>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
+				status = "disabled";
+			};
+
 			wdt: watchdog at 9900 {
 				compatible = "amlogic,meson6-wdt";
 				reg = <0x9900 0x8>;
-- 
2.14.3
