Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D62C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Dec 2023 09:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTNKCwx5VLcW3pdFbvwftaLCxUYhfejQUmEIn4JzbBs=; b=EkeSUJKeFk7ZqL/ARtLKBcM93O
	aELHQm9DrdCaulc61vVlfzc/gsspVJT3fM/CM33mgYGwWpUtZ+Kjm3wSxmgLYJvEF1C8I7yDjcF2m
	NxGFVNR+mhXR3NJ2RGzrNFOdLKUg4Sv6+uN70Nph9R8jnJ00XfS0rbb823mEQHAxa9fdjW6eBMqpt
	ffuNpZuio2Ky2hUE1YpHaXoBP8nAprCI3PT6WC8r2gM7+H/9MTPx8EIKb4207ED7sT0/m1QwCgKAu
	Usa1XHjtqumoZZokUjTK6GN8ITtPbB0y5CvSk9lPPHKJdPy4059SPF+ZOpHudiFEzRWTPkVhA7VvO
	wfLW8tTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcHg-004QJb-0u;
	Mon, 11 Dec 2023 09:09:04 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCcHR-004QG0-32
	for linux-amlogic@lists.infradead.org;
	Mon, 11 Dec 2023 09:09:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c2c65e6aaso42157405e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 11 Dec 2023 01:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702285725; x=1702890525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cJRcFR29fUFWBTO/HJarR+HfZgSnSVtsH0mlT3fpCs=;
        b=qVwon0lyov9IoEzqa+Wn2+69+Co+Ww30VWBxHKMlrua3YGOGRm5zUQMcULRMuXVAOB
         c1xIElmDSSG3Sjz21Y8hViC3BgDuHdPxiuEziEiA9aTg5ZB20lZtAMz8n3VcvnOUe5uF
         Y4b1eIEHD99dJ2EMtQKWO07XOQw1CLpfGnjoa2EpvkMeArA7OyQWXCvNsmHd16ZUXeZB
         lKkqQYAUfpqSulpdx3FZh3PujJm/88oe2OhAE4SkYT9SWbXZe/qPmH0V5mP136VnSAKw
         vMiU9kmyzRGeA1jfEj/hIaIR+Eg7FsZljFuiJDz2rsOOcopLXoNo42mvTI2IeiNO24/i
         3HbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702285725; x=1702890525;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4cJRcFR29fUFWBTO/HJarR+HfZgSnSVtsH0mlT3fpCs=;
        b=owdxGe5sCdV080FvYYf8qpZOh/7dDI6jDcZnmlcckMMojxjTxIeWcS37c81RwPEO3V
         dkDTWQ6Ys4KnlAvszl0VvfUROrYHl0qsRzTXpLaac85u1jqWlPJINzLVDWUIGOvcQ9dp
         gzXInRe3zW9d/6ap7IrzSkZ/ktZQJQT0kRCu3AZwKyzZW1lMgV/3+mPsUAKb7FEL/yBl
         7jsy7IS3YbZlnWWYq7IKgStxwsN+r8hM9DTZP/3cau1cAOMb1v7tDmJ3YTqonJnKNOif
         Hhj5QSXW9CljXOOew8BHe7p1qYNKjwGKt6JDZeJIlzwChRtJomp3Dowa20YU7+aaBxku
         ojtQ==
X-Gm-Message-State: AOJu0YyhmLhKadFZZzHXHw4g0iZ0NvZ6DaE4j/eASCJoB5euyWDbv0AW
	z3dmCfOsFmaneCu/9aC72MENgw==
