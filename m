Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FF8C4829C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqRY/UXjgCgVdIejk++3ZmgzsRKk2m36yBFZtc2nHDo=; b=iHXuFJsZHGcxMYDggR3M7WQ85M
	GdVZDhQtNljYNzU9ofg76hFtRcqxr9rvqAdESS+woNXdSwvMiBvFb+2GFN50M6J7o8kjiK35OOD+w
	02D7NqayEEQGx8OQh2YsBOcBepplAysEhJWWbf686Bo3MXXjWRDAkugp0pPq67zBI15TEPD7yCPF8
	B3jyarkJLl+mIlWbICKVjW1X9ea20TBvjRSpGAr+pzY/hEjDVT4TyvYZzj1I2lqwzaCDBHIoVuWEB
	uwAyLS9UklZyPiuky0H4FFO2uWvcixJYB3RGBY+YnKmPvfaPxfaDqzuaZgr7RlfN9KSg0ZsbOd/7T
	OVdsmXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZpT-00000006Mgc-3ZDg;
	Mon, 12 Feb 2024 17:10:51 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZZpQ-00000006MeH-1yfL
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:10:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4108cbd92b9so15995425e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707757846; x=1708362646; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGvoruSq5+YyVDp5RLm++NC4frHeOZ73PUQlBpNiOaA=;
        b=FQkcWRi3AiIl+ddq6I3EWA7qLuNitXVkD9ySxFJpmdgWcwg96LofY/eoVsjO/sOTBI
         joc23336WiMPIJV7Md/dfrg89Ecvt3WiIO5xIwkdxmsmLkKB8NWm7qJUXC60ZkoK9oS/
         HHIvVzDiJvGu0FvQing7qXo8sZJJalbREhU+V2+T6c4uIEJJ4Fdld760dpEl+CsVbCK4
         4iIhUFWkcA81g9imtX7+5i/Flyqlfy2+mlWKtfKQOYHsjy/gIYnCNp0h8pOR2dgH2z01
         72pEJaNgsrL+6A8Hp5cOShK54npOGoIWzfN04e4XnF2h3iIsc+5ERedjBxLEeRVU59zR
         cuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707757846; x=1708362646;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aGvoruSq5+YyVDp5RLm++NC4frHeOZ73PUQlBpNiOaA=;
        b=YnB5UYeSmp4tFAZ/Duak1qQ/Mqq0P2g7GWEn4vdOz8oMLXgeDaj6tDlRVEK8xTn05b
         lscfRwhfSf/m4AD/1QU+PsJZhSq1Uys6EB+ZmyzlPOfDC0bfev/XWDhUzE1jaurUgEgK
         aQ8zTl4u+Htk/qXyYuqR+afzDaAVnpRVhYL1C71hM9vFxh8s+j6MciyRNfiUg4y4lKbH
         sTwK5Wuke4eQZoyOK8ENSSUYntxNF3Rcdns56ZBSXhR50wQObHEnv+0IsltSU1/kfj2F
         XbER8jr87bWLRtcdWBJmUcsiDbXNVLSSqr3ESF3CKaRI+wjhPZrWG70PYhT7EK3Gk5xo
         9xgg==
X-Gm-Message-State: AOJu0YxbAPRj6CE2sAIaU5qwjuT9OAXXJB8reIu6kiRUUCBLlDtS6IK5
	1lRZuaAZa3u6PIOQJlZPjyeGCGcD/TrUFR8vfvWS4MWLpggc/hQptdN0wGk1sbM=
X-Google-Smtp-Source: AGHT+IHv8Iv2oon4/pAefr7VSRrspM+Uy/4mCCVPMigXDwU/+OPple5+0vJd3k1xTpdbpcl05kjDoA==
X-Received: by 2002:a05:6000:1a85:b0:33b:bf2:a2f6 with SMTP id f5-20020a0560001a8500b0033b0bf2a2f6mr6873205wry.65.1707757845739;
        Mon, 12 Feb 2024 09:10:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXGOIgfTzE63pZ6poBPoQYRrQlvVwEwgtFQ+YK2UaU8T2eS9CeG28pbIHi+I8xotMsaeO3OPyIbociF8Wof2kfkAt8yGaWYrXiW8GnBLcLTes1nEb/O8IGLYN1nBklT1iq3wcHAvx+1tnr2Pc9Q1JLzlWJ1Rh9dFpkQFxnLArfd8vRKB/4/NTbNhhX6r0Y9POLcQk9ekot8P7fID8VC6HxuwC9rbaTBsAtNkJTrLRjUq5FfINzb8esuVZMr1Bn2A9hNr/e5ds93o6sOu7rexooG5O+RmrOBX8LoGrbatEmwBVaZs6KzmqnWE1XbLAgks1Y+30K5ucOskmjXwmIDMWSMDv6Fy9JuHH1YX0MAR1ezBmwiK+kFtGOw7SoH0HqxLlIPl0a2l7gTEgt965qCmQN6nWa5LQ8Y564VmHh9Zdf5A/QA9KkovdPXAkax3/TYodICl7Ag+LoL4ZOueyK5ycH3x++fgyCYqdAulRPAVv3dxlEoZvYcaFFaTedk/qkcCR49wxqJsiCZWqgR17GngaVM8tTMboj+m7IcBqRdfojq0m6kqmyaU8iE9rVLCSNwRsH2e7OA5jfxnDkSWU3IziAjPgF8ROvUvzug
