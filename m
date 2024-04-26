Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575C2C25B5E
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBxp2Ojj1CLP8vMQMd1yPtWVqEkVyp1j8RfpejtjXVI=; b=YhVvxovoedg1PT
	y111KdIUafJNF0G0SEVWgPJaUUX9iYa1iNueFD091mW5wkv7ie2OjNqBF/yrWOyS7cEwQVuKMI/AU
	z0i4fPyEDoYJDXF4k2TI6Cl+YbZIRaF+boCStsX2E1/FyRR4nOlQi2WzLLeLGSATFMhp5ceMhr3R4
	OXt4vbSkdkdz8zp2gA1kfJ0HtYuz9fk0cGN6PDXYvb5clca4ikaq4XR7b4WAL8/bU/77FCCPtsW2R
	lgQykzZYzA75UwUZmOPd0pi6+iocpdrie+7Vp07T5w3F/UYWl5ZErtj3o8BXki/KY7OBloEPw+8O4
	wCJpDyYbgg95s/naB+VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWX-0000000D3IM-19yj;
	Fri, 26 Apr 2024 15:30:05 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWR-0000000D3Do-23WY
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Apr 2024 15:30:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41bab13ca80so2785215e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145398; x=1714750198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bQrmumSWoqJQMi/l6xj2yc8RNYXdlpvWVWdoITuaG8=;
        b=q4Y5Khf1pKoaXG8M+O0hUP3XUTJd4MhbC77hqOxMtYCsrUCbqfMBzfUEbJtpxLr5bo
         c2D9O8x4bQZpRI2sENcuURf3SrXwjQXbmxxUOvEEyg1QkxlpVIwaVxxATBzLejs0bl3r
         inTzAx4CqyTMRXbMBafGfRKzCPhUhK2L/KzxGkb7cdgM00/WcpQTlmqDh1XTtImVjJfN
         d7xrVK59AvoC2VM7dANSnynHRfHvP1/1wBScsYVDlZlCrVgDFIB6pd9OxOIrmfSfVLlQ
         +FP9YZi22DPfGxaLEMoirzAC4zOrsQLuDtIG2xzcDw063SIbQRLmxX9MQGB7EA2RfYyN
         rZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145398; x=1714750198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bQrmumSWoqJQMi/l6xj2yc8RNYXdlpvWVWdoITuaG8=;
        b=BQlXTykAod0/AITt5Slpke8U6bfKbcw8TiYx3cy7t/dw/R48JqzdAZbF1FNzP5fzOP
         RQdq3GHYzj9vc5HTmydOKnkZ3S+QHP8dZqWnbE3MeHYfnv1vDy80lALkiG3mK2wBjinS
         ebM/IgEST7gwNBIYXDBCzB86lXVoUd8rPG8s12bw5qN3bH0wmEgZqIIKaqHLvh02u9fg
         3c2/6nupTgGRiNd5tD5pQXFIPiiigwjG5JDg8UsgEj0kkyaCYphLVtCjiiph4ffWuAFc
         /TsaRFVYF/tPfefJW4lxOjocuJF02jCY8AtPIWr1LRupeadFdH/awAV2mRyliE2l1nwQ
         rQ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVM6iXCuSLxETOTPOeu5HGOxFM2IlodRTLE9opdWk3SBM113Qwq3lfXslEcGmW6FljpaZZA5HaghKwlhamVk7rKujot6xzTBiNxlVbUQ3FfJyk=
X-Gm-Message-State: AOJu0YySIBGTYk9uA3tPJxwszYlC42zDtOlELTbc8anaE5CebI+sv6zF
	FlF5fcI/R2gzccmJSGSoHIm1EVuAl1sHm/NZSh8eaOwtcgnEsen0OAU0QDdOuhM=
X-Google-Smtp-Source: AGHT+IHMerJdt74ThT9W2AwuFt/nqHhB935A349L3A9erdfLScSRYmjfvTF+QLgGqsuEAmQiV3l5MA==
X-Received: by 2002:a05:600c:4f11:b0:419:87ab:f6db with SMTP id l17-20020a05600c4f1100b0041987abf6dbmr2369314wmq.23.1714145398045;
        Fri, 26 Apr 2024 08:29:58 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 4/4] ASoC: meson: axg-tdm: add continuous clock support
