From: webczat@webczatnet.pl (=?UTF-8?q?Micha=C5=82=20Zegan?=)
Date: Thu, 16 Feb 2017 15:52:22 +0100
Subject: [PATCH 2/2] mmc: meson-gx: remove mmc host on device removal
In-Reply-To: <20170216145222.1577-1-webczat@webczatnet.pl>
References: <20170216145222.1577-1-webczat@webczatnet.pl>
Message-ID: <20170216145222.1577-3-webczat@webczatnet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The mmc host was added in meson_mmc_probe, but never removed in meson_mmc_remove.
Fix that by removing the host before deallocating other resources.

Signed-off-by: Micha? Zegan <webczat@webczatnet.pl>
---
 drivers/mmc/host/meson-gx-mmc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index d444b6bfa02b..bb83446118a3 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -818,6 +818,8 @@ static int meson_mmc_remove(struct platform_device *pdev)
 	if (WARN_ON(!host))
 		return 0;
 
+	mmc_remove_host(host->mmc);
+
 	if (host->bounce_buf)
 		dma_free_coherent(host->dev, host->bounce_buf_size,
 				  host->bounce_buf, host->bounce_dma_addr);
-- 
2.11.0
