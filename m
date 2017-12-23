From: jbrunet@baylibre.com (Jerome Brunet)
Date: Sat, 23 Dec 2017 18:43:24 +0100
Subject: [RFT net-next 2/2] net: stmmac: dwmac-meson8b: don't try to
 change m250_div parent's rate
In-Reply-To: <1514050857.29566.53.camel@baylibre.com>
References: <20171223170433.8150-1-martin.blumenstingl@googlemail.com>
 <20171223170433.8150-3-martin.blumenstingl@googlemail.com>
 <1514050857.29566.53.camel@baylibre.com>
Message-ID: <1514051004.29566.55.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, 2017-12-23 at 18:40 +0100, Jerome Brunet wrote:
> > Trying to set the rate of m250_div's parent clock makes no sense since
> > it's a mux which has neither CLK_MUX_ROUND_CLOSEST nor
> > CLK_SET_RATE_PARENT set.
> > It even does harm on Meson8b SoCs where the input clock for the mux
> > cannot be divided down to 250MHz evenly (the parent rate is 500002394Hz)
> 
> So your problem is more with the mux actually, not the divider. Instead of
> removing CLK_SET_RATE_PARENT from the divider, may I suggest to put
> 
> CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT on the parent mux, and keep

Thinking about it, you don't even need CLK_SET_RATE_NO_REPARENT. Just let rate
propagation figure out the best combination 

> CLK_SET_RATE_PARENT (with CLK_DIVIDER_ROUND_CLOSEST)  on the divS.
> 
> I suppose it would a accomplish the same thing with one added benefits for
> meson8b :
> 
> If the bootloader did not set the mpll2 to the correct rate, it will now be done
> thanks to rate propagation.
> 
> If I missed anything, feel free to point it out.
> 
> Cheers 
