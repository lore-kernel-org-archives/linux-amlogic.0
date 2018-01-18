From: jbrunet@baylibre.com (Jerome Brunet)
Date: Thu, 18 Jan 2018 19:45:32 +0100
Subject: [PATCH 9/9] clk: meson: axg: add the fractional part of the fixed_pll
In-Reply-To: <20180118184532.6856-1-jbrunet@baylibre.com>
References: <20180118184532.6856-1-jbrunet@baylibre.com>
Message-ID: <20180118184532.6856-10-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The fixed_pll also has a fractional part. On axg s400 board, without
this parameter, the calculated rate is off by ~8Mhz (0,4%). The fixed_pll
being the root of peripheral clock tree, this error is propagated to the
rest of the clocks

Adding the definition of the parameter fixes the problem

Fixes: 78b4af312f91 ("clk: meson-axg: add clock controller drivers")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 56806c6bd9d5..953e119635a2 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -37,6 +37,11 @@ static struct meson_clk_pll axg_fixed_pll = {
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
