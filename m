Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F7CC5478C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Feb 2024 17:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3GSHcb4sNYYNf9BEjk6S3pJizJM3cYqiabVPVXdFQ4=; b=VOzxd6cQCHYxqc
	JlhK0dyu8tJ62Kqz/XMPIxzGujVJ1QhJl/F0WJmmU4D6WTG8EZ+jq5h7iysrAMXERRV3hWPGE2tw+
	80dNsH8pHFG/DfivWfl7DY1dL2CYnJumVQBdXyeusiZUitfZTeTJ7/jb74FlVMjBsdwi3Eq9JIXxP
	csPzxjXTi7ff0OawR6594K6vIxGnOuWp22DBCew0ABt4w7nqKnUNs6ZqDv9UfVl+hFGpVh9h0mSb8
	huLFL+DYcPC4GQwvoTcSII/zb+8SDQrjNGVqsCbebecPjPVYaVMhRiiMnt3DxVmOQptcTUOAL+peE
	zg8KjfY9++mdVo5InETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZi0-0000000AdpQ-0tTG;
	Fri, 23 Feb 2024 17:51:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZhr-0000000Adft-24PP
	for linux-amlogic@bombadil.infradead.org;
	Fri, 23 Feb 2024 17:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=CvElMeb2g6xpqhFWcI8ix09RRMkAlSO99O6608hvkMQ=; b=IL2Zhwnp174Ctigm7i1L2vVGuE
	iTOmizsSivpWWwlaNEdXw8bh8lGe4nwyprmVF7/VezRbixFh7vHd1VPKft8NFCtrHKPOZi02t7U3R
	gjvBkMqU2F1rtx7SJ9FHmHnkbey2BfsAKxWWzj4BPl8lSEHJWyLKp898T4jeyxdav1ZL02HTzQhM3
	5BB8iI3iGSTnx5hMJQ+aTiK4sUU+iJulJP8LIMdYrmPWePsis+V9qm2nrZk5ZZH/QyTAItI/kS74z
	C1w3Wgy7eWX2xh5bkT2BllTBoD1lB0Aco3OOILIEWGht5vhmWWeFjfxktUei6rnZh3hsxtcLhzR6t
	WgTcp4jw==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdZhn-000000003vn-0iYY
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Feb 2024 17:51:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33aeb088324so410426f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Feb 2024 09:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708710686; x=1709315486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvElMeb2g6xpqhFWcI8ix09RRMkAlSO99O6608hvkMQ=;
        b=dW9Ggraq2oLqyik7orjuHchtwWcUMuFizZB/5OZ00doFWi1cGVf4gVYHu9V/se3KHp
         FF+4PHalL94dsuu90Dl6kMlvDHLSYpekV0A8ZumphkOBcYTx/rFIQx46tPudXV49IwwW
         nKCcwi6OFihJz2JM1Kru3NFYMox/lOh0yRjOxaevY2cY2qf84ImRDuT9fN/tWfi+r7dD
         1DYoWzUhIWnEk0UQyptm7egGKq2z6zGysnW5IstdneNMNafMhbcOVsMVkuyhx+ZO5CsQ
         7CZYIfchIYQ8y3Wbh+rGonAlnQ96vnkF0rpakBBFdpkoGwrwJ2GaCU0vT6mddHaOENy2
         njFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710686; x=1709315486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvElMeb2g6xpqhFWcI8ix09RRMkAlSO99O6608hvkMQ=;
        b=HagmScNytMkFMpNNljvOwqrm+OmgotzhpE4Mgao+CGQBowMlcvY5YuQd06rOs2VmI0
         CrASK4liLnzAGzb68z8I90IY/Gk+q02s7x+ZW9MxfQIkbrq4aQOOnSys8gF0tCK5VKkt
         e270nnfI7lxIlea79QLFH4ykurxK76b5NsYsmtQP0/IpXhaPFapDLmInEwRudI01mtyq
         VjkAtvk+dswz5fOjmhyv7VeG45WMK/PGnpPXoRtfLfnaENXcq7dzuV4DO/M0xViTl7wJ
         XBpNXsBHDilMqnoaMCtluomFTjWR2GYKGV5Xv6w6CmYiWa0fT/DAyE+nwd4nvs3ponFr
         C/EA==
