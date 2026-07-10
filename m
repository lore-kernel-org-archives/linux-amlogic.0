Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9FCC44506
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 21:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtE0TWbh/rIqAstloDz+mTeX95buw0jw4WUsW3bzJ6o=; b=o26rR72sKvE3EF
	eO83pZeBO8arsRQM29+j6aqlnKY78uBozQZKs8vQiyg3FeeC8fc+xc4RWCyBvIvuuXmcpqK9dYJKw
	8yCJLyIzjjguE53KdO5h2ofwqSeGkG0OkWIYJYWf/ZP1VeU+CU0QlSbGbIXkQjO7VIWto2O9aqDnp
	OeD0V4vRZyJN9GfDW4BF9OTyoqn1F8446JOB1xrpdQqsM4gx1FdFlT81lH20fxhl9itWsz0ZsSrAx
	DX2dvlcTJZWbGD7chR+XOeoXeDa97hTh3m80Ag6RYDUKh4cmJ9W8FpX17WwrolRYUPdthZ4JYLtHL
	2bLdPvoDJCYrTEGOIh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiITu-00000005lmv-0YNx;
	Fri, 10 Jul 2026 21:09:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiITq-00000005ljs-3pXW
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 21:09:56 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47640541585so688260f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 14:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783717793; x=1784322593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rM5i69OmbRE0VBFYqnP7QagSMyMP9rPVK7lS65VX9Y=;
        b=d+vf7o8KBdYunkh0uHpsUGAvEx9JpFD7RpxgGib+oC9+myx6dOAHTVEVIDJMOBzk7n
         8vEBwfMxad/b/z6FyIrDS3DnOmZn+m5hoXTXX7wH/EExecnbCQZNIqdZjnKon8LrboLs
         le0G6Q6f/ZMBSuBsHlswXd2j20eJX40m0OXX/zmPs3RGLFs7CvPRu+2zNP/uHEOldz32
         nevVrWqsVpIjES6SUDQ1av2fql3tkXl4z3uyKpMQc/g68iuThm1t5H5ka/OGAkbG7cl/
         qS2ZsYJIf0hn4Z0EuQ3i5bo8bvgV9GXBo2MsbxjRsC4U7umq9FjM5DEg8KmWyg3CwuFG
         P0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717793; x=1784322593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rM5i69OmbRE0VBFYqnP7QagSMyMP9rPVK7lS65VX9Y=;
        b=GWuzJfJUEG/jrfjnnoj0srihS+ajWH17RmssbEcd4YtySZyvSrb507MzHFxUfLrWrb
         RJU3X9uA7J0EY5fHbd2GRM7ZRak2oQF/20d4NEJvZCCvEZKpDU6kWU+zXHGWtwf01zfm
         OsyhyMPrftnMZAgNvk9+el/ULU0v15wp1YglZ16uAGaQvjNPyPZ8Frk09ciH4DTH/rTV
         SJIVpvzZnOXl0qjy5sXXFjpgIfeWfxJifwRzpXqhnyHOVCzZvaFcAG316ZtaC2LhT7W2
         5eowddCf7cwQGt3l25Kmt3gB4aRfPnUARprNmT+SzfoG9pSX2GmPVa+yidIxIlQ6cfxa
         TUmg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6mUVMUEaS/2RfKSmPJnjqCkIA6Ezqr9SuataRn0r+cQP2kJusu5ZZGs4v0qkKVn9vfH1/q3TPpx0xa5c3@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0n5gg2GQK5kjNhrazAL/9jvogb+w/z9fyUIgHbwSXk/xaj9N/
	yneW1bsHzFk0eP+CpxFMPEcHQdM9wJel9W49OiQ9nZaUyT6HQUwrDxBVrILtTgBLGcA=
