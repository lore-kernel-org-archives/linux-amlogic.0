From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 8 Jun 2017 07:56:49 +0200
Subject: [PATCH] mmc: meson-gx: work around broken SDIO with certain WiFi chips
Message-ID: <6369801d-b991-6949-9bc1-d43fa6819505@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

There have been reports about SDIO failing with certain WiFi chips in
descriptor chain mode. SD / eMMC are working fine.

So let's fall back to bounce buffer mode for command SD_IO_RW_EXTENDED.
This was reported to fix this error.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 1842ed34..4cdbe3c0 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -210,6 +210,15 @@ static void meson_mmc_get_transfer_mode(struct mmc_host *mmc,
 	int i;
 	bool use_desc_chain_mode = true;
 
+	/*
+	 * Broken SDIO with AP6335-based WiFi on Khadas VIM Pro has been
+	 * reported. For some strange reason this occurs in descriptor
+	 * chain mode only. So let's fall back to bounce buffer mode
+	 * for command SD_IO_RW_EXTENDED.
+	 */
+	if (mrq->cmd->opcode == SD_IO_RW_EXTENDED)
+		return;
+
 	for_each_sg(data->sg, sg, data->sg_len, i)
 		/* check for 8 byte alignment */
 		if (sg->offset & 7) {
-- 
2.13.0
