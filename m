From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Mar 2017 22:51:35 +0100
Subject: [PATCH v4 06/10] i2c: meson: remove variable count from meson_i2c_xfer
In-Reply-To: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
References: <1a2ecdc8-a326-a7a7-22ec-658fd147daf4@gmail.com>
Message-ID: <126e80e5-f93f-8c18-f283-65eee94b3a82@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Variable count has always the same value as i, so we don't need it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove one small change from v1
v3:
- no changes
v4:
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
