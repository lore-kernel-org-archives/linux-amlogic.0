From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 8 Feb 2017 22:49:25 +0100
Subject: [PATCH 3/4] mmc: meson-gx: add pwrseq-based hw_reset
In-Reply-To: <75ad5eac-412b-fe73-ff53-3d8b975937e4@gmail.com>
References: <75ad5eac-412b-fe73-ff53-3d8b975937e4@gmail.com>
Message-ID: <bf895a14-c4c9-d70b-fea6-843d8412b7b4@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Use new function mmc_hw_reset_pwrseq as hw_reset operation.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 5eca88bc..260a8ea8 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -716,6 +716,7 @@ static const struct mmc_host_ops meson_mmc_ops = {
 	.request	= meson_mmc_request,
 	.set_ios	= meson_mmc_set_ios,
 	.get_cd         = meson_mmc_get_cd,
+	.hw_reset	= mmc_hw_reset_pwrseq,
 };
 
 static int meson_mmc_probe(struct platform_device *pdev)
-- 
2.11.0
