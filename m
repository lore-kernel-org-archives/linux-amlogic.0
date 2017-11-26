From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 26 Nov 2017 17:40:57 +0100
Subject: [PATCH 4/4] i2c: meson: add some comments
In-Reply-To: <20171126164057.27728-1-b.galvani@gmail.com>
References: <20171126164057.27728-1-b.galvani@gmail.com>
Message-ID: <20171126164057.27728-5-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add some comment describing the purpose of struct members and
functions.

Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
---
 drivers/i2c/meson_i2c.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/meson_i2c.c b/drivers/i2c/meson_i2c.c
index 2f39214ad2..4f37d2f316 100644
--- a/drivers/i2c/meson_i2c.c
+++ b/drivers/i2c/meson_i2c.c
@@ -44,12 +44,12 @@ struct i2c_regs {
 
 struct meson_i2c {
 	struct i2c_regs *regs;
-	struct i2c_msg *msg;
-	bool last;
-	uint count;
-	uint pos;
-	u32 tokens[2];
-	uint num_tokens;
+	struct i2c_msg *msg;	/* Current I2C message */
+	bool last;		/* Whether the message is the last */
+	uint count;		/* Number of bytes in the current transfer */
+	uint pos;		/* Position of current transfer in message */
+	u32 tokens[2];		/* Sequence of tokens to be written */
+	uint num_tokens;	/* Number of tokens to be written */
 };
 
 static void meson_i2c_reset_tokens(struct meson_i2c *i2c)
@@ -69,6 +69,10 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
 	i2c->num_tokens++;
 }
 
+/*
+ * Retrieve data for the current transfer (which can be at most 8
+ * bytes) from the device internal buffer.
+ */
 static void meson_i2c_get_data(struct meson_i2c *i2c, u8 *buf, int len)
 {
 	u32 rdata0, rdata1;
@@ -86,6 +90,10 @@ static void meson_i2c_get_data(struct meson_i2c *i2c, u8 *buf, int len)
 		*buf++ = (rdata1 >> (i - 4) * 8) & 0xff;
 }
 
+/*
+ * Write data for the current transfer (which can be at most 8 bytes)
+ * to the device internal buffer.
+ */
 static void meson_i2c_put_data(struct meson_i2c *i2c, u8 *buf, int len)
 {
 	u32 wdata0 = 0, wdata1 = 0;
@@ -103,6 +111,11 @@ static void meson_i2c_put_data(struct meson_i2c *i2c, u8 *buf, int len)
 	debug("meson i2c: write data %08x %08x len %d\n", wdata0, wdata1, len);
 }
 
+/*
+ * Prepare the next transfer: pick the next 8 bytes in the remaining
+ * part of message and write tokens and data (if needed) to the
+ * device.
+ */
 static void meson_i2c_prepare_xfer(struct meson_i2c *i2c)
 {
 	bool write = !(i2c->msg->flags & I2C_M_RD);
-- 
2.14.3
