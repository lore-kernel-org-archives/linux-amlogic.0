From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon,  4 Dec 2017 14:34:28 +0100
Subject: [PATCH] clk: meson: gxbb: remove IGNORE_UNUSED from mmc clocks
Message-ID: <20171204133428.24631-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Remove CLK_IGNORE_UNUSED from mmc clocks. This was only needed while the
mmc driver incorrectly used the xtal as source instead of the mmc
clock. Now, the driver takes the correct clock, CCF is aware that the
clock is being used and we can remove this flag.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index ae385310e980..182ed00e2ec5 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1031,17 +1031,7 @@ static struct clk_gate gxbb_sd_emmc_a_clk0 = {
 		.ops = &clk_gate_ops,
 		.parent_names = (const char *[]){ "sd_emmc_a_clk0_div" },
 		.num_parents = 1,
-
-		/*
-		 * FIXME:
-		 * We need CLK_IGNORE_UNUSED because mmc DT node point to xtal
-		 * instead of this clock. CCF would gate this on boot, killing
-		 * the mmc controller. Please remove this flag once DT properly
-		 * point to this clock instead of xtal
-		 *
-		 * Same goes for emmc B and C clocks
-		 */
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1084,7 +1074,7 @@ static struct clk_gate gxbb_sd_emmc_b_clk0 = {
 		.ops = &clk_gate_ops,
 		.parent_names = (const char *[]){ "sd_emmc_b_clk0_div" },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1127,7 +1117,7 @@ static struct clk_gate gxbb_sd_emmc_c_clk0 = {
 		.ops = &clk_gate_ops,
 		.parent_names = (const char *[]){ "sd_emmc_c_clk0_div" },
 		.num_parents = 1,
-		.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.14.3
