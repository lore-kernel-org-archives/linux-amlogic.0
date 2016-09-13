From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 13 Sep 2016 18:15:45 +0200
Subject: [RFT] ARM64: dts: gxbb: add spifc device
In-Reply-To: <1473409738-27175-1-git-send-email-jbrunet@baylibre.com>
References: <1473409738-27175-1-git-send-email-jbrunet@baylibre.com>
Message-ID: <1473783345-8428-1-git-send-email-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Enable the spifc controller on the gxbb p200 and add spi nor device on
it. By default, the spi nor shown on the schematics is not present on
the actual hardware. Same goes for the resistor 4R3 which needs to be
soldered in order to connect the NOR_CS signal to the SPI device.

Keep in mind that the spifc lines are shared with the NAND controller.

This patch is not intended to be upstreamed and is provided here for
testing purpose.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 0eaca7277cfd..116cbc91c8e2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -77,3 +77,17 @@
 	pinctrl-0 = <&remote_input_ao_pins>;
 	pinctrl-names = "default";
 };
+
+&spifc {
+	status = "okay";
+	pinctrl-0 = <&nor_pins>;
+	pinctrl-names = "default";
+
+	spi-flash at 0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <30000000>;
+	};
+};
-- 
2.7.4
