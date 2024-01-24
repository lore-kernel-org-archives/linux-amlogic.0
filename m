Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8245C47DDF
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jan 2024 09:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzVDr48W2T1kZb3SJSayGsLj7dRbBKjXe6VnRz9JvJs=; b=aGyPc2eUSq8EeboM7LxrMQp3+S
	qIkowB5bUTCH5dFcIDHB0MuIPvsEFCLJ5AmDOYpt4hVENZnwtXj1E3IP2XQKgegmyeS6PIOOcthvY
	n4P7V8AnUZfynm6Fnay0ztrjLIcdXcd8ACfGoXTS2tRmVrM7G9Y7ofPbMmEw7SiORpvOTguv5sL8b
	rbXecFMD78p3KA/fbbL+RfND6U9WFP4ayB9FXSt8b4wHzbiYWhWAJ0bN/RVAuPjD385gtL2oLbtgp
	u47YiWM4DU/HZkp1tbRZl6eQDRNJjX2of8dxEqATKhiiRwQ3P0rFY74lCtHSHQWAzMNoybQtGkGlK
	PIWGxktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZKO-00298p-1D;
	Wed, 24 Jan 2024 09:13:48 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSZKL-00296W-1B
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jan 2024 09:13:47 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3367a304091so5555744f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jan 2024 01:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706087621; x=1706692421; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGaFNTm0rKDhMzJZfCGf3yauwaFWWjKUfBj6ngaz/vY=;
        b=Ipg62nJgTWwLCPFQMJOgA4LcDPbdBbvIy+6x5Pho6+PPNy0XAu2PIQNSdLzm5jye7i
         0AMkDLGnkom4ISTNsLMK6hN9UwZnX5EpY0vdJrAlaq/yJy57MifwLc76zuzJgPD6gKno
         +6VEacgwUnwdhEXSi39DprN3Mnz/Usfp5FatQVcubN0II8ZZU2G5ks4ulL2SQpCKltxp
         JSEjVftowzeX3v+uIkjm/X4hlqm8t3oFmrDYkqPY6ytwF18eODrfImWyjMqVEg4WyVPr
         XwRK/bYJFSFhW/7k9lyqCvTIX06ZYkW8oA9r9huZBJPD0QsDBtUEfsFIO5zjdmX8Tzdu
         0hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706087621; x=1706692421;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fGaFNTm0rKDhMzJZfCGf3yauwaFWWjKUfBj6ngaz/vY=;
        b=k9uiHcvHpsHBsT61R48sPrqsSPj+PaoglYGOu/D9VvCcxrjI2FBYdaJH0lCetKSuDg
         cNbNTu0UOjgySMJ6ACHCr8fTXAvpVrvKf0hUSuT/AI/o0Ks4Gqekrf4bfy+PqlNJlRNj
         bwcy0kDAZJ5uKzeLwN0T6idxn1oEFIIOZg+UJBoXweHxR7O2Gtn3nPz5n6hgl0EXjHBn
         XRklfNHdckEPZI0jGoG6eiSJUQednPX++q3i4q08RYVzJn0h+i0TqTXRAOlYjnZSZ77N
         E31hBRhp2+NMFFe1hqEcSlSeI0lhmwFKzquDkXiCPDz+tQ3c2wJnnuUqhQ0kLegAEOm9
         YfrQ==
X-Gm-Message-State: AOJu0Yw68M8oMUKSIuHpXJ8KKKY3eJueKRdGnIKvGmznWBlr1wyXChjy
	699GqXhricd5S0A4teYU+mtNIjVAYQxrc0XvzVKA/DnhnL8Lazh/XoLhVN5RvpQ=
