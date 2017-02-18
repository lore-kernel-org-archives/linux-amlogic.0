From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 18 Feb 2017 14:06:29 +0100
Subject: [PATCH v3 2/10] mmc: meson-gx: make two functions return void
In-Reply-To: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
References: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
Message-ID: <df156d6f-3ea5-da37-e413-56862223460a@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The return value of meson_mmc_request_done and meson_mmc_read_resp
isn't used, so make both functions return void.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- added acked-by
v3:
- no changes
---
 drivers/mmc/host/meson-gx-mmc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 07a7399c..b99461ff 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -426,7 +426,8 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 			__func__, orig, val);
 }
 
-static int meson_mmc_request_done(struct mmc_host *mmc, struct mmc_request *mrq)
+static void meson_mmc_request_done(struct mmc_host *mmc,
+				   struct mmc_request *mrq)
 {
 	struct meson_host *host = mmc_priv(mmc);
 
@@ -435,8 +436,6 @@ static int meson_mmc_request_done(struct mmc_host *mmc, struct mmc_request *mrq)
 	host->mrq = NULL;
 	host->cmd = NULL;
 	mmc_request_done(host->mmc, mrq);
-
-	return 0;
 }
 
 static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
@@ -554,7 +553,7 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
 		meson_mmc_start_cmd(mmc, mrq->cmd);
 }
 
-static int meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
+static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
 {
 	struct meson_host *host = mmc_priv(mmc);
 
@@ -566,8 +565,6 @@ static int meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
 	} else if (cmd->flags & MMC_RSP_PRESENT) {
 		cmd->resp[0] = readl(host->regs + SD_EMMC_CMD_RSP);
 	}
-
-	return 0;
 }
 
 static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
-- 
2.11.1
