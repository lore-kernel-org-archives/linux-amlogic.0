Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3F1C282DE
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Mar 2025 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLBcJ2ZABCpW+TwqlHCxL7rYyzTcycVYUtUoTAAPDZw=; b=M2u/aGRtI34Wga
	tgJVTUJj3pPs48+teNh8fWKxn4rPpyQ94J8iGgpH2cJbJfyhMWJ7O9FeUtnaq2+g0wmrE1GOyc5uP
	vq7B9o4XOa4zynwYLseckTmgs4tr3oic65iPG1RqMos+xzR3HKuh1dUEVQwm3bbUUZFzxctFCGhk5
	WCn22EOBANxnl5b3k1BeGiMvKtgiItmAUIKopRbpZeCOx4y9aJ+ZdjG+Bnkq/Aj4rOk7gmPnXAABe
	6p7P6FtktWRXYSNLZ+3N753Blaq9TiwLTXL+EpZk/i0QPV919d64GroexgRGp5UjqDwA9OoTpSNTC
	DSqXpAGQCnl2MPhQkg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDdu-0000000BOnV-0RGK;
	Thu, 06 Mar 2025 16:00:14 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDck-0000000BONS-2REZ
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Mar 2025 15:59:04 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3910e101d0fso532417f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Mar 2025 07:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741276740; x=1741881540; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rr6HJYrIFdh0rI3RgJKPVqyOkkzSUwbjgMWnVkXlprE=;
        b=QV+EPi8GK4sWahhEAOZTs6MRLKh+cP5zIlD7gAqtvJ1xp/1hN/5hilNJrTtCOCUHh9
         jWU6lnNY0v7YciBo4mp5AG35Ld0kNKF12eGQdMli85FVC5FRoDg/bfIDuG0Yrl54PI0M
         2RshPPVZlVnNiLCdRzrBHtJRbZTQrxQCE/U7Vg+GIE7vehItKFjmm0JkB2Z71tieyEyl
         /YpVZqN83H27OKP4Ly4Ot56aCXm54GtPUEErvo7AohxVZ7kaZQwlS6pvS2q+7zSSq4yn
         t7N3GEBtPLI1bcgpQ07T/QoYsslyU3pNBP+x0Xq8HDvfQdzQwjf/mZvx4EOKshJ7jtBA
         gRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741276740; x=1741881540;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rr6HJYrIFdh0rI3RgJKPVqyOkkzSUwbjgMWnVkXlprE=;
        b=qFzuii8D6v4QnmOQRfE1b1Jb9RZMkWcc16xhSjclJcSJdZER7Q25R4z6PQH+MgJt/e
         k4jMjpFMJC39LbQ7Xk2Gx9vChO7C5d+OfctSFwvfii4+DTt1qbQp5G1DQAmsKztzibEj
         +zSlk1ruk/jZkhquncGr8n6oIeO1DtMSK+c1diHY+MrblF4vQrODyCCn5HAOL7LKA7Vo
         w/d63AYqAqKay62sgAB52YsQqD/OjkLPH7SYd6bA6ssD/fhnnmJIjqqHCmLOJ/gF4DMZ
         OAA6LV2Jb1uf16q2gPQgjB++DFcf3PgLaIq8yPwiuydEVE4yNsydbOBxn/3VxHIiwrPL
         DmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqsa7nUAMzf9SnupHypx4FHi+aIsC88NPPd3IDEMxfS8sVsM/V9g2Yz8hVOBRlFlAWUTLK4fMDJknQZ+Ig@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl5B1/353MYPoH1zLHRsT0jSElj8P4fl8YgNr4zjPqmIZlcgPK
	I1n7T9XOu+o9YEbZz9uxpAW8FKgg1XgdC5cqtJWN9VauqBx7VckGiVMSoJtttNc=
X-Gm-Gg: ASbGncszFhQhqnCXRisv4n6Sq35KdnMumpgPhhQ8LS3Dl6PTm1maa3C5TgyFC40q1tE
	2I+5bLyWjT27xR8w2+ouv8wkt+OHgV1MVWEpDXGSWzYyfLjePYm4vtSCVNWvJZp4+HaHwrICV0a
	If8vIRR2DHHugwy8KwvsxTWh4fStZoFPyXiUzgB+0pI8gSOMDfNjlA+3TR2msN75crg55iyx6Vq
	ColwXYkdpWTBhzXscfCO6BFXIt8a2fq5rWskx2TOpqr0FOR9yteTFkIcWa3DUllNLZbLTWNQ22E
	j/N/2BSwgwOUNIp19Gna4f59vppRBD2rXQyULGEwqw8=
