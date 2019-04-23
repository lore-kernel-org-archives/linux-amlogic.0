Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFDEC10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:03:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8008020674
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:03:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cTtkB7hZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qypmTfDB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8008020674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiW1O+97wbPyVUAfyYvQHKezGZcB3SzC08pSkwPVEfo=; b=cTtkB7hZWcmVcE
	gM3Izics4tBR4Iq1Vj999TYMljLj1blCrLdNawmyzMxZ4mNljhumhnLmjC1W5O4B1Xasi8wqcyURn
	6KcWguYr6dtieY3+mnFNAwzrKU545mvOtOirJBTAa0Yphy5QcyB184Jmw4n+nkxfKgi7BOdzCrL8Y
	E7ieE+VXKhNDHZk7Se0WgaITAaqNCfjTcjRYp6MTPKDQGLunbS9y/AMvg7fCNLuOOOVrmPHNp1ZFg
	8/i1TIb9EVAj5azVR1yNANZpTNKYxtD56PNUKguoc8UHXzHNsPahzcztzUmpvmax4ZKWF/I/QkVgg
	qP7WJ5j6G8tJBmpvK7Gw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrKJ-0005jA-7t; Tue, 23 Apr 2019 09:02:55 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrKD-0005cV-Kc
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:02:50 +0000
Received: by mail-wm1-x341.google.com with SMTP id h18so17787297wml.1
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9mkQOCOyKUJCXFL3UmoX1uExjUUiwIU7JlFlpoGkgA=;
 b=qypmTfDBnIggohr4oTcl1DKf+xQhzrv43qq64kdnrsD5FiChu544D2Z/Q6kDPHyMyE
 YFr/zzUgt/cRfM02ECYDfFz8ANOaKMQZfoVXdk9Szf/L6Cx0N9zY2TEjP59uvaeYm7Xe
 A2CteyW3kkGwfrZsA4lxmp7pNmDnZa0Dxc6ynlfMeN+WQnIU9RTYJf2jmZwkBvh4Q5On
 KFGW76zK0Hd1RFqBtWmy3Cnbt4+pcMfuveWDl9PPOIPhjtMTOb47nFGhA9qIhfKCfhuM
 B65nCNoiNI2pZpuw+HMJzBH/Wf66saIli5qI8RnEFtEJ6/oYDs9hQEJom43JcDBIWrV3
 EKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A9mkQOCOyKUJCXFL3UmoX1uExjUUiwIU7JlFlpoGkgA=;
 b=la/xojA7oqWpijw+gRDEi/OY/2jjJ8SRn8hF3/RasqD+GnHpr9N/bF0Z+HohaZi7ZJ
 pFDlSmzVdQfUhNHtgQ//g6OsGMqzUeSTWkcRxL6sxAQtVwFlhFcz+wc9ybjGwEHL5fnM
 2m0M5j9TAspImsqznVfB+tL/d6O9qiCi8pn+KIv/PeLdxqtQDrTq/4PogKShW2qHt2Up
 WMaK90vTL1cBYH7FUMSNLqdHmfWx06IdxTqX7tYv2fJ7xiSnG7WQbwH02zRJSQPO72KV
 BSSc5GQxqEzLGIWOchU177j5EW5h8TN5oppi6XEOm9fvS94DpANitJYK5UokwucH4pcg
 wFMg==
X-Gm-Message-State: APjAAAUU23P6fs3tDXeHfMtfDiYKZoAeO8oRpZx9HYm+tKaAx7p6+/31
 UEREx8ma02zBwmThT/Z+l5Dw2g==
X-Google-Smtp-Source: APXvYqxItRPwOb/4WnO6Xb62IZlKEytOErCBr1HMvACHuQpk5+YTXCFKJJkhl6u146I2ujBEhnUcRw==
X-Received: by 2002:a1c:ed12:: with SMTP id l18mr1517688wmh.13.1556010168140; 
 Tue, 23 Apr 2019 02:02:48 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z23sm12361894wma.0.2019.04.23.02.02.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Apr 2019 02:02:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 3/7] mmc: meson-gx: correct irq flag
Date: Tue, 23 Apr 2019 11:02:31 +0200
Message-Id: <20190423090235.17244-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190423090235.17244-1-jbrunet@baylibre.com>
References: <20190423090235.17244-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_020249_678532_57B6AAE9 
X-CRM114-Status: GOOD (  12.45  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

There is no reason for another device to request the MMC irq. It should
only be used the MMC device, so remove IRQ_SHARED and replace by
IRQ_ONESHOT as we don't the irq to fire again until the irq thread is
done

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 8b690ecde4c5..3df50b53f834 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1328,7 +1328,7 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	       host->regs + SD_EMMC_IRQ_EN);
 
 	ret = request_threaded_irq(host->irq, meson_mmc_irq,
-				   meson_mmc_irq_thread, IRQF_SHARED,
+				   meson_mmc_irq_thread, IRQF_ONESHOT,
 				   dev_name(&pdev->dev), host);
 	if (ret)
 		goto err_init_clk;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
