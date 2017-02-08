From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Wed, 8 Feb 2017 22:49:07 +0100
Subject: [PATCH 2/4] mmc: pwrseq: implement reset operation in pwrseq_emmc
In-Reply-To: <75ad5eac-412b-fe73-ff53-3d8b975937e4@gmail.com>
References: <75ad5eac-412b-fe73-ff53-3d8b975937e4@gmail.com>
Message-ID: <ea0583ff-8e41-9833-cc7c-638ff6c1d476@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

In pwrseq_emmc a reset function exists already and just needs to
be exposed as reset hook.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/core/pwrseq_emmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/core/pwrseq_emmc.c b/drivers/mmc/core/pwrseq_emmc.c
index adc9c0c6..a30e7352 100644
--- a/drivers/mmc/core/pwrseq_emmc.c
+++ b/drivers/mmc/core/pwrseq_emmc.c
@@ -57,6 +57,7 @@ static int mmc_pwrseq_emmc_reset_nb(struct notifier_block *this,
 
 static const struct mmc_pwrseq_ops mmc_pwrseq_emmc_ops = {
 	.post_power_on = mmc_pwrseq_emmc_reset,
+	.reset = mmc_pwrseq_emmc_reset,
 };
 
 static int mmc_pwrseq_emmc_probe(struct platform_device *pdev)
-- 
2.11.0
