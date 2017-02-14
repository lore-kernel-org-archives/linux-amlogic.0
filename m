From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 14 Feb 2017 21:06:48 +0100
Subject: [PATCH 11/18] mmc: meson-gx: remove unneeded variable in
 meson_mmc_clk_init
In-Reply-To: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
Message-ID: <d08aa734-0258-3d53-9726-f7d9f47b51eb@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Variable mux_parent_count can be replaced with constant
MUX_CLK_NUM_PARENTS, so remove it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 159ee7b4..d05ffe8a 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -237,7 +237,6 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	char clk_name[32];
 	int i, ret = 0;
 	const char *mux_parent_names[MUX_CLK_NUM_PARENTS];
-	unsigned int mux_parent_count = 0;
 	const char *clk_div_parents[1];
 	u32 clk_reg, cfg;
 
@@ -256,7 +255,6 @@ static int meson_mmc_clk_init(struct meson_host *host)
 		}
 
 		mux_parent_names[i] = __clk_get_name(host->mux_parent[i]);
-		mux_parent_count++;
 	}
 
 	/* create the mux */
@@ -265,7 +263,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	init.ops = &clk_mux_ops;
 	init.flags = 0;
 	init.parent_names = mux_parent_names;
-	init.num_parents = mux_parent_count;
+	init.num_parents = MUX_CLK_NUM_PARENTS;
 
 	host->mux.reg = host->regs + SD_EMMC_CLOCK;
 	host->mux.shift = CLK_SRC_SHIFT;
-- 
2.11.1
