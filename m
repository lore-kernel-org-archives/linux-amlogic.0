From: jbrunet@baylibre.com (Jerome Brunet)
Date: Tue, 30 Jan 2018 20:10:57 +0100
Subject: [PATCH v2 0/9] clk: meson: pll fixes
In-Reply-To: <20180119155529.11532-1-jbrunet@baylibre.com>
References: <20180119155529.11532-1-jbrunet@baylibre.com>
Message-ID: <1517339457.3153.9.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2018-01-19 at 16:55 +0100, Jerome Brunet wrote:
> This changeset is a collection of fixes and clean-up around the pll clock
> provider. This has been triggered by the discussion around the ethernet
> clock on the axg [0].
> 
> On the axg the rate reported by the fixed_pll is off by 8Mhz, which leads
> the internal mux of the ethernet driver to pick an mpll2 instead of the
> fdiv4.
> 
> With this series applied, the fixed_pll of the axg now reports
> 1999998046 Hz, which is coherent with measurements (~2GHz)
> 
> While debugging this, we uncovered quite a mess around the hdmi_pll
> of the gxbb and gxl family. This is also fixed by this series.
> 
> Last, the parameters table provided to the read-only sys_plls have
> been removed, saving a bit of memory
> 
> There is still work to be done on this clock provider. Someday,
> I hope to see the parameter tables go away completely. This pll
> is just a (quite complex) fractional divider, we sould be able to
> figure something out at runtime.
> 
> Changes since v1: [1]
> * fix several typos in the comments
> * fix arm32 u64 math in patch 3 (Thanks a lot Martin!!)
> 
> [0]: https://lkml.kernel.org/r/1516095424.2608.36.camel at baylibre.com
> [1]: https://lkml.kernel.org/r/20180118184532.6856-1-jbrunet at baylibre.com

Series applied clk-meson next/drivers
