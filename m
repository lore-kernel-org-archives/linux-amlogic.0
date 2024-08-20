Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660A7C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 08:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A38fGXJA3FSOevhsZQccmg8vfyEhU1vAy2xq1Yg1ISU=; b=rU9awqQ68P5drP
	nchOurllsWSw/cc7D6tHvDrCvwQ4taGVAjPHrRXKNNJCXv0h8xuAqALmxKNDLdrYBFoWs0Metktc1
	S6GrcwB4HBP3rNHcY5gnEXmZATTRM5SdRN0lDBj2C1oBPmi7ish+xwnFIIRwV8KYSStsXfpnZtxkF
	1xfFdGZLj51VMsuKtR17xZTsTgDwTrOyPGJJaT/6i6DMvmi0aaqiKeBp7YaprK2Ag87pgZDJjVQiQ
	kcS3sdnvZE/TKcL1BKfOfjr1a3EZLrze00KjJJbYs6TyQ4EsQjAaUJMgMepkHHNjLC7qrKprfgrq0
	b+IF/d2U8LHvf6tB1kHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKGQ-00000004Omt-09WU;
	Tue, 20 Aug 2024 08:30:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKEV-00000004O12-3MKx;
	Tue, 20 Aug 2024 08:28:53 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wp2cm6nrJzhXrg;
	Tue, 20 Aug 2024 16:26:48 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id F3E24180064;
	Tue, 20 Aug 2024 16:28:48 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 16:28:48 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<clabbe@baylibre.com>, <linus.walleij@linaro.org>, <atenart@kernel.org>,
	<arno@natisbad.org>, <bbrezillon@kernel.org>, <thomas.lendacky@amd.com>
CC: <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next 4/6] crypto: ccp - Remove unused declaration sp_get_master()
Date: Tue, 20 Aug 2024 16:25:23 +0800
Message-ID: <20240820082525.259337-5-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820082525.259337-1-yuehaibing@huawei.com>
References: <20240820082525.259337-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_012852_192193_EFE6623F 
X-CRM114-Status: UNSURE (   8.16  )
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
commit 720419f01832 ("crypto: ccp - Introduce the AMD Secure Processor
device").

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/crypto/ccp/sp-dev.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/ccp/sp-dev.h b/drivers/crypto/ccp/sp-dev.h
index 0895de823674..6f9d7063257d 100644
--- a/drivers/crypto/ccp/sp-dev.h
+++ b/drivers/crypto/ccp/sp-dev.h
@@ -138,7 +138,6 @@ struct sp_device *sp_alloc_struct(struct device *dev);
 
 int sp_init(struct sp_device *sp);
 void sp_destroy(struct sp_device *sp);
-struct sp_device *sp_get_master(void);
 
 int sp_suspend(struct sp_device *sp);
 int sp_resume(struct sp_device *sp);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
