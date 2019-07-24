Return-Path: <SRS0=ig9A=VV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27881C7618B
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F127821871
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2019 16:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y0PwfJP+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0pshrWOR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F127821871
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRHaz9mHYu6B6heLgOn3KVTfSvuDDA4h4subiNvJ1n0=; b=Y0PwfJP+XqBY19
	Mb2sfF0/VSWTA5uYbNAvfDQ39RJ0Exp7xoRyVaSxCI0m0PiE1HutYmte58fPnJGObYkANW1FIjoWX
	rlTxrqKPD9tSKhN0UzJtsEEbjxyDVocKJGPyEYqOG2kltj3L5Eul06ptd7xhsosvhun2dKsKIjiS8
	HHx4BRqUmqccktJcm4arJ6/v51jSsuLGKdmu01nF4JXJZ8WOtNk6NkvpUN8UIC7ruBr7euTyXb5bH
	2jBrnpVanXVy5+Iw/DC+s8rkTZkyTziOpFLrGfHOgCKCFh9ySJmyCsfi4b3WiJN84pG5++5nMNZvZ
	WeyYRkdIXDuK/WXhYSrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqK3x-000712-Qc; Wed, 24 Jul 2019 16:24:21 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqK3q-0006sT-Nn
 for linux-amlogic@lists.infradead.org; Wed, 24 Jul 2019 16:24:17 +0000
Received: by mail-wr1-x443.google.com with SMTP id p17so47628732wrf.11
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jul 2019 09:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZSaABRSxmdPUIlgGnW2e+CGetJdVeG6KV5A9m/NM03Q=;
 b=0pshrWORbtR9bwGpPO/MJfAdOn47cpmS7uHac8G6OKoOKp2ZPIni0pWdFjRnSmwsJf
 W6BdvldykF0q8NBQvlSe/iRUgyDrBKncnSgKIziL/9tRU60SwhO2eyi6FoLTjyFFz9px
 vq7W3LDd7u0bkk/5pt8Dm69MPaEjimSoSWColk3ocsvSAfkwSbMgQBtE4r+O2Umi2o6Y
 k+nL159AfkGDIoB0+EoO9XgUxV/t3tHYp7BWUhb22rj2U7GUO+lYhk1tyHx3/kB//XED
 JRkpaIhqP375b6vvq55uSwqVGpAtICIP8Q0mRBH2kY0+wPkycv7lWs10T0WKC2ZYEs0Q
 cqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZSaABRSxmdPUIlgGnW2e+CGetJdVeG6KV5A9m/NM03Q=;
 b=hVbUfrgg+uAIRdC7g+CyjPePl4uoo1QeM2TM6wXHGlCyRcpmUZ21a4CWzc1atayB6M
 S333ncBI68SzTowhrx+P7dEl+aL/BSNhMe4QZDawymNAqzawqiiiLatNoqftQsy4HsuE
 QFA1eQeP6vWvyBg7/yPNRKNzko+wQtqVqpkfRCe0PJBUmDSC6B+NFTFRY8aVDsXTcytK
 6DxfNISWUPWGiToJ9HMxb2s8ZS5y2mBNH3xRq2nLhpO7sZ8kpdhzvC1z/T1TLU6yrzG5
 AIUmAbxNQZbN1CXd68sYGcSuAAGDc9AT82VJ9VTVUlPnv167W0/0hFNgCmXyuqDx7lDx
 +gBA==
X-Gm-Message-State: APjAAAVfI3a1FAy64npM+3jJaeDgxhC64a/pR2BkLtcU/3wVy2vNQ6p9
 RrnTitkBQx3tuE7OS9HJprJiFQ==
X-Google-Smtp-Source: APXvYqxS3+s9PV/UD5cbznvDYuzkayLSYR2XQOJ7T6bOblKvnaCksJxG1/j1hQYeSoEZr3oOFC0kmg==
X-Received: by 2002:adf:e843:: with SMTP id d3mr40668799wrn.249.1563985453480; 
 Wed, 24 Jul 2019 09:24:13 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 4/6] ASoC: create pcm for codec2codec links as well
Date: Wed, 24 Jul 2019 18:24:03 +0200
Message-Id: <20190724162405.6574-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190724_092414_782656_CCFB10EA 
X-CRM114-Status: GOOD (  18.11  )
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

At the moment, codec to codec links uses an ephemeral variable for
the struct snd_pcm_substream. Also the struct snd_soc_pcm_runtime
does not have real struct snd_pcm.

This might a problem if the functions used by a codec on codec to
codec link expect these structures to exist, and keep on existing
during the life of the codec.

For example, it is the case of the hdmi-codec, which uses
snd_pcm_add_chmap_ctls(). For the controls to works, the pcm and
substream must to exist.

