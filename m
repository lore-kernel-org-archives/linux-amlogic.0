Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83BDC3DA4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pcP7+ejZS0Ld24meGp7ZFOavTdFgRzjvPUNB5PTrngk=; b=n+C4AiORJGEdi9
	KggfbyzYmu8rJX6MncnbdxzmX0w3khWP78urDhyqGs1d2RdivtYtla/pdebHJ45olgObzgl6BYM7b
	zwfIg3AlhZktPJykjZSq6WQZ5KWtzm2u9pOrh02XGP3x7sRrDhGg3QOjuBbHRt0iNFlkQS/QKD8dE
	X5wU0s1HejNKLsKrKnGQSAAbCbpOp6fD5uXq2FnnmA0kYztBksl64gq2FdBfY8tQX8gYwl35pGDT2
	mfQ9xFfXzElXPsKAi2GZcoaLeMDEyh0nZr9zA2PwP1w76Yvi/P6aLdLMmcnTfJe8zMAZsR2mB1PH1
	D3FI4rWLLGiG6FDfZgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKHj-00000004P9S-0tXv;
	Tue, 20 Aug 2024 08:32:11 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKEW-00000004O1h-3ykL;
	Tue, 20 Aug 2024 08:28:54 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wp2dN3bDjzpTSv;
	Tue, 20 Aug 2024 16:27:20 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 37764180106;
	Tue, 20 Aug 2024 16:28:50 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 16:28:49 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<clabbe@baylibre.com>, <linus.walleij@linaro.org>, <atenart@kernel.org>,
	<arno@natisbad.org>, <bbrezillon@kernel.org>, <thomas.lendacky@amd.com>
CC: <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next 6/6] crypto: crypto4xx - Remove unused declaration crypto4xx_free_ctx()
Date: Tue, 20 Aug 2024 16:25:25 +0800
Message-ID: <20240820082525.259337-7-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820082525.259337-1-yuehaibing@huawei.com>
References: <20240820082525.259337-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_012853_349267_4F922342 
X-CRM114-Status: UNSURE (   8.44  )
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

This function is never implemented and used since introduction in
commit 049359d65527 ("crypto: amcc - Add crypt4xx driver").

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/crypto/amcc/crypto4xx_core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/amcc/crypto4xx_core.h b/drivers/crypto/amcc/crypto4xx_core.h
index 96355d463b04..3adcc5e65694 100644
--- a/drivers/crypto/amcc/crypto4xx_core.h
+++ b/drivers/crypto/amcc/crypto4xx_core.h
@@ -149,7 +149,6 @@ struct crypto4xx_alg {
 
 int crypto4xx_alloc_sa(struct crypto4xx_ctx *ctx, u32 size);
 void crypto4xx_free_sa(struct crypto4xx_ctx *ctx);
-void crypto4xx_free_ctx(struct crypto4xx_ctx *ctx);
 int crypto4xx_build_pd(struct crypto_async_request *req,
 		       struct crypto4xx_ctx *ctx,
 		       struct scatterlist *src,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
