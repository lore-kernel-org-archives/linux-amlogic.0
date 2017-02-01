From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 1 Feb 2017 07:49:27 +0100
Subject: [PATCH v2 8/9] mmc: meson-gx: remove unneeded checks in remove
In-Reply-To: <584e5061-d359-1436-05ee-3767a5a4b10f@gmail.com>
References: <584e5061-d359-1436-05ee-3767a5a4b10f@gmail.com>
Message-ID: <abf8a44d-7381-ea1f-44c6-27ccec3f647d@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The remove callback is called only if probe finished successfully.
Therefore these checks are not needed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- no changes
---
 drivers/mmc/host/meson-gx-mmc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 48ce4ba4..bc787444 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -811,15 +811,11 @@ static int meson_mmc_remove(struct platform_device *pdev)
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
