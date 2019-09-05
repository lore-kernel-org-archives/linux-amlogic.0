Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B083C3A5AA
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A4C22CF6
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 12:01:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ilc6DJDl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qVswcN+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4A4C22CF6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kap+jxhxpB+sy0CQCkMu+vlOpZMj85nVcK7me91LO/k=; b=ilc6DJDl7jRimW
	wTqa5NdBvrhBdo9SrgnsnKDAY9/PGYA5UFXpxh/Y2GtAeE2vtrWPtUjrW57gFS5T3dHZYHZJZUW3S
	ViTH21rh52aV6uf0hknfcpiNRPneiG/6Pd8RuOEyidZyrxwzTQ6xpmeaI6wLpEij5j6RHnbRoIlUt
	y4w1WDUydMcbYSo63PPfRLfieUdbNtzLLVOBtuuy78lWLSZoJKZuxtoU897UiNbOMGeeOYGPNONUq
	oVU6Ya6SsVujUJ7eKqfpFXukHQRbx+Nzc9du9YpmK84qiP1Hi1Ypy2Z4HRIWXTkGQhwdvUphzSLI7
	60wtwVrlz5Ms3A/t93HQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5qSY-0008OU-4J; Thu, 05 Sep 2019 12:01:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5qSH-000852-CF
 for linux-amlogic@lists.infradead.org; Thu, 05 Sep 2019 12:01:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id g207so2468121wmg.5
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2019 05:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klSkJhbs0NB+xI0c1ebxNosV7pVJl7beazxfFo4LBZg=;
 b=qVswcN+PucNQH6v4EQigxCZdHKTEzMwj6G2zSXUlL9Q3vyaySUauYMtEwxR5tBfkTX
 Vl/wABaSlML2K61iULZEg9ci45M0aAYXwsUTPRKD55tXQk4EtDd41q/6q033f5nkHvfJ
 +qHF+b/8Kowqxp9iuzSOMwteKYzNFPmUoAVTW0FBnhdvtWeVvCGHIFLNS+b55o5njqS4
 2EVfcQ5qtdUqtDgwR9T7GbXyUujllGe+DCGRPCI9M5s0RC35d/GTQ9b+eHNo/BPRTHAs
 109aM4zFeYs3qeABFt6PzFK8FWOj5EyNdbvW3NeM23Ykr/vHc2xeAA3Q5sFRzOaJ6WV9
 yi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klSkJhbs0NB+xI0c1ebxNosV7pVJl7beazxfFo4LBZg=;
 b=nsP3lv586rICPtVXBQBdWZoMMXUkh2TTIr+nTtkG9QD4X4mxj/aRhBvdNjkEJkYJwx
 0yeeUV6OwWgpZqiRCq53sh4feBfQ9vjDuXiel6PUPSGIPalPqqNJM58dmfRFkfagzLGF
 VVgcfzEclCIlJ1qaVho1xGn7HFfRWq8MZuBNYEJ8lP0Tat9x9nPpPv+dFGa6ZCGGGWhZ
 jZiyaGIljp/AAyX7yOuC0HRW+2I+vwuETjzUAuPhwV5vIvznca9cVlkYIAMuu2MzN8rP
 Cn1pS9rWEIbMv9lnXYZAVQsmDhnsh0Zi/spsQx0S2CMMCn/PBfY4gJUTAYQUSUTwJJYx
 2rxw==
X-Gm-Message-State: APjAAAXsoMyLeOvZKNKULlqHIaVy7i8Z3JVurZTO+pyh1o6oolWoOAXL
 wM+N+rljAf4t0tdFkveBE6FybQ==
X-Google-Smtp-Source: APXvYqzMpRsgyQhdaXkYR6VhupFXcKpJSMlYFG0Sb+nF3uP8ydsPZns1A+Qc1CimphV2UL/tqKaqyQ==
X-Received: by 2002:a1c:2b85:: with SMTP id r127mr2607200wmr.30.1567684896038; 
 Thu, 05 Sep 2019 05:01:36 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a18sm3436311wrh.25.2019.09.05.05.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 05:01:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 8/8] ASoC: meson: tdmout: add sm1 support
