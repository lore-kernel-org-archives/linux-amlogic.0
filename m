Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5224DC5320E
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RhzkkoQO5q/59KQKCIlE16SDGQsDqgYtOitIADEvy8k=; b=K/VCWxGF7kZ7M3
	8AnK3Cn/DccvShnfaD6HjR+cMXr5BoFltWqzXbWIKEO9BEdY9GSmYPNiiZIp9FvhgMJgmK1gzDDzZ
	qCOzdcsOfacF/0RhvNFXBtdcIfM7BKQ02LzOZwVMtKgicn2mlk72DM360xuYhON8PuWqc/LvsnlRg
	jOd5edvJwAOEk+soogaMy1XD6NqyACY5z9l7zO3iau2AOpQS1g8J/DluMaookeRgd3C0GCYyvwn/x
	3Fdrf0Ujirp7eQ4EGauLAFLiRC37t2T3e/rTqBMEgO5zrfI0+lExI3NnHIv4k+8Ytg9aO3PEqjZDw
	ySpMmcJcyxzRb/u04qew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKFj-00000004OW6-2oAj;
	Tue, 20 Aug 2024 08:30:07 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKEV-00000004O0j-0Wna;
	Tue, 20 Aug 2024 08:28:52 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wp2YJ36jLz1S8Lm;
	Tue, 20 Aug 2024 16:23:48 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 5DE7C1402CF;
	Tue, 20 Aug 2024 16:28:48 +0800 (CST)
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
Subject: [PATCH -next 3/6] crypto: octeontx - Remove unused declaration otx_cpt_callback()
Date: Tue, 20 Aug 2024 16:25:22 +0800
Message-ID: <20240820082525.259337-4-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820082525.259337-1-yuehaibing@huawei.com>
References: <20240820082525.259337-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_012851_488022_E8C03A22 
X-CRM114-Status: UNSURE (   9.19  )
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
commit 10b4f09491bf ("crypto: marvell - add the Virtual Function
driver for CPT")

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/crypto/marvell/octeontx/otx_cptvf_algs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/marvell/octeontx/otx_cptvf_algs.h b/drivers/crypto/marvell/octeontx/otx_cptvf_algs.h
index 4181b5c5c356..a50b5e2f8d00 100644
--- a/drivers/crypto/marvell/octeontx/otx_cptvf_algs.h
+++ b/drivers/crypto/marvell/octeontx/otx_cptvf_algs.h
@@ -185,6 +185,5 @@ int otx_cpt_crypto_init(struct pci_dev *pdev, struct module *mod,
 			int num_queues, int num_devices);
 void otx_cpt_crypto_exit(struct pci_dev *pdev, struct module *mod,
 			 enum otx_cptvf_type engine_type);
-void otx_cpt_callback(int status, void *arg, void *req);
 
 #endif /* __OTX_CPT_ALGS_H */
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