Date: Fri, 26 Apr 2024 17:29:41 +0200
Message-ID: <20240426152946.3078805-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_082959_690843_8B21BCFB 
X-CRM114-Status: GOOD (  15.92  )
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

Some devices may need the clocks running, even while paused.
Add support for this use case.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 40 +++++++++++++++++++++++++++++
 sound/soc/meson/axg-tdm-interface.c | 16 +++++++++++-
 sound/soc/meson/axg-tdm.h           |  5 ++++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 63333a2b0a9c..a6579efd3775 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -392,6 +392,46 @@ void axg_tdm_stream_free(struct axg_tdm_stream *ts)
 }
 EXPORT_SYMBOL_GPL(axg_tdm_stream_free);
 
+int axg_tdm_stream_set_cont_clocks(struct axg_tdm_stream *ts,
+				   unsigned int fmt)
+{
+	int ret = 0;
+
+	if (fmt & SND_SOC_DAIFMT_CONT) {
+		/* Clock are already enabled - skipping */
+		if (ts->clk_enabled)
+			return 0;
+
+		ret = clk_prepare_enable(ts->iface->mclk);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(ts->iface->sclk);
+		if (ret)
+			goto err_sclk;
+
+		ret = clk_prepare_enable(ts->iface->lrclk);
+		if (ret)
+			goto err_lrclk;
+
+		ts->clk_enabled = true;
+		return 0;
+	}
+
+	/* Clocks are already disabled - skipping */
+	if (!ts->clk_enabled)
+		return 0;
+
+	clk_disable_unprepare(ts->iface->lrclk);
+err_lrclk:
+	clk_disable_unprepare(ts->iface->sclk);
+err_sclk:
+	clk_disable_unprepare(ts->iface->mclk);
+	ts->clk_enabled = false;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(axg_tdm_stream_set_cont_clocks);
+
 MODULE_DESCRIPTION("Amlogic AXG TDM formatter driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 8bf3735dedaa..62057c71f742 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -309,6 +309,7 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
+	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
 	int ret;
 
 	switch (iface->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -346,7 +347,19 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	return 0;
+	ret = axg_tdm_stream_set_cont_clocks(ts, iface->fmt);
+	if (ret)
+		dev_err(dai->dev, "failed to apply continuous clock setting\n");
+
+	return ret;
+}
+
+static int axg_tdm_iface_hw_free(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+
+	return axg_tdm_stream_set_cont_clocks(ts, 0);
 }
 
 static int axg_tdm_iface_trigger(struct snd_pcm_substream *substream,
@@ -417,6 +430,7 @@ static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
+	.hw_free	= axg_tdm_iface_hw_free,
 	.trigger	= axg_tdm_iface_trigger,
 };
 
diff --git a/sound/soc/meson/axg-tdm.h b/sound/soc/meson/axg-tdm.h
index 42f7470b9a7f..daaca10fec9e 100644
--- a/sound/soc/meson/axg-tdm.h
+++ b/sound/soc/meson/axg-tdm.h
@@ -58,12 +58,17 @@ struct axg_tdm_stream {
 	unsigned int physical_width;
 	u32 *mask;
 	bool ready;
+
+	/* For continuous clock tracking */
+	bool clk_enabled;
 };
 
 struct axg_tdm_stream *axg_tdm_stream_alloc(struct axg_tdm_iface *iface);
 void axg_tdm_stream_free(struct axg_tdm_stream *ts);
 int axg_tdm_stream_start(struct axg_tdm_stream *ts);
 void axg_tdm_stream_stop(struct axg_tdm_stream *ts);
+int axg_tdm_stream_set_cont_clocks(struct axg_tdm_stream *ts,
+				   unsigned int fmt);
 
 static inline int axg_tdm_stream_reset(struct axg_tdm_stream *ts)
 {
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