X-Google-Smtp-Source: AGHT+IHVG48PQ3PbBxa6Pppm5OOQfY2250cBwz7kifepeP6HNmcBzErFykhRYqq1LVB1ReOFWmHCsg==
X-Received: by 2002:a05:6000:4020:b0:391:2e0f:efec with SMTP id ffacd0b85a97d-3912e0ff334mr1501348f8f.7.1741276740418;
        Thu, 06 Mar 2025 07:59:00 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:29d4:36d9:5043:acd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c103f41sm2391111f8f.85.2025.03.06.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:58:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
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
Subject: Re: [PATCH v3 5/6] ASoC: meson: s4: Add s4 tocodec driver
In-Reply-To: <20250228-audio_drvier-v3-5-dbfd30507e4c@amlogic.com> (jiebing
	chen via's message of "Fri, 28 Feb 2025 16:04:13 +0800")
References: <20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com>
	<20250228-audio_drvier-v3-5-dbfd30507e4c@amlogic.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 06 Mar 2025 16:58:59 +0100
Message-ID: <1jfrjq5ews.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_075902_892559_B45EACAD 
X-CRM114-Status: GOOD (  18.40  )
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

On Fri 28 Feb 2025 at 16:04, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> S4 tocodec support 8 lane to input, It need to enable
> bclk and mclk control bit when work
>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 51 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3ec4c47814d6a0676d5c62c705da75..41eef9980059285275f0189a06469fc694775955 100644
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
> @@ -129,6 +132,10 @@ static const struct snd_kcontrol_new g12a_toacodec_out_enable =
>  	SOC_DAPM_SINGLE_AUTODISABLE("Switch", TOACODEC_CTRL0,
>  				    CTRL0_ENABLE_SHIFT, 1, 0);
>  
> +static const struct snd_kcontrol_new s4_toacodec_clk_enable =
> +	SOC_DAPM_DOUBLE("Switch", TOACODEC_CTRL0,
> +			CTRL0_BCLK_ENABLE_SHIFT, CTRL0_MCLK_ENABLE_SHIFT, 1, 0);
> +
>  static const struct snd_soc_dapm_widget g12a_toacodec_widgets[] = {
>  	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
>  			 &g12a_toacodec_mux),
> @@ -143,6 +150,15 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", SND_SOC_NOPM, 0, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", SND_SOC_NOPM, 0, 0,
> +			    &g12a_toacodec_out_enable),
> +	SND_SOC_DAPM_SWITCH("CLK EN", SND_SOC_NOPM, 0, 0,
> +			    &s4_toacodec_clk_enable),

I don't see a reason for the user to control that.

A user controls if the component is enable or not, and possibly select
the lane ... but that's it

You could have to flipped automatically which dapm when the component is
powered, that would make a lot more sense.

> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -228,6 +244,15 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  	{ "OUT Capture", NULL, "OUT EN" },
>  };
>  
> +static const struct snd_soc_dapm_route s4_toacodec_routes[] = {
> +	{ "SRC", "I2S A", "IN A Playback" },
> +	{ "SRC", "I2S B", "IN B Playback" },
> +	{ "SRC", "I2S C", "IN C Playback" },
> +	{ "OUT EN", "Switch", "SRC" },
> +	{ "CLK EN", "Switch", "OUT EN" },
> +	{ "OUT Capture", NULL, "CLK EN" },
> +};
> +
>  static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
>  	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
>  };
> @@ -236,6 +261,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
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
> @@ -258,6 +287,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
>  	.endianness		= 1,
>  };
>  
> +static const struct snd_soc_component_driver s4_toacodec_component_drv = {
> +	.probe			= sm1_toacodec_component_probe,
> +	.controls		= s4_toacodec_controls,
> +	.num_controls		= ARRAY_SIZE(s4_toacodec_controls),
> +	.dapm_widgets		= s4_toacodec_widgets,
> +	.num_dapm_widgets	= ARRAY_SIZE(s4_toacodec_widgets),
> +	.dapm_routes		= s4_toacodec_routes,
> +	.num_dapm_routes	= ARRAY_SIZE(s4_toacodec_routes),
> +	.endianness		= 1,
> +};
> +
>  static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  	.reg_bits	= 32,
>  	.val_bits	= 32,
> @@ -278,6 +318,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
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
> @@ -287,6 +334,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
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
