From: jbrunet@baylibre.com (Jerome Brunet)
Date: Fri, 19 Jan 2018 16:55:24 +0100
Subject: [PATCH v2 4/9] clk: meson: use the frac parameter width instead of a
 constant
In-Reply-To: <20180119155529.11532-1-jbrunet@baylibre.com>
References: <20180119155529.11532-1-jbrunet@baylibre.com>
Message-ID: <20180119155529.11532-5-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Use the fractional part width in the calculation instead of 12, which
happens to be the witdh right now. This is safer in case the field width
ever change in the future

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 087dfc532ba8..50923d004d96 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -81,7 +81,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 		reg = readl(pll->base + p->reg_off);
 		frac = PARM_GET(p->width, p->shift, reg);
 
-		rate += mul_u64_u32_shr(parent_rate, frac, 12);
+		rate += mul_u64_u32_shr(parent_rate, frac, p->width);
 		rate *= 2;
 	}
 
-- 
2.14.3
