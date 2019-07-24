Return-Path: <SRS0=ig9A=VV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC475C41517
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8469D22AEC
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DvqiUWpB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kumEAPUx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8469D22AEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ttGmqNfpf2goCmUc0MdoGwquq0JSQXYTp2DieYQouA=; b=DvqiUWpBha9nfS
	FESRNqtYDF46V1bewqDJOZXh1Lxk4B3qF1tIqpCCrDArpPrpF7aASLKTqV0Ap9dBF6nnfBneZi4CF
	IM+rCvRGk1WhuvBKnMMLpL9Y6Aca+rvl9KSv8qtHf/a6PxB2Z3qRj+J20qgb94QMB21O8FxUiFL+l
	TXYfI/7kywgV6H4a1HdaKO8X2oJoqsecHJ3xZbLrbmmy89m1uQYHT4dHEKMgHbwKeABE7G5bN3Vou
	4pun4rzr/7OPhm3yeSBoblicBmS/KD36mEpWwwkunqthbGFEZWiz12etNAYqjPhAOelI/n7QSuUU7
	JCmvepULow/2B9+vlj+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqK3v-0006yD-II; Wed, 24 Jul 2019 16:24:19 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqK3q-0006s5-IC
 for linux-amlogic@lists.infradead.org; Wed, 24 Jul 2019 16:24:16 +0000
Received: by mail-wr1-x444.google.com with SMTP id z1so47622550wru.13
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jul 2019 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYbwqma1m9jqmdyH3lyO6cWket2bF1VkY/YuX/cmnIM=;
 b=kumEAPUx7B49kM8BuP59c5fzHEqI89ld6/bXZ9wclNMrmminy+PGmddOmTANEISf/U
 mW0bJLHMrDbnth3oX9Og7HTFcbiDi73QRyYxCu5r3QHVKXc53nxgAOudarnTjjJs2fHe
 LnUt1GR8wHA/aaEGQb7Xvx28Jb352PPcZUBhKcnLBjo+BugP50E+I7aZg75y7y3YJyHS
 BzzvfZpaGurdnxhCp0AcFvLMZIBBI8ob8aIK4KJ/+FlZ8p8tKSovSjTzBcIJVDPlhLEj
 c/fx/W6do9q7Q9UCgrxOqIArBTbdLqubwtgGlXXROGKKX7WjiL64SsHP+XlVPkrML96X
 dLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYbwqma1m9jqmdyH3lyO6cWket2bF1VkY/YuX/cmnIM=;
 b=fUmvnUgrxwi1p3pd18qLs1ZBkYQE/WzegmNFt7Erhs8J+IfOyvdaQQEEVWtiCO1zpG
 aiJiFugB2vlMmDmhAZ2iSkvUYTQtrhDJdNe8a9QJ7G5WfRDutd4Mwi2zeSf6hHVStbLu
 w2YbxQJnOCSqH2DFfGpQ5bc8d5IelfpIIBZTY2fEFWSmDZLdUp44p/ufRl2dycxscIcU
 izC1h9uHxBePWvP1eE+qo9grEL1+Unqd/lfp72vEpo77bvCFTO6DJa9ShJcMDYyjRiX0
 niTX/a5Ns/vb/jnbj7VinQOGLR1rTzepP6wg91Uo97o0th3evIgs8TzUm86JmXHb7myx
 VkaA==
X-Gm-Message-State: APjAAAWjg9qtP7Bi2+9v8MUKe1kW70qUUfsF7G+fmcOMGqZuxyme+O6y
 L5hFIqYUMeKDCKcORaBLmnerdA==
X-Google-Smtp-Source: APXvYqx9Mc3Q8VY1dWRoHo7J46SnH4zpSFciHtF/nlFovtGxl1DJgfQUB5i7Xs03xKhQXhwPkPfqdw==
X-Received: by 2002:adf:edd1:: with SMTP id v17mr4837090wro.348.1563985452644; 
 Wed, 24 Jul 2019 09:24:12 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/6] ASoC: codec2codec: deal with params when necessary
Date: Wed, 24 Jul 2019 18:24:02 +0200
Message-Id: <20190724162405.6574-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_092414_612880_92E30265 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When there is an event on codec to codec dai_link, we only need to deal
with params if the event is SND_SOC_DAPM_PRE_PMU, when .hw_params() is
called. For the other events, it is useless.

Also, params does not need to be dynamically allocated as it does not
need to survive the event.

