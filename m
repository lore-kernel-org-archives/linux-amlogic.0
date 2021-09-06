Return-Path: <SRS0=2xsp=N4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B2FC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 07:00:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4454D60F92
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Sep 2021 07:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4454D60F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5b9D9V7lye8zvAZomrMOWcUTdjxrG0U0AHKfC5qvH+0=; b=K8EYneYsU3FHhu
	Cr6Nrn64HQ5OIUWoaRn5QXSfb5OkKE0dRYc3l9Ai6ZtmaWjBSEBLXfIeZ056jDtCmj93Ci6aqw3vi
	ZhswAcVNwHToNQM52A9Mk2gNN+gzhRyKHnBwpolYx01aQAphF7jobTf1EzelWsQr3V3JOtITvqV+A
	2RnitIP3iwed3vUxkoykoTjJ4rlrYiXrZkmCQUrETm64rLWs4LLtZyCpL8Kvc89P3K77MwYSeggtp
	2dK8wg1GqXrFTQDE6hXMsbcFdZK4tZwQm82JETIrC30G+VYR87Os2zqOzXV35jtVq2fvmN/gRpbwJ
	KQZWsP8WOB6HOhlMuRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN8cD-00HU4f-IW; Mon, 06 Sep 2021 07:00:25 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN8cB-00HU3g-OT; Mon, 06 Sep 2021 07:00:25 +0000
Received: by mail-pg1-x536.google.com with SMTP id e7so5843941pgk.2;
 Mon, 06 Sep 2021 00:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mx3nDhHb+cYhtgK78HeCOT8qRwLpEWC5Qetf1O8Tuw8=;
 b=iyGJFiG+erqh1x40HUTRMuDlfwZEmK40x94VbarencMHIO8m9WEtig5OPGoAdqwkN8
 Bw23SEFku3SVufdK+WF1Fyt0iQc3VGBl6K1jmxDjCfQIQNsM0++7Y5ibbSMS/LFN6g7V
 9VfGiV1ZldsC1mOTFW7/GhqjfrB8daaHlY1icR9YL083R7rsxiFO10fvCBWQ8I5h6xrW
 4PYplxoJExPZ0+hVgk0w7F5Dcpx+5v47y7V1pAsi2B3YtOgsMll1JmoKKLXh1W31Ih6y
 R8x2Sf0Xzf22tI0AXzT21DgsaenRy1BxPjcsMdJ2gaYDJ+fIdUl1kxG1Z4rkg5RiC6XQ
 s3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mx3nDhHb+cYhtgK78HeCOT8qRwLpEWC5Qetf1O8Tuw8=;
 b=uTFortmlHX0tikPWOownsPv1S7dTN5qeKe1ONs7RBpE1A3qpkK0YTNEKOsFfF7Mf+K
 mQf8rB4zwVNdCtdpWsiKtQWaotG6uvusMm0T47ZgzDw7dedfksGqjg1w8TWg8/Gx5Bcg
 8vrJuUblAHFvxTZ4YQ0312ax4WYb3T4D9iY1XgiNysVmgJHciSrTQjMajT7GNyFLtBnn
 6ljTR7thdXHPTpj6d1IkOm8avS45a7psMJECGVLd2gwrX2JKk4OjJL0NvIAPjfJJ0ScD
 azzNILieIv67YLwEIiGchq+u2cgBMU+GMjJOfRCxNe62c/gvvC4P29ubQlxhank+k6tK
 /sXw==
X-Gm-Message-State: AOAM532aSF7dq7oJu5s6/4zVhUCD9sRxyomW4IXUFWF88pfCuUjDc4cs
 mabK+Z7+ObleiNDi7xM2pCE=
X-Google-Smtp-Source: ABdhPJxTmLde5whEnuajU/+gqaTHbvSiU5HaX7lFpiYl9/hN/9S/fhqzrXjRd8CamopoFbVVB44d3A==
X-Received: by 2002:a62:3342:0:b029:3b7:6395:a93 with SMTP id
 z63-20020a6233420000b02903b763950a93mr10627850pfz.71.1630911622352; 
 Mon, 06 Sep 2021 00:00:22 -0700 (PDT)
Received: from localhost.localdomain ([124.126.19.250])
 by smtp.gmail.com with ESMTPSA id u21sm8045403pgk.57.2021.09.06.00.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 00:00:22 -0700 (PDT)
From: zhaoxiao <long870912@gmail.com>
To: mchehab@kernel.org,
	khilman@baylibre.com
Cc: narmstrong@baylibre.com, gregkh@linuxfoundation.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 zhaoxiao <long870912@gmail.com>
Subject: [PATCH] Media: meson: vdec: Use
 devm_platform_ioremap_resource_byname()
Date: Mon,  6 Sep 2021 15:00:13 +0800
Message-Id: <20210906070013.7362-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_000023_841607_2905D85D 
X-CRM114-Status: GOOD (  10.92  )
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

Signed-off-by: zhaoxiao <long870912@gmail.com>
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
