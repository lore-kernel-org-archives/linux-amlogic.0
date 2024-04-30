Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DB6C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Apr 2024 14:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkgaoH3EQDKRzy4l8W4Z1ghfgwbBgrhaF0NF0KMda0Q=; b=kwCByqSA8lqnpG
	ievC7e18YiAXfoy1UsCoKgAzlmRbzuApZ9aomOeJ+xNi2YwT/W5iHaq4typhxz2cUyjvMudF5OR8a
	YRtDPbPVm+46mWS+MsRsUV5vqsUI8mTWo9cMubZoxMnt7NNSZe7rHWsWnbG2Iv6VtcQpBv6hli+7Y
	KV7NP9AtbpxZ6JG22mYOVylZEvfhv5xNknYrgi5yqohEBtdLGLgC3f/crmkYXHeCIK6tbocOYpI/0
	R1ao87rK/Iw4t0XXFoLbKkWlDQBG/QvE/4eatm12rhBbC4k2M/G41Gf6umhae1pbOOa5umDE/u5SE
	BXDE65zBDxktqtis6F0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o6b-00000006fxN-2UQd;
	Tue, 30 Apr 2024 14:05:13 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1o4j-00000006eUl-0FDt
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Apr 2024 14:03:31 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2db13ca0363so91892211fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Apr 2024 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485794; x=1715090594; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlReh/uKfKGykX7vYGkVx56/1oeqm3j6UBVK+Qmhu9k=;
        b=bfw4QW0F/OHhhiVS8plXkUVAdWBR13UHyQ8d1+kkVti3/yzNvWSdlkOdylsW/cs8co
         56zdtGMqIlSe8WrrQcx8ef5nGa3bCGUEWz+AHfzEyAFCuNEK1/unOBmny0C3XvFFTkkq
         YWUawmC3E6uODz/FHShLHzcEC+uAAGaBIVfSmjMNRw8z4MMirVVlDSflKJx+yuD3SnuY
         gqwPTrQqmi5C0Zm7J8mJvkD6rUSSWYK7ANMfPZC/eIfwLlPsCTMeWfI9Qcr886ksb1GA
         qpCC1o1UtGSmooIbyFEiDufQeB4YIPAmKdINJm+iInd5KwKOh2UacshP7IzAho83/+oA
         pzyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485794; x=1715090594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlReh/uKfKGykX7vYGkVx56/1oeqm3j6UBVK+Qmhu9k=;
        b=jOX5piYjSweUOWyfQW2fRcfl1zWjt2gx6OIXl20kd8V52LQM/l1bDwND065qV/Bqa8
         mK0yh7tfF1loOFck6Q08TWUTFgeEz6Q/0gXSRCPRmIomVbnrKdid6ySx5Mfh/5HvU7jD
         ERukNCeXbyilgMjepHp+vXK6pCw8PLOBE2POx+6Dib5ZVBzQT0ivyMksEx+n9gdSY8/T
         7y9asn4v2djhqrNWDRu7dOo/W/+N1S063osJ2tN8aCPruHyrwItR8Qh0XHbe/MUtmL/b
         IFU2yZHCBl6L5WlZgaOhkj9jwZTdeVhM6+Q5ZLHUoVgRsL3liw3kZBJrKAKDzjwJSlMw
         wvhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/6CvSLuvKlxJ01vptej3sQHZRzax6kTdm9lXShUJtwdh5t3iCiHlMZHM2QqX1dvuqmj07KOzSWtsMyally2m0dVpFmNYFy5hEN/nzps+GMbI=
X-Gm-Message-State: AOJu0YxvvzqJKnmlIhpDPO48BgGLWwhOYB8otYedAhdLeh0xXKDVGekK
	QJutDWW8+pc4+oACZPsPHtO64DhQjeiK0Kj1AZbbkdP86Ua+Z/djbhwAvBjeOsU=
X-Google-Smtp-Source: AGHT+IEjPyu9X1615THrmlgihVBnJj6snuJyIqe3VYMH9bOXPEPLADlqYnOlMYNNwswyFzCxSlW3hA==
X-Received: by 2002:a2e:9145:0:b0:2df:b2d5:5935 with SMTP id q5-20020a2e9145000000b002dfb2d55935mr8668895ljg.28.1714485792538;
        Tue, 30 Apr 2024 07:03:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:19 +0200
