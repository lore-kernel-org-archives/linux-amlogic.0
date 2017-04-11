From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 11 Apr 2017 08:05:26 +0200
Subject: [PATCH 4/5] media: rc: meson-ir: use readl_relaxed in the interrupt
 handler
In-Reply-To: <f65a1465-14ba-8db2-7726-454dcfbee69d@gmail.com>
References: <f65a1465-14ba-8db2-7726-454dcfbee69d@gmail.com>
Message-ID: <3add55c4-1e29-f070-6fef-7f92b2595874@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

We don't need the memory barriers here and an interrupt handler should
be as fast as possible. Therefore switch to readl_relaxed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/media/rc/meson-ir.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index d56ef27e..246da2db 100644
--- a/drivers/media/rc/meson-ir.c
+++ b/drivers/media/rc/meson-ir.c
@@ -83,16 +83,17 @@ static void meson_ir_set_mask(struct meson_ir *ir, unsigned int reg,
 static irqreturn_t meson_ir_irq(int irqno, void *dev_id)
 {
 	struct meson_ir *ir = dev_id;
-	u32 duration;
+	u32 duration, status;
 	DEFINE_IR_RAW_EVENT(rawir);
 
 	spin_lock(&ir->lock);
 
-	duration = readl(ir->reg + IR_DEC_REG1);
+	duration = readl_relaxed(ir->reg + IR_DEC_REG1);
 	duration = FIELD_GET(REG1_TIME_IV_MASK, duration);
 	rawir.duration = US_TO_NS(duration * MESON_TRATE);
 
-	rawir.pulse = !!(readl(ir->reg + IR_DEC_STATUS) & STATUS_IR_DEC_IN);
+	status = readl_relaxed(ir->reg + IR_DEC_STATUS);
+	rawir.pulse = !!(status & STATUS_IR_DEC_IN);
 
 	ir_raw_event_store_with_filter(ir->rc, &rawir);
 	ir_raw_event_handle(ir->rc);
-- 
2.12.2
