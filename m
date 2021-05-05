Return-Path: <SRS0=Pv2c=KA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CABB0C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:29:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3408F6117A
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 May 2021 07:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3408F6117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AeUHuqkTJctBMR/QpkhwNL2aBjhrAtjMkmzobESLMVQ=; b=QA2/HyP/eBDPxf0k0wu7mSSkp
	aq5DkUDMytEpm9ypNwheebYxzIbjBvZx1mUa2nGRtankllyB3tcf08ymEhdrO9LyTIpI87l3qsfKQ
	VnJvHVOBXLg5AD1ZuZ9cH840LW8NXwt7YgySP9O6bMn5PpW2J7ZFgzRNN3M0p18I7TsX0yssK9JW/
	gjn4mFix1aENUgQ/RsycM+DoQa7jaR8piZwH7GxfMChrPe4n52qw9YqLRHlxeUdNQ1jpAVe7i/Eq+
	xHGhz8sKAaflIwUs77xkBm0cxxpRq2jExlmGv9tEmOQwCdUrzGl0mCc4kjuPYdmeYCICmWVbKoX/X
	L479CNX5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leBy1-000TH2-23; Wed, 05 May 2021 07:29:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBwP-000Sok-Pu
 for linux-amlogic@desiato.infradead.org; Wed, 05 May 2021 07:27:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=fTqXNGzbTSVFQhK/swTSDs7zLrzEFbUi3UKZNre76o8=; b=N6MRLANe88n+pq/aVN8jUYQjDB
 GmCdPk1U74PEvqFXHg5XrJsc0wM1OWrzCpANxDbEd9EBBL9nYsw/W0m7ScemdgNAd1nHp2C24MEw8
 hUyMrJmA4GhkH0ldtiVj69AvJG0J2SUFrOit01/RSVoAyb8d9YREJy5Br4fjnhhybRnPKTF6Ki24S
 OaInNtKqa/QyoW8QclgNrE06B7bZF0aw6uimdxHpAn8bIauCuLFZMVcPFmZXMRikn01yzyVkFfIg7
 nrYf6fT2FrwgAF9lTDnoqJs1Yj1qDuSBchAzgtlV5zv5Si5LxaZwnVkdeUHdL6reefYLU/X5Tc+XA
 TjyUu0wA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leBwM-004WxJ-OJ
 for linux-amlogic@lists.infradead.org; Wed, 05 May 2021 07:27:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id n2so677158wrm.0
 for <linux-amlogic@lists.infradead.org>; Wed, 05 May 2021 00:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fTqXNGzbTSVFQhK/swTSDs7zLrzEFbUi3UKZNre76o8=;
 b=vlyKFO9kYvefMZA5Qkz8Tu5XHiYtXPkVeInRSA8WcA7XDnC7yZmbMm3U/z5CbbueXl
 g0vT2FhoJIuOV3/vBoZGQtK7KL9UBvI1BE0fJU7vqcQUOCwWb11qYInpstygfpz80IFD
 gU5/yn3ihWOOHfSQdcwV9gIdPRn1r2v8Moi93HSWedg7UJfQVGq8NO+M8WPaDNrcwQCl
 ifPkRyVMPSX6FhnQ5ZB2Dwu6yFh3pt9XsrrbsPR04Ux2eCHvfQq3FlYBDMcw28a3qFKx
 +0q2N2piuwx/S4SkB/YrbKqHegvJ893g8/xTpMUKkpelOYNk7I5N9Amx/MC/YHd+y0Ve
 w6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fTqXNGzbTSVFQhK/swTSDs7zLrzEFbUi3UKZNre76o8=;
 b=d5UVhfvN/lR+UxLPr5InnvUJnWwEr/yH8KB2uR/kRouhGUqQwmRyG3lUXIj3Ua+NT+
 j45JjbwknRyBD0nHJwCqpphptSPPu/06n5fkVnGNLdddmF3JFhWJjV8ADPwp4Pic75+p
 Ao816L96aNU4jqdmrnoBQgxTPf2SFOyA2SmTYWY5akf7dKdFTi7XUwDb3wscjsj8NFbh
 1y+0fWj97EofEDaj4epzX8l1QJU/2VHkUAHzTYquxs3djExOebzMDGXZfg4aAVAryZ99
 eJQ2vyUrnBp3SIxW94YTAH2y2Srfa9ISjHJBfaumXSabWmP9yufISO1uvlZLLyro2iDj
 64TA==
X-Gm-Message-State: AOAM530XT8gpUP1+dST+c1F0Kaf82n6m7gtHXKIwvspVHa3GOLBh2eRL
 /sZcCWL7uIYgEcth6383e3V4sw==
X-Google-Smtp-Source: ABdhPJyFB/lcrtW9M7nGTwjlT0jt5wEmILG38hBgbAYglsIexcgf3R9tDMPnc28EuExwswUNRcp0Sg==
X-Received: by 2002:a5d:6352:: with SMTP id b18mr36652433wrw.76.1620199645180; 
 Wed, 05 May 2021 00:27:25 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0?
 ([2a01:e0a:90c:e290:6eb3:66ab:cb1e:ef0])
 by smtp.gmail.com with ESMTPSA id h8sm4606700wmq.19.2021.05.05.00.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 00:27:24 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] sound: meson: g12a-toacodec: add support for SM1
 TOACODEC
To: jbrunet@baylibre.com, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210505072607.3815442-1-narmstrong@baylibre.com>
 <20210505072607.3815442-4-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a2d7df9e-5fb7-0c86-b0b0-2a5cdfab8823@baylibre.com>
Date: Wed, 5 May 2021 09:27:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505072607.3815442-4-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_002726_829661_9FCDEEAE 
X-CRM114-Status: GOOD (  25.46  )
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

