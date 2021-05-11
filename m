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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196F8C43460
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 11:54:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67792611CE
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 May 2021 11:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67792611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BAlYTT6MGUZGBb+hr2jcWpUB2im3cc6xmCB+/mAYC9o=; b=PBs2yr6awVjyLVxK8IYBIWfBo
	CSYmklykpDl075XIYEnyszNAkZdNnUtyrW6gbCBabVtvMxtCsKKgNBeXIFeaa/G5aAOciqXX9dhHW
	TTH8fkNpNGO6D0kWVrivf1Mx32TfA6ItyPF9bkd+9hUf5rZPAo1USUJZPKyLpm9bFA+77SCyC3Rvd
	OuwKow6lwbLMOzIwrFYNtUrVllY4oSRUXbXd2BYb/hTRx4bF+uOIOuRpIbaiiNGy7JGJrR3EUH0Kc
	b2/onv9K/CVj5tjt0v4/H4Vfz5CVdN2/zIe3Wc6Q24f1Tes3UWWRLumGLqj9C94VTReAgf3+6wt8j
	wjcmfNhzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgQxW-00HEVH-4b; Tue, 11 May 2021 11:53:55 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgN8E-00GXcX-Vj
 for linux-amlogic@desiato.infradead.org; Tue, 11 May 2021 07:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=RL5m146+QHuS6iRVfkXUrgZThwGYmN8qLX2jZ6PtJgs=; b=LqZL2i/nnTtO8SeNpX5oV7h3Hi
 CGyyrKtoWv7eRmWUAkwU4SYDTh9U+qti57gh79z0dzndvggL4Pjujr7ChxRMyeXmGVCNhFOShqTmG
 WAIfP5WD9bhrlY72p8sgXY8vNbLug7gVk3H3Su0rUBURJwHJwoIj7vCSZo35kOuRDpvD2s4zsYS+/
 /1p1uYaBZ/pnP3iVNQ+N3IsXIp5h1iuUM5z+RcSYqGXAHuIUSdpK2xRh+2Vg3m4/BYib5mWJm4qJ/
 aL7dZ/i1aRazaB94Xx5M3wSzGbuEy5/VQAuHhirMiFKso573fByjRf/RKFjeujqHJzy9eVcI33ZE4
 j5f8uyAA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgN8B-009N8X-Pi
 for linux-amlogic@lists.infradead.org; Tue, 11 May 2021 07:48:41 +0000
Received: by mail-wm1-x329.google.com with SMTP id g65so10536952wmg.2
 for <linux-amlogic@lists.infradead.org>; Tue, 11 May 2021 00:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RL5m146+QHuS6iRVfkXUrgZThwGYmN8qLX2jZ6PtJgs=;
 b=o2+cx3K/+/HtbZhWSq8RmPZcQUkXHvdgOq2PYkKyYfnHeyABiEIyjIxf6+7xdxrJVO
 Zh4qJ8ozc3K4qTX2WgoM8srd3oBguFJKKJsYk0RmZQ2ak9mhblGsRruZ4CLcG/VTOCAp
 gIILHqefPl3urOd5yKCdiyF24HBGMyARpl4oP04w1m+cotRRTAm+/W2WMifA5Gd445kv
 MMePrVw/vzWD+md4FRqQMyRRG7Y8m89x4uKRLkoA3vxPyfsSklF3mrCl6+hU28F0HZ8J
 dW2ahvzfr722dE0tj9kM10MOip2yAOHEXMqLxY+AEZHiE41HYEPoNwfcWF/MCqQ82nQL
 iZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RL5m146+QHuS6iRVfkXUrgZThwGYmN8qLX2jZ6PtJgs=;
 b=IPetPbEACkLpVOPTG+Lj7NGfNk4MzgJovGY4hdBdDcX+ox5dpZMUL8PaKb5CMNo48A
 lY6FulBV+O9z+RD27CmNX1O77cl6UkY+TdRUFo0BbcxeXQDtN88CGar2eVgy5PVo5Z0n
 6Ht5YK8YakHlBnk9lg4k/PLKPvhw12/M58Tcxe03+YoUGZhPeUazbwNnY0sY+BGSbAk4
 mlW1PBQ2/HGYWYLqBsAodNIvkBFvpyoM7vTlTsBdFx6FNeyEX81lLeLmodTTqvnP5BSu
 bgpCnY3kJC9CNS7LyfkGuyQDlUKflzE6WbSiEhooOA01SbpwIqIxQ3NRK+HHYWFW436a
 /iGg==
