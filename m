Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF9CCD98D3
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 21:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mM4ElZM5hyBRNjsD8KKlhte3hUuqqk8l5/soiyGrF78=; b=lw4pZ4tBBdXr3Z
	I4XaI2lk3Vlsx/XkRASlLdje98TLRfXpM1ZiCart9nwnCKitZPzQFVvZsOBRp98vphpfmdL7fHMJT
	Qodqb77yNgd9Q1FNUMmKPMtqG4AS5hZQd1cDazIND9C52ZN0YKTUpi4AHM6gyFFYitb1qVIO52GSB
	WiEczRY5e1HOSpdP/f2JAFwkpDFNfW0Rb3Rie5CKbJB5Bl5WaeKCGUSQa3vnPGtNCS9dPwJTASF3H
	nCV4/ZE4undpC5Dk/MMjlpLRirKx71SlSVhQ8hzVI5ivEArXpekGpWJJqwhmOv1xDdducxm9rRZDT
	wYKt3bbQ+2sNmOkAARhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUe-00000008NU1-0BFr;
	Wed, 10 Jun 2026 21:29:48 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUZ-00000008NQJ-3fwr
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jun 2026 21:29:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490b7866869so79025025e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2026 14:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126982; x=1781731782; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdSvP4OsE7eHoTjId0UaG2CyxblqVBvzSM5Fo0qLTpA=;
        b=WEJRbpBXcuu8ikS9w4KCtU4kDlSRpZtzIjO+oHXVDIuSZyZbj/spauZGgUOyrdCkJP
         crZRcX1c2YlzwXl0UF4TuroFmugP4IbYGvTlwET9baijelkNKkjKi7aex6gbJXX0ZJ6H
         Cqf7K5lhfUS9cHsE+54oIMoVcVpDATsrzNknn5iGtYwL8qj3HPFmxtNB5uXuLefMKc/L
         Cc96vZQPG/E1cT8FyZ+6KaBC1Qu2aQod3/aHNkmXamrdQqgF7jgsthvCumgXazkXaqMV
         z48ZRl0bmFvSMDM45pbNT9qgPnfYusL26lEluCbKWvBqHJCiDtsxnmsXhNGSDV+OUn7A
         OauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126982; x=1781731782;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HdSvP4OsE7eHoTjId0UaG2CyxblqVBvzSM5Fo0qLTpA=;
        b=Shq6Oywc3MA4nWmCGGTkSa5TQN6Tbixm2hm+ZIEaPeRAH03BDNMqLp2bKCfbW7KKvD
         Uwjm8T+Lq3qni6BpdSvnG0cSRk1xSHyJx11wvVvfuokfcWS9XZZ4YklNMvkLDvx9Hl4L
         OEApA/hgtbAJpKDq48g+D5ANBtopRouyfsNTDUVb/IH58fsLbuvgbLiAEAwMVoamTA9C
         OU6MldSvUtV+0Od98g7nSkixBckSSHFA7E1PXaaKcWyoDd5z5+kt7FUKgVo/ayrtPPN8
         MW8EtZk2f3Hj2q9faC6/abs1vkQnl3tMMe6ekdytRq72Ti496rEVHPputoK9CnlaPnYK
         uVfg==
X-Forwarded-Encrypted: i=1; AFNElJ9YzJS0AZkHEWb35MqGuVTm++ZrLLaKG2OhwFEvfjKqttW/QZHQNDPos2WUeofczbGdW0PjZf0iknkBDvyd@lists.infradead.org
X-Gm-Message-State: AOJu0YzFMNak69mAGi1FqTk8H0oz+UfDe5qFGMKTbEx+kSPv1p0VVHcY
	+Pb25XFCh2ceYKpeiuVw0kE1OCTaHDvCz+3rIf59PAOM4bv3j3ll1k7hyIWggV3V7OQ=
X-Gm-Gg: Acq92OFDihY97/2ACfFD1RsZUdKcTLSYGC5aUkxBNVRWlT9u5CVQPmmRQTzOkrxXLRD
	N07ahgu9HTHXrMPNCNwq/T+3hdV8L7GzEBZQu5VdOKytmdg4aaEa9VXhW7EzT7eon1eaX+Fxm+n
	kD5BuVQqeqybS6kAGgL0Xmia48eDZRvBvgbF/3z860n06SYzUphGVXMYQIvYCwOc+vDFbbzKPwE
	uiCU47+XVARdgjU62GdNwmsvobsffGTZs3qssE4/T/3hnm00ADBEtQ9f7RTko3nz61mAcsOuQQK
	IZ0kvSY8WBR6k71vVZA34GOwn7jimDSYMKSLeOnhfEDbpZ85QRLGkHlvrtcXwUxH7kzdobj/uyn
	aT7wz7StbZdJKg95MhwqWo7JV9wHY0PM+MSB9bD+xHOTbfTvEwAGktyy2/b2AyjWTm12CvNyjOf
	VRRmckc2PPw+CBIMXgiSyzt2C51Q+oUuwcuzp8hkm4nQ==
