Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E036C27C40
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 08:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6B4cHohLsRMcGXCCNMT9NzI0Pp8n3tYKYjTE4MNGUM=; b=EyxvxPREcsh8OnQArvNaksuneO
	obwYA35suvGnn525fhFPHUCrUi5CGkXdnRDZc+g80/4Cbz5EPNp1dpHqzolSylO09PO3BGbZO3Sqo
	Y48PQ631y1tmIGRS4Vbu8IZfJSyqlcdUcPjf+uys7Q89rol67+MAC+//bWfV5LVx0G1usW1V3ktq3
	HgyKjSoGElN7A0n0Miy4CY1kSgN0sj+ZHeNIlbmmhuoZZohoRWl5vyqjPW87h/RP0D1Ku5T9anR46
	3XD9mg2NMp9vu/GfesuVkyyw31E1S1yCiQqpI9H/VGvlCfKs3u2zNPjmoXsIZ6dR5OMIVL9DYrmbX
	jZm/mUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5hG-002Yr8-0n;
	Thu, 24 Aug 2023 08:28:06 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5hD-002YqL-2r
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Aug 2023 08:28:05 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2bb8a12e819so100080381fa.1
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Aug 2023 01:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692865682; x=1693470482;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjdwqQ0uWrlbkJWuo+U46KrH7QKTD79xul20PtUY7QA=;
        b=WIqcdixLKmmLdnaQukswEXoSl09AoNij4ym3q4xq8v/0rg7k0HSPbaGDi+elDo4TyX
         qzADCpfDmZFGa4mSzmKT0xEY4857ffkU5qoFWwVlYTf6HHFnOMJSb06jEaJY9yX/zRdi
         JlRp/Sotqs86M7x5zBgkXPdMgpqiMcIiHdCLkbpqlvj1S/qDTj7N7zr/6PAJ3Okbgq3c
         /pK27etNgdjCu4tJbovzfYH9tq/qy3qEAHb0AMiyqbav4bqDlJMKzxRfq/QC+Xi4nh1F
         VPHz26bia1/ZRw/oz1XC1RapKAo84KrmrIgzOFbhm9SnvflaO3QBlr2xpHLPtlcHrDY1
         TXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692865682; x=1693470482;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kjdwqQ0uWrlbkJWuo+U46KrH7QKTD79xul20PtUY7QA=;
        b=TlCQofmbBQCXeEAflo5ZxzX+2CLGC8JwRx1gcqHGfIGHm/tthb14+sePboLQaRXwRr
         Qpd95IIbfu1sbeNkhizA5PB32APfbPPs/vvf2j9i749smwZmN6h7X/x/+F21MM3UfPyK
         JclOdEGd9FWH6b95HhFjb0M4u4+lfIfBL1bd0ckC2f9bjrdBKEQA/mXNL9dV3mm6BnSG
         WenATSamT85N1s0iFbAbfHe7WFbD40g+DxzxHJWKK+RiIKCT0i9WYO4VZ+wv6IUicWNn
         7pFI/vmcrVytArLgD6L1hN3Esx8qxKh1WJbISICUAxIDeY/Wcfgez1zM40p4Xs+KLuKR
         hOBw==
X-Gm-Message-State: AOJu0Yw9WpRXk1e1qxt3AWsOGe9CoI3CibusWkHpb5wA/HLhGFHFSM0N
	KiXrv1KRYA3xxzJHnZxI4ZDYlQ==
X-Google-Smtp-Source: AGHT+IGH78Fy+8c6JwG7qxeJucEClM0wxXMWmDebYumzqcZd35hvZR5BLwgj8VKI43fxqmP4PIdX+w==
X-Received: by 2002:a2e:8051:0:b0:2bc:e827:a4ff with SMTP id p17-20020a2e8051000000b002bce827a4ffmr896249ljg.9.1692865681962;
        Thu, 24 Aug 2023 01:28:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e6d5:d4d4:f3a1:e44b? ([2a01:e0a:982:cbb0:e6d5:d4d4:f3a1:e44b])
        by smtp.gmail.com with ESMTPSA id x4-20020adff0c4000000b003180fdf5589sm21866081wro.6.2023.08.24.01.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:28:01 -0700 (PDT)
