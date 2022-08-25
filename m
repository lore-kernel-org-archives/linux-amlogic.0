Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598B3ECAA2B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 19:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hy9TfIGFzJa/2g7MEJdXeCAAPSGA8/HLkfYBl0nNHfI=; b=BsAmjHw95UI45S
	UYz1dzYgeLsqd/kapR2ysazoC1yOEqlEfim4witRxblXT+anaohWLeeqXNNhhYXnTFGl8jN6i/9VI
	OPj1iyOzbtu8mh/aEPBZBYp4+P+i4nA4vGXXpBOA44ENxHDNLL1CJUGWa1/UIz/Q134o9h+HehmeP
	thBs5E8E3G67XkFMGcIqfs4BRcjEZcdxwVQCB+Kc1qOQU23qbipG3EsQG07o36EF3uGlFYeZqbufv
	I4yRmPRE0TY4ODT9hgMkDZNrBFuKaJDfwS/r9vBvWmKV7hiwTqKzQUzfqRWgqeny9Nc8f8u6bigaK
	vFsQkZpEwKolOq2sV+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIyE-002uQJ-5B; Thu, 25 Aug 2022 19:56:54 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIxs-002uG2-Rx; Thu, 25 Aug 2022 19:56:34 +0000
Received: by mail-ej1-x62b.google.com with SMTP id og21so4056705ejc.2;
        Thu, 25 Aug 2022 12:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8ps/qML9omF5+FvNRyrrWAK6UGFnmN6YM3mUqF1S6qQ=;
        b=XfWaZoxp0rYT1YgXXpKB3OJ4zOGdcOsiR8LcxeNZgAwjzGS2bhU7ogiaN3fKp2dVD9
         ntUJBp9UZhlisZ2AS+3vz7ZJgEAA/kBogaMgTUA6cVZdfStYQM8rotFJ0wMEUBMR70OO
         otWPyO0XRrd8SHNPI1k2DD7fVarG5SkhabZrkxbDjKx/HDErwOHxRjH9m6+TAFHjIRhE
         aqyQcXdTi5cUDzWpxdV1BqeXQ0UZOmJM/88JNEcznTLgbR6sKgdHsyH1PSjGCduoi0YU
         LK+1WVexuTdvXvSqBTb+VcWRZH6+gcqYZCPKmftAylGiW0PF/mFwNI+1rj0sxEWKWk8h
         9cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8ps/qML9omF5+FvNRyrrWAK6UGFnmN6YM3mUqF1S6qQ=;
        b=PvQ0Sh3lkKsBLShOPnXAdRxV2OTe16RetUhf/KjY2Z/xfHZHVcE62DzrvQb/Qxjd94
         jfeOiAyDq47+JLrtrta4dfZ3wdkUhvBH/TO0CKQ43c63P7Zf8IKE0XAx7uymoqWwdZVH
         tYtzy3UfJn8hY9hVJTuAQVJQeG4CAMNpK6Q/4FAJupM6Lnyup3m3CXkuQtzaBuxSEENa
         6rJLo/tTIcX+2A+yhoz6827kKSUcv3d0cfjreQA9/t1qxTQZkWwwTNM40MJ96NGEcl8M
         FQSL1KLfCw3py1Gw0vEWY+hu2YBiGVojW7zx/kk91GCtJkp+KR6JvkAnuPUnf+DdE53T
         eKgQ==
X-Gm-Message-State: ACgBeo3fXt72g5CuUBDBxDC6FU+i+X8HdO3EryqoSrHkGfXpk3scYwIA
	32qr4vF/DgryCccyv4kLjaE=
X-Google-Smtp-Source: AA6agR5wzMUDaddLzqQnpriQbiaTexMy7eiBE0l6EjNKUZ32xqk0cNOfxplBHK/F3U0J5fDhb4A9Ng==
X-Received: by 2002:a17:907:2816:b0:73d:7af2:37f5 with SMTP id eb22-20020a170907281600b0073d7af237f5mr3533538ejc.588.1661457389738;
        Thu, 25 Aug 2022 12:56:29 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72a6:5f00:b844:7c7d:e964:bb65? (dynamic-2a01-0c22-72a6-5f00-b844-7c7d-e964-bb65.c22.pool.telefonica.de. [2a01:c22:72a6:5f00:b844:7c7d:e964:bb65])
        by smtp.googlemail.com with ESMTPSA id gx6-20020a1709068a4600b0073dc691063dsm19362ejc.192.2022.08.25.12.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 12:56:29 -0700 (PDT)
Message-ID: <27bffe3c-e579-3581-95e8-2587733487d2@gmail.com>
Date: Thu, 25 Aug 2022 21:56:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: [PATCH v3 2/2] mmc: meson-gx: add SDIO interrupt support
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
In-Reply-To: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_125632_986278_67C679D0 
X-CRM114-Status: GOOD (  17.15  )
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

Add SDIO interrupt support. Successfully tested on a S905X4-based
system (V3 register layout) with a BRCM4334 SDIO wifi module
(brcmfmac driver).

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- use new SDIO IRQ API
v3:
- don't duplicate checking mmc->sdio_irq_pending
  Device works fine w/o it.
