Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A13CF65DD
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jan 2026 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuuFPjpjAdOLHnhcmBdnGq8wTl5E7wnSQlVBD0dqXHU=; b=pztUEHjSowvprx
	rFeH6G3NlDc/tjs/SvCAQCkZWcwddfV5oUfxuzOjHY+Qe/mBS/+BizyiraHKwCYpffZ2wofpxjEfb
	Z7ZPKLNt2su9X4/GqrgvgLSFLfr+RStv6LcL9Dsruf0DgrwUD8jy1F0hnk1iSzZx76QxK5ZMQ7mrs
	9Rw7thxpthhUaIqkKPKIQk2wclqsa0Y08M9Ho9Gt55hOGmgWX/T3uawXBqLD8qYjekBEN7ohHAd1C
	nv7n46ykcGQ3o2w3cLugF3eGbRh4AJpBMmALZeb83NPIWQCq/nHHjnTLv9abmclTiKODwWq7rTHDF
	xtVbwIsN9v/GC3rNj6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKOY-0000000CNlB-1y42;
	Mon, 26 Jan 2026 11:04:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkKOU-0000000CNjD-1MBS
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Jan 2026 11:04:32 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4359a16a400so3984375f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Jan 2026 03:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769425468; x=1770030268; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxxggqu7lY1Sckmv7ByHvQyZJWGtg/A0ImvB7PnxYRE=;
        b=BWKtr7yK0p2gV0pxQ+SKyeMnbuixtzXtmEicz3xPr5kSBr8QiEdzBJNKFWKlITiaTE
         GCjiH5mfX+9K5oQxFo9LlT0Jw8gzzDg9VnEQm6xP10t0etjNOAxIOEhMlbuanuVRsYHu
         KX9C0oqneuUBMmLOA89yKWhzakqriFKyG6/eQdIytJKThxjcl2dXTRBDK0tYqKTXYDV5
         cOO8kYya5avD7i/jdu69A0DY9KEZSWMeHacDrJ30ByHY/eZlg5j8THR7KwpjW4ie0nwt
         9bQQci2ubqaPSTlNE+AHsQI57frdaXtSd+/IUpGWkGRa5MQqpgJS0NzaPiZDaSffFPhC
         yCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769425468; x=1770030268;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oxxggqu7lY1Sckmv7ByHvQyZJWGtg/A0ImvB7PnxYRE=;
        b=m9wTJWLdmSaI1Z+sqQKZdxVOOlLluje5dWesKzbky/zqj7v1h7Gnh/xTSQagm0VbRC
         4xlH2AKcLK9OpupNvUvgU039f9ggpjVPoktzyKe1+sbKuvOMqAsExovZcjgcFNuYf6jS
         zhyDm7wpSYP5Y85a7J6Y8yAGVEI4Sfjhi7RJPM3VTGM3QpF7r4EP8bJOPgn8YdCBc+P3
         U/Rx8zdEm+DKLZFM1+ZyDWmcbHc9DQezdIY9B+8AM/KSKVoBd23QtZC0poxBKL+UfCop
         utKNCuaAbPYgF3QuDcB+JXsXrXh+cNx7vRFXLn7hLfKUIC19gFC9dX49OfxXyD0ZjvRr
         yArQ==
X-Forwarded-Encrypted: i=1; AJvYcCV80YkF4f9T1KV4ZyAZ/i+gZPk8BX+sWZG+n+n+S8piPtgqSH4FD8X4Zipu2lvIL5LanZVJubqtUMypiSli@lists.infradead.org
X-Gm-Message-State: AOJu0YzMFIMsVuDZWt9IZ8bQhYyoI/mY3C2+CoRY9JvgUcKfMNe45ogO
	v9ZNqVw7p5YIhbQfNVLAJhzzp0pGSUq7etlzDEk1nsgqbwXqBdvVusixg2CL+RNFLAQ=
