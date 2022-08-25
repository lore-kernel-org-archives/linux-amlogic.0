Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E82ECAA2B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 19:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoD4mc49e8//pd0rNnb9JASQCEFH/dyVy2ZaTQyijB0=; b=uvxFW165CK8QCZ
	juOt24anmaYhvbthkiMZbHqZPTtJ94xLSL2TqoSOw5b/8VpFvOvPwpUYbbKdtmHhu8awZvdiS8WC+
	0MD7dafb3hJ4P0ZyCtmrjfK1cxJzO0EEJ3+J2RKrg8SvaeSbkJqj7cYCs0iRAAgmHBkJj3N0tG8+2
	75UarTbRnrR/bqSEHp3ixp8ro5FQIOX7ngsGS7oFocc8p7IwAbeGyaZmxexWiq+Q7FNEMGtaAM8yI
	kSWcjhY/3p0JFqP7GUavHGrpt5fiaVMyIK7VgcP3qrjMhb8LQeH0sajVizltnv+brx6Om3gYHeXDz
	u+6PK8PBqm6YJ1vUwB0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIy2-002uLU-Lf; Thu, 25 Aug 2022 19:56:42 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIxp-002uFM-OQ; Thu, 25 Aug 2022 19:56:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id m1so2573790edb.7;
        Thu, 25 Aug 2022 12:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=XN8Fhnia+RiwvuPKmGvKwSm6gbVuPj9Uos7pnCgzshw=;
        b=K9I9qpYQPf4nHjuN9RIOzoBgLqNbBoBeMzw72fNZV8iMRUrRrIIl3t7j232eODpnZV
         Eq+FJrHHiHWrDmleJn4up/l66lAgEiglix95/G/4BjAcdnIGkjJ2aUvC9hEAyhlHbITL
         whDZE3WXZpep3yNywu1JdFI9kf2v+Q8mfACdr+Nnd+MWm9XIgUzc8WorEUQi7BA/ANhE
         ED5EW4mPYBEVS0pBVJiGlE7wvtu860fM8YVIr3jGPQ0lS+Fk8Qoe+e/C4x6sHgzEuAtM
         eR6/cD7P24OVcEr1RDryjhxF+qJBYrc2XEM4DBZPW+cj6fa9Ihre0q1gdfaHVjNgJiub
         vn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XN8Fhnia+RiwvuPKmGvKwSm6gbVuPj9Uos7pnCgzshw=;
        b=Op3VrKOjxyBf455C0JXxsgCzbSsWQKFQ94h7Hln5NCUO24n7A+bWISzKwRAC/QIEbn
         pTpi0bUNDnu2lEmtKLUFjhyJv4sbf6L3X8dYd1paOCWirT+VoIslPo1mYYlfWnguFsfa
         MLptaLSvb6RMJfSB7hctYImsf2ANdWCPJSAI/Eyit2DXu5K/iBfpOKJZtOAY1JUzXuwR
         eAZmO6vwIAhnRZJS0QtCQm57lnzV9J15SX+/RpFCLX9/91KDjZaYlDTM/E2Z1mg+uD4X
         tTrn1lnjfblBQEor9eOWvW4qJ73YOZyiNeJ3FRISLi9uHt32Q8DLv7V5/VZMkEfmh4bC
         wpYA==
X-Gm-Message-State: ACgBeo0+6p4Xl6eWU8JKXnaz/oqQLX2nYhcdAAvNNR0AT2w+DtsyIida
	BR14GzP9so9EVFdv0LJwwF8=
X-Google-Smtp-Source: AA6agR5HAs9gjlt6XNA3kcLQhmB17AxuDEFUbOoC838NcmtZykmGaVx9+5pQ1pVjsNoqLX36b6beoQ==
X-Received: by 2002:a05:6402:2802:b0:43a:9098:55a0 with SMTP id h2-20020a056402280200b0043a909855a0mr4414990ede.179.1661457388407;
        Thu, 25 Aug 2022 12:56:28 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72a6:5f00:b844:7c7d:e964:bb65? (dynamic-2a01-0c22-72a6-5f00-b844-7c7d-e964-bb65.c22.pool.telefonica.de. [2a01:c22:72a6:5f00:b844:7c7d:e964:bb65])
        by smtp.googlemail.com with ESMTPSA id kf24-20020a17090776d800b0072b51fb36f7sm16382ejc.196.2022.08.25.12.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 12:56:27 -0700 (PDT)
Message-ID: <8056622f-2adf-4763-7423-9ccdf4ca78e1@gmail.com>
Date: Thu, 25 Aug 2022 21:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: [PATCH v3 1/2] mmc: meson: adjust and re-use constant IRQ_EN_MASK
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
X-CRM114-CacheID: sfid-20220825_125629_826262_50984046 
X-CRM114-Status: GOOD (  12.11  )
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
