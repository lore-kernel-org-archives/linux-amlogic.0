Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F88C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2024 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZNMPPYQuk5yLp0KYisLU9S93gkJYk8vgtvj0zTnAjc=; b=xQzS5k5V4CviXv
	N5/zGWyxaXMliDNR1MyYao1kahr4PZPCSdO3mpM3F7P4LJChlPBaVyGOw8T0uWzI4tK7KIFo59so2
	H+2po5/2g5ydnevTdCrUGb/byX3bmwyz7FqAj34PR5dFQXmA7Jgb8Ep8hpysEoBUG/T22RsYs9srA
	02UfAsln83NIqy2tydzWBbLfs3i1ubM/vp1T6/KFH+/CNZy8PXQ6oz7lbLTircHxUzyCJCKsvttLx
	VtKSm9iqZpHPj0ycZcMaoMS/ZUSffqYI2DAVa1ARzX+sL/x9zWTQa57tEH61kT4OlsaMiu445QF8X
	SQVYVyO0mQrx1dJSFcqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PVi-00000002WJz-19fG;
	Mon, 29 Apr 2024 11:49:30 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PVO-00000002W5B-3VP1
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Apr 2024 11:49:13 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-56e1f3462caso5487694a12.3
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391348; x=1714996148; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFY2BJrqfoEw33ApHVjLKezetKZA4dvDEs7pqAJegiw=;
        b=XZe3Zs3wb+JY7P5h6LZbcLBt0yQkIsRWi5hXdijz6p/Vzp2Nk9CSviEWwh1LvzWeYP
         JxY8TCGdvY/piAg/VdTar5pMY6rlcdp5M56JXgB0q/paLZufOtQhNAqPF/FPKg4CGMAM
         AJ89uwR7od2AQl5EHSdJ2zQuQKGwb5Uc6nybcbiCp+cx+z1u0XwsnH7EOWWV2+tPQpsN
         IVrGEbzzzMFpQuuAvcxDyM3di+LquQK8M+z482gsyKYc2yarlJn+2f76Dq4Zlx7PUb6w
         k900hif+aqLxTcRXZIGQtiVKKbDmGmqP2HSlOLUYoBaa7nd/rn+HlSUmto366LtsooKr
         o49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391348; x=1714996148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFY2BJrqfoEw33ApHVjLKezetKZA4dvDEs7pqAJegiw=;
        b=hbcMVzJN+wdGgCZdr9RlTFG5139bmz3kEtjOAAx1fd3v8aaUFHsIrnHIls8v7Wd7il
         VfgcF32Rqf4S4kPnZ7u2VKcU5snPCRgb8qYmDi8+nX1CWMwoSqV/d7jowHwfMNirqjNX
         i3PPlZ0MK9XsRtrE5fFUBEHumKUaUsxPbCl1h4U1lDSFpfZfizrhi2cZ+UqADIxNcVUH
         aKcY1kjLMj1sX8jOFzLtd0vOelwEKlkluGwplh1iGLpRMV4NhUN/J71glSOGElfhizMO
         YtvDMzJP+1DEm40EWxVMI95pEOyVVpTGjKc6xfgV1jPCVx5WSt5bGKoUJnYbP+i5N4M/
         +a3A==
X-Forwarded-Encrypted: i=1; AJvYcCUNzO215wfEBgo/mnuUafC3gqblAc7bsIFx4r+GNqFt7WK79TNVWTpHfscAzzA425VRIAXKl8F2UHYwerB6hxGSUCnyVKDIb7tvt75+kGBLlB4=
X-Gm-Message-State: AOJu0Yz8+3Jxsf9Si9UoQaUwMNEwC6zXWAvpiWBZvrDerSmCM3IAQDJ4
	KWN8d36leiT+G6qMCq6URMOhWLHLSTVfBwyNYx/+Ai7Dn+2cjWzYnGVq9H905Yw=
X-Google-Smtp-Source: AGHT+IHr1i+P/yQq8bNC4hXAKz0hI9Zk8EupFlwsHF2uyxSdfVH1X92jPdRxN/6FjGHLuxgVDiSE9g==
X-Received: by 2002:a05:6402:1a4d:b0:572:8aab:4420 with SMTP id bf13-20020a0564021a4d00b005728aab4420mr504841edb.39.1714391348231;
        Mon, 29 Apr 2024 04:49:08 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:48 +0200
