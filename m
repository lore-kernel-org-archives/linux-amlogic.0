Return-Path: <SRS0=88k6=SH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F044C10F0F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 02:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F69E2171F
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 02:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ofSRHsNE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="Np87D4Fc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F69E2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=V7NcdQ/LXjGekwyzjM8TjXjdoUXRwsKciCHSx71dP8M=; b=ofS
	RHsNEfPy5+e+g43BocFCPTUUD1q+uXwk6ufAn4rPgwhEm3VnP5hOfE9xqV+41Ki2Vd4Q1BvmRYYs2
	ZfMS/cdAYCmIGGdwRh+AGKA4a3oSkBVZsU3pgaQa3Wr8YcurQGxiFPNceTCmalzWdbHHwA18V9UJX
	xrdgQtiKQN9srm7PGELm4m4vtNWLGbUBWCAIXlO/VA9EEcushoJlzXT4ObijK/bH8vq4j6CU4T4dz
	9UzzAePXs0KaojQQ90q+b5sWo7LXw8U1U8DdXsCMslITS5vzZ+TipcppQt1DGti9uDALLUWZBqnpz
	XTE2G2YHKKW/0lxFa4BcAktYaMMRp0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCEp8-0006YT-1X; Fri, 05 Apr 2019 02:43:22 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCEp3-0006X0-FJ
 for linux-amlogic@lists.infradead.org; Fri, 05 Apr 2019 02:43:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=UyKj5DlMfcls5nBkL9KbxAAag0y7F3T0VEfF3xYYWbo=; b=Np87D4Fc8e66
 MMajCdr/lNARdBc8DEWLA8tePEmW+uh7VMbKv2sx09cokNDHpbHXqi15dhYU4nhR/3QFN/PM96x7O
 5lXk1cA+nEXTFr0Zr8B4bPVeK3h0J4vCKinUSxbbdmkllA69g2EFgfuAe9y+8jSmO4TPKOsUQOnTW
 wkq7M=;
Received: from [147.50.13.10] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hCEoy-0005EI-Ac; Fri, 05 Apr 2019 02:43:12 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id E0EA0441D3C; Fri,  5 Apr 2019 09:43:08 +0700 (+07)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: axg-tdm-formatter: rework quirks settings" to
 the asoc tree
In-Reply-To: <20190404111733.28705-6-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190405024308.E0EA0441D3C@finisterre.ee.mobilebroadband>
Date: Fri,  5 Apr 2019 09:43:08 +0700 (+07)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_194317_660678_0030324B 
X-CRM114-Status: GOOD (  15.43  )
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
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: axg-tdm-formatter: rework quirks settings

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From f01bc67f58fde599b48d2dde5d0f48dccd84c4f1 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 4 Apr 2019 13:17:32 +0200
Subject: [PATCH] ASoC: meson: axg-tdm-formatter: rework quirks settings

