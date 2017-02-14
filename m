From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Feb 2017 21:06:17 +0100
Subject: [PATCH 04/18] mmc: meson-gx: improve meson_mmc_start_cmd
In-Reply-To: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
Message-ID: <df8da322-6a42-642c-2c80-55fca0dab3ef@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Remove use of unneeded members cmd_arg and cmd_resp.
Setting SD_EMMC_CMD_RSP is only needed if CMD_CFG_RESP_NUM is set,
so don't write this register in all other cases.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index ece38b44..630e0590 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -456,7 +456,6 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 	desc->cmd_cfg |= (cmd->opcode & CMD_CFG_CMD_INDEX_MASK)	<<
 		CMD_CFG_CMD_INDEX_SHIFT;
 	desc->cmd_cfg |= CMD_CFG_OWNER;  /* owned by CPU */
-	desc->cmd_arg = cmd->arg;
 
 	/* Response */
 	if (cmd->flags & MMC_RSP_PRESENT) {
@@ -464,7 +463,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 		if (cmd->flags & MMC_RSP_136)
 			desc->cmd_cfg |= CMD_CFG_RESP_128;
 		desc->cmd_cfg |= CMD_CFG_RESP_NUM;
-		desc->cmd_resp = 0;
+		writel(0, host->regs + SD_EMMC_CMD_RSP);
 
 		if (!(cmd->flags & MMC_RSP_CRC))
 			desc->cmd_cfg |= CMD_CFG_RESP_NOCRC;
@@ -540,9 +539,8 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 	desc->cmd_cfg |= CMD_CFG_END_OF_CHAIN;
 	writel(desc->cmd_cfg, host->regs + SD_EMMC_CMD_CFG);
 	writel(desc->cmd_data, host->regs + SD_EMMC_CMD_DAT);
-	writel(desc->cmd_resp, host->regs + SD_EMMC_CMD_RSP);
 	wmb(); /* ensure descriptor is written before kicked */
-	writel(desc->cmd_arg, host->regs + SD_EMMC_CMD_ARG);
+	writel(cmd->arg, host->regs + SD_EMMC_CMD_ARG);
 }
 
 static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
-- 
2.11.1
