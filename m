From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 12 Apr 2017 21:33:57 +0200
Subject: [PATCH v2 4/5] media: rc: meson-ir: use readl_relaxed in the
 interrupt handler
In-Reply-To: <d5c18dbb-e86a-6b1c-1410-d6cc92dce711@gmail.com>
References: <d5c18dbb-e86a-6b1c-1410-d6cc92dce711@gmail.com>
Message-ID: <f44115e8-63de-2d8a-4864-1dff7e5b7a01@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

We don't need the memory barriers here and an interrupt handler should
be as fast as possible. Therefore switch to readl_relaxed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
v2:
- added R-b
---
 drivers/media/rc/meson-ir.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/meson-ir.c b/drivers/media/rc/meson-ir.c
index cf8943d2..1c72593d 100644
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
