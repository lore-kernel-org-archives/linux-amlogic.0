Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F15FE51F3
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Apr 2026 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zv75r9TVrPQ/hqaMh4qMOpb54WB1JywZ6ur7SYaUL/I=; b=buec4lDdKmaCJqg4LrxUtB6SYF
	Y2rD4rLSJix0XK+nSM1KpjZW0+KnVQgcFevUqk61eH1SAXcXcU4phGwJlwmR4WjkqJcGFxhoHXLfu
	IGaX6brGtZVUlhgfmo0xgTpN1MQEEWOcPDG2oqaUk27mb94Fd5JhHB97vnGjqePXv816+vepzaPMd
	diAMS/SC735Ejb7ldfbzenLWgZebu21Kfb6vNFTZ+4hOEuG7CPJQ4PkBZE7SljnMK3b+UIywL7m9b
	4oLBDfmSbZvf8L3cZfY5m0LFKUO8kuxJCO108VBRIzDWVJ/jJ5XrX46jR+t9nx6mwwS/j6aWndmn3
	vOc0sKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDCn-0000000Cxg3-2RlT;
	Fri, 24 Apr 2026 09:52:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGDCk-0000000Cxfh-1wa9
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Apr 2026 09:52:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso82743675e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Apr 2026 02:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777024328; x=1777629128; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pc1sVysh1S9fNSVB7LCxgoFij6tzOKKHQMxXnK9pSc=;
        b=VdtCtrtAzbEQVP8uQVd912kQPNG4aogmxr7Kfnj7687PkU0+CTktS/LAevgFQ1KKk0
         bqcuD1GNya4aoAbbpI7NX+PRSjuZC3iiz0YBZlXSDnDcqn8f/eRC7RMfm0DAUH9+qRXS
         nRTJEzo7OH9Fq6UWv4SZ5to1KHXza3qJRnxb7HA7rRO1W5rq9xMQ2etCX4jnE4DAQ6Cn
         b9v3c3Ph6XT40LwyUEXcTW5A28NqaaTpCsN1Vz6BjYZRXd5UZrfCw1Y2d2oAIvQbfcSd
         FtaBKtv4MzTjnQTlia4l7PS6A0WIjir3CqPmb6PJqydiAfeT/6CZP2NLTELTzLQx54tZ
         reXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777024328; x=1777629128;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pc1sVysh1S9fNSVB7LCxgoFij6tzOKKHQMxXnK9pSc=;
        b=MEtGJjagYg37lsnMO3qVGsttj+a1x4zFx6UNbNxyv+IUl2Y2aZ0F1GcXXsZFZPf+km
         yYVtQctQNjE3aZPxCl5IGXDGGyWiZBEOE0GRryeQqBE/5CD99IahoJ3MWaSIBVqj45Pj
         Cb/h2znlztMk7Hy7GqoZxm4enuhd+c92nxBk+vpf7EQLmSzB8mms09Sz/QOOVzR/v+yD
         P4/F9wy+D1q4ODtymtOFLT4/1Xmfs2R7KPnYUSaButKhrggj7npQZR7G2QU3XjMiuMEV
         ww8t6goVGJv3Eu4qR6iv0uwB6HlQMM5GEn0y8AmPWHt+n/3w95BNycfNov2S+Ywz51c9
         hnUA==
X-Gm-Message-State: AOJu0YzEdSYnOA3aR9MvYtN+og7jQ984cT8eOEY+5tMhEvKGRKFw8M5G
	nAJFI5aKUj5/Q0IA19EHpY67LHgazbylmnYIJe1XP/dS3jT3+fJtf+nXvCaPdJA4nXQwEwTAxf7
	ZSYsq5gw=
X-Gm-Gg: AeBDietMa7Owse82WtNO2YvgeGdVcxObmjI7iq6sp/IGXoaVrZ/zP0KmczD5xJIdD6H
	ClrdzdB+8zPBG99v/Dl54PaBSF8gurQqku7Z3Vzsf8ruvcY0m9FBct9yDCFXBz9cFsRA6p08Gui
	AKPYXmTtPTEC9bMDupOj6XVxvCT+oROidKCs0qvHJ+Mpz2RXLLeL07O2nRx8T4a3QEbB+rY1Ec4
	oYnpM/UIcZLUfPbCGOyMHyDfSCL6yWjzA9iJOTP+2x0VxEE8UuxGhplOYpm0tgUtPC8BOorZszo
	JzNryV4BahpRYM0PLNyP1Kh2zd3oYaH0wzsGD29Nstx2VWRqzSqGGMRiAQ3GRd6renRMlB2l9L/
	PZOwvkA4sPxyDhrvWPlLYg8JCOUo+qp23TNI8h9bIS3vrFatpxpvk1qvttb+3Kz7QVTsecUf2VV
	Jq2UB9jretCVktkLA/K5jAcrZsQxKM6xuWVKAYjmxxSx4pj0hRkvXqOmZ53k2VuM+Au/xVDYXFC
	8JnlhxYRMpmz1OaoiTYcREWgyPK
