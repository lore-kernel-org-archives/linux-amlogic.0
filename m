From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Sat, 4 Mar 2017 13:35:13 +0100
Subject: [PATCH v5 8/10] mmc: meson-gx: improve initial configuration
In-Reply-To: <a76c3483-2c86-85c1-446e-f2522bd28aa8@gmail.com>
References: <a76c3483-2c86-85c1-446e-f2522bd28aa8@gmail.com>
Message-ID: <0ec5cb3d-d882-2a33-5878-f4ca0a25555d@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Config values which are not changed during runtime we can set
in the probe function already.
The block size setting is overwritten later in
meson_mmc_start_cmd anyway if needed, so it doesn't harm if we
remove this setting in meson_mmc_set_ios.

In addition write config register only if configuration changed.

Don't change the location of clock initialization as in an
earlier version of the patch, this change causes a hang.
This issue was reported and fix suggested by:
Helmut Klein <hgkr.klein@gmail.com>

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Acked-by: Kevin Hilman <khilman@baylibre.com>
---
v2:
- added acked-by
v3:
- rebased
v4:
- no changes
v5:
- reverse changing the location of clock initialization as it causes
  a hang with the vendor uboot
---
 drivers/mmc/host/meson-gx-mmc.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 684cc088..84553c23 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -394,15 +394,6 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	val &= ~(CFG_BUS_WIDTH_MASK << CFG_BUS_WIDTH_SHIFT);
 	val |= bus_width << CFG_BUS_WIDTH_SHIFT;
 
-	val &= ~(CFG_BLK_LEN_MASK << CFG_BLK_LEN_SHIFT);
-	val |= ilog2(SD_EMMC_CFG_BLK_SIZE) << CFG_BLK_LEN_SHIFT;
-
-	val &= ~(CFG_RESP_TIMEOUT_MASK << CFG_RESP_TIMEOUT_SHIFT);
-	val |= ilog2(SD_EMMC_CFG_RESP_TIMEOUT) << CFG_RESP_TIMEOUT_SHIFT;
-
-	val &= ~(CFG_RC_CC_MASK << CFG_RC_CC_SHIFT);
-	val |= ilog2(SD_EMMC_CFG_CMD_GAP) << CFG_RC_CC_SHIFT;
-
 	val &= ~CFG_DDR;
 	if (ios->timing == MMC_TIMING_UHS_DDR50 ||
 	    ios->timing == MMC_TIMING_MMC_DDR52 ||
@@ -413,11 +404,11 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	if (ios->timing == MMC_TIMING_MMC_HS400)
 		val |= CFG_CHK_DS;
 
-	writel(val, host->regs + SD_EMMC_CFG);
-
-	if (val != orig)
+	if (val != orig) {
+		writel(val, host->regs + SD_EMMC_CFG);
 		dev_dbg(host->dev, "%s: SD_EMMC_CFG: 0x%08x -> 0x%08x\n",
 			__func__, orig, val);
+	}
 }
 
 static void meson_mmc_request_done(struct mmc_host *mmc,
@@ -695,6 +686,17 @@ static int meson_mmc_get_cd(struct mmc_host *mmc)
 	return status;
 }
 
+static void meson_mmc_cfg_init(struct meson_host *host)
+{
+	u32 cfg = 0;
+
+	cfg |= ilog2(SD_EMMC_CFG_RESP_TIMEOUT) << CFG_RESP_TIMEOUT_SHIFT;
+	cfg |= ilog2(SD_EMMC_CFG_CMD_GAP) << CFG_RC_CC_SHIFT;
+	cfg |= ilog2(SD_EMMC_CFG_BLK_SIZE) << CFG_BLK_LEN_SHIFT;
+
+	writel(cfg, host->regs + SD_EMMC_CFG);
+}
+
 static const struct mmc_host_ops meson_mmc_ops = {
 	.request	= meson_mmc_request,
 	.set_ios	= meson_mmc_set_ios,
@@ -767,6 +769,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	writel(IRQ_EN_MASK, host->regs + SD_EMMC_STATUS);
 	writel(IRQ_EN_MASK, host->regs + SD_EMMC_IRQ_EN);
 
+	/* set config to sane default */
+	meson_mmc_cfg_init(host);
+
 	ret = devm_request_threaded_irq(&pdev->dev, irq, meson_mmc_irq,
 					meson_mmc_irq_thread, IRQF_SHARED,
 					DRIVER_NAME, host);
-- 
2.12.0
