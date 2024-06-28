Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE12C2BD09
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jun 2024 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MJE7cqXK+W1avz5/cF95Z6dD39mcddQtzqMIbRMN/Wo=; b=Zp+UlkWHenrjnJ
	KCZnlo9WvC21aDbxLEOAmMDR6jvQJ3HkxYxl5ycVCtqfP+hbln4m8KKhErGIqj8IEhi9GTee3A/np
	RRFChXtcKO9c3CPnO+nCXCwFsHwD14yVIsFKDKT0LMRQ9E8QuR5sM3LE4WXPQpy0H0WV9xu1zIs5Q
	G9x6LV4IOOh1CQ43+nOD8+6VHpOBsR34hWQu9XXbH+UaWaI+CCLqp0Rv1lqt0vgWJgVdDai1fpoA5
	bwnWW1b2lNX/TpGBUvBCQUZjWmJg7N/TWShMC6IfT7lB8WaVWufuf5+0ZbQdFhl/3lCP/XKdgG/us
	ajuwn76mdOFR1oFrg1Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAn0-0000000Dhb4-2hNQ;
	Fri, 28 Jun 2024 12:33:18 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNAmw-0000000DhY5-2Mmx
	for linux-amlogic@lists.infradead.org;
	Fri, 28 Jun 2024 12:33:16 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ec61eeed8eso6391571fa.0
        for <linux-amlogic@lists.infradead.org>; Fri, 28 Jun 2024 05:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719577993; x=1720182793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ByitVlXA6nhfpW6PjFdoGZsiVDUb87dQzsQq5KJFjRU=;
        b=bQADibcmMlh/UbRzasN0FIKAhYeNAQ/AetLiJnki/ffpQ51iLewP00HRypALPuWNK1
         QeXEqqyky+yaG4mxSO0UfNlKhlMxr6OpdNSIwEs1jae+Lpj7fBi7Lv3tlfg1f96QtqFf
         GKrw8s24gLNW3/t3ed/Jqk1FsuUSLv0ZjeJOZxmdK/2M5tVqNj1sqkv8hWOL4OHy5icg
         kpDuSQDE5WwZqbpvZpsw5hZfrGfUzWKlDX/ZRel38UG6WgB23mcqGtXiRD/miQkFuT6x
         lrqjg+gz90OTj3QWTMhLif/ITati38S6gEDvD1W/o7WRwqV30E7D3yHFNPM5NTFx90Kk
         RfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719577993; x=1720182793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByitVlXA6nhfpW6PjFdoGZsiVDUb87dQzsQq5KJFjRU=;
        b=Df1yUAC8TYUWscm5iKUj1XBAZOvh0dhS0zxKfNE4yl2DGwePujLOwAjRvwfO0ril52
         uu6Fi0IWGfUxftSUkajuuviJXTGeo6mxRnGpBDvn+v5uwWQnBnVEJfbvCYkN2Uf5djHe
         iG2K+8Gr7XbW/xffLzK4DQuVWOC40K/gW3TTezRTRK74mzsFawro09sgfMK50jYseh5j
         UxpOxYy/oLT0gWsRWHpLZeYjTXE1Iq68sRe0Rtrja4UYyayko8jNQbyhr/1944c1Qtyo
         GN7TTV2S05yl9OJucqtJhJ1x9TbJvej6HStg9WAjOyiCf14F1rWmQayEc+T+tYf10uHb
         afsg==
X-Forwarded-Encrypted: i=1; AJvYcCUkEyRoI/E/jHfXo5uHp/SkHsqzru1uIIRrYOIwnKxJLQLq4HAX7WGj2O6GjGUNc+C8c5d+u41EsRsIqSF41taqH9VxKmshYTAmefzzXizlHiA=
X-Gm-Message-State: AOJu0Yx0A1hxgqiCiJadrIHQfmwpSDu5agyO8gOcFRqmtIWHk1kDrk2t
	iwU+0Fhs8u5AQBGSuTYPxYFxhRy6uFeqtb+sFdVOjj4bWbxXGUuHJpsRhgt0svU=
X-Google-Smtp-Source: AGHT+IHz/uNtBn4C3DHDM1aScnu28pMEPRreVGC8UWvz2fxy9dEUhXjjiQDtOaC24cz8ouavSZ1KUg==
X-Received: by 2002:a2e:720b:0:b0:2ec:4096:4bc6 with SMTP id 38308e7fff4ca-2ec5b318000mr95955161fa.7.1719577992700;
        Fri, 28 Jun 2024 05:33:12 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:78b7:4c75:7e6e:807f])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4256af59732sm33916715e9.11.2024.06.28.05.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 05:33:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: meson: tdm: add sample rate support up to 768kHz
Date: Fri, 28 Jun 2024 14:32:54 +0200
Message-ID: <20240628123256.2019224-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_053314_628058_2224683C 
X-CRM114-Status: GOOD (  11.16  )
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

Add support for 705.6kHz and 768kHz sample rates

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c  | 2 +-
 sound/soc/meson/axg-frddr.c | 4 ++--
 sound/soc/meson/axg-tdm.h   | 2 +-
 sound/soc/meson/axg-toddr.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 59abe0b3c59f..7e6090af720b 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -32,7 +32,7 @@ static const struct snd_pcm_hardware axg_fifo_hw = {
 		 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP),
 	.formats = AXG_FIFO_FORMATS,
 	.rate_min = 5512,
-	.rate_max = 384000,
+	.rate_max = 768000,
 	.channels_min = 1,
 	.channels_max = AXG_FIFO_CH_MAX,
 	.period_bytes_min = AXG_FIFO_BURST,
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index e97d43ae7fd2..e70c8c34c7db 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -112,7 +112,7 @@ static struct snd_soc_dai_driver axg_frddr_dai_drv = {
 		.channels_max	= AXG_FIFO_CH_MAX,
 		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min	= 5515,
-		.rate_max	= 384000,
+		.rate_max	= 768000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_frddr_ops,
@@ -189,7 +189,7 @@ static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
 		.channels_max	= AXG_FIFO_CH_MAX,
 		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min	= 5515,
-		.rate_max	= 384000,
+		.rate_max	= 768000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_frddr_ops,
diff --git a/sound/soc/meson/axg-tdm.h b/sound/soc/meson/axg-tdm.h
index daaca10fec9e..1a17f546ce6e 100644
--- a/sound/soc/meson/axg-tdm.h
+++ b/sound/soc/meson/axg-tdm.h
@@ -16,7 +16,7 @@
 #define AXG_TDM_NUM_LANES	4
 #define AXG_TDM_CHANNEL_MAX	128
 #define AXG_TDM_RATES		(SNDRV_PCM_RATE_5512 |		\
-				 SNDRV_PCM_RATE_8000_384000)
+				 SNDRV_PCM_RATE_8000_768000)
 #define AXG_TDM_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 				 SNDRV_PCM_FMTBIT_S16_LE |	\
 				 SNDRV_PCM_FMTBIT_S20_LE |	\
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index e03a6e21c1c6..03512da4092b 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -131,7 +131,7 @@ static struct snd_soc_dai_driver axg_toddr_dai_drv = {
 		.channels_max	= AXG_FIFO_CH_MAX,
 		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min	= 5515,
-		.rate_max	= 384000,
+		.rate_max	= 768000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_toddr_ops,
@@ -228,7 +228,7 @@ static struct snd_soc_dai_driver g12a_toddr_dai_drv = {
 		.channels_max	= AXG_FIFO_CH_MAX,
 		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
 		.rate_min	= 5515,
-		.rate_max	= 384000,
+		.rate_max	= 768000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_toddr_ops,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
