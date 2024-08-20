Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4574C5320E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 08:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hBZEkSlC4PhcsjXqNwtv8qMFRrbkXkDyko7W2SPL+Hg=; b=rQjw4FY1tY8gkH
	kJj5KoE9riY8fEyzH6wazvwfgmmkjTQ3cDhlxzjDbfQ41TYeKER6974bGXTpkGY4Ox1aDiG5lqsdJ
	yhqzsUNj0YHNz+G0n5e+Sdmi+BGAH7L4dJwEu7Q3L92luREtwTfqPs9kmaks1DDco0h39bKeJ0krZ
	nWm0dGSBzYcSykQpqs6kL2sfw2yQi59vszeYg3zO+6894ZawzESMlphJQRaGY6McWaD8r/9d9KLDT
	NC1UPuVm97TMqCG0nehxAHy7xhOu1Px44OBvAzuu43oGmOw1nXY0973h6Oo2CuqG5kMIXufNiH/Ie
	Sd44WqHkf4YBrF3Mk2GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKH5-00000004P1C-0eN2;
	Tue, 20 Aug 2024 08:31:31 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKEV-00000004O0Z-3NGg;
	Tue, 20 Aug 2024 08:28:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wp2cl57N4zhXhp;
	Tue, 20 Aug 2024 16:26:47 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id BCEC71800A1;
	Tue, 20 Aug 2024 16:28:47 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 16:28:47 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<clabbe@baylibre.com>, <linus.walleij@linaro.org>, <atenart@kernel.org>,
	<arno@natisbad.org>, <bbrezillon@kernel.org>, <thomas.lendacky@amd.com>
CC: <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next 2/6] crypto: sl3516 - Remove unused declaration sl3516_ce_enqueue()
Date: Tue, 20 Aug 2024 16:25:21 +0800
Message-ID: <20240820082525.259337-3-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820082525.259337-1-yuehaibing@huawei.com>
References: <20240820082525.259337-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_012852_183971_1A02861D 
X-CRM114-Status: UNSURE (   7.85  )
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
commit 46c5338db7bd ("crypto: sl3516 - Add sl3516 crypto engine")

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/crypto/gemini/sl3516-ce.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/crypto/gemini/sl3516-ce.h b/drivers/crypto/gemini/sl3516-ce.h
index 9e1a7e7f8961..56b844d0cd9c 100644
--- a/drivers/crypto/gemini/sl3516-ce.h
+++ b/drivers/crypto/gemini/sl3516-ce.h
@@ -326,8 +326,6 @@ struct sl3516_ce_alg_template {
 	unsigned long stat_bytes;
 };
 
-int sl3516_ce_enqueue(struct crypto_async_request *areq, u32 type);
-
 int sl3516_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			 unsigned int keylen);
 int sl3516_ce_cipher_init(struct crypto_tfm *tfm);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
