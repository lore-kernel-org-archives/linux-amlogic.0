From: peter@korsgaard.com (Peter Korsgaard)
Date: Wed, 14 Nov 2018 15:37:25 +0100
Subject: [PATCH RESEND 2/2] arm64: dts: meson: add libretech aml-s805x-ac
 board
In-Reply-To: <20181114103855.14571-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Wed, 14 Nov 2018 11:38:55 +0100")
References: <20181114101925.10526-3-jbrunet@baylibre.com>
 <20181114103855.14571-1-jbrunet@baylibre.com>
Message-ID: <87a7mbvi6y.fsf@dell.be.48ers.dk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

>>>>> "Jerome" == Jerome Brunet <jbrunet@baylibre.com> writes:

 > From: Neil Armstrong <narmstrong@baylibre.com>
 > Add Libretech aml-s805x-ac board (aka 'La Frite') support

 > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
 > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
 > ---

..

 > +#include "meson-gxl-s905x.dtsi"
 > +
 > +/ {
 > +	compatible = "libretech,aml-s805x-ac", "amlogic,s805x",
 > +		     "amlogic,meson-gxl";
 > +	model = "Libre Computer Board AML-S805X-AC";

No mention of 'La Frite'?

 > +	memory at 0 {
 > +		device_type = "memory";
 > +		reg = <0x0 0x0 0x0 0x20000000>;
 > +	};

Maybe add a comment that there's 1GB variants as well?

> +
 > +	vcck: regulator-vcck {
 > +		compatible = "regulator-fixed";
 > +		regulator-name = "VCCK";
 > +		regulator-min-microvolt = <3300000>;
 > +		regulator-max-microvolt = <3300000>;
 > +		vin-supply = <&dc_5v>;
 > +
 > +		/*
 > +		 * This is controlled by GPIOAO_9 we reserve this but
 > +		 * claiming it as done bellow reset the board anyway

s/bellow/below/

 > +&spifc {
 > +	status = "okay";
 > +	pinctrl-0 = <&nor_pins>;
 > +	pinctrl-names = "default";
 > +
 > +	w25q32: spi-flash at 0 {
 > +		#address-cells = <1>;
 > +		#size-cells = <1>;
 > +		compatible = "jedec,spi-nor";
 > +		reg = <0>;
 > +		spi-max-frequency = <3000000>;

Is this 3MHz a limitation of the flash, board layout or SPI controller?

-- 
Bye, Peter Korsgaard
