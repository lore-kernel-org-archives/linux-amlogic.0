From: yixun.lan@amlogic.com (Yixun Lan)
Date: Fri, 19 Jan 2018 10:09:26 +0800
Subject: [PATCH] clk: meson: axg: fix the od shift of the sys_pll
Message-ID: <20180119020926.246887-1-yixun.lan@amlogic.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

According to datasheet, the od shift of sys_pll is 16,
fix the typo which introduced at previous commit.

Fixes: 78b4af312f91 ('clk: meson-axg: add clock controller drivers')
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 drivers/clk/meson/axg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 7988dc8506b0..04a231eaf648 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -64,7 +64,7 @@ static struct meson_clk_pll axg_sys_pll = {
 	},
 	.od = {
 		.reg_off = HHI_SYS_PLL_CNTL,
-		.shift   = 10,
+		.shift   = 16,
 		.width   = 2,
 	},
 	.lock = &meson_clk_lock,
-- 
2.15.1