X-Received: by 2002:a05:600d:6446:10b0:490:bccf:2bd6 with SMTP id 5b1f17b1804b1-490e2e29494mr5787235e9.15.1781126982292;
        Wed, 10 Jun 2026 14:29:42 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:42 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 10 Jun 2026 23:29:28 +0200
Subject: [PATCH v2 4/4] ASoC: meson: aiu: use aiu-formatter-i2s to format
 I2S output data
MIME-Version: 1.0
Message-Id: <20260610-reshape-aiu-as-axg-v2-4-cac3663a8b51@baylibre.com>
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7991; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=/h2Td7mUr6sv6XUhWr9Xcq7WvMFZwzP575T2baPy/Ds=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x2COF5w1rWmPDvsyMu7KsxGbZuhj/f+yfwLelrq7
 h1c9EW/o5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABNpiWZkOLL1F/sOzeA12y7O
 z9z7PX6yvM9SM9bah3v5/Trsz2qfKGP4yfj1WP1cjlLvYotjP4/t5ZmXwx95fHka1zPrNy1bWA4
 ZMAMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_142944_035365_0E21FFDB 
X-CRM114-Status: GOOD (  22.40  )
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

Create a new DAPM widget for "I2S formatter" and place it on the path
between FIFO and output DAI interface. Remove I2S output formatting code
from aiu-encoder-i2s since it's now implemented from aiu-formatter-i2s.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 78 ++++++++++-----------------------------
 sound/soc/meson/aiu.c             | 32 ++++++++++++++--
 sound/soc/meson/aiu.h             |  1 +
 3 files changed, 48 insertions(+), 63 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index f50b03824ad280afabb31eecc20ccb855defa11e..83b579e98f1c75ce03fea1c6ff4e99b2fedebe0c 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -13,13 +13,8 @@
 #include "gx-formatter.h"
 #include "gx-interface.h"
 
-#define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
-#define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
-#define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
 #define AIU_I2S_SOURCE_DESC_MODE_SPLIT	BIT(11)
-#define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
-#define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
 #define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
 #define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
 #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
@@ -37,49 +32,6 @@ static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
 				      enable ? AIU_CLK_CTRL_I2S_DIV_EN : 0);
 }
 
