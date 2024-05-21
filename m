Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51F4C25B75
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 07:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNLA7d6odLt2RtR1KvglIFNatlffke1BUsp/cGPlgLM=; b=yeZJY5S03Hp0xkGS/HbV3MAPx8
	XZs+SyofMMz5beUeWobQDjJBJzZDAnOp+3L5lBYUNA9YnqsGnZY0jNI/JIlrL11fSZd+oD06B7pbK
	G9lqhxfZSKTjkyx1Xz2rQHLnLsRXs1wuQTfFWU9z0edyLcGJZvwKNUe0uFO6+dF9BAHto0fXBbKUR
	I8+EhU4E+KVTvRLdlSRlkID5qGhnfWMYAAEMuXKX9ksKrJjNZKExQeAtsGWO4x2Gs+15mcNolfKsk
	diWmQWzhDGbg9x4tvHvDtq2r2PB54vpW7NkTtR7X4o/ya7kxCLglfPGFr2VwJ7s1B5y0l9bhuRpgO
	aEn+64AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9K0w-0000000GcUr-1ESy;
	Tue, 21 May 2024 07:34:26 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9K0s-0000000GcTq-0XQG
	for linux-amlogic@lists.infradead.org;
	Tue, 21 May 2024 07:34:24 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a5dcb5a0db4so321169866b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2024 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716276859; x=1716881659; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CMHax4Pr4b+O02m2JmYswFgOmYbDFbB51czH5x/68eo=;
        b=uKuRE/Goco4b1ICo0Je3iwhBRGMZWzpNTyqxX8aY6Wd1lTviHgTCpoKLstANd6nSzZ
         n7GGFS6klRP+iH8TedHoSbFfcHKEeBa3zuMpFv1NI8dRSd7Kb47EzzOA9kELIOI06e+/
         GKFOdo8Pz0zHTnhS1OgWA63tIFl+xM50THLEoX97hPxnpvW8zOvLtq8YhNu64KpMWpR1
         ODRHnIyy5opoGZgoiy1bieDOl7R64f1KCiOR9na/nwtvxFzOOY3I6QvkIKQKueLlTpd8
         DzX+xpCgsqcTqmgUTV49iUIANjW3oySTXLBa6mMadflyZKsKuE2RQMBEUsYbVQ6ULY4v
         p/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716276859; x=1716881659;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CMHax4Pr4b+O02m2JmYswFgOmYbDFbB51czH5x/68eo=;
        b=HHzm4zBgy0fkwjK09CtBWnZeL70ZJWi+5L4S2fR/sjetOlxkS6RDwi0Is13WhDOOcQ
         vRLwjh9SfoEsZfnNwfsOHy2M45+gvIAcxUG0zd6TXDmr4iU5WUnIRIAa1x9Rdj1xyYNn
         edjbPsJoJK/ntupRrzSkZGDjEJPm8oh2DebQTT6TCzxTSOVwCugxizJXvqfrbOraIIMq
         9luEA17n3rFdkFyJsRMEES1kjT179gU2XeHKRzxF6raB+JWNC4DFqoePjNHYSqmGfcQX
         jOYZvBPsGsO9xkyUVNKQtIiRYAZBwf63cjwxEcvAAuJyBvaVq7YMIVDB/P5PCNcQsOZA
         EK9A==
X-Forwarded-Encrypted: i=1; AJvYcCXy4k6zfqilaQm8ZKMTCb2DFb9jQl0nFMdAXDwwMhSadQ0IYFgEtECnhAr3Uy26tsRX3yZQYAnYKLjdozogFeyFbZNUxtBxxwZUd47SLh6ZwUU=
X-Gm-Message-State: AOJu0YxMslHxnVrwg14V6LIC1DZH4RovccTdq/SjylF1qtfQidvlIaR+
	gmHd7XQ8f4khW1grBJd7eOkXXvZlX5nYojl29+ZXLV8X8wOoluux115VWxj7SQY=
X-Google-Smtp-Source: AGHT+IH5nFdjW0QRwbNkBOAM+4rSewNFvz2jWrfD9zMOvR2Qg46FvsnqORUa+fYPx3UyiT/uYIuVyQ==
X-Received: by 2002:a17:906:fe45:b0:a5a:44a0:8e21 with SMTP id a640c23a62f3a-a5a44afd0demr2373368066b.69.1716276858688;
        Tue, 21 May 2024 00:34:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:adf9:e5d:4c15:f725? ([2a01:e0a:982:cbb0:adf9:e5d:4c15:f725])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a61b1df3ca5sm213052066b.176.2024.05.21.00.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 00:34:18 -0700 (PDT)
Message-ID: <330ad0c3-1f4b-4f74-ad64-de48813aaa18@linaro.org>
Date: Tue, 21 May 2024 09:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 4/4] arm64: dts: meson: add dts links to secure-monitor
 for soc driver in a1, axg, gx, g12
To: Viacheslav Bocharov <adeep@lexina.in>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20240516112849.3803674-2-adeep@lexina.in>
 <20240516112849.3803674-8-adeep@lexina.in>
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
In-Reply-To: <20240516112849.3803674-8-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_003422_216750_657CF0AD 
X-CRM114-Status: GOOD (  13.54  )
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

On 16/05/2024 13:26, Viacheslav Bocharov wrote:
> Add links to secure-monitor in soc driver section for A1, AXG, GX, G12
> Amlogic family for use with meson-socinfo-sm driver.
> 
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi         | 1 +
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 1 +
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index c03e207ea6c5..d47f056117fc 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -407,6 +407,7 @@ hwrng: rng@5118 {
>   			sec_AO: ao-secure@5a20 {
>   				compatible = "amlogic,meson-gx-ao-secure", "syscon";
>   				reg = <0x0 0x5a20 0x0 0x140>;
> +				secure-monitor = <&sm>;
>   				amlogic,has-chip-id;
>   			};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 6d12b760b90f..45791ec6694a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1689,6 +1689,7 @@ mux {
>   			sec_AO: ao-secure@140 {
>   				compatible = "amlogic,meson-gx-ao-secure", "syscon";
>   				reg = <0x0 0x140 0x0 0x140>;
> +				secure-monitor = <&sm>;
>   				amlogic,has-chip-id;
>   			};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 9d5eab6595d0..a8c1c72543b7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2026,6 +2026,7 @@ cec_AO: cec@100 {
>   			sec_AO: ao-secure@140 {
>   				compatible = "amlogic,meson-gx-ao-secure", "syscon";
>   				reg = <0x0 0x140 0x0 0x140>;
> +				secure-monitor = <&sm>;
>   				amlogic,has-chip-id;
>   			};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index 2673f0dbafe7..656e08b3d872 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -471,6 +471,7 @@ cec_AO: cec@100 {
>   			sec_AO: ao-secure@140 {
>   				compatible = "amlogic,meson-gx-ao-secure", "syscon";
>   				reg = <0x0 0x140 0x0 0x140>;
> +				secure-monitor = <&sm>;
>   				amlogic,has-chip-id;
>   			};
>   

I got those new dtbs check errors:
+	from schema $id: http://devicetree.org/schemas/arm/amlogic/amlogic,meson-gx-ao-secure.yaml#
+/arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dtb: ao-secure@140: 'secure-monitor' does not match any of the regexes: 'pinctrl-[0-9]+'

and on other files.

Please update the bindings,

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
