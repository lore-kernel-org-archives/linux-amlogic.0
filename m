Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59837C10DAA
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 16:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cgIjMZbaEEJWN2rNNDTSLIApUn7oNXsctyRQjPKOIg=; b=U4fcxUI7GDKeBblkX1/c3lFnRu
	JTUA+PTZrrGx+AMJUZmcbn/AcdKC60TBdU31YYfQGFUSvFw7JgqR0ezmd8qME4Unfuc5GwJKcsH7v
	j+ojkLEYHsxIO+nJVVGBt/5ggYWp14TscRVBcivpu6v3tgMjB3n2XF1E97d58oG1M4E+RtcHWIl1j
	M/RmWNyVczb9in7pqIZqR4G10rxzOtX/+07Pj8P8KgaVnkPiF1bJWDlCJzEQ5TZmyFeZNTYfjMNQ4
	DEZbwp+1ryjiTyROQRMJZHNxmtfTtf8mxkX4rxNFjO4VihnCTWFehG1SLjNfqjsEd3kaG5jShSiwj
	uZMlSa7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NJ6-008s6B-1o;
	Wed, 29 Nov 2023 16:21:00 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NJ3-008s5p-0x
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Nov 2023 16:20:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b2fa4ec5eso53367605e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Nov 2023 08:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701274853; x=1701879653; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QQ2BW9Ne27jP4rV4wTRrZBadP+T5Osn/uqKd59KU9Sc=;
        b=lwgyk2MuArXAR+T0KA/6bqNp+advscKitfXOpya5T1umRf5waqt0A9T/rYbDlEgBBU
         G0q6vT2LSnAoqpIt1fCkilYrVTJj1XJ6wyjD7Yw/waalGjBXMjDq5/N3glGojnnRUUHv
         vk25+CBDgsEUcIsowmL0XTW5uajrzzHc7VZoqwKIMah8uR0RrIPCuXuJkwQ6JyHOBgVj
         ABKFIvBVG+VdAoTfzEzNAc0fas6CGQBiFklGthoz92quKiE2gWQBdWP212Sx8cLJ3GgU
         Edi84BBt9NxNvIlFlQlEOOQmjOPZba15hoEpQRrzPTEt0ReqLPcYGGItoRg1UdO/wAw3
         /iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701274853; x=1701879653;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QQ2BW9Ne27jP4rV4wTRrZBadP+T5Osn/uqKd59KU9Sc=;
        b=QzyVMc/ucT1oNNWlCgVWo0WDnMr/pRj6FZUS1pjkJKbsnp7xcboLJfqreAdDT7CdH2
         qPC3C7cLcgTG1xoSD3BOaVxvOM54muRivu6GJdhWLWdVeQYDuwlIyiUM8TWD4o90lTh4
         JqJ2j1twBHcPvTf/Qe4JGhzOGrmDQ2dz21+TiqeNTKinnqZRmhpEiUt58hQaoTBF8EeO
         GMSJcCSjIcipZeQ3uQc7/CYik7ZWwYabeooM4ltrUjophjq3I1HQa5wb6XJCyXmNkMHH
         gVXz+oZVDSdx4KV2rt9LYjYRtVHY+kYL99fe4Ek0VNlE47VDZIhbjWa6S+fX0UtSAtO9
         3+fQ==
X-Gm-Message-State: AOJu0YxA5Xrmk1UKzXkmyRRltBTTJu8UK4RMLOW9X6jwae03qrsDd2g1
	NVFA8Ch2HBVfMMQLvRITpMquYg==
X-Google-Smtp-Source: AGHT+IGFWp1TdKCXBzP96cPKz+0h9MtjB6+Fi3czSnC4Bm7cqbOWb/xMeV9euB3WYMxArtUa9wZbIg==
X-Received: by 2002:a05:600c:450b:b0:402:ee71:29 with SMTP id t11-20020a05600c450b00b00402ee710029mr13260348wmo.10.1701274853233;
        Wed, 29 Nov 2023 08:20:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c? ([2a01:e0a:982:cbb0:31d3:eea3:8f97:6a2c])
        by smtp.gmail.com with ESMTPSA id d21-20020adf9b95000000b003316ad360c1sm18579106wrc.24.2023.11.29.08.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 08:20:52 -0800 (PST)
Message-ID: <8e78be99-3d4d-4f79-9791-404e60bcb67c@linaro.org>
Date: Wed, 29 Nov 2023 17:20:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: pwm: amlogic: add new compatible for
 meson8 pwm type
Content-Language: en-US, fr
To: Jerome Brunet <jbrunet@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-pwm@vger.kernel.org, JunYi Zhao <junyi.zhao@amlogic.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <20231129134004.3642121-1-jbrunet@baylibre.com>
 <20231129134004.3642121-3-jbrunet@baylibre.com>
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
In-Reply-To: <20231129134004.3642121-3-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_082057_420275_2D72CB33 
X-CRM114-Status: GOOD (  25.80  )
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

