Return-Path: <SRS0=lqwF=KC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D00C433ED
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 May 2021 07:39:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B141361431
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 May 2021 07:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B141361431
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+w6t9Bi2CnJNYRZ1fX3faklnvuBYzE0CUicuVPKX658=; b=fnpHQ246Wk2jyrXgXNKRNHtEL
	gBiWrhJ7yHCDHOvw0qVnarmXAwHCNWep05ctpn+qtKS86WtF9hH93IxEqK4aDohC/wjh58T0/hXxi
	QndIqrVC78vMap2NPsLGrXr7lv3iRjf1W8DIjupsffrnbYjsGhdjs2nb/3cW5e5o3leDyes0AUCZZ
	FzIvqJ/7Fbp04NdryhSLw2n1VOUd9yjolT2Rf5lAsZ3cYMjAURcYVGdZuoPuvgSxG4jM7ptoMcLdl
	kirKw09qp2kT3jjpg0kwciUXJBmV6KEqkX0D5QG433vtHQCzlheT0XKRK2Jg0gxR+ulHoisNQbLuc
	X38AIc+xA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lev4i-006OoI-Gp; Fri, 07 May 2021 07:39:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lev4f-006Onr-1c
 for linux-amlogic@desiato.infradead.org; Fri, 07 May 2021 07:39:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FVGhI0piG/ZT4z3Zm+F7e5QmKPHr5hT6fO27OeIGutE=; b=S0Z3OKrhapzR2t3gtYX2uv3lcc
 EkmasvsmZgLh93L9YXxKr93x7j1cwassqZxQAjGJfNsk/oLGuVxz9STALQta2OOKkBM6CImPOw7jV
 s6Oxo68iibxB0A9oTgcMRk9umDd2GZrW0KHyu3ci7w4SsLvTZfZBv8fURV+mYJUctFArgC7jl8rcI
 /NrnLDJri7ftzoarxQ/+yyFoDQnKG5z2EEBQx82x+RfdRDFGEtqi92IvW34TkEa0W2k9HRIDSimRz
 +QNRsQnfqQhi2v/kzs47hnfYj5nEmiSZCEx06ZUYjNQPKIHuWnV7X2GZXCXz3SCk9IDasMywHZ0mc
 VccHpOyg==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lev4b-006esD-I3
 for linux-amlogic@lists.infradead.org; Fri, 07 May 2021 07:38:59 +0000
Received: by mail-ed1-x52c.google.com with SMTP id bf4so9062586edb.11
 for <linux-amlogic@lists.infradead.org>; Fri, 07 May 2021 00:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=FVGhI0piG/ZT4z3Zm+F7e5QmKPHr5hT6fO27OeIGutE=;
 b=z+XBo5R6JvT8Y/3Vvp7a8IhFg5DOTNiOhZHUOfwNW9F9cvzxk9e0JfqlXSNTMVs4iS
 ijaqMc/rM87W50WuKQS9+5xQvvqJymy9S94wGVw43B3hp/zogfm9SUDw/9fiq12EpX4K
 l5WEsUo5LwRC9awZm8SMSMiPwxj/YDUSepflwnOGZGi30uBuEBfkJmcz8zIZ+1hF+zdU
 Fb4YWgcpA4T6fi48UadwBMhnCVi1cIHHOXRBuuxRTFOCV2vgoC6HwCF0QH0wsAPC/XCX
 p+lHNmqpLAzaEBDFDzE80+MU+iY7/xXHlOFIlS1qnZizA5qJSRT3ynHacFWCgqIlNvue
 kN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=FVGhI0piG/ZT4z3Zm+F7e5QmKPHr5hT6fO27OeIGutE=;
 b=pS3Xk+gtC0SOjb7CE9VdN6yXrZ+/SX/pGwQeZi7q8AftZDABHcV3B8YQVVEBi4iHz9
 BnTiDmnVQ5FwnLPlofsg2dz7Kc2vd2iW8ZQGPwclRU2Q6REpFMQmWqf2zwAfrM/GVnb0
 hEhYuZKjy0gbya8WAupzGrBD4Nk0kOxWw2RNksUW1UShqk7Vr+Aw1vcivtvwez2Ef7Is
 Dz6tai3p9yhHlV6y/Pqy74OvaU17mPwx0unKxToRrfqg41WXEZhy1omf4u3LofwRV5tn
 PEr/zJHwlNBDHiL8803+a2Kt+GVoIhDqG08vRqgEI3G2jsnYfbhw/bYa6ptOXPaeweTB
 NaUA==
