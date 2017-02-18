From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 18 Feb 2017 12:50:31 +0100
Subject: [PATCH v3 1/10] mmc: meson-gx: simplify bounce buffer setting in
 meson_mmc_start_cmd
Message-ID: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Core ensures that there are no commands with cmd->data being set and
nothing to transfer. And we don't have to reset bit CMD_CFG_DATA_NUM
because cmd_cfg was zero-initialized and this bit isn't set.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- adjusted commit message because branch xfer_bytes == 0 is never reached
- added acked-by
v3:
- no changes
---
 drivers/mmc/host/meson-gx-mmc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 5a959783..07a7399c 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -516,14 +516,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 			desc->cmd_cfg &= ~CMD_CFG_DATA_WR;
 		}
 
-		if (xfer_bytes > 0) {
-			desc->cmd_cfg &= ~CMD_CFG_DATA_NUM;
-			desc->cmd_data = host->bounce_dma_addr & CMD_DATA_MASK;
-		} else {
-			/* write data to data_addr */
-			desc->cmd_cfg |= CMD_CFG_DATA_NUM;
-			desc->cmd_data = 0;
-		}
+		desc->cmd_data = host->bounce_dma_addr & CMD_DATA_MASK;
 
 		cmd_cfg_timeout = 12;
 	} else {
-- 
2.11.1
