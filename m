From: webczat@webczatnet.pl (=?UTF-8?q?Micha=C5=82=20Zegan?=)
Date: Thu, 16 Feb 2017 15:52:21 +0100
Subject: [PATCH 1/2] mmc: meson-gx: prevent cfg_div_clk from being disabled on
 init
In-Reply-To: <20170216145222.1577-1-webczat@webczatnet.pl>
References: <20170216145222.1577-1-webczat@webczatnet.pl>
Message-ID: <20170216145222.1577-2-webczat@webczatnet.pl>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

At the end of function meson_mmc_clk_init, the cfg_div clock was
prepared, enabled and configured, but then immediately disabled due to bogus if statements.
That made later calls to clk_disable_unprepare executed during module removal to fail with a kernel warning.
Fix that by changing the code to disable clock only when it failed to be configured.

Signed-off-by: Micha? Zegan <webczat@webczatnet.pl>
---
 drivers/mmc/host/meson-gx-mmc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 09739352834c..d444b6bfa02b 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -324,11 +324,12 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	writel(cfg, host->regs + SD_EMMC_CFG);
 
 	ret = clk_prepare_enable(host->cfg_div_clk);
-	if (!ret)
+	if (!ret) {
 		ret = meson_mmc_clk_set(host, f_min);
 
-	if (!ret)
-		clk_disable_unprepare(host->cfg_div_clk);
+		if (ret)
+			clk_disable_unprepare(host->cfg_div_clk);
+	}
 
 	return ret;
 }
-- 
2.11.0
