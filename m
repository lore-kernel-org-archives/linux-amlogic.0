Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361EFCD98CC
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jun 2026 02:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cjXUokxaKq4ru5HRBSgKgrAXUOAaEB1e1S4lqH1zZOk=; b=pM5NLDG/aXDhsu
	6bi2TmjdjuIHxXXCZ+u+uG6qYtQidxcv1zUd2+RZzsdyat1uu24JGAU9276iOvgNtfervdYy4hqxe
	kWNKaM6FQFcXjjzQo7q3RHGoJyA/LHNKZxk/oUJf/ZVTNYLjyfX5J0erSqR7mcDKmlqR2rqTBlgtl
	MiOvmFE3TwvseTXdZWlZ/1ikbuYUL9V6BYVHq67b5G0QegRB1dfYKm25upkZV6Icteb23SCt2ibVW
	yScIIvAF0/jdafQvnT0mHQkPdReFfPSkUCkCVm8sRStA/2lVU7lfVzVfoGdxIHYmbCTuhIDHmzhUJ
	Q+mPnri6tOBqSr+MDqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrD9-0000000AHK8-3cGL;
	Fri, 12 Jun 2026 02:01:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXrD7-0000000AHJE-1cb4
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jun 2026 02:01:31 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0c3546924so3208425ad.3
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 19:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781229688; x=1781834488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDHiaw71z8q8M2ALF9QoURQ8Hng/rkqvvoaFnmcE27w=;
        b=OxmGgJ6Wp5ImS7JsWZS8v5jD2bcAmZL2KHfqaI8m4/cUbZ4Pzg3FzDBilY+aFm6zND
         kYjQLhsJIY8bnECSc6K8v+DVUH7Hf2dSpSutYS1x9Lb8u5swBioZyUuV8ylJsVJ2BXpw
         p9pPAaz/jZwSPwWiGZMMgX0zYYa3qNDyUAlw4VkG/bHQ1T/mcVXmbPjMUtbPl5KoDi2j
         uv4W9JAHzphLVY3zLhunaxikGhjZZq1wU7ELBiQy2v0hJ8RmIJPRGa8wufhH2qCHxNX4
         f5ghZ7XCBL707H0gqFL7BAHVh28gfrIwCl9gmeHdtyZDka/O1sIpTCVCs2qKe4K0kkso
         8RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781229688; x=1781834488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDHiaw71z8q8M2ALF9QoURQ8Hng/rkqvvoaFnmcE27w=;
        b=MF2W0a8oIqPimN2BvojFfMdTLEA1MBuB+ndq3CGpbu4LxS0vuO/JssTMDBzPYHS48l
         IQI9M3sIwMkugMc3tpsKMNAiuq6H/pSuhTXrN7ZHA9UVhkCkCZj71XAcUfL0IiCyDPh2
         ekezCBzwp7x6hL8hx2gxf3760FJA8MmGKG4/nIVfg6Y56DXa7P6G5lZNBj+YEo0ozEyw
         Eh+eLE6Yt+lklroQDm5NKgxmGYhLmrEdxFKG/SJuhJvBy7OSktSTlV3CHwfN90N+4y9q
         REdf4txe0mkeLEKZSRJxr0qoY8JbbXY4VQ7CT0nTrbYSj6rIriTv/r4TLLCgkgbsw37M
         z2YQ==
X-Forwarded-Encrypted: i=1; AFNElJ+SyBgVubzZjg8ha8d/FWuVfYwHTtHIK6d4hkYt6WltukYsXuFqO+gpLLEFM/eq5PvSvXPWrAlr1uNXZjy3@lists.infradead.org
X-Gm-Message-State: AOJu0YzyYgHv2ULMok/BxRFxVownPRKlF42dXpHSeas5BoxfnarymEVW
	jnzsN2HlfqebNV5e8BaA1nrj5S6IfuSGY5VhJA4YhmpIU2/TzxmACmHU
X-Gm-Gg: Acq92OEkW/2N4883VpmFW6vSsucVagZVI9YuX6YNAh2zzDUJvSApnNEN666mflORJ6o
	uzRxkDgswUL5Nae494SBo3WYTbyWRGO+dgf6Vjg0sjd0gx7BrzSYrSAXP2v8+rOIBBvJ003vPq/
	bjyfssrTyyvQMzjVL+mfMxQPXKQG6sp5sfDy453lTU+0Zg4PuKqwkkVptQKJhjqGlmil0yghiLN
	gGc15P1LaRps+VCF0QXJWhWNcZe7QsJRotjeEkmX9IjdI/qqczYOpZSyT7Vjza8ctQuM0GpA7aX
	+AYCNpLK1auZkpMv7xO+SXruqaa0UBgTpvKv3zZGzA6Al2J77hScxSfiZ/PLlJ/9ZH3fts+OT+F
	DA0iec29aUrYJ/3OquUO7P6CSDEtNqCqz4IMRNJZIgdN5tFz5wbhBZWo8bNzl5Fxe+SN4hq4Xyj
	UndMtwmnrlEMAmBo7VljVPeyte7R7++niuiljyKN0WVrrUIqVvBxkdtK/9ioQtNxOGaSKE
X-Received: by 2002:a17:902:ebd2:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c410ae3ec1mr11770185ad.1.1781229688150;
        Thu, 11 Jun 2026 19:01:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm2657525ad.14.2026.06.11.19.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 19:01:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: meson: Use dev_err_probe() for device reset failures
Date: Fri, 12 Jun 2026 09:01:12 +0700
Message-ID: <20260612020113.9557-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_190129_426309_56E9C2D3 
X-CRM114-Status: UNSURE (   9.83  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

device_reset() may return -EPROBE_DEFER. Switch to dev_err_probe() so
probe failures are reported consistently and deferred probing is handled
properly.
This matches the existing pattern used in aiu_probe().
No functional change intended.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/meson/g12a-toacodec.c | 2 +-
 sound/soc/meson/g12a-tohdmitx.c | 2 +-
 sound/soc/meson/t9015.c         | 6 ++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index a95375b53f0a..21941ee552c5 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -312,7 +312,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index d541ca4acfaf..967109ca2b57 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -251,7 +251,7 @@ static int g12a_tohdmitx_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index da1a93946d67..f0b55aee5241 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -265,10 +265,8 @@ static int t9015_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
 
 	ret = device_reset(dev);
-	if (ret) {
-		dev_err(dev, "reset failed\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
