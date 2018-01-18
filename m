From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 18 Jan 2018 19:45:27 +0100
Subject: [PATCH 4/9] clk: meson: use frac parameter width instead of a constant
In-Reply-To: <20180118184532.6856-1-jbrunet@baylibre.com>
References: <20180118184532.6856-1-jbrunet@baylibre.com>
Message-ID: <20180118184532.6856-5-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Use the fractional part width in the calculation instead of 12, which
happens to e the witdh right now. This is safer in case the field width
ever change in the future

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index fa4cec13d6e8..d9efe725b7ad 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -80,7 +80,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 		reg = readl(pll->base + p->reg_off);
 		frac = PARM_GET(p->width, p->shift, reg);
 
-		rate += (u64)parent_rate * frac >> 12;
+		rate += (u64)parent_rate * frac >>  p->width;
 		rate *= 2;
 	}
 
-- 
2.14.3
