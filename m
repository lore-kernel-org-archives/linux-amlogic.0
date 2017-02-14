From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Feb 2017 21:06:53 +0100
Subject: [PATCH 12/18] mmc: meson-gx: remove member parent_mux from struct
 meson_host
In-Reply-To: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
Message-ID: <ef34f765-cb48-9381-4a0c-e6f540612ea6@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Member mux_parent isn't used outside meson_mmc_clk_init. So remove it
and replace it with a local variable in meson_mmc_clk_init.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index d05ffe8a..74ceda75 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -131,7 +131,6 @@ struct meson_host {
 	struct clk *core_clk;
 	struct clk_mux mux;
 	struct clk *mux_clk;
-	struct clk *mux_parent[MUX_CLK_NUM_PARENTS];
 	unsigned long current_clock;
 
 	struct clk_divider cfg_div;
@@ -242,19 +241,18 @@ static int meson_mmc_clk_init(struct meson_host *host)
 
 	/* get the mux parents */
 	for (i = 0; i < MUX_CLK_NUM_PARENTS; i++) {
+		struct clk *clk;
 		char name[16];
 
 		snprintf(name, sizeof(name), "clkin%d", i);
-		host->mux_parent[i] = devm_clk_get(host->dev, name);
-		if (IS_ERR(host->mux_parent[i])) {
-			ret = PTR_ERR(host->mux_parent[i]);
-			if (PTR_ERR(host->mux_parent[i]) != -EPROBE_DEFER)
+		clk = devm_clk_get(host->dev, name);
+		if (IS_ERR(clk)) {
+			if (clk != ERR_PTR(-EPROBE_DEFER))
 				dev_err(host->dev, "Missing clock %s\n", name);
-			host->mux_parent[i] = NULL;
-			return ret;
+			return PTR_ERR(clk);
 		}
 
-		mux_parent_names[i] = __clk_get_name(host->mux_parent[i]);
+		mux_parent_names[i] = __clk_get_name(clk);
 	}
 
 	/* create the mux */
-- 
2.11.1