On 29/11/2023 14:39, Jerome Brunet wrote:
> Add a new compatible for the pwm found in the meson8 to sm1 Amlogic SoCs,
> dealing with clocks differently. This does not enable new HW. It is meant
> to fix a bad DT ABI for the currently supported HW.
> 
> The original clock bindings describe which input the PWM channel
> multiplexer should pick among its possible parents, which are
> hard-coded in the driver. As such, it is a setting tied to the driver
> implementation and does not describe the HW.
> 
> The new bindings introduce here describe the clocks input of the PWM block
> as they exist.
> 
> The old compatible is deprecated but kept to maintain ABI compatibility.
> 
> The SoC specific compatibles introduced match the SoC families supported
> by the original bindings.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   .../devicetree/bindings/pwm/pwm-amlogic.yaml  | 52 ++++++++++++++++---
>   1 file changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> index 387976ed36d5..eece390114a3 100644
> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> @@ -21,23 +21,35 @@ properties:
>             - amlogic,meson-g12a-ee-pwm
>             - amlogic,meson-g12a-ao-pwm-ab
>             - amlogic,meson-g12a-ao-pwm-cd
> -          - amlogic,meson-s4-pwm
> +        deprecated: true
>         - items:
>             - const: amlogic,meson-gx-pwm
>             - const: amlogic,meson-gxbb-pwm
> +        deprecated: true
>         - items:
>             - const: amlogic,meson-gx-ao-pwm
>             - const: amlogic,meson-gxbb-ao-pwm
> +        deprecated: true
>         - items:
>             - const: amlogic,meson8-pwm
>             - const: amlogic,meson8b-pwm
> +        deprecated: true

I think deprecated should be moved in a third patch

> +      - const: amlogic,meson8-pwm-v2
> +      - items:
> +          - enum:
> +              - amlogic,meson8b-pwm-v2
> +              - amlogic,meson-gxbb-pwm-v2
> +              - amlogic,meson-axg-pwm-v2
> +              - amlogic,meson-g12-pwm-v2
> +          - const: amlogic,meson8-pwm-v2
> +      - const: amlogic,meson-s4-pwm
>   
>     reg:
>       maxItems: 1
>   
>     clocks:
>       minItems: 1
> -    maxItems: 2
> +    maxItems: 4
>   
>     clock-names:
>       minItems: 1
> @@ -58,7 +70,6 @@ allOf:
>           compatible:
>             contains:
>               enum:
> -              - amlogic,meson8-pwm
>                 - amlogic,meson8b-pwm
>                 - amlogic,meson-gxbb-pwm
>                 - amlogic,meson-gxbb-ao-pwm
> @@ -67,14 +78,15 @@ allOf:
>                 - amlogic,meson-g12a-ee-pwm
>                 - amlogic,meson-g12a-ao-pwm-ab
>                 - amlogic,meson-g12a-ao-pwm-cd
> -              - amlogic,meson-gx-pwm
> -              - amlogic,meson-gx-ao-pwm

I don't understand why those entries are removed

>       then:
> -      # Historic bindings tied to the driver implementation
> +      # Obsolete historic bindings tied to the driver implementation
>         # The clocks provided here are meant to be matched with the input
>         # known (hard-coded) in the driver and used to select pwm clock
>         # source. Currently, the linux driver ignores this.
> +      # This is kept to maintain ABI backward compatibility.

Same here, this should go in a third patch

>         properties:
> +        clocks:
> +          maxItems: 2
>           clock-names:
>             oneOf:
>               - items:
> @@ -83,6 +95,27 @@ allOf:
>                   - const: clkin0
>                   - const: clkin1
>   
> +  # Newer binding where clock describe the actual clock inputs of the pwm
> +  # block. These are necessary but some inputs may be grounded.
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8-pwm-v2
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          items:
> +            - description: input clock 0 of the pwm block
> +            - description: input clock 1 of the pwm block
> +            - description: input clock 2 of the pwm block
> +            - description: input clock 3 of the pwm block
> +        clock-names: false
> +      required:
> +        - clocks
> +
>     # Newer IP block take a single input per channel, instead of 4 inputs
>     # for both channels
>     - if:
> @@ -112,6 +145,13 @@ examples:
>         clock-names = "clkin0", "clkin1";
>         #pwm-cells = <3>;
>       };
> +  - |
> +    pwm@2000 {
> +      compatible = "amlogic,meson8-pwm-v2";
> +      reg = <0x1000 0x10>;
> +      clocks = <&xtal>, <0>, <&fdiv4>, <&fdiv5>;
> +      #pwm-cells = <3>;
> +    };
>     - |
>       pwm@1000 {
>         compatible = "amlogic,meson-s4-pwm";

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
