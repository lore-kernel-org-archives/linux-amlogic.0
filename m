Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D346EC636D3
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Feb 2023 21:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d87oI8/WjO1tL88ShcQ7R6fyY6eH66bVflVBe+Eguzw=; b=lPIMGL6XPVGXzY
	XrYE/ic5KQj0IrPjfkzkRMHHHS38iVsgi1OadMfm2/pcRWm4/zU82Hp2J0VlxWIvSvze11F3s1GSf
	qWlLANL6J4Ug9Cnu6i4tPsG6x8sjw1YFYmS6lClhVp3tTE2ibzFQQZV9TXhxBQiImBzt1GOOFx/X5
	kMBEafj/MXeFeuzQILxLAnyQm3KIHPWTjWxx02oXQfzPgblHh0wBg32AuiH98PIlacQfFn//qCYOV
	6RDEfOmpLwaa2OIdCy3e6ruSnwlmSpfOpd2b7FAXEQJEG49HHmRTFkhNqBg4SDv6tT3u388TIdp/u
	71ZslQymONaygA74W2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRKJD-00CQcG-KN; Sun, 12 Feb 2023 21:54:55 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRKIs-00CQV8-PK; Sun, 12 Feb 2023 21:54:36 +0000
Received: by mail-ed1-x52e.google.com with SMTP id c1so6799218edt.4;
        Sun, 12 Feb 2023 13:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGuGPCBH000hnUeP9HzMYSwgcYb4tjeqonZlJZ7wvEs=;
        b=ZyL15y11COO3CVgVZ20jLnv/5obvFdsFyp8FUWUctL9nrtd1EsY31xM0tQciY1YMrG
         z2WCPUgQCT3t6lRXCPl1bPzqZ5ds2DVaLjS6ThSus7HkekjTVp4w4n4SHJ/HtKt546uF
         z5uoqHYPhGH4bX9A7eR2l9tkQnY3ZN0fEi0EnC+Z3DUmzv6C5cCL5KoeannMYMtLc/TJ
         lAXiRMUVNnh5SXwTk/d98Nm7wScIw7fHh6WgvmYJJAplIXDoRC1uT9318oEaAYpWddWV
         FX7RaF8pQotupFjWlNJo/9Fk2po3356b9Ni2kLFSTaP4ZLoe0o2VzPQMlT+b+pt300u+
         D95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DGuGPCBH000hnUeP9HzMYSwgcYb4tjeqonZlJZ7wvEs=;
        b=k5oNrXS9tlHxFWAvz8aX6+2uyBaUPkzUveGQKswxZqjE0OaSBiMb1PP9KwQGEdmKIJ
         hxQWy1acHzxW9dJeZk4WZhsz7c91w9Cuh24WZg3xytnh1IxU3FQ5/nr5RioPRt9LolRi
         RYGtcHAkQQEW/E0EXz9IBr9rEmR6q+/NQshO4mVdOUHi/QPNPTBI9ITXiEIyWQg+FRxK
         YEb51dt1l/Jk40rgF8WNEwlYVI9EkQuiqZn5FBUpE3t2I69KDAKW7L8TgvJvrXt4URYl
         rKF1xXxaMxIzqrR8Sp0RmCy80ziXMHT05M9EpNiT0wDFaNLhBfjbgt31d9rCD9AClLfZ
         6F5w==
X-Gm-Message-State: AO0yUKUZgKRt/SFIX+JX+AB4xLvE0JSYnFk1Yg4nY/ReJdBcdlTRCN9B
	TYZeYII72syUhz9goWkF8yk=
X-Google-Smtp-Source: AK7set8JELOs/DBqdSQGjGjcwNgqzAgHIxpNuvEQabnefMFTUjAm5p8b32WOp8xiX/NPZS7P8dXy/A==
X-Received: by 2002:a50:8717:0:b0:4ac:b858:37b1 with SMTP id i23-20020a508717000000b004acb85837b1mr5447246edb.7.1676238872272;
        Sun, 12 Feb 2023 13:54:32 -0800 (PST)
Received: from ?IPV6:2a01:c23:bdd2:4300:1932:303f:b63a:5a0e? (dynamic-2a01-0c23-bdd2-4300-1932-303f-b63a-5a0e.c23.pool.telefonica.de. [2a01:c23:bdd2:4300:1932:303f:b63a:5a0e])
        by smtp.googlemail.com with ESMTPSA id v20-20020a50d094000000b004acc6c67089sm793960edd.75.2023.02.12.13.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Feb 2023 13:54:31 -0800 (PST)
Message-ID: <9e296859-0363-ecc4-2d99-fd0239efceff@gmail.com>
Date: Sun, 12 Feb 2023 22:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Geraldo Nascimento <geraldogabriel@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] mmc: meson-gx: fix SDIO mode if cap_sdio_irq isn't set
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_135435_261078_16499A15 
X-CRM114-Status: GOOD (  12.27  )
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
 drivers/mmc/host/meson-gx-mmc.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 6e5ea0213..a80d48d23 100644
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
 			"Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
-			 IRQ_EN_MASK | IRQ_SDIO, raw_status);
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