Date: Thu,  5 Sep 2019 14:01:20 +0200
Message-Id: <20190905120120.31752-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190905120120.31752-1-jbrunet@baylibre.com>
References: <20190905120120.31752-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_050137_580027_7628A778 
X-CRM114-Status: GOOD (  10.46  )
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
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the sm1, the TDMOUT number of input is extended and the
the gain enable bit moved to accommodate this extension

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdmout.c | 103 ++++++++++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 19 deletions(-)

diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 86537fc0ecb5..418ec314b37d 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -24,6 +24,7 @@
 #define TDMOUT_CTRL1			0x04
 #define  TDMOUT_CTRL1_TYPE_MASK		GENMASK(6, 4)
 #define  TDMOUT_CTRL1_TYPE(x)		((x) << 4)
+#define  SM1_TDMOUT_CTRL1_GAIN_EN	7
 #define  TDMOUT_CTRL1_MSB_POS_MASK	GENMASK(12, 8)
 #define  TDMOUT_CTRL1_MSB_POS(x)	((x) << 8)
 #define  TDMOUT_CTRL1_SEL_SHIFT		24
@@ -51,25 +52,6 @@ static const struct regmap_config axg_tdmout_regmap_cfg = {
 	.max_register	= TDMOUT_MASK_VAL,
 };
 
