Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E3EC43458
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 17:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eBfPIjxn81JP7GKyX4e1p4gdHORWNox9hwvLO7wr1Uc=; b=ZdYZkyDnHTL9D+
	gM0qPiax3B6DtxmstpTePmOJoZoisN2tArU+2of7zA6onm6hczUdvqjbAuhwSyZ+p+lqEK20HMks0
	9K9Q/j8gv0mpzZQn2T/g4AUqV73pPENUq2rV1yh2dCEhSPPuLTNMNVwzkht/jPkoN4PZ4gwOaq/UL
	W815PIdZVdeBvXGcTqJ2Q752xNmuPce+MS9jlabws8OEVNv3iw+93bKMQ/+Wk57KO/sxEfhuvikwL
	g/VArFKUmBk6WNAujMTMHRa0HvU0c72OSPyJNfpEQWyeo1rDKZFyLBy6wLr3PcfVSP0ypgDx6Zf2T
	SIh6GgetN+dSIvlH8KIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKH9-0000000A65F-2T5c;
	Mon, 13 Jul 2026 17:17:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKGx-0000000A62V-3DVq
	for linux-amlogic@bombadil.infradead.org;
	Mon, 13 Jul 2026 17:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=r8F7PDpBGQrWy7oTUa6pu42Pf+937GWEA5yn0veEyiU=; b=UJ0Wd55hUae2nupoO1A/5mfW3p
	kpEo42RlLR4fNxCp+W6HRDhwIGpe4mmg+hYbs/WT6Mvst/s1sZ5wy0ezlbBJEQZXxHpmfnp/urR1g
	mh244I0DEMrIauYOAce9UO76Jw57frRYNsTh2Kg/pJtkxnzaE+mO1e+myNmcT0wJj0K80ZEC6mTNY
	X7UoOTcIG5w7OcCvZrGb5Qkp+ma77f3v5gl3u2yHsIFDNO4hgO0NPDE8oN2AoPy1Xwwzo3tRKqwtQ
	ElYW/xLVj7cepLs+ZruiShqBbl3X2nd2IOTQJuYJsxwION0sZMz2XFcmP2fNzhMDanAD9Ghl/fTS1
	m03xMSzg==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjKGu-0000000BsoJ-3xzb
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 17:16:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3811f512167so4133176a91.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 10:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783963006; x=1784567806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r8F7PDpBGQrWy7oTUa6pu42Pf+937GWEA5yn0veEyiU=;
        b=LJOjUMHcVFiT/mwzISPtMPdFUHnpC2P6VodWNArVdDtkiUGjPE+/awZPnJayoKNK3L
         OPF1nKVJd1lAj2TQ0cYs8n1ZHWSqVUVwnPKekiCe3ufkMQy7tqWo6zK6ObNUncXLxH5x
         STtSkb1D6pTbUQRg/xQHP9AELzgQyOqEaPiigzwSTjgz9xbRMG49IL3ZTrNc6XbbYi1F
         6pNtUcATcDJVmLbasSDkTOu/KqochKSG3woRJCHsBF2eJ6Uk3PTVQbzLpIsnDLjWTiSZ
         90o9vgcFbeSvHi/UjwW08JGbNfFtdYOwxOPUPbcZLhlWehEePuqfmxgU0bQGyVrFPTDV
         Cggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963006; x=1784567806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8F7PDpBGQrWy7oTUa6pu42Pf+937GWEA5yn0veEyiU=;
        b=BTnfxSAH0EG9BGUftTcnbOwKpVgfI096ReyVebPpow+OuSeZ6OwQqE/XCxWrO0XiOO
         6Oxknloo80iEGkBAxPXrRzD/dOOZtgD/ZyYmuunoQZPv8zMZmyApXonKSjKdmuK06YwD
         dlQr3QAf3u1oMbW/IjH/R+11kB2NNBELD9pmy9QEmovCFT2Nr6QMNvsUEWDd3KFnXWVC
         kl7eFo8yqWnIMzofH93/Zcskfcc5c6oDQilYGWfK4F5c3Y1Hq3bbWI8W7qb0K6mEWUCE
         jeKopE0JSybTTK9yBWK5fIrGGPKE7tkQdBo3suXN4PIoA72CaX6W8IV9yeO0ZCVG5kAk
         r0+g==
