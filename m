Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3665CDE008
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2026 08:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZHIx4vpJ4l+95VogNZ2qfvNPppK+iyQtshFdw6pqw8M=; b=U8oDHLqQwG3BFN
	intYLmgpM28/19LDuiGQramRcVLaNL8Crfal/obr+N+0e5XH6bejYmqtxlFSWVRU1zNo3szL1pHOV
	JDgLdp1EIt3pGl6xgh0G3bA0OiW7v60C4m5WLaFXz0WpAbNt8v1Ks6AWtffrTycjuT70EC4+XXYHl
	FHamzCMR1FGXKf1r6XzllVpX2+nGNFqVjCQbYNO24HE4QgcW/qhkX9ZXqwUOsrzhRvlwc74xRpb6B
	u8t/CRiT9kALTmKZV+ksYcOXnMFJjUYKf5EVkpzAa2TOE7F3nQiBiFzOgdp/Hi3UQ0VwYfrvDOZeM
	/kRAdpw8rJ+tfMyl4FGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Y8-0000000Akap-24kb;
	Fri, 26 Jun 2026 08:04:32 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Y5-0000000AkZT-3Bkz
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Jun 2026 08:04:31 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so1249960a12.2
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Jun 2026 01:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782461067; x=1783065867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BDlwFSAwx/VUcU/0Zc7YpwR/WtK9Ex0Sk5CLPSAtZY=;
        b=DVmLz0AblE9RIFkt7P6Dnxno9a8IE6xobsa2JxkWsl4O6Qe9YTJhE+OBBHy3e6uN1j
         D2JnRGkTTwGx8zzTaP/W/YU4DXVEdc5lDlMIbyL3j80iFLLu895YcPNyAnskmVCgE7U6
         oqRzrAE51UdAwGdN0v4D/q+NC+hLh45m1G6cJHphPzH/nis76x87sjP7EArWCCzsWqKi
         XD1exg0zdk/hYp4retB7VX0wPkaCyZAsUlSwOGRZWzF6n9EwRTtU0mdBkFXUljDONmKJ
         5i/Mv/hmSlNvGB9kHw39eEeX00TSKoi9TLw5TCkXY5eGzmdj6/ShBba6QuTbM49lJoSE
         5KRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782461067; x=1783065867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BDlwFSAwx/VUcU/0Zc7YpwR/WtK9Ex0Sk5CLPSAtZY=;
        b=lDVTmXC0V5YQJ0m5cXJz7+qDjCdPiaRS3yH+hF2z+U28n2Q0qW4I1GXpAfNx7rCiOQ
         mYXQf/EQzDMu82sd+woTTe/xuVB925OgmZBfOXOF58PGFtYocDub62KxdYqs5Hj6sYMP
         oMdRte7nS01xVP2j5YwQHtSA55adx5h4LfttjJd2jlKnYMQmuA9i+mb0dfhHqq/nTKri
         zkFAC5YWIurJR6ptCh0njrb/nHzUCyzsU43aZa3WvcHzkx49fcQdNc8Rk64p6pIxndEw
         nGdKtXrsslnSRcxqaK05DNGMIiUzkaF69q5ICRHeREp+2SIyrzT72uyP/djHyqXUk8QP
         lvbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGLD80BaWRc3ZgFteHu8BRqPVn525IBpmmepcKc4vonDBBPvACZ/JHyfD8NzwrprKt5YJNoW1cBjVPOTKg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3h6ppZWBrnGbNVkQP9UtYspf1PFSRv1Anp5D5/Ju/25EDVIvS
	lWcfETJBPQIig+KOAzmMIzYNo3wS7y856uH/6AKvIQ44GPUhX/DC41LG
X-Gm-Gg: AfdE7cl+vKAFuxDU23PdU96/C3omaFrBnQpot14kCWgXhViD4SRZdV5YOOp/CDE0Tpk
	3Oby9xtB+3AoMYQvxRc4+SJkeQuiV+ghxogUOpdaJ2/2O5lNrkvjgPzGuvFgYMvGel3kELbq8tf
	C/uOJSU8BK6l/BFZbhZiAlDvoJle+r/EfVpgg8c5jN5PhB3UJb4sVCobF4baB/U+JuBIQwys1hM
	8D98SNEi+5cC5g9c6TMfAtczgXB6WZMruGgJujfra9H+p1LaWLjLa3S7kfpBhXCTXtx2lEZ2sxj
	WFq2jmbd/4dJ2jCZI5DrfLgLYqBG3/AY5tnf4UzS7bbB/Tu+iuKkcoEfab3nWNFHSWnlz2Aecjn
	zhO5ahGrRQDhNfxL+xIEYMXjkkt+YEZq9xXKEzmg3OwNXG3QwC/S0pzhjfB2Szdq00XL/WNCWAw
	PjC1CGYAlfivim8CH6
X-Received: by 2002:a05:6402:3553:b0:698:bbe:9c8 with SMTP id 4fb4d7f45d1cf-69810ae7ec2mr1477123a12.15.1782461066991;
        Fri, 26 Jun 2026 01:04:26 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01c3bsm24027475f8f.10.2026.06.26.01.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:04:26 -0700 (PDT)
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
Subject: [PATCH] ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop
Date: Fri, 26 Jun 2026 08:04:22 +0000
Message-ID: <20260626080422.4191435-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_010429_809032_1DA2D83A 
X-CRM114-Status: GOOD (  10.17  )
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

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 sound/soc/meson/aiu-fifo-spdif.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index e0e00ec026dc..826055a71421 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -24,6 +24,7 @@
 #define AIU_MEM_IEC958_CONTROL_MODE_16BIT	BIT(7)
 #define AIU_MEM_IEC958_CONTROL_MODE_LINEAR	BIT(8)
 #define AIU_MEM_IEC958_BUF_CNTL_INIT		BIT(0)
+#define AIU_RST_SOFT_958_FAST			BIT(2)
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
@@ -68,12 +69,16 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
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
 		fifo_spdif_dcu_enable(component, false);
+		snd_soc_component_write(component, AIU_RST_SOFT,
+					AIU_RST_SOFT_958_FAST);
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
