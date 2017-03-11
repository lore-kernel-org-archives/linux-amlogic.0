From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 11 Mar 2017 19:23:34 +0100
Subject: [PATCH v3 06/10] i2c: meson: remove variable count from meson_i2c_xfer
In-Reply-To: <a0ebd65b-712d-2b15-dcc6-3b8a9a619770@gmail.com>
References: <a0ebd65b-712d-2b15-dcc6-3b8a9a619770@gmail.com>
Message-ID: <9c53cd4b-a56f-764d-9e13-9e8a94182037@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Variable count has always the same value as i, so we don't need it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove one small change from v1
v3:
- no changes
---
 drivers/i2c/busses/i2c-meson.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 03f70282..3fc1a715 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -364,7 +364,7 @@ static int meson_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			  int num)
 {
 	struct meson_i2c *i2c = adap->algo_data;
-	int i, ret = 0, count = 0;
+	int i, ret = 0;
 
 	clk_enable(i2c->clk);
 
@@ -372,12 +372,11 @@ static int meson_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		ret = meson_i2c_xfer_msg(i2c, msgs + i, i == num - 1);
 		if (ret)
 			break;
-		count++;
 	}
 
 	clk_disable(i2c->clk);
 
-	return ret ? ret : count;
+	return ret ?: i;
 }
 
 static u32 meson_i2c_func(struct i2c_adapter *adap)
-- 
2.12.0