X-Forwarded-Encrypted: i=1; AHgh+Rropgttn3ZwUj6+EXkB0iFtzqhe6F/G0tUhS5EqR6H+CWC8Hfq5CN0NmaynLJUgnmXKd8yWJZqGZ0It44cC@lists.infradead.org
X-Gm-Message-State: AOJu0YypgGMjE4v4eFATxXIdXen6BubmwwizR6IUE/nCpFUsNY9eF+I2
	DXaYoMiWSswYm7TUmFQxd1p9dqfl4FLfJO5khY8+s6DsBcY/WdPemxgb
X-Gm-Gg: AfdE7cl0BkBjqCx9fKnkJKCkJa9ieSAJ/9XFY9ajZCfMjk7mk3DXxQ81zjJhQzi0HCg
	ckhomAWKjlJdS0Xxg8ITm6wHjU70m3lOIiVU+pjqeMWHZ+FEra5OyMEindHlLTWAN+AtZipo5Jq
	AYTFuy8vNDKjLMFeWZE04x5Z6ssrTQGSDCVvHWqw/aRXYcaluMSlp4LgYQXrSFVDKoKfEyldjC2
	r5/ZiuViS5w8vdzgSiGtL1JB8S7wsfEYnWJAiRU088KtCWGAGDOBtZzCziiiT8viiZLb/rLLA1N
	BV/qSboAW4Si05rGxjbvfQRF/jl6WvxcGDE7tRvcJ48n98WUIoYbHdRgqkZaM0fxTJC3dP90IAW
	41NciHtPNs7o4QCgsnHzA4LIodH/rIQL9wEkPsaFdkQ9Ha2sUOcvbyHovq9wBdkG0ZUjBXS7JGv
	bzvNr9jEGvlvO01JtIkJkqOjbEHyU39Zs131FxDHa8BJbkqkzB/oaui+vZNdn9D1K8XL52WTzwc
	r755XwxdeaahfiII1wiR6zTb7HfiAQLetvvzEtOnkwv8LU=
X-Received: by 2002:a17:90b:58ce:b0:381:152b:d596 with SMTP id 98e67ed59e1d1-38dc74cff62mr9789745a91.11.1783963006364;
        Mon, 13 Jul 2026 10:16:46 -0700 (PDT)
Received: from OMEN ([103.184.238.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm55281016eec.22.2026.07.13.10.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:16:45 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alfie Varghese <alfievarghese22@gmail.com>
Subject: [PATCH] staging: media: meson: vdec: propagate devm_clk_get() errors
Date: Mon, 13 Jul 2026 22:46:44 +0530
Message-ID: <20260713171644.691-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_181649_034463_D60DDF70 
X-CRM114-Status: GOOD (  10.44  )
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

vdec_probe() maps any devm_clk_get() failure to -EPROBE_DEFER. This is
incorrect because devm_clk_get() can fail with other error codes like
-ENOMEM or -ENOENT (clock not registered). Hardcoding -EPROBE_DEFER
masks these real errors, causing the driver core to retry probing
indefinitely instead of failing early.

Propagate the actual error value using PTR_ERR() instead.

Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..fba1e7f88d81 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pdev)
 	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
 		if (IS_ERR(core->vdec_hevcf_clk))
-			return -EPROBE_DEFER;
+			return PTR_ERR(core->vdec_hevcf_clk);
 	}
 
 	core->dos_parser_clk = devm_clk_get(dev, "dos_parser");
 	if (IS_ERR(core->dos_parser_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_parser_clk);
 
 	core->dos_clk = devm_clk_get(dev, "dos");
 	if (IS_ERR(core->dos_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_clk);
 
 	core->vdec_1_clk = devm_clk_get(dev, "vdec_1");
 	if (IS_ERR(core->vdec_1_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_1_clk);
 
 	core->vdec_hevc_clk = devm_clk_get(dev, "vdec_hevc");
 	if (IS_ERR(core->vdec_hevc_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_hevc_clk);
 
 	irq = platform_get_irq_byname(pdev, "vdec");
 	if (irq < 0)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
