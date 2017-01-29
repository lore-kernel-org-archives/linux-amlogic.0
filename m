From: sst@poczta.fm (Slawomir Stepien)
Date: Sun, 29 Jan 2017 11:33:26 +0100
Subject: [RFC] spi-gpio on Odroid-C2 board
Message-ID: <20170129103326.GA26547@x220.localdomain>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi

Are there any issues regarding using spi-gpio on Odroid-C2 board dts file?
I would like to use it but from what I can see dts still doesn't have it?

I tested something like this and is seems to works:

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5d28e1cdc998..62104dcd48a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -135,6 +135,18 @@
                compatible = "mmc-pwrseq-emmc";
                reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
        };
+
+       spi-gpio {
+               compatible = "spi-gpio";
+               #address-cells = <1>;
+               #size-cells = <0>;
+               gpio-sck  = <&gpio GPIOX_2 GPIO_ACTIVE_HIGH>;
+               gpio-miso = <&gpio GPIOX_4 GPIO_ACTIVE_HIGH>;
+               gpio-mosi = <&gpio GPIOX_7 GPIO_ACTIVE_HIGH>;
+               cs-gpios  = <&gpio GPIOX_1 GPIO_ACTIVE_HIGH
+                            &gpio GPIOY_14 GPIO_ACTIVE_HIGH>;
+               num-chipselects = <2>;
+       };
 };
 
 &scpi_clocks {

-- 
Slawomir Stepien
