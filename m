From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 18 Jan 2018 19:45:31 +0100
Subject: [PATCH 8/9] clk: meson: gxbb: add the fractional part of the fixed_pll
In-Reply-To: <20180118184532.6856-1-jbrunet@baylibre.com>
References: <20180118184532.6856-1-jbrunet@baylibre.com>
Message-ID: <20180118184532.6856-9-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The fixed_pll of gxbb and gxl also has a fractional parameter. This has
not been a problem so far because fractional part is actually set to 0
on these platforms, so the rate remains correct when it is ignored.
Still, it is better represent the pll the way it is, so add the frac
parameter now

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 9a92e64b428c..3202f85e69e5 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -202,6 +202,11 @@ static struct meson_clk_pll gxbb_fixed_pll = {
 		.shift   = 16,
 		.width   = 2,
 	},
+	.frac = {
+		.reg_off = HHI_MPLL_CNTL2,
+		.shift   = 0,
+		.width   = 12,
+	},
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "fixed_pll",
-- 
2.14.3
