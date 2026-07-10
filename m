Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDB7C44501
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jul 2026 21:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wq1nptkxO/h/v1HJIXcgUD/vdxdLcZ5NKQZozlB3/H4=; b=LV1KGJuEbClgn9
	qv6eGjs8LI6J+61BQ2wjbLmyVxaDGIK/FpDoXaKMGO4KrHgH+yxNrO8glKJ6Vqt4SYO4yXQWjnct8
	wr9GhCd+emC1Cu2FC9CoeEHv4psURZVCgHQ/bM2gbdSfiaN0yKrI+fUVoMIk1eyS0Lw3Ipvia9bLd
	jOiiSpW4SGqtDJNuBiV40p34eZK8ovL8ZjJjuahkzqT1c5xHhbDLINxu5sd+BmqcLG5YkY0BUYm/y
	Q6kKtkGY4BLpsPqmtkJIIAxxQigtwT7VDThvpf4ijXiOT62T+iuiN4B0VsOl1h/dxNb0ce3LnKOzl
	t7nt+Ve+NvOREZwYDcOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIU4-00000005luo-3U3v;
	Fri, 10 Jul 2026 21:10:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIU3-00000005lt1-2xn4
	for linux-amlogic@bombadil.infradead.org;
	Fri, 10 Jul 2026 21:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nJ4cp+Dez60Lk/0/twpxfAxM2T1ZemRxFXgI3U5E6xA=; b=EWmENiNndSZILrt6YORWKAw06j
	cEDi9JWDdfcmeA0ndzq2Q61JuD/BPOJfZXIh/IRhej4pWjCbem53QZ485WhQ9uLAaIyi1Uhcg55Mm
	z0L+SpKmoW7JLIGUUXlrZiHrUVRq+GgkvaAM/lz5T65fAdpC76CloC5bMONJw5RjtvkX5MDFAgSXE
	KJUkcrd6BXN3CgW3KtslzrCA2BVk/2KOGeYoAWxRwpsfCGHt3NwlvkWMMZLN/4wsFDqRPsB1yghVY
	4t75EcN+pgh3APWJ4nvK0K40grGcZMdOXPOATphyXGLhilGmgg542hc8E4DZVCefhy8FCm3bA6Z6l
	nJK2eyJg==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wiITs-0000000AKSA-3PJ0
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jul 2026 21:10:00 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so948696f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Jul 2026 14:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783717795; x=1784322595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nJ4cp+Dez60Lk/0/twpxfAxM2T1ZemRxFXgI3U5E6xA=;
        b=d35SbQJfqgoWFNrOf8A2fahm0xzvwOGC53DFV24xuO6b9GuMKme1uCUrNozQWYUPm5
         dJgflzK123if2DWMSB72DoZKTQ7s+7Rnic/cq0RsmCiOkO8MfgX8dL7oXwdG+0rGwpB9
         XOT2ZGR7bz+hS/7yMOKZg/hlxZq1QbB333awKnBFvIpQ/nmCMUPsqznbnjaD7S3cQTqJ
         GrcEMBz4p4+abAPDYDCU9ipcMz21Zax/oZQiUKbQBuofYV/2kcF4cLjGK7YMI5XXCvNd
         KpMhaOjcBj9BH6b+O9qD1snHOGwMVpriwn5KgiO5pmtJAvUVPslqH8NlmL2ND2cGNjn7
         N7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783717795; x=1784322595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJ4cp+Dez60Lk/0/twpxfAxM2T1ZemRxFXgI3U5E6xA=;
        b=MvIRA35wsphBblKmYMxG1cbfxb46ekU7BLSqTuRtWitgNgQcqIauurUI6s7KFYmQD8
         afocXeA/SQqfJQlelRaRf4y0sEY0vA4raXFflNEEuDh/c0HNzUn+YLS5r3wTnRbzjBj+
         2BOLEiext0JwViEf2YSyGV73QXX0MFZrLbTf5wVtJK55B8TIbFECZfvTmo65PhfsybuH
         q6oTOh21J23TWiSFfVAY1tZ3HlxOeAHkiYLHEpJAPxyTYREdhXUn16dCUeiCPzUKx2Wh
         Alnr+VbXNhHnFUbi8byPnGWjzCE02O4HrU/FJcD1uqs0ySHM4Yk7ZCJYcAlyfB5+TwWn
         RBwA==
X-Forwarded-Encrypted: i=1; AHgh+Rr50HvIarhz3YIHWbVCEytI71vkx/LoDxtvpnZHXLB8U39EoKrPBtbvX6b+DeD0nAy2J57eZ+Tp3maen/BD@lists.infradead.org
X-Gm-Message-State: AOJu0YzHxJIZ5oNDKl/ayp31EIn5wGmpdg7WrH11JTbmAUsLPCVgidRI
	VT0gSKhM+YGtqD90xSjCi1bV8Lmiyd3VxXmVwiWMIch/R/Svj/ab2DspjlhdgRjrRd0=