Message-ID: <741c1e35-648d-4c2f-a939-24bcbec93911@linaro.org>
Date: Thu, 24 Aug 2023 10:27:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2 2/6] soc: amlogic: add driver to support power parent
 node
Content-Language: en-US, fr
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
 <20230824055930.2576849-3-xianwei.zhao@amlogic.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20230824055930.2576849-3-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_012803_952913_6DF5D70A 
X-CRM114-Status: GOOD (  19.98  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 24/08/2023 07:59, Xianwei Zhao wrote:
> From: "xianwei.zhao" <xianwei.zhao@amlogic.com>
> 
> Some power domains depends on other domains, Such as Amlogic T7 SoC.
> Add parent node to support this case.
> 
> Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2: None
> ---
>   drivers/genpd/amlogic/meson-secure-pwrc.c | 26 ++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/genpd/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
> index 5ac2437ab8ad..76527f4946b4 100644
> --- a/drivers/genpd/amlogic/meson-secure-pwrc.c
> +++ b/drivers/genpd/amlogic/meson-secure-pwrc.c
> @@ -19,10 +19,12 @@
>   
>   #define PWRC_ON		1
>   #define PWRC_OFF	0
> +#define PWRC_NO_PARENT  ((1UL << (sizeof(unsigned int) * 8)) - 1)

This is fishy, just use UINT_MAX

>   
>   struct meson_secure_pwrc_domain {
>   	struct generic_pm_domain base;
>   	unsigned int index;
> +	unsigned int parent;
>   	struct meson_secure_pwrc *pwrc;
>   };
>   
> @@ -34,6 +36,7 @@ struct meson_secure_pwrc {
>   
>   struct meson_secure_pwrc_domain_desc {
>   	unsigned int index;
> +	unsigned int parent;
>   	unsigned int flags;
>   	char *name;
>   	bool (*is_off)(struct meson_secure_pwrc_domain *pwrc_domain);
> @@ -90,8 +93,19 @@ static int meson_secure_pwrc_on(struct generic_pm_domain *domain)
>   {						\
>   	.name = #__name,			\
>   	.index = PWRC_##__name##_ID,		\
> -	.is_off = pwrc_secure_is_off,	\
> +	.is_off = pwrc_secure_is_off,		\
>   	.flags = __flag,			\
> +	.parent = PWRC_NO_PARENT,		\
> +}
> +
> +#define TOP_PD(__name, __flag, __parent)	\
> +[PWRC_##__name##_ID] =				\
> +{						\
> +	.name = #__name,			\
> +	.index = PWRC_##__name##_ID,		\
> +	.is_off = pwrc_secure_is_off,		\
> +	.flags = __flag,			\
> +	.parent = __parent,			\
>   }
>   
>   static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
> @@ -202,6 +216,7 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
>   
>   		dom->pwrc = pwrc;
>   		dom->index = match->domains[i].index;
> +		dom->parent = match->domains[i].parent;
>   		dom->base.name = match->domains[i].name;
>   		dom->base.flags = match->domains[i].flags;
>   		dom->base.power_on = meson_secure_pwrc_on;
> @@ -212,6 +227,15 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
>   		pwrc->xlate.domains[i] = &dom->base;
>   	}
>   
> +	for (i = 0; i < match->count; i++) {
> +		struct meson_secure_pwrc_domain *dom = pwrc->domains;
> +
> +		if (!match->domains[i].name || match->domains[i].parent == PWRC_NO_PARENT)
> +			continue;
> +
> +		pm_genpd_add_subdomain(&dom[dom[i].parent].base, &dom[i].base);
> +	}
> +
>   	return of_genpd_add_provider_onecell(pdev->dev.of_node, &pwrc->xlate);
>   }
>   


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
