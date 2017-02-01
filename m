From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 1 Feb 2017 07:49:07 +0100
Subject: [PATCH v2 6/9] mmc: meson-gx: set max block count and request size
In-Reply-To: <584e5061-d359-1436-05ee-3767a5a4b10f@gmail.com>
References: <584e5061-d359-1436-05ee-3767a5a4b10f@gmail.com>
Message-ID: <aa425902-457d-2cd8-bc2a-4bac6938f076@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

So far max_blk_count isn't set what results in a default of value 8
to be used (PAGE_SIZE / block size).

Block length field has 9 bits, so set max_blk_count to 2^9-1 = 511.
In addition set max_req_size because max_blk_count is also limited
by max_req_size / block_size.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- added reviewed-by, tested-by, acked-by
---
 drivers/mmc/host/meson-gx-mmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 0fba23d2..883263c5 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -781,6 +781,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_host;
 
+	mmc->max_blk_count = CMD_CFG_LENGTH_MASK;
+	mmc->max_req_size = mmc->max_blk_count * mmc->max_blk_size;
+
 	/* data bounce buffer */
 	host->bounce_buf_size = SZ_512K;
 	host->bounce_buf =
-- 
2.11.0
