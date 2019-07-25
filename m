Return-Path: <SRS0=Jj0Y=VW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D3A7C76191
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:00:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F35A222C7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Jul 2019 17:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u8Yo2EQF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="r5tKc4Pv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F35A222C7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vd/0fzGlAJ48sm/CzUJYjfsn235v+RYeKSQSXhD7YQs=; b=u8Yo2EQFSLneVE
	a0HH+Wm06Urot8839JcLZsf08cL5LX9i+AMLnqG8s41prG4o7XNg4QB0W6+kt1ubnwjzANXP1Fky8
	sx0j+kOTzJ4r5eRkfQHF6GAMeljsOuMuXCefYOg6Bbt+txXOa/j/vkfAFCqkVHvWRKlTr0lOpvAiw
	zPv0TALihWW/EvCtoadb2WhWr5e91dKD1pW9DL2htC/4H9p88yyHRZ97itT/ckajeD5hnsPFqalYL
	kUuFrS76/GbefjV3cRqbRDcAKFOuAdGVA7E23K8euEPWXzRLQDC/GDEZxURKApj/XkUsuuQziJM5X
	IG9goW44Syp6GKz6azwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqh66-0005ja-GG; Thu, 25 Jul 2019 17:00:06 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqh5x-00059s-07
 for linux-amlogic@lists.infradead.org; Thu, 25 Jul 2019 16:59:58 +0000
Received: by mail-wm1-x341.google.com with SMTP id f17so45362606wme.2
 for <linux-amlogic@lists.infradead.org>; Thu, 25 Jul 2019 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1P7u0Co1FZIgszjfOWbb/VOBl2AyJ67k8rg2qPsuG9g=;
 b=r5tKc4PvhzmOFbf1FoB8rCT/fm7hSxgnrW7sQMsn8Qylf6PMGtTDYFfSrjZh/elgHN
 x5rFP9SPMLKAvCYOrKMk6Ib0xL/X9oOTmoPYvTdwKpD4LOaz76fmxwMWIZHU+Gq1/SzO
 FWnkEwGScp4qi5aFjlidN4smqnr+qP6ZYUuP8/NiLn0TvaHo1sJQKG/LrZ0stXiwjGK5
 oAJRD1lE112FTD3su50UyxQ6QpTQ9QWBHecLPBe93UPcu3lIQJKBYooQb2ctFID1UnSQ
 Hl9Nj7KIuN1yk2Yy1GOynzpnFSFvducDTPDZ6s/eB5flDEiAcNdeW5fJ1V22rD56UCeV
 oqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1P7u0Co1FZIgszjfOWbb/VOBl2AyJ67k8rg2qPsuG9g=;
 b=rTGAvxz5q6z095bqOrI9knoE8cf9YN+XJGDkzhUVfcR3EBn6z4B1MwbMK5mLrgbb8Z
 5erXm0EA2IfATxnyynyp/BESsvExMBgJj+HP174vSL7qvwT8ube5AhbZ9ZWL/g9N37kd
 m9HaJOP5G7WiKrYmX5MTn96yKVbuckIigt3oftloYqSoqPT8SL7FxCTZnJGlycevEutX
 UdvLd0DfkNT3bTMTyuwXo5AJ38jsva/evmXUMGhxPFI/dm75CHGb8lQLBDZ6yIXmC6PH
 ozploWbLEkhVoAzLa8K6eWYvhct4IinLzsYHJ4y4oFnDOXdnuWWIJbyEt5kTOAxXkHyU
 x0OA==
X-Gm-Message-State: APjAAAVryazKIxPt+jUGTQvkbx/RGrugsrWsFbc9MOp86iik4lnhIMnx
 bfCqXTee/ByvXYR2WSK/Y7oNUQ==
X-Google-Smtp-Source: APXvYqxomozDgrR71lhr8rqmuZkdGgwBb3Q7l7lIGzqAXK4rYpzRYpowEdLKjHqCLGjQ/+2ZO6QxHQ==
X-Received: by 2002:a7b:c5c2:: with SMTP id n2mr78681344wmk.92.1564073995570; 
 Thu, 25 Jul 2019 09:59:55 -0700 (PDT)
Received: from starbuck.baylibre.local (uluru.liltaz.com. [163.172.81.188])
 by smtp.googlemail.com with ESMTPSA id q10sm53627199wrf.32.2019.07.25.09.59.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:59:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 3/6] ASoC: codec2codec: deal with params when necessary
Date: Thu, 25 Jul 2019 18:59:46 +0200
Message-Id: <20190725165949.29699-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725165949.29699-1-jbrunet@baylibre.com>
References: <20190725165949.29699-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190725_095957_040288_2872CF03 
X-CRM114-Status: GOOD (  16.37  )
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

Also, dealing with the codec to codec params just before calling
.hw_params() callbacks give change to either party on the link to alter
params content in .startup(), which might be useful in some cases

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 159 +++++++++++++++++++++++++------------------
 1 file changed, 92 insertions(+), 67 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7db4abd9a0a5..6dcaf9ff6eb5 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3764,25 +3764,59 @@ int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_new_controls);
 
