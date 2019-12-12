Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3825C43603
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 10:20:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6717206A5
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 10:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L+ZqhUPC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ch+J675q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6717206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uJtyxpYL/VCuj5zPuu5VPnR64qvKihVUHJZEb+XKFa8=; b=L+ZqhUPCRjnU2agjLaKe04JD3s
	zMbiMAwqG+q1Q4Lh79DFSXimVABwYJHVNzNaS/m/FapyYJfF618KhV70rAAvV5FsU17YZAQPpigux
	Uj4ouWIesaqFlCgoSE2y5y4m6pdboh13cxHKM/HHNiKJLGr1hfRVR08N07kqrSArnDd7CRvGj4HoW
	SaAn6q5c1bSxa+3NTSyhI1VWQ/M/0f62J04SCqO3FwmQq3TbJRdZy0cAE/WznjmczD3zkErtcWfjZ
	Lk29JR4H4W7EuMhiN7cHVPrElW1bUjma76JJL2csTi5Q1b4lZ8jSiAPqvgbvI4Wfs9U6GeOswVLrH
	9y8sJ7Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifLZz-0002U1-OE; Thu, 12 Dec 2019 10:20:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifLZk-00015f-IO
 for linux-amlogic@lists.infradead.org; Thu, 12 Dec 2019 10:20:06 +0000
Received: by mail-wr1-x443.google.com with SMTP id y17so2102974wrh.5
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2019 02:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=FWshdGOlPI7yjVJAElFvMo0mlzQ6xIrNID/VuBYtMSo=;
 b=Ch+J675qtJbBX8NFcLS7CYqYDrNctC1O0yw6s4DcnHprhA91RaEmIlTNuyNTsQwWrC
 hvbgwH5ipBMwZN/Ar5J6GQJPFZwa49XYAT5QK12dmuqXkFJ0ZMPa8A24SpxxohwxxDIj
 S5KM2WaPLDMe6iu+lTejbUH7fGBZnQGwsexvq9rgMDEX9KjE9q5UJDGKhGFrNhSVAq+D
 xJWnK6ThYoeS8N9wQg0AWif5xusWzRBrA5KLqeo8coRGQUVOFs8e6o34T/CfPalY1nPl
 7K7IlI+Tg35SVoDo2AnDk4E0bjXPrZ+iNJn28zUBHamlbQDZxtlLAeg+ce0MtasPGheL
 RmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=FWshdGOlPI7yjVJAElFvMo0mlzQ6xIrNID/VuBYtMSo=;
 b=TbQ1WnXcdzpAYZikH6OfeU5ODgWFjrw4zIhzCdkdS0cgjn3DdnFW1t4kGIHgYmYRWu
 /0Ha4wBbJuDMDjbE5FiXcZHyd3U7vtfMPJUo5BNFYkdBNNuNZw+p2RyrKBIP5LcHq3lC
 FKmVXyLQcztaeVb1FGJF40tSQ4b1EggBfLRztE1I/rrDw6glBipuhpNjUR5QV7a949WS
 3toHkio4kd/waVriTNL7dDYctW5mKKcP+CreipBp5uehNDT993NApAPE7GlaA6xi5k7p
 u88MJFOjuIUqqnlakT+4jxOfe0gm6Nsq2w9E9a0xMwBTJKkt9A/5nryxYj4xp11wbyj3
 CEug==
X-Gm-Message-State: APjAAAV75cOu2d2T2W0LuEbbYc6L5RKIuQU8c7vrJhbDSO/cMLzcK/CZ
 5VFBkMB7yHdkWqAFs7Xm3EOSTA==
X-Google-Smtp-Source: APXvYqw+sp+j42VZGq85rGThgx/ogUAVCFmxSUrPZRugAeSCRN9cShhFUB1lK7uDgM7f0ZfqlYo+zg==
X-Received: by 2002:adf:ffc7:: with SMTP id x7mr5320534wrs.159.1576146000146; 
 Thu, 12 Dec 2019 02:20:00 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e6sm5485646wru.44.2019.12.12.02.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 02:19:59 -0800 (PST)
