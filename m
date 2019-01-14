Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAB9C43387
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 16:13:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B87520873
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 16:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VWPwv+xL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1r+r30rD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B87520873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uK0nhuMeUc40XYa42HX21cvoROgzx82A3egYxDAlIxQ=; b=VWPwv+xLXLIXoj
	RQj4TI4ixZ2dZQDNpnndl84NMDN7AnFP3gg8XiyoqMKwnM128rw9+81qEqtli+2Js5Pj3BMJBmiFr
	Qk9jZc2ZpD4oezZnNM1YyekCvfw9klnV5tZGxBhRlc1bcIe2U8twXzj1kHKMelc5MHsHgZHkaI/jT
	spRZCYFKsxqM0sHXfBjhyWH2ktbV/iITXIZ4XRyIQCoy1rqxX5PLJowe2MAUnBofm1TAKUPooo8jY
	WZ/NUdwImb5qLyckNAVFp0Ud4cFqQKCMXGSx7we5k/tOu1e/WGmgJB7ihoNZ9OUMmHeoZEt+NgPfE
	nRY0GkoABe6FcDHM9eJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj4rc-00087J-Jk; Mon, 14 Jan 2019 16:13:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj4qM-0006jJ-LJ
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 16:12:21 +0000
Received: by mail-wr1-x444.google.com with SMTP id x10so23498932wrs.8
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 08:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eqCnO1r8WwRB+cE0U0gOSoMANgOiG6mRV4IgCN9xOZE=;
 b=1r+r30rD5AvngMhJ69QUawH2pJUAtUfuPA4ZYlQa/NAKrW1a+xWQqR+HIppCeWydOW
 QBB6eIqkcTit5Q1PbNXm/wBIxPDExlXpBI70hsaEEQDj3K6NWWRe1EGt1Fgky7BtaTp6
 ST4ft3b6e3yW2H2nhAU+4m4zYOIIQKMOIqBp0DQQ1Lobt3SpHYHcJm24FlAJppA+z8Sh
 gD/GzpX/Bi65oYM427UkrrsHBIzLflPQDNdi4BfMfFASPyq329kyV/4mNkO7COIQ0h3P
 Zf9XAKpv6+GDdnrJyQxa6XJhh/V7p9k+sNWxU1KbGBDmykPtRDAZ7x2EA04KhSUw4cwR
 AgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=eqCnO1r8WwRB+cE0U0gOSoMANgOiG6mRV4IgCN9xOZE=;
 b=Y9FBzqX6alE4X2sg1Z5CSaRtGMkeeW6olf4Bn8M4e4sF0gZB8bJHsTR0hAx62vZQun
 H6ffRc6VBWPqwOYIBdeLgeYwaUiAB+QfF9Yxxv0k7BNHLSP2r4BAEB51/MeuVGUcQo3d
 7XVrGAnWDst5zP5VCafGNS5gB4hYHe50+0JGYfIa2R8Dk3ekau7ntmBBrSbD2rntrX2a
 touA7bTYWnVJb7erQLWa3lcgJrrEfKRKFOJ8Jb3H02Gy83svow7vflA+T+vJJlcb9jcL
 zu14o+LvDtc1Qfac6p4e3AhhveeUf1v/GxuNHw+1vdzb2ZiCA3HctdymRfjDnLT+D+o2
 bM6g==
X-Gm-Message-State: AJcUukf5bEu0R1fM+exgMwulxl5tnaoTPwnSK1s9fP/bivjh/G0wcbum
 RwRTVCPr9ANyQcn0kR+lN9LuTQFkBIv6jA==
X-Google-Smtp-Source: ALg8bN4uM8Se6cJ8ghl69hAVRZg2OyS5jH8yX0tamGHM9AR9hjgCSJ0a5fsgPNxkKokr9KxbB5Qz0A==
X-Received: by 2002:adf:f101:: with SMTP id r1mr25532840wro.32.1547482322378; 
 Mon, 14 Jan 2019 08:12:02 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v1sm99417599wrw.90.2019.01.14.08.12.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Jan 2019 08:12:01 -0800 (PST)
