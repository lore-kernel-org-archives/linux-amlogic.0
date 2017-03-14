From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Mar 2017 22:51:40 +0100
Subject: [PATCH v4 07/10] i2c: meson: improve interrupt handler and detect
 spurious interrupts
In-Reply-To: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
Message-ID: <d291628a-5350-e8b8-a764-dbd4842fd141@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

If state is STATE_IDLE no interrupt should occur. Return IRQ_NONE
if such a spurious interrupt is detected.
Not having to take care of STATE_IDLE later in the interrupt handler
allows to further simplify the interrupt handler in subsequent
patches of this series.

In addition move resetting REG_CTRL_START bit to the start of the
interrupt handler to ensure that the start bit is always reset.
Currently the start bit is not reset for STATE_STOP because
i2c->state is set to STATE_IDLE.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- don't print an error if spurious interrupt is detected
v3:
- don't remove a start bit reset, we need it to properly handle timeouts
- extend commit message
v4:
- no changes
---
 drivers/i2c/busses/i2c-meson.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 3fc1a715..0b09e059 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -228,12 +228,18 @@ static irqreturn_t meson_i2c_irq(int irqno, void *dev_id)
 	spin_lock(&i2c->lock);
 
 	meson_i2c_reset_tokens(i2c);
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_START, 0);
 	ctrl = readl(i2c->regs + REG_CTRL);
 
 	dev_dbg(i2c->dev, "irq: state %d, pos %d, count %d, ctrl %08x\n",
 		i2c->state, i2c->pos, i2c->count, ctrl);
 
-	if (ctrl & REG_CTRL_ERROR && i2c->state != STATE_IDLE) {
+	if (i2c->state == STATE_IDLE) {
+		spin_unlock(&i2c->lock);
+		return IRQ_NONE;
+	}
+
+	if (ctrl & REG_CTRL_ERROR) {
 		/*
 		 * The bit is set when the IGNORE_NAK bit is cleared
 		 * and the device didn't respond. In this case, the
@@ -276,15 +282,12 @@ static irqreturn_t meson_i2c_irq(int irqno, void *dev_id)
 		i2c->state = STATE_IDLE;
 		complete(&i2c->done);
 		break;
-	case STATE_IDLE:
-		break;
 	}
 
 out:
 	if (i2c->state != STATE_IDLE) {
 		/* Restart the processing */
 		meson_i2c_write_tokens(i2c);
-		meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_START, 0);
 		meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_START,
 				   REG_CTRL_START);
 	}
-- 
2.12.0
