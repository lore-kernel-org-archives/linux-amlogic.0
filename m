From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 1 Feb 2017 07:48:28 +0100
Subject: [PATCH v2 2/9] mmc: meson-gx: minor improvements in meson_mmc_set_ios
In-Reply-To: <584e5061-d359-1436-05ee-3767a5a4b10f@gmail.com>
References: <584e5061-d359-1436-05ee-3767a5a4b10f@gmail.com>
Message-ID: <6c3b7dbe-fb65-b40d-2625-342e2bd48776@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

val isn't used in the switch clause and afterwards there's an
identical statement. So remove it.

In case of an unexpected bus width the error message indicates
the intention to set the bus width to 4 and to go on.
So remove the return statement. This return statement also
conflicts with "setting to 4" because nothing would be set
actually before returning.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- added acked-by
---
 drivers/mmc/host/meson-gx-mmc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index da3cce31..38edc60d 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -379,7 +379,6 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	meson_mmc_clk_set(host, ios->clock);
 
 	/* Bus width */
-	val = readl(host->regs + SD_EMMC_CFG);
 	switch (ios->bus_width) {
 	case MMC_BUS_WIDTH_1:
 		bus_width = CFG_BUS_WIDTH_1;
@@ -394,7 +393,6 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 		dev_err(host->dev, "Invalid ios->bus_width: %u.  Setting to 4.\n",
 			ios->bus_width);
 		bus_width = CFG_BUS_WIDTH_4;
-		return;
 	}
 
 	val = readl(host->regs + SD_EMMC_CFG);
-- 
2.11.0
