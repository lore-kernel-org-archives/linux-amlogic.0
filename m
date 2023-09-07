Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655DDEE14D3
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Sep 2023 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nAWZzwnXwrtufesVgs8sqBtksYW+pPraQspeBAXUtrU=; b=PbfcNPXPyY32Z0
	Pc9BEPEHaLuXvBnrJfTW/8su2TzWPbXSHS4q1w5GAX1+fe/VnL3vQ/gk24X74CmjZq50EDDIUwRPm
	hTJ1xh2JBLBXV27Sh9O8pAyhDXPyzUAA6/gTjWmWZ1qvakJbe79p3lFYNJrFLq1nlRr7MtjcfLlse
	ramPokiVcC1c5Lkeelrodf4opP5FwsHm4hqA3/XZMNPOd2hOQ/DwEBloL2JDXdbsXdjRGaN0gxUc6
	tBc4rZDUXrFjzcn63tyyBWyA2pC8AFxvFXYoUtGqhIRIF9b17Q9wV6UElWu1asUEW78nMO6g3+U8W
	jjjMFg3DABu70lTheszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAwz-00BdhK-2C;
	Thu, 07 Sep 2023 09:05:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAww-00Bdgx-1C
	for linux-amlogic@lists.infradead.org;
	Thu, 07 Sep 2023 09:05:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-401bdff4cb4so7898475e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 07 Sep 2023 02:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694077516; x=1694682316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJVDYEmcYMvyDAvrM+W+a0XTM8UX7gM4MKMeEwWok1U=;
        b=Tbu6rizPNxOKkP78VLc5gTkKcGvX+wcgQA32suu7XB+AH/Sh7a7C7WGOs9nbmhStjl
         7jwRdD6hBEmW4rmlbbOeXUhjsSi5MipXP0LlWjtDL5HLCTc8ZYzmbrI4Wbph0jRI3xGI
         QYn890EN96lSV7xZnI1MvcclIVsU/gqevTKkJ5HJbaM5jy9atd4ZSQqrHdYJFh1OqjYh
         Tu0GLMQidbt0xyyfm4Ven9u2loT4z1gYIfqOBU+EWSVt6DpdJ6nCyOHBKZPnfh06vhNS
         TWjEbYvyW1d29Ee/Qwxw+9gaZ6SkwUhvHB7ezyyg6oS/Esps1p+rVHRVClLBcsHzgr6a
         3Vdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694077516; x=1694682316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJVDYEmcYMvyDAvrM+W+a0XTM8UX7gM4MKMeEwWok1U=;
        b=AeI+8LOivw9SJLJhhEZ37IfOy7GSlG2Yni7kK+xrFqkgp1Rgbb1exAk7dPdBEjSlw7
         fmKjFm/nHB4gc1qu9uNqdFsiH9/hdGtOm5l2MAVdShiViQfnkisahsXB6I50kp8pm1ET
         oNjK8pBvx6IT4TwO886dmKQ3nDqeyI3v1fPSylvNhS/S/JSEvpqJfSLKsG1LlUyjTOZZ
         iklIYQFzG0txErup8regoUfQoXoDSqQPCLcCNiuqaT3845Acl/+WxIPTzXbiu5Tl2dgt
         Ry/VvDMCviuf66Z9eXGc/okKt3NygAY8/TinKBL2VCTXMPKqe5XZtVTVFL2WGpM3xAOW
         Mrjw==
X-Gm-Message-State: AOJu0YxVP7rAhQf0rGW88Re4FnjeyBV57NkjxgmuUVJ76cQD3InfovSQ
	znHDo+rVSsNhsrg0DKBowoiBSQ==
