Return-Path: <SRS0=CWO1=KG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13CDC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 11:54:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 465D661207
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 11:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 465D661207
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zqxSesj/US5210fZhosac6TicmvHi2Vl6SGWQYx/DhU=; b=Exfxi5l3CP99M6GgfEbkheZqX
	4bF604mOn5D3BlSLZAzteVR0lnq/bA6bi1t5qTbZ7HeWB4I/U/EqhyQaM47qEKcDR31sC6S9a1Czr
	cp3U7LttbkqzBIdYEJBhtm+bBj2Pczg8qPXNj0xbWE2SVlsSmjCp1KrqPYUCdcn3lvFFrZJJG/X5b
	/N4s+jA/zFvDzjZjgE9Yg9C5MiNGVJGKowEMoifhnPYW2qpfVSGIcApZAaCvlNzgrTPuch5Xwoadb
	wyaGj7XjuhHpBfp1RJP1JPnZ8cOzZ2Yk1/T0sOOvL2c1g24h6VW6RtytlBTV0pJfTVYfaPk3EYhqY
	1kzA8JOfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgQxy-00HEek-AB; Tue, 11 May 2021 11:54:22 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgN8E-00GXcW-Sd
 for linux-amlogic@desiato.infradead.org; Tue, 11 May 2021 07:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7g8Gfa9xyHh47lvJTBT+tD4A12Y3UkIifRHEqnQaxPA=; b=iYALzc9xorIjZlkofECleHuaf3
 SkehBkKf/iFOtp2M5dAHRB9RHoi1UPP7PiVohUmh7OVfN+9lW+xszSgEF0QM1eBkvAiDfpE8xwlpn
 4zwJZvf29x9asffuoKjWzGmoOwEFFg34wo+4htgJK7nkxGSU6OL6kW99dTBjQRatWZc0Ud9Jr6dap
 5RzUhEOxj49SnVheJWP1Lh/Z1seVyyBzGvWyBM8+/HZ1DMthMycg6ngg9XtaO/tKiR48mDzsA37Bp
 pzZIG7V74oaq0KmPCKTtfyUMTxayg+UVd6ODsUXPcDVSMj+MJnXf6j60hTJf4qD6X24jJmCt4bJCj
 ZrXLWPzQ==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgN8A-009N86-OB
 for linux-amlogic@lists.infradead.org; Tue, 11 May 2021 07:48:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id n2so19149666wrm.0
 for <linux-amlogic@lists.infradead.org>; Tue, 11 May 2021 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7g8Gfa9xyHh47lvJTBT+tD4A12Y3UkIifRHEqnQaxPA=;
 b=VC7IKoZR1gWLfT/kJ5xgmt4z8ccPwAB5kHfQhD0wGQ1k1aGom8nkvprl2NOlYXY3GG
 oGQv5kpH0gMtMCiDIDJHAeNdwTuKBXVIBMzVZymaCLfniLXgyoEB7MGQ7yfioPpCeGdl
 xyYvRgPLS2Xz0rS8FE1RvU6Q4xfMi3v97TkKwz9n9v0ZE1zs4BKrnCL1xvGwIZXaBLmN
 q+mnWTgGQS1K/WGZM9e6E/1SKZNDJvgch/UT6MiumqY9EtzMwzVzp3bEWbENfBeFSF1P
 w7Mtm5tEe71HV90BrRDuHHxODhq0uP0YnKZwSlCI8d00P8hpjNdxvEepNXGkDJy7/78+
 dVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7g8Gfa9xyHh47lvJTBT+tD4A12Y3UkIifRHEqnQaxPA=;
 b=QMDtCWYSRWApdv8cTQyBj8Tx5EsU2E9ZyctaVRaHRA0asUTo39NZjUYS41kSQVKhNX
 hfvrpI48GfV3QC5oK/oepC+QqdGWTYIVtsSH4hGxYOCaSINuxTG2gkLHX8wRo8NcpfKl
 OKSzgysyV7Yd4hcc66uByqFgFmtOPYa19kD5SmAW42LJwtrgaubLWOZIl+nKReeUtOt0
 lEaegM9s977Zc5R0OET+umesYzQ9ddYxj9UAp86LCT+A1IgPqChiIWaAimVqUgGdiyJx
 n8n0m0dOumiQTLh0AtOuie2v5CH0v3QDYFm69bzMdn3VaIJuXGz4GJVDuJxnSY434R//
 k09g==
