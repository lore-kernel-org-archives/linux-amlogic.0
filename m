Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C905AEE14D3
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Sep 2023 09:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cwzv+FSRJnXn+9LcdWJ1MXM87FuZvlePLRunijAKbYw=; b=pM7J7HFv1l2ZeE
	gg8FsjNjThlMDSLF7AkZ6LcR2GWY7FeXdwm0o1hWA0umC5+dVAuMhSEgqKdyvj/95Kj+icvsoqZJ2
	KSRAgi92NTVGKTJ7RrDopCIMTpJkLa+NT6vkBg1ST7QVaA+jKLBxzycFVNbHBJFRRadVDE/cjMWPI
	+YbvKJwMLUV+Aybu6wViImelH3BH2IdzIaBfL9lyP0JMv3V6fJXFMdNA0/fNFKUzxcE1fAOu0QWkv
	gkogwn2n8VWFScj+jxNbVXoqV7xCbIKVRj5Vg1CQ9GO1dv6///bUQce3/OioWU1hWqF0pEakaZf6h
	AApxL8ez8fiINwxMvrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeB18-00Be7K-1R;
	Thu, 07 Sep 2023 09:09:38 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeB15-00Be6u-2t
	for linux-amlogic@lists.infradead.org;
	Thu, 07 Sep 2023 09:09:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-402c1407139so8364495e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 07 Sep 2023 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1694077772; x=1694682572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wBjuRLwnfixpgR2nFPgNkEIBBrq5rco4eC4mU+aZjZI=;
        b=amOROXnlQIZWXECEVKCEu/zCzT8SxM1vRmnkoOAahv9JwUeHP+w3sL90KLghAkdIDE
         Ape8Ow4MpN3MxNjFs8MFasrBiJS0FG4NEBBdIhx8RAN6cPNZ+VtRTv4Pb3P7I78wIg/t
         ODZNdgz3Oyv57eFTOS9zCgZyPAlohvbPubuZSv8C9WJTBIpDFBjMEmQmYPPR+v5SyIFn
         Wd/H4HYWKRpKBZXEFgNceUN4AuTNGmyj5CYh94qZzOAWBbS/8Olrh/sFJRTFyNYHgKx6
         Nz7eG7y5yVIvbbEU1/DvyZnTzqsWARTKKEt3ZL5Xvg/9oxTRf1DfXh0jBMPz8VdmPxNS
         W5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694077772; x=1694682572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wBjuRLwnfixpgR2nFPgNkEIBBrq5rco4eC4mU+aZjZI=;
        b=kmUNX4Eh04LGaMmRLsqsjoy5lsQKGFZAv1UTbE2WGsx4MJKRqMDzZdYXeEHEgkwPgC
         DY/neR+mrpXIWsPlUQM2LhjIWlA8xZ0w/ygmcP79lOSu7mWHKb+/Ln29wcBQrQUJsgVz
         vs3eBG624P19jCU8fIBbyP8uhMekKa2IWeWe8Tf813sDwCGjztjytG4PZNidNmGCRKZR
         z5ahvKTXTx+c2kECVIUoG4Ytuzg06DICavljrASras0ypAH9jX+fduPBLvNFTKZL43JI
         dQRxvJleU6tLG/7K5JrfT5lx2TijzzQERA5nZr9+7hNiqxo3sV+Ca0/aa/jpS4c2Rb1H
         Ypxw==
X-Gm-Message-State: AOJu0Yx20gY+jNPqvdgwtH62MOlXjOU0tzpo00IJp1s1njtLbphy4SNG
	Vsigd2Izlf9M0mHOCSdYO3uHpQ==
X-Google-Smtp-Source: AGHT+IGV9XwlUajdhCdrx5f+9/paKpKd41H2FIS5FzrRu7+e/TPt8scscnliKKvl02o6tIwPYOkB8w==
X-Received: by 2002:a05:600c:11c1:b0:401:b204:3b84 with SMTP id b1-20020a05600c11c100b00401b2043b84mr4240874wmi.40.1694077772184;
        Thu, 07 Sep 2023 02:09:32 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5be9:5575:c6f4:d478])
        by smtp.googlemail.com with ESMTPSA id k8-20020a5d4288000000b003176aa612b1sm22764763wrq.38.2023.09.07.02.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:09:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] ASoC: meson: axg: extend TDM maximum sample rate to 384kHz
Date: Thu,  7 Sep 2023 11:09:10 +0200
Message-Id: <20230907090910.13546-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_020935_952232_BBAC3255 
X-CRM114-Status: GOOD (  11.34  )
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

The TDM HW on the axg SoC families and derivatives actually supports
384kHz sampling rate.

Update the fifo and tdm interface constraints accordingly.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 2 +-
 sound/soc/meson/axg-fifo.h | 2 +-
 sound/soc/meson/axg-tdm.h  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bccfb770b339..2e3d0108179b 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -31,7 +31,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 		 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP),
 	.formats = AXG_FIFO_FORMATS,
 	.rate_min = 5512,
-	.rate_max = 192000,
+	.rate_max = 384000,
 	.channels_min = 1,
 	.channels_max = AXG_FIFO_CH_MAX,
 	.period_bytes_min = AXG_FIFO_BURST,
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index b63acd723c87..df528e8cb7c9 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -22,7 +22,7 @@ struct snd_soc_pcm_runtime;
 
 #define AXG_FIFO_CH_MAX			128
 #define AXG_FIFO_RATES			(SNDRV_PCM_RATE_5512 |		\
-					 SNDRV_PCM_RATE_8000_192000)
+					 SNDRV_PCM_RATE_8000_384000)
 #define AXG_FIFO_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 					 SNDRV_PCM_FMTBIT_S16_LE |	\
 					 SNDRV_PCM_FMTBIT_S20_LE |	\
diff --git a/sound/soc/meson/axg-tdm.h b/sound/soc/meson/axg-tdm.h
index 5774ce0916d4..42f7470b9a7f 100644
--- a/sound/soc/meson/axg-tdm.h
+++ b/sound/soc/meson/axg-tdm.h
@@ -16,7 +16,7 @@
 #define AXG_TDM_NUM_LANES	4
 #define AXG_TDM_CHANNEL_MAX	128
 #define AXG_TDM_RATES		(SNDRV_PCM_RATE_5512 |		\
-				 SNDRV_PCM_RATE_8000_192000)
+				 SNDRV_PCM_RATE_8000_384000)
 #define AXG_TDM_FORMATS		(SNDRV_PCM_FMTBIT_S8 |		\
 				 SNDRV_PCM_FMTBIT_S16_LE |	\
 				 SNDRV_PCM_FMTBIT_S20_LE |	\
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
