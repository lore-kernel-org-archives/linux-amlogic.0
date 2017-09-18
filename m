From: jbrunet@baylibre.com (Jerome Brunet)
Date: Mon, 18 Sep 2017 15:44:31 +0200
Subject: [PATCH/RFT] mmc: meson-gx: include tx phase in the tuning process
In-Reply-To: <b31253d8-38a3-dd25-1d74-6afde6ae8362@gmail.com>
References: <b31253d8-38a3-dd25-1d74-6afde6ae8362@gmail.com>
Message-ID: <20170918134431.17520-1-jbrunet@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

It has been reported that some platforms (odroid-c2) may require
a different tx phase setting to operate at high speed.

To improve the situation, this patch includes tx phase in the tuning
process.

Reported-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Hi Heiner,

Would you mind trying this change with your setup and letting us know
if it helps ?

It seems like a good idea to add an initial Rx tuning before doing the
actual tuning but, honestly, I don't know if it is really necessary.

Regards

Jerome


 drivers/mmc/host/meson-gx-mmc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index c885c2d4b904..0254d8bfd536 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -717,6 +717,22 @@ static int meson_mmc_clk_phase_tuning(struct mmc_host *mmc, u32 opcode,
 static int meson_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
 {
 	struct meson_host *host = mmc_priv(mmc);
+	int ret;
+
+	/*
+	 * If this is the initial tuning, try to get a sane Rx starting
+	 * phase before doing the actual tuning.
+	 */
+	if (!mmc->doing_retune) {
+		ret = meson_mmc_clk_phase_tuning(mmc, opcode, host->rx_clk);
+
+		if (ret)
+			return ret;
+	}
+
+	ret = meson_mmc_clk_phase_tuning(mmc, opcode, host->tx_clk);
+	if (ret)
+		return ret;
 
 	return meson_mmc_clk_phase_tuning(mmc, opcode, host->rx_clk);
 }
-- 
2.13.5