X-Gm-Message-State: AOAM530PmTPy/yEFYYSyIMMtLOaXU59UiIEpJUTjU/i6ZV1o2GFSzO/k
 RHBruTKHmgYlGllEhY831QyJZg==
X-Google-Smtp-Source: ABdhPJxOr7LBMZ49i0bwIQ/5ZIJDPKhHzlVc62DD9UqhFLNaZwqgT4EwFvn5NXTNQVoqpB8eRxcJmA==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr3760403wmo.95.1620719317929; 
 Tue, 11 May 2021 00:48:37 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:ce08:6145:b4e3:5a23])
 by smtp.gmail.com with ESMTPSA id
 f6sm28371111wru.72.2021.05.11.00.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:48:37 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 2/2] ASoC: meson: g12a-toacodec: add support for SM1
 TOACODEC
Date: Tue, 11 May 2021 09:48:29 +0200
Message-Id: <20210511074829.4110036-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511074829.4110036-1-narmstrong@baylibre.com>
References: <20210511074829.4110036-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=vFgn4HeF6fYyIrfNSO2XBhPEbABG+KXl/lGRiyykmRg=;
 m=qGwWmF5o4d9qBXb6Klih2uuRcBA5bhVPUwJGlRovDlc=;
 p=o6hiWh4C4SQvoRuJIWWUTHT1h2owx6EhVDRPkT/w0kU=;
 g=657f59579537e84fb82ba27b1e356e028d9bf9bd
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmCaNrIACgkQd9zb2sjISdGuXhAAzhC
 5ygHxZlSszj5dy7wZxzYyX2qY/uVvi4+0ayVrvup5eU7IY6yQVfl3t99dmfvkCPKpUY+bEYecfyhq
 dgVZe1qORcMpC02prr5TCZo/ILeXBpAu7GX4lNYktIL8b+zd3qcHShM4r/vE97YtYQGGtDBw/Dd9/
 KS+dXkK0qv4ZNtM1neMgKcCWprpL3O03HHNIKxRCHyF2d+u/LSn0Uu/wjVS4fk87Zl5L+MdaYFBoG
 Le2Z7qDeFfIY+aANYOrW0IB7V23w6TpurzabwytBJWKB7/N0bn6XnQdtUB0+t1PdFS5CY0Od9O+vi
 icBP5SfAZMDZxxJhk4IXJDi5Q7rFXVVFU8y309IICdXyXKUlHXEQZ6aGyzysXRwzl7eSgTt/DDFsK
 ME8UP96SbXDDp5LgvKyac+u94K4tSn4cAJNwS3aYH7Tufxssr4Cz11t2Grg70rcNHUXMcS8uhKrRt
 dWv1cKqyDfmUXRMD8YZqQBDeTpONjP3CwIGQ2HiA3bToFYebozVW2UNeG7h9FmD4IqIQreAINIlyT
 pyWA6yh5EOI/lEygqSVWJKCi5tv0jPX2sDWoo0S+t0Ti1CvPjf0eVwmsjKbs5MEnwlA04f5KxXEq1
 IJYZFkDnnGAYfCm1fljVB8IKlFKqkh3CyUKQIftbIvUcLpXC5J5Di9qr8vWVT604=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_004839_860733_084F6A43 
X-CRM114-Status: GOOD (  15.92  )
/bin/ln: failed to access
 'reaver_cache/texts/20210511_004839_860733_084F6A43': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_004839_860733_084F6A43 
X-CRM114-Status: GOOD (  13.03  )
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

This adds support for the TOACODEC found in Amlogic SM1 SoCs.

The bits are shifted for more selection of clock sources, so this only
maps the same support for G12A to the SM1 bits.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 sound/soc/meson/g12a-toacodec.c | 63 ++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 6317bd9c86f4..1dfee1396843 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -21,13 +21,22 @@
 
 #define TOACODEC_CTRL0			0x0
 #define  CTRL0_ENABLE_SHIFT		31
+#define  CTRL0_DAT_SEL_SM1_MSB		19
+#define  CTRL0_DAT_SEL_SM1_LSB		18
 #define  CTRL0_DAT_SEL_MSB		15
 #define  CTRL0_DAT_SEL_LSB		14
+#define  CTRL0_LANE_SEL_SM1		16
 #define  CTRL0_LANE_SEL			12