X-Google-Smtp-Source: AGHT+IEnvk9MNR1IJjMMAShUWmT0BdgcUG9TFEnOg7kUWjlvknurjUNKhaRZmMNg1DXk/w9jg2yZxA==
X-Received: by 2002:a05:600c:1f1a:b0:40c:3508:b40e with SMTP id bd26-20020a05600c1f1a00b0040c3508b40emr1761630wmb.245.1702285724992;
        Mon, 11 Dec 2023 01:08:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23? ([2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b0040c440f9393sm4627069wmq.42.2023.12.11.01.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:08:44 -0800 (PST)
Message-ID: <c336d071-34a9-4635-bcde-3861c7f11bd6@linaro.org>
Date: Mon, 11 Dec 2023 10:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: drop redundant status=okay
Content-Language: en-US, fr
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231209124401.93814-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20231209124401.93814-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_010850_007943_1DB3684F 
X-CRM114-Status: GOOD (  10.77  )
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

On 09/12/2023 13:44, Krzysztof Kozlowski wrote:
> New device nodes are enabled by default, so no need for status=okay.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Tested by comparing decompiled DTBs.
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts         | 5 -----
>   arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts      | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts     | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts      | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts   | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi    | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts     | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts        | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi   | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts    | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts     | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts       | 1 -
>   13 files changed, 17 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> index df16eead2c80..c8905663bc75 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -66,7 +66,6 @@ linein: audio-codec-0 {
>   		VDDA-supply = <&vcc_3v3>;
>   		VDDP-supply = <&vcc_3v3>;
>   		VDDD-supply = <&vcc_3v3>;
> -		status = "okay";
>   		sound-name-prefix = "Linein";
>   	};
>   
> @@ -75,14 +74,12 @@ lineout: audio-codec-1 {
>   		compatible = "everest,es7154";
>   		VDD-supply = <&vcc_3v3>;
>   		PVDD-supply = <&vcc_5v>;
> -		status = "okay";
>   		sound-name-prefix = "Lineout";
>   	};
>   
>   	spdif_dit: audio-codec-2 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> @@ -91,14 +88,12 @@ dmics: audio-codec-3 {
>   		compatible = "dmic-codec";
>   		num-channels = <7>;
>   		wakeup-delay-ms = <50>;
> -		status = "okay";
>   		sound-name-prefix = "MIC";
>   	};
>   
>   	spdif_dir: audio-codec-4 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dir";
> -		status = "okay";
>   		sound-name-prefix = "DIR";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index 0ad0c2b7dfef..4c4550dd4711 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -45,7 +45,6 @@ dmics: audio-codec-1 {
>   		compatible = "dmic-codec";
>   		num-channels = <2>;
>   		wakeup-delay-ms = <50>;
> -		status = "okay";
>   		sound-name-prefix = "MIC";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 4969a76460fa..9b55982b6a6b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -22,7 +22,6 @@ aliases {
>   	spdif_dit: audio-codec-1 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> index 8fc2e143cb54..0da386cabe1a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> @@ -22,7 +22,6 @@ aliases {
>   	spdif_dit: audio-codec-1 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> index ce548b373296..6396f190d703 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> @@ -17,7 +17,6 @@ / {
>   	spdif_dit: audio-codec-1 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> index 18f7b730289e..e59c3c92b1e7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> @@ -26,7 +26,6 @@ dio2133: analog-amplifier {
>   	spdif_dit: audio-codec-0 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> index e238f1f10124..f28452b9f00f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> @@ -18,7 +18,6 @@ / {
>   	spdif_dit: audio-codec-0 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
> index 292c718ee19c..591455c50e88 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
> @@ -18,7 +18,6 @@ / {
>   	spdif_dit: audio-codec-0 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> index e8303089bff6..74df32534231 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> @@ -21,7 +21,6 @@ chosen {
>   	spdif_dit: audio-codec-0 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
> index e1b74b174915..376760d86766 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
> @@ -17,7 +17,6 @@ / {
>   	spdif_dit: audio-codec-0 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> index 7d525bdb0e06..ad2dd4ad0a31 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> @@ -28,7 +28,6 @@ chosen {
>   	spdif_dit: audio-codec-0 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> index 50d49aec41bd..d05dde8da5c5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> @@ -37,7 +37,6 @@ memory@0 {
>   	spdif_dit: audio-codec-0 {
>   		#sound-dai-cells = <0>;
>   		compatible = "linux,spdif-dit";
> -		status = "okay";
>   		sound-name-prefix = "DIT";
>   	};
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> index 095579c55f18..109932068dbe 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -32,7 +32,6 @@ dmics: audio-codec-1 {
>   		compatible = "dmic-codec";
>   		num-channels = <2>;
>   		wakeup-delay-ms = <50>;
> -		status = "okay";
>   		sound-name-prefix = "MIC";
>   	};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
