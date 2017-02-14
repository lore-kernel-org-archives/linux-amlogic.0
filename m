From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Feb 2017 21:06:44 +0100
Subject: [PATCH 10/18] mmc: meson-gx: remove unused members irq, ocr_mask from
 struct meson_host
In-Reply-To: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
Message-ID: <29e26eba-ef27-1ee2-97f1-aeca3cfc76a5@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Member ocr_mask is never used and member irq we can replace with a
local variable in meson_mmc_probe. So let's remove both members.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 1a76c925..159ee7b4 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -128,8 +128,6 @@ struct meson_host {
 
 	spinlock_t lock;
 	void __iomem *regs;
-	int irq;
-	u32 ocr_mask;
 	struct clk *core_clk;
 	struct clk_mux mux;
 	struct clk *mux_clk;
@@ -696,7 +694,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct meson_host *host;
 	struct mmc_host *mmc;
-	int ret;
+	int ret, irq;
 
 	mmc = mmc_alloc_host(sizeof(struct meson_host), &pdev->dev);
 	if (!mmc)
@@ -728,8 +726,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		goto free_host;
 	}
 
-	host->irq = platform_get_irq(pdev, 0);
-	if (host->irq == 0) {
+	irq = platform_get_irq(pdev, 0);
+	if (!irq) {
 		dev_err(&pdev->dev, "failed to get interrupt resource.\n");
 		ret = -EINVAL;
 		goto free_host;
@@ -757,7 +755,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	writel(IRQ_EN_MASK, host->regs + SD_EMMC_STATUS);
 	writel(IRQ_EN_MASK, host->regs + SD_EMMC_IRQ_EN);
 
-	ret = devm_request_threaded_irq(&pdev->dev, host->irq, meson_mmc_irq,
+	ret = devm_request_threaded_irq(&pdev->dev, irq, meson_mmc_irq,
 					meson_mmc_irq_thread, IRQF_SHARED,
 					dev_name(&pdev->dev), host);
 	if (ret)
-- 
2.11.1