The g12a tdmout requires a different signal skew offset than the axg.
With this change, the skew offset is added as a parameter of the tdm
formatters to prepare the addition of the g12a support.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-tdm-formatter.c |  6 ++++--
 sound/soc/meson/axg-tdm-formatter.h | 11 +++++++++--
 sound/soc/meson/axg-tdmin.c         | 16 +++++++++++-----
 sound/soc/meson/axg-tdmout.c        | 16 +++++++++++-----
 4 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 43e390f9358a..0c6cce5c5773 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -68,7 +68,7 @@ EXPORT_SYMBOL_GPL(axg_tdm_formatter_set_channel_masks);
 static int axg_tdm_formatter_enable(struct axg_tdm_formatter *formatter)
 {
 	struct axg_tdm_stream *ts = formatter->stream;
-	bool invert = formatter->drv->invert_sclk;
+	bool invert = formatter->drv->quirks->invert_sclk;
 	int ret;
 
 	/* Do nothing if the formatter is already enabled */
@@ -85,7 +85,9 @@ static int axg_tdm_formatter_enable(struct axg_tdm_formatter *formatter)
 		return ret;
 
 	/* Setup the stream parameter in the formatter */
-	ret = formatter->drv->ops->prepare(formatter->map, formatter->stream);
+	ret = formatter->drv->ops->prepare(formatter->map,
+					   formatter->drv->quirks,
+					   formatter->stream);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/axg-tdm-formatter.h b/sound/soc/meson/axg-tdm-formatter.h
index cf947caf3cb1..9ef98e955cb2 100644
--- a/sound/soc/meson/axg-tdm-formatter.h
+++ b/sound/soc/meson/axg-tdm-formatter.h
@@ -14,18 +14,25 @@ struct regmap;
 struct snd_soc_dapm_widget;
 struct snd_kcontrol;
 
+struct axg_tdm_formatter_hw {
+	unsigned int skew_offset;
+	bool invert_sclk;
+};
+
 struct axg_tdm_formatter_ops {
 	struct axg_tdm_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
 	void (*enable)(struct regmap *map);
 	void (*disable)(struct regmap *map);
-	int (*prepare)(struct regmap *map, struct axg_tdm_stream *ts);
+	int (*prepare)(struct regmap *map,
+		       const struct axg_tdm_formatter_hw *quirks,
+		       struct axg_tdm_stream *ts);
 };
 
 struct axg_tdm_formatter_driver {
 	const struct snd_soc_component_driver *component_drv;
 	const struct regmap_config *regmap_cfg;
 	const struct axg_tdm_formatter_ops *ops;
-	bool invert_sclk;
+	const struct axg_tdm_formatter_hw *quirks;
 };
 
 int axg_tdm_formatter_set_channel_masks(struct regmap *map,
diff --git a/sound/soc/meson/axg-tdmin.c b/sound/soc/meson/axg-tdmin.c
index bbac44c81688..a790f925a4ef 100644
--- a/sound/soc/meson/axg-tdmin.c
+++ b/sound/soc/meson/axg-tdmin.c
@@ -107,21 +107,22 @@ static void axg_tdmin_disable(struct regmap *map)
 	regmap_update_bits(map, TDMIN_CTRL, TDMIN_CTRL_ENABLE, 0);
 }
 
-static int axg_tdmin_prepare(struct regmap *map, struct axg_tdm_stream *ts)
+static int axg_tdmin_prepare(struct regmap *map,
+			     const struct axg_tdm_formatter_hw *quirks,
+			     struct axg_tdm_stream *ts)
 {
-	unsigned int val = 0;
+	unsigned int val, skew = quirks->skew_offset;
 
 	/* Set stream skew */
 	switch (ts->iface->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 	case SND_SOC_DAIFMT_DSP_A:
-		val |= TDMIN_CTRL_IN_BIT_SKEW(3);
+		skew += 1;
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_DSP_B:
-		val = TDMIN_CTRL_IN_BIT_SKEW(2);
 		break;
 
 	default:
@@ -130,6 +131,8 @@ static int axg_tdmin_prepare(struct regmap *map, struct axg_tdm_stream *ts)
 		return -EINVAL;
 	}
 
+	val = TDMIN_CTRL_IN_BIT_SKEW(skew);
+
 	/* Set stream format mode */
 	switch (ts->iface->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -204,7 +207,10 @@ static const struct axg_tdm_formatter_driver axg_tdmin_drv = {
 	.component_drv	= &axg_tdmin_component_drv,
 	.regmap_cfg	= &axg_tdmin_regmap_cfg,
 	.ops		= &axg_tdmin_ops,
-	.invert_sclk	= false,
+	.quirks		= &(const struct axg_tdm_formatter_hw) {
+		.invert_sclk	= false,
+		.skew_offset	= 2,
+	},
 };
 
 static const struct of_device_id axg_tdmin_of_match[] = {
diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index f73368ee1088..3984818e2a7c 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -124,21 +124,22 @@ static void axg_tdmout_disable(struct regmap *map)
 	regmap_update_bits(map, TDMOUT_CTRL0, TDMOUT_CTRL0_ENABLE, 0);
 }
 
-static int axg_tdmout_prepare(struct regmap *map, struct axg_tdm_stream *ts)
+static int axg_tdmout_prepare(struct regmap *map,
+			      const struct axg_tdm_formatter_hw *quirks,
+			      struct axg_tdm_stream *ts)
 {
-	unsigned int val = 0;
+	unsigned int val, skew = quirks->skew_offset;
 
 	/* Set the stream skew */
 	switch (ts->iface->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 	case SND_SOC_DAIFMT_DSP_A:
-		val |= TDMOUT_CTRL0_INIT_BITNUM(1);
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
 	case SND_SOC_DAIFMT_RIGHT_J:
 	case SND_SOC_DAIFMT_DSP_B:
-		val |= TDMOUT_CTRL0_INIT_BITNUM(2);
+		skew += 1;
 		break;
 
 	default:
@@ -147,6 +148,8 @@ static int axg_tdmout_prepare(struct regmap *map, struct axg_tdm_stream *ts)
 		return -EINVAL;
 	}
 
+	val = TDMOUT_CTRL0_INIT_BITNUM(skew);
+
 	/* Set the slot width */
 	val |= TDMOUT_CTRL0_BITNUM(ts->iface->slot_width - 1);
 
@@ -234,7 +237,10 @@ static const struct axg_tdm_formatter_driver axg_tdmout_drv = {
 	.component_drv	= &axg_tdmout_component_drv,
 	.regmap_cfg	= &axg_tdmout_regmap_cfg,
 	.ops		= &axg_tdmout_ops,
-	.invert_sclk	= true,
+	.quirks		= &(const struct axg_tdm_formatter_hw) {
+		.invert_sclk = true,
+		.skew_offset = 1,
+	},
 };
 
 static const struct of_device_id axg_tdmout_of_match[] = {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
