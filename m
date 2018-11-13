From: narmstrong@baylibre.com (Neil Armstrong)
Date: Tue, 13 Nov 2018 11:38:38 +0100
Subject: [PATCH u-boot] clk: meson: fix clk81 divider calculation
Message-ID: <20181113103838.7167-1-narmstrong@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

clk81 divider is 0 based (meaning that 0 value in the register means
divide by 1). Fix clk81 rate calculation for this.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk_meson.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk_meson.c b/drivers/clk/clk_meson.c
index 236d7342b7..c44858822d 100644
--- a/drivers/clk/clk_meson.c
+++ b/drivers/clk/clk_meson.c
@@ -600,7 +600,8 @@ static unsigned long meson_clk81_get_rate(struct clk *clk)
 	reg = readl(priv->addr + HHI_MPEG_CLK_CNTL);
 	reg = reg & ((1 << 7) - 1);
 
-	return parent_rate / reg;
+	/* clk81 divider is zero based */
+	return parent_rate / (reg + 1);
 }
 
 static long mpll_rate_from_params(unsigned long parent_rate,
-- 
2.19.1
