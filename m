Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B7DEB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 10:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IX77xDACKzR6/oJLiHcztq5tYBMLOmS53FjFOu2pDwU=; b=xxnaKsKWoWUbKw
	lyKwznwClqTBlOJvia6ZJMvoAO9b10fxGF+ZV93NJgMZMIunxYKeWRWGfk1QmcESMHlJSv5Tu/deZ
	H3GEY1d6ETIF/L2ap+EHxRAcAIz4BK9zj0dCJRidpR7+qR6yq1HZ+8kuSJ1zGdiEWNfOq+ePt82c4
	2D0dZjfaoniwRn4l8fIIZnHZVXHXzCb3deWPss9y2k2xon7+OvAprUN9oAeplot/yMT1pwr8CmjcA
	gN1rD5PlC+FO4IF1uCYg5yxC39GI7/4vlll9nVg52eBqpSpJQHFbEYoAaxNM8CyiCxvTuXn78QQO2
	1YJCwRPp4F5wQlfAL/3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCHwW-000Ibx-1j;
	Thu, 22 Jun 2023 10:53:36 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCHwS-000IYI-3A
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jun 2023 10:53:34 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b46cad2fd9so76592811fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Jun 2023 03:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687431210; x=1690023210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAAd8JtH4zYPLMTCIKY+Yne0KWOXMwDZDoPI05bkqp8=;
        b=qjZBCxmZxL+Eh36jvWumDK2DRD5p+kazF0Gun092VmNoLwIpTp2Xs82s17VVljkCZc
         y8LaN0As1JvRWVU8IwV4ZRUvz4EsZpjuPLxFoPUpikBWf4gfWGdFBNNQ6IUiP1TJlgz3
         0AhiMsS8srlTMnQ4iJOwLM4DjUSG+rtlzityUHFrTZHAOdkb1vAOPs6rmTHBnYXExPPQ
         olmDaqZ4HBChhUvSU2POIagqAzDQDlYVZRknGxLbi4ihVHcP/uLa8e6rPXbYJRV2IB60
         43cwU6P8IKaHgywg6o66jVRtokVtUViW8B1wKFUFGeSho1/ukE0Ko2+RQBWB4r1s8tUf
         Pmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687431210; x=1690023210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAAd8JtH4zYPLMTCIKY+Yne0KWOXMwDZDoPI05bkqp8=;
        b=Pu8xDjrF7JZoKV6hgtyAfBoXcDi7usQDsiXr1js/mO3USePlXKCAnRodZKTWhBsrgi
         QM+5P9N4OdBLSzGFqrJ7cal9g7DNrPU0NCBfQdYQPRAG2ofLuZxlmqrtFkClwbVk5Jwq
         KwJLqpGF+TEsJ3hyWiB1sAKvuT+VOjPklkQ4oBxoJlhSsTTdojuSHE/50QmUFcUEdY+3
         +j6TF/U5taTvgWeOPIRFOCexaj5Enw3iDFdO5XgBfJCWZRTFvnJlXa2n4JKQ5TDDc6+u
         WKM/9LEwICrpJ/CXtN+Mr00c8PXoYR7ycabqU91ZxyxFMvY8kDw0RYhROT0qVfkFKxV4
         o91Q==
X-Gm-Message-State: AC+VfDwNPaFKeoUXcl+ynr8MpHdrqJM1zjL3eXuYI9PVN3BfRPtLWVHb
	90LUHWI3gGNGHsvkhC3HQ1KeBg==
X-Google-Smtp-Source: ACHHUZ4nHM6Q4AYt+U9zTwFnLj3fidlXpclz83BLY5riwkGo7dEB1wMJ8L3mLjs0IkmzknIK2YAhFw==
X-Received: by 2002:a05:651c:20c:b0:2b4:5c80:786d with SMTP id y12-20020a05651c020c00b002b45c80786dmr12060575ljn.12.1687431210370;
        Thu, 22 Jun 2023 03:53:30 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id v17-20020a2e9611000000b002adb98fdf81sm1267318ljh.7.2023.06.22.03.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 03:53:29 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: linux-mmc@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mmc: meson-gx: Drop redundant WARN_ON() in the irq handler
Date: Thu, 22 Jun 2023 12:53:27 +0200
Message-Id: <20230622105327.77296-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_035333_018258_3807FD53 
X-CRM114-Status: UNSURE (   7.26  )
X-CRM114-Notice: Please train this message.
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

The host pointer is already being dereferenced earlier, so let's just drop
the redundant WARN_ON.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/meson-gx-mmc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index ee9a25b900ae..d652374f37b2 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -948,9 +948,6 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
 		return IRQ_NONE;
 	}
 
-	if (WARN_ON(!host))
-		return IRQ_NONE;
-
 	/* ack all raised interrupts */
 	writel(status, host->regs + SD_EMMC_STATUS);
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
