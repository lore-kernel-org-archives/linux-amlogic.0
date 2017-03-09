From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Thu, 9 Mar 2017 07:40:46 +0100
Subject: [PATCH v2 04/10] i2c: meson: use full 12 bits for clock divider
In-Reply-To: <f39c9314-4314-3d98-aef2-3bc3c815e63b@gmail.com>
References: <f39c9314-4314-3d98-aef2-3bc3c815e63b@gmail.com>
Message-ID: <a61a6f48-a157-81ec-7f1b-09cb27b22613@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The clock divider has 12 bits, splitted into a 10 bit field and a
2 bit field. The extra 2 bits aren't used currently.

Change this to use the full 12 bits and warn if the requested
frequency is too low.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---
v2:
- added Acked-by
---
 drivers/i2c/busses/i2c-meson.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 5e243efa..a5764be5 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -35,7 +35,9 @@
 #define REG_CTRL_STATUS		BIT(2)
 #define REG_CTRL_ERROR		BIT(3)
 #define REG_CTRL_CLKDIV_SHIFT	12
-#define REG_CTRL_CLKDIV_MASK	((BIT(10) - 1) << REG_CTRL_CLKDIV_SHIFT)
+#define REG_CTRL_CLKDIV_MASK	GENMASK(21, 12)
+#define REG_CTRL_CLKDIVEXT_SHIFT 28
+#define REG_CTRL_CLKDIVEXT_MASK	GENMASK(29, 28)
 
 #define I2C_TIMEOUT_MS		500
 
@@ -136,8 +138,15 @@ static void meson_i2c_set_clk_div(struct meson_i2c *i2c)
 	unsigned int div;
 
 	div = DIV_ROUND_UP(clk_rate, i2c->timings.bus_freq_hz * 4);
+
+	/* clock divider has 12 bits */
+	WARN_ON(div >= (1 << 12));
+
 	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
-			   div << REG_CTRL_CLKDIV_SHIFT);
+			   (div & GENMASK(9, 0)) << REG_CTRL_CLKDIV_SHIFT);
+
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
+			   (div >> 10) << REG_CTRL_CLKDIVEXT_SHIFT);
 
 	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
 		clk_rate, i2c->timings.bus_freq_hz, div);
-- 
2.12.0
