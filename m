Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719BAD3943C
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Apr 2026 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H03WqU0z2WSVfmt1DwBSo1xWt9ZVJ7ANrAD9h2OxCkY=; b=fE+CpTG8ZuHp7D7nIOfIK3ZxU2
	Nq2JQHI5Jf3856bHeF2AGCaxBJrYUnqn91AXsiBQxdBmciTMfYWgXbqbLesxU58Ulea5ElLacceZH
	k3mFxCpvcD1ehm49Y2YXXcXH5BkBOGS5Xaqf17wPyhq14Uxfoth2pLulUs0lFOG5bu/GL74nVXh8Q
	iAnte36vv4wS87M8OJm9dFcLlDwlr3H+0+YcQCtHF2rUY35TBgmjgo94RjsTXlJVxhvcLozzfsV7C
	2n8Yw4jzhN69yjf0aGVTOe/FJefiG22o+unTdkXrFHvSydi+t8e530h3Pn2SXDGGTAlPPSRlf7qCx
	p71Ff9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8K8Z-00000000SB7-1gRy;
	Thu, 02 Apr 2026 15:39:15 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8K8X-00000000S9o-1ep8
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Apr 2026 15:39:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-43b9d3ebed5so999725f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Apr 2026 08:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775144351; x=1775749151; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwqyVdkU5xmyU+XRaxwsr9L7DuUGafXosoFXRqh5wTY=;
        b=GtJSoTEt9liWSj65QpMjhZ1RuW9+pFmmfRse2J876D3vXcbD4flB4yV4igoEPWZA7u
         Cmt+ZWstNkwi7TezAiyOYOAb3x9yBbrLLhT35X8FghtjM2Dx0XoUrMLMpgnFOgYxPm4p
         anlu0w1fgO/B6t5QmHL4UcaOOx6DkGzD3oJ8rQQwc7OUAiDf7Zn7V9/dsr32okHWuFIc
         a86rPQ3OM55ERLOgJqISy/DGoQylIfzWlKSux6urzfQyt54hz4W4wzqdt649+yZh9cnL
         BydE0M5sdlSwyCPJ/Aeo7sXtRZFsSg7P/AUCI0TRrnUoSffuLkrw7MCztaA+ZR1KMcRr
         V9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144351; x=1775749151;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwqyVdkU5xmyU+XRaxwsr9L7DuUGafXosoFXRqh5wTY=;
        b=lQ9XjeQDZAAdrD5SNVy6av2ratpXZOUIrMS5QU+ct7efoDzRt2SalrMLFJNl8mS7nN
         KPpLxXb3scnhVRC5G1+KAqc/x6kwnCZFbdXlPDB2EPQoU6zdU/e9d0wdl8dICe1qMIvA
         aHcJGiqVIHZbjzDDKoKPIQAU/b4JmFCHHBEv/2MoyfUKFfuG9fKO2mvWxZ+7x+v8FPg8
         CwoCJqmsJ5pke/MGCbyOs8jVv7RAmocSE1aaKSHxPUqhWFHK5Vx1z1qbCAUT+sDtFUh3
         B6ennpnzEtaODw6q7p8fH8FjdQWIW+CwWwxtdKU77XsabUwNXVNyRvH4xo3MClXrlJYA
         +LJw==
X-Gm-Message-State: AOJu0Yynbmq2b3HFcInrkgig7O9Oe+IUVgvcd/dueqOuecGsUYxNwDVr
	UzFMCTzcfrhWsAwfrCDHDP3uy4r2NvAJYXGzfZRFDp9okrNkMzhRapH4jk/6MC5DwvM=
X-Gm-Gg: AeBDieuyZZCyDBhUiPsQ52n1YTtMjeZdLTRb8B23yPdW8odHWxRI24cl7TF/LvhZOHG
	H7gI62g51QBqHXGhxWo7oWMLVnc403icCZctzfGPp3iDPL7T4UcF24CUH6YE1pK3X0yfPHpFbBS
	4wi1N9y+IO7FPzHPkLeNsKb6ic9UiSQGiNap9ADl1luqwZGYDlzKT1bQhELuA4TDUwWNRr0YI7a
	ww2qq8ADukriBmR8zRthc/oaqWF0Nm1x7Ld/hYhCSygSV/hGlTtgYjE6k0WQ7OWlHGwf5vfvZR3
	MC/gamQCw5A05oOkTsFpaeH0YdvGNzgZLROHKsVyaRLbPoWnO49yCWr2G9Ubw8+JxpTge90zhA/
	OEzKme9swMH2SdyArDhM9JwEZkV40UHNXO0Fyzgx6KzoYvUKYhvNKRbkwTPos5bcMllMvG7uRhC
	Ze0yEWVF69IPje/AXs+Dv6VwoW8ocYLEShpRBKbq9UhD7o1azDHWO/t5JrfMmmyt6JO/Kkv05Ee
	0wnIE8=