---
 drivers/mmc/host/meson-gx-mmc.c | 70 ++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 9a4da2544..b6afaccf7 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -41,14 +41,17 @@
 #define   CLK_V2_TX_DELAY_MASK GENMASK(19, 16)
 #define   CLK_V2_RX_DELAY_MASK GENMASK(23, 20)
 #define   CLK_V2_ALWAYS_ON BIT(24)
+#define   CLK_V2_IRQ_SDIO_SLEEP BIT(25)
 
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
@@ -135,6 +138,7 @@ struct meson_mmc_data {
 	unsigned int rx_delay_mask;
 	unsigned int always_on;
 	unsigned int adjust;
+	unsigned int irq_sdio_sleep;
 };
 
 struct sd_emmc_desc {
@@ -174,6 +178,7 @@ struct meson_host {
 	bool vqmmc_enabled;
 	bool needs_pre_post_req;
 
+	spinlock_t lock;
 };
 
 #define CMD_CFG_LENGTH_MASK GENMASK(8, 0)
@@ -430,6 +435,7 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	clk_reg |= FIELD_PREP(CLK_CORE_PHASE_MASK, CLK_PHASE_180);
 	clk_reg |= FIELD_PREP(CLK_TX_PHASE_MASK, CLK_PHASE_0);
 	clk_reg |= FIELD_PREP(CLK_RX_PHASE_MASK, CLK_PHASE_0);
+	clk_reg |= CLK_IRQ_SDIO_SLEEP(host);
 	writel(clk_reg, host->regs + SD_EMMC_CLOCK);
 
 	/* get the mux parents */
@@ -934,32 +940,54 @@ static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
 	}
 }
 
+static void __meson_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
+{
+	struct meson_host *host = mmc_priv(mmc);
+	u32 reg_irqen = IRQ_EN_MASK;
+
+	if (enable)
+		reg_irqen |= IRQ_SDIO;
+	writel(reg_irqen, host->regs + SD_EMMC_IRQ_EN);
+}
+
 static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 {
 	struct meson_host *host = dev_id;
 	struct mmc_command *cmd;
-	struct mmc_data *data;
 	u32 status, raw_status;
 	irqreturn_t ret = IRQ_NONE;
 
 	raw_status = readl(host->regs + SD_EMMC_STATUS);
-	status = raw_status & IRQ_EN_MASK;
+	status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
 
 	if (!status) {
 		dev_dbg(host->dev,
 			"Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
-			 IRQ_EN_MASK, raw_status);
+			 IRQ_EN_MASK | IRQ_SDIO, raw_status);
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
+		spin_lock(&host->lock);
+		__meson_mmc_enable_sdio_irq(host->mmc, 0);
+		sdio_signal_irq(host->mmc);
+		spin_unlock(&host->lock);
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
@@ -977,12 +1005,9 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 
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
@@ -1125,6 +1150,21 @@ static int meson_mmc_voltage_switch(struct mmc_host *mmc, struct mmc_ios *ios)
 	return -EINVAL;
 }
 
+static void meson_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
+{
+	struct meson_host *host = mmc_priv(mmc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&host->lock, flags);
+	__meson_mmc_enable_sdio_irq(mmc, enable);
+	spin_unlock_irqrestore(&host->lock, flags);
+}
+
+static void meson_mmc_ack_sdio_irq(struct mmc_host *mmc)
+{
+	meson_mmc_enable_sdio_irq(mmc, 1);
+}
+
 static const struct mmc_host_ops meson_mmc_ops = {
 	.request	= meson_mmc_request,
 	.set_ios	= meson_mmc_set_ios,
@@ -1134,6 +1174,8 @@ static const struct mmc_host_ops meson_mmc_ops = {
 	.execute_tuning = meson_mmc_resampling_tuning,
 	.card_busy	= meson_mmc_card_busy,
 	.start_signal_voltage_switch = meson_mmc_voltage_switch,
+	.enable_sdio_irq = meson_mmc_enable_sdio_irq,
+	.ack_sdio_irq	= meson_mmc_ack_sdio_irq,
 };
 
 static int meson_mmc_probe(struct platform_device *pdev)
@@ -1237,7 +1279,13 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_init_clk;
 
+	spin_lock_init(&host->lock);
+
 	mmc->caps |= MMC_CAP_CMD23;
+
+	if (mmc->caps & MMC_CAP_SDIO_IRQ)
+		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
+
 	if (host->dram_access_quirk) {
 		/* Limit segments to 1 due to low available sram memory */
 		mmc->max_segs = 1;
@@ -1328,6 +1376,7 @@ static const struct meson_mmc_data meson_gx_data = {
 	.rx_delay_mask	= CLK_V2_RX_DELAY_MASK,
 	.always_on	= CLK_V2_ALWAYS_ON,
 	.adjust		= SD_EMMC_ADJUST,
+	.irq_sdio_sleep	= CLK_V2_IRQ_SDIO_SLEEP,
 };
 
 static const struct meson_mmc_data meson_axg_data = {
@@ -1335,6 +1384,7 @@ static const struct meson_mmc_data meson_axg_data = {
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