Subject: Re: [PATCH u-boot] pinctrl: meson: add pinconf support
To: Jerome Brunet <jbrunet@baylibre.com>, trini@konsulko.com
References: <20190104144434.5672-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <509d3c4e-b6e7-4983-f31f-3da4cd21dc24@baylibre.com>
Date: Mon, 14 Jan 2019 17:12:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190104144434.5672-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_081206_931026_3E2A3949 
X-CRM114-Status: GOOD (  22.13  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On 04/01/2019 15:44, Jerome Brunet wrote:
> Adding pinconf support is necessary to enable boot from SPI
> without breaking the eMMC. When booting from SPI, the ROM code
> leave pull downs on the eMMC pad.
> 
> We need to set pinconf provided in DT to solve this
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/pinctrl/meson/Kconfig                 |   1 +
>  drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c |  10 ++
>  drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c  |  10 ++
>  drivers/pinctrl/meson/pinctrl-meson.c         | 101 ++++++++++++++++--
>  drivers/pinctrl/meson/pinctrl-meson.h         |   8 ++
>  5 files changed, 123 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> index ee820a57a0e0..162642d7289b 100644
> --- a/drivers/pinctrl/meson/Kconfig
> +++ b/drivers/pinctrl/meson/Kconfig
> @@ -2,6 +2,7 @@ if ARCH_MESON
>  
>  config PINCTRL_MESON
>  	select PINCTRL_GENERIC
> +	select PINCONF
>  	bool
>  
>  config PINCTRL_MESON_GX_PMX
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> index c82413d08f34..f9065723eea9 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> @@ -93,6 +93,12 @@ static int meson_axg_pinmux_group_set(struct udevice *dev,
>  	return 0;
>  }
>  
> +const struct pinconf_param meson_axg_pinconf_params[] = {
> +	{ "bias-disable", PIN_CONFIG_BIAS_DISABLE, 0 },
> +	{ "bias-pull-up", PIN_CONFIG_BIAS_PULL_UP, 1 },
> +	{ "bias-pull-down", PIN_CONFIG_BIAS_PULL_DOWN, 1 },
> +};
> +
>  const struct pinctrl_ops meson_axg_pinctrl_ops = {
>  	.get_groups_count = meson_pinctrl_get_groups_count,
>  	.get_group_name = meson_pinctrl_get_group_name,
> @@ -100,6 +106,10 @@ const struct pinctrl_ops meson_axg_pinctrl_ops = {
>  	.get_function_name = meson_pinmux_get_function_name,
>  	.pinmux_group_set = meson_axg_pinmux_group_set,
>  	.set_state = pinctrl_generic_set_state,
> +	.pinconf_params = meson_axg_pinconf_params
> +	.pinconf_num_params = ARRAY_SIZE(meson_axg_pinconf_params),
> +	.pinconf_set = meson_pinconf_set,
> +	.pinconf_group_set = meson_pinconf_group_set,
>  };
>  
>  static int meson_axg_gpio_request(struct udevice *dev,
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c
> index fc1538ea719e..cf72576b6ce2 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gx-pmx.c
> @@ -72,6 +72,12 @@ static int meson_gx_pinmux_group_set(struct udevice *dev,
>  	return 0;
>  }
>  
> +const struct pinconf_param meson_gx_pinconf_params[] = {
> +	{ "bias-disable", PIN_CONFIG_BIAS_DISABLE, 0 },
> +	{ "bias-pull-up", PIN_CONFIG_BIAS_PULL_UP, 1 },
> +	{ "bias-pull-down", PIN_CONFIG_BIAS_PULL_DOWN, 1 },
> +};
> +
>  const struct pinctrl_ops meson_gx_pinctrl_ops = {
>  	.get_groups_count = meson_pinctrl_get_groups_count,
>  	.get_group_name = meson_pinctrl_get_group_name,
> @@ -79,6 +85,10 @@ const struct pinctrl_ops meson_gx_pinctrl_ops = {
>  	.get_function_name = meson_pinmux_get_function_name,
>  	.pinmux_group_set = meson_gx_pinmux_group_set,
>  	.set_state = pinctrl_generic_set_state,
> +	.pinconf_params = meson_gx_pinconf_params,
> +	.pinconf_num_params = ARRAY_SIZE(meson_gx_pinconf_params),
> +	.pinconf_set = meson_pinconf_set,
> +	.pinconf_group_set = meson_pinconf_group_set,
>  };
>  
>  static const struct dm_gpio_ops meson_gx_gpio_ops = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index b539749752c8..fa3d78858a9e 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -57,7 +57,7 @@ static int meson_gpio_calc_reg_and_bit(struct udevice *dev, unsigned int offset,
>  				       enum meson_reg_type reg_type,
>  				       unsigned int *reg, unsigned int *bit)
>  {
> -	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
> +	struct meson_pinctrl *priv = dev_get_priv(dev);
>  	struct meson_bank *bank = NULL;
>  	struct meson_reg_desc *desc;
>  	unsigned int pin;
> @@ -89,7 +89,8 @@ int meson_gpio_get(struct udevice *dev, unsigned int offset)
>  	unsigned int reg, bit;
>  	int ret;
>  
> -	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_IN, &reg, &bit);
> +	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_IN, &reg,
> +					  &bit);
>  	if (ret)
>  		return ret;
>  
> @@ -102,7 +103,8 @@ int meson_gpio_set(struct udevice *dev, unsigned int offset, int value)
>  	unsigned int reg, bit;
>  	int ret;
>  
> -	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_OUT, &reg, &bit);
> +	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_OUT, &reg,
> +					  &bit);
>  	if (ret)
>  		return ret;
>  
> @@ -117,7 +119,8 @@ int meson_gpio_get_direction(struct udevice *dev, unsigned int offset)
>  	unsigned int reg, bit, val;
>  	int ret;
>  
> -	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_DIR, &reg, &bit);
> +	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_DIR, &reg,
> +					  &bit);
>  	if (ret)
>  		return ret;
>  
> @@ -132,7 +135,8 @@ int meson_gpio_direction_input(struct udevice *dev, unsigned int offset)
>  	unsigned int reg, bit;
>  	int ret;
>  
> -	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_DIR, &reg, &bit);
> +	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_DIR, &reg,
> +					  &bit);
>  	if (ret)
>  		return ret;
>  
> @@ -148,13 +152,15 @@ int meson_gpio_direction_output(struct udevice *dev,
>  	unsigned int reg, bit;
>  	int ret;
>  
> -	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_DIR, &reg, &bit);
> +	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_DIR, &reg,
> +					  &bit);
>  	if (ret)
>  		return ret;
>  
>  	clrbits_le32(priv->reg_gpio + reg, BIT(bit));
>  
> -	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_OUT, &reg, &bit);
> +	ret = meson_gpio_calc_reg_and_bit(dev->parent, offset, REG_OUT, &reg,
> +					  &bit);
>  	if (ret)
>  		return ret;
>  
> @@ -163,6 +169,72 @@ int meson_gpio_direction_output(struct udevice *dev,
>  	return 0;
>  }
>  
> +static int meson_pinconf_bias_set(struct udevice *dev, unsigned int pin,
> +				  unsigned int param)
> +{
> +	struct meson_pinctrl *priv = dev_get_priv(dev);
> +	unsigned int offset = pin - priv->data->pin_base;
> +	unsigned int reg, bit;
> +	int ret;
> +
> +	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_PULLEN, &reg, &bit);
> +	if (ret)
> +		return ret;
> +
> +	if (param == PIN_CONFIG_BIAS_DISABLE) {
> +		clrsetbits_le32(priv->reg_pullen + reg, BIT(bit), 0);
> +		return 0;
> +	}
> +
> +	/* othewise, enable the bias and select level */
> +	clrsetbits_le32(priv->reg_pullen + reg, BIT(bit), 1);
> +	ret = meson_gpio_calc_reg_and_bit(dev, offset, REG_PULL, &reg, &bit);
> +	if (ret)
> +		return ret;
> +
> +	clrsetbits_le32(priv->reg_pull + reg, BIT(bit),
> +			param == PIN_CONFIG_BIAS_PULL_UP);
> +
> +	return 0;
> +}
> +
> +int meson_pinconf_set(struct udevice *dev, unsigned int pin,
> +		      unsigned int param, unsigned int arg)
> +{
> +	int ret;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +	case PIN_CONFIG_BIAS_PULL_UP:
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +		ret = meson_pinconf_bias_set(dev, pin, param);
> +		break;
> +
> +	default:
> +		dev_err(dev, "unsupported configuration parameter %u\n", param);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +int meson_pinconf_group_set(struct udevice *dev,
> +			    unsigned int group_selector,
> +			    unsigned int param, unsigned int arg)
> +{
> +	struct meson_pinctrl *priv = dev_get_priv(dev);
> +	struct meson_pmx_group *grp = &priv->data->groups[group_selector];
> +	int i, ret;
> +
> +	for (i = 0; i < grp->num_pins; i++) {
> +		ret = meson_pinconf_set(dev, grp->pins[i], param, arg);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  int meson_gpio_probe(struct udevice *dev)
>  {
>  	struct meson_pinctrl *priv = dev_get_priv(dev->parent);
> @@ -240,6 +312,21 @@ int meson_pinctrl_probe(struct udevice *dev)
>  		return -EINVAL;
>  	}
>  	priv->reg_gpio = (void __iomem *)addr;
> +
> +	addr = parse_address(gpio, "pull", na, ns);
> +	if (addr == FDT_ADDR_T_NONE) {
> +		debug("pull address not found\n");
> +		return -EINVAL;
> +	}
> +	priv->reg_pull = (void __iomem *)addr;
> +
> +	addr = parse_address(gpio, "pull-enable", na, ns);
> +	/* Use pull region if pull-enable one is not present */
> +	if (addr == FDT_ADDR_T_NONE)
> +		priv->reg_pullen = priv->reg_pull;
> +	else
> +		priv->reg_pullen = (void __iomem *)addr;
> +
>  	priv->data = (struct meson_pinctrl_data *)dev_get_driver_data(dev);
>  
>  	/* Lookup GPIO driver */
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index bdee721fc007..28085a7495d4 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -39,6 +39,8 @@ struct meson_pinctrl {
>  	struct meson_pinctrl_data *data;
>  	void __iomem *reg_mux;
>  	void __iomem *reg_gpio;
> +	void __iomem *reg_pull;
> +	void __iomem *reg_pullen;
>  };
>  
>  /**
> @@ -130,4 +132,10 @@ int meson_gpio_direction_output(struct udevice *dev, unsigned int offset,
>  				int value);
>  int meson_gpio_probe(struct udevice *dev);
>  
> +int meson_pinconf_set(struct udevice *dev, unsigned int pin,
> +		      unsigned int param, unsigned int arg);
> +int meson_pinconf_group_set(struct udevice *dev,
> +			    unsigned int group_selector,
> +			    unsigned int param, unsigned int arg);
> +
>  #endif /* __PINCTRL_MESON_H__ */
> 

Looks good to me,

Applied to u-boot-amlogic

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
