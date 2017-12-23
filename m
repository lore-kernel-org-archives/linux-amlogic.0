From: jbrunet@baylibre.com (Jerome Brunet)
Date: Sat, 23 Dec 2017 21:40:55 +0100
Subject: [RFT net-next 2/2] net: stmmac: dwmac-meson8b: don't try to
 change m250_div parent's rate
In-Reply-To: <CAFBinCBu-mswBeZudwcKVE921NFCNDLJ+ed1QUqFssDy+ar5vA@mail.gmail.com>
References: <20171223170433.8150-1-martin.blumenstingl@googlemail.com>
 <20171223170433.8150-3-martin.blumenstingl@googlemail.com>
 <1514050857.29566.53.camel@baylibre.com>
 <CAFBinCBu-mswBeZudwcKVE921NFCNDLJ+ed1QUqFssDy+ar5vA@mail.gmail.com>
Message-ID: <1514061655.2373.13.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2017-12-23 at 21:00 +0100, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Sat, Dec 23, 2017 at 6:40 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > On Sat, 2017-12-23 at 18:04 +0100, Martin Blumenstingl wrote:
> > > Trying to set the rate of m250_div's parent clock makes no sense since
> > > it's a mux which has neither CLK_MUX_ROUND_CLOSEST nor
> > > CLK_SET_RATE_PARENT set.
> > > It even does harm on Meson8b SoCs where the input clock for the mux
> > > cannot be divided down to 250MHz evenly (the parent rate is 500002394Hz)
> > 
> > So your problem is more with the mux actually, not the divider. Instead of
> > removing CLK_SET_RATE_PARENT from the divider, may I suggest to put
> > 
> > CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT on the parent mux, and keep
> > CLK_SET_RATE_PARENT (with CLK_DIVIDER_ROUND_CLOSEST)  on the divS.
> 
> I just gave this a try, here's the result:
>        mpll2                              1            1   127488329
>        0 0
>          c9410000.ethernet#m250_sel           1            1
> 127488329          0 0
>             c9410000.ethernet#m250_div           1            1
> 127488329          0 0
>                c9410000.ethernet#m25_div           1            1
> 25497666          0 0
> 
> > I suppose it would a accomplish the same thing with one added benefits for
> > meson8b :
> > 
> > If the bootloader did not set the mpll2 to the correct rate, it will now be done
> > thanks to rate propagation.
> 
> indeed, mpll2 is set to 0 by the bootloader on my board
> with that change we'll now also set the rate "correctly" (see below)
> 
> > If I missed anything, feel free to point it out.
> 
> it seems however that clk-mpll incorrectly calculates the register values
> with the mpll2 register values from Emiliano we can get to 25000120Hz
> however, I guess we need to have a look at the clk-mpll

Huuuu ! not again ! ;)

>  driver because:
> - by letting the common clock framework set the rate of mpll2 we get
> 25497666Hz (which means we're off by by ~500kHz, instead of 120Hz)

Could you dump the SDM and N2 values (devmem) that have been applied by CCF ?
to compare. If a better solution is available, I'm a bit surprised we don't find
 it. You may have a found something worth checking ...

> - according to the datasheet the allowed range of the mpll2 clock is
> 250..637MHz - 127488329Hz is what we get from the common clock
> framework

Yes, I've seen that but we are able compute out of that range and, so far, the
actual rate of clock seems coherent with the calculation. At least, when I
tested with the audio, it was the case.

> 
> Jerome: any idea why that is (more theoretical number games below though :))?
> 
> just a reminder from the other patch - these are the values used for
> the mpll2 clock:
> - parent rate = 2550MHz
> - SDM_DEN = 16384
> - SDM = 1638
> - N2 = 5
> = (parent rate 2550000000 * SDM_DEN 16384) / ((SDM_DEN 16384 * N2 5) +
> 1638) = 500002394Hz
> 
> using an SDM of 1639 gives us a 499996410Hz mpll2 clock
> with all the dividers we get down to a RGMII clock of 24999821Hz which
> is 179Hz off the desired 25MHz
> in other words: the mpll2 values set by Odroid-C1's u-boot are "best",
> so if we try to set mpll2's rate through the common clock framework we
> should try to get the same results (else we would just make the result
> worse)

Indeed, we should be able to do a lot better than 500kHz error. We should get to
the bottom of this. When testing on the S905 with audio, I got very values so I
did not question the mpll driver too much. Maybe there is something there.

Purely for debugging, from the ethernet driver, Could you try the following:
- Remove CLK_SET_RATE_PARENT from div250 to break the propagation there
- call set_rate on the mux with 500Mhz (we'll see far off we really are compared
to u-boot values and we will be able to compare)
- call set_rate on div25 as usual to get your ethernet running.

> 
> > Cheers
> > 
> > > which is why we need to use CLK_DIVIDER_ROUND_CLOSEST for the m250_div
> > > clock. The clk-divider driver however ignores the
> > > CLK_DIVIDER_ROUND_CLOSEST flag if CLK_SET_RATE_PARENT is set (because
> > > it simply tries to set the best possible clock rate for the parent,
> > > which does nothing in our case since the parent is a mux which doesn't
> > > allow rate changes as explained above).
> > > 
> > > This fixes setting the RGMII clock on Meson8 SoCs which ended up with a
> > > ~20MHz clock instead of the expected ~25MHz.
> > > The dwmac-meson8b driver requests a 25MHz clock rate for the m25_div
> > > (which only supports "divide by 5" and "divide by 10") clock which is
> > > derived from the m250_div clock. Due to clk-divider ignoring the
> > > CLK_DIVIDER_ROUND_CLOSEST flag the resulting m250_div clock was set to
> > > ~100MHz (divider = 5) and the m25_div clock was set to ~20MHz (divider =
> > > 5) by the common clock framework (as this value is closest to 25MHz if
> > > we would not have set CLK_DIVIDER_ROUND_CLOSEST). What we actually need
> > > however is a rate of ~250MHz on the m250_div clock (divider = 2) and
> > > ~25MHz on the m25_div clock (divider = 10) - these are also the values
> > > chosen by the out-of-tree vendor driver.
> > > With this we end up with a RGMII clock of 25000120Hz (which is as close
> > > to 25MHz we can get with an input clock of 500002394Hz).
> > > 
> > > SoCs from the Meson GX series are not affected by this change because
> > > the input clock is FCLK_DIV2 whose rate cannot be changed. Additionally
> > > the GX SoCs don't need to use the "closest" divider since the parent
> > > clock is a multiple of 250MHz.
> > > 
> > > Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> > > index c71966332387..26f41c117d63 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
> > > @@ -135,7 +135,7 @@ static int meson8b_init_clk(struct meson8b_dwmac *dwmac)
> > >       snprintf(clk_name, sizeof(clk_name), "%s#m250_div", dev_name(dev));
> > >       init.name = devm_kstrdup(dev, clk_name, GFP_KERNEL);
> > >       init.ops = &clk_divider_ops;
> > > -     init.flags = CLK_SET_RATE_PARENT;
> > > +     init.flags = 0;
> > >       clk_div_parents[0] = __clk_get_name(dwmac->m250_mux_clk);
> > >       init.parent_names = clk_div_parents;
> > >       init.num_parents = ARRAY_SIZE(clk_div_parents);
> 
> Regards
> Martin