X-Received: by 2002:a05:600c:888b:b0:485:4bd1:4c64 with SMTP id 5b1f17b1804b1-488fb796f95mr362738975e9.31.1777024328234;
        Fri, 24 Apr 2026 02:52:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:79e1:f56b:445c:ca9c? ([2a01:e0a:106d:1080:79e1:f56b:445c:ca9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc0f8193sm527475855e9.1.2026.04.24.02.52.07
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 02:52:07 -0700 (PDT)
Message-ID: <8757d21d-9208-43f9-a36d-5955b008948a@linaro.org>
Date: Fri, 24 Apr 2026 11:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: linux-amlogic@lists.infradead.org
References: <20260423-add-thermal-t7-vim4-v4-0-d4c1528d5044@aliel.fr>
 <20260423-add-thermal-t7-vim4-v4-4-d4c1528d5044@aliel.fr>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260423-add-thermal-t7-vim4-v4-4-d4c1528d5044@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_025210_555263_967DFB25 
X-CRM114-Status: GOOD (  28.18  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 4/23/26 18:07, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Some SoCs (e.g. T7) expose thermal calibration data through the secure
> monitor rather than a directly accessible eFuse register. Add a use_sm
> flag to amlogic_thermal_data to select this path, and retrieve the
> firmware handle and tsensor_id from the "amlogic,secure-monitor" DT
> phandle with one fixed argument.
> 
> Also introduce the amlogic,t7-thermal compatible using this new path.
> 
> While refactoring, fix a pre-existing bug where
> amlogic_thermal_initialize() was called after
> devm_thermal_of_zone_register(), causing the thermal framework to
> read an uninitialized trim_info on zone registration.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/thermal/amlogic_thermal.c | 115 ++++++++++++++++++++++++++++----------
>   1 file changed, 85 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index 5448d772db12a..0d0c01e57b85e 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -25,6 +25,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/thermal.h>
> +#include <linux/firmware/meson/meson_sm.h>
>   
>   #include "thermal_hwmon.h"
>   
> @@ -84,12 +85,14 @@ struct amlogic_thermal_soc_calib_data {
>    * @u_efuse_off: register offset to read fused calibration value
>    * @calibration_parameters: calibration parameters structure pointer
>    * @regmap_config: regmap config for the device
> + * @use_sm: read data from secure monitor instead of efuse
>    * This structure is required for configuration of amlogic thermal driver.
>    */
>   struct amlogic_thermal_data {
>   	int u_efuse_off;
>   	const struct amlogic_thermal_soc_calib_data *calibration_parameters;
>   	const struct regmap_config *regmap_config;
> +	bool use_sm;
>   };
>   
>   struct amlogic_thermal {
> @@ -100,6 +103,8 @@ struct amlogic_thermal {
>   	struct clk *clk;
>   	struct thermal_zone_device *tzd;
>   	u32 trim_info;
> +	struct meson_sm_firmware *sm_fw;
> +	u32 tsensor_id;
>   };
>   
>   /*
> @@ -133,26 +138,6 @@ static int amlogic_thermal_code_to_millicelsius(struct amlogic_thermal *pdata,
>   	return temp;
>   }
>   
> -static int amlogic_thermal_initialize(struct amlogic_thermal *pdata)
> -{
> -	int ret = 0;
> -	int ver;
> -
> -	regmap_read(pdata->sec_ao_map, pdata->data->u_efuse_off,
> -		    &pdata->trim_info);
> -
> -	ver = TSENSOR_TRIM_VERSION(pdata->trim_info);
> -
> -	if ((ver & TSENSOR_TRIM_CALIB_VALID_MASK) == 0) {
> -		ret = -EINVAL;
> -		dev_err(&pdata->pdev->dev,
> -			"tsensor thermal calibration not supported: 0x%x!\n",
> -			ver);
> -	}
> -
> -	return ret;
> -}
> -
>   static int amlogic_thermal_enable(struct amlogic_thermal *data)
>   {
>   	int ret;
> @@ -190,6 +175,70 @@ static int amlogic_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
>   	return 0;
>   }
>   
> +static int amlogic_thermal_probe_sm(struct platform_device *pdev,
> +				    struct amlogic_thermal *pdata)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *sm_np;
> +	struct of_phandle_args ph_args;
> +	int ret;
> +
> +	ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +					       "amlogic,secure-monitor",
> +					       1, 0, &ph_args);
> +	if (ret)
> +		return ret;
> +
> +	sm_np = ph_args.np;

Drop this sm_np variable and use ph_args.np

> +	if (!sm_np) {
> +		dev_err(dev,
> +			"Failed to parse secure monitor phandle\n");

Single line

> +		return -ENODEV;
> +	}
> +
> +	pdata->sm_fw = meson_sm_get(sm_np);
> +	of_node_put(sm_np);
> +	if (!pdata->sm_fw) {
> +		dev_err(dev, "Failed to get secure monitor firmware\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	pdata->tsensor_id = ph_args.args[0];
> +
> +	return meson_sm_get_thermal_calib(pdata->sm_fw,
> +					  &pdata->trim_info,
> +					  pdata->tsensor_id);
> +}
> +
> +static int amlogic_thermal_probe_syscon(struct platform_device *pdev,
> +					struct amlogic_thermal *pdata)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret = 0;
> +	int ver;
> +
> +	pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
> +		(pdev->dev.of_node, "amlogic,ao-secure");

Rewrite as:
	pdata->sec_ao_map =
		syscon_regmap_lookup_by_phandle(pdev->dev.of_node,
						"amlogic,ao-secure");

> +	if (IS_ERR(pdata->sec_ao_map)) {
> +		dev_err(dev, "syscon regmap lookup failed.\n");
> +		return PTR_ERR(pdata->sec_ao_map);
> +	}
> +
> +	regmap_read(pdata->sec_ao_map, pdata->data->u_efuse_off,
> +		    &pdata->trim_info);
> +
> +	ver = TSENSOR_TRIM_VERSION(pdata->trim_info);
> +
> +	if ((ver & TSENSOR_TRIM_CALIB_VALID_MASK) == 0) {
> +		ret = -EINVAL;
> +		dev_err(&pdata->pdev->dev,
> +			"tsensor thermal calibration not supported: 0x%x!\n",
> +			ver);

Just return -EINVAL here

> +	}
> +
> +	return ret;

return 0

> +}
> +
>   static const struct thermal_zone_device_ops amlogic_thermal_ops = {
>   	.get_temp	= amlogic_thermal_get_temp,
>   };
> @@ -226,6 +275,12 @@ static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
>   	.regmap_config = &amlogic_thermal_regmap_config_g12a,
>   };
>   
> +static const struct amlogic_thermal_data amlogic_thermal_t7_param = {
> +	.use_sm			= true,
> +	.calibration_parameters	= &amlogic_thermal_g12a,
> +	.regmap_config		= &amlogic_thermal_regmap_config_g12a,
> +};
> +
>   static const struct of_device_id of_amlogic_thermal_match[] = {
>   	{
>   		.compatible = "amlogic,g12a-ddr-thermal",
> @@ -239,6 +294,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
>   		.compatible = "amlogic,a1-cpu-thermal",
>   		.data = &amlogic_thermal_a1_cpu_param,
>   	},
> +	{
> +		.compatible = "amlogic,t7-thermal",
> +		.data = &amlogic_thermal_t7_param,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);
> @@ -271,12 +330,12 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>   	if (IS_ERR(pdata->clk))
>   		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");
>   
> -	pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
> -		(pdev->dev.of_node, "amlogic,ao-secure");
> -	if (IS_ERR(pdata->sec_ao_map)) {
> -		dev_err(dev, "syscon regmap lookup failed.\n");
> -		return PTR_ERR(pdata->sec_ao_map);
> -	}
> +	if (pdata->data->use_sm)
> +		ret = amlogic_thermal_probe_sm(pdev, pdata);
> +	else
> +		ret = amlogic_thermal_probe_syscon(pdev, pdata);
> +	if (ret)
> +		return ret;
>   
>   	pdata->tzd = devm_thermal_of_zone_register(&pdev->dev,
>   						   0,
> @@ -290,10 +349,6 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>   
>   	devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd);
>   
> -	ret = amlogic_thermal_initialize(pdata);
> -	if (ret)
> -		return ret;
> -
>   	ret = amlogic_thermal_enable(pdata);
>   
>   	return ret;
> 

With that fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