X-Gm-Gg: AfdE7clTCOcFouh94C8aaDWxzrpquxn/wlo3K88YlWZdIwUXybso59VKS4R7Ar83Z4V
	XIPGCODOogrCa4clFQTChvCKZ9L6fQeRQQJcA16jef+9e4UdQ96SAH1Ho9nWDg6Uagapjj4MMDy
	ysaKACGubpA5nWhWGVKe90B8AENo5l782uqsj334vq//vbnd89nTZjn1DthNpfJkP9RZHfSt+Mz
	z8KCcFjDHMu1HHlt0qaKa0BVPdOMpigu4FGTZvWhFUF46EZULsYRAYDBb6Lke69uCIaPG8ft6Tp
	FOhYAYpWHfqhOZJdvmEYztxKLYJJpetS06WICrwOgLGr/mRqR35S/yreuzB1k0kRwn+KJjb7iVR
	e0wx7pBXbb2yn9Nfvtt/8wrEG8U/AAP3+/FDakN49soejHybfK4AEhBNp+hmalJfQGgGvmgrRWG
	JTd45y8awGcA==
X-Received: by 2002:a05:6000:288c:b0:473:53b7:e390 with SMTP id ffacd0b85a97d-47f2dcac225mr411001f8f.11.1783717793050;
        Fri, 10 Jul 2026 14:09:53 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm64274135f8f.22.2026.07.10.14.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:52 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 10 Jul 2026 23:09:49 +0200
Subject: [PATCH 1/3] ASoC: meson: aiu-encoder-i2s: fix bs quirk
 incompatibility check
MIME-Version: 1.0
Message-Id: <20260710-aiu-improve-quirk-check-v1-1-2fdd1b6f8896@baylibre.com>
References: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
In-Reply-To: <20260710-aiu-improve-quirk-check-v1-0-2fdd1b6f8896@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6429; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=KeFdEWnIy0h8OsuDM6nXoQiK/x/W2mOvEHTnodUTR0c=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmB8fN2th759Djs0mG3ipCVesvS+pLCPwg3Hr+VGf2/R
 KJ9lfGyjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEzk5jmG/+ncWsvX27E90JbW
 upE2dYcgV+1yEcfHj+/HnGEQ/9i+8S3DPy1DZiHu+QwLVlW41GZmG7g9yu48NuGd5vKXJ9qP3/f
 6wg4A
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_140955_003340_9731D29C 
X-CRM114-Status: GOOD (  24.66  )
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

The bs-quirk incompatibility check has two flaws:

- It only rejects one direction of the mismatch. A stream that does
  not require the quirk is rejected while a quirked stream is active,
  but the opposite is not true: a stream requiring the quirk passes
  the check while a non-quirked stream is active, silently
  reprogramming the shared mclk/bclk divider with the 50% increase
  and corrupting the output of the running stream.

- 'bs_quirk' is only cleared in hw_free() when the last substream
  closes, but userspace may legally stop/reconfigure/start the stream
  without an intervening hw_free. Reconfiguring a single stream
  from the quirked configuration (8ch/16-bit) to one that does not
  need the quirk therefore fails with -EINVAL due to the stale flag.

Drop the interface-wide flag and instead compare the quirk
requirement of the incoming parameters against the committed
configuration of the opposite stream at hw_params() time. The
committed channels/width are cleared in hw_free() so that a released
stream no longer constrains the other one.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 66 +++++++++++++++++++++++++--------------
 sound/soc/meson/gx-interface.h    |  3 --
 2 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 83b579e98f1c..c2a280bfdfe2 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -62,13 +62,36 @@ static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
 	return 0;
 }
 