-static const struct snd_kcontrol_new axg_tdmout_controls[] = {
-	SOC_DOUBLE("Lane 0 Volume", TDMOUT_GAIN0,  0,  8, 255, 0),
-	SOC_DOUBLE("Lane 1 Volume", TDMOUT_GAIN0, 16, 24, 255, 0),
-	SOC_DOUBLE("Lane 2 Volume", TDMOUT_GAIN1,  0,  8, 255, 0),
-	SOC_DOUBLE("Lane 3 Volume", TDMOUT_GAIN1, 16, 24, 255, 0),
-	SOC_SINGLE("Gain Enable Switch", TDMOUT_CTRL1,
-		   TDMOUT_CTRL1_GAIN_EN, 1, 0),
-};
-
-static const char * const tdmout_sel_texts[] = {
-	"IN 0", "IN 1", "IN 2",
-};
-
-static SOC_ENUM_SINGLE_DECL(axg_tdmout_sel_enum, TDMOUT_CTRL1,
-			    TDMOUT_CTRL1_SEL_SHIFT, tdmout_sel_texts);
-
-static const struct snd_kcontrol_new axg_tdmout_in_mux =
-	SOC_DAPM_ENUM("Input Source", axg_tdmout_sel_enum);
-
 static struct snd_soc_dai *
 axg_tdmout_get_be(struct snd_soc_dapm_widget *w)
 {
@@ -197,6 +179,25 @@ static int axg_tdmout_prepare(struct regmap *map,
 	return axg_tdm_formatter_set_channel_masks(map, ts, TDMOUT_MASK0);
 }
 
+static const struct snd_kcontrol_new axg_tdmout_controls[] = {
+	SOC_DOUBLE("Lane 0 Volume", TDMOUT_GAIN0,  0,  8, 255, 0),
+	SOC_DOUBLE("Lane 1 Volume", TDMOUT_GAIN0, 16, 24, 255, 0),
+	SOC_DOUBLE("Lane 2 Volume", TDMOUT_GAIN1,  0,  8, 255, 0),
+	SOC_DOUBLE("Lane 3 Volume", TDMOUT_GAIN1, 16, 24, 255, 0),
+	SOC_SINGLE("Gain Enable Switch", TDMOUT_CTRL1,
+		   TDMOUT_CTRL1_GAIN_EN, 1, 0),
+};
+
+static const char * const axg_tdmout_sel_texts[] = {
+	"IN 0", "IN 1", "IN 2",
+};
+
+static SOC_ENUM_SINGLE_DECL(axg_tdmout_sel_enum, TDMOUT_CTRL1,
+			    TDMOUT_CTRL1_SEL_SHIFT, axg_tdmout_sel_texts);
+
+static const struct snd_kcontrol_new axg_tdmout_in_mux =
+	SOC_DAPM_ENUM("Input Source", axg_tdmout_sel_enum);
+
 static const struct snd_soc_dapm_widget axg_tdmout_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("IN 0", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("IN 1", NULL, 0, SND_SOC_NOPM, 0, 0),
@@ -252,6 +253,67 @@ static const struct axg_tdm_formatter_driver g12a_tdmout_drv = {
 	},
 };
 
+static const struct snd_kcontrol_new sm1_tdmout_controls[] = {
+	SOC_DOUBLE("Lane 0 Volume", TDMOUT_GAIN0,  0,  8, 255, 0),
+	SOC_DOUBLE("Lane 1 Volume", TDMOUT_GAIN0, 16, 24, 255, 0),
+	SOC_DOUBLE("Lane 2 Volume", TDMOUT_GAIN1,  0,  8, 255, 0),
+	SOC_DOUBLE("Lane 3 Volume", TDMOUT_GAIN1, 16, 24, 255, 0),
+	SOC_SINGLE("Gain Enable Switch", TDMOUT_CTRL1,
+		   SM1_TDMOUT_CTRL1_GAIN_EN, 1, 0),
+};
+
+static const char * const sm1_tdmout_sel_texts[] = {
+	"IN 0", "IN 1", "IN 2", "IN 3", "IN 4",
+};
+
+static SOC_ENUM_SINGLE_DECL(sm1_tdmout_sel_enum, TDMOUT_CTRL1,
+			    TDMOUT_CTRL1_SEL_SHIFT, sm1_tdmout_sel_texts);
+
+static const struct snd_kcontrol_new sm1_tdmout_in_mux =
+	SOC_DAPM_ENUM("Input Source", sm1_tdmout_sel_enum);
+
+static const struct snd_soc_dapm_widget sm1_tdmout_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("IN 0", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 1", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 2", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 3", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("IN 4", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_MUX("SRC SEL", SND_SOC_NOPM, 0, 0, &sm1_tdmout_in_mux),
+	SND_SOC_DAPM_PGA_E("ENC", SND_SOC_NOPM, 0, 0, NULL, 0,
+			   axg_tdm_formatter_event,
+			   (SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD)),
+	SND_SOC_DAPM_AIF_OUT("OUT", NULL, 0, SND_SOC_NOPM, 0, 0),
+};
+
+static const struct snd_soc_dapm_route sm1_tdmout_dapm_routes[] = {
+	{ "SRC SEL", "IN 0", "IN 0" },
+	{ "SRC SEL", "IN 1", "IN 1" },
+	{ "SRC SEL", "IN 2", "IN 2" },
+	{ "SRC SEL", "IN 3", "IN 3" },
+	{ "SRC SEL", "IN 4", "IN 4" },
+	{ "ENC", NULL, "SRC SEL" },
+	{ "OUT", NULL, "ENC" },
+};
+
+static const struct snd_soc_component_driver sm1_tdmout_component_drv = {
+	.controls		= sm1_tdmout_controls,
+	.num_controls		= ARRAY_SIZE(sm1_tdmout_controls),
+	.dapm_widgets		= sm1_tdmout_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(sm1_tdmout_dapm_widgets),
+	.dapm_routes		= sm1_tdmout_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(sm1_tdmout_dapm_routes),
+};
+
+static const struct axg_tdm_formatter_driver sm1_tdmout_drv = {
+	.component_drv	= &sm1_tdmout_component_drv,
+	.regmap_cfg	= &axg_tdmout_regmap_cfg,
+	.ops		= &axg_tdmout_ops,
+	.quirks		= &(const struct axg_tdm_formatter_hw) {
+		.invert_sclk = true,
+		.skew_offset = 2,
+	},
+};
+
 static const struct of_device_id axg_tdmout_of_match[] = {
 	{
 		.compatible = "amlogic,axg-tdmout",
@@ -259,6 +321,9 @@ static const struct of_device_id axg_tdmout_of_match[] = {
 	}, {
 		.compatible = "amlogic,g12a-tdmout",
 		.data = &g12a_tdmout_drv,
+	}, {
+		.compatible = "amlogic,sm1-tdmout",
+		.data = &sm1_tdmout_drv,
 	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_tdmout_of_match);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
