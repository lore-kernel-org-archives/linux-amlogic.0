From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 18 Feb 2017 14:08:45 +0100
Subject: [PATCH v3 4/10] mmc: meson-gx: remove unneeded variable in
 meson_mmc_clk_init
In-Reply-To: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
References: <583f6496-68a9-b8e1-6b25-1f073f819a3c@gmail.com>
Message-ID: <94e1a544-c24d-2e19-7971-731bac6aa29b@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Because the DT requires a fixed number of mux parent clocks,
variable mux_parent_count can be replaced with constant
MUX_CLK_NUM_PARENTS, so remove it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- adjusted commit message
- added acked-by
v3:
- no changes
---
 drivers/mmc/host/meson-gx-mmc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index b9de3d47..ea2db3ce 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -242,7 +242,6 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	char clk_name[32];
 	int i, ret = 0;
 	const char *mux_parent_names[MUX_CLK_NUM_PARENTS];
-	unsigned int mux_parent_count = 0;
 	const char *clk_div_parents[1];
 	u32 clk_reg, cfg;
 
@@ -261,7 +260,6 @@ static int meson_mmc_clk_init(struct meson_host *host)
 		}
 
 		mux_parent_names[i] = __clk_get_name(host->mux_parent[i]);
-		mux_parent_count++;
 	}
 
 	/* create the mux */
@@ -270,7 +268,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	init.ops = &clk_mux_ops;
 	init.flags = 0;
 	init.parent_names = mux_parent_names;
-	init.num_parents = mux_parent_count;
+	init.num_parents = MUX_CLK_NUM_PARENTS;
 
 	host->mux.reg = host->regs + SD_EMMC_CLOCK;
 	host->mux.shift = CLK_SRC_SHIFT;
-- 
2.11.1
