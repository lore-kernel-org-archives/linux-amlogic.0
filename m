From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Feb 2017 21:06:39 +0100
Subject: [PATCH 09/18] mmc: meson-gx: change interrupt name
In-Reply-To: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
Message-ID: <cbe84305-803a-5431-9246-0b30d6f135b0@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

So far the driver name is used for the interrupt. Therefore in
/proc/interrupts we can't tell which interrupt belongs to which
SD_EMMC port.
So let's use the device name instead (what is the OF node name).

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index a67c811e..1a76c925 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -757,9 +757,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	writel(IRQ_EN_MASK, host->regs + SD_EMMC_STATUS);
 	writel(IRQ_EN_MASK, host->regs + SD_EMMC_IRQ_EN);
 
-	ret = devm_request_threaded_irq(&pdev->dev, host->irq,
-					meson_mmc_irq, meson_mmc_irq_thread,
-					IRQF_SHARED, DRIVER_NAME, host);
+	ret = devm_request_threaded_irq(&pdev->dev, host->irq, meson_mmc_irq,
+					meson_mmc_irq_thread, IRQF_SHARED,
+					dev_name(&pdev->dev), host);
 	if (ret)
 		goto free_host;
 
-- 
2.11.1
