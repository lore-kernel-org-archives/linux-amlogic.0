Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E59C2BD09
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2024 07:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weKcvIF2l0+ZqOAiUrWcZ19eNXZAo1oc7+OH8z2KPGQ=; b=4Y1XlU/4dpTKtqHlIzP882tfqz
	6MBb+ptT6GsxPSYghG87ZOn+m0DJYvV2LGFHMSTIifg7zii8/EO2L8lTgt6iIPsiHugyka+6JdCz2
	mxSp86eBSjW+NCDB5plHuX4THK089ZzuvpFhu++QOxFNFE7pnuPgSjzcMicjEsja7M4/dfL2ga6VD
	B6ueSBg8z/lQX2jlCNKGEd0RuxJUiC9NjG94Srg8NWt7vVq5asiExPA01vIaWtgNbr+f6H9Kesjza
	/BW91PF99QvUvH5A97Yz+f208rbmhlE6STkK6oQ90i1hzAX01sd9amvq91FfKL4Pw4nhoAkaQyAwN
	lKUqQvbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOud8-00000009M7e-0MBK;
	Wed, 03 Jul 2024 07:42:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOud5-00000009M6o-0gwP
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Jul 2024 07:42:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-584ee8da49aso625496a12.0
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2024 00:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719992533; x=1720597333; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tckfhFsEzLxO/FzhYuzYJZ7ZTtG1l9RlDBa9ctPpP/I=;
        b=piwaTLui5AVQx4G8OePTnO1wppLZY0BlzoU8Ey1hNZ1rjlDWtSaRaY0lLrKGsoeSJZ
         YkAMBZ4NDbOtESJHKOsGjasmg/d6VpZZpC1EtkR7KRb+TUD2OOWyyfYX5Zsm65b+jx1Y
         rMvxO1QSJWOiS8vUZzGL7v4faEWK81qQZFMKKVBsX+hss2Rs4Tclm3/u6Q10SL+m4/fH
         4/S+vBRHwHcwznkHfibKayhGwCTotHCwiZTahFIQp+eQmLmhrU3LHGEjIueYMWC/Bxfz
         5W8Jg30jvw4sEP8sYPK94SLLgBsjeEFy/SIjx3ORQ5Q0giTKkL9aG2gOQ624FjiI5qMN
         pO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719992533; x=1720597333;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tckfhFsEzLxO/FzhYuzYJZ7ZTtG1l9RlDBa9ctPpP/I=;
        b=m2PjwqozxrwpV6hYIxqr7XNRVU+ziBd7NGzbnZKwESSvJ0AazDB+qK4cu1UYra5q8o
         oFVLki73rz3N1JbuM0PZFYhJc6VeslnXY14kVDvx/YV35UXNWjMJSuPs0vqg8cP9S9Ac
         kYaDpTaNI0ApABgu0NNaCr5x7E7Iby6a5euVt6KNgjM8eHeM/4xnMh4BYmIAuUYO+Ovx
         ZLWqs5egvEXaY9moZqeTiylaXb046Wgp5GL7wcJSFvk+Av2zeXltzncYwRnn23By31nb
         P97F1IFUaghpRApWs1MSIGaefRbG4BGtPLIVH5GNwS9QngD86cMDiE341OwwY5bmdpdT
         CcWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiGNXAvTbAz99qrr9H5TlBXqDvC4c95uv3h6Fka9Q5kkbJxgXhf4yIh+zfGwa5QLxmTkRmkCiH96JphWMOlpSaMhtse/vyBVt95mI1RMgbZGs=
X-Gm-Message-State: AOJu0Yw4cJ9W5glrJO3TcPFzuPJE25OgSbeHsAKgKnF03HWaWFpX4mc/
	ixl7MzvSyljhsNIMejVvEH1waETWwX2nAVDxiRQn/L/35olYtR1w5Vd9N0j4IMw=
X-Google-Smtp-Source: AGHT+IHBUXWvsQ+ZR0ipa89q0bV9qFwUW3amlH2ftgxHpU+HMJ25ZuKckN072GiRs/lu6I378XGvWQ==
X-Received: by 2002:a05:6402:13d2:b0:57c:bec1:ff4b with SMTP id 4fb4d7f45d1cf-58ce525f4e4mr773812a12.10.1719992532776;
        Wed, 03 Jul 2024 00:42:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef03:73b5:7503:ee71? ([2a01:e0a:982:cbb0:ef03:73b5:7503:ee71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614f3d4c4sm6697063a12.87.2024.07.03.00.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 00:42:12 -0700 (PDT)
Message-ID: <eea2d957-fb4d-4ede-9789-d1e24ef1663a@linaro.org>
Date: Wed, 3 Jul 2024 09:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic A4/A5 Reset Controller
To: zelong dong <zelong.dong@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 kelvin.zhang@amlogic.com
References: <20240703061610.37217-1-zelong.dong@amlogic.com>
 <20240703061610.37217-2-zelong.dong@amlogic.com>
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
In-Reply-To: <20240703061610.37217-2-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_004215_247739_FD32C821 
X-CRM114-Status: GOOD (  10.67  )
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

On 03/07/2024 08:16, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible and DT bindings for Amlogic A4/A5 Reset Controller
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   .../bindings/reset/amlogic,meson-reset.yaml   | 22 +++++++++++++------
>   1 file changed, 15 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> index f0c6c0df0ce3..80345af81d5a 100644
> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
> @@ -12,13 +12,21 @@ maintainers:
>   
>   properties:
>     compatible:
> -    enum:
> -      - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> -      - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> -      - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> -      - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> -      - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> -      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,meson8b-reset # Reset Controller on Meson8b and compatible SoCs
> +              - amlogic,meson-gxbb-reset # Reset Controller on GXBB and compatible SoCs
> +              - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
> +              - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
> +              - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
> +              - amlogic,t7-reset
> +      - items:
> +          - enum:
> +              - amlogic,a4-reset
> +              - amlogic,a5-reset
> +              - amlogic,c3-reset
> +          - const: amlogic,meson-s4-reset

Here you're changing bindings for amlogic,c3-reset, move it in the other enum list.

Neil

>   
>     reg:
>       maxItems: 1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