+/*
+ * Return true if the given combination of channels and sample width requires
+ * the bs quirk. Return false otherwise.
+ */
+static bool aiu_encoder_is_bs_quirk(unsigned int channels, int width)
+{
+	return (channels == 8) && (width == 16);
+}
+
+static int aiu_encoder_check_bs_quirk(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct gx_stream *other_stream = snd_soc_dai_dma_data_get(dai, !substream->stream);
+
+	/* Nothing to do if the other stream doesn't exist or it's not configured yet. */
+	if (!other_stream || !other_stream->channels)
+		return 0;
+
+	if (aiu_encoder_is_bs_quirk(other_stream->channels, other_stream->width) !=
+	    aiu_encoder_is_bs_quirk(params_channels(params), params_width(params)))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 					struct snd_pcm_hw_params *params,
 					unsigned int bs)
 {
-	struct aiu *aiu = snd_soc_component_get_drvdata(component);
-	struct gx_iface *iface = &aiu->i2s.iface;
-
 	/*
 	 * NOTE: this HW is odd.
 	 * In most configuration, the i2s divider is 'mclk / blck'.
@@ -76,25 +99,13 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 	 * increased by 50% to get the correct output rate.
 	 * No idea why !
 	 */
-	if (params_width(params) == 16 && params_channels(params) == 8) {
+	if (aiu_encoder_is_bs_quirk(params_channels(params), params_width(params))) {
 		if (bs % 2) {
 			dev_err(component->dev,
 				"Cannot increase i2s divider by 50%%\n");
 			return -EINVAL;
 		}
 		bs += bs / 2;
-		iface->bs_quirk = true;
-	} else {
-		/*
-		 * If the bs quirk is currently applied for one stream and another
-		 * ones tries to setup a configuration for which the quirk is
-		 * not required, then fail.
-		 */
-		if (iface->bs_quirk) {
-			dev_err(component->dev,
-				"bclk requirements are incompatible with active stream\n");
-			return -EINVAL;
-		}
 	}
 
 	/* Use CLK_MORE for mclk to bclk divider */
@@ -110,9 +121,11 @@ static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
 	return 0;
 }
 
-static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
-				      struct snd_pcm_hw_params *params)
+static int aiu_encoder_i2s_set_clocks(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
 {
+	struct snd_soc_component *component = dai->component;
 	struct aiu *aiu = snd_soc_component_get_drvdata(component);
 	struct gx_iface *iface = &aiu->i2s.iface;
 	unsigned int srate = params_rate(params);
@@ -133,10 +146,15 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
 
 	bs = fs / 64;
 
-	if (aiu->platform->has_clk_ctrl_more_i2s_div)
+	if (aiu->platform->has_clk_ctrl_more_i2s_div) {
+		if (aiu_encoder_check_bs_quirk(substream, params, dai)) {
+			dev_err(dai->dev, "bclk requirements incompatible with other stream\n");
+			return -EINVAL;
+		}
 		ret = aiu_encoder_i2s_set_more_div(component, params, bs);
-	else
+	} else {
 		ret = aiu_encoder_i2s_set_legacy_div(component, params, bs);
+	}
 
 	if (ret)
 		return ret;
@@ -155,7 +173,6 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
 	struct gx_iface *iface = ts->iface;
-	struct snd_soc_component *component = dai->component;
 	int ret;
 
 	/*
@@ -170,7 +187,7 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	ret = aiu_encoder_i2s_set_clocks(component, params);
+	ret = aiu_encoder_i2s_set_clocks(substream, params, dai);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
 		return ret;
@@ -219,7 +236,6 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 	if (snd_soc_dai_active(dai) <= 1) {
 		aiu_encoder_i2s_divider_enable(component, 0);
 		iface->rate = 0;
-		iface->bs_quirk = false;
 	}
 
 	if (ts->clk_enabled) {
@@ -227,6 +243,10 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 		ts->clk_enabled = false;
 	}
 
+	ts->channels = 0;
+	ts->width = 0;
+	ts->physical_width = 0;
+
 	return 0;
 }
 
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
index 65c46dcce32a..d9ab894589fa 100644
--- a/sound/soc/meson/gx-interface.h
+++ b/sound/soc/meson/gx-interface.h
@@ -22,9 +22,6 @@ struct gx_iface {
 
 	/* For component wide symmetry */
 	int rate;
-
-	/* Only for GX platform */
-	int bs_quirk;
 };
 
 struct gx_stream {

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