On 05/05/2021 09:26, Neil Armstrong wrote:
> This adds support for the TOACODEC found in Amlogic SM1 SoCs.
> 
> The bits are shifted for more selection of clock sources, so this only
> maps the same support for G12A to the SM1 bits.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 64 ++++++++++++++++++++++++++++++++-
>  1 file changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 2084c9542c9c..5437ecba9c47 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -21,13 +21,22 @@
>  
>  #define TOACODEC_CTRL0			0x0
>  #define  CTRL0_ENABLE_SHIFT		31
> +#define  CTRL0_DAT_SEL_SM1_MSB		19
> +#define  CTRL0_DAT_SEL_SM1_LSB		18
>  #define  CTRL0_DAT_SEL_MSB		15
>  #define  CTRL0_DAT_SEL_LSB		14
> +#define  CTRL0_LANE_SEL_SM1		16
>  #define  CTRL0_LANE_SEL			12
> +#define  CTRL0_LRCLK_SEL_SM1_MSB	14
> +#define  CTRL0_LRCLK_SEL_SM1_LSB	12
>  #define  CTRL0_LRCLK_SEL_MSB		9
>  #define  CTRL0_LRCLK_SEL_LSB		8
> +#define  CTRL0_LRCLK_INV_SM1		BIT(10)
> +#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
>  #define  CTRL0_BLK_CAP_INV		BIT(7)
> +#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
>  #define  CTRL0_BCLK_O_INV		BIT(6)
> +#define  CTRL0_BCLK_SEL_SM1_MSB		6
>  #define  CTRL0_BCLK_SEL_MSB		5
>  #define  CTRL0_BCLK_SEL_LSB		4
>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
> @@ -41,6 +50,7 @@ struct g12a_toacodec {
>  };
>  
>  struct g12a_toacodec_match_data {
> +	const struct snd_soc_component_driver *component_drv;
>  	struct reg_field field_dat_sel;
>  	struct reg_field field_lrclk_sel;
>  	struct reg_field field_bclk_sel;
> @@ -98,11 +108,20 @@ static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
>  			    CTRL0_DAT_SEL_LSB,
>  			    g12a_toacodec_mux_texts);
>  
> +static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
> +			    CTRL0_DAT_SEL_SM1_LSB,
> +			    g12a_toacodec_mux_texts);
> +
>  static const struct snd_kcontrol_new g12a_toacodec_mux =
>  	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
>  			  snd_soc_dapm_get_enum_double,
>  			  g12a_toacodec_mux_put_enum);
>  
> +static const struct snd_kcontrol_new sm1_toacodec_mux =
> +	SOC_DAPM_ENUM_EXT("Source", sm1_toacodec_mux_enum,
> +			  snd_soc_dapm_get_enum_double,
> +			  g12a_toacodec_mux_put_enum);
> +
>  static const struct snd_kcontrol_new g12a_toacodec_out_enable =
>  	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>  				    CTRL0_ENABLE_SHIFT, 1, 0);
> @@ -114,6 +133,13 @@ static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
> +			    &g12a_toacodec_out_enable),
> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -184,6 +210,13 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
>  				       CTRL0_BLK_CAP_INV);
>  }
>  
> +static int sm1_toacodec_component_probe(struct snd_soc_component *c)
> +{
> +	/* Initialize the static clock parameters */
> +	return snd_soc_component_write(c, TOACODEC_CTRL0,
> +				       CTRL0_BLK_CAP_INV_SM1);
> +}
> +
>  static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  	{ "SRC", "I2S A", "IN A Playback" },
>  	{ "SRC", "I2S B", "IN B Playback" },
> @@ -196,6 +229,10 @@ static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
>  };
>  
> +static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
> +};
> +
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.probe			= g12a_toacodec_component_probe,
>  	.controls		= g12a_toacodec_controls,
> @@ -208,6 +245,18 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.non_legacy_dai_naming	= 1,
>  };
>  
> +static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
> +	.probe			= sm1_toacodec_component_probe,
> +	.controls		= sm1_toacodec_controls,
> +	.num_controls		= ARRAY_SIZE(sm1_toacodec_controls),
> +	.dapm_widgets		= sm1_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(sm1_toacodec_widgets),
> +	.dapm_routes		= g12a_toacodec_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
> +	.endianness		= 1,
> +	.non_legacy_dai_naming	= 1,
> +};
> +
>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -215,16 +264,29 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  };
>  
>  static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
> +	.component_drv	= &g12a_toacodec_component_drv,
>  	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_LSB, CTRL0_DAT_SEL_MSB),
>  	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_LSB, CTRL0_LRCLK_SEL_MSB),
>  	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_MSB),
>  };
>  
> +static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
> +	.component_drv	= &sm1_toacodec_component_drv,
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB, CTRL0_DAT_SEL_SM1_MSB),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
> +				     CTRL0_LRCLK_SEL_SM1_MSB),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_SM1_MSB),
> +};
> +
>  static const struct of_device_id g12a_toacodec_of_match[] = {
>  	{
>  		.compatible = "amlogic,g12a-toacodec",
>  		.data = &g12a_toacodec_match_data,
>  	},
> +	{
> +		.compatible = "amlogic,sm1-toacodec",
> +		.data = &sm1_toacodec_match_data,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
> @@ -278,7 +340,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
>  		return PTR_ERR(priv->field_bclk_sel);
>  
>  	return devm_snd_soc_register_component(dev,
> -			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
> +			data->component_drv, g12a_toacodec_dai_drv,
>  			ARRAY_SIZE(g12a_toacodec_dai_drv));
>  }
>  
> 

Oops, spurious one, please ignore it.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
