Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB6BC388F2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 04:38:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10BB207BB
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 04:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mK7re7sS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdsE7ywR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D10BB207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=my89ZhFI7EF2xZtA7AknIkIptJgF4yUlQCKaIFXIWpU=; b=mK7re7sSRVMM9RamdW4bVzEiVj
	PuDuT301K2weBZHLVOA1f/XHu0hHgaT1pNjGgFxYzCwviYFUD5MpeQTaqzQq+p/gxwc1q29QS7of0
	MP3VY6EAjYRJOde2+w76Gy72FpOmHi8vjLkbmpkrST5z30cO9cFLF06UtQ4Q9ZW9MkBQOgesYaqh2
	g3ktqT0JLLS1nokHhqezac5nRd1eV65zZk6aLtJP8SQiGaMOg5Z6spgbMUdZZm76EIV5D3H5DM2kM
	uLMtXX/nnqIvSmHdBcvHmvgn4sAstyFLVAxx0jP+48swU8TnF0XyLelD2kiSVhroA0lDmIegEVwk/
	Om2vevOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZo5M-0004tq-9J; Tue, 03 Nov 2020 04:38:20 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZo5I-0004sz-9F; Tue, 03 Nov 2020 04:38:17 +0000
Received: by mail-pf1-x443.google.com with SMTP id e7so13077101pfn.12;
 Mon, 02 Nov 2020 20:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9GceZK4ciAeCqop9b1Rb6X2DCDZMt62Lqok/xRlnDwI=;
 b=GdsE7ywRxLmTLQddQqHjTdfGGLdIwdHyLWTICxjsEYocs7mHhh8Nc/hUZiYRQkmHXw
 X7ZsoZZA+rJ32jjjMs9l+1xaVIAra2fqlXnBJQl55hZ/ZF6jB0nwx6pPakPjO/xGAq/K
 Ndeco6Cb+oRWeuH1uA5Xb1fBb4zyPCXklF8E2qmX0rS669/GRkFiEPrKkuy5mANBmXn1
 frFbwFhxWPew0eKSZlYWEsHwzTJU8ex3zcMKicVF80lKn//N5VhMsJ/hco5jtEvva17y
 OLtJogPDZLi4qfrsgDxSk5EZprt6ddLSJwum2g0lJ13ciqmEUjf6ptDz0/Z4DvfoaGs/
 FDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9GceZK4ciAeCqop9b1Rb6X2DCDZMt62Lqok/xRlnDwI=;
 b=IDjBxjW3ePyK5KUrVDMY0pOVMLbvQJMtDrPYKFMjcIufcP3smoqww+JMaXor7bGhQP
 5SHwR2Ny/eOFCgP7i1+ityUpkWO3+cmCvbLz9rr0yWseChdBypi1OwhBXkrdop7/DxOO
 shjrZc/5R3erNpX2JZY2QY6PTq/bovfy78xpdOAxr6H16qMonB5SBiqC6jpNtuaXSl+A
 W+AsKvXvmDdwIsm2WnwjlG5QAovw6222P5e25yXFoLlipqqeXKTeiYUmsXOB0yRPj96a
 BJBcM8SY8MmUGS74yXFbbxvfby+VykrCFt3TWj3bmsl+sIYRpmCe/SQa/L6SPwtGnOXZ
 KxaQ==
X-Gm-Message-State: AOAM5336J5MsGB7WGCGOrsL4PYG8Wc/TGqkmVtqB6XkT3tiLgXh1dhf4
 R/qtKiaX9fnn3bExoZ5aAFI=
X-Google-Smtp-Source: ABdhPJy55kLAJIDI5ctckB372baVfeN1E0BOyGabuU8MWUzkNfifE3FSGziJWMGaNJyIkxWTVJFXCA==
X-Received: by 2002:a17:90a:318d:: with SMTP id
 j13mr1831845pjb.209.1604378292632; 
 Mon, 02 Nov 2020 20:38:12 -0800 (PST)
Received: from localhost.localdomain ([8.210.202.142])
 by smtp.gmail.com with ESMTPSA id v16sm13630948pgk.26.2020.11.02.20.38.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 20:38:12 -0800 (PST)
From: Yejune Deng <yejune.deng@gmail.com>
To: khilman@baylibre.com, narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, p.zabel@pengutronix.de,
 repk@triplefau.lt, yejune.deng@gmail.com, lorenzo.pieralisi@arm.com
Subject: [PATCH] phy: amlogic: Replace devm_reset_control_array_get()
Date: Tue,  3 Nov 2020 12:37:54 +0800
Message-Id: <1604378274-6860-1-git-send-email-yejune.deng@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_233816_353158_309D4C8C 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: linux-amlogic@lists.infradead.org, vkoul@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kishon@ti.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

devm_reset_control_array_get_exclusive() looks more readable

Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
---
 drivers/phy/amlogic/phy-meson-axg-pcie.c       | 2 +-
 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c | 2 +-
 drivers/soc/amlogic/meson-ee-pwrc.c            | 3 +--
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c        | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
index 377ed0d..3204f02 100644
--- a/drivers/phy/amlogic/phy-meson-axg-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -155,7 +155,7 @@ static int phy_axg_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->regmap))
 		return PTR_ERR(priv->regmap);
 
-	priv->reset = devm_reset_control_array_get(dev, false, false);
+	priv->reset = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(priv->reset))
 		return PTR_ERR(priv->reset);
 
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
index 08e3227..bab6345 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -418,7 +418,7 @@ static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk_ref;
 
-	priv->reset = devm_reset_control_array_get(dev, false, false);
+	priv->reset = devm_reset_control_array_get_exclusive(dev);
 	if (IS_ERR(priv->reset))
 		return PTR_ERR(priv->reset);
 
diff --git a/drivers/soc/amlogic/meson-ee-pwrc.c b/drivers/soc/amlogic/meson-ee-pwrc.c
index ed7d2fb..3a879a4 100644
--- a/drivers/soc/amlogic/meson-ee-pwrc.c
+++ b/drivers/soc/amlogic/meson-ee-pwrc.c
@@ -413,8 +413,7 @@ static int meson_ee_pwrc_init_domain(struct platform_device *pdev,
 			dev_warn(&pdev->dev, "Invalid resets count %d for domain %s\n",
 				 count, dom->desc.name);
 
-		dom->rstc = devm_reset_control_array_get(&pdev->dev, false,
-							 false);
+		dom->rstc = devm_reset_control_array_get_exclusive(&pdev->dev)
 		if (IS_ERR(dom->rstc))
 			return PTR_ERR(dom->rstc);
 	}
diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
index 8790627..b4615b2 100644
--- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
+++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
@@ -304,7 +304,7 @@ static int meson_gx_pwrc_vpu_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap_hhi);
 	}
 
-	rstc = devm_reset_control_array_get(&pdev->dev, false, false);
+	rstc = devm_reset_control_array_get_exclusive(&pdev->dev);
 	if (IS_ERR(rstc)) {
 		if (PTR_ERR(rstc) != -EPROBE_DEFER)
 			dev_err(&pdev->dev, "failed to get reset lines\n");
-- 
1.9.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
