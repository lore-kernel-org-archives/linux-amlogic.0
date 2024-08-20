Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93553C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2024 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7AyRHnOhuub3fCaTQy2q9HNS35w/G08FClqAtJIzLI=; b=krqVBEfzyiW8og
	Vav/V481ADWAkxLol811ux6/nv9M+eHIO4laRxbHGhLkpGi09UZVQ5wYWpJP/61E0D+07n9U5Unza
	5qc9btZoNn7grKpiLyIgysA2dEKuAPPpXmsRws5ahRQ5D8BIqklyJ1/ZZOmNhGImUpyWDZgji1etO
	3SJ3QYkulbadcHiFBYEWzo382aK+sTOcKQxlnG9exuQef2mxAd73Da1UoDyksv+9ZXjYY6MQumbMB
	PYDDrLuaUWJTa8D1sPcWzXjcIxv9ZZZJuQ6WPCY075PUzxYwuj5T5lM7fiPG7UqHt9JqkJBeOOnJ9
	cbrLCqpFCc1QnxT03c2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKF4-00000004OEy-1l0C;
	Tue, 20 Aug 2024 08:29:26 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgKEN-00000004Nud-1RHo;
	Tue, 20 Aug 2024 08:28:45 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wp2YV5fPBz20m7J;
	Tue, 20 Aug 2024 16:23:58 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 40E7C1401F4;
	Tue, 20 Aug 2024 16:28:39 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 20 Aug
 2024 16:28:38 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
	<clabbe@baylibre.com>, <linus.walleij@linaro.org>, <atenart@kernel.org>,
	<arno@natisbad.org>, <bbrezillon@kernel.org>, <thomas.lendacky@amd.com>
CC: <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next 1/6] crypto: safexcel - Remove unused declaration safexcel_ring_first_rptr()
Date: Tue, 20 Aug 2024 16:25:20 +0800
Message-ID: <20240820082525.259337-2-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820082525.259337-1-yuehaibing@huawei.com>
References: <20240820082525.259337-1-yuehaibing@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_012843_752621_40FB8268 
X-CRM114-Status: UNSURE (   7.36  )
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

Commit 9744fec95f06 ("crypto: inside-secure - remove request list to
improve performance") declar this but never implemented.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 drivers/crypto/inside-secure/safexcel.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/crypto/inside-secure/safexcel.h b/drivers/crypto/inside-secure/safexcel.h
index d0059ce954dd..0c79ad78d1c0 100644
--- a/drivers/crypto/inside-secure/safexcel.h
+++ b/drivers/crypto/inside-secure/safexcel.h
@@ -897,7 +897,6 @@ int safexcel_init_ring_descriptors(struct safexcel_crypto_priv *priv,
 int safexcel_select_ring(struct safexcel_crypto_priv *priv);
 void *safexcel_ring_next_rptr(struct safexcel_crypto_priv *priv,
 			      struct safexcel_desc_ring *ring);
-void *safexcel_ring_first_rptr(struct safexcel_crypto_priv *priv, int  ring);
 void safexcel_ring_rollback_wptr(struct safexcel_crypto_priv *priv,
 				 struct safexcel_desc_ring *ring);
 struct safexcel_command_desc *safexcel_add_cdesc(struct safexcel_crypto_priv *priv,
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
