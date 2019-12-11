Return-Path: <SRS0=S6c6=2B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4DCC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 08:42:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D707214AF
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 08:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pFjlNv7+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHUO4Uku"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D707214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwFrXzeWT8M5oA/aefuEW726uxV6VIfLAongp2LAZuI=; b=pFjlNv7+qo4d5c
	2v9Q+RzUe87MlMaIw4rB4ss9dgVcIHri8a/p57QF5M/EGNkPno4yqEuDF85ztU3UPqE9jPhYNVEjV
	0pPa1vjhfRbXNxMjZl07wyCDBHH6ViZrZ4xC15CCP8kM8xULq2PEhP/yllS2PkFYP/fa9Xj+QzJyz
	ArVD1pYs13g6DN/8PlRduupccQtEFBkgwuti0Fejsee45t8TRSJd1yL6OGrMa7ovn4BT69RTbXqg9
	YiUBST3TmJKju7TLaREnCjbiiIMtlXfU3G72sq3DvM1tviLVwz8Rdno05Zwx+lpsaY/VdfUVV67d7
	cFwSYr2qWOzFwJmFI5uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iexZr-0005eI-Bd; Wed, 11 Dec 2019 08:42:35 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iexZC-0004uL-8l; Wed, 11 Dec 2019 08:41:56 +0000
Received: by mail-pg1-x543.google.com with SMTP id b1so10407744pgq.10;
 Wed, 11 Dec 2019 00:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZX5iKFff+zirWsLntEazM/Rbpxnzs9FOJJrz4dQumzc=;
 b=MHUO4UkuzYpZA3AHVcHQwjQ3qiK8LGCGbQkoMcg3lJKv3tAaP6BMTBg2Ib/qK37dA+
 c5L/hXucjHUBEbtVwOTLq2DQQa2FHXO/lLHOBXi2jFqtXNji3CbRH5LR06+kRCcZKoPb
 GUgDODlN0gIhiXK6mD4bUE3SSJC0TO6NI3a0MtgQO7kizMf3g7EC9QXW6eoQSU5/GdYi
 hMvTTgzME/upt+wwKZFcGXQBixnooyz3ez9ipRTbX5T0OX43dsafvRPYbeKrg3GKvDHO
 hL/fLVDdRs1/KxdVK8O537Rzi0mWV21RQX9bTUJiHBNg9/dj1AGb73qQB6PPnUDTGxIC
 XJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZX5iKFff+zirWsLntEazM/Rbpxnzs9FOJJrz4dQumzc=;
 b=jFpXGrEpksCUyUKkFiJjuqBwmySXr5hacbOpxmeFhu1HNLDDFDpcwJen7NZjCSsTxY
 Zfo2bvtbobVUtN8UBA4pnmTJxF/iCBYkfstVkNasQa6Xxgr+vU5Lq7Sx+XLmv/EZpqew
 LN5znfFO+QvUzfR8CVEc7RT79oRIjM/Le3s99Ftf4FDeTP8OoYTfUJm0EoJEfZMwRHam
 e9vYDEZQLWd4x7tn0RUIcjqN/vr0ay+SQympR4/kipqjYSZMcW9NcDHFwQuITHUXVKr7
 HZ9rvRy4I9NIM5t8MwobqBPL4BTEcC81jSOiLGhtE8r7Mba+u2yOHLHbO6iky/hmBwum
 Mptg==
X-Gm-Message-State: APjAAAWM5617uof5UBZVfsojcWtFM8Fjwmc5h8qwKIaboE+BcSrVJViJ
 K5aE2O3ZIVpjUGPiSIFAF9E=
X-Google-Smtp-Source: APXvYqzO1zopMC7CKJPCqQkkW+wGdyMfN7a2pPRNe/6FbBn7+WTgfsNCmI+0BrTqx7nTq9HCJuuNtQ==
X-Received: by 2002:a62:b402:: with SMTP id h2mr2447717pfn.55.1576053711611;
 Wed, 11 Dec 2019 00:41:51 -0800 (PST)
Received: from localhost.localdomain ([103.51.73.137])
 by smtp.gmail.com with ESMTPSA id e16sm1806233pgk.77.2019.12.11.00.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 00:41:51 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Corentin Labbe <clabbe@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>
Subject: [PATCHv1 3/3] crypto: amlogic: Add new compatible string for amlogic
 GXBB SoC
Date: Wed, 11 Dec 2019 08:41:12 +0000
Message-Id: <20191211084112.971-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191211084112.971-1-linux.amoon@gmail.com>
References: <20191211084112.971-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_004154_351149_372E484C 
X-CRM114-Status: GOOD (  10.59  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add new compatible string to support the cryto controller
for Amlogic GXBB SoC.

Cc: Corentin Labbe <clabbe@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index fa05fce1c0de..9859ab023e23 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -311,6 +311,7 @@ static int meson_crypto_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
+	{ .compatible = "amlogic,gxbb-crypto", },
 	{ .compatible = "amlogic,gxl-crypto", },
 	{}
 };
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
