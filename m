Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42537C25B4F
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGTqJmhxkTcHGyZbviMLkPYXBgymD2JUsa1/tCCMPxQ=; b=vcOwoDfYQuTL6t
	GPRvPFaloYzB2qW/dAWWBWFa5CA9WcrzjGkWKGMM1jygX6EcCydNpd2Rayk1AI+qUnRwbfXeDPK1C
	gAyjwODNl/S5PgvcWttHRlRJcCDt2zYrviE1QYU1npSAFOh6bVyZ/CsrjwkGEigBKVOie+rwFWhk5
	nVKAf4CAsaPcTv0qDZMl0HLezAvR0zqp4rLxNGM1r2M9UmU8h7YEotPGEmLy+ZN750KTVrQV15g+q
	gnh3EWFaJlss9YSLBYfXwAPeaif6/HhDk5pXUepkG5ud9r6LtcZI5bbCDroH2eGXKcuz8L40oBajG
	GObH8Wdv9hZl7tMxBdnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWX-0000000D3Ih-3VSz;
	Fri, 26 Apr 2024 15:30:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWS-0000000D3DH-3Uz3
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Apr 2024 15:30:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41b4ff362a8so16820415e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145397; x=1714750197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQ4CJQsXVTR1thlbAzx7uixAygG90ZyA723vL1wPyc4=;
        b=Epp28Cs+FD2svqEE6CKpTs2sOq/GTs+ZD6YSBVu517S8T8f/1FieQWk5uyTSvLvONf
         x6CFFxBHQ/LsqsZvFMld8ZnSDvCbS1CaF3kOLFKy3PPXSHvhO/lxneCf32ko74D6WhXx
         xMmJ+9R7Di8BqeaKtV/7KPKLr+gR1Ja2eCASSszb0GhWaoK0X840riaDaXsz78sRgO53
         w92SOUtSmSRk0I+Z5ZpMmRPzZlCx9MQrXipXOyD7qiiiG0+F/UN4fECapua2n73Pl4R2
         z/mTs8gwA+DL9c1+Un9IKPj/Ss8YRFhb0p4xSVcV9/RhrUQYIkRthRDXzfm3cPAkFWce
         ukjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145397; x=1714750197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ4CJQsXVTR1thlbAzx7uixAygG90ZyA723vL1wPyc4=;
        b=gdNlkmvrgtduPY7MKLn2AizwcBz7EFdGC+Qcl1P/fhXIyrCIfLn4nS/MOQusbcx98C
         YAPfHWY7tRqffwxiICjlUFW6YWFMTU20aIQrpap1dxdYjnLJZ0gtxp36CtL+KAtxG0fB
         IG8jyjn/HuAdJAHPIb5/cIb+VeUiocMVReeijRYWqPVxmZeLbQNuPX/UwHiyGT6j33u7
         5F9NWQReiuhEuoAgEuIDdg7lsN63AeatpFn6bWnwfc2m0cn9YKj5oeSAZNExU8kteHUd
         /0GxGEOw+80RvsHBfrlgGncqR7AhyW9wKvqNoJSrukjTqf3xzQPK82A9MZiwmog4+o/R
         njXA==
X-Forwarded-Encrypted: i=1; AJvYcCW7d9SmJWqMpWWHGDDDy2UcoAdmQoAAl5GcEjHS/z8Fp30fCYkh8ebIFT9OZTtOQQZCdNpgauGPqg+aL5WAcnA9uVJtLrose6OAnnHtso5WRYE=
X-Gm-Message-State: AOJu0YzKYqHwkBtaYEX5y4o9B+3DmPz0gVWxSyMm985EYFE4rnMRjfxy
	tJPK36SFRXLtV158NqrytvboLXwiDw2cZNwzZlWsVGePZXefvS8C3eoTDdr9rhY=
X-Google-Smtp-Source: AGHT+IH1/5s5CRPWdPZqkFw1JsMyITFCO5/+y/SMhOfip3B1nJoETVweJYnD+9vnKbqKCb2dr/aCkw==
X-Received: by 2002:a05:600c:4508:b0:418:37e1:3f73 with SMTP id t8-20020a05600c450800b0041837e13f73mr3024524wmo.2.1714145397352;
        Fri, 26 Apr 2024 08:29:57 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 3/4] ASoC: meson: axg-tdm-interface: manage formatters in trigger
Date: Fri, 26 Apr 2024 17:29:40 +0200
Message-ID: <20240426152946.3078805-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_083000_976544_B65F1D14 
X-CRM114-Status: GOOD (  12.96  )
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

So far, the formatters have been reset/enabled using the .prepare()
callback. This was done in this callback because walking the formatters use
a mutex. A mutex is used because formatter handling require dealing
possibly slow clock operation.

With the support of non-atomic, .trigger() callback may be used which also
allows to properly enable and disable formatters on start but also
pause/resume.

This solve a random shift on TDMIN as well repeated samples on for TDMOUT.

Fixes: d60e4f1e4be5 ("ASoC: meson: add tdm interface driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-interface.c | 34 ++++++++++++++++-------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index bf708717635b..8bf3735dedaa 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -349,26 +349,31 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int axg_tdm_iface_hw_free(struct snd_pcm_substream *substream,
+static int axg_tdm_iface_trigger(struct snd_pcm_substream *substream,
+				 int cmd,
 				 struct snd_soc_dai *dai)
 {
-	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+	struct axg_tdm_stream *ts =
+		snd_soc_dai_get_dma_data(dai, substream);
 
-	/* Stop all attached formatters */
-	axg_tdm_stream_stop(ts);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		axg_tdm_stream_start(ts);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_STOP:
+		axg_tdm_stream_stop(ts);
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	return 0;
 }
 
-static int axg_tdm_iface_prepare(struct snd_pcm_substream *substream,
-				 struct snd_soc_dai *dai)
-{
-	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
-
-	/* Force all attached formatters to update */
-	return axg_tdm_stream_reset(ts);
-}
-
 static int axg_tdm_iface_remove_dai(struct snd_soc_dai *dai)
 {
 	int stream;
@@ -412,8 +417,7 @@ static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
-	.prepare	= axg_tdm_iface_prepare,
-	.hw_free	= axg_tdm_iface_hw_free,
+	.trigger	= axg_tdm_iface_trigger,
 };
 
 /* TDM Backend DAIs */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