X-Gm-Gg: AfdE7ckBxWX1iKDevbBYjyLgef9F8Uz9+EjacYxuWhIXCWzrjqm4MZJDYLjmByKsXgF
	uQEaqnoxBzBDLeqRgtbI9PeCLv3Cwt1L/IC3L/tz/GoMjeRLoKRPe4/2NxUSvlfCXaZbh8+yMoD
	qqiBuoGRtsFdDsVqrhquoC4aA65o4WN1wxHbjtmFxaeE9VdRGgZX4shxjERkBsMgjOhoTMiDizT
	pC0WwIE0DjCC3vp238owMT5Ekeq0DfzABJqLTNVjtqImxv2OVHhzT92VWxe2ZCGGjHGDrkcTwOu
	C0t4N7rJ0QRGpQpdWDZnfgzayd1NQbwcDAJQJhC4uh6n3I4I2+r7W/UKlfXxl/w5Ij5o2UH+j/i
	adkRlGSD6kDqpQ8E3PiXxrK1FGdhOqJeLGucDAWLKH+LOREKDNQsId/I0tZPDQvySN4xDGPW1gL
	TTJOgeHyu5XA==
X-Received: by 2002:a05:6000:25fe:b0:475:5e4b:588e with SMTP id ffacd0b85a97d-47f2dc9bf45mr393022f8f.20.1783717795139;
        Fri, 10 Jul 2026 14:09:55 -0700 (PDT)
Received: from [127.0.1.1] ([151.41.178.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b0cesm64274135f8f.22.2026.07.10.14.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:09:54 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 10 Jul 2026 23:09:51 +0200
Subject: [PATCH 3/3] ASoC: meson: aiu-encoder-i2s: use the core
 symmetric_rate handling
MIME-Version: 1.0
Message-Id: <20260710-aiu-improve-quirk-check-v1-3-2fdd1b6f8896@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3679; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=KLOO+A+1/5XLck9wFIUskRNAYu38bZZV9QraigMfjJc=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFmB8fMqPrE8nRhfP30LO/vfSM6k6H9Wd/a1p3H6RzIu9
 vv7+MuEjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAEyEX4fhn2KGWnPtrGvbgg+5
 /879806yOteupubvqj8RZ5dPXFH0bA0jw0MB3nTWTR/lv4i80mewK3trLxL4/eBbtb2HtG397W6
 +5QQA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_220957_799000_04684A19 
X-CRM114-Status: GOOD (  18.73  )
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

The driver manually implement the interface-wide rate symmetry enforcement
in hw_params(), which suffers from the same problem addressed in the
previous patch: the restriction is not visible in the hw parameter
constraints, so a stream with a mismatching rate only finds out via
-EINVAL late in the stream setup.

The ASoC core already provides this feature through the DAI's
'symmetric_rate' flag: when another stream of the DAI is active,
soc_pcm_apply_symmetry() constrains the rate at open time so the
restriction shows up during parameter refinement, and
soc_pcm_params_symmetry() still rejects a mismatch at hw_params()
time as a backstop.

Set 'symmetric_rate' on the I2S encoder DAI and drop the open-coded
check along with the now unused 'rate' member of struct gx_iface.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 21 ++-------------------
 sound/soc/meson/aiu.c             |  1 +
 sound/soc/meson/gx-interface.h    |  3 ---
 3 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 4c62ea41d7e8..58dce9f08c9d 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -179,28 +179,14 @@ static int aiu_encoder_i2s_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
-	struct gx_iface *iface = ts->iface;
 	int ret;
 
-	/*
-	 * Enforce interface wide rate symmetry only if there is more than
-	 * 1 stream active.
-	 */
-	if (snd_soc_dai_active(dai) > 1) {
-		if (iface->rate && iface->rate != params_rate(params)) {
-			dev_err(dai->dev, "can't set iface rate (%d != %d)\n",
-				iface->rate, params_rate(params));
-			return -EINVAL;
-		}
-	}
-
 	ret = aiu_encoder_i2s_set_clocks(substream, params, dai);
 	if (ret) {
 		dev_err(dai->dev, "setting i2s clocks failed: %d\n", ret);
 		return ret;
 	}
 
-	iface->rate = params_rate(params);
 	ts->physical_width = params_physical_width(params);
 	ts->width = params_width(params);
 	ts->channels = params_channels(params);
@@ -233,17 +219,14 @@ static int aiu_encoder_i2s_hw_free(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct gx_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
-	struct gx_iface *iface = ts->iface;
 	struct snd_soc_component *component = dai->component;
 
 	/*
 	 * If this is the last substream being closed then disable the i2s
-	 * clock divider and clear 'iface->rate'.
+	 * clock divider.
 	 */
-	if (snd_soc_dai_active(dai) <= 1) {
+	if (snd_soc_dai_active(dai) <= 1)
 		aiu_encoder_i2s_divider_enable(component, 0);
-		iface->rate = 0;
-	}
 
 	if (ts->clk_enabled) {
 		clk_disable_unprepare(ts->iface->mclk);
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 64ace4d25d92..2668646e3597 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -154,6 +154,7 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.formats = AIU_FORMATS,
 		},
 		.ops = &aiu_encoder_i2s_dai_ops,
+		.symmetric_rate = 1,
 	},
 	[CPU_SPDIF_ENCODER] = {
 		.name = "SPDIF Encoder",
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
index d9ab894589fa..2a6207e393e8 100644
--- a/sound/soc/meson/gx-interface.h
+++ b/sound/soc/meson/gx-interface.h
@@ -19,9 +19,6 @@ struct gx_iface {
 
 	/* format is common to all the DAIs of the iface */
 	unsigned int fmt;
-
-	/* For component wide symmetry */
-	int rate;
 };
 
 struct gx_stream {

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
