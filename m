Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46048C636CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 20:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jF+vFFOg73TVGBmTJQN6L96q2XCIcYEeqw5xxEDOrIM=; b=z+4cH2/sipXy98
	lXGGHVaaI6jWYCzAOEd69mi0ig2ILWJmP2Hkzzeh4OG68NfVqwQ85hIuXUhSPjMs6mzNvgUTsxS2R
	xvg3EQE9nG4ba/GtQnQwh+fk7M3LglwJd9MA5Pw/xYDSuT/pcnJbW1YmFmVedghXwuaXMuRQ+xeGv
	rkK26BZFej4W8O5Po4jePq89Uo2MXaTWqu3KDOb3/ttzE0kBfajqOyt0vhZsH6QjYkqUnPkeCdHj0
	Hl5I5QZcbqpILfa9zf4VB9iBGJr7OQucFb7oDYUR2qqkRRhJXaQfaSRlqlmm2MDcbfku8Wc4v7ubr
	UOURiKjt4Py1KlRtpDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRfru-00GEV7-T5; Mon, 13 Feb 2023 20:56:10 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRfrk-00GESY-84; Mon, 13 Feb 2023 20:56:01 +0000
Received: by mail-ed1-x530.google.com with SMTP id fj20so14732443edb.1;
        Mon, 13 Feb 2023 12:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/R5MSAYpdwtgqm3lz5Y5YrCCy8ygxgmhqCsBl3PeFE=;
        b=TLIOmwwJ3SBPApSdAVZoa/KbswW007U3tH+tZAUW4NfUN/Gw25017CQmeIofLK5WnY
         z7F9aZdazBBMNY/N55FY61JCn4t/OQ6mkFmnWIpWEyu0xoxuZzv3QgeLLIhUmOnUwCP7
         yFipSSZmHxdozPVLayUiNoibvYoOADgDZRY3E2kGRihQDfhGv1/bNUtauCZH9scQEJJa
         qakpU3otBz9UHOwubV8eWkrHuR4sDN9suPWJQ1yGoyV6A3yRPxJ7e4L8k7Nwq98y7m9u
         nsu6O0U9WDIEpdP640BVY5Wte22s5u8lFPw9TpOjpTnCPFoK1Nr3Oay288kUg/b1LAa3
         VNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R/R5MSAYpdwtgqm3lz5Y5YrCCy8ygxgmhqCsBl3PeFE=;
        b=P9iFOXsTQUU4X/pK9zroj627gjtsyA4l59CtrK2bder2Ad4wZYUdgJN8UnJ2SoiE83
         VXwmaL0He+Gi2kPDSsIk3lfhz7b5OAQVy91Qw+gyhYkWbg+hiPK3jXVh0gbSsw+bSG5D
         ql2qWkMt/nQqc0TAVsm4C3BezeQN48ZyZDehAz6sRT7t3xTuHUiNvK8tvQwcDG10/c3B
         FIFdujXtm2ZrDtuUQTWZM2S6iMjqlG7UrDnsyTuzjUglNoxuMUSY2JXdhaWatTwv4nci
         j7aWjNuaJD/X2mHoqmQvBu6/Mru4Jb59vafP4oTAyX9SEi1PJT5KYieqTgTxl/DS6p/6
         iBrg==
X-Gm-Message-State: AO0yUKUp4VVzuksCNBRVQiBY4J/WorcMBvkBwNjDa0On2/O4aDKLY3Ha
	QconoXCLmzFURkn7Otmk4WU=
X-Google-Smtp-Source: AK7set+1qEXXHxfoUQ2lxdjPS3Mz7iAT/r9Jxg4JrOksc+9ouiZO2K+RhDJTtkpGeFhMjwCMjcUngw==
X-Received: by 2002:a50:9b16:0:b0:4aa:a248:a153 with SMTP id o22-20020a509b16000000b004aaa248a153mr96976edi.3.1676321758208;
        Mon, 13 Feb 2023 12:55:58 -0800 (PST)
Received: from ?IPV6:2a01:c23:c094:1400:c1c:7b2f:774c:a98a? (dynamic-2a01-0c23-c094-1400-0c1c-7b2f-774c-a98a.c23.pool.telefonica.de. [2a01:c23:c094:1400:c1c:7b2f:774c:a98a])
        by smtp.googlemail.com with ESMTPSA id s11-20020a50ab0b000000b004a2470f920esm7170086edc.25.2023.02.13.12.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 12:55:57 -0800 (PST)
Message-ID: <816cba9f-ff92-31a2-60f0-aca542d1d13e@gmail.com>
Date: Mon, 13 Feb 2023 21:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RESEND v2] mmc: meson-gx: fix SDIO mode if cap_sdio_irq isn't
 set
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_125600_336602_B8BA02DB 
X-CRM114-Status: GOOD (  11.86  )
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

Some SDIO WiFi modules stopped working after SDIO interrupt mode
was added if cap_sdio_irq isn't set in device tree. This patch was
confirmed to fix the issue.

Fixes: 066ecde6d826 ("mmc: meson-gx: add SDIO interrupt support")
Reported-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Tested-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- fix printf type issue
---
 drivers/mmc/host/meson-gx-mmc.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 6e5ea0213..5c94ad466 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -435,7 +435,8 @@ static int meson_mmc_clk_init(struct meson_host *host)
 	clk_reg |= FIELD_PREP(CLK_CORE_PHASE_MASK, CLK_PHASE_180);
 	clk_reg |= FIELD_PREP(CLK_TX_PHASE_MASK, CLK_PHASE_0);
 	clk_reg |= FIELD_PREP(CLK_RX_PHASE_MASK, CLK_PHASE_0);
-	clk_reg |= CLK_IRQ_SDIO_SLEEP(host);
+	if (host->mmc->caps & MMC_CAP_SDIO_IRQ)
+		clk_reg |= CLK_IRQ_SDIO_SLEEP(host);
 	writel(clk_reg, host->regs + SD_EMMC_CLOCK);
 
 	/* get the mux parents */
@@ -948,16 +949,18 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 {
 	struct meson_host *host = dev_id;
 	struct mmc_command *cmd;
-	u32 status, raw_status;
+	u32 status, raw_status, irq_mask = IRQ_EN_MASK;
 	irqreturn_t ret = IRQ_NONE;
 
+	if (host->mmc->caps & MMC_CAP_SDIO_IRQ)
+		irq_mask |= IRQ_SDIO;
 	raw_status = readl(host->regs + SD_EMMC_STATUS);
-	status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
+	status = raw_status & irq_mask;
 
 	if (!status) {
 		dev_dbg(host->dev,
-			"Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
-			 IRQ_EN_MASK | IRQ_SDIO, raw_status);
+			"Unexpected IRQ! irq_en 0x%08x - status 0x%08x\n",
+			 irq_mask, raw_status);
 		return IRQ_NONE;
 	}
 
@@ -1204,6 +1207,11 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		goto free_host;
 	}
 
+	mmc->caps |= MMC_CAP_CMD23;
+
+	if (mmc->caps & MMC_CAP_SDIO_IRQ)
+		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
+
 	host->data = (struct meson_mmc_data *)
 		of_device_get_match_data(&pdev->dev);
 	if (!host->data) {
@@ -1277,11 +1285,6 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	spin_lock_init(&host->lock);
 
-	mmc->caps |= MMC_CAP_CMD23;
-
-	if (mmc->caps & MMC_CAP_SDIO_IRQ)
-		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
-
 	if (host->dram_access_quirk) {
 		/* Limit segments to 1 due to low available sram memory */
 		mmc->max_segs = 1;
-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
