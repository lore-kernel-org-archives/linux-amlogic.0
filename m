From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 12 Mar 2018 21:57:09 +0100
Subject: [PATCH v3 1/1] ARM: dts: meson8b: the CBUS GPIO controller only has
 83 GPIOs
In-Reply-To: <20180312205709.27131-1-martin.blumenstingl@googlemail.com>
References: <20180312205709.27131-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180312205709.27131-2-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Update the "gpio-ranges" property of the CBUS GPIO controller on Meson8b
because it only provides 83 GPIOs.
The GPIO definitions in include/dt-bindings/gpio/meson8b-gpio.h
inherited all GPIOs from Meson8 until recently. However, Meson8b does
not support all GPIOs which are supported by Meson8 (Meson8b doesn't
have a GPIOZ bank, most of the pins from the GPIODV bank are missing on
Meson8b - just to name a few differences).

The actual number of GPIOs is only 83, instead of 120 from Meson8 plus
the 10 GPIOs from the DIF bank on Meson8b.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/meson8b.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 5f7841b2d163..9fa77975354b 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -183,7 +183,7 @@
 			reg-names = "mux", "pull", "pull-enable", "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&pinctrl_cbus 0 0 130>;
+			gpio-ranges = <&pinctrl_cbus 0 0 83>;
 		};
 
 		eth_rgmii_pins: eth-rgmii {
-- 
2.16.2
