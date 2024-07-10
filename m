Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6D3C3DA41
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 22:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MD7u2iG88mylkYGdKbo+Sx2IE9dHCD4AsUi+jSVF7Cc=; b=ZAbMoh3EhRgzJU
	41UjvNjN//aQUfXb+M+TkpmCXJ4we75JoZtwKKBdoDAmaFnLmsVV1gVo7ZvKt738vfiT+2LRkYTke
	HY0lVQK5JU1QFC+ic2TXTnIJOBZurdE4Y2HGP1Tof1r7spgaApzBjLGfh+62gjvU3OBBiWMlKQynA
	gsjuu/+5YS2G7a/Ku5iOI/f1Rnh+wSEq+FIZM4FIod2JtElAXJcOQRGlbplYWaeNf5vhKgqfRoUWi
	yZxXc8T6Og8VItgt6L96oGynzKWasj7sv7rxSjKqoCl/fMHIDsiAYqolxdzNdfLz0YwCloZNc1MGM
	9cbyI48whPGWvVLBViXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfxL-0000000Bxx3-2umc;
	Wed, 10 Jul 2024 22:38:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRfxI-0000000BxwR-1D6v
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 22:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 967F2CE17BB;
	Wed, 10 Jul 2024 22:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA0DC32781;
	Wed, 10 Jul 2024 22:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720651109;
	bh=Vt0wIR0866O2uh3dKPQRIDeiue0Wwto6R+OX4aFCPX0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Xn0PZ35X3M19tLT9SsacAdNowfrkZtKkomjX+abFBgGyT42Vg+Lv1+p4Iw7JjMvO8
	 gqI8LtP0F1oyanIYu7QSszTciIxTB86CdLC3nxglZJSQjes3HaRpNKGiXPwWVazCmN
	 hBVeC8ogiUNW34dkbMkevXEfx9Dwg47yf8M9J9rVRTpiaX4/NYTCl2TbHF4mmuBosW
	 1jljNEgRZFywMOCwK6AUNvg0aod0w4U2ym706IZyqybrzhbY5XIk/XsCK/NkDG8ET0
	 NnoOD375rRWqRsVERre7UebEKd0Wa3ag3gZLA5xqBA42/Dt3Iw6bkAHWKAwJOwPNRu
	 2oFKCl1E4N7YQ==
Message-ID: <e670d28f96466654cbba155794650f65.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240710162526.2341399-4-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com> <20240710162526.2341399-4-jbrunet@baylibre.com>
Subject: Re: [PATCH 3/8] reset: amlogic: split the device and platform probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Jan Dakinevich <jan.dakinevich@salutedevices.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 10 Jul 2024 15:38:26 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_153832_728221_D80FD7B2 
X-CRM114-Status: GOOD (  14.80  )
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

Quoting Jerome Brunet (2024-07-10 09:25:12)
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 59126c9f194a..fec55321b52b 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -87,6 +87,27 @@ static const struct reset_control_ops meson_reset_ops = {
>         .deassert       = meson_reset_deassert,
>  };
>  
> +static int meson_reset_probe(struct device *dev, struct regmap *map,
> +                            const struct meson_reset_param *param)
> +{
> +       unsigned int stride = regmap_get_reg_stride(map);
> +       struct meson_reset *data;
> +
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->param = param;
> +       data->map = map;
> +       data->rcdev.owner = dev->driver->owner;
> +       data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
> +               * stride;

Nitpick: I'd just put this on the line above

> +       data->rcdev.ops = &meson_reset_ops;
> +       data->rcdev.of_node = dev->of_node;
> +
> +       return devm_reset_controller_register(dev, &data->rcdev);
> +}
> +
>  static const struct meson_reset_param meson8b_param = {
>         .reg_count      = 8,
>         .reset_offset   = 0x0,
> @@ -125,46 +146,38 @@ static const struct regmap_config regmap_config = {
>         .reg_stride = 4,
>  };
>  
> -static int meson_reset_probe(struct platform_device *pdev)
> +static int meson_reset_pltf_probe(struct platform_device *pdev)
>  {
> +
> +       const struct meson_reset_param *param;
>         struct device *dev = &pdev->dev;
> -       struct meson_reset *data;
> +       struct regmap *map;
>         void __iomem *base;
>  
> -       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> -       if (!data)
> -               return -ENOMEM;
> -
>         base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
>  
> -       data->param = of_device_get_match_data(dev);
> -       if (!data->param)
> +       param = of_device_get_match_data(dev);

Just use device_get_match_data()? I don't see any need to use DT
specific APIs.

> +       if (!param)
>                 return -ENODEV;
>  
> -       data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
> -       if (IS_ERR(data->map))
> -               return dev_err_probe(dev, PTR_ERR(data->map),
> +       map = devm_regmap_init_mmio(dev, base, &regmap_config);
> +       if (IS_ERR(map))
> +               return dev_err_probe(dev, PTR_ERR(map),
>                                      "can't init regmap mmio region\n");
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
