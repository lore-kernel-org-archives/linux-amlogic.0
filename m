Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0794C433ED
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 16:09:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B8B061279
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 16:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B8B061279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ouvfnrHiN9yUSFQojaCEwC0v14ny0fAGMeOCBQFyZJ4=; b=l9Qd1pDsCbO+tb7Y728wAelCBQ
	3J00dYB+UBBEA/rJYDjovy1Fgp9fd8FhallzrbD+FrYj3WhloSETjmxZ1mBiy/uo1RCI9LNTKXvNH
	7S1L0PNQAPQ2cnGTiLNnrwq7pvc6ss8XgPmXkv+YNZy5OwgC1jOXnG9x3eT0lIodTrlNST1woMSP/
	VeWqD7y2CEHSMMC/Djp7DQJ8RQrF8N3lEBkQAdzpVQ7mZSS1pYVgTmWT27F7QzOexLYcv68qg3LAQ
	GGp6zWI2PCmJh219mrRiiVI7rwOu3BGI7o+/j1e985wagXOJHV7esqW1F/yAse2DupyEe3R/fx6yi
	uOxj/f6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAkI-005PpQ-71; Wed, 07 Apr 2021 16:09:34 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAkE-005Pof-Te; Wed, 07 Apr 2021 16:09:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1440898wmy.5; 
 Wed, 07 Apr 2021 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=JvelsXiWFhKiuGc95HnXl80V7C2PAh9toMttuEic8p4=;
 b=IrIk1cIvAGMsMIbtfA6TTDf4CDC8HoNmKqtJ2r9DRCj59ZO4+q9oJtLk0SNeP+QqSg
 PDs6Szt1xf8k/Vy81oW9lcyhG2yJufDjgayLf7YQTQy/PUt8iP6E3xEJ64q/R8K7kqTe
 huqXuL9FCwm5zisZd2cywcoQ/PX3+L6dS8gKzUBVziWBP47/P6kPOmBytVStyrlWRUjt
 /vXJg4XJXjaA5RPEcXVYrPZY1QgmIyLuPIykLN7kszLdy3ySpz3AyOlJNXQwvO+k9+Dy
 RXjkvbuNTsXpoCDfXUoVJcNXV/RrDg+uIxUf7N0tVZ71nrYzovG7wM9DhQD8Dn5GovCj
 5nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=JvelsXiWFhKiuGc95HnXl80V7C2PAh9toMttuEic8p4=;
 b=P9fJH3WKoUYDfLyDxSzfMvBdi27Q7hKe8/+7Nu2N5MTxZowYiEINYe+/Bw7s9UvH17
 H++k72b54o9GqJhearNY5oKS9Qwh+0TkebOisNHLuBMXpStx+j2S51d+bxSNmLgQkBZE
 5Pw6wVBdTWcESlhfJpYau9a0ZmuynuwTlb3sALmaGGKCwBJpkzTPOr07mBn2qgU1hjCE
 mhSyTOy/2ZBeHPXDh1JZrv3XWvYj6QrmLpjTmw2ZJeIQC6KNE0PThdDcftaQO20wUwR2
 mziJlMKvY9/aJFnvl73Deog814GV9NY9ee3G1bNlDhhBXLG/IQmzc5BYvlHBB9Dr6bSl
 M1Bg==
X-Gm-Message-State: AOAM530XyQav1kf1rdI2VoPd7AmRU2A57hUfswvd52iwq3sANH4bf/iy
 L2wAC31ZVmh7a2uSVkpyhIU=
X-Google-Smtp-Source: ABdhPJyuSEjgC8gxcdCSq+RmMhMDpIj2VfgSm4mV8lRxLBxVjOmi7Jvkw3oGCeM9Sps9dZfNkLyqaQ==
X-Received: by 2002:a1c:df55:: with SMTP id w82mr3826801wmg.162.1617811769001; 
 Wed, 07 Apr 2021 09:09:29 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
 by smtp.gmail.com with ESMTPSA id j6sm8376112wmq.16.2021.04.07.09.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 09:09:28 -0700 (PDT)
Date: Wed, 7 Apr 2021 21:09:21 +0500
From: Muhammad Usama Anjum <musamaanjum@gmail.com>
To: hverkuil@xs4all.nl, Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-media@vger.kernel.org>, 
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>, 
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
Cc: musamaanjum@gmail.com, kernel-janitors@vger.kernel.org,
 dan.carpenter@oracle.com
Subject: [PATCH] staging: media/meson: remove redundant dev_err call
Message-ID: <20210407160921.GA1504294@LEGION>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_170931_054037_B6EB7348 
X-CRM114-Status: GOOD (  10.28  )
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

devm_ioremap_resource() prints error message in itself. Remove the
dev_err call to avoid redundant error message.

Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5d4db7a5b4b5..e51d69c4729d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1008,17 +1008,13 @@ static int vdec_probe(struct platform_device *pdev)
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
 	core->dos_base = devm_ioremap_resource(dev, r);
-	if (IS_ERR(core->dos_base)) {
-		dev_err(dev, "Couldn't remap DOS memory\n");
+	if (IS_ERR(core->dos_base))
 		return PTR_ERR(core->dos_base);
-	}
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
 	core->esparser_base = devm_ioremap_resource(dev, r);
-	if (IS_ERR(core->esparser_base)) {
-		dev_err(dev, "Couldn't remap ESPARSER memory\n");
+	if (IS_ERR(core->esparser_base))
 		return PTR_ERR(core->esparser_base);
-	}
 
 	core->regmap_ao =
 		syscon_regmap_lookup_by_phandle(dev->of_node,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
