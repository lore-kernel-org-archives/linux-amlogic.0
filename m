Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50989C32773
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 21:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eqUZ8QgmD7yha2pc73EKKt6yrQ3X+OJ2VNUGVtrifr4=; b=Wmc4qZdetO892c
	90Reh9UGAdrtWUlGCpKrYVbATn+6qPo0hpszGKcSj+7/C5vg3fZZfw3qdBxXuAxLMPw9U41VHoNOr
	nHj2XRAtqcgSU1AXaGVLYL2bev4rozumm0Wu6NxtMnlhqojjBntXBWRMNYSrO9FmB2aDfrTIG7nI/
	slTZY7Gz6vDwLHgwws8I6Xwsy7RUaY5oQA3i65FPUudzChOOQkgVne+aBM7ROTW1kFpRpa0wd6f5s
	WvPhyr/C8Sq9bWnkpJ10SI9gCxOyfTxbC0S+c4q4tE3nzip/m/JrdgiWPy5uaeZT1Stkjfy2wl/f4
	9HqOc8SG9gfu9tFDEnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP9KQ-00CJNJ-Sk; Fri, 19 Aug 2022 21:14:54 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP9K1-00CJ6J-AK; Fri, 19 Aug 2022 21:14:30 +0000
Received: by mail-ej1-x635.google.com with SMTP id y13so10954669ejp.13;
        Fri, 19 Aug 2022 14:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XN8Fhnia+RiwvuPKmGvKwSm6gbVuPj9Uos7pnCgzshw=;
        b=LBxR7hLFZLuTrfTZm9YXi0oJn7bp/IDy2floLNvMQMELuDyvzBGe2sN1FpbUJEX0tq
         LZiJbPPsWpmkyWounNmonv57I5Bij+eV9EwO0u9YtcS0rOZsUOVeoVGrazfesqSJ6qEY
         nRiaLcGnVHD6edigwwKeO6Kn3c94aWO7R347M/n7z9INvxcACjsDk681W7r22s6pw+Jr
         GyILTCDo0xC3qiglxzvmP9dhkEw6Xb3yKjnpTuikRtwh1s8wuQBfqC5LvcDxJwwBfeuJ
         Asa/wYIocvhXpFI5IM/6KYnkSqULm5+uDznPamdZqV9FzLaZOn9YR9dJ5p6PzjKxQLfL
         OuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XN8Fhnia+RiwvuPKmGvKwSm6gbVuPj9Uos7pnCgzshw=;
        b=j/kYyiXlODw3ya5cSD3sWANPgZSP6gjg0/rAyWl9gEq5MTNwEliM5vAvPZa2ltnoET
         q1nWtWKJby6JVDrwuJ81JUhwKLYUBIavUek70ImY3YhosxJDZPv0paDNW0MBat5DKP6N
         zOb4+EWXXqjC4Ye5iQi/7Nf+/PXhZr0RbAkBqxEurMKqz4DE3FLhmyqxuzZf4lneZkqQ
         2u2t5xB43FLiTQTk3HR03saN2n4v/CuhXW1gCq6d+RFIvVSUr/JuBZo2O25nPuqtpYlq
         OB1XvYg6IrK82WjKulHJGrKm3fGnyPFYkQCRn8tcmgBGsZqxQXkYwMFPvu8rRl6KkRDs
         zROA==
X-Gm-Message-State: ACgBeo02q9MO25lKJ9g1ODI6sxDkI1Oa0bF+0JntfVGexFJMTb4U+BHD
	sc/djqDrJ50xSDQdYhMVIXQ=
X-Google-Smtp-Source: AA6agR7mAT5dFb/lyg08h4fwzJD+3e+be+cF1wbAXMyl8vh3yHWQXbTayQ5Mhsz54dTxv9dn04i2xg==
X-Received: by 2002:a17:907:2cd5:b0:731:6a6b:209b with SMTP id hg21-20020a1709072cd500b007316a6b209bmr5945965ejc.315.1660943664672;
        Fri, 19 Aug 2022 14:14:24 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c5ac:3600:6819:de7b:5db7:493? (dynamic-2a01-0c23-c5ac-3600-6819-de7b-5db7-0493.c23.pool.telefonica.de. [2a01:c23:c5ac:3600:6819:de7b:5db7:493])
        by smtp.googlemail.com with ESMTPSA id l25-20020aa7d959000000b0043cf0d56a61sm3685872eds.8.2022.08.19.14.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 14:14:24 -0700 (PDT)
Message-ID: <c1e81dfd-23f1-10d2-7099-a47ad869c1f9@gmail.com>
Date: Fri, 19 Aug 2022 23:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: [PATCH v2 1/2] mmc: meson-gx: adjust and revive constant IRQ_EN_MASK
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
References: <b94b7f5b-1095-33a5-b1a0-20a6e2281bce@gmail.com>
In-Reply-To: <b94b7f5b-1095-33a5-b1a0-20a6e2281bce@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_141429_409188_B278F04A 
X-CRM114-Status: GOOD (  11.93  )
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

Constant IRQ_EN_MASK has no user currently. In preparation of adding
SDIO interrupt support, revive it and adjust it to our needs.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- patch added to series
---
 drivers/mmc/host/meson-gx-mmc.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index dbc9fac8f..9a4da2544 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -101,8 +101,7 @@
 #define   IRQ_RESP_STATUS BIT(14)
 #define   IRQ_SDIO BIT(15)
 #define   IRQ_EN_MASK \
-	(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN | IRQ_RESP_STATUS |\
-	 IRQ_SDIO)
+	(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN)
 
 #define SD_EMMC_CMD_CFG 0x50
 #define SD_EMMC_CMD_ARG 0x54
@@ -940,17 +939,16 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	struct meson_host *host = dev_id;
 	struct mmc_command *cmd;
 	struct mmc_data *data;
-	u32 irq_en, status, raw_status;
+	u32 status, raw_status;
 	irqreturn_t ret = IRQ_NONE;
 
-	irq_en = readl(host->regs + SD_EMMC_IRQ_EN);
 	raw_status = readl(host->regs + SD_EMMC_STATUS);
-	status = raw_status & irq_en;
+	status = raw_status & IRQ_EN_MASK;
 
 	if (!status) {
 		dev_dbg(host->dev,
-			"Unexpected IRQ! irq_en 0x%08x - status 0x%08x\n",
-			 irq_en, raw_status);
+			"Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
+			 IRQ_EN_MASK, raw_status);
 		return IRQ_NONE;
 	}
 
@@ -1230,10 +1228,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 
 	/* clear, ack and enable interrupts */
 	writel(0, host->regs + SD_EMMC_IRQ_EN);
-	writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
-	       host->regs + SD_EMMC_STATUS);
-	writel(IRQ_CRC_ERR | IRQ_TIMEOUTS | IRQ_END_OF_CHAIN,
-	       host->regs + SD_EMMC_IRQ_EN);
+	writel(IRQ_EN_MASK, host->regs + SD_EMMC_STATUS);
+	writel(IRQ_EN_MASK, host->regs + SD_EMMC_IRQ_EN);
 
 	ret = request_threaded_irq(host->irq, meson_mmc_irq,
 				   meson_mmc_irq_thread, IRQF_ONESHOT,
-- 
2.37.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
