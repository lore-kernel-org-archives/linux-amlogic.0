From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 08 Dec 2017 22:01:21 +0100
Subject: [PATCH] clk: meson: gxbb: remove IGNORE_UNUSED from mmc clocks
In-Reply-To: <7hmv2tm4v8.fsf@baylibre.com>
References: <20171204133428.24631-1-jbrunet@baylibre.com>
 <7hmv2tm4v8.fsf@baylibre.com>
Message-ID: <1512766881.334.0.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2017-12-08 at 10:50 -0800, Kevin Hilman wrote:
> Jerome Brunet <jbrunet@baylibre.com> writes:
> 
> > Remove CLK_IGNORE_UNUSED from mmc clocks. This was only needed while the
> > mmc driver incorrectly used the xtal as source instead of the mmc
> > clock. Now, the driver takes the correct clock, CCF is aware that the
> > clock is being used and we can remove this flag.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Acked-by: Kevin Hilman <khilman@baylibre.com>

Thanks Kevin
Applied
