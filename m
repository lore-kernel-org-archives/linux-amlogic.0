From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 21 May 2018 10:47:17 +0200
Subject: [PATCH v2] clk: meson: meson8b: mark fclk_div2 gate clocks as
 CLK_IS_CRITICAL
In-Reply-To: <20180520171606.4430-1-martin.blumenstingl@googlemail.com>
References: <20180520171606.4430-1-martin.blumenstingl@googlemail.com>
Message-ID: <1526892437.2822.2.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 2018-05-20 at 19:16 +0200, Martin Blumenstingl wrote:
> Until commit 05f814402d6174 ("clk: meson: add fdiv clock gates") we
> relied on the bootloader to enable the fclk_div clock gates. It turns
> out that our clock tree is incomplete at least on Meson8b (tested with
> an Odroid-C1, which uses an RGMII PHY) because after the mentioned
> commit Ethernet is not working anymore (no RX/TX activity can be seen).
> At the same time Ethernet was still working on Meson8m2 with a RMII PHY.
> 
> Testing has shown that as soon as "fclk_div2" is disabled Ethernet stops
> working on Odroid-C1. Unfortunately it's currently not clear what the
> Ethernet controller IP block uses the fclk_div2 clock for. Mark the
> clock as CLK_IS_CRITICAL to keep it enabled (as it's already enabled by
> most bootloaders by default, which is why we didn't notice it before).
> 
> Fixes: 05f814402d6174 ("clk: meson: add fdiv clock gates")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> ---
> changes since v1 at [0]:
> - only fclk_div2 has to be kept running (so the commit message and the
>   patch itself are updated)
> - added a FIXME comment to the code
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-May/007272.html
> 
>  drivers/clk/meson/meson8b.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Added :
Cc: stable at vger.kernel.org 

and applied. Thx Martin
