Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D777C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Mar 2024 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rG5FkkFzCiFCZWhgfgf9dnypPNMrj0wNRc88Db2UmzA=; b=McBvE+y7IEzTxk
	+LUxz00Y2IRerD1IQw/Z3/fRDi8TGSn1LetXv8mzEemZBZBlUUswyMr+Cmm4W/7DIyhqUCnpLSsbj
	AvaRwJC7aD11WOelaIaoAAmkHAljQ5rK1bHLKI0uIwd+pFcdVd/Wl3Di3v6mSyxxTZgAEwNrD/1cw
	BoyQ02bSGuG3uo8dRbhQSUiGozTV/zOPH/WDv5d96gfiguipjMvTr9CESdFgtd+W/KayD5cQM6/nw
	uV8hJPcG2kj6sNNq91O/aJpPh3uFsGcJen9UZtf1DWZO5kmdyuPL3QVzLWcN9FtM/QJ3sAyqkqK8J
	Y+wHcpbNOss+zSIMR4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8eQ-000000058RC-4320;
	Tue, 26 Mar 2024 15:23:47 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8eO-000000058Pg-0UzS
	for linux-amlogic@lists.infradead.org;
	Tue, 26 Mar 2024 15:23:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33ed5b6bf59so4047286f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 26 Mar 2024 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711466622; x=1712071422; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=aM+9RXmEYQB5vl1fffTAMXMZVqZ/ACCmOiJ2FPQkdAA=;
        b=2V7JIZI97d/EfgQ6SpiBhLIZA/lN5IDetmx3rVvWuegbkljfuDSPp0BRV9P3ImGmmg
         nZaaK3zKShw7Mtj7c1y/0xzlTIYITVl+2ZLOhvAuoP4JpnSrmVFNHcbUb4DdwF89CRWf
         nYyzMOqZNnQqG8ZhaOIvAQ/cHc/STCbQY/NPaQg63HVaTzglGXvvy21/EleHwoN4/wRd
         2qj6UIk01+NvD+Th0a1oB8xiM7BlqzfpC8dahvSuxz2NTwt4uCbXDnQhj1iQffuJt877
         eUSKwYumrlmM9cjSukyYDEIsrXS5v2V3zwUmP/aFZKtdoLoWcjKtami2e34aY0mnFIAQ
         PvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711466622; x=1712071422;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aM+9RXmEYQB5vl1fffTAMXMZVqZ/ACCmOiJ2FPQkdAA=;
        b=jRKM1fz/wEC2V2fX2Vegwco46OBV03XNO0wr2mJglVA5tc+K4/qSjbG+g/GEmUiJ8J
         pO0pq4mu+T2v8W4RJi8fpt4iPMZjfVTI40QuvZqdkXF6hwzmcykpHODLYKH8S035PLaa
         4MFrmbVbD2S22fDaSqj1dczq6TbpX5VtdweDPDym6PnaCNatsBkn0lU0bd0M7UqIwwsM
         UAinYAE9KTsS7NLKmmcwkiNkJWqP7sxpD1aCSNxhX/wMAcv9H7E+0uUJXpqR64tppTI+
         2tDsknNXWOTqAC5+M7kR5BeuljmixxshKlgemwwJ7Bu+Uudk0jPA3wOiVIoijTRcXI8h
         3yfA==
X-Forwarded-Encrypted: i=1; AJvYcCWsjvogHLjom0sD2qqN35z9VkP8ESp11FOfKJfmDz+fnAmLTasIzu49SdsfgiXVG90c8hrWyMUvjKFiz7iosEo3VGEcgLbQ5vlU2CXgoLNFYcg=
X-Gm-Message-State: AOJu0YyqbXcbKDt0SErOqWUZRAexTxdX0/57QUqbLfd/Nem3c/LTjOUb
	r+aL9HKcNEQZw7wV2k+i0mFG+zsj2QLeosvT0z4Hf5mT8ogZGXQrQkZ6UKm2DO8=
X-Google-Smtp-Source: AGHT+IHsYZJ/uOqZnp1TmWFGMlVgZ+AivccEHh8xx3hUmGEHsDKWJ4EN0Xf/+CitijnbkfltJZVucg==
X-Received: by 2002:a5d:69ca:0:b0:33e:7adc:516c with SMTP id s10-20020a5d69ca000000b0033e7adc516cmr1290781wrw.57.1711466621739;
        Tue, 26 Mar 2024 08:23:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:97a2:bb9f:463a:6468])
        by smtp.gmail.com with ESMTPSA id ch9-20020a5d5d09000000b00341c6778171sm8083186wrb.83.2024.03.26.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:23:41 -0700 (PDT)
