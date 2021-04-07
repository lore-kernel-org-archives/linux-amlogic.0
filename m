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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9BBC433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 10:11:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D7F61382
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 10:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D7F61382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K63AghFAjZgzcmzgXxHHDe4KxqZPz8zVlW+ML/GPhZE=; b=KY6bkQqGJUt+d9s259ldzOjtkt
	lGl7xAXVbW+sYWJeoMcuHPqFayPmmRU1GZRdxFnrvoaLO/IABMqWaoUQ4nb/dHHddPYwddb3dDx40
	p3kL9RhpS3seaTcBvNqLfe3ugEU1Zn8A85McLoSdB6YPlsdg8OQt/Y/WJVvsrnqZBJfcJO5jOtD23
	+b7cU15IoTNFBfm7jdqYA6jKIZm/oqAN5Exdh8jx6mak3YU7wbgFH+1O/Un7ebZs4Fgp46b2Y3UG5
	BuVBY02NUj3cZLHgEofGvEmo4XPo0EERaxkaTl60P88Ys2Jk5p8Bn4yQJr+mT5fCSKAYG1d5MLQpX
	Y4gUaWTA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU59K-004hCH-ER; Wed, 07 Apr 2021 10:11:02 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU59D-004hBV-Fz; Wed, 07 Apr 2021 10:10:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id y18so1194631wrn.6;
 Wed, 07 Apr 2021 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=wPByJzN/lrtdxw7IeGs/VhpNS5SPbMlWIMYIa7XkvgA=;
 b=Mv1KqnOmWXihqzCTJ7mc3sDMHB2wPVvBiahBlHsncEMZtquH6WvHTwwrUTTh6AONiF
 J7HgP0UHU1SZn+flahbTYrKdztw8UgHAP0CCxXG0/LHPpiomdNdtCQmSb4u8U+nGYMi0
 K9FOQJZaQT3Et3YjxjMePQsUoWgUZxmJedTqXXg1VseoePKRo9PcSAgwmLIIpdvExWXK
 hCxRXLox9jhtz5bP2po8hrakmCjWyk7JUp0ocj3G1iwpSWZHNRx0tORESQjhWPlx1fY+
 ABXFXsN40JndUn1ldyjab/Iu/C24XoCYUpqdBKTlu4p+O18kE2r2G1YsDyPwccwe6KOK
 cEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=wPByJzN/lrtdxw7IeGs/VhpNS5SPbMlWIMYIa7XkvgA=;
 b=qIlVscVi2PWROwOdJnMl9ILnmuoEIvQPHAbGVzEktiz06CduF5ZTuXmZk4AT2/PDmY
 t1PsbPqYA8HxCJsXF6CgvSEpcS+upUOs8nvsWot7z2/cya/jRpDosjZOQNv47tkv0jJK
 CkJ7jQXPW1ZBZV7nXonySRKpdxpygtQLIuigWpY7l11tiCTYx9TDTo6j6ytjOGwm34Nc
 tAx5Z+v/bStSUH8lhITRyBZVCmacLyQ4lGJR3vyBVf14jIfYITDeEs8JM0fYByfZR1NY
 at1CDN1+Ef3hRiFumViFZUzz/OtHor9SO4Lft8u8g9ruGRABkwHyNzD2oQv8Alija9Zy
 2lkA==
X-Gm-Message-State: AOAM532uoOsf2eRMLcxSAQXQZQzPlpjkl/TT2hJ4GRZRH9VYaGhER/5m
 6nh0O2R86//k901G4JfH5jOVsZ0iu7kc8ZUJ
X-Google-Smtp-Source: ABdhPJzF21Oel/0BU67OgtwJ2Z/9oyBl0+N2CQ9W+9/69ZNDuh80eCyuAPaG2Rmx5fOW9kTaY0xQ1A==
X-Received: by 2002:adf:d082:: with SMTP id y2mr2920830wrh.176.1617790254787; 
 Wed, 07 Apr 2021 03:10:54 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
 by smtp.gmail.com with ESMTPSA id k13sm46297544wri.27.2021.04.07.03.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 03:10:54 -0700 (PDT)
Date: Wed, 7 Apr 2021 15:10:47 +0500
From: Muhammad Usama Anjum <musamaanjum@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-media@vger.kernel.org>, 
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS"
 <linux-amlogic@lists.infradead.org>, 
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>
Cc: musamaanjum@gmail.com, linqiheng@huawei.com,
 kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com
Subject: [PATCH] staging: axis-fifo: media/meson: remove redundant dev_err call
Message-ID: <20210407101047.GA1491258@LEGION>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_111056_433848_78EEBFFE 
X-CRM114-Status: GOOD (  11.36  )
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
 drivers/staging/axis-fifo/axis-fifo.c   | 1 -
 drivers/staging/media/meson/vdec/vdec.c | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 2bb1c2e9cb57..ed9281089738 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -853,7 +853,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, r_mem);
 	if (IS_ERR(fifo->base_addr)) {
 		rc = PTR_ERR(fifo->base_addr);
-		dev_err(fifo->dt_device, "can't remap IO resource (%d)\n", rc);
 		goto err_initial;
 	}
 
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
