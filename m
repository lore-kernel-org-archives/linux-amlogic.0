Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95B6C47409
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FF5D218AC
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HMG4hd1F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ELeYHi5y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FF5D218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ki6/eyXabowvDGVTU4FoAvBJqcnsN30n0qIsSHP42c=; b=HMG4hd1FB8ghdl
	txNQAe6ClAQvyWfK/exWmN6L7DjS/yCuIPArVktJB13AMELT/4oEZ5xzbcxdPBYZm+SgDVMPKvAcU
	ja70klcVPBj50dN+z1ISzJWZRP+06G1bHxz8+Y+4nKxOtWUhPMixPEhTCfUEza+DdRb2a0aDpZSOJ
	h6OURUL3+mORo6UdL6NxllfI4BQWaVwrsV/owhnPioH3h4YLVerxmyQNnAYI9k+CbUUXOfHbM/m0O
	TGp+7HahRvzeNkhZzmkukk4VtWjr2giZABKlhsCegyCScJJ+ar4uGewadxjfE2jr0it+E8x+PwJwi
	8Ws+PF7Irf1HvKVqjBMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihd3o-0008JN-LK; Wed, 18 Dec 2019 17:24:32 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihd3k-0008Ge-QV
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 17:24:30 +0000
Received: by mail-wm1-x343.google.com with SMTP id a5so2687692wmb.0
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 09:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=60aP4DflHtE4hw6pi+F8g20w+nVNv8AfPUSyKiwSy7M=;
 b=ELeYHi5yna5gupIWb5DwW4LmgYH9P/3mMxgpzW1oMcJKQTsAQZFrLJOJ2/zGHsskC1
 WRh6gbsUnkEV5e+xH44nvlHARyprgsib0ltK1UyyObj1gciZqzMqEXSIORHTYqtAYvcW
 myj+cc9/OVD/uMgBdSpvXWP8n9pXnDKidXsUzPHSTbSF737doFzlHv7rcKs5RfpcHnMT
 xzhWf/M22Od/PVPp0zulcq19H82tT4adR7rJ3Y26d7crwmPjV2dmtQpEyPVmTGbhMPRv
 DH1kd5fqNN/wlAKnaXrpkyNSBLwy5KWOg+LIAR2uDDc3e6UIfdGmkm7NA5txfcoDsOB6
 YUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=60aP4DflHtE4hw6pi+F8g20w+nVNv8AfPUSyKiwSy7M=;
 b=S6AEU57Uun55ghawcPL4lcy34a/JcDniQFUu7nXyhA1wWN2QvMj77MPsXb2gANcsS0
 DJ+HHqCmAlL+8Ry8pGNhuoIqrNxFetACENNEm3eWAFFyTg8Q7nVCCvvGppXmkYCdrkAq
 fL1FW3AceaOj0iiUP6zrnND0kOnX4LqcPtQuThIu8NdD3f4HUqqWMOFIndmucY1k+Xs4
 30B1eHzJlqHOqOr1cQwJMmTaUfduj0/FyQ3HfIHE9yBkjafvxThKgGWiN7fGnh10U2qo
 a68K9WI3PeJtkc4sAAfs0AEHgFGfdPNNihD/RrlqQfgmS6QCKBY+sCyLsUt9UOGfCWkD
 827A==
X-Gm-Message-State: APjAAAVOagg1bq0u/5SGK6MHYeVj8ya9dnlXC9DomAOA/ZzHsbiwIXAv
 Rj6DIGUeiaQ4cQqbsY2EwwKIzw==
X-Google-Smtp-Source: APXvYqxLyHrLorNOHAe8b1ZgYm5HdlUM0fLM+WwDt1/0cfK5vOQIkABEGIaZtDxd0T/evxFe78Eqfw==
X-Received: by 2002:a05:600c:141:: with SMTP id
 w1mr4435278wmm.61.1576689867113; 
 Wed, 18 Dec 2019 09:24:27 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 4sm2883231wmg.22.2019.12.18.09.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:24:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 1/4] ASoC: meson: axg-fifo: fix fifo threshold setup
Date: Wed, 18 Dec 2019 18:24:17 +0100
Message-Id: <20191218172420.1199117-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218172420.1199117-1-jbrunet@baylibre.com>
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_092428_887695_1CC32C52 
X-CRM114-Status: GOOD (  17.43  )
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Alden DSouza <aldend@google.com>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On TODDR sm1, the fifo threshold register field is slightly different
compared to the other SoCs. This leads to the fifo A being flushed to
memory every 8kB. If the period is smaller than that, several periods
are pushed to memory and notified at once. This is not ideal.

