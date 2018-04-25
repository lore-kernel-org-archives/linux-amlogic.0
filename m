From: jbrunet@baylibre.com (Jerome Brunet)
Date: Wed, 25 Apr 2018 11:59:56 +0200
Subject: [PATCH 1/2] clk: honor CLK_MUX_ROUND_CLOSEST in generic clk mux
In-Reply-To: <CAAEAJfDgGYu9WR5+qA-trQUTkb--bam=LLbhH+1N2OdrtBGLzA@mail.gmail.com>
References: <20180409135921.5617-1-jbrunet@baylibre.com>
 <20180409135921.5617-2-jbrunet@baylibre.com>
 <CAAEAJfDgGYu9WR5+qA-trQUTkb--bam=LLbhH+1N2OdrtBGLzA@mail.gmail.com>
Message-ID: <1524650396.4026.55.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, 2018-04-24 at 11:04 -0300, Ezequiel Garcia wrote:
> >   }
> > +EXPORT_SYMBOL_GPL(clk_mux_determine_rate_flags);
> > 
> 
> Why do we need to export this?

Because any driver implementing some type of mux may use this function, and the
driver could be a module. I have one in the pipe right now.

It is the same as __clk_determine_rate(), __clk_mux_determine_rate_closest()
