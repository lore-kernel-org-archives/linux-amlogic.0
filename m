Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35BBEE57DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 10:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHBoWrM7mAxRZo4pSthFAS3HnOKc5Ab08yBMBqThXK4=; b=AynG4l2aKHxsaxwtUQWF5O5SVC
	9pNCneVTEOEhr/GkcPW1J4Hg85prMyaJidYiTt5cSC7OxqOAi+kY1Tuehvu0bktt+/lN0ZDcft7bF
	jPWPJu5vrf8brxO8NhZHedTslj2E8GiBZZUZuLkOz+2R+4+5VaD/4o64NNZ9RcLVdmtlniKAZrdIu
	zVEnqn/ZT/TMrQfYjIdH9FXgY6B/d5X9PTGnNodPtcv2okt7EYaesPpuTGyZgWXEFYHM12lZohkh5
	Ozf4kDrMAkC+RuzrBD3zbtjlaY3isOx7tOpCAppn9NSnGqdY3aXydEnMzZe2xCCE01EtKHriroDED
	evOCJlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeEh-000Eij-00;
	Mon, 11 Sep 2023 10:33:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeEe-000Ef2-1B
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Sep 2023 10:33:41 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-401d67434daso45561275e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Sep 2023 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694428417; x=1695033217; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hd5+bavmQbtOKvL+wey92Vxqp4guJA0VMGCPEUn7ND4=;
        b=ISjMyztuRcJQWzUz97D9J164sO+VOcIaZiIgDU1nIPgIxfyJSCiFGKCdGs1c/hR7n8
         pzhC7OO7L6ppqwXx7Xy+aUyebp0NBHKCszKzW6VgXyxG7MOT1X7YDpxoA0BDXrZC/FS1
         9sw5wpYwpNnvZYJ0gL55aoik3y9lTkOQquKnss3DbMZRsUxkO6D7lrDB3+oD+OnkjXdI
         QS2tx5XKIcooAFLVzfgdtx1rldXMoFWscoNFis6Vdm5MKuI/tYRDP7bwoXQrDwOUNb4R
         2PvhHkxK9JTAbTylql4ML/NW+EAjv0gsjBWeJ8MWe1UYfId6L5EQebuMhEDOKwJejr75
         qGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694428417; x=1695033217;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hd5+bavmQbtOKvL+wey92Vxqp4guJA0VMGCPEUn7ND4=;
        b=NVuD+FZ3IMsjHaQjSDzkM1UYW6mTwdlM1lh90/3iXHs78u5VstKmKe4zT6VAAfq83C
         IGCkVaKyn4ttjIbBRwdUH5/ZDRtFSTDqyDbx1EhA98YorhAlDmevcRRl9PO78u1NkGaO
         XhM3QxmPL/yrisoKD1wOppQyCaCOIWrn9atkMCNDFtCAY4KSoNUJ0ugD7oTss6YYa7Y4
         S2/H/ABk5ieV4T03vZ39YIK6JSnsY4MYbSckz5KohzsZ49xFRR0n5sav7QeMeAJ8Gtyl
         F2MMjN8lqLNnVR1JzaXO0duRdahYuSrhnVpB1m7g2iPsA9iDNGAf/a4ChFLgJhICbn6/
         Xldw==
X-Gm-Message-State: AOJu0YzXdpofjJ5TvF91VhPUx7cBhS3XtRuOeepJuvfHz2C4YM2/jJR+
	t4S88tXD34Wcl/NxJvSXfiZ+Bg==
X-Google-Smtp-Source: AGHT+IHVdvs08TyzRIACfwL0Gt+0zksvifLWePCc/mECez0aCu5F00s8w2auWW3JiOasBbnRnPrQnA==
X-Received: by 2002:a05:600c:2196:b0:401:b493:f7c1 with SMTP id e22-20020a05600c219600b00401b493f7c1mr8249860wme.35.1694428417556;
        Mon, 11 Sep 2023 03:33:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8? ([2a01:e0a:982:cbb0:daaa:8bc3:eeb7:ce8])
        by smtp.gmail.com with ESMTPSA id r17-20020adfce91000000b003198a9d758dsm9726204wrn.78.2023.09.11.03.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 03:33:37 -0700 (PDT)
Message-ID: <d226525d-b025-48c8-8176-4a3356ba23b8@linaro.org>
Date: Mon, 11 Sep 2023 12:33:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 3/3] arch/arm64: dts: meson-s4: add hwrng node
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, narmstrong@baylibre.com,
 olivia@selenic.com, herbert@gondor.apana.org.au, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, conor@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, f.fainelli@gmail.com,
 hkallweit1@gmail.com, lists@kaiser.cx
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-crypto@vger.kernel.org, kernel@sberdevices.ru,
 Alexey Romanov <avromanov@sberdevices.ru>
References: <20230911101129.10604-1-avromanov@salutedevices.com>
 <20230911101129.10604-4-avromanov@salutedevices.com>
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
In-Reply-To: <20230911101129.10604-4-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_033340_414399_963FBF11 
X-CRM114-Status: GOOD (  10.89  )
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

On 11/09/2023 12:11, Alexey Romanov wrote:
> From: Alexey Romanov <avromanov@sberdevices.ru>
> 
> Using this node, we can obtain random numbers via
> hardware random number generator.
> 
> Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index f24460186d3d..b3a1ecf36467 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -133,6 +133,11 @@ reset: reset-controller@2000 {
>   				reg = <0x0 0x2000 0x0 0x98>;
>   				#reset-cells = <1>;
>   			};
> +
> +			hwrng: rng@440788 {
> +				compatible = "amlogic,meson-s4-rng";
> +				reg = <0x0 0x440788 0x0 0x0c>;
> +			};
>   		};
>   	};
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