X-Google-Smtp-Source: AGHT+IGb3UlcnEsZFUqNVOVjeSwNjuzYXVL9pU/Vo6NgRusnbHMDF8VTnpV/xhK9NafXCoXsbiaQeQ==
X-Received: by 2002:a5d:49c7:0:b0:337:c829:9838 with SMTP id t7-20020a5d49c7000000b00337c8299838mr207429wrs.69.1706087621095;
        Wed, 24 Jan 2024 01:13:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654? ([2a01:e0a:982:cbb0:fd4f:fd82:e4fb:1654])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d6341000000b0033930b9a2b1sm8329301wrw.26.2024.01.24.01.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 01:13:40 -0800 (PST)
Message-ID: <5f54f139-7710-4276-b31c-3b6cfa319f16@linaro.org>
Date: Wed, 24 Jan 2024 10:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 00/20] Support more Amlogic SoC families in crypto
 driver
Content-Language: en-US, fr
To: Alexey Romanov <avromanov@salutedevices.com>, clabbe@baylibre.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@salutedevices.com
References: <20240123165831.970023-1-avromanov@salutedevices.com>
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
In-Reply-To: <20240123165831.970023-1-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_011345_403207_359AE8FE 
X-CRM114-Status: GOOD (  13.97  )
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

On 23/01/2024 17:58, Alexey Romanov wrote:
> Hello!
> 
> This patchset expand the funcionality of the Amlogic
> crypto driver by adding support for more SoC families:
> AXG, G12A, G12B, SM1, A1, S4.
> 
> Also specify and enable crypto node in device tree
> for reference Amlogic devices.
> 
> Tested on AXG, G12A/B, SM1, A1 and S4 devices via
> custom tests and trcypt module.

Please describe which tests you ran for next version.

Neil

> 
> ---
> 
> Changes V1 -> V2:
> 
> - Rebased over linux-next.
> - Adjusted device tree bindings description.
> - A1 and S4 dts use their own compatible, which is a G12 fallback.

This is not what I meant by fallback, I was meaning having:
compatible = "amlogic,a1-crypto", "amlogic,g12a-crypto";

and them only add "amlogic,g12a-crypto" in the driver.

Same for S4.

Neil

> 
> V1: https://lore.kernel.org/all/20240110201216.18016-1-avromanov@salutedevices.com/
> 
> Alexey Romanov (20):
>    drivers: crypto: meson: don't hardcode IRQ count
>    drivers: crypto: meson: make CLK controller optional
>    drviers: crypto: meson: add platform data
>    drivers: crypto: meson: add MMIO helpers
>    drivers: crypto: meson: move get_engine_number()
>    drivers: crypto: meson: drop status field from meson_flow
>    drivers: crypto: meson: move algs definition and cipher API to
>      cipher.c
>    drivers: crypto: meson: cleanup defines
>    drivers: crypto: meson: process more than MAXDESCS descriptors
>    drivers: crypto: meson: avoid kzalloc in engine thread
>    drivers: crypto: meson: introduce hasher
>    drivers: crypto: meson: add support for AES-CTR
>    drivers: crypto: meson: use fallback for 192-bit keys
>    drivers: crypto: meson: add support for G12-series
>    drivers: crypto: meson: add support for AXG-series
>    dt-bindings: crypto: meson: add new compatibles
>    arch: arm64: dts: meson: a1: add crypto node
>    arch: arm64: dts: meson: s4: add crypto node
>    arch: arm64: dts: meson: g12: add crypto node
>    arch: arm64: dts: meson: axg: add crypto node
> 
>   .../bindings/crypto/amlogic,gxl-crypto.yaml   |  31 +-
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     |   7 +
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   6 +
>   .../boot/dts/amlogic/meson-g12-common.dtsi    |   6 +
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   6 +
>   drivers/crypto/amlogic/Makefile               |   2 +-
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 602 ++++++++++++------
>   drivers/crypto/amlogic/amlogic-gxl-core.c     | 281 ++++----
>   drivers/crypto/amlogic/amlogic-gxl-hasher.c   | 452 +++++++++++++
>   drivers/crypto/amlogic/amlogic-gxl.h          | 115 +++-
>   10 files changed, 1165 insertions(+), 343 deletions(-)
>   create mode 100644 drivers/crypto/amlogic/amlogic-gxl-hasher.c
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
