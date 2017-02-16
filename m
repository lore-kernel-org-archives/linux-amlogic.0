From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 16 Feb 2017 20:41:18 +0100
Subject: [PATCH v2 3/9] mmc: meson-gx: remove unused members irq, ocr_mask
 from struct meson_host
In-Reply-To: <7d5263e2-9325-dedb-a5f6-954c4a09e977@gmail.com>
References: <7d5263e2-9325-dedb-a5f6-954c4a09e977@gmail.com>
Message-ID: <3115a01c-ea2e-9d75-7a8e-cb0c575130f6@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Member ocr_mask is never used and member irq we can replace with a
local variable in meson_mmc_probe. So let's remove both members.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- added acked-by
---
 drivers/mmc/host/meson-gx-mmc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index b99461ff..b9de3d47 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -127,8 +127,6 @@ struct meson_host {
 
 	spinlock_t lock;
 	void __iomem *regs;
-	int irq;
-	u32 ocr_mask;
 	struct clk *core_clk;
 	struct clk_mux mux;
 	struct clk *mux_clk;
@@ -712,7 +710,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct meson_host *host;
 	struct mmc_host *mmc;
-	int ret;
+	int ret, irq;
 
 	mmc = mmc_alloc_host(sizeof(struct meson_host), &pdev->dev);
 	if (!mmc)
@@ -744,8 +742,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		goto free_host;
 	}
 
-	host->irq = platform_get_irq(pdev, 0);
-	if (host->irq == 0) {
+	irq = platform_get_irq(pdev, 0);
+	if (!irq) {
 		dev_err(&pdev->dev, "failed to get interrupt resource.\n");
 		ret = -EINVAL;
 		goto free_host;
@@ -773,9 +771,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	writel(IRQ_EN_MASK, host->regs + SD_EMMC_STATUS);
 	writel(IRQ_EN_MASK, host->regs + SD_EMMC_IRQ_EN);
 
-	ret = devm_request_threaded_irq(&pdev->dev, host->irq,
-					meson_mmc_irq, meson_mmc_irq_thread,
-					IRQF_SHARED, DRIVER_NAME, host);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, meson_mmc_irq,
+					meson_mmc_irq_thread, IRQF_SHARED,
+					DRIVER_NAME, host);
 	if (ret)
 		goto free_host;
 
-- 
2.11.1
