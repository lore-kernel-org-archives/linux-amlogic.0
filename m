From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 11 Mar 2017 19:24:10 +0100
Subject: [PATCH v3 08/10] i2c: meson: don't create separate token chain just
 for the stop command
In-Reply-To: <a0ebd65b-712d-2b15-dcc6-3b8a9a619770@gmail.com>
References: <a0ebd65b-712d-2b15-dcc6-3b8a9a619770@gmail.com>
Message-ID: <814b4558-e3ec-7342-dd39-06d6af87573f@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

We can directly add the stop token to the token chain including the
last transfer chunk. This is more efficient than creating a separate
token chain just for the stop command.
And it allows us to get rid of state STATE_STOP completely.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- rebased
v3:
- no changes
---
 drivers/i2c/busses/i2c-meson.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 0b09e059..6c873ed8 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -55,7 +55,6 @@ enum {
 	STATE_IDLE,
 	STATE_READ,
 	STATE_WRITE,
-	STATE_STOP,
 };
 
 /**
@@ -205,19 +204,9 @@ static void meson_i2c_prepare_xfer(struct meson_i2c *i2c)
 
 	if (write)
 		meson_i2c_put_data(i2c, i2c->msg->buf + i2c->pos, i2c->count);
-}
-
-static void meson_i2c_stop(struct meson_i2c *i2c)
-{
-	dev_dbg(i2c->dev, "%s: last %d\n", __func__, i2c->last);
 
-	if (i2c->last) {
-		i2c->state = STATE_STOP;
+	if (i2c->last && i2c->pos + i2c->count >= i2c->msg->len)
 		meson_i2c_add_token(i2c, TOKEN_STOP);
-	} else {
-		i2c->state = STATE_IDLE;
-		complete(&i2c->done);
-	}
 }
 
 static irqreturn_t meson_i2c_irq(int irqno, void *dev_id)
@@ -262,7 +251,8 @@ static irqreturn_t meson_i2c_irq(int irqno, void *dev_id)
 		}
 
 		if (i2c->pos >= i2c->msg->len) {
-			meson_i2c_stop(i2c);
+			i2c->state = STATE_IDLE;
+			complete(&i2c->done);
 			break;
 		}
 
@@ -272,16 +262,13 @@ static irqreturn_t meson_i2c_irq(int irqno, void *dev_id)
 		i2c->pos += i2c->count;
 
 		if (i2c->pos >= i2c->msg->len) {
-			meson_i2c_stop(i2c);
+			i2c->state = STATE_IDLE;
+			complete(&i2c->done);
 			break;
 		}
 
 		meson_i2c_prepare_xfer(i2c);
 		break;
-	case STATE_STOP:
-		i2c->state = STATE_IDLE;
-		complete(&i2c->done);
-		break;
 	}
 
 out:
-- 
2.12.0
