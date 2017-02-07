From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 7 Feb 2017 22:35:02 +0100
Subject: [PATCH v3 7/9] mmc: meson-gx: reduce bounce buffer size
In-Reply-To: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
References: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
Message-ID: <104a768e-fee3-0643-fed9-b4362b2366a1@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

A bounce buffer of 512K isn't needed as the max request size is
511 * 512 byte.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
v3:
- no changes
---
 drivers/mmc/host/meson-gx-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c9f25171..4feb8971 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -782,7 +782,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	mmc->max_req_size = mmc->max_blk_count * mmc->max_blk_size;
 
 	/* data bounce buffer */
-	host->bounce_buf_size = SZ_512K;
+	host->bounce_buf_size = mmc->max_req_size;
 	host->bounce_buf =
 		dma_alloc_coherent(host->dev, host->bounce_buf_size,
 				   &host->bounce_dma_addr, GFP_KERNEL);
-- 
2.11.0
