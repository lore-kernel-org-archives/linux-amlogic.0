From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 26 Nov 2017 17:40:56 +0100
Subject: [PATCH 3/4] i2c: meson: fix return codes on error
In-Reply-To: <20171126164057.27728-1-b.galvani@gmail.com>
References: <20171126164057.27728-1-b.galvani@gmail.com>
Message-ID: <20171126164057.27728-4-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Change meson_i2c_xfer_msg() to return -EREMOTEIO in case of NACK, as
done by other drivers. Also, don't change the return error in
meson_i2c_xfer().

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 drivers/i2c/meson_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/meson_i2c.c b/drivers/i2c/meson_i2c.c
index 84e1997c76..2f39214ad2 100644
--- a/drivers/i2c/meson_i2c.c
+++ b/drivers/i2c/meson_i2c.c
@@ -178,7 +178,7 @@ static int meson_i2c_xfer_msg(struct meson_i2c *i2c, struct i2c_msg *msg,
 
 		if (readl(&i2c->regs->ctrl) & REG_CTRL_ERROR) {
 			debug("meson i2c: error\n");
-			return -ENXIO;
+			return -EREMOTEIO;
 		}
 
 		if ((msg->flags & I2C_M_RD) && i2c->count) {
@@ -200,7 +200,7 @@ static int meson_i2c_xfer(struct udevice *bus, struct i2c_msg *msg,
 	for (i = 0; i < nmsgs; i++) {
 		ret = meson_i2c_xfer_msg(i2c, msg + i, i == nmsgs - 1);
 		if (ret)
-			return -EREMOTEIO;
+			return ret;
 	}
 
 	return 0;
-- 
2.14.3
