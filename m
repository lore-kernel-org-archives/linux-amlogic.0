Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E859C25B06
	for <linux-amlogic@archiver.kernel.org>; Sun, 14 Aug 2022 21:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OAn0x5G06MyTrsNxKRo9/ua+pSDiejbvkEhZLV7TL8I=; b=QVuNLUY7aLXo2o
	XDTsChOUNbHPvrHsi9+uFd5HkoIsDxeovafJ54rMY4p8H8zGGpRWbt0Eatv1iRvZjkWm6Q7VgzwoW
	lJTTsEy43vGwgiR/8sOp/ZjLgMmGp29YrlInLRE+1yuq/j6p+6lhM660rQesgy4APxLEu6Zytzwgf
	AOVEo5EAtrGacc3pOc55xpRAZ+buFlJ+6zkf9VlQEXqaNlY6mrIgo+vOKjtXOBqJDEa351j4QWwkF
	eQpaA2ZBsHtewdqSQ50dbwCvZ3RUpOXy8U+h1w4PcHQHsu0MCg+73/FS1Ii8Vy+Bkg3otAgyvfbkr
	CGySfVYM7OHgljgFQP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNLP7-009KDN-7Z; Sun, 14 Aug 2022 21:44:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNLOv-009K8q-CD; Sun, 14 Aug 2022 21:44:06 +0000
Received: by mail-ej1-x62a.google.com with SMTP id qn6so10688286ejc.11;
        Sun, 14 Aug 2022 14:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=HMwySQlrZKwT72iHBtFLIyOzQ6ltdGvstzNUYhje0GQ=;
        b=YTF90dGApDb2DDrPA+NQkjoKUbT1rO4gY2eB3ExEVhX9ggB8f7AcBEs9HdHTCR4n1J
         jVHRnexFrUqWlIo9sIraRnvuuc38HWJLWdCUx5fUzJK/QAg6MeXrALFooHy0nVbOWpXT
         pc/TdeVEE4ha7ls9o/Dp7xPzO7Xcz8Od1AT+PWpU5guWdxgAjIv4iGyycp2nO/i7cTDp
         SNbcrjnneZFK4gRwyDtdPrrqPoOESUcDJzg2BAI/zwLUXjYfKBDxXeSnxbtgPz5HCLqR
         5tDHw/9aK9Bfnt8L/QgFjrvIHEtH6DeJO+jaz2+SNASSNE2uvgC8SoAnUEclMIo9EVvG
         L4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=HMwySQlrZKwT72iHBtFLIyOzQ6ltdGvstzNUYhje0GQ=;
        b=2keZpxfOCgGikTG6MNKnO/TDS52Xxl5X6H7NUCDoAf92WEMQvLipe7ZltEOjPCfRiE
         OElyq07MzOQ6sNJM+vcZGlULGFPO8Wy36fEKPrOpDFqSdKRg3fH9AR863wRFJvV74jmF
         Mo+ujBBX3h4JlmxatBbUk/lDTvs3WrmqzHs4Y1ALnSZuEqxhpdUN5VRjJXtBpQi9wbhB
         0192j1TVLVupO4AV0HKrOaTtflM0KRxgOoWTvukxGNy/tQHeXewUQ0pAWYCve/cqqoNI
         03Zu/9G1hvD+qHtGKZS3JCKEL771ZilblemqzLro03UDieRBi/Np6QFUJnZYTjmDVUHg
         IyLA==
X-Gm-Message-State: ACgBeo3AMFCzS8gx7j5KI2Zl5YlHBAQhZ8Cbj+uWbvix7yO8MDAJllQw
	kolCO7lzJXWJEJM/+I0mPsQ=
X-Google-Smtp-Source: AA6agR6T3+HX2ymaB7yzOp6UuFg5s5aYRFohB0OreKTbjN6rbPm4Xfg96aHIVb8nTKBKvqAayt6Rqw==
X-Received: by 2002:a17:907:c0e:b0:731:614:e507 with SMTP id ga14-20020a1709070c0e00b007310614e507mr8698210ejc.529.1660513442859;
        Sun, 14 Aug 2022 14:44:02 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c1a2:1a00:2049:10ba:dbb:6620? (dynamic-2a01-0c23-c1a2-1a00-2049-10ba-0dbb-6620.c23.pool.telefonica.de. [2a01:c23:c1a2:1a00:2049:10ba:dbb:6620])
        by smtp.googlemail.com with ESMTPSA id r21-20020aa7cb95000000b0043cfc872e7dsm5394729edt.10.2022.08.14.14.44.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Aug 2022 14:44:02 -0700 (PDT)
