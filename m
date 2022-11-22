Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8880C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Nov 2022 13:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gca2sdcPQS7KVhIIQmSsPxhosiNx7x9pMWS3t/r9So8=; b=06jhnlOXV+8Eu1
	AF+xItNGIJMB+t89WZwd9FBeGNvf+93RlutSgyHX52i0R518fYXYq6EYgc52T5yLEDXolQGk5GnIs
	x4zIVRTWrFVgHSxMmVS+6G08UZ00v8wwnpo5oebOrLxmX7urje5QnMk7ASzcM3C0nNb0Ro4aNNrOc
	mvazETvORoQZ94m7AY+WQJxJVKNKer0HfdOL3nXQlMFE/fmQXKGlQipY5iFtmtQWVZAaics/i8W95
	lQi1LI/ahAnw9YaiqW3j1gHV2/+bPnSDr78u1DnvWhNAznjUBVmdNpkR7a1QpIPjO1PINb168DLGI
	IjNXndrImARxYkituc/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTFl-009coS-TX; Tue, 22 Nov 2022 13:23:57 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxTFX-009civ-Tk
	for linux-amlogic@lists.infradead.org; Tue, 22 Nov 2022 13:23:45 +0000
Received: by mail-qt1-x836.google.com with SMTP id cg5so9186860qtb.12
        for <linux-amlogic@lists.infradead.org>; Tue, 22 Nov 2022 05:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=issWTojkRWwRHPZ2j+gQ8ojVqtNRu9IZkFS8IgCllcQ=;
        b=Q6aoLE/g+fzPHn+PnCKdrn/BrRxrGWD0/CX5ONbAQckV97NqTO8xj2TigP9aYVdRUX
         AoIAvco6DhsUru77+CJBvtWPK+uovNdFeERay1OWYOEI2r0CQdtwQaIjQQcsWTmcXyti
         FJXYD8hXeWr76NwVyFXjygZkUQcFwyQGyjaXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=issWTojkRWwRHPZ2j+gQ8ojVqtNRu9IZkFS8IgCllcQ=;
        b=A8vaKWQEXdAxpFvX932Vi9HN2yEPD28erJrf8c7jU/hhpGM7MFzIynQ9g1rcMs7tyF
         kMsx5umTnGxFfdv9J7Hwzl3OszbDnXseXaTCnfCiwt8Mnx9JXEuZNHWdotXhdw07SzOZ
         NYJReWNc11E9zN0rnLxBqzll4Q6oqtDoACb0Ox8n7d48HhU+acPojVA/Fr0f+XZz2lIQ
         Z5QidkuiUrZcQttNY2duKk0jURwRug/16YOpVrfuHIYHS+Kmangouk8rkxKmccZ2/UR5
         w1Go9R+eUoqf/6xCz75Wge+T0Gy0bRc9ZHjuVuIMPNYiH9qp9gRJrNTPyypF2/kwc1SC
         M3og==
X-Gm-Message-State: ANoB5pkFbPgaeZjtgMeVmyGztzPYfc4up9NkkUsPNEW/qbMEwIFUPMJv
	GyiLEFcaVSa9/vMraCRULG/sJg==
X-Google-Smtp-Source: AA0mqf6o5e5xDM5n95dwthsSblW7L+S7SvxEFiDzFfhDNPrE9TLVj/83o4uuV8rzacLGbiT2HpOFqw==
X-Received: by 2002:a05:622a:4c18:b0:3a6:275a:8538 with SMTP id ey24-20020a05622a4c1800b003a6275a8538mr17685007qtb.109.1669123420436;
        Tue, 22 Nov 2022 05:23:40 -0800 (PST)
Received: from localhost.localdomain (vpn.streamunlimited.com. [91.114.0.140])
        by smtp.gmail.com with ESMTPSA id w11-20020a05620a444b00b006fb72dbbaa4sm10084441qkp.27.2022.11.22.05.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 05:23:39 -0800 (PST)
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
Subject: [PATCH v2] mmc: meson-gx: fix SDIO interrupt handling
Date: Tue, 22 Nov 2022 14:23:03 +0100
Message-Id: <20221122132304.1482508-1-peter.suti@streamunlimited.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAPDyKFqrCCtY_A072WswEFa3Bnz7EfMp40MRYtr3G7Jbq_hbTw@mail.gmail.com>
References: <CAPDyKFqrCCtY_A072WswEFa3Bnz7EfMp40MRYtr3G7Jbq_hbTw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_052343_965740_4C62BFBC 
X-CRM114-Status: GOOD (  15.74  )
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
Changes in v2:
	- use spin_lock instead of spin_lock_irqsave
	- only reenable interrupts if they were enabled already

 drivers/mmc/host/meson-gx-mmc.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 6e5ea0213b47..0c95f8640b34 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -934,6 +934,13 @@ static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
 	}
 }
 
+static bool __meson_mmc_sdio_irq_is_enabled(struct mmc_host *mmc)
+{
+	struct meson_host *host = mmc_priv(mmc);
+
+	return readl(host->regs + SD_EMMC_IRQ_EN) & IRQ_SDIO;
+}
+
 static void __meson_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
 {
 	struct meson_host *host = mmc_priv(mmc);
@@ -950,6 +957,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	struct mmc_command *cmd;
 	u32 status, raw_status;
 	irqreturn_t ret = IRQ_NONE;
+	bool irq_enabled;
+
+	spin_lock(&host->lock);
+	irq_enabled = __meson_mmc_sdio_irq_is_enabled(host->mmc);
+	__meson_mmc_enable_sdio_irq(host->mmc, 0);
 
 	raw_status = readl(host->regs + SD_EMMC_STATUS);
 	status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
@@ -958,11 +970,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
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
@@ -970,17 +982,16 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	cmd = host->cmd;
 
 	if (status & IRQ_SDIO) {
-		spin_lock(&host->lock);
-		__meson_mmc_enable_sdio_irq(host->mmc, 0);
 		sdio_signal_irq(host->mmc);
-		spin_unlock(&host->lock);
 		status &= ~IRQ_SDIO;
-		if (!status)
+		if (!status) {
+			spin_unlock(&host->lock);
 			return IRQ_HANDLED;
+		}
 	}
 
 	if (WARN_ON(!cmd))
-		return IRQ_NONE;
+		goto out_unlock;
 
 	cmd->error = 0;
 	if (status & IRQ_CRC_ERR) {
@@ -1023,6 +1034,11 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 	if (ret == IRQ_HANDLED)
 		meson_mmc_request_done(host->mmc, cmd->mrq);
 
+out_unlock:
+	if (irq_enabled)
+		__meson_mmc_enable_sdio_irq(host->mmc, 1);
+	spin_unlock(&host->lock);
+
 	return ret;
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