X-Gm-Message-State: AOAM531Ej02E1uo3F8D5t8Fh57JO8NGAQ03CKxuCwiriAah3zTE1LqRP
 PZur4TWizNDAV25P++rvYYBKjw==
X-Google-Smtp-Source: ABdhPJzPUGJ4AeCzmiz+5P1JzbY8N3JmNyynEe7cVhmxuvzHeL3pc70uoAtZ9hCGf3jMO5qYHvT2YA==
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr35410372wrp.277.1620719316780; 
 Tue, 11 May 2021 00:48:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:ce08:6145:b4e3:5a23])
 by smtp.gmail.com with ESMTPSA id
 f6sm28371111wru.72.2021.05.11.00.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:48:36 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 1/2] ASoC: meson: g12a-toacodec: use regmap fields to
 prepare SM1 support
Date: Tue, 11 May 2021 09:48:28 +0200
Message-Id: <20210511074829.4110036-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511074829.4110036-1-narmstrong@baylibre.com>
References: <20210511074829.4110036-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=I7FeB/kn/TULPc5oGg/7hlGuQ11TOAQ3nRx0bxRBfG4=;
 m=tzmDLU+rHQtCMcIMtsgW9A9sxdNpO6W7CGIlLPGL8Z0=;
 p=eOH4X5jCe681BB9Ief0IhfFZZMY4HvzY78LSS74Ozko=;
 g=7f135e020f0ae15fd6641595a0d9a241dd65cfa2
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmCaNrAACgkQd9zb2sjISdFhgw/+LId
 9xw2+BgFAu038Ix0alJrhfPLIR6mYvH0z6/0huqIK0FQAijzk+dwOKjGzNoPrArDSk2rBI7SwK3ps
 WIHJlFoJAQIhjMTvPQwTuk/99KStMSiMm33WgbTNO0S0nxMT5mq6kfoPr9eKaDwv+3pxVT46xhZj8
 TRMjdGMHGpsy4aGsNq8jYxq4Cn/SslH4mS8vilB3L7V+fA3W7RBrOOebNxgrcbdEH8HyEBLcdDnW+
 +3m9wljDY3lDyKpPxCWw+mn5pK9pMFYypUFi33IYESwfi2YmOOyNiNK7woKDdXb2j6tVJdINQ+y9N
 i6vLQNvgDnMyORXOLybERiJBteMebmLqbZyjcsWlz9hY1jBXXh9hOga4YVGzF5K+uo3sjNNeJWEFu
 Tt4pXXdgDR9TZPdrlN28WKu75rgZ+VROP/653eeAEJMrU1AlqstnUu1edhIH5aCpgK7Djgy004nB1
 +vc/Fsfq9R8wx5zjs4OMzXowAoFmDzTCc7bDEmmM415RBsMVGO3K6WNBvm9F7KtSK3Ipp0p1XrmZg
 u33fRNu6UsRXvzi7dvfAeWkmRsPJ4Uj2aOkDMY/UlV5fEjIYmTH6uhftA7+YmAyJFoDkxcDvkv8LU
 5LQNggNO1IVvmbt9rpEEVQXvis0oQdDjy+yU/V3Rr6351P3lmExVA9W8ZVMY7Ql4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_004838_811342_A5A9E382 
X-CRM114-Status: GOOD (  17.18  )
/bin/ln: failed to access
 'reaver_cache/texts/20210511_004838_811342_A5A9E382': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_004838_811342_A5A9E382 
X-CRM114-Status: GOOD (  14.28  )
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
index 9339fabccb79..6317bd9c86f4 100644
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
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
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