X-Gm-Gg: AZuq6aL5pmIYEd07qVDYcadTwytz4r12F6pySU6KGsfdLEZZRizYfKm+1wjw7SwKMkU
	MleGIUkrtH5ZdyCqG+AOBz6DF4MI/4FwRUnjw65NWbePZNLReQE5Fkgr0BH9SKU8uB/llp4rkz2
	nh2UWypNdQX2EDYiJEAvEzHjHWzYHmU/Fug0nHg2mRy2ERGdoiJV2Ki/CPclPGdclEWAp02iaXm
	ywJz9IaKwZnzUebKxkvfmRWLc6f7BWraShfgu5U4WZEB3cFMM85Whgmlskn/GCWkWJL/8ij+zSA
	60HI6K4eePwwMBac157/Au9OtEh0nRcFyFUf9dlXS1I4xITldL1BvMEo1X7eSRlrskoZbkuQxEb
	DkSxuaigaHSlreoxI6bPkm4+VuAM7t0x71ZqkHm0PAghEqaEUz5j4oPhBJdGGHt2JtKNA7Unsk2
	v8IIlRg66K2g==
X-Received: by 2002:adf:e60c:0:b0:435:9bf5:b32c with SMTP id ffacd0b85a97d-435ca1ac8f5mr5355432f8f.29.1769425468113;
        Mon, 26 Jan 2026 03:04:28 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d1d:ac62:8521:30a0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-435b1c24a8asm29321914f8f.12.2026.01.26.03.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:04:27 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  jiebing.chen@amlogic.com,  linux-sound@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  jian.xu@amlogic.com,  shuai.li@amlogic.com,
  zhe.wang@amlogic.com
Subject: Re: [PATCH v6 3/5] ASoC: meson: g12a-toacodec: Add S4 tocodec driver
In-Reply-To: <20260126-audio_drvier-v6-3-99e350855bc2@amlogic.com> (Jiebing
	Chen via's message of "Mon, 26 Jan 2026 06:01:44 +0000")
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
	<20260126-audio_drvier-v6-3-99e350855bc2@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 26 Jan 2026 12:04:26 +0100
Message-ID: <1jikcohbyd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_030430_521894_EB859C8A 
X-CRM114-Status: GOOD (  18.54  )
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

On lun. 26 janv. 2026 at 06:01, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: Jiebing Chen <jiebing.chen@amlogic.com>
>
> The S4 requires additional clock control bits to be turn on while enabled.
> The S4 has 8 TDM lanes, instead of 4 on previous SoC.
> Update the widget accordingly.
>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index a95375b53f0a..a7f9ac2d08f7 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -41,6 +41,9 @@
>  #define  CTRL0_BCLK_SEL_LSB		4
>  #define  CTRL0_MCLK_SEL			GENMASK(2, 0)
>  
> +#define CTRL0_BCLK_ENABLE_SHIFT		30
> +#define CTRL0_MCLK_ENABLE_SHIFT		29
> +
>  #define TOACODEC_OUT_CHMAX		2
>  
>  struct g12a_toacodec {
> @@ -141,6 +144,13 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0,
> +			    &g12a_toacodec_out_enable),

I guess that works but it is a bit hackish to hijack the output control
to enable a something really clock related. A supply widget connect to
this widget would be more approriate I think

> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -234,6 +244,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
>  };
>  
> +static const struct snd_kcontrol_new s4_toacodec_controls[] = {
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 7, 0),
> +};
> +
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
>  	.probe			= g12a_toacodec_component_probe,
>  	.controls		= g12a_toacodec_controls,
> @@ -256,6 +270,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>  	.endianness		= 1,
>  };
>  
> +static const struct snd_soc_component_driver s4_toacodec_component_drv = {
> +	.probe			= sm1_toacodec_component_probe,
> +	.controls		= s4_toacodec_controls,
> +	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
> +	.dapm_widgets		= s4_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
> +	.dapm_routes		= g12a_toacodec_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(g12a_toacodec_routes),
> +	.endianness		= 1,
> +};
> +
>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -276,6 +301,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>  	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
>  };
>  
> +static const struct g12a_toacodec_match_data s4_toacodec_match_data = {
> +	.component_drv	= &s4_toacodec_component_drv,
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 19, 20),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
> +};
> +
>  static const struct of_device_id g12a_toacodec_of_match[] = {
>  	{
>  		.compatible = "amlogic,g12a-toacodec",
> @@ -285,6 +317,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
>  		.compatible = "amlogic,sm1-toacodec",
>  		.data = &sm1_toacodec_match_data,
>  	},
> +	{
> +		.compatible = "amlogic,s4-toacodec",
> +		.data = &s4_toacodec_match_data,
> +	},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, g12a_toacodec_of_match);

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
