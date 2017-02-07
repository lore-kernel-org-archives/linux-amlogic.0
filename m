From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 7 Feb 2017 22:34:51 +0100
Subject: [PATCH v3 5/9] mmc: meson-gx: improve interrupt handling
In-Reply-To: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
References: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
Message-ID: <e3a3e5ef-2896-68e0-67d2-69a36e7892ee@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Disabling and immediately re-enabling interrupts in meson_mmc_request
doesn't provide a benefit. Instead enable interrupts in probe already.
And disable interrupts in remove, this was missing so far.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
v3:
- in probe leave the original behavior to first disable all irqs and
  then clear irq status bits
---
 drivers/mmc/host/meson-gx-mmc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index dd7f936c..4c622ad2 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -542,11 +542,6 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 	/* Stop execution */
 	writel(0, host->regs + SD_EMMC_START);
 
-	/* clear, ack, enable all interrupts */
-	writel(0, host->regs + SD_EMMC_IRQ_EN);
-	writel(IRQ_EN_MASK, host->regs + SD_EMMC_STATUS);
-	writel(IRQ_EN_MASK, host->regs + SD_EMMC_IRQ_EN);
-
 	host->mrq = mrq;
 
 	if (mrq->sbc)
@@ -775,6 +770,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	/* clear, ack, enable all interrupts */
 	writel(0, host->regs + SD_EMMC_IRQ_EN);
 	writel(IRQ_EN_MASK, host->regs + SD_EMMC_STATUS);
+	writel(IRQ_EN_MASK, host->regs + SD_EMMC_IRQ_EN);
 
 	ret = devm_request_threaded_irq(&pdev->dev, host->irq,
 					meson_mmc_irq, meson_mmc_irq_thread,
@@ -812,6 +808,9 @@ static int meson_mmc_remove(struct platform_device *pdev)
 	if (WARN_ON(!host))
 		return 0;
 
+	/* disable interrupts */
+	writel(0, host->regs + SD_EMMC_IRQ_EN);
+
 	if (host->bounce_buf)
 		dma_free_coherent(host->dev, host->bounce_buf_size,
 				  host->bounce_buf, host->bounce_dma_addr);
-- 
2.11.0
