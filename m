From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 27 Apr 2018 11:33:40 +0200
Subject: [PATCH 0/2] clk: meson: mpll: add round closest support
In-Reply-To: <20180420095603.29964-1-jbrunet@baylibre.com>
References: <20180420095603.29964-1-jbrunet@baylibre.com>
Message-ID: <1524821620.4026.113.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, 2018-04-20 at 11:56 +0200, Jerome Brunet wrote:
> ATM, the mpll driver can only round the requested rate down, even if
> rounding up would have provided a better approximation of the requested
> rate.
> 
> This patchset adds a flag to enable rounding to the closest rate possible,
> even if it means rounding up.
> 
> The flag is then enabled on the axg platform to improve the rates provided
> to the audio subsystem.
> 
> Jerome Brunet (2):
>   clk: meson: mpll: add round closest support
>   clk: meson: axg: let mpll clocks round closest
> 
>  drivers/clk/meson/axg.c      |  4 ++++
>  drivers/clk/meson/clk-mpll.c | 25 ++++++++++++++++++++-----
>  drivers/clk/meson/clkc.h     |  3 +++
>  3 files changed, 27 insertions(+), 5 deletions(-)
> 

Series applied with Neil's ack
