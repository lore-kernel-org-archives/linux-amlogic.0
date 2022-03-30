Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31CFC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e66lVigJKCNmnGrnpVXGF4Bdxc52YeXbTO62jDNN/JU=; b=EEcy3US8EYJ/NE
	7j6JtbqFiDkKp+a9d8EmRYxVLLVwOwGVQxd+5PXKHcYw2lVo92ZzfJRswImBzbBOTR+16wIn0EjCU
	iEeXHLt9dyi7EYsgTvLkK5u+2j/J5FFJhdzKx+Dtv21P81ZFveRd0basZBbzw0yf09eI8NkIPS11M
	TNLgmcRz/RGoT0ENRhnC4dr1xErjMMqAmJhXlXdqxV43V+XVXxUXGqPOtKb+r17xMfIyGRZUGQogI
	lAQ4J75pvpN7y5mF8tXyNWI4x+4o7hlRQBrjWcQM/cFk4adOqqP37UT0hnhePwNt02Avnk/RGQM4r
	gJpMSmYU+QLZY2C48VkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZaBN-00GY1r-3Z; Wed, 30 Mar 2022 15:24:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZa9R-00GX5v-R2
 for linux-amlogic@lists.infradead.org; Wed, 30 Mar 2022 15:22:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 i132-20020a1c3b8a000000b0038ce25c870dso144353wma.1
 for <linux-amlogic@lists.infradead.org>; Wed, 30 Mar 2022 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VsktZd1lrpgrX+V/L1u1pkl3lthFyT18R1StRVOqeME=;
 b=BDBQTdTSUt24gLYrTuCs4gNhSDd1O1k0+jDSX4hWVEL3W35F5nbZjZ6EqJkh/9u0En
 erGGuiv2FmAgVkcHi3VHqY60MlgY9g8+jqhXktkdqhLkJlVMaGZhOJyBjUe3L/1I82Ir
 Ob5u3nAXtykeHInVc7gS8LV7ZCpdCIwQtC5JvG+lHvtkLf+hSTiJMi4N9X9O/5hl+NnC
 megWRTGELbcngkgNBzf9ZN0TE5dxEAtG8ySyHl9SWDbvG3MwcHB/dIloYWBD+IqWSWLT
 W8Gu5aWG9ktI2GAUpgQY8fZsYV7fj+mxmarBzBgzTQ8ToduTMTrGAhhDySSzxO536S9N
 x58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VsktZd1lrpgrX+V/L1u1pkl3lthFyT18R1StRVOqeME=;
 b=o8CuTWbW10P6WqIck3zQOm0d0uZ4omiHko82JmcokNV87xj6DcUuv+CKWxj+mdAJ35
 KP4I7JncpF9cR8FMViL+viEoGuJ2aEcVk3rsJDEeevRFnzswSIvfhyOJPl3tP9BeO4hX
 KkdcQ64Ju/gYEXH/rUWIvdYZaZ09VV7lKKvBah0ewIlOuUyG2bStiE1XyZXwQme7jbrO
 JOqIF0jrLGOB3i8qDOUC8F1G0jTjlybkA8o4x39RnWYeo0o9uuLAk4YtLpsdAvmA1zPY
 4bm8EYMRqF3wmWXJ8MosCSVHvnUBrYMhLvTh18qR2hmEAm7Ez5iTMDtUe4dwrVOFRpfk
 GM9w==
X-Gm-Message-State: AOAM533TmjVQS7XOyCNk4uxi+XadNKE3LrFO0MCwDv4ii07/EbagyPiB
 oeGZfU02+Thf4n8a/8MiCktDcQ==
X-Google-Smtp-Source: ABdhPJzQnHg7FADFhfDN5WNwL6d7L/J0cN4GJJs3uwA9AeUV9+yD7d8e2R/SvmrTa8scE2MOsp2T/A==
X-Received: by 2002:a1c:f607:0:b0:381:1db:d767 with SMTP id
 w7-20020a1cf607000000b0038101dbd767mr4793481wmc.165.1648653742795; 
 Wed, 30 Mar 2022 08:22:22 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:e47f:3cdb:5811:cee8?
 ([2001:861:44c0:66c0:e47f:3cdb:5811:cee8])
 by smtp.gmail.com with ESMTPSA id
 c5-20020a5d63c5000000b002040822b680sm25478862wrw.81.2022.03.30.08.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 08:22:22 -0700 (PDT)
Message-ID: <357c0ae6-7910-dfe5-eefa-1a7820e7e46b@baylibre.com>
Date: Wed, 30 Mar 2022 17:22:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 09/13] pinctrl: meson: Rename REG_* to MESON_REG_*
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
 <20220330145030.1562-10-andriy.shevchenko@linux.intel.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220330145030.1562-10-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_082226_002807_CC2193F9 
