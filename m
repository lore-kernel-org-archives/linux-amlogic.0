From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Fri, 3 Mar 2017 20:57:22 +0100
Subject: [PATCH v4 7/10] mmc: meson-gx: remove unneeded devm_kstrdup in
 meson_mmc_clk_init
In-Reply-To: <62912f3d-2307-cfff-3c69-c8b8ffaeb474@gmail.com>
References: <62912f3d-2307-cfff-3c69-c8b8ffaeb474@gmail.com>
Message-ID: <cee5ed99-5a53-d96a-6cca-9e21f1443d55@gmail.com>
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
v4:
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
