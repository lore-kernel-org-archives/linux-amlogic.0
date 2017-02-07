From: hkallweit1@gmail.com (Heiner Kallweit)
Date: Tue, 7 Feb 2017 22:35:59 +0100
Subject: [PATCH v3 9/9] mmc: meson-gx: add support for HS400 mode
In-Reply-To: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
References: <0991d40b-e05b-2fcb-9ee4-7b529448de69@gmail.com>
Message-ID: <282ded48-616d-b0c3-b1e1-34f0987a9255@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Add support for HS400 mode.

The driver still misses support for tuning, therefore
highspeed modes like HS400 might not work under all
circumstances yet.

Successfully tested on a Odroid C2 (S905 GXBB).

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
---
v3:
- extended commit message
---
 drivers/mmc/host/meson-gx-mmc.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 3cc6334a..5a959783 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -83,6 +83,7 @@
 #define   CFG_RC_CC_MASK 0xf
 #define   CFG_STOP_CLOCK BIT(22)
 #define   CFG_CLK_ALWAYS_ON BIT(18)
+#define   CFG_CHK_DS BIT(20)
 #define   CFG_AUTO_CLK BIT(23)
 
 #define SD_EMMC_STATUS 0x48
@@ -408,6 +409,16 @@ static void meson_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
 	val &= ~(CFG_RC_CC_MASK << CFG_RC_CC_SHIFT);
 	val |= ilog2(SD_EMMC_CFG_CMD_GAP) << CFG_RC_CC_SHIFT;
 
+	val &= ~CFG_DDR;
+	if (ios->timing == MMC_TIMING_UHS_DDR50 ||
+	    ios->timing == MMC_TIMING_MMC_DDR52 ||
+	    ios->timing == MMC_TIMING_MMC_HS400)
+		val |= CFG_DDR;
+
+	val &= ~CFG_CHK_DS;
+	if (ios->timing == MMC_TIMING_MMC_HS400)
+		val |= CFG_CHK_DS;
+
 	writel(val, host->regs + SD_EMMC_CFG);
 
 	if (val != orig)
-- 
2.11.0
