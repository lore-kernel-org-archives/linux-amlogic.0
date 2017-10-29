From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 30 Oct 2017 00:05:22 +0100
Subject: [PATCH 2/3] ARM: dts: meson8: enable the GPIO interrupt controller
In-Reply-To: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
References: <20171029230523.7355-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171029230523.7355-3-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This enables the GPIO interrupt controller for the Meson8 SoCs.
Interrupt support on the GPIOs can be used by the MMC framework to
detect when an SD card is inserted/removed or by the input framework to
detect button presses.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index eb3f8161eef0..bedcbebc2433 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -286,6 +286,11 @@
 	clock-names = "stmmaceth";
 };
 
+&gpio_intc {
+	compatible = "amlogic,meson8-gpio-intc", "amlogic,meson-gpio-intc";
+	status = "okay";
+};
+
 &hwrng {
 	compatible = "amlogic,meson8-rng", "amlogic,meson-rng";
 	clocks = <&clkc CLKID_RNG0>;
-- 
2.14.3
