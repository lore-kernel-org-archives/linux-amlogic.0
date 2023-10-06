Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFC0E81E02
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMLPGDA375lRWYFe457It5pt6DNOVDCHirpsjjyXSjY=; b=vGukqWfgCO2mPrrBZLeWcV/isz
	t7aVqiW3PCnUyKTu15wh+BZs+HlsFL9naihISMiYI+hjFRiVN9Nzx9Xj5b119z5ECpIuJ4UbShSmD
	08NxzAgkjGq7JurTiYIap4jmmgF4JpVeqCK/ztAKUWY0bWN9YudCgpAhn6RGaig9PYvhg6+ucovhX
	XTqoQogNgI/W5YVbfs4/zxTFSYCdCVJGnNfx83BtyTmHOS9mfUKsjDITlRBFXDLN7cDW45I3QLWSv
	XLWcpHDW0pnQ72LxU09X6Qc7XOhweebvH8FwdsRk5VcqhZY+U7tEeb2U+3Z8ndw6AAzZKZ1bxbQV5
	GFna2PKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qom5l-0060ax-0b;
	Fri, 06 Oct 2023 14:46:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qom5h-0060aC-2P
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 14:46:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4066241289bso20072435e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Oct 2023 07:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696603566; x=1697208366; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsQDvBQyiI7S1j64qZjOzMp7n6CvTcSWgBEdZ94b3pE=;
        b=rD24igdofJczc+E/QxFouOZymPfc1M1ECGTGLBvCOjQGj+kBmLui3rzJ2JLKSPvXaz
         hndPflj5kY8ZwJnLwmtUBmihg45ono8lmqBj5g0vXzMV4gjO0mHiox/M+twqA9eXvTRK
         dTPK9OvEkAkF1jFCMufJiC440BwWrpY0hgFjJTy82a7ezIMzLx1jxPnYbRdiy0ZPx2gd
         gtsqpnIgKy818VYHkxBaVAUnNeBjsD1ZVZrpXM+PS+HxbBH90mCYk7vvVMyAx3VmCtvA
         SdGC7vbvsJlBu0l7yl44sJb84TwS3S1ntJfWa6mc0D4GUfPfJ+GsjWpGFpdsX/TBAtnC
         hmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696603566; x=1697208366;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TsQDvBQyiI7S1j64qZjOzMp7n6CvTcSWgBEdZ94b3pE=;
        b=HjMb52YyOcHq7VmGMAEyw9MB93IqyiJtqkNeHXhob5DEsO+NdLxpPysgU0DIx3h27C
         RtiW83cjELkQXQLNVLg3aD0zfLktJ7W29RYNPmJYZ2dYXWI98e+y+3Eoe2TFSDedDLm6
         V2LK8jOWeqPq0w2HATwhQvCxohG1yZHJTieNq7oOoikSMWNqaKQ/vnAztXaj37KaxFOr
         7G/kwkbY4In3TyqP+SpfVgekQoGwQpe3VLWGV4SeeQuDhY+Bhb/BsV3zLHS2RpYNmJVT
         kxAA/dnufpMUcq4z04+ypUUmvIl6m8Np7KVTn+JLFNZggmbiz6RJ4hgS0dZV4NNf9vh/
         RHuA==
X-Gm-Message-State: AOJu0YwavXvZwLkaRQmWmIX+S7DiycFb/7Xb1lnfz4EA1e0RH1K284Nu
	gJONCoP9hMRkEcnIBImx5IGqCA==
X-Google-Smtp-Source: AGHT+IHOEx8hnq/2d9DKkAgq6eUQMbDQ/kXB5aALk4KT7MHdLPXMvo4kgKcbMjARb2k4mqu/vhasFQ==
X-Received: by 2002:a1c:720c:0:b0:3fe:5501:d293 with SMTP id n12-20020a1c720c000000b003fe5501d293mr7513137wmc.30.1696603566357;
        Fri, 06 Oct 2023 07:46:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c8f7:4bc7:2e11:c133? ([2a01:e0a:982:cbb0:c8f7:4bc7:2e11:c133])
        by smtp.gmail.com with ESMTPSA id m7-20020a7bce07000000b003fc16ee2864sm3896804wmc.48.2023.10.06.07.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 07:46:05 -0700 (PDT)
Message-ID: <bf5e3789-8ca3-4347-95c3-278aa1e65be5@linaro.org>
Date: Fri, 6 Oct 2023 16:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: cottonwood: fix blue/green led
 inversion
Content-Language: en-US, fr
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Da Xue <da.xue@libretech.co>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20231006141915.3623097-1-jbrunet@baylibre.com>
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
In-Reply-To: <20231006141915.3623097-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_074609_847093_13B68BF2 
X-CRM114-Status: GOOD (  12.20  )
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

On 06/10/2023 16:19, Jerome Brunet wrote:
> While making the v2, blue and green LED pwms got inverted
> This change fixes the problem
> 
> Fixes: 9f841514c9c2 ("arm64: dts: amlogic: add libretech cottonwood support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> index ed826f673349..35e8f5bae990 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> @@ -70,7 +70,7 @@ led {
>   			function = LED_FUNCTION_ACTIVITY;
>   			linux,default-trigger = "heartbeat";
>   			max-brightness = <255>;
> -			pwms = <&pwm_cd 1 1250 0>;
> +			pwms = <&pwm_ab 1 1250 0>;
>   			active-low;
>   		};
>   	};
> @@ -83,7 +83,7 @@ led {
>   			function = LED_FUNCTION_STATUS;
>   			linux,default-trigger = "default-on";
>   			max-brightness = <255>;
> -			pwms = <&pwm_ab 1 1250 0>;
> +			pwms = <&pwm_cd 1 1250 0>;
>   			active-low;
>   		};
>   	};

Squashed into 9f841514c9c2 ("arm64: dts: amlogic: add libretech cottonwood support")

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
