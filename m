From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 08 Dec 2017 10:50:03 -0800
Subject: [PATCH] clk: meson: gxbb: remove IGNORE_UNUSED from mmc clocks
In-Reply-To: <20171204133428.24631-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Mon, 4 Dec 2017 14:34:28 +0100")
References: <20171204133428.24631-1-jbrunet@baylibre.com>
Message-ID: <7hmv2tm4v8.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Remove CLK_IGNORE_UNUSED from mmc clocks. This was only needed while the
> mmc driver incorrectly used the xtal as source instead of the mmc
> clock. Now, the driver takes the correct clock, CCF is aware that the
> clock is being used and we can remove this flag.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>