X-CRM114-Status: GOOD (  17.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 30/03/2022 16:50, Andy Shevchenko wrote:
> Rename REG_* to MESON_REG_* as a prerequisite for enabling COMPILE_TEST.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/pinctrl/meson/pinctrl-meson.c | 24 ++++++++++++------------
>   drivers/pinctrl/meson/pinctrl-meson.h | 24 ++++++++++++------------
>   2 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 49851444a6e3..5b46a0979db7 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -218,13 +218,13 @@ static int meson_pinconf_set_output(struct meson_pinctrl *pc,
>   				    unsigned int pin,
>   				    bool out)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_DIR, !out);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_DIR, !out);
>   }
>   
>   static int meson_pinconf_get_output(struct meson_pinctrl *pc,
>   				    unsigned int pin)
>   {
> -	int ret = meson_pinconf_get_gpio_bit(pc, pin, REG_DIR);
> +	int ret = meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_DIR);
>   
>   	if (ret < 0)
>   		return ret;
> @@ -236,13 +236,13 @@ static int meson_pinconf_set_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin,
>   				   bool high)
>   {
> -	return meson_pinconf_set_gpio_bit(pc, pin, REG_OUT, high);
> +	return meson_pinconf_set_gpio_bit(pc, pin, MESON_REG_OUT, high);
>   }
>   
>   static int meson_pinconf_get_drive(struct meson_pinctrl *pc,
>   				   unsigned int pin)
>   {
> -	return meson_pinconf_get_gpio_bit(pc, pin, REG_OUT);
> +	return meson_pinconf_get_gpio_bit(pc, pin, MESON_REG_OUT);
>   }
>   
>   static int meson_pinconf_set_output_drive(struct meson_pinctrl *pc,
> @@ -269,7 +269,7 @@ static int meson_pinconf_disable_bias(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit), 0);
>   	if (ret)
>   		return ret;
> @@ -288,7 +288,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
>   	if (pull_up)
>   		val = BIT(bit);
>   
> @@ -296,7 +296,7 @@ static int meson_pinconf_enable_bias(struct meson_pinctrl *pc, unsigned int pin,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
>   	ret = regmap_update_bits(pc->reg_pullen, reg, BIT(bit),	BIT(bit));
>   	if (ret)
>   		return ret;
> @@ -321,7 +321,7 @@ static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
>   
>   	if (drive_strength_ua <= 500) {
>   		ds_val = MESON_PINCONF_DRV_500UA;
> @@ -407,7 +407,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_PULLEN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_PULLEN, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_pullen, reg, &val);
>   	if (ret)
> @@ -416,7 +416,7 @@ static int meson_pinconf_get_pull(struct meson_pinctrl *pc, unsigned int pin)
>   	if (!(val & BIT(bit))) {
>   		conf = PIN_CONFIG_BIAS_DISABLE;
>   	} else {
> -		meson_calc_reg_and_bit(bank, pin, REG_PULL, &reg, &bit);
> +		meson_calc_reg_and_bit(bank, pin, MESON_REG_PULL, &reg, &bit);
>   
>   		ret = regmap_read(pc->reg_pull, reg, &val);
>   		if (ret)
> @@ -447,7 +447,7 @@ static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, pin, MESON_REG_DS, &reg, &bit);
>   
>   	ret = regmap_read(pc->reg_ds, reg, &val);
>   	if (ret)
> @@ -595,7 +595,7 @@ static int meson_gpio_get(struct gpio_chip *chip, unsigned gpio)
>   	if (ret)
>   		return ret;
>   
> -	meson_calc_reg_and_bit(bank, gpio, REG_IN, &reg, &bit);
> +	meson_calc_reg_and_bit(bank, gpio, MESON_REG_IN, &reg, &bit);
>   	regmap_read(pc->reg_gpio, reg, &val);
>   
>   	return !!(val & BIT(bit));
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index ff5372e0a475..fa042cd6a7ff 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -63,12 +63,12 @@ struct meson_reg_desc {
>    * enum meson_reg_type - type of registers encoded in @meson_reg_desc
>    */
>   enum meson_reg_type {
> -	REG_PULLEN,
> -	REG_PULL,
> -	REG_DIR,
> -	REG_OUT,
> -	REG_IN,
> -	REG_DS,
> +	MESON_REG_PULLEN,
> +	MESON_REG_PULL,
> +	MESON_REG_DIR,
> +	MESON_REG_OUT,
> +	MESON_REG_IN,
> +	MESON_REG_DS,
>   	NUM_REG,
>   };
>   
> @@ -150,12 +150,12 @@ struct meson_pinctrl {
>   		.irq_first	= fi,					\
>   		.irq_last	= li,					\
>   		.regs = {						\
> -			[REG_PULLEN]	= { per, peb },			\
> -			[REG_PULL]	= { pr, pb },			\
> -			[REG_DIR]	= { dr, db },			\
> -			[REG_OUT]	= { or, ob },			\
> -			[REG_IN]	= { ir, ib },			\
> -			[REG_DS]	= { dsr, dsb },			\
> +			[MESON_REG_PULLEN]	= { per, peb },		\
> +			[MESON_REG_PULL]	= { pr, pb },		\
> +			[MESON_REG_DIR]		= { dr, db },		\
> +			[MESON_REG_OUT]		= { or, ob },		\
> +			[MESON_REG_IN]		= { ir, ib },		\
> +			[MESON_REG_DS]		= { dsr, dsb },		\
>   		},							\
>   	 }
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
