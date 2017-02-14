From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Feb 2017 22:18:44 +0100
Subject: [PATCH] ARM64: dts: meson-gxbb-odroidc2: Enable SARADC node
Message-ID: <c8ffa8db-2bfd-ee28-a210-4fa752b5ff43@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Now that 3adbf3427330 "iio: adc: add a driver for the SAR ADC found in
Amlogic Meson SoCs" has added support for the ADC, let's enable it
on Odroid C2.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 714ec145..3877dda6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -194,6 +194,11 @@
 	status = "okay";
 };
 
+&saradc {
+	status = "okay";
+	vref-supply = <&vcc1v8>;
+};
+
 /* SD */
 &sd_emmc_b {
 	status = "okay";
-- 
2.11.1