Last, dealing with the codec to codec params just before calling
.hw_params() callbacks give change to either party on the link to alter
params content in .startup(), which might be useful in some cases

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 81 ++++++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 30 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d20cd89513a4..aa6e47beaec3 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3764,25 +3764,12 @@ int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_new_controls);
 
-static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
-				  struct snd_kcontrol *kcontrol, int event)
+static int
+snd_soc_dai_link_prepare_params(struct snd_soc_dapm_widget *w,
+				struct snd_pcm_hw_params *params,
+				const struct snd_soc_pcm_stream *config)
 {
-	struct snd_soc_dapm_path *path;
-	struct snd_soc_dai *source, *sink;
-	struct snd_soc_pcm_runtime *rtd = w->priv;
-	const struct snd_soc_pcm_stream *config;
-	struct snd_pcm_substream substream;
-	struct snd_pcm_hw_params *params = NULL;
-	struct snd_pcm_runtime *runtime = NULL;
 	unsigned int fmt;
-	int ret = 0;
-
-	config = rtd->dai_link->params + rtd->params_select;
-
-	if (WARN_ON(!config) ||
-	    WARN_ON(list_empty(&w->edges[SND_SOC_DAPM_DIR_OUT]) ||
-		    list_empty(&w->edges[SND_SOC_DAPM_DIR_IN])))
-		return -EINVAL;
 
 	/* Be a little careful as we don't want to overflow the mask array */
 	if (config->formats) {
@@ -3791,26 +3778,41 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		dev_warn(w->dapm->dev, "ASoC: Invalid format %llx specified\n",
 			 config->formats);
 		fmt = 0;
-	}
 
-	/* Currently very limited parameter selection */
-	params = kzalloc(sizeof(*params), GFP_KERNEL);
-	if (!params) {
-		ret = -ENOMEM;
-		goto out;
+		return -EINVAL;
 	}
-	snd_mask_set(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
 
+	memset(params, 0, sizeof(*params));
+
+	snd_mask_set(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->min =
 		config->rate_min;
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->max =
 		config->rate_max;
-
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->min
 		= config->channels_min;
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max
 		= config->channels_max;
 
+	return 0;
+}
+
+static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_dapm_path *path;
+	struct snd_soc_dai *source, *sink;
+	struct snd_soc_pcm_runtime *rtd = w->priv;
+	const struct snd_soc_pcm_stream *config;
+	struct snd_pcm_substream substream;
+	struct snd_pcm_hw_params params;
+	struct snd_pcm_runtime *runtime = NULL;
+	int ret = 0;
+
+	if (WARN_ON(list_empty(&w->edges[SND_SOC_DAPM_DIR_OUT]) ||
+		    list_empty(&w->edges[SND_SOC_DAPM_DIR_IN])))
+		return -EINVAL;
+
 	memset(&substream, 0, sizeof(substream));
 
 	/* Allocate a dummy snd_pcm_runtime for startup() and other ops() */
@@ -3850,27 +3852,47 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 			sink->active++;
 		}
 
+		/*
+		 * Note: getting the config after .startup() gives a chance to
+		 * either party on the link to alter the configuration if
+		 * necessary
+		 */
+		config = rtd->dai_link->params + rtd->params_select;
+		if (WARN_ON(!config)) {
+			dev_err(w->dapm->dev, "ASoC: link config missing\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		ret = snd_soc_dai_link_prepare_params(w, &params, config);
+		if (ret < 0) {
+			dev_err(w->dapm->dev, "ASoC: link params prepare failed: %d\n",
+				ret);
+			goto out;
+		}
+
 		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
 
-			ret = soc_dai_hw_params(&substream, params, source);
+			ret = soc_dai_hw_params(&substream, &params, source);
 			if (ret < 0)
 				goto out;
 
-			dapm_update_dai_unlocked(&substream, params, source);
+			dapm_update_dai_unlocked(&substream, &params, source);
 		}
 
 		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-			ret = soc_dai_hw_params(&substream, params, sink);
+			ret = soc_dai_hw_params(&substream, &params, sink);
 			if (ret < 0)
 				goto out;
 
-			dapm_update_dai_unlocked(&substream, params, sink);
+			dapm_update_dai_unlocked(&substream, &params, sink);
 		}
+
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
@@ -3932,7 +3954,6 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 
 out:
 	kfree(runtime);
-	kfree(params);
 	return ret;
 }
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