-static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
-				  struct snd_kcontrol *kcontrol, int event)
+static int
+snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
+			       struct snd_pcm_substream *substream)
 {
 	struct snd_soc_dapm_path *path;
 	struct snd_soc_dai *source, *sink;
-	struct snd_soc_pcm_runtime *rtd = w->priv;
-	const struct snd_soc_pcm_stream *config;
-	struct snd_pcm_substream substream;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_hw_params *params = NULL;
-	struct snd_pcm_runtime *runtime = NULL;
+	const struct snd_soc_pcm_stream *config = NULL;
 	unsigned int fmt;
-	int ret = 0;
+	int ret;
 
-	config = rtd->dai_link->params + rtd->params_select;
+	params = kzalloc(sizeof(*params), GFP_KERNEL);
+	if (!params)
+		return -ENOMEM;
 
-	if (WARN_ON(!config) ||
-	    WARN_ON(list_empty(&w->edges[SND_SOC_DAPM_DIR_OUT]) ||
-		    list_empty(&w->edges[SND_SOC_DAPM_DIR_IN])))
-		return -EINVAL;
+	substream->stream = SNDRV_PCM_STREAM_CAPTURE;
+	snd_soc_dapm_widget_for_each_source_path(w, path) {
+		source = path->source->priv;
+
+		ret = snd_soc_dai_startup(source, substream);
+		if (ret < 0) {
+			dev_err(source->dev,
+				"ASoC: startup() failed: %d\n", ret);
+			goto out;
+		}
+		source->active++;
+	}
+
+	substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
+	snd_soc_dapm_widget_for_each_sink_path(w, path) {
+		sink = path->sink->priv;
+
+		ret = snd_soc_dai_startup(sink, substream);
+		if (ret < 0) {
+			dev_err(sink->dev,
+				"ASoC: startup() failed: %d\n", ret);
+			goto out;
+		}
+		sink->active++;
+	}
+
+	/*
+	 * Note: getting the config after .startup() gives a chance to
+	 * either party on the link to alter the configuration if
+	 * necessary
+	 */
+	config = rtd->dai_link->params + rtd->params_select;
+	if (WARN_ON(!config)) {
+		dev_err(w->dapm->dev, "ASoC: link config missing\n");
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* Be a little careful as we don't want to overflow the mask array */
 	if (config->formats) {
@@ -3790,27 +3824,62 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 	} else {
 		dev_warn(w->dapm->dev, "ASoC: Invalid format %llx specified\n",
 			 config->formats);
-		fmt = 0;
-	}
 
-	/* Currently very limited parameter selection */
-	params = kzalloc(sizeof(*params), GFP_KERNEL);
-	if (!params) {
-		ret = -ENOMEM;
+		ret = -EINVAL;
 		goto out;
 	}
-	snd_mask_set(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
 
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
 
+	substream->stream = SNDRV_PCM_STREAM_CAPTURE;
+	snd_soc_dapm_widget_for_each_source_path(w, path) {
+		source = path->source->priv;
+
+		ret = snd_soc_dai_hw_params(source, substream, params);
+		if (ret < 0)
+			goto out;
+
+		dapm_update_dai_unlocked(substream, params, source);
+	}
+
+	substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
+	snd_soc_dapm_widget_for_each_sink_path(w, path) {
+		sink = path->sink->priv;
+
+		ret = snd_soc_dai_hw_params(sink, substream, params);
+		if (ret < 0)
+			goto out;
+
+		dapm_update_dai_unlocked(substream, params, sink);
+	}
+
+out:
+	kfree(params);
+	return 0;
+}
+
+static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_dapm_path *path;
+	struct snd_soc_dai *source, *sink;
+	struct snd_soc_pcm_runtime *rtd = w->priv;
+	struct snd_pcm_substream substream;
+	struct snd_pcm_runtime *runtime = NULL;
+	int ret = 0;
+
+	if (WARN_ON(list_empty(&w->edges[SND_SOC_DAPM_DIR_OUT]) ||
+		    list_empty(&w->edges[SND_SOC_DAPM_DIR_IN])))
+		return -EINVAL;
+
 	memset(&substream, 0, sizeof(substream));
 
 	/* Allocate a dummy snd_pcm_runtime for startup() and other ops() */
@@ -3824,53 +3893,10 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
-		snd_soc_dapm_widget_for_each_source_path(w, path) {
-			source = path->source->priv;
-
-			ret = snd_soc_dai_startup(source, &substream);
-			if (ret < 0) {
-				dev_err(source->dev,
-					"ASoC: startup() failed: %d\n", ret);
-				goto out;
-			}
-			source->active++;
-		}
-
-		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
-		snd_soc_dapm_widget_for_each_sink_path(w, path) {
-			sink = path->sink->priv;
-
-			ret = snd_soc_dai_startup(sink, &substream);
-			if (ret < 0) {
-				dev_err(sink->dev,
-					"ASoC: startup() failed: %d\n", ret);
-				goto out;
-			}
-			sink->active++;
-		}
-
-		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
-		snd_soc_dapm_widget_for_each_source_path(w, path) {
-			source = path->source->priv;
-
-			ret = snd_soc_dai_hw_params(source, &substream, params);
-			if (ret < 0)
-				goto out;
-
-			dapm_update_dai_unlocked(&substream, params, source);
-		}
-
-		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
-		snd_soc_dapm_widget_for_each_sink_path(w, path) {
-			sink = path->sink->priv;
-
-			ret = snd_soc_dai_hw_params(sink, &substream, params);
-			if (ret < 0)
-				goto out;
+		ret = snd_soc_dai_link_event_pre_pmu(w, &substream);
+		if (ret < 0)
+			goto out;
 
-			dapm_update_dai_unlocked(&substream, params, sink);
-		}
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
@@ -3932,7 +3958,6 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 
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