Received: from ?IPV6:2a01:e0a:982:cbb0:fcee:f026:296d:135f? ([2a01:e0a:982:cbb0:fcee:f026:296d:135f])
        by smtp.gmail.com with ESMTPSA id ck13-20020a5d5e8d000000b0033b684d6d5csm7440536wrb.20.2024.02.12.09.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:10:45 -0800 (PST)
Message-ID: <0ccbe65c-4a68-472e-8de0-79e88691d364@linaro.org>
Date: Mon, 12 Feb 2024 18:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 03/20] drivers: crypto: meson: make CLK controller
 optional
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, vadim.fedorenko@linux.dev
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240212135108.549755-1-avromanov@salutedevices.com>
 <20240212135108.549755-4-avromanov@salutedevices.com>
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
In-Reply-To: <20240212135108.549755-4-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_091048_556646_23840C06 
X-CRM114-Status: GOOD (  18.58  )
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

On 12/02/2024 14:50, Alexey Romanov wrote:
> Amlogic crypto IP doesn't take a clock input on some
> SoCs: AXG / A1 / S4 / G12. So make it optional.
> 
> Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> ---
>   drivers/crypto/amlogic/amlogic-gxl-core.c | 21 ++++++++-------------
>   drivers/crypto/amlogic/amlogic-gxl.h      |  2 ++
>   2 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> index 4d1b1d5b7a54..54113c524ec5 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> @@ -250,6 +250,7 @@ static void meson_unregister_algs(struct meson_dev *mc)
>   static const struct meson_pdata meson_gxl_pdata = {
>   	.descs_reg = 0x0,
>   	.status_reg = 0x4,
> +	.need_clk = true,
>   };
>   
>   static const struct of_device_id meson_crypto_of_match_table[] = {
> @@ -285,17 +286,14 @@ static int meson_crypto_probe(struct platform_device *pdev)
>   		dev_err(&pdev->dev, "Cannot request MMIO err=%d\n", err);
>   		return err;
>   	}
> -	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
> -	if (IS_ERR(mc->busclk)) {
> -		err = PTR_ERR(mc->busclk);
> -		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
> -		return err;
> -	}
>   
> -	err = clk_prepare_enable(mc->busclk);
> -	if (err != 0) {
> -		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
> -		return err;
> +	if (mc->pdata->need_clk) {
> +		mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
> +		if (IS_ERR(mc->busclk)) {
> +			err = PTR_ERR(mc->busclk);
> +			dev_err(&pdev->dev, "Cannot get and enable core clock err=%d\n", err);
> +			return err;
> +		}
>   	}
>   
>   	err = meson_allocate_chanlist(mc);
> @@ -322,7 +320,6 @@ static int meson_crypto_probe(struct platform_device *pdev)
>   	meson_unregister_algs(mc);
>   error_flow:
>   	meson_free_chanlist(mc, mc->flow_cnt - 1);
> -	clk_disable_unprepare(mc->busclk);
>   	return err;
>   }
>   
> @@ -337,8 +334,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
>   	meson_unregister_algs(mc);
>   
>   	meson_free_chanlist(mc, mc->flow_cnt - 1);
> -
> -	clk_disable_unprepare(mc->busclk);
>   }
>   
>   static struct platform_driver meson_crypto_driver = {
> diff --git a/drivers/crypto/amlogic/amlogic-gxl.h b/drivers/crypto/amlogic/amlogic-gxl.h
> index 9ad75da214ff..a36b9bac63a0 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl.h
> +++ b/drivers/crypto/amlogic/amlogic-gxl.h
> @@ -82,10 +82,12 @@ struct meson_flow {
>    * struct meson_pdata - SoC series dependent data.
>    * @reg_descs:	offset to descriptors register
>    * @reg_status:	offset to status register
> + * @need_clk:	clock input is needed
>    */
>   struct meson_pdata {
>   	u32 descs_reg;
>   	u32 status_reg;
> +	bool need_clk;
>   };
>   
>   /*

You may use devm_clk_get_optional_enabled() instead, bindings will ensure
clock is provided when needed.

With this you can also drop the clk_disable_unprepare() in meson_crypto_remove().

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
