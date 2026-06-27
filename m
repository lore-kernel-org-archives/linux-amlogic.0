Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21DDC43458
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jun 2026 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fJRoUYiHU5UOI57H2hHJlo7EmYs1VxsHXcIF/4s0vek=; b=v8PelXOj8jcHpW
	9FjRnWHYz6WZAVuipYzm8KGzTzcjcbioiNJJcw6ZIbuGK67aPOx9yAafiesicpn7yNLmShQjlIVVK
	VTdea3vI4+gt/Nt445Om864TdRqz+JD/RaxsrIVYEOME+LuROJSmyBFaVVvp3kra78SFCMKmOoNBG
	+BCu8E97pmiVsqe9uaUTTDMHrTV0ISTNjH1/O34erD2b1u5jfa4QsTIrLXXuJtLmSYMVIfJcgPKPK
	vErPIRa1mpk0ET+fyYEOHBmmmmhktHcm/TpbrRPuOBfRXrQheV2HudX8E18UGXGucETuy2Gb626PB
	NPMjspVWDK2dDVqiAsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSUY-0000000CTTt-3VhP;
	Sat, 27 Jun 2026 12:50:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdSUW-0000000CTT1-2rIF
	for linux-amlogic@lists.infradead.org;
	Sat, 27 Jun 2026 12:50:37 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4926fe5be4bso10148945e9.0
        for <linux-amlogic@lists.infradead.org>; Sat, 27 Jun 2026 05:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782564634; x=1783169434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CgBb9c2zB8E5ylruIOvxgxXaQ+5aMJ9oD3Y4vVrihts=;
        b=VAGvSxhFFA3F4GWe0SncjGnORgWs2VLAaa2weUiv7yzgwgbbjHVirZeD8i8hVMLh15
         lUCExzTqKpGEZWePzFuHmCP0O889GQYwZWgE036vJkWxLB5w2yFT9AEbKI0DVTrY5VGC
         nECxfLUNM7cjFxaRsj5n/Xcv76NTV8Vy04UKLiG07BCmQFb10XNSc7M8f6Cd4KTAI+eV
         k2PMt3HuLXQ5BehXqKWbeumQYPDU3D8xxvz8cr7ALwAcYAAZWsREwhbbihSvsHS/aBe8
         mF3WEEMo3PItvJ5I5RpDm32GyQX4jZQGcOv1quEmIbg1so7eZUNtXjbb/sjzLG4TnDtw
         zwHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782564634; x=1783169434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CgBb9c2zB8E5ylruIOvxgxXaQ+5aMJ9oD3Y4vVrihts=;
        b=fnYkkfEGzU/jFx60FRloQVJKDBURkSqgt38Jrrk1xI9hdAxOqBw0t2D3FTnjco2WdM
         OVI64LBSmyCOrKUIhxdQex5K2IsPq1kaB9h3PSji3PH4ul8xfVQImhucK6gtmnwQhrh3
         gcibBNG0IFcWLh8hBSIh3ONtBQ7u7Xtu0PfxjvBON7k/7t4cOg9h/2Uh7ezwcbO4L7WC
         d1aEBSenLr04bs3ZhuABhuldfXLuCneSxmP1lNJMV2o9RIeorJZk3lETLQVn/1cwfMfw
         m0Csn/isAnyRvuYejWIc/Z4RFX3+jcnzK9EVeW1DW79oDXkshs3JoJNPIEVgmoUpaIEJ
         wVXA==
X-Forwarded-Encrypted: i=1; AFNElJ8beC+/ecqzet13xNoJ/WyWwRapwKQTOF0eI1qm2il5llv+nSUwzViO2FMp7p3sIdBIdWxbCVJ1LdGg1TSX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+77icB947Er0h1T8yhSisQACiWt26IYd+AokxQnF9XhlxeqF
	rjUi/tESh6jJ2ua/hgeAWcuPhWqdB/mTCOmT0x5gCt+GCJW01sUhjk12
X-Gm-Gg: AfdE7cmvvmvCDw8sJe7ueMqKkfMpNFh8TYdqZtCthjamFOlB2bHHKNVs2CqJVU4zMMz
	xD6GsYWdxCCSrUGfsGuhbfz2tPk7Fl028G2AqoXN2AiZbqiCrEziQoG4wo+rCTpb7w9Nwkj0u+N
	Eln8nqigDnACGNvwoikP2WZq6cavIaAjPWqtkpbaNpDNa74jKrGnXSVQVPKdH+Hrqc6IYIne4TQ
	UPpJx72nx+CRFKDVViG5Gd3cBlW3WdOdhlZPNj9bmWvzQp02IqdsPx1ucgWWNG4SOkkL3XifPDz
	BttNIqcDMMprP/vW7mdE/3CkE2Cda8OVhCFWRnLgH60SEuSL+dFhxWCqjgpy2TL7G11kYXNJqod
	wEtH+LEjEV88gOuUvFHQYulsHK2Pa7KzNn0nYNkdmjltj5HyQgTZrKCdXFGP2KdMTBvZM39w7N+
	C8lhi4wp6yRDv7z1un
X-Received: by 2002:a05:600c:4f87:b0:492:703c:df36 with SMTP id 5b1f17b1804b1-492703cdf53mr63941035e9.26.1782564634280;
        Sat, 27 Jun 2026 05:50:34 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926f94f213sm105298565e9.12.2026.06.27.05.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:50:33 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
Date: Sat, 27 Jun 2026 12:50:30 +0000
Message-ID: <20260627125030.808058-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_055036_739345_2B66834F 
X-CRM114-Status: GOOD (  11.09  )
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

The I2S FIFO soft-resets its fast domain on start (AIU_RST_SOFT bit 0 +
AIU_I2S_SYNC read in aiu_fifo_i2s_trigger), mirroring the downstream
vendor driver's audio_out_i2s_enable(). The S/PDIF FIFO has no equivalent:
it only toggles the IEC958 DCU, so a stale datapath FIFO can be replayed,
producing the "machine gun noise" buffer underrun - on start when switching
outputs, and on stop when playback ends. The latter is audible on devices
with an always-on S/PDIF-fed DAC (e.g. the ES7144 on the WeTek Play2).

The vendor driver resets the IEC958 fast domain (AIU_RST_SOFT bit 2) on
both enable and disable (audio_hw_958_enable), and when reconfiguring
(audio_hw_958_reset clears AIU_958_DCU_FF_CTRL then resets). Do the same:
reset before enabling the DCU on start, and after disabling it on stop.

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
Changes from v1:
- Add missing fixes tag
- Trigger AIU_RST_SOFT_958_FAST then disable DCU as in the vendor driver

 sound/soc/meson/aiu-fifo-spdif.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index e0e00ec026dc..a9861c5d6637 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -24,6 +24,7 @@
 #define AIU_MEM_IEC958_CONTROL_MODE_16BIT	BIT(7)
 #define AIU_MEM_IEC958_CONTROL_MODE_LINEAR	BIT(8)
 #define AIU_MEM_IEC958_BUF_CNTL_INIT		BIT(0)
+#define AIU_RST_SOFT_958_FAST			BIT(2)
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
@@ -68,11 +69,15 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		fifo_spdif_dcu_enable(component, true);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		fifo_spdif_dcu_enable(component, false);
 		break;
 	default:
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
