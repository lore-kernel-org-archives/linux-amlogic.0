From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 16 Nov 2018 16:12:08 +0100
Subject: [PATCH v2 2/2] arm64: dts: meson: add libretech aml-s805x-ac board
In-Reply-To: <8736s1t94r.fsf@dell.be.48ers.dk>
References: <20181116093938.26373-1-jbrunet@baylibre.com>
 <20181116093938.26373-3-jbrunet@baylibre.com>
 <8736s1t94r.fsf@dell.be.48ers.dk>
Message-ID: <4d7628466f0128a34778d5eff164578812272711.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2018-11-16 at 15:00 +0100, Peter Korsgaard wrote:
> > > > > > "Jerome" == Jerome Brunet <jbrunet@baylibre.com> writes:
> 
>  > From: Neil Armstrong <narmstrong@baylibre.com>
>  > Add Libretech aml-s805x-ac board (aka 'La Frite') support
> 
>  > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>  > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
>  > +	vcck: regulator-vcck {
>  > +		compatible = "regulator-fixed";
>  > +		regulator-name = "VCCK";
>  > +		regulator-min-microvolt = <3300000>;
>  > +		regulator-max-microvolt = <3300000>;
>  > +		vin-supply = <&dc_5v>;
>  > +
>  > +		/*
>  > +		 * This is controlled by GPIOAO_9 we reserve this but
>  > +		 * claiming it as done bellow reset the board anyway
> 
> The 'bellow' typo is still here?
> 

Damn ! I messed up while formating the patch. Sorry for the noise, will resend
