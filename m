From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 1 Feb 2017 07:48:21 +0100
Subject: [PATCH v2 1/9] mmc: meson-gx: fix setting f_min
Message-ID: <e8f1b59a-927b-b50e-4137-0b4b9e3cbc6e@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Currently f_min is set to 4 MHz whilst the comment states 400 MHz.
I think the itention is to set f_min to 400 kHz.
Change value and comment accordingly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- added acked-by
---
 drivers/mmc/host/meson-gx-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 5eca88bc..da3cce31 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -268,7 +268,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	if (f_min != UINT_MAX)
 		f_min = DIV_ROUND_UP(CLK_SRC_XTAL_RATE, CLK_DIV_MAX);
 	else
-		f_min = 4000000;  /* default min: 400 MHz */
+		f_min = 400000;  /* default min: 400 kHz */
 	host->mmc->f_min = f_min;
 
 	/* create the mux */
-- 
2.11.0
