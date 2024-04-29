Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F549C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2024 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9NDoCYaJYDf6FUtcRXWc9FvivmsnwUdlY+fDS843ig=; b=mwmDM4aw5wMwfE
	LdOUpeZetwtul55e7DmUQH37QslWrNVU/gifxdLa7PC1VQPBZHAGWDyyQZPfZo4D+cJKPfo7AELcQ
	TudUsqLnTwWRHBgzozr17cXgs1AzW2sUrlVwGLrOhlW15beP5F273YRk2Ti8P0YTnUST6Po17efKn
	Ti32q37Q5J2mSdX/Xqz2ZlV5uBLASBs0SMeZXFsGvBkqTfxG3HvGRX+5fjDvzUTi6vWQPsjC2MH7y
	BLhSNNNHh6Hq4qPL7eluqBkj9wOCbl7Gh8oh65llyAc7mgh3tL3P0+kOZmdkYSTx8DAJtqXpXV5qO
	YDn7OTYurW+aJeb6tDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PVc-00000002WFq-36yA;
	Mon, 29 Apr 2024 11:49:24 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PVN-00000002W4q-44YY
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Apr 2024 11:49:12 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5708d8beec6so5360055a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2024 04:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391345; x=1714996145; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2TryCs7KoAc+knf+2Iegg4aToZXu71FrGOJZxalZRo=;
        b=vZFniBcbT8ikpA0uBXpQudVjAYCrUIVLR9Hnisd7cqDD3FGAN00CpB+wbTqCoXlshU
         cnD1UXVbdgNPaz1oE6Ny8mp1LhpHYuErZqvvg+DGlHqcwf8xMSDn7BU/ssCDCPpqExyA
         /OzYvsjJbIc4QnCFfL1ObceDbnawK0C263VPKopzgzBn0vQ/zJUMBDmFUxGTQ0MuSiMf
         MJ9nHhTDqN5XaJo3zwGKMTqZ5584lLxu1rEviiCXbXNoWPir29jIQzPpZv5y3ydzsa3Q
         620reiT+X7IbCdM3nsp1ZvWSyecK5YmUQFoM5M5bWGvVRdLO4wBKjDj4uM2a1XHis2AZ
         25/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391345; x=1714996145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2TryCs7KoAc+knf+2Iegg4aToZXu71FrGOJZxalZRo=;
        b=SLD4yQB/APPG2dZBPG4GW0eb/3ZS5EE/VEOk/6dmbZ38xS+wbmNEzHAUUS8KrIvXxM
         Rm2nak8HycoRBLX1CXI7M1ql5banDHHtz/KlkvmIjzNyKpyvzEumOlev4VQjg+h0BFVu
         sWyNMmnzS1GXmXZlhYAMhpbpX7/OoICMXTCw3HVz3aQvQvqXD2xTl4ibVjoW0kRz+rEA
         na5zIwDft94mMK9lrUDAjjNcg5G5dJvNybq55YQPH1T3mOe+WfX6VhfE6AcvGZogXzmw
         9aVWd9CB/ca9AqxCnK7kWpOJ3vJlf2+IOXz9SdESNf0KxoKNQbD56S6nyjMvTF72WKUq
         1UNA==
X-Forwarded-Encrypted: i=1; AJvYcCWEVHuDdP8Lmi65vMRU8Evdw93MBtph8f+SCmdNy9YoOm/Uib6DHccWMdX9IIYxRZPxOFLVTWORoFC5UmQXeD1hglkF87s3FXwTSY6gjgm8CAs=
X-Gm-Message-State: AOJu0YwDSgU9c1WWCbsQnXLyrW6vQGgNwdBMtu7BjNSNfm+S3YWeaf/J
	KfgKE0zsNlhLSq4pVMMgpMtPfBOyjHnbWWczkOxCTmPMXB5NxTmahMcGVu3L5qs=
X-Google-Smtp-Source: AGHT+IE7Wa1uhxiwDIcwEN93hp17bsG0rm9iXFrpgirDNmmGz9BzEYEL+4mFW282MhhBjXekfPbkUA==
X-Received: by 2002:a50:c34d:0:b0:572:4e6b:958 with SMTP id q13-20020a50c34d000000b005724e6b0958mr8878245edb.2.1714391338535;
        Mon, 29 Apr 2024 04:48:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:48:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:46 +0200
Subject: [PATCH 1/4] ASoC: qcom: Constify static snd_pcm_hardware
MIME-Version: 1.0
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-1-c6ce60989834@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L+z19Mflj6dbjsuY/oyg7M2Nl7bx7birqfaMqqiWFh4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4kjQtqus+caDsWogKmeSbNLXw+geB1/pDh6h
 zr4LbfsFbuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JIwAKCRDBN2bmhouD
 14b0D/0V8sY+FV/qujbJc2MZicjp6syHrzotc7cYVvSeV+dkb439YYh+NaGaaqpeJUxjyJb2iwN
 g80bspO9f4x8zDrj33iaDX6i3PTrzUfqIdX9sdjRVTV3Fr4uwKC3aCbsFa2Vxiv17HN44sBJGNk
 xcWehLqO4B7ywwZItmOd80D5xro3XPgXNLdKOH0MdqlZklYl6hO+1xNLiPfWpip/W612624D8iQ
 9cP+3JFtg/WOs8bs1pw19ck/erjsxcK5agwdvb8/PBDqzGw+thqtLTiyhfNYkK84HIQRMnr/HAB
 zZ2imnBm+Sq/JYviHRnhDisoAwtJIMJjkKz5LVikIN/ZncgetLX/XtHcabi9PUe8u1UVTlQI35t
 p8N0ddiiugWxBSwUqeB0l/oUYVGD25BM7rw6FvLyxGRRbq6wNHIF2FM5L+CvTbf4Cjj7en2yqIe
 YAmbAszVP1IJinxReJfTLotoI8eOEInUmx5Oi6/RtoiA8PrGDx91vg9sv8+GHiPKwyUq86gzY56
 lnNPaYQ7rkZ3xUUxNfiaxz3bU/Xfdd5mCFC9bVihIo/K+xYvtE7VpBIULyS/kS+qAUaKjOPuTWS
 nSbxB6Ep7ZaUfi/J8Le0Job8rTy/m6gU/Q+TRR6KLg0Fp6FzUP4wqvblu8wCjozXsnk7ZvM43r7
 Qo+Ozchtl/HeR4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_044910_063086_8497A0B0 
X-CRM114-Status: GOOD (  13.41  )
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
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 sound/soc/qcom/qdsp6/q6asm-dai.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 00bbd291be5c..3c78440a2f0f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -85,7 +85,7 @@ struct q6apm_dai_data {
 	long long sid;
 };
 
-static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
+static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
@@ -104,7 +104,7 @@ static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.fifo_size =            0,
 };
 
-static struct snd_pcm_hardware q6apm_dai_hardware_playback = {
+static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index aeb6a9d479ab..3913706ccdc5 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -103,7 +103,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
 	.fifo_size =            0,
 };
 
-static struct snd_pcm_hardware q6asm_dai_hardware_playback = {
+static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BATCH |
 				SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				SNDRV_PCM_INFO_MMAP_VALID |

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
