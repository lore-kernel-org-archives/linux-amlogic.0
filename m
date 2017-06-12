From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 12 Jun 2017 21:44:37 +0200
Subject: [PATCH v3 09/10] clk: fix incorrect usage of ENOSYS
In-Reply-To: <20170612194438.12298-1-jbrunet@baylibre.com>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
Message-ID: <20170612194438.12298-10-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

ENOSYS is special and should only be used for incorrect syscall number.
It does not seem to be the case here.

Reported by checkpatch.pl while working on clock protection.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8d57e130c4e0..5d545954c48f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2032,7 +2032,7 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 
 	/* verify ops for for multi-parent clks */
 	if ((core->num_parents > 1) && (!core->ops->set_parent))
-		return -ENOSYS;
+		return -EPERM;
 
 	/* check that we are allowed to re-parent if the clock is in use */
 	if ((core->flags & CLK_SET_PARENT_GATE) && core->prepare_count)
-- 
2.9.4
