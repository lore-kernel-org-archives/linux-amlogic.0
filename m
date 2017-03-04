From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 4 Mar 2017 13:37:46 +0100
Subject: [PATCH v5 10/10] mmc: meson-gx: replace magic timeout numbers with
 constants
In-Reply-To: <a76c3483-2c86-85c1-446e-f2522bd28aa8@gmail.com>
References: <a76c3483-2c86-85c1-446e-f2522bd28aa8@gmail.com>
Message-ID: <ac1fd53c-e038-6312-4704-6aa385b8c230@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Replace timeout magic numbers with proper constants.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v3:
- added to patch series
v4:
- added acked-by
v5:
- rebased
---
 drivers/mmc/host/meson-gx-mmc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index d1826cf8..62597638 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -116,6 +116,8 @@
 
 #define SD_EMMC_CFG_BLK_SIZE 512 /* internal buffer max: 512 bytes */
 #define SD_EMMC_CFG_RESP_TIMEOUT 256 /* in clock cycles */
+#define SD_EMMC_CMD_TIMEOUT 1024 /* in ms */
+#define SD_EMMC_CMD_TIMEOUT_DATA 4096 /* in ms */
 #define SD_EMMC_CFG_CMD_GAP 16 /* in clock cycles */
 #define MUX_CLK_NUM_PARENTS 2
 
@@ -498,10 +500,10 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 
 		desc->cmd_data = host->bounce_dma_addr & CMD_DATA_MASK;
 
-		cmd_cfg_timeout = 12;
+		cmd_cfg_timeout = ilog2(SD_EMMC_CMD_TIMEOUT_DATA);
 	} else {
 		desc->cmd_cfg &= ~CMD_CFG_DATA_IO;
-		cmd_cfg_timeout = 10;
+		cmd_cfg_timeout = ilog2(SD_EMMC_CMD_TIMEOUT);
 	}
 	desc->cmd_cfg |= (cmd_cfg_timeout & CMD_CFG_TIMEOUT_MASK) <<
 		CMD_CFG_TIMEOUT_SHIFT;
-- 
2.12.0