+#define  CTRL0_LRCLK_SEL_SM1_MSB	14
+#define  CTRL0_LRCLK_SEL_SM1_LSB	12
 #define  CTRL0_LRCLK_SEL_MSB		9
 #define  CTRL0_LRCLK_SEL_LSB		8
+#define  CTRL0_LRCLK_INV_SM1		BIT(10)
+#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
 #define  CTRL0_BLK_CAP_INV		BIT(7)
+#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
 #define  CTRL0_BCLK_O_INV		BIT(6)
+#define  CTRL0_BCLK_SEL_SM1_MSB		6
 #define  CTRL0_BCLK_SEL_MSB		5
 #define  CTRL0_BCLK_SEL_LSB		4
 #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
@@ -41,6 +50,7 @@ struct g12a_toacodec {
 };
 
 struct g12a_toacodec_match_data {
+	const struct snd_soc_component_driver *component_drv;
 	struct reg_field field_dat_sel;
 	struct reg_field field_lrclk_sel;
 	struct reg_field field_bclk_sel;
@@ -98,11 +108,20 @@ static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
 			    CTRL0_DAT_SEL_LSB,
 			    g12a_toacodec_mux_texts);
 
+static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
+			    CTRL0_DAT_SEL_SM1_LSB,
+			    g12a_toacodec_mux_texts);
+
 static const struct snd_kcontrol_new g12a_toacodec_mux =
 	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
 			  snd_soc_dapm_get_enum_double,
 			  g12a_toacodec_mux_put_enum);
 
+static const struct snd_kcontrol_new sm1_toacodec_mux =
+	SOC_DAPM_ENUM_EXT("Source", sm1_toacodec_mux_enum,
+			  snd_soc_dapm_get_enum_double,
+			  g12a_toacodec_mux_put_enum);
+
 static const struct snd_kcontrol_new g12a_toacodec_out_enable =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
 				    CTRL0_ENABLE_SHIFT, 1, 0);
@@ -114,6 +133,13 @@ static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
 			    &g12a_toacodec_out_enable),
 };
 
+static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
+	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
+			 &sm1_toacodec_mux),
+	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
+			    &g12a_toacodec_out_enable),
+};
+
 static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
 					 struct snd_pcm_hw_params *params,
 					 struct snd_soc_dai *dai)
@@ -184,6 +210,13 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
 				       CTRL0_BLK_CAP_INV);
 }
 
+static int sm1_toacodec_component_probe(struct snd_soc_component *c)
+{
+	/* Initialize the static clock parameters */
+	return snd_soc_component_write(c, TOACODEC_CTRL0,
+				       CTRL0_BLK_CAP_INV_SM1);
+}
+
 static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
 	{ "SRC", "I2S A", "IN A Playback" },
 	{ "SRC", "I2S B", "IN B Playback" },
@@ -196,6 +229,10 @@ static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
 	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
 };
 
+static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
+	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
+};
+
 static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.probe			= g12a_toacodec_component_probe,
 	.controls		= g12a_toacodec_controls,
@@ -208,6 +245,18 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
 	.non_legacy_dai_naming	= 1,
 };
 
+static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
+	.probe			= sm1_toacodec_component_probe,
+	.controls		= sm1_toacodec_controls,
+	.num_controls		= ARRAY_SIZE(sm1_toacodec_controls),
+	.dapm_widgets		= sm1_toacodec_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(sm1_toacodec_widgets),
+	.dapm_routes		= g12a_toacodec_routes,
+	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
 static const struct regmap_config g12a_toacodec_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -215,16 +264,28 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
 };
 
 static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
+	.component_drv	= &g12a_toacodec_component_drv,
 	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
 	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
 	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
 };
 
+static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
+	.component_drv	= &sm1_toacodec_component_drv,
+	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 18, 19),
+	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
+	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
+};
+
 static const struct of_device_id g12a_toacodec_of_match[] = {
 	{
 		.compatible = "amlogic,g12a-toacodec",
 		.data = &g12a_toacodec_match_data,
 	},
+	{
+		.compatible = "amlogic,sm1-toacodec",
+		.data = &sm1_toacodec_match_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
@@ -278,7 +339,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->field_bclk_sel);
 
 	return devm_snd_soc_register_component(dev,
-			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
+			data->component_drv, g12a_toacodec_dai_drv,
 			ARRAY_SIZE(g12a_toacodec_dai_drv));
 }
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
