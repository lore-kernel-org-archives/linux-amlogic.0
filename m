From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 15 Jan 2018 12:45:02 +0100
Subject: [RFT net-next v4 0/5] dwmac-meson8b: clock fixes for Meson8b
In-Reply-To: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
References: <20180114214858.7217-1-martin.blumenstingl@googlemail.com>
Message-ID: <1516016702.2608.10.camel@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, 2018-01-14 at 22:48 +0100, Martin Blumenstingl wrote:
> Martin Blumenstingl (5):
>   net: stmmac: dwmac-meson8b: only configure the clocks in RGMII mode
>   net: stmmac: dwmac-meson8b: simplify generating the clock names
>   net: stmmac: dwmac-meson8b: fix internal RGMII clock configuration
>   net: stmmac: dwmac-meson8b: fix setting the RGMII TX clock on Meson8b
>   net: stmmac: dwmac-meson8b: propagate rate changes to the parent clock
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-meson8b.c    | 124 +++++++++++----------
>  1 file changed, 68 insertions(+), 56 deletions(-)

Ethernet works with this series applied (and tweaked DT patches from Emiliano)

Tested-by: Jerome Brunet <jbrunet@baylibre.com>
