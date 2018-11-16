From: peter@korsgaard.com (Peter Korsgaard)
Date: Fri, 16 Nov 2018 15:00:36 +0100
Subject: [PATCH v2 2/2] arm64: dts: meson: add libretech aml-s805x-ac board
In-Reply-To: <20181116093938.26373-3-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Fri, 16 Nov 2018 10:39:38 +0100")
References: <20181116093938.26373-1-jbrunet@baylibre.com>
 <20181116093938.26373-3-jbrunet@baylibre.com>
Message-ID: <8736s1t94r.fsf@dell.be.48ers.dk>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

>>>>> "Jerome" == Jerome Brunet <jbrunet@baylibre.com> writes:

 > From: Neil Armstrong <narmstrong@baylibre.com>
 > Add Libretech aml-s805x-ac board (aka 'La Frite') support

 > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
 > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

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

The 'bellow' typo is still here?

-- 
Bye, Peter Korsgaard