Subject: [PATCH 3/4] ASoC: meson: Constify static snd_pcm_hardware
MIME-Version: 1.0
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-3-c6ce60989834@linaro.org>
References: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
In-Reply-To: <20240429-n-asoc-const-snd-pcm-hardware-v1-0-c6ce60989834@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=siprCfRQtWpQCCCk/EgBvG4/nMgpZ/i2CNSROadlb+k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4klip7kMQMnb9G4Un51jC6C4Sy6sBF7+x0fz
 ZtOzlrSQNqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJQAKCRDBN2bmhouD
 1zwfD/oCx8UsThy03fZQjvfzPPcHgd0sRjY0kzWjofPTFWoZrVbUl44+srODgATNkHSmXju076H
 /8V0+7FBomIBsrL/34jm+W7Ws2vae7j5TdY5WuquXO2P6hR5pry/+g8stMlQ0a09eWKWwOTUvuP
 09V4EzktH6rje90J1+lyxp9U0H0ROUA7LVYvj/uipaB/xhKtMk8CIuMIhpmkwPBBLfK11iXpjLk
 E2RvbOBGvGQd81MNYefDVd9DRbqfqcuLEmqjm/9yx7fLKq/A0AmAYbBQr66grnffuPOmoQD0Brz
 448EDhEzJcawBxb1rCp46MqUN8IYEMZMLsXXCkcpJIdJzUYeQunzaZp0Neu+haV/pZc02pOr3qN
 uEzMnAOOP0ZVoPyPOvWaJ19G/tlxIvOmLxPuG9WktTK3F5n5Kn0GaxpWvLth5zXWj+OITLwkfZo
 Ki3HsUbdVtdhPM3Vx4gW6BHI5l3UzxqQK3slZQnatydFdONKuXuKKIa0uNvspzVB+Jes2wZoKE8
 Bg05N8617xn/CcWWHYg/Rheq+bxja9iY5ZXhfmpUAQLsyebOXkfmxY8DB891GxnCFDOuuUtipbA
 xZDgKdZ6MAMWj2eZYZCzPwcML4hWxnH6sG4b8Ep0QD2u46DE4BM/yuRcaanbojeZz3UktdT8/ou
 SUnWJYvw0bJJVAw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_044911_097085_A39D9DDB 
X-CRM114-Status: GOOD (  13.91  )
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

Static 'struct snd_pcm_hardware' is not modified by the driver and its
copy is passed to the core, so it can be made const for increased code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/meson/aiu-fifo-i2s.c   | 2 +-
 sound/soc/meson/aiu-fifo-spdif.c | 2 +-
 sound/soc/meson/aiu-fifo.h       | 2 +-
 sound/soc/meson/axg-fifo.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index 7d833500c799..eccbc16b293a 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -25,7 +25,7 @@
 
 #define AIU_FIFO_I2S_BLOCK		256
 
-static struct snd_pcm_hardware fifo_i2s_pcm = {
+static const struct snd_pcm_hardware fifo_i2s_pcm = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index fa91f3c53fa4..e0e00ec026dc 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -27,7 +27,7 @@
 
 #define AIU_FIFO_SPDIF_BLOCK			8
 
-static struct snd_pcm_hardware fifo_spdif_pcm = {
+static const struct snd_pcm_hardware fifo_spdif_pcm = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
diff --git a/sound/soc/meson/aiu-fifo.h b/sound/soc/meson/aiu-fifo.h
index 42ce266677cc..84ab4577815a 100644
--- a/sound/soc/meson/aiu-fifo.h
+++ b/sound/soc/meson/aiu-fifo.h
@@ -18,7 +18,7 @@ struct snd_pcm_hw_params;
 struct platform_device;
 
 struct aiu_fifo {
-	struct snd_pcm_hardware *pcm;
+	const struct snd_pcm_hardware *pcm;
 	unsigned int mem_offset;
 	unsigned int fifo_block;
 	struct clk *pclk;
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bebee0ca8e38..633fd971b444 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -23,7 +23,7 @@
  * These differences are handled in the respective DAI drivers
  */
 
-static struct snd_pcm_hardware axg_fifo_hw = {
+static const struct snd_pcm_hardware axg_fifo_hw = {
 	.info = (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