X-Received: by 2002:a5d:5f45:0:b0:43c:fc5c:aa0b with SMTP id ffacd0b85a97d-43d150fb173mr16260734f8f.42.1775144350679;
        Thu, 02 Apr 2026 08:39:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ac0e:65b8:7f89:413a? ([2a01:e0a:106d:1080:ac0e:65b8:7f89:413a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm8533616f8f.30.2026.04.02.08.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 08:39:10 -0700 (PDT)
Message-ID: <5e3e8684-f893-4fb0-879e-9661820f72dd@linaro.org>
Date: Thu, 2 Apr 2026 17:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/8] thermal: khadas-mcu-fan: Add fan config from platform
 data Add regulator support
To: Ronald Claveau <linux-kernel-dev@aliel.fr>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
References: <20260402-add-mcu-fan-khadas-vim4-v1-0-2b12eb4ac7b0@aliel.fr>
 <20260402-add-mcu-fan-khadas-vim4-v1-5-2b12eb4ac7b0@aliel.fr>
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
In-Reply-To: <20260402-add-mcu-fan-khadas-vim4-v1-5-2b12eb4ac7b0@aliel.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_083913_488662_DD42973C 
X-CRM114-Status: GOOD (  21.18  )
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

On 4/2/26 16:27, Ronald Claveau wrote:
> Replace the hardcoded MAX_LEVEL constant and fan register
> with values read from platform_data (fan_reg, max_level),
> as new MCUs need different values.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/thermal/khadas_mcu_fan.c | 43 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
> index d35e5313bea41..55b496625e3bd 100644
> --- a/drivers/thermal/khadas_mcu_fan.c
> +++ b/drivers/thermal/khadas_mcu_fan.c
> @@ -13,13 +13,15 @@
>   #include <linux/regmap.h>
>   #include <linux/sysfs.h>
>   #include <linux/thermal.h>
> -
> -#define MAX_LEVEL 3
> +#include <linux/regulator/consumer.h>
>   
>   struct khadas_mcu_fan_ctx {
>   	struct khadas_mcu *mcu;
> +	unsigned int fan_reg;
>   	unsigned int level;
> +	unsigned int max_level;
>   	struct thermal_cooling_device *cdev;
> +	struct regulator *power;
>   };
>   
>   static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
> @@ -27,8 +29,7 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>   {
>   	int ret;
>   
> -	ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> -			   level);
> +	ret = regmap_write(ctx->mcu->regmap, ctx->fan_reg, level);
>   	if (ret)
>   		return ret;
>   
> @@ -40,7 +41,9 @@ static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
>   static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
>   					unsigned long *state)
>   {
> -	*state = MAX_LEVEL;
> +	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
> +
> +	*state = ctx->max_level;
>   
>   	return 0;
>   }
> @@ -61,7 +64,7 @@ khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
>   {
>   	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
>   
> -	if (state > MAX_LEVEL)
> +	if (state > ctx->max_level)
>   		return -EINVAL;
>   
>   	if (state == ctx->level)
> @@ -83,11 +86,32 @@ static int khadas_mcu_fan_probe(struct platform_device *pdev)
>   	struct device *dev = &pdev->dev;
>   	struct khadas_mcu_fan_ctx *ctx;
>   	int ret;
> +	const struct khadas_mcu_fan_pdata *pdata = dev_get_platdata(&pdev->dev);
>   
>   	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return -ENOMEM;
> +
>   	ctx->mcu = mcu;
> +	ctx->fan_reg   = pdata->fan_reg;
> +	ctx->max_level = pdata->max_level;
> +
> +	ctx->power = devm_regulator_get_optional(dev->parent, "fan");
> +	if (IS_ERR(ctx->power)) {
> +		if (PTR_ERR(ctx->power) == -ENODEV)
> +			ctx->power = NULL;
> +		else
> +			return PTR_ERR(ctx->power);
> +	}
> +
> +	if (ctx->power) {
> +		ret = regulator_enable(ctx->power);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable fan power supply: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>   	platform_set_drvdata(pdev, ctx);
>   
>   	cdev = devm_thermal_of_cooling_device_register(dev->parent,
> @@ -130,6 +154,13 @@ static int khadas_mcu_fan_suspend(struct device *dev)
>   static int khadas_mcu_fan_resume(struct device *dev)
>   {
>   	struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (ctx->power) {
> +		ret = regulator_enable(ctx->power);

Seems you're missing a regulator_disable() on suspend.

Neil

> +		if (ret)
> +			return ret;
> +	}
>   
>   	return khadas_mcu_fan_set_level(ctx, ctx->level);
>   }
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
