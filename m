From: sashal@kernel.org (Sasha Levin)
Date: Tue, 13 Nov 2018 00:49:37 -0500
Subject: [PATCH AUTOSEL 4.19 31/44] clk: meson-axg: pcie: drop the mpll3 clock
 parent
In-Reply-To: <20181113054950.77898-1-sashal@kernel.org>
References: <20181113054950.77898-1-sashal@kernel.org>
Message-ID: <20181113054950.77898-31-sashal@kernel.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Yixun Lan <yixun.lan@amlogic.com>

[ Upstream commit 69b93104c7ec5668019caf5d2dbfd0e182df06db ]

We found the PCIe driver doesn't really work with
the mpll3 clock which is actually reserved for debug,
So drop it from the mux list.

Fixes: 33b89db68236 ("clk: meson-axg: add clocks required by pcie driver")
Tested-by: Jianxin Qin <jianxin.qin@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/axg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 00ce62ad6416..a95152071087 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -700,12 +700,14 @@ static struct clk_regmap axg_pcie_mux = {
 		.offset = HHI_PCIE_PLL_CNTL6,
 		.mask = 0x1,
 		.shift = 2,
+		/* skip the parent mpll3, reserved for debug */
+		.table = (u32[]){ 1 },
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "pcie_mux",
 		.ops = &clk_regmap_mux_ops,
-		.parent_names = (const char *[]){ "mpll3", "pcie_pll" },
-		.num_parents = 2,
+		.parent_names = (const char *[]){ "pcie_pll" },
+		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
-- 
2.17.1
