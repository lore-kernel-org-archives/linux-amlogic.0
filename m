From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 08 Feb 2018 09:07:00 +0100
Subject: [PATCH 05/19] clk: meson: add regmap clocks
In-Reply-To: <0bd2c95c-dab3-9796-1267-472e6a00a403@amlogic.com>
References: <20180131180945.18025-1-jbrunet@baylibre.com>
 <20180131180945.18025-6-jbrunet@baylibre.com>
 <0bd2c95c-dab3-9796-1267-472e6a00a403@amlogic.com>
Message-ID: <1518077220.15707.3.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, 2018-02-08 at 15:33 +0800, Yixun Lan wrote:
> > +/**
> > + * struct clk_regmap_mux_data - regmap backed multiplexer clock specific data
> > + *
> > + * @hw:              handle between common and hardware-specific interfaces
> > + * @offset:  offset of theregister controlling multiplexer
> > + * @table:   array of parent indexed register values
> > + * @shift:   shift to multiplexer bit field
> > + * @width:   width of mutliplexer bit field
> 
>       ~~~~~~ this is wrong, please update to keep it sync with the
> struct definition

Indeed, it is.
This is just a copy/paste of the mux documentation provided in
include/linux/clk-provider.h ... which is also inaccurate.

Thanks for pointing it out

> 
> > + * @flags:   hardware-specific flags
> > + *
> > + * Flags:
> > + * Same as clk_divider except CLK_MUX_HIWORD_MASK which is ignored
> > + */
> > +struct clk_regmap_mux_data {
> > +     unsigned int    offset;
> > +     u32             *table;
> > +     u32             mask;
> 
>                         ~~~~~ here
> > +     u8              shift;
> > +     u8              flags;
> > +};
> > +
