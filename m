From: jbrunet@baylibre.com (Jerome Brunet)
Date: Sat, 23 Dec 2017 23:41:01 +0100
Subject: [RFT net-next 2/2] net: stmmac: dwmac-meson8b: don't try to
 change m250_div parent's rate
In-Reply-To: <CAFBinCBuyNwu9L-OhsPJ72S9xNjyAWovgjFjPXGAfri-+tDxWg@mail.gmail.com>
References: <20171223170433.8150-1-martin.blumenstingl@googlemail.com>
 <20171223170433.8150-3-martin.blumenstingl@googlemail.com>
 <1514050857.29566.53.camel@baylibre.com>
 <CAFBinCBu-mswBeZudwcKVE921NFCNDLJ+ed1QUqFssDy+ar5vA@mail.gmail.com>
 <1514061655.2373.13.camel@baylibre.com>
 <CAFBinCBuyNwu9L-OhsPJ72S9xNjyAWovgjFjPXGAfri-+tDxWg@mail.gmail.com>
Message-ID: <1514068861.4333.10.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2017-12-23 at 22:49 +0100, Martin Blumenstingl wrote:
> while calculating this with a target frequency of 500MHz manually
> again I saw that there's a remainder of 10Mhz after the initial
> division.
> remainder * SDM_DEN = 163840000000 - this value overflows 32-bit,
> things will go downhill from here... :)
> long story short: here's a patch for that issue: [0]

Thanks for the fix !

> 
> the results with "CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT" on the mux:

Actually, I don't think you need the CLK_SET_RATE_NO_REPARENT

>     fixed_pll                             3            3  2550000000
>        0 0
>       mpll2                              1            1   124999851
>       0 0
>          c9410000.ethernet#m250_sel           1            1
> 124999851          0 0
>             c9410000.ethernet#m250_div           1            1
> 124999851          0 0
>                c9410000.ethernet#m25_div           1            1
> 24999971          0 0
> 
> this is even closer to 25MHz than the values in the vendor driver
> (120Hz vs 29Hz)
> I'll re-spin this series, then Emiliano "just" has to confirm that
> it's also working for him (despite the dividers in the dwmac-meson8b
> driver are set up different compared to the vendor driver)

if the rate of the parent clock of mux may change, I think following part should
be changed as well

	case PHY_INTERFACE_MODE_RMII:
		/* Use the rate of the mux clock for the internal RMII PHY */
		clk_rate = clk_get_rate(dwmac->m250_mux_clk);

I think it is a bit weak anyway, as it depends on the initial settings. Do you
remember why you wrote this way ?

> 
> > > - according to the datasheet the allowed range of the mpll2 clock is
> > > 250..637MHz - 127488329Hz is what we get from the common clock
> > > framework
> > 
> > Yes, I've seen that but we are able compute out of that range and, so far, the
> > actual rate of clock seems coherent with the calculation. At least, when I
> > tested with the audio, it was the case.
> 
> I'm curious: ...on a GX SoCs probably?

Indeed, you got me !
