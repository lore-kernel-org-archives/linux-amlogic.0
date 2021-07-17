Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEBFC636CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:38:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E9FA61153
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E9FA61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hMfMVe71aGY09IIrBUQwOf5q94lSa3gYurpFxhVK8fM=; b=AP5nQJxxkUsMaV
	aJldqmT5ezN/lT5qH/wRSyNh0ZObGQpGtD7bNEVB1TXTzS3qcYtmFc3MrcANwZ7Pf6XsRQqGzqeBo
	O4xzwMSAkiae4VGaPl2XUOr2sLY0s/XtelNkvhoJYzQGn23UThBqAwOR0WQV7KVUdxp50b/g6787q
	h392GUY9s7YgEijaBkb5xQ2hRlQDhv/C2RD+6JNFDfTTiKFqZeDd3eSMZw+F4+uqNZPQ7mWanf4e2
	6NVFqgsa4jzFUSqKyb9bsVqFC+hAHYDWyM6OqGtQDEwajVDNXvKZSuEbgJW13dsoVnNsf4YEmf1j3
	W+Asa14t/uCJiumYCE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4tsu-0079wE-Lr; Sat, 17 Jul 2021 23:38:16 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4tsD-0079hD-HS; Sat, 17 Jul 2021 23:37:34 +0000
Received: by mail-wr1-x42c.google.com with SMTP id g16so16528060wrw.5;
 Sat, 17 Jul 2021 16:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XT3dSBF1T+xb0vIDoCrx2w6ZTm5g1KZ+GveMuxTzekE=;
 b=CtXz2OYi/GCxjfmSsp1YKE9LnoDSnkeBX/+cM0CqBTWLFyQ6l+6dF7g0GALhl5vFip
 bB1RIaGem2FXKgNiq5DFd/DPWKamLAy953PR8qpNsuuHn+CCMqud62IDqI2tgLVcNVJL
 pqiUeR/+krg7X5p1lecyAvFwM5jkR75NGg6E5w+CQb1NJ9sbUYwh+ep4qbz61fVvxMJp
 TcSgS/GtSGwi5iDDi8i26O8rXG9dnoxKH7P/myimGPxHn9jsUFuERMigxDKxjx9wQWSW
 v8eZgG05pDqFZaqWIbBJC5A9z6GV2VeemXuFYPhFjx3Pr9A3KDKuqhML1I7a9D5eavp+
 fGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XT3dSBF1T+xb0vIDoCrx2w6ZTm5g1KZ+GveMuxTzekE=;
 b=Yysg/t3e+4Nk0T7wGpr9BCvZ2sq4WplSqM4lNbx49Eo0U/b+HnI1fn7QEKrrS0YZSp
 Lbm+u3VsGG5VWQ8jjhJUpx2ZBqS/AauMkSnTXSJjfe9c00vjj2g3dExbWy84OKgGk1lB
 iKfcPtDg/lTuFw0ZtwoQXPV3saUrP1dRtwyPblpeArFpkcB9FuWZ84OjNOz4j1LSqQOF
 VUJOIwpamOfgDIsr6BagW1EZY/ENKgPnDav8Pzy7XQsV992Fj3hQ5k7tW5E4jeyCZB+v
 dRMK4UIFuF7OFYNFZtcnvQajc+dbAF2skpyPZgekx3TSJtTpL841WR29Ure1LMOq4wC+
 2lXg==
X-Gm-Message-State: AOAM532oATc2YTrwd+THEEF2upd6hxN+61o/Doym3grcgYmdOHi5rI3F
 sQx1/jM+8UgrkFFl4Hrqq9U=
X-Google-Smtp-Source: ABdhPJyMHQezFPPUSmeL1JZrcqZFIjqXhH77/GR5QaHIt7RRb8WSy+hK7rcUeEv/o/KOCoaagS0qRw==
X-Received: by 2002:a5d:5141:: with SMTP id u1mr21346802wrt.193.1626565052070; 
 Sat, 17 Jul 2021 16:37:32 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id q7sm12347527wmq.33.2021.07.17.16.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:37:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lars@metafoo.de, jic23@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 3/3] iio: adc: meson-saradc: Fix indentation of arguments
 after a line-break
Date: Sun, 18 Jul 2021 01:37:18 +0200
Message-Id: <20210717233718.332267-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717233718.332267-1-martin.blumenstingl@googlemail.com>
References: <20210717233718.332267-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_163733_619351_D790FB5D 
X-CRM114-Status: GOOD (  13.64  )
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

Align the function arguments after a line-break with the opening
parenthesis on the previous line. No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index b4e16f2e957f..705d5e11a54b 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -497,8 +497,8 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
 	if (priv->param->has_bl30_integration) {
 		/* prevent BL30 from using the SAR ADC while we are using it */
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELAY,
-				MESON_SAR_ADC_DELAY_KERNEL_BUSY,
-				MESON_SAR_ADC_DELAY_KERNEL_BUSY);
+				   MESON_SAR_ADC_DELAY_KERNEL_BUSY,
+				   MESON_SAR_ADC_DELAY_KERNEL_BUSY);
 
 		/*
 		 * wait until BL30 releases it's lock (so we can use the SAR
@@ -525,7 +525,7 @@ static void meson_sar_adc_unlock(struct iio_dev *indio_dev)
 	if (priv->param->has_bl30_integration)
 		/* allow BL30 to use the SAR ADC again */
 		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELAY,
-				MESON_SAR_ADC_DELAY_KERNEL_BUSY, 0);
+				   MESON_SAR_ADC_DELAY_KERNEL_BUSY, 0);
 
 	mutex_unlock(&indio_dev->mlock);
 }
@@ -791,7 +791,7 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
 	 * on the vendor driver), which we don't support at the moment.
 	 */
 	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG0,
-			MESON_SAR_ADC_REG0_ADC_TEMP_SEN_SEL, 0);
+			   MESON_SAR_ADC_REG0_ADC_TEMP_SEN_SEL, 0);
 
 	/* disable all channels by default */
 	regmap_write(priv->regmap, MESON_SAR_ADC_CHAN_LIST, 0x0);
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
