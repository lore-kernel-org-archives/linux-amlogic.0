From: mturquette@baylibre.com (Michael Turquette)
Date: Thu, 25 May 2017 11:58:41 -0700
Subject: [PATCH v2 02/11] clk: add clk_core_set_phase_nolock function
In-Reply-To: <1495532928.2344.14.camel@baylibre.com>
References: <20170521215958.19743-1-jbrunet@baylibre.com>
 <20170521215958.19743-3-jbrunet@baylibre.com>
 <CABjU8Gu_0xgto6UfaOofW1RjZkEQtbreqqBS2Ukd+Q0DLSZG8w@mail.gmail.com>
 <1495532928.2344.14.camel@baylibre.com>
Message-ID: <149573872145.52617.10663444060792708996@resonance>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Quoting Jerome Brunet (2017-05-23 02:48:48)
> On Tue, 2017-05-23 at 12:35 +0300, Adriana Reus wrote:
> > On Mon, May 22, 2017 at 12:59 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > Create a core function for set_phase, as it is done for set_rate and
> > > set_parent.
> > > 
> > > This rework is done to ease the integration of "protected" clock
> > > functionality.
> > > 
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > > ?drivers/clk/clk.c | 31 +++++++++++++++++++------------
> > > ?1 file changed, 19 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index f5c371532509..6031fada37f9 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -1873,6 +1873,23 @@ int clk_set_parent(struct clk *clk, struct clk
> > > *parent)
> > > ?}
> > > ?EXPORT_SYMBOL_GPL(clk_set_parent);
> > > 
> > > +static int clk_core_set_phase_nolock(struct clk_core *core, int degrees)
> > > +{
> > > +???????int ret = -EINVAL;
> > > +
> > > +???????if (!core)
> > > +???????????????return 0;
> > > +
> > > +???????trace_clk_set_phase(clk->core, degrees);
> > 
> > ?^ trace_clk_set_phase(core, degrees)
> 
> Shame ... Once again this is a poor use of 'git add --patch'.
> This particular diff ended up in patch 5.
> 
> Thanks a lot for catching it!

Patch looks good to me overall. Can you reply here with V3? I'll apply
it to clk-next-protect for testing.

Regards,
Mike

> 
> > > +
> > > +???????if (core->ops->set_phase)
> > > +???????????????ret = core->ops->set_phase(core->hw, degrees);
> > > +
> > > +???????trace_clk_set_phase_complete(core, degrees);
> > > +
> > > +???????return ret;
> > > +}
> > > +
> > > ?/**
> > > ? * clk_set_phase - adjust the phase shift of a clock signal
> > > ? * @clk: clock signal source
> > > @@ -1895,7 +1912,7 @@ EXPORT_SYMBOL_GPL(clk_set_parent);
> > > ? */
> > > ?int clk_set_phase(struct clk *clk, int degrees)
> > > ?{
> > > -???????int ret = -EINVAL;
> > > +???????int ret;
> > > 
> > > ????????if (!clk)
> > > ????????????????return 0;
> > > @@ -1906,17 +1923,7 @@ int clk_set_phase(struct clk *clk, int degrees)
> > > ????????????????degrees += 360;
> > > 
> > > ????????clk_prepare_lock();
> > > -
> > > -???????trace_clk_set_phase(clk->core, degrees);
> > > -
> > > -???????if (clk->core->ops->set_phase)
> > > -???????????????ret = clk->core->ops->set_phase(clk->core->hw, degrees);
> > > -
> > > -???????trace_clk_set_phase_complete(clk->core, degrees);
> > > -
> > > -???????if (!ret)
> > > -???????????????clk->core->phase = degrees;
> > > -
> > > +???????ret = clk_core_set_phase_nolock(clk->core, degrees);
> > > ????????clk_prepare_unlock();
> > > 
> > > ????????return ret;
> > > --
> > > 2.9.4
> > > 
> > > --
> > > To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> > > the body of a message to majordomo at vger.kernel.org
> > > More majordomo info at??http://vger.kernel.org/majordomo-info.html
> 
