Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1FDC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Nov 2021 09:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zGC6zUStNa5lHc6/yNWuXNnB9NpA5X+fxtcgi1dCb+g=; b=eNcsRKT35tlIYx
	AgkkhNORI3z1LCOomakTik0/LQQEPVreIqYoyAqQ4G5PTBl5SAPpOzL9j/H1sC6zeVcKe3T8QeJP2
	EbqsCBPs6jhbejwqdUiEnIsCxjDQ/N+Efbk/cUuzpfz3/nsv/8jb+Fmwa2q4tpTVU/9tOEf3zLKWF
	XLuESasz2eiuW3JN8lZV9UJrrzPboXkh3WynfUfNtq+rMCnEl2uAD0LGEm7hpfGuWt+T0k22nIsx0
	gY34pR+IsVENV0WMthVET9leza74HsE6fardLEvrtbvkmmnMCPnADPqrr6yxcxsy1jN4+Vs5NjjkN
	/cbN2p24c3rYd8E6nujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrzZJ-004MfT-MY; Tue, 30 Nov 2021 09:36:57 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrzZ4-004Map-CL
 for linux-amlogic@lists.infradead.org; Tue, 30 Nov 2021 09:36:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id d9so22098789wrw.4
 for <linux-amlogic@lists.infradead.org>; Tue, 30 Nov 2021 01:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=47M4CeI2s3Mt/JfEFWeyA3Sfx5BoCCk69AD+rdY2VPI=;
 b=2IdOOZmiuEmP+sCasWKkQ/NpqMWXyK7+bCohfgalZnWReMCVd1AzKWhiHcF2+5LG9L
 lJWug5XIMrgXLE0wcwr0hv8nQax7mj5XnfoV4doI+Tf2gWhafDiR/2PglGsrBWBlV1db
 WOqS16w/hRf9Rv/3JU/QwtFJ09QoTJv3xuBdV38qLgp/V7r6F6riLGeKCpuvD7bW9LRo
 2cNf7+iZTV9ULn5YFRtGOWpHH4x0djUFxjWR8HxD/ooeE2sIBvK+W3KILSqLai7rqqVU
 TNjInRa3VeVCytClBTdkpCQCMYs1K97RjFCRLY4NThWrt3lUyfM09VcLHzLRvxeZPnjN
 3MQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=47M4CeI2s3Mt/JfEFWeyA3Sfx5BoCCk69AD+rdY2VPI=;
 b=gljmmG+ce9PBAglZtcQRiNrTQQ8w/7WaIKVRIvY3fCNtQ5/zW8LljuVyxHaWKcbFMC
 qHwnuKObZXI4wgpoB53h1j6YxGqDCMF3ccnGlfPCyPFTxRf0Ivq9LiiLPJeg6UB5Uk5s
 sbQtGpn+hzmrLhSQCU3O3/TSRbM0g3ZKy9ahNWffI/y1c24wnj+4CA5AX4JNKSRt/hfO
 OvB1rycuc01kdlTS0xZxjjmq8jKZBBeG9YKovB6u89GUcNTFYPCQhp+ZLhxJVcTU5GR1
 IhG85t3UnI9G6JnPKtCZtVqr71+p3PJKxtSbZ+WRUj0pJwApl3EkOhBnU+HYCFBtxAHV
 woiw==
X-Gm-Message-State: AOAM530eC0oX7M3FfB60eWM2LYo7OSBVk9DUWsTUY6xATmZ7X+mnJenp
 QchyWFuhEE0mKHkRuPZW9aqw+A==
X-Google-Smtp-Source: ABdhPJx5ChsKLLJF6h5b0vhOCAm/Hh/QEY02pbVu8kVw5p0mDlM16fey223AnlVsRDKdt8O+MChntQ==
X-Received: by 2002:adf:fb82:: with SMTP id a2mr38970692wrr.168.1638264999783; 
 Tue, 30 Nov 2021 01:36:39 -0800 (PST)
Received: from jackdaw.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id t11sm16255000wrz.97.2021.11.30.01.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:36:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH] ASoC: meson: use dev_err_probe
Date: Tue, 30 Nov 2021 10:36:17 +0100
Message-Id: <20211130093617.103147-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_013642_523795_9C55162D 
X-CRM114-Status: GOOD (  13.04  )
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