Fix the register field update. With this, the fifos are flushed every
128B. We could still do better, like adapt the threshold depending on
the period size, but at least it consistent across the different
SoC/fifos

Fixes: 5ac825c3d85e ("ASoC: meson: axg-toddr: add sm1 support")
Reported-by: Alden DSouza <aldend@google.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c  | 27 +++++++++++++++++++++++++--
 sound/soc/meson/axg-fifo.h  |  6 ++++--
 sound/soc/meson/axg-frddr.c | 24 ++++++++++++------------
 sound/soc/meson/axg-toddr.c | 21 +++++++++------------
 4 files changed, 50 insertions(+), 28 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 772eda857019..4365086c9a31 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -113,8 +113,10 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = ss->runtime;
 	struct axg_fifo *fifo = axg_fifo_data(ss);
+	unsigned int burst_num, period, threshold;
 	dma_addr_t end_ptr;
-	unsigned int burst_num;
+
+	period = params_period_bytes(params);
 
 	/* Setup dma memory pointers */
 	end_ptr = runtime->dma_addr + runtime->dma_bytes - AXG_FIFO_BURST;
@@ -122,9 +124,25 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	regmap_write(fifo->map, FIFO_FINISH_ADDR, end_ptr);
 
 	/* Setup interrupt periodicity */
-	burst_num = params_period_bytes(params) / AXG_FIFO_BURST;
+	burst_num = period / AXG_FIFO_BURST;
 	regmap_write(fifo->map, FIFO_INT_ADDR, burst_num);
 
+	/*
+	 * Start the fifo request on the smallest of the following:
+	 * - Half the fifo size
+	 * - Half the period size
+	 */
+	threshold = min(period / 2,
+			(unsigned int)AXG_FIFO_MIN_DEPTH / 2);
+
+	/*
+	 * With the threshold in bytes, register value is:
+	 * V = (threshold / burst) - 1
+	 */
+	threshold /= AXG_FIFO_BURST;
+	regmap_field_write(fifo->field_threshold,
+			   threshold ? threshold - 1 : 0);
+
 	/* Enable block count irq */
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
 			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT),
@@ -347,6 +365,11 @@ int axg_fifo_probe(struct platform_device *pdev)
 		return fifo->irq;
 	}
 
+	fifo->field_threshold =
+		devm_regmap_field_alloc(dev, fifo->map, data->field_threshold);
+	if (IS_ERR(fifo->field_threshold))
+		return PTR_ERR(fifo->field_threshold);
+
 	return devm_snd_soc_register_component(dev, data->component_drv,
 					       data->dai_drv, 1);
 }
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index cf928d43b558..c442195ba191 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -9,7 +9,9 @@
 
 struct clk;
 struct platform_device;
+struct reg_field;
 struct regmap;
+struct regmap_field;
 struct reset_control;
 
 struct snd_soc_component_driver;
@@ -50,8 +52,6 @@ struct snd_soc_pcm_runtime;
 #define  CTRL1_STATUS2_SEL_MASK		GENMASK(11, 8)
 #define  CTRL1_STATUS2_SEL(x)		((x) << 8)
 #define   STATUS2_SEL_DDR_READ		0
-#define  CTRL1_THRESHOLD_MASK		GENMASK(23, 16)
-#define  CTRL1_THRESHOLD(x)		((x) << 16)
 #define  CTRL1_FRDDR_DEPTH_MASK		GENMASK(31, 24)
 #define  CTRL1_FRDDR_DEPTH(x)		((x) << 24)
 #define FIFO_START_ADDR			0x08
@@ -67,12 +67,14 @@ struct axg_fifo {
 	struct regmap *map;
 	struct clk *pclk;
 	struct reset_control *arb;
+	struct regmap_field *field_threshold;
 	int irq;
 };
 
 struct axg_fifo_match_data {
 	const struct snd_soc_component_driver *component_drv;
 	struct snd_soc_dai_driver *dai_drv;
+	struct reg_field field_threshold;
 };
 
 int axg_fifo_pcm_open(struct snd_soc_component *component,
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 0a7d41257a38..df104303351f 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -50,7 +50,7 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
-	unsigned int fifo_depth, fifo_threshold;
+	unsigned int fifo_depth;
 	int ret;
 
 	/* Enable pclk to access registers and clock the fifo ip */
@@ -68,11 +68,8 @@ static int axg_frddr_dai_startup(struct snd_pcm_substream *substream,
 	 * Depth and threshold are zero based.
 	 */
 	fifo_depth = AXG_FIFO_MIN_CNT - 1;
-	fifo_threshold = (AXG_FIFO_MIN_CNT / 2) - 1;
-	regmap_update_bits(fifo->map, FIFO_CTRL1,
-			   CTRL1_FRDDR_DEPTH_MASK | CTRL1_THRESHOLD_MASK,
-			   CTRL1_FRDDR_DEPTH(fifo_depth) |
-			   CTRL1_THRESHOLD(fifo_threshold));
+	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_FRDDR_DEPTH_MASK,
+			   CTRL1_FRDDR_DEPTH(fifo_depth));
 
 	return 0;
 }
