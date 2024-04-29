Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23358C25B10
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2024 11:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EfjjUJu7DDCQpWnyuJmdb45whLsbYkpi3xhN14QnlfE=; b=ZBukE/Orkn1aOm
	BrUG07/VZz0C00u7WPZJ7PEU80k3YMwd4KONPJ4Y+exH0KqNOP1IXJ6W5PtsNiAgUCDQ9Nh6vS026
	oeXeBRJ8dbXKT4OqZlN1qTBXufHlN5BxIGxQ6KquYcmOpiakAUPNHBKm38Ky0ciOe6hntwKVvjbaP
	RgBUYrheEfs5mN/yOg9f8HANQ9BWTS0zOxN5Uz1PP1XPnbaqqDx9TMNl31gxgF5kR9+ATOaWr0J71
	eyCU/Km+hiuQBzq5oo816IOHIWrIIs3cCr2ulvEDzy8auXcL4ssKdM/TaBBRgGN73Caziy48cPS/S
	ElEPHEsyV9qMtLrKsMsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PVq-00000002WPe-1tNe;
	Mon, 29 Apr 2024 11:49:38 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PVQ-00000002W6b-3UwQ
	for linux-amlogic@lists.infradead.org;
	Mon, 29 Apr 2024 11:49:16 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso6525878a12.1
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2024 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714391350; x=1714996150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=jTJ7SZ54EP1sXU0zGjR7FL2Mqf3Ty1bioXbU5YCpXSAQNAURO3ExWEXymRmPRBBYYU
         5eSfoK8WmB3XrVes60l2K6BZTaqA+F9FAQZxzBDOvLpmud6DEAd5md/jjqeoZ6/F8Gou
         oZ7FdSoR5yielvza/C6nfYppyJlCAfcEdR9nTp+0pLhgFTdLNABJKkqjjpDmHV69r7cj
         ZoTuZRQFVZYn+jDoemsHs3pB+k9a5BFM+bgrpWQCdQKN9ygs/gghjo6gpH4zfBqWBFEO
         nx0KHSLnNj7KPKXqTMJIHLxyotdjFwBKtolgQGpaPd1u42RV03EHCMwBl2rUGqNIwdCd
         cZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714391350; x=1714996150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2ZUcqC+torIBGZl2jfKZ8j0WRKINo9TI5z6SJwgmg4=;
        b=ROh5lWuqpDQThQMKRhxiq9OUeL1i1vVbi6TCeykYsxl+Gi29PiHfoXEEId5IjrBXtV
         J45TXBt48wiZtezpd0ekyqnCZbTIp2+BDc/uEMl6nXS1UWi55nShURm6EH1PrBiL8cHC
         Z+7gyHAJmVoJu6ej1ZQWkqfgrPug4GLWN17uVMliU/4+K01nxvG4T4dsNSAZpQK23YNz
         EGTQvCqwWcgZX0mg/s7wiTfR10S8Q88CvDJ+o6o0HtxZyYXBnRLNw7ra3jU0uuCceVOE
         h9av3vcD6M9A2oGRa4Zb35NNVUacZVU8kfzrtJhydRtyJjdaWEseySOaXViCIbWV+DET
         0MFA==
X-Forwarded-Encrypted: i=1; AJvYcCWH2KEiawBzAiZG6rwawIhOVdM00+jrm1l0SIN3cO5c6mvOQasQOvkuJn7avvpu77n0E+AUNoaa0L2HzxLM7Iz1XkPPmAVxgAxGjRZrUr4kn1A=
X-Gm-Message-State: AOJu0YzS5ubPzOsKNHob5R++nOBeOQSsvKJPMhMcco7SQT2UuFudnxyf
	JeUSYUm14MpO+0WpOYIu5+rUZD8DVPwVPKezBscCHIJqfjR946yH/Xyf1jdNXlM=
X-Google-Smtp-Source: AGHT+IG+PpPYt5gJrRGC1b559rFwqcY02Y7afPcoTHrR3gteiPesqjrrRq6V/qr9zfo7soqjuK3G8Q==
X-Received: by 2002:a50:8ac7:0:b0:56e:2452:f867 with SMTP id k7-20020a508ac7000000b0056e2452f867mr4484403edk.37.1714391349889;
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id y43-20020a50bb2e000000b0057000a2cb5bsm13549651ede.18.2024.04.29.04.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 04:49:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 29 Apr 2024 13:48:49 +0200
Subject: [PATCH 4/4] ASoC: uniphier: Constify static snd_pcm_hardware
MIME-Version: 1.0
Message-Id: <20240429-n-asoc-const-snd-pcm-hardware-v1-4-c6ce60989834@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=778;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gich1JRWEld7frP5eaWjzjWGBaaM+RGhkK+WPH3Hgf4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmL4km9txiF1WGA7UWw3CfsFA6VB2MZtNJU+MOU
 FKjqCQu/4qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZi+JJgAKCRDBN2bmhouD
 16ccD/9l4cVT56DbQ4s528ydZBWtzc/oqXGu1ZQbNITz14ONADT4bPlxkanL2O0tMltrVTrFj8N
 yCn7wufeyWdt6hobAeT2jnVzkG4kPP2xuFUJiw0pKpgPViDQYQQvypq31/wxF5wzMSJkrW/UClZ
 bBWRtRqsGDuBrUvJ+KQT4y0YzBjxTyieyo0MR2V6ctFh3XKFCW31u2lJSH7xSxiRcyZCeFVyLlC
 I3C0yBX1ofQrBohBO/sGp1xIkY542Vyyb0oYn2HCEiuCgP+2aJz9Uzd5nzG2D8ifsfCZDe1W2fJ
 BBo+ylftctAuKNbBXptE6DiZ/sueGCmNlIOLx1y4jtFbODWgFIG3M8WIB4tB3LimjuI00JTUfdJ
 EXptaN0tyS1nlKORVjO5N2bDN4aaRB+nVEKlcVvOlSMWicMUHepZnzKDP34A+zXPSaKHDyLHiE6
 IaPAkr6rUUVwEK/bI6iC/VKCp4A9TaeQKOmbab41FPXLFr7kS8Vy1KNyrpgxyPSRSQsSD4KjYPp
 4RUTHpCPh8X6nbbbHv2nUUnpwFIGATLbI2x8gsubcs13KPkg57nn3JNnaNhEcr88Vl/3vU652O5
 7AbhSRpcdk7w/Zb9QhAm45Osql//C85WJu45trFQ7Ntpn15eubGiD1sld2555lrF+y4UGAHWksS
 xblzapxOFjAtX0g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_044913_070236_C5EA912D 
X-CRM114-Status: GOOD (  12.27  )
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
 sound/soc/uniphier/aio-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index fe272befd967..265d61723e99 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -14,7 +14,7 @@
 
 #include "aio.h"
 
-static struct snd_pcm_hardware uniphier_aiodma_hw = {
+static const struct snd_pcm_hardware uniphier_aiodma_hw = {
 	.info = SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID |
 		SNDRV_PCM_INFO_INTERLEAVED,

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