Message-ID: <ecc229ad-c15a-2092-6568-f92e4507553e@gmail.com>
Date: Sun, 14 Aug 2022 23:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] mmc: meson-gx: add SDIO interrupt support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_144405_476253_7D4E199C 
X-CRM114-Status: GOOD (  14.20  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds SDIO interrupt support.
Successfully tested on a S905X4-based system with a BRCM4334
SDIO wifi module (brcmfmac driver).

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 45 +++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 2f08d442e..e8d53fcdd 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -41,14 +41,17 @@
 #define   CLK_V2_TX_DELAY_MASK GENMASK(19, 16)
 #define   CLK_V2_RX_DELAY_MASK GENMASK(23, 20)
 #define   CLK_V2_ALWAYS_ON BIT(24)
+#define   CLK_V2_IRQ_SDIO_SLEEP BIT(29)
 
 #define   CLK_V3_TX_DELAY_MASK GENMASK(21, 16)
 #define   CLK_V3_RX_DELAY_MASK GENMASK(27, 22)
 #define   CLK_V3_ALWAYS_ON BIT(28)
+#define   CLK_V3_IRQ_SDIO_SLEEP BIT(29)
 
 #define   CLK_TX_DELAY_MASK(h)		(h->data->tx_delay_mask)
 #define   CLK_RX_DELAY_MASK(h)		(h->data->rx_delay_mask)
 #define   CLK_ALWAYS_ON(h)		(h->data->always_on)
+#define   CLK_IRQ_SDIO_SLEEP(h)		(h->data->irq_sdio_sleep)
 
 #define SD_EMMC_DELAY 0x4
 #define SD_EMMC_ADJUST 0x8
@@ -100,9 +103,6 @@
 #define   IRQ_END_OF_CHAIN BIT(13)
 #define   IRQ_RESP_STATUS BIT(14)
 #define   IRQ_SDIO BIT(15)
-#define   IRQ_EN_MASK \
-	(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN | IRQ_RESP_STATUS |\
-	 IRQ_SDIO)
 
 #define SD_EMMC_CMD_CFG 0x50
 #define SD_EMMC_CMD_ARG 0x54
@@ -136,6 +136,7 @@ struct meson_mmc_data {
 	unsigned int rx_delay_mask;
 	unsigned int always_on;
 	unsigned int adjust;
+	unsigned int irq_sdio_sleep;
 };
 
 struct sd_emmc_desc {
@@ -431,6 +432,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	clk_reg |= FIELD_PREP(CLK_CORE_PHASE_MASK, CLK_PHASE_180);
 	clk_reg |= FIELD_PREP(CLK_TX_PHASE_MASK, CLK_PHASE_0);
 	clk_reg |= FIELD_PREP(CLK_RX_PHASE_MASK, CLK_PHASE_0);
+	clk_reg |= CLK_IRQ_SDIO_SLEEP(host);
 	writel(clk_reg, host->regs + SD_EMMC_CLOCK);
 
 	/* get the mux parents */
@@ -933,7 +935,6 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 {
 	struct meson_host *host = dev_id;
 	struct mmc_command *cmd;
-	struct mmc_data *data;
 	u32 irq_en, status, raw_status;
 	irqreturn_t ret = IRQ_NONE;
 
@@ -948,14 +949,24 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	if (WARN_ON(!host) || WARN_ON(!host->cmd))
+	if (WARN_ON(!host))
 		return IRQ_NONE;
 
 	/* ack all raised interrupts */
 	writel(status, host->regs + SD_EMMC_STATUS);
 
 	cmd = host->cmd;
-	data = cmd->data;
+
+	if (status & IRQ_SDIO) {
+		mmc_signal_sdio_irq(host->mmc);
+		status &= ~IRQ_SDIO;
+		if (!status)
+			return IRQ_HANDLED;
+	}
+
+	if (WARN_ON(!cmd))
+		return IRQ_NONE;
+
 	cmd->error = 0;
 	if (status & IRQ_CRC_ERR) {
 		dev_dbg(host->dev, "CRC Error - status 0x%08x\n", status);
@@ -973,12 +984,9 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 
 	meson_mmc_read_resp(host->mmc, cmd);
 
-	if (status & IRQ_SDIO) {
-		dev_dbg(host->dev, "IRQ: SDIO TODO.\n");
-		ret = IRQ_HANDLED;
-	}
-
 	if (status & (IRQ_END_OF_CHAIN | IRQ_RESP_STATUS)) {
+		struct mmc_data *data = cmd->data;
+
 		if (data && !cmd->error)
 			data->bytes_xfered = data->blksz * data->blocks;
 		if (meson_mmc_bounce_buf_read(data) ||
@@ -1121,6 +1129,18 @@ static int meson_mmc_voltage_switch(struct mmc_host *mmc, struct mmc_ios *ios)
 	return -EINVAL;
 }
 
+static void meson_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
+{
+	struct meson_host *host = mmc_priv(mmc);
+	u32 reg_irqen;
+
+	reg_irqen = readl(host->regs + SD_EMMC_IRQ_EN);
+	reg_irqen &= ~IRQ_SDIO;
+	if (enable)
+		reg_irqen |= IRQ_SDIO;
+	writel(reg_irqen, host->regs + SD_EMMC_IRQ_EN);
+}
+
 static const struct mmc_host_ops meson_mmc_ops = {
 	.request	= meson_mmc_request,
 	.set_ios	= meson_mmc_set_ios,
@@ -1130,6 +1150,7 @@ static const struct mmc_host_ops meson_mmc_ops = {
 	.execute_tuning = meson_mmc_resampling_tuning,
 	.card_busy	= meson_mmc_card_busy,
 	.start_signal_voltage_switch = meson_mmc_voltage_switch,
+	.enable_sdio_irq = meson_mmc_enable_sdio_irq,
 };
 
 static int meson_mmc_probe(struct platform_device *pdev)
@@ -1326,6 +1347,7 @@ static const struct meson_mmc_data meson_gx_data = {
 	.rx_delay_mask	= CLK_V2_RX_DELAY_MASK,
 	.always_on	= CLK_V2_ALWAYS_ON,
 	.adjust		= SD_EMMC_ADJUST,
+	.irq_sdio_sleep	= CLK_V2_IRQ_SDIO_SLEEP,
 };
 
 static const struct meson_mmc_data meson_axg_data = {
@@ -1333,6 +1355,7 @@ static const struct meson_mmc_data meson_axg_data = {
 	.rx_delay_mask	= CLK_V3_RX_DELAY_MASK,
 	.always_on	= CLK_V3_ALWAYS_ON,
 	.adjust		= SD_EMMC_V3_ADJUST,
+	.irq_sdio_sleep	= CLK_V3_IRQ_SDIO_SLEEP,
 };
 
 static const struct of_device_id meson_mmc_of_match[] = {
-- 
2.37.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
