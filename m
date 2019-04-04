Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675DBC10F0C
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:18:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3716C20855
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 11:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oAZrxUni";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VRqVwD9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3716C20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxFXJ+eky423GraCLzlpO8nM2JMdPP2chY0WkEaux/8=; b=oAZrxUnil5Q+pg
	Tp5Hy4EPDVytaPpo8L1k6I4DMkTGoxZJgbHRUhTDbXwH/yBQy9IHouywpZnH0rvBdL+OnF205y+ZD
	uKtBUcTSIqUmJ9Ctzu7i7BifQggOQex90R1RfTSSXgyqTla6zdXySYvQqIM1o8xAHmqWheY0XkpXG
	QhPeVNDAgzf0wpQ+O0UA/lsICNFFxD9A3mMZmbZnvzYE2ab1DZY0vCEy/u146FvjUBJqvZ+z7+px5
	zFua2WbmIbHI0fIaUr4sTU14pr+WfeAIRV0FbP+zbp6PqvPYZ/bgRHlJYo36qxb1BqaDg2DNHospt
	9Hgj37vN/9BDRar3RnhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC0NW-00047S-C2; Thu, 04 Apr 2019 11:17:54 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC0NS-00042c-Oc
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 11:17:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id y13so3289915wrd.3
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a6/aPiwJImd9Yf/1x3AIYjuPQVGbfZJWmEdQdmDDJF0=;
 b=VRqVwD9nClMKS7AuQzKp0WArnEbQFPjoNZHdzPHpfZZFO3L5+kIU6oPiGjOJr0lKeb
 vxncXZ34Mh2qYMBw9qnh1seFFNZh5zdfJFbG6jtiY0BTRAYqB7EbNNdp/+dgiiF7ABZt
 3bJXYGNOZ7d8wELHUF0zkGbqbe4eLl9v8IvdUl+wNVnEDxvzXFmXFy+MWVWJ2sbB4XBq
 p/qv/uowgNqb7SdhODjUgEH3YKhZOKIztwG7aj3y3cnUMX31ZbUgzTCl3v9716OE3Vih
 kcq+ZoXh1o6ODfwBwygNiiJA93GYOoroln1K0BQuFvr28UTdCN0/03P+M/lTThByjkfd
 wV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a6/aPiwJImd9Yf/1x3AIYjuPQVGbfZJWmEdQdmDDJF0=;
 b=Apu22IOzYEoXO7y03VFWcBGWvQuSa69xFcJpW0wviEszprjSZCu20C8+RdR0u472cf
 NSJ+EIZFbDqWfQI/sP81RB+3LFMyyXzYjvI4ZFLhmhTdWlhxr/q2dZ3y2uf+A/kvT44y
 J5E8OsUn1apZGyaVh1ggafyMJyPyLhwQz86R5mVv3qaNOpGO0PA0gy0GDdSO3tvcmxRl
 m8x0GBX/JMJcRI5SG8tkjeWu+nFBe6shBFvj/qbG5ulsOsH3fmTeBI7QjERL4DzDek6T
 RMK0KE5jw9L3KhZwzHW6+8Ae0WWL+pCbwUjDxLmB4md13zYwvmI05W9dE51JkB8qePJk
 LjpA==
X-Gm-Message-State: APjAAAXS2CjyzxGrXFWBlXU82ZRXjIXam1gEOGMq+9LtmPvfkv6V944u
 K+mNK2UWa4I39gyT4rELhpWqlw==
X-Google-Smtp-Source: APXvYqyxYyIWaab5D/nHFIJDQ2z89oQ+IwLtJIlddCZXih0YR7wgWU6Hal97JQ1RGzmAuCtTO11KCw==
X-Received: by 2002:a5d:684e:: with SMTP id o14mr3974350wrw.138.1554376669312; 
 Thu, 04 Apr 2019 04:17:49 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id z23sm9024771wma.0.2019.04.04.04.17.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 04:17:48 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 3/6] ASoC: meson: axg-toddr: add g12a support
Date: Thu,  4 Apr 2019 13:17:30 +0200
Message-Id: <20190404111733.28705-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404111733.28705-1-jbrunet@baylibre.com>
References: <20190404111733.28705-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_041751_056015_10B57936 
X-CRM114-Status: GOOD (  10.86  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Since the g12a SoC fifo can set the fifo initial start address, we must
make sure to actually reset the write pointer to this address when
starting a capture.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-toddr.c | 53 +++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index 0e9ca3882ae5..4f63e434fad4 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -24,6 +24,7 @@
 #define CTRL0_TODDR_MSB_POS(x)		((x) << 8)
 #define CTRL0_TODDR_LSB_POS_MASK	GENMASK(7, 3)
 #define CTRL0_TODDR_LSB_POS(x)		((x) << 3)
+#define CTRL1_TODDR_FORCE_FINISH	BIT(25)
 
 #define TODDR_MSB_POS	31
 
@@ -33,6 +34,22 @@ static int axg_toddr_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	return axg_fifo_pcm_new(rtd, SNDRV_PCM_STREAM_CAPTURE);
 }
 
+static int g12a_toddr_dai_prepare(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
+
+	/* Reset the write pointer to the FIFO_INIT_ADDR */
+	regmap_update_bits(fifo->map, FIFO_CTRL1,
+			   CTRL1_TODDR_FORCE_FINISH, 0);
+	regmap_update_bits(fifo->map, FIFO_CTRL1,
+			   CTRL1_TODDR_FORCE_FINISH, CTRL1_TODDR_FORCE_FINISH);
+	regmap_update_bits(fifo->map, FIFO_CTRL1,
+			   CTRL1_TODDR_FORCE_FINISH, 0);
+
+	return 0;
+}
+
 static int axg_toddr_dai_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
@@ -172,10 +189,46 @@ static const struct axg_fifo_match_data axg_toddr_match_data = {
 	.dai_drv	= &axg_toddr_dai_drv
 };
 
+static const struct snd_soc_dai_ops g12a_toddr_ops = {
+	.prepare	= g12a_toddr_dai_prepare,
+	.hw_params	= axg_toddr_dai_hw_params,
+	.startup	= axg_toddr_dai_startup,
+	.shutdown	= axg_toddr_dai_shutdown,
+};
+
+static struct snd_soc_dai_driver g12a_toddr_dai_drv = {
+	.name = "TODDR",
+	.capture = {
+		.stream_name	= "Capture",
+		.channels_min	= 1,
+		.channels_max	= AXG_FIFO_CH_MAX,
+		.rates		= AXG_FIFO_RATES,
+		.formats	= AXG_FIFO_FORMATS,
+	},
+	.ops		= &g12a_toddr_ops,
+	.pcm_new	= axg_toddr_pcm_new,
+};
+
+static const struct snd_soc_component_driver g12a_toddr_component_drv = {
+	.dapm_widgets		= axg_toddr_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(axg_toddr_dapm_widgets),
+	.dapm_routes		= axg_toddr_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(axg_toddr_dapm_routes),
+	.ops			= &g12a_fifo_pcm_ops
+};
+
+static const struct axg_fifo_match_data g12a_toddr_match_data = {
+	.component_drv	= &g12a_toddr_component_drv,
+	.dai_drv	= &g12a_toddr_dai_drv
+};
+
 static const struct of_device_id axg_toddr_of_match[] = {
 	{
 		.compatible = "amlogic,axg-toddr",
 		.data = &axg_toddr_match_data,
+	}, {
+		.compatible = "amlogic,g12a-toddr",
+		.data = &g12a_toddr_match_data,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_toddr_of_match);
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