X-Gm-Message-State: AOAM533fOPo2sceeYzUN8svJVmipx6DVsNsXZemEgy0V+f3oyhpYb8s9
 8Al2aWKEiOAVNE4q2/mTcJrkgg==
X-Google-Smtp-Source: ABdhPJwE+ezx2yC0r4CH7hMLFtjAihL3CrKtolxdfolsVVIOXdRsuDjuDzxRm1PvXc020O7Vl7sSTA==
X-Received: by 2002:a05:6402:268f:: with SMTP id
 w15mr9534035edd.321.1620373134041; 
 Fri, 07 May 2021 00:38:54 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id b12sm3549997eds.23.2021.05.07.00.38.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 00:38:53 -0700 (PDT)
References: <20210505072607.3815442-1-narmstrong@baylibre.com>
 <20210505072607.3815442-4-narmstrong@baylibre.com>
 <a2d7df9e-5fb7-0c86-b0b0-2a5cdfab8823@baylibre.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] sound: meson: g12a-toacodec: add support for SM1
 TOACODEC
In-reply-to: <a2d7df9e-5fb7-0c86-b0b0-2a5cdfab8823@baylibre.com>
Message-ID: <1jlf8rngc3.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 07 May 2021 09:38:52 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_003857_669745_714CCEE0 
X-CRM114-Status: GOOD (  17.91  )
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


