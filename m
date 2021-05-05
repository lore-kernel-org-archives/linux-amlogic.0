Return-Path: <SRS0=Pv2c=KA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD8EC433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:26:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE59613BA
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE59613BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oRXHJ3zvqis8N7mQVK3XrFjiWKAzwSFRtcfsYqGbb90=; b=YdOgcs7ASd1xr1DvgdwutGz1R
	Az9iOnsJEKxjF1e73jcom1qzRDwGB/zAuaOfSwBLTYkG9IRWhcJg/I8z2LOqIDiCCSu+sgDL82kuJ
	MW2oHW6TOvNNJ/ONDiJU637d/Zl7hIklvUf5/A7feDXx6IZtnBxlGrLy6lXdoWJMBP098RolGQBiF
	kQK50X6TqTg77HSxKJb3Hw8Cfq/yS9WS7jM2RL6G8SQQ2bR9QPsyr82q514a04i/wrr98mFrSbXno
	b6LeUNMlzmYh40ofVV7jOvNEHTIx6ItUfR4wZWt9TLjzKmb0IsZsFnqc5r06md1NFmkvgScfVbX61
	HMXyichTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leBvi-000SeB-Rm; Wed, 05 May 2021 07:26:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBvH-000SaF-Bw
 for linux-amlogic@desiato.infradead.org; Wed, 05 May 2021 07:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YCrW3/5AvHEnhbzTyyrYlllXK49rm8kLoKILH5tN+Gs=; b=HvhxipR48djZaZl6ZFTe8Zal/c
 kJf1b7BsqCbTZm0vMD7VipBXV17eg+JAy1h+Rk/NorLiec6HhDrtAH3iql11iTqQPivdNNoXIqYtj
 L1dNjJpw+y/RPpKg2uXUALKUUMIqHOpqsSgULwjGhRsTqlzNtk6eemUClEGwesIOVwiZumJklnGq+
 7Vjh56rC4EQvDDvSrEDivj3XQA62ziZXHR/CTbg1G/jxyJWIybGDmFUqzRiM69DKC46iy7daMzvIe
 m3irMSsTmIS1iZvLSSx4vOheB1NMWjcbuD5lMgkpc1RQ5VnAIki5QUaRPGD+EFfhU8DHxGCNTi7GW
 DSyVPNeQ==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBvC-004Wrq-Ss
 for linux-amlogic@lists.infradead.org; Wed, 05 May 2021 07:26:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 o26-20020a1c4d1a0000b0290146e1feccdaso2470213wmh.0
 for <linux-amlogic@lists.infradead.org>; Wed, 05 May 2021 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCrW3/5AvHEnhbzTyyrYlllXK49rm8kLoKILH5tN+Gs=;
 b=1PGfjongXusORlnDBJw2N9MSMZmSSL/5X/FxB60TKStLfHWuWxIm+5xSYySpn618g9
 99P0DzcQZ6oseXj/vPjUa/gpDI3KFfj/iwHg4l/LVf8g/03qz0OyVPWBVHyI8LqmUzZK
 J0b3cEpMJLy+nkdwad19OSVjuUU6ZAMqN/bMXdA6lRFgtYjyFHjKw8S6+cKrfUnNmBCe
 ZCpflGl8MuutFUvloFQc8RWwO4HIn5r4YWS+6J9E8YnbLmnqzkLQ2DLdMlEA1yokRM0K
 23LjoBKg3/emNP5uqjdX69K8AH7aYwQtVIjTfaZ0yln7TVoFOpGveZkGRTBxiHQzwsVo
 /HvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YCrW3/5AvHEnhbzTyyrYlllXK49rm8kLoKILH5tN+Gs=;
 b=ZTio3JoIvhhnt4loMR0mYiHOQ2H3v+lVVzwD5iJx5h8GaNpxfJuEEwNoQyy99+zMRK
 Cvq6rmdO6Hy7DgAneJqZI8cin5/0lWaqfHBxglzgsXP/75+HZHG96S6QZOyCYT4DSnq/
 gfXHMkI2Gi8egeAln/atz2lJ7CpMyv0huCEAk6HPqjNAlmK3CKxZNEHV9N+mLm8XsxWc
 JHndA4DQxjnpVCUD8Eg1NHyVyHZoWYDgwjFqLBIjyTTJDb43j5AaJ9U40aeZh4wXXrDK
 r4eOiYJzLLMWKsRkEeS2oXs+1X0V3m/z7aftCuyfHQF+yy1fZRBaAY11B7ppoIjvizpx
 hEiA==
X-Gm-Message-State: AOAM531gX015PEseZDIIUAc0C6xUDshKeVLSPaOSFuZPVeDQZ/qNYje8
 +Rd+6b0QwnL3KvEY8JkHSvRj0A==
X-Google-Smtp-Source: ABdhPJwWtjXc8BsVPfIc+B+/4I749a+blCfYThzhnf6vVq6wIU0T5qSxxSmSRm7u4kSAwcfVQAugug==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr31469968wmc.41.1620199573415; 
 Wed, 05 May 2021 00:26:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id
 f25sm19008991wrd.67.2021.05.05.00.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 00:26:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/2] ASoC: meson: g12a-toacodec: use regmap fields to
 prepare SM1 support
Date: Wed,  5 May 2021 09:26:05 +0200
Message-Id: <20210505072607.3815442-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505072607.3815442-1-narmstrong@baylibre.com>
References: <20210505072607.3815442-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_002614_957595_B50F2215 
X-CRM114-Status: GOOD (  17.30  )
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

