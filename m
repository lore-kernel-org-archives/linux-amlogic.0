From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Fri, 24 Mar 2017 23:10:58 +0100
Subject: [PATCH 3/4] mmc: meson-gx: switch to dynamic timeout values
In-Reply-To: <f6960395-370e-16b0-1a2a-2a1fce720d45@gmail.com>
References: <f6960395-370e-16b0-1a2a-2a1fce720d45@gmail.com>
Message-ID: <c6a47d71-edc7-5396-e275-07432dffad3a@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Currently we use a fixed timeout of 4s for all data transfers. Switch
to dynamic timeout values by making use of data->timeout_ns.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index b0a9317b..e637b3ba 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -169,6 +169,18 @@ struct sd_emmc_desc {
 #define CMD_RESP_MASK GENMASK(31, 1)
 #define CMD_RESP_SRAM BIT(0)
 
+static unsigned int meson_mmc_get_timeout(struct mmc_data *data)
+{
+	unsigned int timeout = data->timeout_ns / NSEC_PER_MSEC;
+
+	if (!timeout)
+		return SD_EMMC_CMD_TIMEOUT_DATA;
+
+	timeout = roundup_pow_of_two(timeout);
+
+	return min(timeout, 32768U); /* max. 2^15 ms */
+}
+
 static int meson_mmc_clk_set(struct meson_host *host, unsigned long clk_rate)
 {
 	struct mmc_host *mmc = host->mmc;
@@ -448,7 +460,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
 	if (data) {
 		cmd_cfg |= CMD_CFG_DATA_IO;
 		cmd_cfg |= FIELD_PREP(CMD_CFG_TIMEOUT_MASK,
-				      ilog2(SD_EMMC_CMD_TIMEOUT_DATA));
+				      ilog2(meson_mmc_get_timeout(data)));
 
 		if (data->blocks > 1) {
 			cmd_cfg |= CMD_CFG_BLOCK_MODE;
-- 
2.12.0