-static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
-				      struct snd_pcm_hw_params *params)
-{
-	/* Always operate in split (classic interleaved) mode */
-	unsigned int desc = AIU_I2S_SOURCE_DESC_MODE_SPLIT;
-
-	/* Reset required to update the pipeline */
-	snd_soc_component_write(component, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
-	snd_soc_component_read(component, AIU_I2S_SYNC);
-
-	switch (params_physical_width(params)) {
-	case 16: /* Nothing to do */
-		break;
-
-	case 32:
-		desc |= (AIU_I2S_SOURCE_DESC_MODE_24BIT |
-			 AIU_I2S_SOURCE_DESC_MODE_32BIT);
-		break;
-
-	default:
-		return -EINVAL;
-	}
-
-	switch (params_channels(params)) {
-	case 2: /* Nothing to do */
-		break;
-	case 8:
-		desc |= AIU_I2S_SOURCE_DESC_MODE_8CH;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	snd_soc_component_update_bits(component, AIU_I2S_SOURCE_DESC,
-				      AIU_I2S_SOURCE_DESC_MODE_8CH |
-				      AIU_I2S_SOURCE_DESC_MODE_24BIT |
-				      AIU_I2S_SOURCE_DESC_MODE_32BIT |
-				      AIU_I2S_SOURCE_DESC_MODE_SPLIT,
-				      desc);
-
-	return 0;
-}
-
 static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
 					  struct snd_pcm_hw_params *params,
 					  unsigned int bs)
@@ -173,11 +125,6 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 	if ((fs % 64) || (fs == 0))
 		return -EINVAL;
 
-	/* Send data MSB first */
-	snd_soc_component_update_bits(component, AIU_I2S_DAC_CFG,
-				      AIU_I2S_DAC_CFG_MSB_FIRST,
-				      AIU_I2S_DAC_CFG_MSB_FIRST);
-
 	/* Set bclk to lrlck ratio */
 	snd_soc_component_update_bits(component, AIU_CODEC_DAC_LRCLK_CTRL,
 				      AIU_CODEC_DAC_LRCLK_CTRL_DIV,
@@ -223,12 +170,6 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	ret = aiu_encoder_i2s_setup_desc(component, params);
-	if (ret) {
-		dev_err(dai->dev, "setting i2s desc failed: %d\n", ret);
-		return ret;
-	}
-
 	ret = aiu_encoder_i2s_set_clocks(component, params);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
@@ -411,6 +352,25 @@ static int aiu_encoder_i2s_startup(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	/*
+	 * We're always operating in split mode for the playback stream.
+	 *
+	 * This setting arguably belong to the 'aiu-formatter', but it's kept
+	 * here for backward compatibility reason. At reset the I2S encoder
+	 * operates in normal mode which would only support 8ch, but by default
+	 * only 2ch are enabled. If a playback stream is started without
+	 * changing to split mode, then the I2S encoder doesn't consume audio
+	 * samples and the playback fails.
+	 * Moving this to 'aiu-formatter' would cause the split mode to be set
+	 * only when the formatter is enabled, which doesn't happen at boot as
+	 * the default value for "HDMI CTRL SRC" is "DISABLED".
+	 */
+	ret = snd_soc_component_update_bits(dai->component, AIU_I2S_SOURCE_DESC,
+					    AIU_I2S_SOURCE_DESC_MODE_SPLIT,
+					    AIU_I2S_SOURCE_DESC_MODE_SPLIT);
+	if (ret < 0)
+		dev_err(dai->dev, "failed to update AIU_I2S_SOURCE_DESC: %d", ret);
+
 	return 0;
 }
 
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index f2890111c1d2cfa2213bf01849957a796744b9ae..64ace4d25d92cbe137066359a839e1b11bf140f8 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -29,13 +29,22 @@ static SOC_ENUM_SINGLE_DECL(aiu_spdif_encode_sel_enum, AIU_I2S_MISC,
 static const struct snd_kcontrol_new aiu_spdif_encode_mux =
 	SOC_DAPM_ENUM("SPDIF Buffer Src", aiu_spdif_encode_sel_enum);
 
-static const struct snd_soc_dapm_widget aiu_cpu_dapm_widgets[] = {
-	SND_SOC_DAPM_MUX("SPDIF SRC SEL", SND_SOC_NOPM, 0, 0,
-			 &aiu_spdif_encode_mux),
+#define AIU_WIDGET_SPDIF_SRC_SEL	0
+#define AIU_WIDGET_I2S_FORMATTER	1
+
+static struct snd_soc_dapm_widget aiu_cpu_dapm_widgets[] = {
+	[AIU_WIDGET_SPDIF_SRC_SEL] =
+		SND_SOC_DAPM_MUX("SPDIF SRC SEL", SND_SOC_NOPM, 0, 0,
+				 &aiu_spdif_encode_mux),
+	[AIU_WIDGET_I2S_FORMATTER] =
+		SND_SOC_DAPM_PGA_E("I2S Formatter", SND_SOC_NOPM, 0, 0, NULL, 0,
+				   gx_formatter_event,
+				   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
 };
 
 static const struct snd_soc_dapm_route aiu_cpu_dapm_routes[] = {
-	{ "I2S Encoder Playback", NULL, "I2S FIFO Playback" },
+	{ "I2S Formatter", NULL, "I2S FIFO Playback" },
+	{ "I2S Encoder Playback", NULL, "I2S Formatter" },
 	{ "SPDIF SRC SEL", "SPDIF", "SPDIF FIFO Playback" },
 	{ "SPDIF SRC SEL", "I2S", "I2S FIFO Playback" },
 	{ "SPDIF Encoder Playback", NULL, "SPDIF SRC SEL" },
@@ -172,6 +181,11 @@ static const struct regmap_config aiu_regmap_cfg = {
 	.max_register	= 0x2ac,
 };
 
+const struct gx_formatter_driver aiu_formatter_i2s_drv = {
+	.regmap_cfg	= &aiu_regmap_cfg,
+	.ops		= &aiu_formatter_i2s_ops,
+};
+
 static int aiu_clk_bulk_get(struct device *dev,
 			    const char * const *ids,
 			    unsigned int num,
@@ -282,6 +296,14 @@ static int aiu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Allocate the aiu-formatter into its widget */
+	ret = gx_formatter_create(dev, &aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER],
+				  &aiu_formatter_i2s_drv, map);
+	if (ret) {
+		dev_err(dev, "Failed to allocate aiu formatter\n");
+		goto err;
+	}
+
 	/* Register the cpu component of the aiu */
 	ret = snd_soc_register_component(dev, &aiu_cpu_component,
 					 aiu_cpu_dai_drv,
@@ -310,12 +332,14 @@ static int aiu_probe(struct platform_device *pdev)
 
 	return 0;
 err:
+	gx_formatter_free(&aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER]);
 	snd_soc_unregister_component(dev);
 	return ret;
 }
 
 static void aiu_remove(struct platform_device *pdev)
 {
+	gx_formatter_free(&aiu_cpu_dapm_widgets[AIU_WIDGET_I2S_FORMATTER]);
 	snd_soc_unregister_component(&pdev->dev);
 }
 
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 68310de0bdf7a97d8de2ff306c159248ee9b0ede..7d0b98c1f351b3c526ca06c43a4c04ee5f4b6dfa 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -61,6 +61,7 @@ extern const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops;
 extern const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops;
 extern const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops;
 extern const struct snd_soc_dai_ops aiu_encoder_spdif_dai_ops;
+extern const struct gx_formatter_ops aiu_formatter_i2s_ops;
 
 #define AIU_IEC958_BPF			0x000
 #define AIU_958_MISC			0x010

-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
