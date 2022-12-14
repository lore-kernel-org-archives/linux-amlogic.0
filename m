Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501DAC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Dec 2022 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZtosITu9wG+KFCB1qGpToRiyZ7AjosewagVXo0Y3iSI=; b=AZ43JN4vLWRQY3
	2kIKfOvixMTcHp0Ka9XIdNvpXQqKqWELUhHY/4HyowOU5tlOJyPWDqbb2VDN/yV2MsI8y/XoISKf+
	vYvFMx6WxNSoBpn7f40J7VWrdEUg3IO+PnXKKNc7KS9tz+lC2EqAcghGmY0yjc2bKofo/zx0LiX/Y
	+vX8Y/AnjUjIT54FD7GfHXUYJpHcXF0UTHhC0T6B7OlrgpIInTQC3LRWYOpvf4GA8xkNU1085yhen
	ebZuYiKEE611L2curDsS60iBoDp1HCNThQ9o4Ot7K3nTzycTG5vRy1Q3gYxZByp3jwLyJaOi19Gh8
	xH+7wcr2zYOCffxZNt2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5S7F-00GxYf-QJ; Wed, 14 Dec 2022 13:48:09 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5S7C-00GxUX-Vf
	for linux-amlogic@lists.infradead.org; Wed, 14 Dec 2022 13:48:08 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 186so3078883ybe.8
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Dec 2022 05:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rduJSBHNOfADwB39FsLCzXunOBvEcaJu6tUh95KODL4=;
        b=fdwnhavsGqlgQt7e1eaz36uYU8Z77IBoLK4pevJAqvSoZWgxTQUVZ6VtElmj0yFLJF
         Ufo+Nsy/BTv1p3N4pQUL4uYYI8A3yXLzI6rGOnVNy7F45EiZT39czJ9slCdQnpiP4cXz
         PUbm5mvjGFiV7BXlDC5zbiTWA9nhEzN8QR1gM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rduJSBHNOfADwB39FsLCzXunOBvEcaJu6tUh95KODL4=;
        b=0liAZeuEE2xRa2HkCAV8iwNneShFXCA1b0QSeN33GJhfPKjv1AQt2n8n6cCgXTQxWF
         UrZOB5E2OdJdLIpVjvPE+n3V3iI/DKC4biDyCvuYTX4SPsyzkikHLCY8PwbaYW1LLV7b
         5Ti/dFQke5wrsWLFgnEzbHHjMFDbYfLT0DZRkpxyv5/X8737e2zzmVzlgyMXrsNMey/c
         An54rmekph/nuqKYlfLocopWnb7a9vpTu026gGHnaMq1wQbVaiqCZc0676lyVAXVG4ll
         UQrQhQeY1UZ3QNzAECU4NkYwxpy+wtG5QH3WE1G5wBcQil7GT7MAtMY/tsPgrwinELLY
         STjQ==
X-Gm-Message-State: ANoB5pnrosv4xRuDo4ulaDN4iTxk0KfRWGg2lx6VwZI/24Yvy9rNKshV
	KGDw6LBMfBkMzU//ZRW2hvwnVg==
X-Google-Smtp-Source: AA0mqf5CDWDQUpYOHhb4MnlcEthGXqB5EMVH+jnlo0LHvdsh2lxNCgqVkA31Re7Rk3wPzDy53O2N/g==
X-Received: by 2002:a05:6902:147:b0:724:6d18:6c36 with SMTP id p7-20020a056902014700b007246d186c36mr11589008ybh.23.1671025683021;
        Wed, 14 Dec 2022 05:48:03 -0800 (PST)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id f10-20020a05620a408a00b006eeb3165565sm10139602qko.80.2022.12.14.05.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 05:48:02 -0800 (PST)
From: Peter Suti <peter.suti@streamunlimited.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Peter Suti <peter.suti@streamunlimited.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] mmc: meson-gx: fix SDIO interrupt handling
Date: Wed, 14 Dec 2022 14:46:21 +0100
Message-Id: <20221214134620.3028726-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <52861a84-0fe2-37f0-d66a-145f2ebe1d79@gmail.com>
References: <52861a84-0fe2-37f0-d66a-145f2ebe1d79@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_054807_348067_9EE4911A 
X-CRM114-Status: GOOD (  15.81  )
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

With the interrupt support introduced in commit 066ecde sometimes the
Marvell-8987 wifi chip got stuck using the marvell-sd-uapsta-8987
vendor driver. The cause seems to be that after sending ack to all interrupts
the IRQ_SDIO still happens, but it is ignored.

To work around this, recheck the IRQ_SDIO after meson_mmc_request_done().

Inspired by 9e2582e ("mmc: mediatek: fix SDIO irq issue") which used a
similar fix to handle lost interrupts.

Fixes: 066ecde ("mmc: meson-gx: add SDIO interrupt support")

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
---
Changes in v2:
	- use spin_lock instead of spin_lock_irqsave
	- only reenable interrupts if they were enabled already

Changes in v3:
	- Rework the patch based on feedback from Heiner Kallweit.
		The IRQ does not happen on 2 CPUs and the hard IRQ is not re-entrant.
		But still one SDIO IRQ is lost without this change.
		After the ack, reading the SD_EMMC_STATUS BIT(15) is set, but 
		meson_mmc_irq() is never called again.

		The fix is similar to Mediatek msdc_recheck_sdio_irq().
		That platform also loses an IRQ in some cases it seems.

 drivers/mmc/host/meson-gx-mmc.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 6e5ea0213b47..7d3ee2f9a7f6 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1023,6 +1023,22 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	if (ret == IRQ_HANDLED)
 		meson_mmc_request_done(host->mmc, cmd->mrq);
 
+	/*
+	* Sometimes after we ack all raised interrupts,
+	* an IRQ_SDIO can still be pending, which can get lost.
+	*
+	* To prevent this, recheck the IRQ_SDIO here and schedule
+	* it to be processed.
+	*/
+	raw_status = readl(host->regs + SD_EMMC_STATUS);
+	status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
+	if (status & IRQ_SDIO) {
+		spin_lock(&host->lock);
+		__meson_mmc_enable_sdio_irq(host->mmc, 0);
+		sdio_signal_irq(host->mmc);
+		spin_unlock(&host->lock);
+	}
+
 	return ret;
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