References: <20191206074052.15557-1-jian.hu@amlogic.com>
 <20191206074052.15557-4-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 3/6] clk: meson: eeclk: refactor eeclk common driver to
 support A1
In-reply-to: <20191206074052.15557-4-jian.hu@amlogic.com>
Date: Thu, 12 Dec 2019 11:19:59 +0100
Message-ID: <1j7e31lub4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_022004_624559_EF1E3819 
X-CRM114-Status: GOOD (  16.09  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Chandle Zou <chandle.zou@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 06 Dec 2019 at 08:40, Jian Hu <jian.hu@amlogic.com> wrote:

> Introduce a common probe function for A1 series, the way to get
> regmap is different between A1 series and the previous series.
> The register region is only for one clock driver, the function of
> meson_eeclkc_probe is not fit for A1, So it is necessary to
> introduce a new function.

Please drop this patch

#1 you are patching the EE driver for something that is no longer an EE
 driver
#2 Let's get the basics right, you can move (re)factoring afterward

Your probe function is simple enough. Just properly write it in each
driver for now.

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/meson-eeclk.c | 59 +++++++++++++++++++++++++++------
>  drivers/clk/meson/meson-eeclk.h |  1 +
>  2 files changed, 50 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
> index a7cb1e7aedc4..12ceb1caabd8 100644
> --- a/drivers/clk/meson/meson-eeclk.c
> +++ b/drivers/clk/meson/meson-eeclk.c
> @@ -13,25 +13,37 @@
>  #include "clk-regmap.h"
>  #include "meson-eeclk.h"
>  
> -int meson_eeclkc_probe(struct platform_device *pdev)
> +static struct regmap_config clkc_regmap_config = {
> +	.reg_bits       = 32,
> +	.val_bits       = 32,
> +	.reg_stride     = 4,
> +};
> +
> +static struct regmap *meson_regmap_resource(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	void __iomem *base;
> +	struct device *dev = &pdev->dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return ERR_CAST(base);
> +
> +	return devm_regmap_init_mmio(dev, base, &clkc_regmap_config);
> +}
> +
> +static int meson_common_probe(struct platform_device *pdev, struct regmap *map)
>  {
>  	const struct meson_eeclkc_data *data;
>  	struct device *dev = &pdev->dev;
> -	struct regmap *map;
>  	int ret, i;
>  
>  	data = of_device_get_match_data(dev);
>  	if (!data)
>  		return -EINVAL;
>  
> -	/* Get the hhi system controller node */
> -	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
> -	if (IS_ERR(map)) {
> -		dev_err(dev,
> -			"failed to get HHI regmap\n");
> -		return PTR_ERR(map);
> -	}
> -
>  	if (data->init_count)
>  		regmap_multi_reg_write(map, data->init_regs, data->init_count);
>  
> @@ -54,3 +66,30 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  					   data->hw_onecell_data);
>  }
> +
> +int meson_eeclkc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *map;
> +
> +	/* Get the hhi system controller node */
> +	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
> +	if (IS_ERR(map)) {
> +		dev_err(dev,
> +			"failed to get HHI regmap\n");
> +		return PTR_ERR(map);
> +	}
> +
> +	return meson_common_probe(pdev, map);
> +}
> +
> +int meson_clkc_probe(struct platform_device *pdev)
> +{
> +	struct regmap *map;
> +
> +	map = meson_regmap_resource(pdev);
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	return meson_common_probe(pdev, map);
> +}
> diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
> index 77316207bde1..a2e9ab3a4f6b 100644
> --- a/drivers/clk/meson/meson-eeclk.h
> +++ b/drivers/clk/meson/meson-eeclk.h
> @@ -21,5 +21,6 @@ struct meson_eeclkc_data {
>  };
>  
>  int meson_eeclkc_probe(struct platform_device *pdev);
> +int meson_clkc_probe(struct platform_device *pdev);
>  
>  #endif /* __MESON_CLKC_H */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
