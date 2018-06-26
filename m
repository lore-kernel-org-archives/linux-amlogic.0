From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 26 Jun 2018 10:08:59 +0200
Subject: [PATCH 1/2] clk: meson: stop rate propagation for audio clocks
In-Reply-To: <20180620100610.29010-2-jbrunet@baylibre.com>
References: <20180620100610.29010-1-jbrunet@baylibre.com>
 <20180620100610.29010-2-jbrunet@baylibre.com>
Message-ID: <76edc9c1-8fd2-de0a-ea88-ebb037a4775c@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 20/06/2018 12:06, Jerome Brunet wrote:
> It is actually a lot easier to setup the PLL with carefully chosen rates
> than relying on CCF clock propagation for this audio use case.
> This way, we can make sure we will always be able to provide the common
> audio clock rates, while having the PLL in the optimal operating range.
> 
> For this, we stop the rate propagation at the mux picking the
> PLL and let it round to the closest matching PLL.
> 
> Doing so, we can use the generic divider for the i2s clock.
> clk-audio-divider is no longer required. It was a (poor) attempt
> to use CCF rate propagation while making sure the PLL rate would
> be high enough to work with audio use cases.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/gxbb.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
[...]
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
