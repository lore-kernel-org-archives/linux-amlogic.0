From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 12 Jun 2017 21:44:38 +0200
Subject: [PATCH v3 10/10] clk: fix CLK_SET_RATE_GATE with clock rate protection
In-Reply-To: <20170612194438.12298-1-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
Message-ID: <20170612194438.12298-11-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Using clock rate protection, we can now enforce CLK_SET_RATE_GATE along the
clock tree

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5d545954c48f..971f39d4e879 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -587,6 +587,9 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (WARN_ON(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL))
 		return;
 
+	if (core->flags & CLK_SET_RATE_GATE)
+		clk_core_rate_unprotect(core);
+
 	if (--core->prepare_count > 0)
 		return;
 
@@ -657,6 +660,14 @@ static int clk_core_prepare(struct clk_core *core)
 
 	core->prepare_count++;
 
+	/*
+	 * CLK_SET_RATE_GATE is a special case of clock protection
+	 * Instead of a consumer protection, the provider is protecting
+	 * itself when prepared
+	 */
+	if (core->flags & CLK_SET_RATE_GATE)
+		clk_core_rate_protect(core);
+
 	return 0;
 }
 
@@ -1738,9 +1749,6 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 	if (clk_core_rate_is_protected(core))
 		return -EBUSY;
 
-	if ((core->flags & CLK_SET_RATE_GATE) && core->prepare_count)
-		return -EBUSY;
-
 	/* calculate new rates and get the topmost changed clock */
 	top = clk_calc_new_rates(core, req_rate);
 	if (!top)
-- 
2.9.4
