From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 25 Jan 2017 16:01:39 -0800
Subject: [PATCH] MMC: meson: cleanup stray debug messages
Message-ID: <20170126000139.5567-1-khilman@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Cleanup some debug prints that cause needless noise
during normal usage.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index b352760c041e..e848ff125fd7 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -480,9 +480,9 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 			blk_len = cfg & (CFG_BLK_LEN_MASK << CFG_BLK_LEN_SHIFT);
 			blk_len >>= CFG_BLK_LEN_SHIFT;
 			if (blk_len != ilog2(cmd->data->blksz)) {
-				dev_warn(host->dev, "%s: update blk_len %d -> %d\n",
+				dev_dbg(host->dev, "%s: update blk_len %d -> %d\n",
 					__func__, blk_len,
-					 ilog2(cmd->data->blksz));
+					ilog2(cmd->data->blksz));
 				blk_len = ilog2(cmd->data->blksz);
 				cfg &= ~(CFG_BLK_LEN_MASK << CFG_BLK_LEN_SHIFT);
 				cfg |= blk_len << CFG_BLK_LEN_SHIFT;
@@ -740,7 +740,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	ret = mmc_of_parse(mmc);
 	if (ret) {
-		dev_warn(&pdev->dev, "error parsing DT: %d\n", ret);
+		if (ret != -EPROBE_DEFER)
+			dev_warn(&pdev->dev, "error parsing DT: %d\n", ret);
 		goto free_host;
 	}
 
-- 
2.9.3
