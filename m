From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Mar 2017 22:51:51 +0100
Subject: [PATCH v4 10/10] i2c: meson: improve and simplify interrupt handler
In-Reply-To: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
Message-ID: <d017b5be-941c-a749-6eb4-72c3e5c357db@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The preceding changes in this patch series now allow to simplify
the interrupt handler significantly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rebased
v3:
- no changes
v4:
- no changes
---
 drivers/i2c/busses/i2c-meson.c | 40 ++++++++++------------------------------
 1 file changed, 10 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 23f25efa..590715ae 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -239,41 +239,21 @@ static irqreturn_t meson_i2c_irq(int irqno, void *dev_id)
 		goto out;
 	}
 
-	switch (i2c->state) {
-	case STATE_READ:
-		if (i2c->count > 0) {
-			meson_i2c_get_data(i2c, i2c->msg->buf + i2c->pos,
-					   i2c->count);
-			i2c->pos += i2c->count;
-		}
-
-		if (i2c->pos >= i2c->msg->len) {
-			i2c->state = STATE_IDLE;
-			complete(&i2c->done);
-			break;
-		}
-
-		meson_i2c_prepare_xfer(i2c);
-		break;
-	case STATE_WRITE:
-		i2c->pos += i2c->count;
+	if (i2c->state == STATE_READ && i2c->count)
+		meson_i2c_get_data(i2c, i2c->msg->buf + i2c->pos, i2c->count);
 
-		if (i2c->pos >= i2c->msg->len) {
-			i2c->state = STATE_IDLE;
-			complete(&i2c->done);
-			break;
-		}
+	i2c->pos += i2c->count;
 
-		meson_i2c_prepare_xfer(i2c);
-		break;
+	if (i2c->pos >= i2c->msg->len) {
+		i2c->state = STATE_IDLE;
+		complete(&i2c->done);
+		goto out;
 	}
 
+	/* Restart the processing */
+	meson_i2c_prepare_xfer(i2c);
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_START, REG_CTRL_START);
 out:
-	if (i2c->state != STATE_IDLE)
-		/* Restart the processing */
-		meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_START,
-				   REG_CTRL_START);
-
 	spin_unlock(&i2c->lock);
 
 	return IRQ_HANDLED;
-- 
2.12.0