Switch usage to regmap field for bits handled by the g12a_toacodec_mux_put_enum()
function to avoid uselesss code duplication when adding SM1 variant support.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 sound/soc/meson/g12a-toacodec.c | 80 +++++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 18 deletions(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 9339fabccb79..2084c9542c9c 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -21,17 +21,31 @@
 
 #define TOACODEC_CTRL0			0x0
 #define  CTRL0_ENABLE_SHIFT		31
-#define  CTRL0_DAT_SEL_SHIFT		14
-#define  CTRL0_DAT_SEL			(0x3 << CTRL0_DAT_SEL_SHIFT)
+#define  CTRL0_DAT_SEL_MSB		15
+#define  CTRL0_DAT_SEL_LSB		14
 #define  CTRL0_LANE_SEL			12
-#define  CTRL0_LRCLK_SEL		GENMASK(9, 8)
+#define  CTRL0_LRCLK_SEL_MSB		9
+#define  CTRL0_LRCLK_SEL_LSB		8
 #define  CTRL0_BLK_CAP_INV		BIT(7)
 #define  CTRL0_BCLK_O_INV		BIT(6)
-#define  CTRL0_BCLK_SEL			GENMASK(5, 4)
+#define  CTRL0_BCLK_SEL_MSB		5
+#define  CTRL0_BCLK_SEL_LSB		4
 #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
 
 #define TOACODEC_OUT_CHMAX		2
 
+struct g12a_toacodec {
+	struct regmap_field *field_dat_sel;
+	struct regmap_field *field_lrclk_sel;
+	struct regmap_field *field_bclk_sel;
+};
+
+struct g12a_toacodec_match_data {
+	struct reg_field field_dat_sel;
+	struct reg_field field_lrclk_sel;
+	struct reg_field field_bclk_sel;
+};
+
 static const char * const g12a_toacodec_mux_texts[] = {
 	"I2S A", "I2S B", "I2S C",
 };
@@ -41,29 +55,24 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_kcontrol_component(kcontrol);
+	struct g12a_toacodec *priv = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_dapm_kcontrol_dapm(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	unsigned int mux, changed;
+	unsigned int mux, reg;
 
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
-	changed = snd_soc_component_test_bits(component, e->reg,
-					      CTRL0_DAT_SEL,
-					      FIELD_PREP(CTRL0_DAT_SEL, mux));
+	regmap_field_read(priv->field_dat_sel, &reg);
 
-	if (!changed)
+	if (mux == reg)
 		return 0;
 
 	/* Force disconnect of the mux while updating */
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
 
-	snd_soc_component_update_bits(component, e->reg,
-				      CTRL0_DAT_SEL |
-				      CTRL0_LRCLK_SEL |
-				      CTRL0_BCLK_SEL,
-				      FIELD_PREP(CTRL0_DAT_SEL, mux) |
-				      FIELD_PREP(CTRL0_LRCLK_SEL, mux) |
-				      FIELD_PREP(CTRL0_BCLK_SEL, mux));
+	regmap_field_write(priv->field_dat_sel, mux);
+	regmap_field_write(priv->field_lrclk_sel, mux);
+	regmap_field_write(priv->field_bclk_sel, mux);
 
 	/*
 	 * FIXME:
@@ -86,7 +95,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
-			    CTRL0_DAT_SEL_SHIFT,
+			    CTRL0_DAT_SEL_LSB,
 			    g12a_toacodec_mux_texts);
 
 static const struct snd_kcontrol_new g12a_toacodec_mux =
@@ -205,19 +214,42 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
 	.reg_stride	= 4,
 };
 
+static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_LSB, CTRL0_DAT_SEL_MSB),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_LSB, CTRL0_LRCLK_SEL_MSB),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_MSB),
+};
+
 static const struct of_device_id g12a_toacodec_of_match[] = {
-	{ .compatible = "amlogic,g12a-toacodec", },
+	{
+		.compatible = "amlogic,g12a-toacodec",
+		.data = &g12a_toacodec_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
 
 static int g12a_toacodec_probe(struct platform_device *pdev)
 {
+	const struct g12a_toacodec_match_data *data;
 	struct device *dev = &pdev->dev;
+	struct g12a_toacodec *priv;
 	void __iomem *regs;
 	struct regmap *map;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data) {
+		dev_err(dev, "failed to match device\n");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
 	ret = device_reset(dev);
 	if (ret)
 		return ret;
@@ -233,6 +265,18 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
 		return PTR_ERR(map);
 	}
 
+	priv->field_dat_sel = devm_regmap_field_alloc(dev, map, data->field_dat_sel);
+	if (IS_ERR(priv->field_dat_sel))
+		return PTR_ERR(priv->field_dat_sel);
+
+	priv->field_lrclk_sel = devm_regmap_field_alloc(dev, map, data->field_lrclk_sel);
+	if (IS_ERR(priv->field_lrclk_sel))
+		return PTR_ERR(priv->field_lrclk_sel);
+
+	priv->field_bclk_sel = devm_regmap_field_alloc(dev, map, data->field_bclk_sel);
+	if (IS_ERR(priv->field_bclk_sel))
+		return PTR_ERR(priv->field_bclk_sel);
+
 	return devm_snd_soc_register_component(dev,
 			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
 			ARRAY_SIZE(g12a_toacodec_dai_drv));
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
