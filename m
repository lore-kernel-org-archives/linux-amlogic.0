From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 7 Feb 2017 22:35:40 +0100
Subject: [PATCH v3 8/9] mmc: meson-gx: remove unneeded checks in remove
In-Reply-To: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
References: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
Message-ID: <b3177559-272e-38e1-c3fc-be9fa9796416@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The remove callback is called only if probe finished successfully.
Therefore these checks are not needed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
v3:
- no changes
---
 drivers/mmc/host/meson-gx-mmc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 4feb8971..3cc6334a 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -808,15 +808,11 @@ static int meson_mmc_remove(struct platform_device *pdev)
 {
 	struct meson_host *host = dev_get_drvdata(&pdev->dev);
 
-	if (WARN_ON(!host))
-		return 0;
-
 	/* disable interrupts */
 	writel(0, host->regs + SD_EMMC_IRQ_EN);
 
-	if (host->bounce_buf)
-		dma_free_coherent(host->dev, host->bounce_buf_size,
-				  host->bounce_buf, host->bounce_dma_addr);
+	dma_free_coherent(host->dev, host->bounce_buf_size,
+			  host->bounce_buf, host->bounce_dma_addr);
 
 	clk_disable_unprepare(host->cfg_div_clk);
 	clk_disable_unprepare(host->core_clk);
-- 
2.11.0
