From: khilman@baylibre.com (Kevin Hilman)
Date: Thu, 26 Apr 2018 16:35:34 -0700
Subject: [PATCH] mmc: meson-gx: add device reset
In-Reply-To: <20180426103817.12675-1-jbrunet@baylibre.com> (Jerome Brunet's
 message of "Thu, 26 Apr 2018 12:38:17 +0200")
References: <20180426103817.12675-1-jbrunet@baylibre.com>
Message-ID: <7ha7tp35ix.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Trigger the reset line of the mmc controller while probing, if available
> The reset should be optional for now, at least until all related DT node
> have the reset property
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
