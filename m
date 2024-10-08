Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48D6CED275
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2024 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHluc6GNaB8tm+/f6lg2xvVHzD6J95CHmZaM7rE864A=; b=g9HYPXL1rHWRVMeg3h3M9OyQ9V
	oc7PKlGqahOlvOgTEGA0bGqFapzRE+gPDYch/pFG73C/rvYHAZeTGbp0DvTOD8KpRHfnp2LjdThAl
	PkGXXdt4YU/rO6Rme5sM7jQXXKtNwhP4AUxolYQLmNTVsQPFDS2asAafoAOPk86+vX2BBMXbcusQ4
	29E4aaYIrq3KgpUQoOGpQtLNegV7VKp5w9rt53bafViJekrYFBAKXY+bLrW1IsMyajbXF0bm+UL6+
	hKMnxt9j5DDBU9UiqH6mIPjYFTFoywc/n7F3kn+QbnL7FQWz2eo/iRV1Sv2i0O0JHTn40ewesK+q1
	FF7L/QRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4es-00000004nCI-49kU;
	Tue, 08 Oct 2024 07:29:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4bv-00000004mrs-21O7
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Oct 2024 07:26:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37ccc600466so2667341f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2024 00:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728372382; x=1728977182; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tde6naARiuFB2gj8gABk4yLz1i061Dy0b7ny+fgB1AI=;
        b=uFbI2nc7mUVkaBUAS+z+hseBjsdSoPnsfaH/EcunmoDIy8K/ugcuBwJG9mK0x05/FY
         Z1aB89jfcBttGc++A19iRYgOs3zoNtzULEn1yHHK6t/zotpn4KaezAl5DlBsBlyLK2Vn
         vprXqarYMernPan5m/BAT4CMeUf1Jxau/LlqqGJBv1CsNv+iOXNzr1bIl64DTQVxG/71
         idqK1qbOfH2YKo5E9Yjtp8hiMcTGUV9+SxyXav8DAoe3CfuGl8ZPQCWHp6I4TihT62O9
         K3XJHxw4kXQJBNvL2atFr3P4YtZgiYNy0sJD++20ncnohBMBMMhZTXJpmddf43OKWs6u
         nj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372382; x=1728977182;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tde6naARiuFB2gj8gABk4yLz1i061Dy0b7ny+fgB1AI=;
        b=tFIOGh0QyMgvsTJjYPuxn4sLGVECrDfE0we9rFpKaEWUWCu7YeBxXNdWdwnljXyrNf
         NCYgbJoT4LUf17XXBR5qVFCs7f+frhmVx/1nomCL7z+lrAE2kLgQ6Bduv8JldQlA+14b
         Bei9jbbBscxO3Gmf72jYq8sjWi/n+sXxjGtt/MDi+lxrRSTsfiAQh2APp2n7DcTJu40l
         F+Y5xW7jnCcCLqgz3DUK+j+mAIRfj/WHpCn9rHLpOeQ4OCY8/Fs5kzlhIGjWo0CZ3CBs
         mKkIc3dS7fZ1D3M9crDt0qGhKcSBecaBIfdAKmdoMziJ/BXyFlFkxiL8PpZyQpkK3Zd5
         GO7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXslM/4MRjqQ8Np3ZHt2fxOQlb37FRij3J1eg3ipqJ8zutzv1bWkDDXAYQJHJa/AAYyXc5iWgCkTl63yWrE@lists.infradead.org
X-Gm-Message-State: AOJu0YxwlYL/IHJ5E1w2vpQxkniOFSP0tPnlbmsvuvxnZvyxNWAYTnfk
	E/TYZBo5BgUQy0qwnPvAaOa6doTrXQclMscOsn68RIjwYjcK2KMNmVY4INckDc8=
X-Google-Smtp-Source: AGHT+IGFT9Rs5w4u61S51MLKNuVCCfuA33nAIecdHnPzSR0BOYT1oFGdenXpd4JxBOZV/8fyyDDrnA==
X-Received: by 2002:a5d:47ae:0:b0:37d:3173:e018 with SMTP id ffacd0b85a97d-37d3173e40cmr543467f8f.40.1728372381784;
        Tue, 08 Oct 2024 00:26:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19? ([2a01:e0a:982:cbb0:4595:23ef:4ba2:2d19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695e9b6sm7391552f8f.76.2024.10.08.00.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 00:26:21 -0700 (PDT)
Message-ID: <2e3f719c-82e8-4d95-b159-c8c31dec4293@linaro.org>
Date: Tue, 8 Oct 2024 09:26:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document
 the System Control registers found on early Meson SoC
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-hhi-sysctrl-meson8-v1-1-896b24e6c3c8@linaro.org>
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
In-Reply-To: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-hhi-sysctrl-meson8-v1-1-896b24e6c3c8@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_002623_566128_1C8A4D1D 
X-CRM114-Status: GOOD (  13.61  )
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

Hi Jerome,

On 07/10/2024 16:09, Neil Armstrong wrote:
> The early Amlogic SoCs also has a System Control registers register set,
> document it in the amlogic,meson-gx-hhi-sysctrl now the clock controller
> has been converted to yaml dt-schema.

Could you take it via the meson-clk tree since the amlogic,meson8-clkc.yaml dependency is in it ?

Thanks,
Neil

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   .../bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> index c6bce40946d4..3dc66f1de023 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> @@ -13,6 +13,7 @@ properties:
>     compatible:
>       items:
>         - enum:
> +          - amlogic,meson-hhi-sysctrl
>             - amlogic,meson-gx-hhi-sysctrl
>             - amlogic,meson-gx-ao-sysctrl
>             - amlogic,meson-axg-hhi-sysctrl
> @@ -36,6 +37,19 @@ properties:
>       type: object
>   
>   allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-hhi-sysctrl
> +    then:
> +      properties:
> +        clock-controller:
> +          $ref: /schemas/clock/amlogic,meson8-clkc.yaml#
> +
> +        pinctrl: false
> +        phy: false
> +
>     - if:
>         properties:
>           compatible:
> 
> ---
> base-commit: 2e99ba3e918f5f1a987c86e559fe8f14d9c4048c
> change-id: 20241007-topic-amlogic-arm32-upstream-bindings-fixes-hhi-sysctrl-meson8-158da98bee95
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
