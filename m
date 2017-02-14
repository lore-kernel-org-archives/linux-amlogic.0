From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Feb 2017 21:05:47 +0100
Subject: [PATCH 01/18] mmc: meson-gx: set segment host parameters
In-Reply-To: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
Message-ID: <e336daec-55fc-e524-9949-b8de7d68b9ef@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Setting the segment parameters boosted the read performance from
13 MB/s to 32 MB/s in my case.
Default for segment size is only 4k (PAGE_SIZE).

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 5a959783..1ad66f84 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -118,6 +118,7 @@
 #define SD_EMMC_CFG_RESP_TIMEOUT 256 /* in clock cycles */
 #define SD_EMMC_CFG_CMD_GAP 16 /* in clock cycles */
 #define MUX_CLK_NUM_PARENTS 2
+#define MESON_MMC_MAX_SEGS 512
 
 struct meson_host {
 	struct	device		*dev;
@@ -789,8 +790,10 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_host;
 
+	mmc->max_segs = MESON_MMC_MAX_SEGS;
 	mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
 	mmc->max_req_size = mmc->max_blk_count * mmc->max_blk_size;
+	mmc->max_seg_size = mmc->max_req_size;
 
 	/* data bounce buffer */
 	host->bounce_buf_size = mmc->max_req_size;
-- 
2.11.1
