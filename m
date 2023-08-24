Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EA7C27C40
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 08:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxiot1ehV1yQssz+LAhKUEqEf53Y0WQzoGB/YRQJZ6U=; b=rUTiQZ2xMqsNHLDB8mkv56yMPQ
	XNKtAnqbnlcq9zMk1lT12wfpzCax2CV3q7/mPoX4KtiPVLwnKHYcuGj6hcpXbykGNY2luEH3T/+Dv
	oJQoRjZrWnRLBbBMY/OO5KzIVksSlizeXAObpSKuDSjn2tiNFk9/XQAIB5o5TRWrO3AOumu6z899k
	gaEgE5cO8JZses+ON1tqBmfmeaqTOL4MP5e5f/d2c/w48rcktXsFXy6gBBml0kEASpm2HWsT3IXei
	fg7KTgqKYpbL9QO8oXJuLM/KbjS0vMdhEl1As9IKfYT6xYdytHeO+kgo+vr/56p7j/Bdw8HIHi0ko
	IwC7va6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5eA-002YPf-0k;
	Thu, 24 Aug 2023 08:24:54 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ5e7-002YOb-1T
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Aug 2023 08:24:52 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bcc4347d2dso54657381fa.0
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Aug 2023 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692865486; x=1693470286;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MBWUe/welSTyLE0XN0FKQ2m/IGgsZK6nJo7F/yrgL6Y=;
        b=LSoHKy21NykeUkVhVQdpbUKajkdlZpVqlx/6hxXKj4EHeM4spA3kYQ3Jz4WKK5yvAP
         /SSCnwZ/8xpB0IgIQ5yz/VRfVdPDRBEnG2gI6ZdJVWhr6PRN6V9aBZIUP2ol5FMKNMMV
         TeUuJ9Ko+aGEJMWnVmkfed73CcADeoi+9f3BbGOfIts/ia/WOJNpYI4Ko9/OH48lUTYF
         5I2yaQ9ce+D4/EmDDMqDLcpPa6w8rblGqAaxCFKMyB9zLU9n9L96tUXIS6mAScAzHHnV
         VYaVHPsnNZOAi0lXPljkPMwugt3EIeHvQffSPWNofB00ySMNIyHHvg07rfpDJQ9OVHmv
         O7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692865486; x=1693470286;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MBWUe/welSTyLE0XN0FKQ2m/IGgsZK6nJo7F/yrgL6Y=;
        b=ENr6ca8rzSGI5Mm8tocZhd4gyIPwb1QhDTYK/emrq1KoxxZSQDxPpIML0HWe2Lljf9
         xXrlsV7kiasl7CHyCVeUkXUMGCaRe2WCaql9fYCVEE3ioMfz/QL2HXFEJ2jcB/1g3g3n
         Ni/hiw+qi8PPJc0TZXrza7KgrndP/unL/8y6z1dORpOW0P04F2OKEFMMpuNxQsSSEB6B
         WWEY7UvLNDAaXEnCRORmuV+ZA0A5dVFyp3SSNiK/7I87IXuIxJuFesAbpJ650RBZYmlQ
         mBIzhSEmQGTO9uLWG60D4d50h5j3ItMT8T1WDKKcZA0MgLR+zwqr695B+88WM2uuIK0k
         DAKw==
X-Gm-Message-State: AOJu0YzQln1oLfgidY8GtZkTkHsRm7kauMJ4ZDQx8DLGsOMzgK1Va+WR
	6QaqnJRseI+RmXJzpMq1mjuVQg==
X-Google-Smtp-Source: AGHT+IHWcZB9lXJ+vBSQhndi+/YAyJ3D89wEBDbfn5fmHYq1DWowl+vWIotNA3tOjxfImtYPyoRRuQ==
X-Received: by 2002:a2e:8349:0:b0:2b9:5eae:814f with SMTP id l9-20020a2e8349000000b002b95eae814fmr9589719ljh.50.1692865486158;
        Thu, 24 Aug 2023 01:24:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e6d5:d4d4:f3a1:e44b? ([2a01:e0a:982:cbb0:e6d5:d4d4:f3a1:e44b])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c024e00b003fe2bea77ccsm12946wmj.5.2023.08.24.01.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 01:24:42 -0700 (PDT)
Message-ID: <cdab27cb-fea4-4f09-8a66-ce1aa1090186@linaro.org>
Date: Thu, 24 Aug 2023 10:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH V2 1/6] soc: amlogic: modify some power domains property
Content-Language: en-US, fr
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20230824055930.2576849-1-xianwei.zhao@amlogic.com>
 <20230824055930.2576849-2-xianwei.zhao@amlogic.com>
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
In-Reply-To: <20230824055930.2576849-2-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_012451_543410_25B48CBB 
X-CRM114-Status: GOOD (  13.69  )
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
> Some power domains for C3 can be using runtime PM,
> remove ALWAYS_ON property. And add some power domains
> description when ALWAYS_ON property.

The subject should now be:
genpd: amlogic: ....

same for patches 2 & 5.

> 
> Signed-off-by: xianwei.zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2: None
> ---
>   drivers/genpd/amlogic/meson-secure-pwrc.c | 25 ++++++++++++-----------
>   1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/genpd/amlogic/meson-secure-pwrc.c b/drivers/genpd/amlogic/meson-secure-pwrc.c
> index 89c881c56cd7..5ac2437ab8ad 100644
> --- a/drivers/genpd/amlogic/meson-secure-pwrc.c
> +++ b/drivers/genpd/amlogic/meson-secure-pwrc.c
> @@ -122,18 +122,19 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
>   };
>   
>   static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
> -	SEC_PD(C3_NNA,	0),
> -	SEC_PD(C3_AUDIO,	GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_SDIOA,	GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_EMMC,	GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_USB_COMB, GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_SDCARD,	GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_ETH,	GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_GE2D,	GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_CVE,	GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_GDC_WRAP,	GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_ISP_TOP,		GENPD_FLAG_ALWAYS_ON),
> -	SEC_PD(C3_MIPI_ISP_WRAP, GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_NNA,		0),
> +	SEC_PD(C3_AUDIO,	0),
> +	SEC_PD(C3_SDIOA,	0),
> +	SEC_PD(C3_EMMC,		0),
> +	SEC_PD(C3_USB_COMB,	0),
> +	SEC_PD(C3_SDCARD,	0),
> +	/* ETH is for ethernet online wakeup, and should be always on */
> +	SEC_PD(C3_ETH,		GENPD_FLAG_ALWAYS_ON),
> +	SEC_PD(C3_GE2D,		0),
> +	SEC_PD(C3_CVE,		0),
> +	SEC_PD(C3_GDC_WRAP,	0),
> +	SEC_PD(C3_ISP_TOP,	0),
> +	SEC_PD(C3_MIPI_ISP_WRAP, 0),
>   	SEC_PD(C3_VCODEC,	0),
>   };
>   
> 
> base-commit: 413f5c02929bb33042bbc4ee233166550a5fca70

With changed subject:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
