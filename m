From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 03 Jan 2018 12:06:43 +0100
Subject: [RFT net-next v3 3/5] net: stmmac: dwmac-meson8b: fix internal
 RGMII clock configuration
In-Reply-To: <CAFBinCAXy+cgju3peA=YBHJReUu=vh8to4UVU5qebN67AZOgPg@mail.gmail.com>
References: <20171228222128.15215-1-martin.blumenstingl@googlemail.com>
 <20171228222128.15215-4-martin.blumenstingl@googlemail.com>
 <1514570234.7439.15.camel@baylibre.com>
 <CAFBinCAXy+cgju3peA=YBHJReUu=vh8to4UVU5qebN67AZOgPg@mail.gmail.com>
Message-ID: <1514977603.7439.30.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2017-12-30 at 00:40 +0100, Martin Blumenstingl wrote:
> > Maybe this bit 10 is indeed a 5/10 divider, as amlogic claims it is. Maybe, as
> > Emiliano suggested, the output rate of div250 actually needs to be 250Mhz in
> > RGMII, before being divided by 10 to produce the 25MHz of div25
> > 
> > IOW, maybe we need this intermediate rate.
> 
> I am starting to believe that you (Emiliano and Jerome) are both right
> does anyone of you have access to a scope so we can measure the actual
> clock output?

I wanted to check this out on Gx but the 25M output is not any of the boards I
have (p200, OC2, S400). I should be able to look at the related SoC pad on the
p200 but, I don't know how to enable the GPIOCLK_1 Function 1 in the pinmux
configuration

> 
> > It would not be surprising, 1GBps usually requires a 125MHz clock somewhere.
> 
> this could mean that two clocks are derived from m250_div (names are
> not final obviously):
> - phy_ref_clk (25MHz or 50MHz)
> - rgmii_tx_clk (fixed divide by 2, 125MHz)

Probably yes.

What we consider in the code as div250 divider is actually described in snip of
doc we have as:
-----
bit 10 : Generate 25MHz clock for PHY
bit 9-7: RMII & RGMII mode:
- 001: clock source is 250MHz
- 010: clock source is 500MHz.
...
-----

1) It kind of shows that the minimum input frequency could be 250M indeed.
2) It is these unclear whether bit 10 is a gate or a divider ... ATM, I can't
check that myself
3) Looks like properly setting up div250 should also be done for RMII.

> 
> > This is still doable:
> > * Keep the divider
> > * drop CLK_SET_RATE_PARENT on div25
> > * call set_rate on div250 with 250MHz then on div25 with 25Mhz
> 
> yep, I will try this next
> this would also be work with the assumption that the rgmii_tx_clk is
> derived from m250_div
