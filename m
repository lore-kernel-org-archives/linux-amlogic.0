From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 7 Feb 2017 22:34:58 +0100
Subject: [PATCH v3 6/9] mmc: meson-gx: set max block count and request size
In-Reply-To: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
References: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
Message-ID: <64508f4b-39eb-7c45-50bf-013cbfb0561b@gmail.com>
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
v3:
- no changes
---
 drivers/mmc/host/meson-gx-mmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 4c622ad2..c9f25171 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -778,6 +778,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
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
