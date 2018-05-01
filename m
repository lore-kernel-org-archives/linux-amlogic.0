From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Tue,  1 May 2018 23:45:55 +0200
Subject: [PATCH] clk: meson: meson8b: mark fclk_div gate clocks as
 CLK_IS_CRITICAL
Message-ID: <20180501214555.11476-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Until commit 05f814402d6174 ("clk: meson: add fdiv clock gates") we
relied on the bootloader to enable the fclk_div clock gates. It turns
out that our clock tree is incomplete at least on Meson8b (tested with
an Odroid-C1, which uses an RGMII PHY) because after the mentioned
commit Ethernet is not working anymore (no RX/TX activity can be seen).
At the same time Ethernet was still working on Meson8m2 with a RMII PHY.

It is currently not clear which of the fclk_div gates is required for
(RGMII) Ethernet operation on Meson8b and why. Mark the fclk_div gates
as CLK_IS_CRITICAL so the common clock framework keeps these gates
enabled for us until we know which clock is required for Ethernet on
Meson8b and which driver has to claim it.

Fixes: 05f814402d6174 ("clk: meson: add fdiv clock gates")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index d0524ec71aad..f3ac099ee22c 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -246,6 +246,7 @@ static struct clk_regmap meson8b_fclk_div2 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div2_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -270,6 +271,7 @@ static struct clk_regmap meson8b_fclk_div3 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div3_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -294,6 +296,7 @@ static struct clk_regmap meson8b_fclk_div4 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div4_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -318,6 +321,7 @@ static struct clk_regmap meson8b_fclk_div5 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div5_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
@@ -342,6 +346,7 @@ static struct clk_regmap meson8b_fclk_div7 = {
 		.ops = &clk_regmap_gate_ops,
 		.parent_names = (const char *[]){ "fclk_div7_div" },
 		.num_parents = 1,
+		.flags = CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.17.0
