Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CB4C83F17
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Jul 2025 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etq1TNkBIDFwtbz0yEfNz09/RT54KCSKGPaP+XZDK7Y=; b=0/0RVtaXR4Y3mQ
	+FUTQxyhlBdLIEwBaVtQ9r3k4x1Gx/4adghrzpI7/TB5MWMxgjh3KBDAKMTKzd6Vv8aNcrjzGrvNW
	x2CgAfbDOP0UqDx0aN0kK/pzznaAV7Ey2i7K/wvEKMUIDTOgIrIT1n1sGDRu0a42anl4guJXqM8xV
	Ald9o/Mli6X9Oab0g86QljXfdNUqre155gUDgL49QubU2Zq7UOW0/cQEfMrmAuV06HcWhMRspbNqP
	FG15XsJ2hpkhEykmp/YA5i0pddNdxgbTKiJZoVgWx9U8I9m8go9zkTsIiLZmt+7KKgl7LSyJMA9MF
	rn5sSO+M6i3SuaVOOofg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpG1-0000000BbfM-02ZT;
	Thu, 10 Jul 2025 11:16:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnbL-0000000BLir-0pXY
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Jul 2025 09:30:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-454b1d0a115so2463295e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Jul 2025 02:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752139797; x=1752744597; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbeTP4cE9kq271i0CBkzPGTfY9QH/lS2BgWUwRgbv0s=;
        b=zDgWfFkJo+RFbCDeo1Xl7JxQPogAJ4GNaJqssmaL3HMwXfQHs4EGkkgffVa7PpVXyQ
         /7Cq72WRH49KI1BRel7blHSXz0wZHY3TUHzC/uHUcdLobEjGFHuG1QqjN9Kl4GAF/lAN
         CVweR3VglTfC1zARnrtuq4A0Iz84FaLezeY0Dow9zCExWlTzfdbr5kwg3bk7w0RkELI9
         rL54PELtOZTt6MCLUKqbZrCLruNhQrZ6YGsJwnsi/wrQG2hMoz/W5UprFqtADEdhCTNb
         tefMSpEFdwQwDPrCtMiHnxduONztekEAwejbGP2fROx2F/7wWe1WYP47jratXEzqwBXx
         FXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139797; x=1752744597;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbeTP4cE9kq271i0CBkzPGTfY9QH/lS2BgWUwRgbv0s=;
        b=Vyshqo7RMJwIkY8VKrIHIKuxjNSSiMoeITBSU4zpV3mbxPrlvBTDxTuDVymA2+Vv1X
         K07P+j8DWU6ZaOh/pMBrDgzAjU+ANIbHSpA3wMP2+lqO1d08fhn78iqsDNYVTtNvh4U/
         CRKGBtz8SYwFV4sXKmaKvYTjBe1Kf+gN8RWTe2cetVkUV2chcZd+qBPfsh6nqBOtxLgx
         w/sBG0KGt+LUT9jtdFwkRi+x+zxA4CSkdzPCfZEmLU2i8lN1885nXMTqG1otXGDqS4OE
         n7Fm8w8S9YaTN0pKjzN98vMDiaQ0c84swK6Ai5t1ZjI1zJJpObnRcQDVmXgRwOm0FbPM
         tFvg==
X-Forwarded-Encrypted: i=1; AJvYcCVzg3l4L1/bMiprWbcmTyuaGGMsPJCPr3MLBQUGWQpY0GTg8DI18MGy34/+C7p/deNvcHB+QgwHcSDBNyHC@lists.infradead.org
X-Gm-Message-State: AOJu0YzRkawHO1JLhK3bWbIbAoGGWb467ovV6XiL4PuQ5aIPRRYcrZIK
	GeaP5eFC7f6HhRPlnEmc913ts/ETsOQM1m102Z6FEQUofP0ZCBG/uW0WCR1FMJGPmgA=