Subject: [PATCH 10/13] ASoC: mediatek: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Message-Id: <20240430-asoc-snd-substream-clean-v1-10-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13819;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=74+WER8rBVNChp8T011lJzusbjvdwfTeUc05vWQCtnc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn2wIAKWRRmb3f+Eu7E/sNsicAIeRJntuzxZ
 SxYr98J11CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59gAKCRDBN2bmhouD
 1yOiD/9+no2oO2meu/Ufx9CEy3qSO7oTggEWW3FaqAqFcceuY3ZcL6EMZ2biHC/QRNK4ebDskKU
 3O2P3faEC8XJpoITbkbDIiqXeyFCKlF8xXpOUoqJU2b/1DL8tjHLJ65Dg+xoktZHD2NWmNoQiRg
 eIA9zZjygsEGOywLbr00ulna67FOpbcwyo0pYJ3dQYy1TyOTBy9jFGsl8RxPBCcZfhE2P3xy9Op
 3YJQdjnLIEm0nGjkPUwV/mbyv1dB9guABGSShJm5gvvH+W+/cqmtzgzKa5lD3MLc//md1a3Ju+V
 GYH6YWtUfX7QSYdrf2odSjymVm9iBei+GgTtQW9SfPeVHHo17PilaDoe5GVaygZohC2HM2K33n1
 Po5GQ+qHU9/lDaSYbLMh26vyEayDUXnoxPUHaOgSiNZamo6XG6T07CTTJnF0XA0JoNRQd5eyWJs
 BHmwevPcP6/bP/iV9hjNJnOo7ORDuwBCFPhQlH2IgPI/WGR/3ux6Ozr54ngy6kgQ1l8FYVYJ5zm
 lkr1t63qAutgNeS0JPV+5JJfLfhPY0jPjSPT2oOa93zLB79CYb2OCU4CZNxFUoUZ1ICYyxfXdkz
 vSpyKtJNvE/u0Mzrwu0nPoMZhU+mWKpd1utzIbZX8OCoJLTfC5V20Hpv2quS3imeWDvF5BCURTw
 YI43f977A5OcnvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_070317_971070_5612B7BA 
X-CRM114-Status: GOOD (  15.85  )
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

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 14 +++++++-------
 sound/soc/mediatek/mt8186/mt8186-mt6366.c  |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  8 ++++----
 sound/soc/mediatek/mt8188/mt8188-mt6359.c  |  6 +++---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 10 +++++-----
 sound/soc/mediatek/mt8195/mt8195-mt6359.c  |  4 ++--
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index c1c486e275b9..572ded279b53 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -106,7 +106,7 @@ static const struct snd_pcm_hardware mt7986_afe_hardware = {
 static int mt7986_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
@@ -116,7 +116,7 @@ static int mt7986_memif_fs(struct snd_pcm_substream *substream,
 static int mt7986_irq_fs(struct snd_pcm_substream *substream,
 			 unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index bfcfc68ac64d..bafbef96a42d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -40,7 +40,7 @@ static const struct snd_pcm_hardware mt8186_afe_hardware = {
 static int mt8186_fe_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -82,7 +82,7 @@ static int mt8186_fe_startup(struct snd_pcm_substream *substream,
 static void mt8186_fe_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -104,7 +104,7 @@ static int mt8186_fe_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	unsigned int channels = params_channels(params);
@@ -153,7 +153,7 @@ static int mt8186_fe_hw_free(struct snd_pcm_substream *substream,
 static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
@@ -252,7 +252,7 @@ static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 static int mt8186_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -269,7 +269,7 @@ static int mt8186_get_dai_fs(struct mtk_base_afe *afe,
 
 static int mt8186_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -290,7 +290,7 @@ static int mt8186_get_memif_pbuf_size(struct snd_pcm_substream *substream)
 static int mt8186_fe_prepare(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 8fd31c52b077..771d53611c2a 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -297,7 +297,7 @@ static const struct snd_soc_ops mt8186_da7219_i2s_ops = {
 static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 9647fe133dc8..ccb6c1f3adc7 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -91,7 +91,7 @@ int mt8188_afe_fs_timing(unsigned int rate)
 static int mt8188_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = NULL;
 	struct mtk_base_afe *afe = NULL;
 	struct mt8188_afe_private *afe_priv = NULL;
@@ -300,7 +300,7 @@ static int mt8188_afe_enable_cm(struct mtk_base_afe *afe,
 static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -334,7 +334,7 @@ static int mt8188_afe_fe_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
@@ -358,7 +358,7 @@ static int mt8188_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	const struct mt8188_afe_channel_merge *cm = mt8188_afe_found_cm(dai);
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index f629fc6bbb53..eba6f4c445ff 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -557,7 +557,7 @@ enum {
 static int mt8188_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 256;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
@@ -658,7 +658,7 @@ static int mt8188_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_max98390_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int bit_width = params_width(params);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
@@ -821,7 +821,7 @@ static const struct snd_soc_ops mt8188_nau8825_ops = {
 static int mt8188_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 64af9bf363fd..38891d1bd18a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -84,7 +84,7 @@ int mt8195_afe_fs_timing(unsigned int rate)
 static int mt8195_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 			snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -281,7 +281,7 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai,
 				    int enable)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -310,7 +310,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai,
 				   int enable)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -342,7 +342,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -380,7 +380,7 @@ static int mt8195_afe_fe_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 62e4e34cffbb..ca8751190520 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -338,7 +338,7 @@ static const struct snd_soc_ops mt8195_hdmitx_dptx_playback_ops = {
 static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 256,
@@ -394,7 +394,7 @@ static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
