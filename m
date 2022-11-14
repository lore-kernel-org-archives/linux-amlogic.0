Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7247C43217
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Nov 2022 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/GTGi1a9nU2ljXBe2ldRP1XZ7zqYKBdzK5V/9GX/5tE=; b=sPH1pWp5EfimOW
	NAKelhJKBHi74QskPHzp7oCiN7GRZSCtnATEGxoUPFXbxd/I0RF6kPCIi8IwT67psKZRVrDlqZ0G2
	XrHh+AVRTLEOfjpkmM+jso26MZdgRxc7d1DBALrO3ZbsDiXIDnkoNELARwGoqzd4eQ4ZyWX5ehevU
	ftGdgqQeuAbGdcCKE8pe9+JQpwbMnSMMkSutrLuTOKWHnm3SPmltmGxC7E6Gl+mWCY3e8Syeb5Cv9
	H6qOLS0lAl/0n+Q/LhQjJzC1H7y11g1qMC5QBmFy5Uy+jULfQXNSquJdtvAWGueiKzjHukiR2UQCw
	QIiqk7K+euaiwKfwhpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVxE-00HFBe-CQ; Mon, 14 Nov 2022 09:40:36 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVws-00HEtK-KB
	for linux-amlogic@lists.infradead.org; Mon, 14 Nov 2022 09:40:16 +0000
Received: by mail-ej1-x62f.google.com with SMTP id k2so26893217ejr.2
        for <linux-amlogic@lists.infradead.org>; Mon, 14 Nov 2022 01:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/E7DQv1w5VxBWNYYy8b3rJwQQFYjed72q0l2u49VmFw=;
        b=mV1Xk5oqlPhbGM675526QGnANRWzR3kkuCK7FjmV9soqIRzH7cFh2DRZEQaq7RKsl8
         +sp0+OlHXt7xWppuqpq+9kMfLz+Fmc1qs3Ui6Tm3NaeH3UUyC7VtVRIhGjQmi9WLftgZ
         lRFGpWsBqHXodsusA1zkb0pMPsxHbH1JYQYcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/E7DQv1w5VxBWNYYy8b3rJwQQFYjed72q0l2u49VmFw=;
        b=s7gaBcvqud/Kho7a5bIB6My0Wr0/nDbLPq02QK/dMqu+JURDkuxfr3ec7NspLo6hww
         mxkEw2XTT1GwqXNWfWqhnoPfNlhReSQZq35MjVQYu6QUiPom0daEg+uZRsWJt+5ejR09
         WZpONNrejJuPjCdOwq2ZyK7nwxjya4fQYVvNeJnamhlmGokofTtKlbS0d/sbARkv1yN1
         cFYRTRe5qeCtzor4S1MACFo2AkQw8YIwDgQatK0y2jHmUpAdO2wyuP1fOpAWWtTOPoPh
         9fDKqUBaJ3hAZQjW27zKYtbXMQzMJLAKnTFGd5V5sO1XhoEU/n5uykrt3qGo3wkFdzZW
         gQCw==
X-Gm-Message-State: ANoB5pk/2vD/U5oj7t5D/bKc9hy1OaBjXRxn2oQq5yoT7j5LPnFr+uri
	xHd8nD3/S+TlT0rAnJlsfZ5/dA==
X-Google-Smtp-Source: AA0mqf5rOmZDPmo+r9tZg7mKbD10KNVdVuxgpnD4x2FxOInLKSsw/pvFBCDxNyjJ0tF2dI6SUBll/Q==
X-Received: by 2002:a17:906:8d06:b0:78d:8d70:8bf8 with SMTP id rv6-20020a1709068d0600b0078d8d708bf8mr9312698ejc.15.1668418810409;
        Mon, 14 Nov 2022 01:40:10 -0800 (PST)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id 26-20020a170906311a00b007ae693cd265sm3928068ejx.150.2022.11.14.01.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 01:40:09 -0800 (PST)
From: Peter Suti <peter.suti@streamunlimited.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Peter Suti <peter.suti@streamunlimited.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: meson-gx: fix SDIO interrupt handling
Date: Mon, 14 Nov 2022 10:38:57 +0100
Message-Id: <20221114093857.491695-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_014015_066090_B54FB947 
X-CRM114-Status: GOOD (  13.82  )
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
Marvell-8987 wifi chip entered a deadlock using the marvell-sd-uapsta-8987
vendor driver. The cause seems to be that sometimes the interrupt handler
handles 2 IRQs and one of them disables the interrupts which are not reenabled
when all interrupts are finished. To work around this, disable all interrupts
when we are in the IRQ context and reenable them when the current IRQ is handled.

Fixes: 066ecde ("mmc: meson-gx: add SDIO interrupt support")

Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 6e5ea0213b47..972024d57d1c 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -950,6 +950,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	struct mmc_command *cmd;
 	u32 status, raw_status;
 	irqreturn_t ret = IRQ_NONE;
+	unsigned long flags;
+
+	spin_lock_irqsave(&host->lock, flags);
+	__meson_mmc_enable_sdio_irq(host->mmc, 0);
 
 	raw_status = readl(host->regs + SD_EMMC_STATUS);
 	status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
@@ -958,11 +962,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 		dev_dbg(host->dev,
 			"Unexpected IRQ! irq_en 0x%08lx - status 0x%08x\n",
 			 IRQ_EN_MASK | IRQ_SDIO, raw_status);
-		return IRQ_NONE;
+		goto out_unlock;
 	}
 
 	if (WARN_ON(!host))
-		return IRQ_NONE;
+		goto out_unlock;
 
 	/* ack all raised interrupts */
 	writel(status, host->regs + SD_EMMC_STATUS);
@@ -970,17 +974,16 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	cmd = host->cmd;
 
 	if (status & IRQ_SDIO) {
-		spin_lock(&host->lock);
-		__meson_mmc_enable_sdio_irq(host->mmc, 0);
 		sdio_signal_irq(host->mmc);
-		spin_unlock(&host->lock);
 		status &= ~IRQ_SDIO;
-		if (!status)
+		if (!status) {
+			spin_unlock_irqrestore(&host->lock, flags);
 			return IRQ_HANDLED;
+		}
 	}
 
 	if (WARN_ON(!cmd))
-		return IRQ_NONE;
+		goto out_unlock;
 
 	cmd->error = 0;
 	if (status & IRQ_CRC_ERR) {
@@ -1023,6 +1026,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	if (ret == IRQ_HANDLED)
 		meson_mmc_request_done(host->mmc, cmd->mrq);
 
+out_unlock:
+	__meson_mmc_enable_sdio_irq(host->mmc, 1);
+	spin_unlock_irqrestore(&host->lock, flags);
+
 	return ret;
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