X-Gm-Gg: ASbGnctT38LUpVU2ocs684a12wEuKhqwrDRvtZS32zO96/wy946X+uTCsDwZyPgeRCs
	X18ZQuTwhKwm8PPhtPTX5EaFYjXguG6D0dEC9+pfQtm1I3c/kBpjmIDsDG7d9d4d+sUTa7suTRw
	mLD9JR/4n5VFq/08rEQb3035+oVdUnDptjU4oIS+oQAadG9I6utU7wOhNvVTE95MyJWX0SeWSB3
	20BDELZiJ2HbGu+JDe30B5dqjUagRIKGn2cNAtuxJEVIU3iWSI1bbtZKS/thjHXPDfaVwo+VCCY
	0YDH0Lly3JtPQy3wVQiJA5vCc9e9XRAOcTm2d/WOXsZd6JdkGK3sdGl3TjZrZQ==
X-Google-Smtp-Source: AGHT+IHX7lTl/HTMcGBrX14bHfh/MeZzub6RiU4ihi3NXd1nTuCUfqXfnAxJUw+FMOS9g116fFGL/g==
X-Received: by 2002:a05:600c:8b02:b0:44a:775d:b5e8 with SMTP id 5b1f17b1804b1-454dd1c8c8dmr16546785e9.1.1752139797358;
        Thu, 10 Jul 2025 02:29:57 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9fcc:5953:3d1a:6b41])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454d5050d34sm54258595e9.9.2025.07.10.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:29:56 -0700 (PDT)
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
Subject: Re: [PATCH v5 4/6] ASoC: meson: g12a-toacodec: Add s4 tocodec driver
In-Reply-To: <20250710-audio_drvier-v5-4-d4155f1e7464@amlogic.com> (jiebing
	chen via's message of "Thu, 10 Jul 2025 11:35:40 +0800")
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
	<20250710-audio_drvier-v5-4-d4155f1e7464@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 10 Jul 2025 11:29:56 +0200
Message-ID: <1jtt3kpf57.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_022959_241333_2A3DA90C 
X-CRM114-Status: GOOD (  21.70  )
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

On Thu 10 Jul 2025 at 11:35, jiebing chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> From: jiebing chen <jiebing.chen@amlogic.com>
>
> The S4 tocodec supports 8-lane input configuration, requiring BCLK
> and MCLK control bits to be enabled during operation.

This is oddly formulated, like there is some form of causality between 8
lane support and the new clock bits of this SoC.

If it is not the case then simply

"""
Add s4 support to the toacodec driver.

The s4 requires additional clock control bits to be turn on  while enabled.
The s4 has 8 TDM lanes, instead of 4 on previous SoC. Update the widget accordingly.

"""

>
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  sound/soc/meson/g12a-toacodec.c | 42 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3ec4c47814d6a0676d5c62c705da75..cb2169293f0e800bd9c0893087ffc4813f3360e2 100644
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
> @@ -143,6 +146,19 @@ static const struct snd_soc_dapm_widget sm1_toacodec_widgets[] = {
>  			    &g12a_toacodec_out_enable),
>  };
>  
> +/*
> + * FIXME:
> + * On this soc, tocodec need enable mclk and bclk control
> + * just enable it when dapm power widget power on.

If those are needed only when the widget is enabled, then I think it is
fine and the FIXME is not necessary

If not, more explanation are needed because I don't get what the
limitation is.

> + */
> +
> +static const struct snd_soc_dapm_widget s4_toacodec_widgets[] = {
> +	SND_SOC_DAPM_MUX("SRC", TOACODEC_CTRL0, CTRL0_BCLK_ENABLE_SHIFT, 0,
> +			 &sm1_toacodec_mux),
> +	SND_SOC_DAPM_SWITCH("OUT EN", TOACODEC_CTRL0, CTRL0_MCLK_ENABLE_SHIFT, 0,
> +			    &g12a_toacodec_out_enable),
> +};
> +
>  static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
>  					 struct snd_pcm_hw_params *params,
>  					 struct snd_soc_dai *dai)
> @@ -236,6 +252,10 @@ static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
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
> @@ -258,6 +278,17 @@ static const struct snd_soc_component_driver sm1_toacodec_component_drv = {
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
> @@ -278,6 +309,13 @@ static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
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
> @@ -287,6 +325,10 @@ static const struct of_device_id g12a_toacodec_of_match[] = {
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
