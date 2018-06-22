From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 22 Jun 2018 12:41:25 +0200
Subject: [PATCH] clk: meson: audio-divider is one based
In-Reply-To: <e8898e54-24b1-ec77-1b08-390607640747@baylibre.com>
References: <20180619154753.12788-1-jbrunet@baylibre.com>
 <e8898e54-24b1-ec77-1b08-390607640747@baylibre.com>
Message-ID: <1529664085.2900.3.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 2018-06-20 at 10:31 +0200, Neil Armstrong wrote:
> On 19/06/2018 17:47, Jerome Brunet wrote:
> > The audio divider is one based. This offset was mistakenly dropped from
> > recalc_rate() when migrating to clk_regmap.
> > 
> > Fixes: 88a4e1283681 ("clk: meson: migrate the audio divider clock to clk_regmap")
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/clk/meson/clk-audio-divider.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/meson/clk-audio-divider.c b/drivers/clk/meson/clk-audio-divider.c
> > index 58f546e04807..e4cf96ba704e 100644
> > --- a/drivers/clk/meson/clk-audio-divider.c
> > +++ b/drivers/clk/meson/clk-audio-divider.c
> > @@ -51,7 +51,7 @@ static unsigned long audio_divider_recalc_rate(struct clk_hw *hw,
> >  	struct meson_clk_audio_div_data *adiv = meson_clk_audio_div_data(clk);
> >  	unsigned long divider;
> >  
> > -	divider = meson_parm_read(clk->map, &adiv->div);
> > +	divider = meson_parm_read(clk->map, &adiv->div) + 1;
> >  
> >  	return DIV_ROUND_UP_ULL((u64)parent_rate, divider);
> >  }
> > 
> 
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> 

Applied for fixes