This change is first step, it create pcm (and substreams) for codec
to codec links, in the same way as dpcm backend links.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-core.c | 42 ++++++++++++------------------------------
 sound/soc/soc-pcm.c  | 35 ++++++++++++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 33 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7ecfe641ca46..9e8eb93c8a3f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -447,16 +447,6 @@ static void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
 		flush_delayed_work(&rtd->delayed_work);
 }
 
-static void codec2codec_close_delayed_work(struct work_struct *work)
-{
-	/*
-	 * Currently nothing to do for c2c links
-	 * Since c2c links are internal nodes in the DAPM graph and
-	 * don't interface with the outside world or application layer
-	 * we don't have to do any special handling on close.
-	 */
-}
-
 #ifdef CONFIG_PM_SLEEP
 /* powers down audio subsystem for suspend */
 int snd_soc_suspend(struct device *dev)
@@ -1552,27 +1542,19 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
 		return ret;
 	}
 
-	if (!dai_link->params) {
-		/* create the pcm */
-		ret = soc_new_pcm(rtd, num);
-		if (ret < 0) {
-			dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
-				dai_link->stream_name, ret);
-			return ret;
-		}
-		ret = soc_link_dai_pcm_new(&cpu_dai, 1, rtd);
-		if (ret < 0)
-			return ret;
-		ret = soc_link_dai_pcm_new(rtd->codec_dais,
-					   rtd->num_codecs, rtd);
-		if (ret < 0)
-			return ret;
-	} else {
-		INIT_DELAYED_WORK(&rtd->delayed_work,
-				  codec2codec_close_delayed_work);
+	/* create the pcm */
+	ret = soc_new_pcm(rtd, num);
+	if (ret < 0) {
+		dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
+			dai_link->stream_name, ret);
+		return ret;
 	}
-
-	return 0;
+	ret = soc_link_dai_pcm_new(&cpu_dai, 1, rtd);
+	if (ret < 0)
+		return ret;
+	ret = soc_link_dai_pcm_new(rtd->codec_dais,
+				   rtd->num_codecs, rtd);
+	return ret;
 }
 
 static int soc_bind_aux_dev(struct snd_soc_card *card, int num)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index fabeac164a6c..30264bc592f6 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -678,6 +678,16 @@ static void close_delayed_work(struct work_struct *work)
 	mutex_unlock(&rtd->pcm_mutex);
 }
 
+static void codec2codec_close_delayed_work(struct work_struct *work)
+{
+	/*
+	 * Currently nothing to do for c2c links
+	 * Since c2c links are internal nodes in the DAPM graph and
+	 * don't interface with the outside world or application layer
+	 * we don't have to do any special handling on close.
+	 */
+}
+
 /*
  * Called by ALSA when a PCM substream is closed. Private data can be
  * freed here. The cpu DAI, codec DAI, machine and components are also
@@ -3011,6 +3021,12 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		playback = rtd->dai_link->dpcm_playback;
 		capture = rtd->dai_link->dpcm_capture;
 	} else {
+		/* Adapt stream for codec2codec links */
+		struct snd_soc_pcm_stream *cpu_capture = rtd->dai_link->params ?
+			&cpu_dai->driver->playback : &cpu_dai->driver->capture;
+		struct snd_soc_pcm_stream *cpu_playback = rtd->dai_link->params ?
+			&cpu_dai->driver->capture : &cpu_dai->driver->playback;
+
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
@@ -3019,6 +3035,9 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
 				capture = 1;
 		}
+
+		capture = capture && cpu_capture->channels_min;
+		playback = playback && cpu_playback->channels_min;
 	}
 
 	if (rtd->dai_link->playback_only) {
@@ -3032,7 +3051,13 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	}
 
 	/* create the PCM */
-	if (rtd->dai_link->no_pcm) {
+	if (rtd->dai_link->params) {
+		snprintf(new_name, sizeof(new_name), "codec2codec(%s)",
+			 rtd->dai_link->stream_name);
+
+		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
+					   playback, capture, &pcm);
+	} else if (rtd->dai_link->no_pcm) {
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
@@ -3059,13 +3084,17 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	dev_dbg(rtd->card->dev, "ASoC: registered pcm #%d %s\n",num, new_name);
 
 	/* DAPM dai link stream work */
-	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
+	if (rtd->dai_link->params)
+		INIT_DELAYED_WORK(&rtd->delayed_work,
+				  codec2codec_close_delayed_work);
+	else
+		INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
 
 	pcm->nonatomic = rtd->dai_link->nonatomic;
 	rtd->pcm = pcm;
 	pcm->private_data = rtd;
 
-	if (rtd->dai_link->no_pcm) {
+	if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
 		if (playback)
 			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
 		if (capture)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
