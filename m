From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 27 Aug 2018 15:00:32 +0200
Subject: [PATCH] clk: meson: axg: round audio system master clocks down
In-Reply-To: <20180801140732.27671-1-jbrunet@baylibre.com>
References: <20180801140732.27671-1-jbrunet@baylibre.com>
Message-ID: <fbdc7304e8864ce35f27de2d932ccdc661187dbe.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, 2018-08-01 at 16:07 +0200, Jerome Brunet wrote:
> Some of the master clocks provided by the axg audio clock controller are
> system clock (spdifin and pdm sysclk). They are used to clock an internal
> DSP of the related devices. Having them constantly rounded down instead
> of closest is preferable.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg-audio.c | 34 +++++++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 11 deletions(-)

queued for 4.20
