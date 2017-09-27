From: ingrassia@epigenesys.com (Emiliano Ingrassia)
Date: Wed, 27 Sep 2017 12:40:08 +0200
Subject: [PATCH 1/4] clk: meson8b: keep mpll2 clock enabled
In-Reply-To: <cover.1506507688.git.ingrassia@epigenesys.com>
References: <cover.1506507688.git.ingrassia@epigenesys.com>
Message-ID: <71634468832113ec4b7e88eaed11ab673ef2bb30.1506507688.git.ingrassia@epigenesys.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

The mpll2 clock, enabled by the bootloader, is disabled at boot.
Enabling ethernet on Odroid-C1+ board leads to DMA initialization failure
caused by a timeout on reset.
Keeping the mpll2 clock enabled solve this issue.

Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>
---
 drivers/clk/meson/meson8b.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 20ab7190d328..5096539e4a63 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -347,6 +347,7 @@ static struct meson_clk_mpll meson8b_mpll2 = {
 		.ops = &meson_clk_mpll_ops,
 		.parent_names = (const char *[]){ "fixed_pll" },
 		.num_parents = 1,
+		.flags = (CLK_SET_RATE_NO_REPARENT | CLK_IGNORE_UNUSED),
 	},
 };
 
-- 
2.14.1