@@ -158,8 +155,9 @@ static const struct snd_soc_component_driver axg_frddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data axg_frddr_match_data = {
-	.component_drv	= &axg_frddr_component_drv,
-	.dai_drv	= &axg_frddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &axg_frddr_component_drv,
+	.dai_drv		= &axg_frddr_dai_drv
 };
 
 static const struct snd_soc_dai_ops g12a_frddr_ops = {
@@ -281,8 +279,9 @@ static const struct snd_soc_component_driver g12a_frddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data g12a_frddr_match_data = {
-	.component_drv	= &g12a_frddr_component_drv,
-	.dai_drv	= &g12a_frddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &g12a_frddr_component_drv,
+	.dai_drv		= &g12a_frddr_dai_drv
 };
 
 /* On SM1, the output selection in on CTRL2 */
@@ -350,8 +349,9 @@ static const struct snd_soc_component_driver sm1_frddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data sm1_frddr_match_data = {
-	.component_drv	= &sm1_frddr_component_drv,
-	.dai_drv	= &g12a_frddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &sm1_frddr_component_drv,
+	.dai_drv		= &g12a_frddr_dai_drv
 };
 
 static const struct of_device_id axg_frddr_of_match[] = {
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index f6023397c8fe..e711abcf8c12 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -89,7 +89,6 @@ static int axg_toddr_dai_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
 	struct axg_fifo *fifo = snd_soc_dai_get_drvdata(dai);
-	unsigned int fifo_threshold;
 	int ret;
 
 	/* Enable pclk to access registers and clock the fifo ip */
@@ -107,11 +106,6 @@ static int axg_toddr_dai_startup(struct snd_pcm_substream *substream,
 	/* Apply single buffer mode to the interface */
 	regmap_update_bits(fifo->map, FIFO_CTRL0, CTRL0_TODDR_PP_MODE, 0);
 
-	/* TODDR does not have a configurable fifo depth */
-	fifo_threshold = AXG_FIFO_MIN_CNT - 1;
-	regmap_update_bits(fifo->map, FIFO_CTRL1, CTRL1_THRESHOLD_MASK,
-			   CTRL1_THRESHOLD(fifo_threshold));
-
 	return 0;
 }
 
@@ -190,8 +184,9 @@ static const struct snd_soc_component_driver axg_toddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data axg_toddr_match_data = {
-	.component_drv	= &axg_toddr_component_drv,
-	.dai_drv	= &axg_toddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &axg_toddr_component_drv,
+	.dai_drv		= &axg_toddr_dai_drv
 };
 
 static const struct snd_soc_dai_ops g12a_toddr_ops = {
@@ -228,8 +223,9 @@ static const struct snd_soc_component_driver g12a_toddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data g12a_toddr_match_data = {
-	.component_drv	= &g12a_toddr_component_drv,
-	.dai_drv	= &g12a_toddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 16, 23),
+	.component_drv		= &g12a_toddr_component_drv,
+	.dai_drv		= &g12a_toddr_dai_drv
 };
 
 static const char * const sm1_toddr_sel_texts[] = {
@@ -297,8 +293,9 @@ static const struct snd_soc_component_driver sm1_toddr_component_drv = {
 };
 
 static const struct axg_fifo_match_data sm1_toddr_match_data = {
-	.component_drv	= &sm1_toddr_component_drv,
-	.dai_drv	= &g12a_toddr_dai_drv
+	.field_threshold	= REG_FIELD(FIFO_CTRL1, 12, 23),
+	.component_drv		= &sm1_toddr_component_drv,
+	.dai_drv		= &g12a_toddr_dai_drv
 };
 
 static const struct of_device_id axg_toddr_of_match[] = {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