X-Google-Smtp-Source: AGHT+IEOvCH7hNTHOrZSew7AYc5GcTyZgtrMkRHjYNSp10f3yfgk8FqXZw9ThISAuSrWLWwP/dk53Q==
X-Received: by 2002:a05:600c:2986:b0:401:73b2:f039 with SMTP id r6-20020a05600c298600b0040173b2f039mr4140033wmd.7.1694077516289;
        Thu, 07 Sep 2023 02:05:16 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5be9:5575:c6f4:d478])
        by smtp.googlemail.com with ESMTPSA id r5-20020adfe685000000b003143867d2ebsm22767439wrm.63.2023.09.07.02.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:05:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] ASoC: meson: spdifin: start hw on dai probe
Date: Thu,  7 Sep 2023 11:05:04 +0200
Message-Id: <20230907090504.12700-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_020518_628919_EEEDAAA2 
X-CRM114-Status: GOOD (  10.91  )
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

For spdif input to report the locked rate correctly, even when no capture
is running, the HW and reference clock must be started as soon as
the dai is probed.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-spdifin.c | 49 ++++++++++++-----------------------
 1 file changed, 17 insertions(+), 32 deletions(-)

diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index d86880169075..bc2f2849ecfb 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -112,34 +112,6 @@ static int axg_spdifin_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int axg_spdifin_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	struct axg_spdifin *priv = snd_soc_dai_get_drvdata(dai);
-	int ret;
-
-	ret = clk_prepare_enable(priv->refclk);
-	if (ret) {
-		dev_err(dai->dev,
-			"failed to enable spdifin reference clock\n");
-		return ret;
-	}
-
-	regmap_update_bits(priv->map, SPDIFIN_CTRL0, SPDIFIN_CTRL0_EN,
-			   SPDIFIN_CTRL0_EN);
-
-	return 0;
-}
-
-static void axg_spdifin_shutdown(struct snd_pcm_substream *substream,
-				 struct snd_soc_dai *dai)
-{
-	struct axg_spdifin *priv = snd_soc_dai_get_drvdata(dai);
-
-	regmap_update_bits(priv->map, SPDIFIN_CTRL0, SPDIFIN_CTRL0_EN, 0);
-	clk_disable_unprepare(priv->refclk);
-}
-
 static void axg_spdifin_write_mode_param(struct regmap *map, int mode,
 					 unsigned int val,
 					 unsigned int num_per_reg,
@@ -251,17 +223,32 @@ static int axg_spdifin_dai_probe(struct snd_soc_dai *dai)
 	ret = axg_spdifin_sample_mode_config(dai, priv);
 	if (ret) {
 		dev_err(dai->dev, "mode configuration failed\n");
-		clk_disable_unprepare(priv->pclk);
-		return ret;
+		goto pclk_err;
 	}
 
+	ret = clk_prepare_enable(priv->refclk);
+	if (ret) {
+		dev_err(dai->dev,
+			"failed to enable spdifin reference clock\n");
+		goto pclk_err;
+	}
+
+	regmap_update_bits(priv->map, SPDIFIN_CTRL0, SPDIFIN_CTRL0_EN,
+			   SPDIFIN_CTRL0_EN);
+
 	return 0;
+
+pclk_err:
+	clk_disable_unprepare(priv->pclk);
+	return ret;
 }
 
 static int axg_spdifin_dai_remove(struct snd_soc_dai *dai)
 {
 	struct axg_spdifin *priv = snd_soc_dai_get_drvdata(dai);
 
+	regmap_update_bits(priv->map, SPDIFIN_CTRL0, SPDIFIN_CTRL0_EN, 0);
+	clk_disable_unprepare(priv->refclk);
 	clk_disable_unprepare(priv->pclk);
 	return 0;
 }
@@ -270,8 +257,6 @@ static const struct snd_soc_dai_ops axg_spdifin_ops = {
 	.probe		= axg_spdifin_dai_probe,
 	.remove		= axg_spdifin_dai_remove,
 	.prepare	= axg_spdifin_prepare,
-	.startup	= axg_spdifin_startup,
-	.shutdown	= axg_spdifin_shutdown,
 };
 
 static int axg_spdifin_iec958_info(struct snd_kcontrol *kcontrol,
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
