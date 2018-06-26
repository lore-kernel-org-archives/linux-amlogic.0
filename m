From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 26 Jun 2018 10:09:12 +0200
Subject: [PATCH 2/2] clk: meson: remove unused clk-audio-divider driver
In-Reply-To: <20180620100610.29010-3-jbrunet@baylibre.com>
References: <20180620100610.29010-1-jbrunet@baylibre.com>
 <20180620100610.29010-3-jbrunet@baylibre.com>
Message-ID: <2cdbc56d-a1e5-62f7-c3d5-9d5f37544118@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 20/06/2018 12:06, Jerome Brunet wrote:
> clk-audio-divider is no longer used, we can remove it.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/Makefile            |   2 +-
>  drivers/clk/meson/clk-audio-divider.c | 110 ----------------------------------
>  drivers/clk/meson/clkc.h              |   7 ---
>  3 files changed, 1 insertion(+), 118 deletions(-)
>  delete mode 100644 drivers/clk/meson/clk-audio-divider.c
> 
[...]
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
