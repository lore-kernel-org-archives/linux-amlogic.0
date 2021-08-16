Return-Path: <SRS0=wHyG=NH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEB1C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Aug 2021 09:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12E2A61B5E
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Aug 2021 09:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12E2A61B5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dd9vTQzYR3gVmQtTbv0px0fPIwFw6C+9YpLN1XRHX4s=; b=4mgW9+YPwzWf6C
	7H/Qk1DNZek4oWom41izOwI+b71iEqjQAIPQ+A9u/WHGBDqlSKEG/5V4/vYgcJCWEXCPXSYItzGV4
	K+5x3vV2P9sSRjLCOLtsntvbgy9Oxb3gJ4bm2Yi8ay1fnc2iZAKOnGYY08h5z7u7VWCQrco+8HMGy
	0KJPJfKmfa0GsaGSea+EarXFgPszQWKoV8ytgURgkqGmD9zw621eX1z3+rJ0OKJBIVz098B/l6fMZ
	Ihp5rL4jqJ8n5xc1dZ641r02SxVXhYiZzKwEDxWFHPPb+4tQrz7JHNNxdCi2Ubr5S3vSfnUrwA0rb
	zKVmA1GY+B7EM339Frsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFYr2-00Gbhu-Fm; Mon, 16 Aug 2021 09:24:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFYr0-00Gbhd-Vc
 for linux-amlogic@bombadil.infradead.org; Mon, 16 Aug 2021 09:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=DWq+aW2rHeX2BMBYJFBFGxFm/iqJeW3HJYZI4/q4Quk=; b=pa0//LtNxEQUzwI9JpVmfmimcC
 vHq07NBrOpvJxxefe3u++PI/EAsHlnqez7yz1faVGmaO1xzMzgBK52yyGVjmmxeE7qZtYkopWoA94
 QEJ7kFDt+E01HbsepDKAUPnJODnZuKcNtYQPN1sK7YBqBCVbGpxbJbrNSftrD0fsGHj+NLxZoBN2T
 8UdwsCPe5ezdeyoqdzSVQxjlB2mXITHy3ZQZJxQaHqnrRODfx9iRoBVvH49FNLMYXIA+EtWGDh3xM
 3vRNsya4MHhhK1NIsLalWmLbYaB6cSZAeokq7Nm/8oKEvaoCxZyNuqLjicpUB0awR/4//dyICuXoC
 Eq4GRDIw==;
Received: from smtpbg511.qq.com ([203.205.250.109])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFYqs-00A9wZ-6L
 for linux-amlogic@lists.infradead.org; Mon, 16 Aug 2021 09:24:21 +0000
X-QQ-mid: bizesmtp32t1629105786tgodgymx
Received: from localhost.localdomain (unknown [111.207.172.18])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 16 Aug 2021 17:23:04 +0800 (CST)
X-QQ-SSF: 0140000000200030C000B00D0000000
X-QQ-FEAT: 1USUZei7Xzblra8hebEUe6w3Kn+05DLkcVYHGjy8fK2smcTQ+iiDGMfML4QHI
 EC5x8uDXVrRd0WsVqIujRuPmN49W9QXS211cmnOF4raf94bi5h0wp94IS667J+BfFkFJae7
 8o6A24QKU5xaD5fohtGK2/NjfmdHbqD+rfq+i19zvhb2/OOobkWWsCDXHYrSIZkeWB27W6c
 oXyRtpLVRAnMka/6KD9q9v3UJ/epqeertctTgII8oc7opcnBTX3VMDcryhXz28thBMRrWMM
 D4cjdsMtXyxSXJ1qgCvlJEEeNT/X2fh0VZvbx29RM0A+BdaiPe871v62iB4ilfLewT/fkMn
 zm3CBsaH4MvgwF0kfwNcL89kWjoQg==
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: mchehab@kernel.org,
	khilman@baylibre.com
Cc: narmstrong@baylibre.com, gregkh@linuxfoundation.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] Media: meson: vdec: Use
 devm_platform_ioremap_resource_byname()
Date: Mon, 16 Aug 2021 17:23:03 +0800
Message-Id: <20210816092303.10162-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign7
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_102414_844041_9025AFB2 
X-CRM114-Status: UNSURE (   9.37  )
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

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index e51d69c4729d..8549d95be0f2 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -994,7 +994,6 @@ static int vdec_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct video_device *vdev;
 	struct amvdec_core *core;
-	struct resource *r;
 	const struct of_device_id *of_id;
 	int irq;
 	int ret;
@@ -1006,13 +1005,11 @@ static int vdec_probe(struct platform_device *pdev)
 	core->dev = dev;
 	platform_set_drvdata(pdev, core);
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
-	core->dos_base = devm_ioremap_resource(dev, r);
+	core->dos_base = devm_platform_ioremap_resource_byname(pdev, "dos");
 	if (IS_ERR(core->dos_base))
 		return PTR_ERR(core->dos_base);
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
-	core->esparser_base = devm_ioremap_resource(dev, r);
+	core->esparser_base = devm_platform_ioremap_resource_byname(pdev, "esparser");
 	if (IS_ERR(core->esparser_base))
 		return PTR_ERR(core->esparser_base);
 
-- 
2.20.1




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
