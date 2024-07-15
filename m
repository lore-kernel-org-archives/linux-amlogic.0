Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843C7C3DA59
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2024 22:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cN4wMZwCmXf2QRkNM5PGQkfWtoJ4RSVDbaq/t04S64=; b=JUz/g+yf5CAo44
	ZTN/CabFlaW95Oi/ppZttBbgnUTmz25I+/0Z/8TNJf0eT5BM5X2DKYRLkMIX5zgi/3INh+aVxa2Tj
	44IVw6WrnDxYMtHq5l7mCpgDNc2uNUlHSb3E3JbOr/u8DiXBsKXfUf+5HAs197B59N5fR4lZmconz
	Znwz/hnw9ZWMHZoLUD+kkkfV/ZZYzwFeE5xDkFgkC94ZHRc4X3uAOu50A+EY/qI733ANJ6CKx31Tj
	hxdVn2tbRIB1FaYnmFud4fzRYAckevhDwEOE46sVj82ZmmAxQHwkfCW+s5+ny6nLFn6sT86xbow5a
	wG0Y+inMhBQsTyXkwXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTUVg-00000008d5N-3c6I;
	Mon, 15 Jul 2024 22:49:32 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTUVc-00000008d4g-2gwz
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Jul 2024 22:49:31 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 38A91100006;
	Tue, 16 Jul 2024 01:49:27 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 38A91100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721083767;
	bh=WND29VorzY0w6bH7gEw1lRw9RzKDdjhK4hntDg+MDfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=t76uOPkvAdYgM49AoCJmc+0tAobQ5RLEXgwjOlE7jnPTLdQ+rVKkqfE3jZA5+9l8B
	 uWmWcmNZgiivULJrjuzyDwtRITvu4iZVB8qcuXa++izOZ66jYYDB4n5f+tzldD4unp
	 6zIcBFaGxIR8QRjaagfqK3VVIVyvUJ0CVbbGIfZdbCz2xmfZU72w1HjBy2QhkJarJu
	 dfydv20/PxYAmSNSOI7jMXz3X8nHeoWJbgw5ZjgkMbmeThSICD5DKFN0hVdToDW56z
	 /HOOL0A45t95eT23PRIqIOhNlMo8aiYhym58tlwTbnxkHWGCb/Ly2fUnSMiN84PFyc
	 uvefHo2M1RRJw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 16 Jul 2024 01:49:27 +0300 (MSK)
Received: from [172.28.128.6] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jul 2024 01:49:26 +0300
Message-ID: <66ef4ff5-b472-44ee-a4fc-a68ceacea159@salutedevices.com>
Date: Tue, 16 Jul 2024 01:48:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] reset: amlogic: split the device and platform probe
To: Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
 <20240710162526.2341399-4-jbrunet@baylibre.com>
Content-Language: en-US
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240710162526.2341399-4-jbrunet@baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186528 [Jul 16 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/15 21:24:00 #26011023
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_154929_055444_DBC6F4A1 
X-CRM114-Status: GOOD (  21.84  )
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



On 7/10/24 19:25, Jerome Brunet wrote:
> To prepare the addition of the auxiliary device support, split
> out the device probe from the probe of the platform device.
> 
> The device probe will be common to both the platform and auxiliary
> driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/reset-meson.c | 55 +++++++++++++++++++++++--------------
>  1 file changed, 34 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index 59126c9f194a..fec55321b52b 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -87,6 +87,27 @@ static const struct reset_control_ops meson_reset_ops = {
>  	.deassert	= meson_reset_deassert,
>  };
>  
> +static int meson_reset_probe(struct device *dev, struct regmap *map,
> +			     const struct meson_reset_param *param)
> +{
> +	unsigned int stride = regmap_get_reg_stride(map);
> +	struct meson_reset *data;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->param = param;
> +	data->map = map;
> +	data->rcdev.owner = dev->driver->owner;
> +	data->rcdev.nr_resets = param->reg_count * BITS_PER_BYTE
> +		* stride;
> +	data->rcdev.ops = &meson_reset_ops;
> +	data->rcdev.of_node = dev->of_node;

It will be good to add here something like this. Later it would help in
reset debugging.

data->rcdev.dev = dev;

> +
> +	return devm_reset_controller_register(dev, &data->rcdev);
> +}
> +
>  static const struct meson_reset_param meson8b_param = {
>  	.reg_count	= 8,
>  	.reset_offset	= 0x0,
> @@ -125,46 +146,38 @@ static const struct regmap_config regmap_config = {
>  	.reg_stride = 4,
>  };
>  
> -static int meson_reset_probe(struct platform_device *pdev)
> +static int meson_reset_pltf_probe(struct platform_device *pdev)
>  {
> +
> +	const struct meson_reset_param *param;
>  	struct device *dev = &pdev->dev;
> -	struct meson_reset *data;
> +	struct regmap *map;
>  	void __iomem *base;
>  
> -	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> -	if (!data)
> -		return -ENOMEM;
> -
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -	data->param = of_device_get_match_data(dev);
> -	if (!data->param)
> +	param = of_device_get_match_data(dev);
> +	if (!param)
>  		return -ENODEV;
>  
> -	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
> -	if (IS_ERR(data->map))
> -		return dev_err_probe(dev, PTR_ERR(data->map),
> +	map = devm_regmap_init_mmio(dev, base, &regmap_config);
> +	if (IS_ERR(map))
> +		return dev_err_probe(dev, PTR_ERR(map),
>  				     "can't init regmap mmio region\n");
>  
> -	data->rcdev.owner = THIS_MODULE;
> -	data->rcdev.nr_resets = data->param->reg_count * BITS_PER_BYTE
> -		* regmap_config.reg_stride;
> -	data->rcdev.ops = &meson_reset_ops;
> -	data->rcdev.of_node = dev->of_node;
> -
> -	return devm_reset_controller_register(dev, &data->rcdev);
> +	return meson_reset_probe(dev, map, param);
>  }
>  
> -static struct platform_driver meson_reset_driver = {
> -	.probe	= meson_reset_probe,
> +static struct platform_driver meson_reset_pltf_driver = {
> +	.probe	= meson_reset_pltf_probe,
>  	.driver = {
>  		.name		= "meson_reset",
>  		.of_match_table	= meson_reset_dt_ids,
>  	},
>  };
> -module_platform_driver(meson_reset_driver);
> +module_platform_driver(meson_reset_pltf_driver);
>  
>  MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
>  MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
