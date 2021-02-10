Return-Path: <SRS0=lUps=HM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3CBC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 03:17:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF44B64DD8
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 03:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF44B64DD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=35JeKSqoNwEUXUD3hdqYJUw8+lqUW6HT+90ZmJLl94k=; b=a3y/yTPe++/Eah0F/r6Ndrs5F8
	4fAh8PwVP9lI2Y04xZFha0lXkk+wfuB4fnJfp54dto4uBKPKRlqwbQatgG141jhaqPULDAuSTEmKz
	o1C1LspbDiULZpbn1hJn95oL99+TGxPAi8t7eqScUvvYPK3tII68R/CLWFJQEk+Xaw/xycDAvoxu4
	YCY3r7ora1v8qPYCv/TfZU0Xi1jyTR7XBq4eJoEDK5tSzbaJuThTIrPuL08Ww7e37kyyyEnUaMSME
	HzKFpKoFciqlCqRrdaHaoLaef6TVzxewgf8uVp5sRMHsglErmSva8Nb8RhdEv04ir/qxKr8wZPlMn
	fyle+wFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9fzp-0006Fw-0j; Wed, 10 Feb 2021 03:16:53 +0000
Received: from cmccmta1.chinamobile.com ([221.176.66.79])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9fzm-0006Ex-2k
 for linux-amlogic@lists.infradead.org; Wed, 10 Feb 2021 03:16:52 +0000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by
 rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee160235007684-2e7c5;
 Wed, 10 Feb 2021 11:16:24 +0800 (CST)
X-RM-TRANSID: 2ee160235007684-2e7c5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.112.105.130])
 by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66023500448f-68b16;
 Wed, 10 Feb 2021 11:16:23 +0800 (CST)
X-RM-TRANSID: 2ee66023500448f-68b16
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Subject: [PATCH] crypto: amlogic - Fix unnecessary check in
 meson_crypto_probe()
Date: Wed, 10 Feb 2021 11:16:37 +0800
Message-Id: <20210210031637.19408-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_221650_702354_8AF38673 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Tang Bin <tangbin@cmss.chinamobile.com>,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The function meson_crypto_probe() is only called with an openfirmware
platform device. Therefore there is no need to check that the passed
in device is NULL.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/crypto/amlogic/amlogic-gxl-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 466552acb..468a16f62 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -229,9 +229,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	struct meson_dev *mc;
 	int err, i;
 
-	if (!pdev->dev.of_node)
-		return -ENODEV;
-
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
 	if (!mc)
 		return -ENOMEM;
-- 
2.20.1.windows.1




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