On Wed 05 May 2021 at 09:27, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 05/05/2021 09:26, Neil Armstrong wrote:
>> This adds support for the TOACODEC found in Amlogic SM1 SoCs.
>> 
>> The bits are shifted for more selection of clock sources, so this only
>> maps the same support for G12A to the SM1 bits.
>> 
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  sound/soc/meson/g12a-toacodec.c | 64 ++++++++++++++++++++++++++++++++-
>>  1 file changed, 63 insertions(+), 1 deletion(-)
>> 
>> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
>> index 2084c9542c9c..5437ecba9c47 100644
>> --- a/sound/soc/meson/g12a-toacodec.c
>> +++ b/sound/soc/meson/g12a-toacodec.c
>> @@ -21,13 +21,22 @@
>>  
>>  #define TOACODEC_CTRL0			0x0
>>  #define  CTRL0_ENABLE_SHIFT		31
>> +#define  CTRL0_DAT_SEL_SM1_MSB		19
>> +#define  CTRL0_DAT_SEL_SM1_LSB		18
>>  #define  CTRL0_DAT_SEL_MSB		15
>>  #define  CTRL0_DAT_SEL_LSB		14
>> +#define  CTRL0_LANE_SEL_SM1		16
>>  #define  CTRL0_LANE_SEL			12
>> +#define  CTRL0_LRCLK_SEL_SM1_MSB	14
>> +#define  CTRL0_LRCLK_SEL_SM1_LSB	12
>>  #define  CTRL0_LRCLK_SEL_MSB		9
>>  #define  CTRL0_LRCLK_SEL_LSB		8
>> +#define  CTRL0_LRCLK_INV_SM1		BIT(10)
>> +#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
>>  #define  CTRL0_BLK_CAP_INV		BIT(7)
>> +#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
>>  #define  CTRL0_BCLK_O_INV		BIT(6)
>> +#define  CTRL0_BCLK_SEL_SM1_MSB		6
>>  #define  CTRL0_BCLK_SEL_MSB		5
>>  #define  CTRL0_BCLK_SEL_LSB		4
>>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>> @@ -41,6 +50,7 @@ struct g12a_toacodec {
>>  };
>>  
>>  struct g12a_toacodec_match_data {
>> +	const struct snd_soc_component_driver *component_drv;
>>  	struct reg_field field_dat_sel;
>>  	struct reg_field field_lrclk_sel;
>>  	struct reg_field field_bclk_sel;
>> @@ -98,11 +108,20 @@ static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
>>  			    CTRL0_DAT_SEL_LSB,
>>  			    g12a_toacodec_mux_texts);
>>  
>> +static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
>> +			    CTRL0_DAT_SEL_SM1_LSB,
>> +			    g12a_toacodec_mux_texts);
>> +
>>  static const struct snd_kcontrol_new g12a_toacodec_mux =
>>  	SOC_DAPM_ENUM_EXT("Source", g12a_toacodec_mux_enum,
>>  			  snd_soc_dapm_get_enum_double,
>>  			  g12a_toacodec_mux_put_enum);
>>  
>> +static const struct snd_kcontrol_new sm1_toacodec_mux =
>> +	SOC_DAPM_ENUM_EXT("Source", sm1_toacodec_mux_enum,
>> +			  snd_soc_dapm_get_enum_double,
>> +			  g12a_toacodec_mux_put_enum);
>> +
>>  static const struct snd_kcontrol_new g12a_toacodec_out_enable =
>>  	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>>  				    CTRL0_ENABLE_SHIFT, 1, 0);
>> @@ -114,6 +133,13 @@ static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
>>  			    &g12a_toacodec_out_enable),
>>  };
>>  
>> +static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
>> +			 &sm1_toacodec_mux),
>> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
>> +			    &g12a_toacodec_out_enable),
>> +};
>> +
>>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>>  					 struct snd_pcm_hw_params *params,
>>  					 struct snd_soc_dai *dai)
>> @@ -184,6 +210,13 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
>>  				       CTRL0_BLK_CAP_INV);
>>  }
>>  
>> +static int sm1_toacodec_component_probe(struct snd_soc_component *c)
>> +{
>> +	/* Initialize the static clock parameters */
>> +	return snd_soc_component_write(c, TOACODEC_CTRL0,
>> +				       CTRL0_BLK_CAP_INV_SM1);
>> +}
>> +
>>  static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>>  	{ "SRC", "I2S A", "IN A Playback" },
>>  	{ "SRC", "I2S B", "IN B Playback" },
>> @@ -196,6 +229,10 @@ static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
>>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
>>  };
>>  
>> +static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>> +};
>> +
>>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>>  	.probe			= g12a_toacodec_component_probe,
>>  	.controls		= g12a_toacodec_controls,
>> @@ -208,6 +245,18 @@ static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>>  	.non_legacy_dai_naming	= 1,
>>  };
>>  
>> +static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>> +	.probe			= sm1_toacodec_component_probe,
>> +	.controls		= sm1_toacodec_controls,
>> +	.num_controls		= ARRAY_SIZE(sm1_toacodec_controls),
>> +	.dapm_widgets		= sm1_toacodec_widgets,
>> +	.num_dapm_widgets	= ARRAY_SIZE(sm1_toacodec_widgets),
>> +	.dapm_routes		= g12a_toacodec_routes,
>> +	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
>> +	.endianness		= 1,
>> +	.non_legacy_dai_naming	= 1,
>> +};
>> +
>>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>>  	.reg_bits	= 32,
>>  	.val_bits	= 32,
>> @@ -215,16 +264,29 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
>>  };
>>  
>>  static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
>> +	.component_drv	= &g12a_toacodec_component_drv,
>>  	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_LSB, CTRL0_DAT_SEL_MSB),
>>  	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_LSB, CTRL0_LRCLK_SEL_MSB),
>>  	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_MSB),
>>  };
>>  
>> +static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>> +	.component_drv	= &sm1_toacodec_component_drv,
>> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB, CTRL0_DAT_SEL_SM1_MSB),
>> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
>> +				     CTRL0_LRCLK_SEL_SM1_MSB),
>> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_LSB, CTRL0_BCLK_SEL_SM1_MSB),
>> +};

If you make another round, the LSB/MSB defines don't really help
readability here (and in the other patch)

Feel free to put the values directly.

>> +
>>  static const struct of_device_id g12a_toacodec_of_match[] = {
>>  	{
>>  		.compatible = "amlogic,g12a-toacodec",
>>  		.data = &g12a_toacodec_match_data,
>>  	},
>> +	{
>> +		.compatible = "amlogic,sm1-toacodec",
>> +		.data = &sm1_toacodec_match_data,
>> +	},
>>  	{}
>>  };
>>  MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);
>> @@ -278,7 +340,7 @@ static int g12a_toacodec_probe(struct platform_device *pdev)
>>  		return PTR_ERR(priv->field_bclk_sel);
>>  
>>  	return devm_snd_soc_register_component(dev,
>> -			&g12a_toacodec_component_drv, g12a_toacodec_dai_drv,
>> +			data->component_drv, g12a_toacodec_dai_drv,
>>  			ARRAY_SIZE(g12a_toacodec_dai_drv));
>>  }
>>  
>> 
>
> Oops, spurious one, please ignore it.
>
> Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
