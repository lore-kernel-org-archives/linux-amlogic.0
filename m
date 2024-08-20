Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140A0C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1nQHgEBMurl9RI5gkZUICRXTghU0qzRFv+Q+nb210Zc=; b=a/wCoLWoLzt5rL
	W1GUAqssArAnxB9BMLWBz5acz4Kp999ChXSprP/aEW+zPwHSYIBpVnA9rDIO6NyFqrwjrl9E5O0rW
	Bm+dppEcqKnjk/n1R3/5bC87DS/MkGhjsM2KFaicIe+Vys4X6A2+G4Jajdoc+ZuvZXIlLPPg0Gfyh
	by5+eNtpaPA8TNFjaIUedW6XE9ftj8CIUQ2o7RRqD+letJvsC1TJfSHmJlAbIFW15O+kpGMs263vh
	MEQnNlWmGa11AtZe1r3fUlogC1qc0wJq4i+83wtTmph9okOrI8TQh9dbXS+SPw9psLvhjhdfYXb9T
	jXfutX2xOOLLZfXgoCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKEN-00000004Nw2-0fKr;
	Tue, 20 Aug 2024 08:28:43 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKEJ-00000004Nrq-037T;
	Tue, 20 Aug 2024 08:28:40 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Wp2Xw25s8z1S8LR;
	Tue, 20 Aug 2024 16:23:28 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 3BB901A016C;
	Tue, 20 Aug 2024 16:28:28 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 16:28:27 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<clabbe@baylibre.com>, <linus.walleij@linaro.org>, <atenart@kernel.org>,
	<arno@natisbad.org>, <bbrezillon@kernel.org>, <thomas.lendacky@amd.com>
CC: <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next 0/6] Cleanup unused function declarations
Date: Tue, 20 Aug 2024 16:25:19 +0800
Message-ID: <20240820082525.259337-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_012839_314832_0084036A 
X-CRM114-Status: UNSURE (   4.95  )
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

Cleanup unused declarations for crypto driver subsystem.

Yue Haibing (6):
  crypto: safexcel - Remove unused declaration
    safexcel_ring_first_rptr()
  crypto: sl3516 - Remove unused declaration sl3516_ce_enqueue()
  crypto: octeontx - Remove unused declaration otx_cpt_callback()
  crypto: ccp - Remove unused declaration sp_get_master()
  crypto: amlogic - Remove unused declaration meson_enqueue()
  crypto: crypto4xx - Remove unused declaration crypto4xx_free_ctx()

 drivers/crypto/amcc/crypto4xx_core.h             | 1 -
 drivers/crypto/amlogic/amlogic-gxl.h             | 2 --
 drivers/crypto/ccp/sp-dev.h                      | 1 -
 drivers/crypto/gemini/sl3516-ce.h                | 2 --
 drivers/crypto/inside-secure/safexcel.h          | 1 -
 drivers/crypto/marvell/octeontx/otx_cptvf_algs.h | 1 -
 6 files changed, 8 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