X-Forwarded-Encrypted: i=1; AJvYcCVfCdxOa+17/oRiXJTpWfFW5qwi7Iwe9ByuR7FGsfHSYUqD8Pvm3dMG+0JXhlf66qzHMc68IvdlQoLUo7jXk/FkBexcOa83zEOC0JMWCItCSss=
X-Gm-Message-State: AOJu0YzT+isAj1c+17YfzkgvfGRQ5J0RGr1ZJBWH+H438OaHFFgiU3HS
	79jN0eoh3cIPhIgeV6uPRJufyCv6uhcFer2HWOsRSDeKB5X1QP+ZDM/6xUFIu7A73NfsIb9bnlI
	U
X-Google-Smtp-Source: AGHT+IGsZP6H+91NdmJ6i8soaEWmdRDIYCoyh52OhJZC6bOgqY/X/r4JhNQ6kUaz+Xc1LH/5RJoMXA==
X-Received: by 2002:a5d:4a4a:0:b0:33d:3cf6:a2ca with SMTP id v10-20020a5d4a4a000000b0033d3cf6a2camr361594wrs.30.1708710685868;
        Fri, 23 Feb 2024 09:51:25 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:e8a0:25a6:d4ec:a7ff])
        by smtp.googlemail.com with ESMTPSA id bo10-20020a056000068a00b0033cddadde6esm3711524wrb.80.2024.02.23.09.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:51:25 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 5/6] ASoC: meson: axg-fifo: take continuous rates
Date: Fri, 23 Feb 2024 18:51:11 +0100
Message-ID: <20240223175116.2005407-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240223175116.2005407-1-jbrunet@baylibre.com>
References: <20240223175116.2005407-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_175128_465470_31755D89 
X-CRM114-Status: GOOD (  11.62  )
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

The rate of the stream does not matter for the fifos of the axg family.
Fifos will just push or pull data to/from the DDR according to consumption
or production of the downstream element, which is the DPCM backend.

Drop the rate list and allow continuous rates. The lower and upper rate are
set according what is known to work with the different backends

This allows the PDM input backend to also use continuous rates.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.h  | 2 --
 sound/soc/meson/axg-frddr.c | 8 ++++++--
 sound/soc/meson/axg-toddr.c | 8 ++++++--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index df528e8cb7c9..a14c31eb06d8 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -21,8 +21,6 @@ struct snd_soc_dai_driver;
 struct snd_soc_pcm_runtime;
 
 #define AXG_FIFO_CH_MAX			128
-#define AXG_FIFO_RATES			(SNDRV_PCM_RATE_5512 |		\
-					 SNDRV_PCM_RATE_8000_384000)
 #define AXG_FIFO_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 					 SNDRV_PCM_FMTBIT_S16_LE |	\
 					 SNDRV_PCM_FMTBIT_S20_LE |	\
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 8c166a5f338c..98140f449eb3 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -109,7 +109,9 @@ static struct snd_soc_dai_driver axg_frddr_dai_drv = {
 		.stream_name	= "Playback",
 		.channels_min	= 1,
 		.channels_max	= AXG_FIFO_CH_MAX,
-		.rates		= AXG_FIFO_RATES,
+		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5515,
+		.rate_max	= 384000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_frddr_ops,
@@ -184,7 +186,9 @@ static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
 		.stream_name	= "Playback",
 		.channels_min	= 1,
 		.channels_max	= AXG_FIFO_CH_MAX,
-		.rates		= AXG_FIFO_RATES,
+		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5515,
+		.rate_max	= 384000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_frddr_ops,
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index 1a0be177b8fe..32ee45cce7f8 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -131,7 +131,9 @@ static struct snd_soc_dai_driver axg_toddr_dai_drv = {
 		.stream_name	= "Capture",
 		.channels_min	= 1,
 		.channels_max	= AXG_FIFO_CH_MAX,
-		.rates		= AXG_FIFO_RATES,
+		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5515,
+		.rate_max	= 384000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_toddr_ops,
@@ -226,7 +228,9 @@ static struct snd_soc_dai_driver g12a_toddr_dai_drv = {
 		.stream_name	= "Capture",
 		.channels_min	= 1,
 		.channels_max	= AXG_FIFO_CH_MAX,
-		.rates		= AXG_FIFO_RATES,
+		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rate_min	= 5515,
+		.rate_max	= 384000,
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_toddr_ops,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