References: <20240325235311.411920-1-jan.dakinevich@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2] ASoC: meson: g12a-toacodec: rework the
 definition of bits
Date: Tue, 26 Mar 2024 16:15:51 +0100
In-reply-to: <20240325235311.411920-1-jan.dakinevich@salutedevices.com>
Message-ID: <1j34sd9fur.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_082344_190627_00B5A48C 
X-CRM114-Status: GOOD (  19.76  )
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


On Tue 26 Mar 2024 at 02:53, Jan Dakinevich <jan.dakinevich@salutedevices.com> wrote:

> There is a lot of defines, but almost all of them are not used. Lets
> rework them:

Thanks for noticing. Please start by removing what's unused.

>
>  - keep separate the definition for different platforms to make easier
>    checking that they match documentation.
>
>  - use LSB/MSB sufixes for uniformity.

I'd be in favor of dropping these suffixes completely.

>
>  - don't use hard-coded values for already declared defines.
>
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
> Links:
>
>  [1] https://lore.kernel.org/lkml/20240314232201.2102178-1-jan.dakinevich@salutedevices.com/
>
> Changes v1 -> v2:
>  - Detached from v1's series (patch 7).
>  - Fixed my wrong understanding of SOC_SINGLE's input parameters.
>
>  sound/soc/meson/g12a-toacodec.c | 79 ++++++++++++++++++++-------------
>  1 file changed, 49 insertions(+), 30 deletions(-)
>
> diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
> index 531bb8707a3e..22181f4bab72 100644
> --- a/sound/soc/meson/g12a-toacodec.c
> +++ b/sound/soc/meson/g12a-toacodec.c
> @@ -20,26 +20,37 @@
>  #define G12A_TOACODEC_DRV_NAME "g12a-toacodec"
>  
>  #define TOACODEC_CTRL0			0x0
> -#define  CTRL0_ENABLE_SHIFT		31
> -#define  CTRL0_DAT_SEL_SM1_MSB		19
> -#define  CTRL0_DAT_SEL_SM1_LSB		18
> -#define  CTRL0_DAT_SEL_MSB		15
> -#define  CTRL0_DAT_SEL_LSB		14
> -#define  CTRL0_LANE_SEL_SM1		16
> -#define  CTRL0_LANE_SEL			12
> -#define  CTRL0_LRCLK_SEL_SM1_MSB	14
> -#define  CTRL0_LRCLK_SEL_SM1_LSB	12
> -#define  CTRL0_LRCLK_SEL_MSB		9
> -#define  CTRL0_LRCLK_SEL_LSB		8
> -#define  CTRL0_LRCLK_INV_SM1		BIT(10)
> -#define  CTRL0_BLK_CAP_INV_SM1		BIT(9)
> -#define  CTRL0_BLK_CAP_INV		BIT(7)
> -#define  CTRL0_BCLK_O_INV_SM1		BIT(8)
> -#define  CTRL0_BCLK_O_INV		BIT(6)
> -#define  CTRL0_BCLK_SEL_SM1_MSB		6
> -#define  CTRL0_BCLK_SEL_MSB		5
> -#define  CTRL0_BCLK_SEL_LSB		4
> -#define  CTRL0_MCLK_SEL			GENMASK(2, 0)
> +
> +/* Common bits */
> +#define CTRL0_ENABLE_SHIFT		31
> +#define CTRL0_MCLK_SEL			GENMASK(2, 0)
> +
> +/* G12A bits */
> +#define CTRL0_DAT_SEL_G12A_MSB		15
> +#define CTRL0_DAT_SEL_G12A_LSB		14
> +#define CTRL0_LANE_SEL_G12A_MSB		13
> +#define CTRL0_LANE_SEL_G12A_LSB		12
> +#define CTRL0_LANE_SEL_G12A_MAX		3
> +#define CTRL0_LRCLK_SEL_G12A_MSB	9
> +#define CTRL0_LRCLK_SEL_G12A_LSB	8
> +#define CTRL0_BLK_CAP_INV_G12A		BIT(7)
> +#define CTRL0_BCLK_O_INV_G12A		BIT(6)
> +#define CTRL0_BCLK_SEL_G12A_MSB		5
> +#define CTRL0_BCLK_SEL_G12A_LSB		4
> +
> +/* SM1 bits */
> +#define CTRL0_DAT_SEL_SM1_MSB		19
> +#define CTRL0_DAT_SEL_SM1_LSB		18
> +#define CTRL0_LANE_SEL_SM1_MSB		17
> +#define CTRL0_LANE_SEL_SM1_LSB		16
> +#define CTRL0_LANE_SEL_SM1_MAX		3
> +#define CTRL0_LRCLK_SEL_SM1_MSB		14
> +#define CTRL0_LRCLK_SEL_SM1_LSB		12
> +#define CTRL0_LRCLK_INV_SM1		BIT(10)
> +#define CTRL0_BLK_CAP_INV_SM1		BIT(9)
> +#define CTRL0_BCLK_O_INV_SM1		BIT(8)
> +#define CTRL0_BCLK_SEL_SM1_MSB		6
> +#define CTRL0_BCLK_SEL_SM1_LSB		4
>  
>  #define TOACODEC_OUT_CHMAX		2
>  
> @@ -108,7 +119,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
>  }
>  
>  static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,
> -			    CTRL0_DAT_SEL_LSB,
> +			    CTRL0_DAT_SEL_G12A_LSB,
>  			    g12a_toacodec_mux_texts);
>  
>  static SOC_ENUM_SINGLE_DECL(sm1_toacodec_mux_enum, TOACODEC_CTRL0,
> @@ -210,7 +221,7 @@ static int g12a_toacodec_component_probe(struct snd_soc_component *c)
>  {
>  	/* Initialize the static clock parameters */
>  	return snd_soc_component_write(c, TOACODEC_CTRL0,
> -				       CTRL0_BLK_CAP_INV);
> +				       CTRL0_BLK_CAP_INV_G12A);
>  }
>  
>  static int sm1_toacodec_component_probe(struct snd_soc_component *c)
> @@ -229,11 +240,13 @@ static const struct snd_soc_dapm_route g12a_toacodec_routes[] = {
>  };
>  
>  static const struct snd_kcontrol_new g12a_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_G12A_LSB,
> +		   CTRL0_LANE_SEL_G12A_MAX, 0),
>  };
>  
>  static const struct snd_kcontrol_new sm1_toacodec_controls[] = {
> -	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1, 3, 0),
> +	SOC_SINGLE("Lane Select", TOACODEC_CTRL0, CTRL0_LANE_SEL_SM1_LSB,
> +		   CTRL0_LANE_SEL_SM1_MAX, 0),
>  };
>  
>  static const struct snd_soc_component_driver g12a_toacodec_component_drv = {
> @@ -266,16 +279,22 @@ static const struct regmap_config g12a_toacodec_regmap_cfg = {
>  
>  static const struct g12a_toacodec_match_data g12a_toacodec_match_data = {
>  	.component_drv	= &g12a_toacodec_component_drv,
> -	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 14, 15),
> -	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 8, 9),
> -	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 5),
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_G12A_LSB,
> +				    CTRL0_DAT_SEL_G12A_MSB),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_G12A_LSB,
> +				     CTRL0_LRCLK_SEL_G12A_MSB),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_G12A_LSB,
> +				    CTRL0_BCLK_SEL_G12A_MSB),
>  };
>  
>  static const struct g12a_toacodec_match_data sm1_toacodec_match_data = {
>  	.component_drv	= &sm1_toacodec_component_drv,
> -	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, 18, 19),
> -	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, 12, 14),
> -	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, 4, 6),
> +	.field_dat_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_DAT_SEL_SM1_LSB,
> +				    CTRL0_DAT_SEL_SM1_MSB),
> +	.field_lrclk_sel = REG_FIELD(TOACODEC_CTRL0, CTRL0_LRCLK_SEL_SM1_LSB,
> +				     CTRL0_LRCLK_SEL_SM1_MSB),
> +	.field_bclk_sel	= REG_FIELD(TOACODEC_CTRL0, CTRL0_BCLK_SEL_SM1_LSB,
> +				    CTRL0_BCLK_SEL_SM1_MSB),

Those defines are already platform specific by the structure holding
them and the defines you have added are not helping readability.

I don't see the point to see.
I'd prefer to keep the field defined as they are.

>  };
>  
>  static const struct of_device_id g12a_toacodec_of_match[] = {


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
