From: webczat@webczatnet.pl (=?UTF-8?q?Micha=C5=82=20Zegan?=)
Date: Tue, 14 Mar 2017 21:05:20 +0100
Subject: [PATCH v2] mmc: meson-gx: fix error path when driver initialization
 fails before enabling clocks
Message-ID: <20170314200520.6276-1-webczat@webczatnet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This patch fixes the case where meson_mmc_probe function fails before
core_clk is enabled.
Originally, that would result in a try to disable the core clock, and if
it was not already enabled, it would result in a kernel warning.
This issue is similar to the one with div_clk.
Fix it by introducing another error path used only between successfully
enabling the core clock, and successfully enabling the div clock.
That would ensure that core clock is disabled only if it was enabled before.

Signed-off-by: Micha? Zegan <webczat@webczatnet.pl>
---
changes since v1:
cherry picked on top of mmc next branch
 drivers/mmc/host/meson-gx-mmc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c574e1519623..bd075fef08d4 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -743,7 +743,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	ret = meson_mmc_clk_init(host);
 	if (ret)
-		goto free_host;
+		goto err_core_clk;
 
 	/* Stop execution */
 	writel(0, host->regs + SD_EMMC_START);
@@ -783,8 +783,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 err_div_clk:
 	clk_disable_unprepare(host->cfg_div_clk);
-free_host:
+err_core_clk:
 	clk_disable_unprepare(host->core_clk);
+free_host:
 	mmc_free_host(mmc);
 	return ret;
 }
-- 
2.12.0
