From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Feb 2017 21:07:17 +0100
Subject: [PATCH 18/18] mmc: meson-gx: move handling of one case from threaded
 handler to main irq
In-Reply-To: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
Message-ID: <625bbd38-6815-9d81-a480-e7ce0f4bc7eb@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

If cmd->data is NULL there's nothing to do in the threaded handler.
So we can handle this case in the main irq handler already.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 08ff29be..58b0add2 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -578,9 +578,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	if (status & IRQ_SDIO)
 		dev_dbg(host->dev, "Unhandled IRQ: SDIO.\n");
 
-	if (status & (IRQ_END_OF_CHAIN | IRQ_RESP_STATUS))
-		ret = IRQ_WAKE_THREAD;
-	else  {
+	if (status & (IRQ_END_OF_CHAIN | IRQ_RESP_STATUS)) {
+		if (cmd->data)
+			ret = IRQ_WAKE_THREAD;
+	} else {
 		dev_warn(host->dev, "Unknown IRQ! status=0x%04x: MMC CMD%u arg=0x%08x flags=0x%08x stop=%d\n",
 			 status, cmd->opcode, cmd->arg,
 			 cmd->flags, cmd->mrq->stop ? 1 : 0);
@@ -612,11 +613,11 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
 	struct mmc_data *data;
 	unsigned int xfer_bytes;
 
-	if (WARN_ON(!cmd))
+	if (WARN_ON(!cmd || !cmd->data))
 		return IRQ_NONE;
 
 	data = cmd->data;
-	if (data && data->flags & MMC_DATA_READ) {
+	if (data->flags & MMC_DATA_READ) {
 		size_t len = sg_copy_from_buffer(data->sg, data->sg_len,
 						 host->bounce_buf,
 						 host->bounce_buf_size);
-- 
2.11.1
