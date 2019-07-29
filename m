Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023E7C7618B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 08:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD652070B
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 08:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ox1Iwtcu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MTNriKxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAD652070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6vLlNqxNqKA1gdr45EoMmflB2SWJkFS/t0fOGGC6e8s=; b=Ox1Iwtcu2igpb8
	tK1Mqg2CVSCX6D2ta/3+iz6fZ+lbjxFPq4uurzyLPmuHXXhrmhLHsVkI4asD2e6i0EJS02OYTfAzj
	rKVyPTTlSrgAT55IOyAG7jUptfhCivfAODonssFYAabowGPcchmz/+2O3gNMioO1XJQZVn5oImXfT
	xiq9MXvLLA3q4cXSDIIzrpL1hjICFYmThMFq0V8t/6CJKZ29BVEB7zwJeZQRWcuK8lkzAOzRzhPcp
	WV9hHDq6rKfgpMD4wi+kld4Q2M4eIH017sGJ5Q4dcoto6vOGGmQj3IZXlLmLjV4e8qzrsbjKfMSRg
	xbQ7qFB3IympNy6gGWLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs0br-0003I2-AB; Mon, 29 Jul 2019 08:02:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs0bn-0003HQ-LB
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 08:02:17 +0000
Received: by mail-wr1-x443.google.com with SMTP id f9so60678232wre.12
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 01:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9RA94ICutOEe48WXCPH8Kz/PFpg7/2L2e8y1Aso6Yrg=;
 b=MTNriKxVQBKmei1wel/XbIBlCJK8WQMMHKPY/R+8DD7Vq1DWOv1c1p03soQwYEWuC6
 wDN0boNiENDCEG/tur73v8PTxB5MHU/KgHEJeinhTsC9L48LMY3ptVFTd8HZGN1snVJ0
 RAC1JXik9zm4Vh32++d84mg93S4QM8lS6WWa3PwPZdotjTD+WkIVvv/hXI8UgpOQBAP4
 +HTO9KpM5XX5MF45h1ijxg8+W88UBododOIvtUYi2TpzHPigukzxN5NrrRY7mpf407YK
 0mNb1iNHOcsqp3NkSYIqlcgGRF+fexOs76a19uHu8BfxJWnq+iKWfAlCNmwO0+mmlmnt
 4FQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9RA94ICutOEe48WXCPH8Kz/PFpg7/2L2e8y1Aso6Yrg=;
 b=eBe6D4mCuxZ1yW3Jw9o/P5FkwYGXtsFSmiBpquEb4tGpGDCjAQFZel8WK897kbxJCL
 QOzAXPMqwwKVp5QDI3Hu5TmOiLeFsIgLiqpjuS4UMu6BfIhjS4Go3lBND/fotCkNecWM
 zYhytUv2jgXLOcDylAsI8o1jCAlS9ECMF0OGZSI0RTcW+nqHFy4nLct9AtLQYpj9EkY/
 omXxxGUMIRLW2FwHGs7c95NEf1gyCavhQXDPVw4SuNSgpag43+2eEPh/brubtknl6hDq
 y/fZaotHXQ+p4zgrIdt7zldR07A5D7S6W7ssWkTXMRTr0uttd5bgRYinBRAlY8n2ultZ
 OnKw==
X-Gm-Message-State: APjAAAWnTrB/Zu7shZoxrFLxnohJAsHQnLinx/sZkzIR5Fb4scpivZOs
 Vazw4ogyR3cApfI7JIHN5xWaJA==
X-Google-Smtp-Source: APXvYqwADxrFEOUZ64tv0Wk/f+cSLqtMt/lXaNmVznyzUgfsI7zu68MZijDvv18qher7+QJCrrQplQ==
X-Received: by 2002:adf:f64a:: with SMTP id x10mr16431382wrp.287.1564387334288; 
 Mon, 29 Jul 2019 01:02:14 -0700 (PDT)
Received: from starbuck.baylibre.local
 ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.googlemail.com with ESMTPSA id a2sm62043546wmj.9.2019.07.29.01.02.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 01:02:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] ASoC: meson: g12a-tohdmitx: override codec2codec params
Date: Mon, 29 Jul 2019 10:01:39 +0200
Message-Id: <20190729080139.32068-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_010215_697191_A7A8880D 
X-CRM114-Status: GOOD (  12.58  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

So far, forwarding the hw_params of the input to output relied on the
.hw_params() callback of the cpu side of the codec2codec link to be called
first. This is a bit weak.

Instead, override the stream params of the codec2codec to link to set it up
correctly.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/g12a-tohdmitx.c | 34 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 707ccb192e4c..9943c807ec5d 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -28,7 +28,7 @@
 #define  CTRL0_SPDIF_CLK_SEL		BIT(0)
 
 struct g12a_tohdmitx_input {
-	struct snd_pcm_hw_params params;
+	struct snd_soc_pcm_stream params;
 	unsigned int fmt;
 };
 
@@ -225,26 +225,17 @@ static int g12a_tohdmitx_input_hw_params(struct snd_pcm_substream *substream,
 {
 	struct g12a_tohdmitx_input *data = dai->playback_dma_data;
 
-	/* Save the stream params for the downstream link */
-	memcpy(&data->params, params, sizeof(*params));
+	data->params.rates = snd_pcm_rate_to_rate_bit(params_rate(params));
+	data->params.rate_min = params_rate(params);
+	data->params.rate_max = params_rate(params);
+	data->params.formats = 1 << params_format(params);
+	data->params.channels_min = params_channels(params);
+	data->params.channels_max = params_channels(params);
+	data->params.sig_bits = dai->driver->playback.sig_bits;
 
 	return 0;
 }
 
-static int g12a_tohdmitx_output_hw_params(struct snd_pcm_substream *substream,
-					  struct snd_pcm_hw_params *params,
-					  struct snd_soc_dai *dai)
-{
-	struct g12a_tohdmitx_input *in_data =
-		g12a_tohdmitx_get_input_data(dai->capture_widget);
-
-	if (!in_data)
-		return -ENODEV;
-
-	memcpy(params, &in_data->params, sizeof(*params));
-
-	return 0;
-}
 
 static int g12a_tohdmitx_input_set_fmt(struct snd_soc_dai *dai,
 				       unsigned int fmt)
@@ -266,6 +257,14 @@ static int g12a_tohdmitx_output_startup(struct snd_pcm_substream *substream,
 	if (!in_data)
 		return -ENODEV;
 
+	if (WARN_ON(!rtd->dai_link->params)) {
+		dev_warn(dai->dev, "codec2codec link expected\n");
+		return -EINVAL;
+	}
+
+	/* Replace link params with the input params */
+	rtd->dai_link->params = &in_data->params;
+
 	if (!in_data->fmt)
 		return 0;
 
@@ -278,7 +277,6 @@ static const struct snd_soc_dai_ops g12a_tohdmitx_input_ops = {
 };
 
 static const struct snd_soc_dai_ops g12a_tohdmitx_output_ops = {
-	.hw_params	= g12a_tohdmitx_output_hw_params,
 	.startup	= g12a_tohdmitx_output_startup,
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
