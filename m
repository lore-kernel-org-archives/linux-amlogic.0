From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 16 Feb 2017 20:40:51 +0100
Subject: [PATCH v2 1/9] mmc: meson-gx: simplify bounce buffer setting in
 meson_mmc_start_cmd
In-Reply-To: <7d5263e2-9325-dedb-a5f6-954c4a09e977@gmail.com>
References: <7d5263e2-9325-dedb-a5f6-954c4a09e977@gmail.com>
Message-ID: <7673059f-5bd0-a8e4-db3f-4f41370f8a11@gmail.com>
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
