From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Thu, 28 Sep 2017 12:31:04 +0200
Subject: [PATCH 2/4] ARM: dts: meson8b: extending ethernet controller
 description
In-Reply-To: <20170928022346.GB6726@otheros>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
 <aecccf76841a035f8dc5cc23dadfad66fbbac03e.1506507688.git.ingrassia@epigenesys.com>
 <20170928022346.GB6726@otheros>
Message-ID: <20170928103104.GA25546@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Linus,

thanks for the review!

On Thu, Sep 28, 2017 at 04:23:46AM +0200, Linus L?ssing wrote:
> On Wed, Sep 27, 2017 at 11:39:53PM +0200, Emiliano Ingrassia wrote:
> > This patch corrects the meson8b-dwmac reg attributes updated by the previous
> > 2/4 patch (450a483abe07f8d903c6cb74091592743975a8eb).
> > The second addresses range, taken from S805 (aka Meson8b) SoC manual,
> > was not correct.
> >
> > [..]
> >  &ethmac {
> > -	clocks = <&clkc CLKID_ETH>;
> > -	clock-names = "stmmaceth";
> > +	compatible = "amlogic,meson8b-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
> > +
> > +	interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
> > +		     <GIC_SPI 14 IRQ_TYPE_EDGE_RISING>;
> > +	interrupt-names = "macirq",
> > +			  "eth_lpi";
> > +
> > +	clock-names = "stmmaceth", "clkin0", "clkin1";
> > +	clocks = <&clkc CLKID_ETH>,
> > +		 <&clkc CLKID_FCLK_DIV2>,
> > +		 <&clkc CLKID_MPLL2>;
> > +
> > +	resets = <&reset RESET_ETHERNET>;
> > +	reset-names = "stmmaceth";
> > +
> > +	rx-fifo-depth=<4000>;
> > +	tx-fifo-depth=<2000>;
> >  };
> 
> Hi Emiliano,
> 
> Did you accidentally delete instead of replace the reg values?
> (or are there default values hidden somewhere else?)
> 

I intentionally deleted the reg attribute which is already included
in meson.dtsi. That attribute contains two address ranges, the second
of which is not reported on the S805 SoC manual and probably taken from
Amlogic's 3.10 GPL kernel sources.

> Also, please don't forget to add a v2/v3/etc. next time,
> makes it easier to follow here and in Patchwork, thanks :-).
> 
> 

Sure, sorry for the incovenience.

> And thanks a lot at looking into ethernet support as well. Will
> try this patchset soon, too! You guys are killing it :D!
>

Thanks! :D

> Regards, Linus

Regards,

Emiliano