Use dev_err_probe() helper function to handle probe deferral.
It removes the open coded test for -EPROBE_DEFER but more importantly, it
sets the deferral reason in debugfs which is great for debugging.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c               | 17 +++++++----------
 sound/soc/meson/axg-fifo.c          |  9 +++------
 sound/soc/meson/axg-pdm.c           |  9 +++------
 sound/soc/meson/axg-spdifin.c       |  6 ++----
 sound/soc/meson/axg-spdifout.c      |  6 ++----
 sound/soc/meson/axg-tdm-formatter.c | 18 ++++++------------
 sound/soc/meson/axg-tdm-interface.c |  9 +++------
 sound/soc/meson/meson-card-utils.c  |  4 ++--
 sound/soc/meson/t9015.c             |  8 ++++----
 9 files changed, 32 insertions(+), 54 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index ba15d5762b0b..37036adf14ce 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -219,31 +219,29 @@ static int aiu_clk_get(struct device *dev)
 
 	aiu->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(aiu->pclk)) {
-		if (PTR_ERR(aiu->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the aiu pclk\n");
+		dev_err_probe(dev, PTR_ERR(aiu->pclk),
+			      "Can't get the aiu pclk\n");
 		return PTR_ERR(aiu->pclk);
 	}
 
 	aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
 	if (IS_ERR(aiu->spdif_mclk)) {
-		if (PTR_ERR(aiu->spdif_mclk) != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the aiu spdif master clock\n");
+		dev_err_probe(dev, PTR_ERR(aiu->spdif_mclk),
+			      "Can't get the aiu spdif master clock\n");
 		return PTR_ERR(aiu->spdif_mclk);
 	}
 
 	ret = aiu_clk_bulk_get(dev, aiu_i2s_ids, ARRAY_SIZE(aiu_i2s_ids),
 			       &aiu->i2s);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the i2s clocks\n");
+		dev_err_probe(dev, ret, "Can't get the i2s clocks\n");
 		return ret;
 	}
 
 	ret = aiu_clk_bulk_get(dev, aiu_spdif_ids, ARRAY_SIZE(aiu_spdif_ids),
 			       &aiu->spdif);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the spdif clocks\n");
+		dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
 		return ret;
 	}
 
@@ -282,8 +280,7 @@ static int aiu_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to reset device\n");
+		dev_err_probe(dev, ret, "Failed to reset device\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index b9af2d513e09..8d3184aeba60 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -352,17 +352,14 @@ int axg_fifo_probe(struct platform_device *pdev)
 
 	fifo->pclk = devm_clk_get(dev, NULL);
 	if (IS_ERR(fifo->pclk)) {
-		if (PTR_ERR(fifo->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %ld\n",
-				PTR_ERR(fifo->pclk));
+		dev_err_probe(dev, PTR_ERR(fifo->pclk), "failed to get pclk\n");
 		return PTR_ERR(fifo->pclk);
 	}
 
 	fifo->arb = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(fifo->arb)) {
-		if (PTR_ERR(fifo->arb) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get arb reset: %ld\n",
-				PTR_ERR(fifo->arb));
+		dev_err_probe(dev, PTR_ERR(fifo->arb),
+			      "failed to get arb reset\n");
 		return PTR_ERR(fifo->arb);
 	}
 
diff --git a/sound/soc/meson/axg-pdm.c b/sound/soc/meson/axg-pdm.c
index bfd37d49a73e..9537fbcf56e0 100644
--- a/sound/soc/meson/axg-pdm.c
+++ b/sound/soc/meson/axg-pdm.c
@@ -613,24 +613,21 @@ static int axg_pdm_probe(struct platform_device *pdev)
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
 		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk\n");
 		return ret;
 	}
 
 	priv->dclk = devm_clk_get(dev, "dclk");
 	if (IS_ERR(priv->dclk)) {
 		ret = PTR_ERR(priv->dclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get dclk\n");
 		return ret;
 	}
 
 	priv->sysclk = devm_clk_get(dev, "sysclk");
 	if (IS_ERR(priv->sysclk)) {
 		ret = PTR_ERR(priv->sysclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get dclk\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index d0d09f945b48..e10bc9352667 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -481,16 +481,14 @@ static int axg_spdifin_probe(struct platform_device *pdev)
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
 		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk\n");
 		return ret;
 	}
 
 	priv->refclk = devm_clk_get(dev, "refclk");
 	if (IS_ERR(priv->refclk)) {
 		ret = PTR_ERR(priv->refclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get mclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get mclk\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-spdifout.c b/sound/soc/meson/axg-spdifout.c
index e769a5ee6e27..179654d76c8f 100644
--- a/sound/soc/meson/axg-spdifout.c
+++ b/sound/soc/meson/axg-spdifout.c
@@ -424,16 +424,14 @@ static int axg_spdifout_probe(struct platform_device *pdev)
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
 		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk\n");
 		return ret;
 	}
 
 	priv->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(priv->mclk)) {
 		ret = PTR_ERR(priv->mclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get mclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get mclk\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index cab7fa2851aa..b8bbeda87a72 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -284,8 +284,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(formatter->pclk)) {
 		ret = PTR_ERR(formatter->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk\n");
 		return ret;
 	}
 
@@ -293,8 +292,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->sclk = devm_clk_get(dev, "sclk");
 	if (IS_ERR(formatter->sclk)) {
 		ret = PTR_ERR(formatter->sclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get sclk\n");
 		return ret;
 	}
 
@@ -302,8 +300,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->lrclk = devm_clk_get(dev, "lrclk");
 	if (IS_ERR(formatter->lrclk)) {
 		ret = PTR_ERR(formatter->lrclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get lrclk\n");
 		return ret;
 	}
 
@@ -311,8 +308,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->sclk_sel = devm_clk_get(dev, "sclk_sel");
 	if (IS_ERR(formatter->sclk_sel)) {
 		ret = PTR_ERR(formatter->sclk_sel);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk_sel: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get sclk_sel\n");
 		return ret;
 	}
 
@@ -320,8 +316,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->lrclk_sel = devm_clk_get(dev, "lrclk_sel");
 	if (IS_ERR(formatter->lrclk_sel)) {
 		ret = PTR_ERR(formatter->lrclk_sel);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk_sel: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get lrclk_sel\n");
 		return ret;
 	}
 
@@ -329,8 +324,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(formatter->reset)) {
 		ret = PTR_ERR(formatter->reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get reset: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get reset\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index db077773af7a..8f8b126de158 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -535,8 +535,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	iface->sclk = devm_clk_get(dev, "sclk");
 	if (IS_ERR(iface->sclk)) {
 		ret = PTR_ERR(iface->sclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get sclk\n");
 		return ret;
 	}
 
@@ -544,8 +543,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	iface->lrclk = devm_clk_get(dev, "lrclk");
 	if (IS_ERR(iface->lrclk)) {
 		ret = PTR_ERR(iface->lrclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get lrclk\n");
 		return ret;
 	}
 
@@ -561,8 +559,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 		if (ret == -ENOENT) {
 			iface->mclk = NULL;
 		} else {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "failed to get mclk: %d\n", ret);
+			dev_err_probe(dev, ret, "failed to get mclk\n");
 			return ret;
 		}
 	}
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 29b0174f4b5c..cc6e16e31f9c 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -86,8 +86,8 @@ int meson_card_parse_dai(struct snd_soc_card *card,
 	ret = of_parse_phandle_with_args(node, "sound-dai",
 					 "#sound-dai-cells", 0, &args);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(card->dev, "can't parse dai %d\n", ret);
+		dev_err_probe(card->dev, ret,
+			      "can't parse sound-dai at %pOFn\n", node);
 		return ret;
 	}
 	*dai_of_node = args.np;
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 4c1349dd1e06..7a0a807f494c 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -259,15 +259,15 @@ static int t9015_probe(struct platform_device *pdev)
 
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
-		if (PTR_ERR(priv->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get core clock\n");
+		dev_err_probe(dev, PTR_ERR(priv->pclk),
+			      "failed to get core clock\n");
 		return PTR_ERR(priv->pclk);
 	}
 
 	priv->avdd = devm_regulator_get(dev, "AVDD");
 	if (IS_ERR(priv->avdd)) {
-		if (PTR_ERR(priv->avdd) != -EPROBE_DEFER)
-			dev_err(dev, "failed to AVDD\n");
+		dev_err_probe(dev, PTR_ERR(priv->avdd),
+			      "failed to get AVDD\n");
 		return PTR_ERR(priv->avdd);
 	}
 
-- 
2.34.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
