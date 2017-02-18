From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 18 Feb 2017 14:20:44 +0100
Subject: [PATCH v3 7/10] mmc: meson-gx: remove unneeded devm_kstrdup in
 meson_mmc_clk_init
In-Reply-To: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
References: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
Message-ID: <de024b46-9cc2-86e3-8654-db8ec37ba283@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

CLK core does a deep copy of init.name, therefore it's fully ok to
provide a local variable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- fixed commit message
- added acked-by
v3:
- no changes
---
 drivers/mmc/host/meson-gx-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 002e4aac..684cc088 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -281,7 +281,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
 
 	/* create the divider */
 	snprintf(clk_name, sizeof(clk_name), "%s#div", dev_name(host->dev));
-	init.name = devm_kstrdup(host->dev, clk_name, GFP_KERNEL);
+	init.name = clk_name;
 	init.ops = &clk_divider_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 	clk_div_parents[0] = __clk_get_name(host->mux_clk);
-- 
2.11.1
