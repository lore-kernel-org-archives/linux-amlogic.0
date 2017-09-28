From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Thu, 28 Sep 2017 11:59:52 +0200
Subject: [PATCH 1/4] clk: meson8b: keep mpll2 clock enabled
In-Reply-To: <1506582709.16686.56.camel@baylibre.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
 <71634468832113ec4b7e88eaed11ab673ef2bb30.1506507688.git.ingrassia@epigenesys.com>
 <1506582709.16686.56.camel@baylibre.com>
Message-ID: <20170928095952.GA24801@ingrassia.epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Jerome,

thanks for review!

On Thu, Sep 28, 2017 at 09:11:49AM +0200, Jerome Brunet wrote:
> On Wed, 2017-09-27 at 12:40 +0200, Emiliano Ingrassia wrote:
> > The mpll2 clock, enabled by the bootloader, is disabled at boot.
> > Enabling ethernet on Odroid-C1+ board leads to DMA initialization failure
> > caused by a timeout on reset.
> > Keeping the mpll2 clock enabled solve this issue.
> 
> Shouldn't the DMA driver emable the clocks it needs itself instead ?
> BTW, I'm bit surprised an mpll is used to clock a DMA, is it possible we missed
> something here ?
>

The mpll2 clocks the meson8b ethernet controller which, as one can suppose,
internally have a DMA engine. If the controller is enabled, the first
operation on hardware is the DMA engine reset which fails if mpll2 is
disabled.
Actually the patch not only solves that issue, but also permits the
ethernet controller to work correctly.

The correct solution would be to enable the mpll2 clock from dwmac-meson8b
driver; I'm working on this.
In the meantime I release this patch to give others the chance
to use the ethernet controller on Odroid-C1/C1+.

Regards,

Emiliano

> > 
> > Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
> > ---
> >  drivers/clk/meson/meson8b.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> > index 20ab7190d328..5096539e4a63 100644
> > --- a/drivers/clk/meson/meson8b.c
> > +++ b/drivers/clk/meson/meson8b.c
> > @@ -347,6 +347,7 @@ static struct meson_clk_mpll meson8b_mpll2 = {
> >  		.ops = &meson_clk_mpll_ops,
> >  		.parent_names = (const char *[]){ "fixed_pll" },
> >  		.num_parents = 1,
> > +		.flags = (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
> >  	},
> >  };
> >  
> 
