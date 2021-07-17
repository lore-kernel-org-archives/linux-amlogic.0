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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011FDC636CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:38:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C583D61153
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 23:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C583D61153
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1/JG/6CcyVCUx3GL7a10WAa4+hC/UkaLRYq6W6c01M=; b=aR0qhqmz8QUjDF
	MA8lUWKOmH53UM2xfcYQnIzvkEr0DLgES2qU44OmEX56DAIgDs1p9/wZBqKGCfUBD8LOtmjEziv72
	3U0AHYLn+ebklXJWFkKxOdweAWnM+8TQMZpZnWNs4znmhkXL7cbbZAAkNiOkx4x57pT7nlOdVkOHX
	qk1CY+S+ARzm7pJBr2X3WRYhu/hFDNEBU8EeTC6hwQip1HfK58ON2SPKB6WtnrxNyf7HduM/jsbmv
	g3B8HGw+9CT6dMC6O4PrWSDfr2nR68mFCnrAViFZ9nGYAZrU9/3xqOQDE2EAdZhWg1Ng9dUWcxuro
	jgCrcIFydv2btYRL+nnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4tse-0079q6-Lh; Sat, 17 Jul 2021 23:38:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4tsC-0079gv-PN; Sat, 17 Jul 2021 23:37:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so8085190wmc.2; 
 Sat, 17 Jul 2021 16:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4Deofgk9HydoSwsSwYhSOQ6AZsKWmThrjuDOLQIJSI=;
 b=tTHN8RTiCkN/u7Gbn97q4JpAMsasfakEr/B3J8YpXz9hfM9fty/H+aGOKk5jp2g0Tp
 12Zb6Vx1XHpRvm1DTeRYTZfar4rF85rfb7Kzj3srhwVnfsfiG9df7rHWHtalo1bW57dv
 aCUOOWHPWC3rnfAFSp8aAuxn6UubejdrhndpyCBFspbQZLRM2ZKbGCvXruQcKYNt2Rkq
 v7oO5j0HGGMqDJr7dnRkVy5+rvc4l7GXpRmj4wAAVsY8g+SiTk/BoGoJ11ox7Rp4mmxn
 O4KQdExtxE2myqpI3hsOcocHYc7mUib7GFTZaFanybABokArmzPFMmxmkfhaiFvR1AoZ
 0kgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w4Deofgk9HydoSwsSwYhSOQ6AZsKWmThrjuDOLQIJSI=;
 b=UMno9O5sjEBTKau/AHW8ZBjacRO/acALLirZEVB0IdaaL9PVabXuGMCzprEwCLVzlG
 ciZeGMt/O6uJitUZPYuuMOFRxKFO3tUxi8h6CSXjw7FI0z2yubckbB1k4WHAbOuCjoRX
 JRHBEnz/+1yzZBO6hbjhpeCWl5YvJigAMVoqxPBzidPHpDcCD2NsHRoF/kuBjV2EZDYq
 +9GX3VKkl5QKOqs02fyB4EBcPewAaEV87IK3lsI8nhyTHplCYTRcJTxk2bLK6sDyhPWQ
 B0MRz7wGyAykTJSJoUnC+DRZoOwoG/ONGKDSVeaJ2G5jEYwhrJod7IrkGt8waDSk/6pM
 ahoA==
X-Gm-Message-State: AOAM531BkeVEV0axgs+zJmDCGCvNXCek8f3QxkUfMq7cXW25ZRHt56cx
 25EloRwQ/v9eMaVK7F3DRzFIgCC1jbM=
X-Google-Smtp-Source: ABdhPJwraMU1GDmwhidsRZxMlU3RDNSzTZ2alCY2KohjN9YprNOVczppy8RoAv0EuRw77Hg9HkzYMg==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr18955629wmj.148.1626565051265; 
 Sat, 17 Jul 2021 16:37:31 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de.
 [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id q7sm12347527wmq.33.2021.07.17.16.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:37:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-iio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lars@metafoo.de, jic23@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/3] iio: adc: meson-saradc: Add missing space between if and
 parenthesis
Date: Sun, 18 Jul 2021 01:37:17 +0200
Message-Id: <20210717233718.332267-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210717233718.332267-1-martin.blumenstingl@googlemail.com>
References: <20210717233718.332267-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_163732_863414_80DCF90D 
X-CRM114-Status: GOOD (  12.64  )
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

Add a missing space between if and the opening parenthesis to make the
coding style consistent across the whole driver. No functional changes
intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/iio/adc/meson_saradc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index e140db3e4016..b4e16f2e957f 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -347,7 +347,7 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
 	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
 	int regval, fifo_chan, fifo_val, count;
 
-	if(!wait_for_completion_timeout(&priv->done,
+	if (!wait_for_completion_timeout(&priv->done,
 				msecs_to_jiffies(MESON_SAR_ADC_TIMEOUT)))
 		return -ETIMEDOUT;
 
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
