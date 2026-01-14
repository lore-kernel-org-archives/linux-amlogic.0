Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB30D29FEF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jan 2026 12:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvYIPBtYPB2w/Nvy4jUV6BJfSkpdSObtynp2ltihQMw=; b=wXkHYI2n94wAcV88OF2EHBABJB
	xTAuen7h3SGmpz9Y2VLVKrn3IdvaHV00cgWbAX8rBQp3LszWrApot6ktJU4WC+smh8NxHuUHAOQaO
	nl+00UHU3cQqLVbbQqWQsy0N5XfO/n7K2zLt7ht29GPFhtWmS97brdDZDar3QmzlN/3oon3Twdiqy
	cAqLzDtNNkK+eNhlP7b5xvDcfyDbbDbIAkre7DYQDwYBZ8S7Lt6uTasL1veZoaH2ntB2z525j7AsR
	lVHBEuZ2viRfYUrsySVqMG7CW3Xz1A+7HG9WfrxJdaXb8Oe5k6x/o/dn7MRV/bBkevPrkd+UTGN1O
	cZwgXcdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzf1-0000000962n-0aCI;
	Wed, 14 Jan 2026 12:07:39 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzex-0000000960U-1RFU
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Jan 2026 12:07:38 +0000
Received: by mail-wr1-x444.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso4685765f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Jan 2026 04:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768392453; x=1768997253; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+ZiASx/ZPoYyidLLNGoBnwidz/JtrSuo3owhuH5h1g=;
        b=qycLr470DHgcI2dBwxpd7G2Do7B9RU2tR1sK6q+UpLNdFkykvPnvsNk/lbD+Ktsoec
         AZFpW3Bfjf2sxa8jJFZMV86Z4RFkz5AOI80Z5YvutY0Bfid8KV4w/MfngnFizNXTuace
         fwhKZv3Dur7Hy5/u6YV8aG4Q6w+nBC+Y6z0MygCUJe/9pQg/NCi/+RnrzGZuwwlmVF4n
         UI/El7cvSOBoa1GxvB/C/akZ8A619VlWFaaqNnpwcP7sRdiL7JiFWblgnOdOpp6BKsDZ
         Oa7ZomMYSHUAza/I66r55n1hzuFA6bqjJ0SxRUmKCUGchrR2XOHwm2dTURplmKxiBKml
         fKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768392453; x=1768997253;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+ZiASx/ZPoYyidLLNGoBnwidz/JtrSuo3owhuH5h1g=;
        b=DVAzUVnrfoEowe0EzZ2I6jSpfXttuAgcVXPQVqWXvNdPpm8b18TLsjsfRLPOA2u5fk
         e/0mcm5AwLTpoxICosyh+iCvHhRkTrMZRFWApis0rzy+w3HwpGYeYt+RIuyIgvJAF1LQ
         hXxLv0AjtU0uyQRbawIUoFgvcN4cnQidmhD6XltftWlmz5XCNliSlK3CxaiJEkrEKGN5
         gbzRhtBOJ4PIlMm9P2Yzw3iIQpttVBisHEEobNBCr5kHGTpFhI+jVRL4iB8gNn+gMR5r
         alwtMCdUft4LmnvkZnjro+4U4qS7HeN03nvN3zCDrkS8Rr8Y/KPuvBUS9Fw02B9gCn65
         TChw==
X-Forwarded-Encrypted: i=1; AJvYcCV6QOfF5eB6EMx7W/hsD1Mqx2lhRgNlpTWwdlW5HPA+Qa07IDwJGLV1zCk1RKvHmoTNW40qDDsVw6EPsXl5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9eYbWXIpzJbr8hVqIs3JtNa5hlxN3/nBNln7QS8I2ycWbwpsY
	I62BGohzHxok/A0X6obf8XO3Vi6Fq8SVCxU/AnUkLyenIhBFVNZ/UmHo91xfwNBUAYQ=
X-Gm-Gg: AY/fxX7gZTtXSh1MshCf09bqBPl0Ou2GALnNJcQPIG4xgPZLT/hNCEgGuPr9OkTDe4h
	OOo1rl9ci0gMHNjfA7N3nr02bl0iLwS/u55p0VA/CX6uNoC48SJv14QFusfbnpZHiSAQFfQNrJL
	CApUN5VNgcVOl1w+/OOfKXPQDojtRBuSD/NbvG3mjHnsSFakPe8fcrAnxHjVTFigsrcv2pKb+IC
	QH4hieeRqHMrsPhR8s/cnmTd1Kx2d7EIZvzqJH5+8uV2otRUAHN1UIKWhYY2F7N4sCOw/YIp/OL
	zaoawaIsFT0/4inPKN16eqaptpo1lBA6ghPBEQvKBefmNuayV/qxO3GjTGqpesRZ0zKCWro4R4H
	WjaKJpk9tX/HIW1+nXk9gyaZJk6r9W7BqGG/Ryma80u+SjCPQt8xQXvvihL+NMfQDS3TuWonEJY
	yPAXNARxDjt6PV9kSPrybPcw4m9yQX8eOxsQSpRHoO7x5YssROdlm+fQ1r4dbAKtw=
X-Received: by 2002:a05:600c:46cc:b0:47e:df86:e83d with SMTP id 5b1f17b1804b1-47ee337a086mr28843505e9.31.1768392452983;
        Wed, 14 Jan 2026 04:07:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:b357:7e03:65d5:1450? ([2a01:e0a:3d9:2080:b357:7e03:65d5:1450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee281dde4sm19667005e9.4.2026.01.14.04.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 04:07:32 -0800 (PST)
Message-ID: <41ddee45-daf1-4938-ac7a-ebb6bb912680@linaro.org>
Date: Wed, 14 Jan 2026 13:07:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: drop useless assigned-clock-parents
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260114-amlogic-parent-clock-cleanup-v1-1-31078b1e4a2c@baylibre.com>
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
In-Reply-To: <20260114-amlogic-parent-clock-cleanup-v1-1-31078b1e4a2c@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_040736_942563_CEBDE1D1 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 1/14/26 11:57, Jerome Brunet wrote:
> Amlogic sound card assigned-clock-parents only have <0> and are useless.
> Remove them.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                      | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts                   | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts               | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts                   | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts                     | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                  | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts       | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi                | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi                | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts                 | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts               | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts                   | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts          | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi               | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts               | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts              | 1 -
>   arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts                | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi              | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi                 | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts                  | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts                | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts              | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts                 | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts                     | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts                     | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi                | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts                | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts              | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts        | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts                | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts      | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts          | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts     | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts        | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts                | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts              | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts               | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts                 | 1 -
>   arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts                  | 1 -
>   arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi                  | 1 -
>   arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi         | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts           | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts                | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts           | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts               | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts                   | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi                   | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                    | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts              | 1 -
>   arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts                   | 1 -
>   51 files changed, 51 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> index 9611775b81ee..285c6ac1dd61 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
> @@ -275,7 +275,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_HIFI_PLL>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <589824000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> index d0a3b4b9229c..ac6696e7e1df 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts
> @@ -183,7 +183,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> index 4353485c6f26..3d62c67ccc76 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts
> @@ -145,7 +145,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> index f39fcabc763f..5bc4d7780f5a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
> @@ -208,7 +208,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> index b5bf8ecc91e6..b1f012511d60 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> @@ -245,7 +245,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index 5ab460a3e637..a8a57147475f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -165,7 +165,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
> index 2d74456e685d..cdb522f5365a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts
> @@ -77,7 +77,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
> index 0f48c32bec97..2d4071c51f3d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts
> @@ -86,7 +86,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   					<&clkc CLKID_MPLL0>,
>   					<&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> index 1b08303c4282..10f62f151902 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> @@ -201,7 +201,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
> index 8e3e3354ed67..a69d5531c540 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi
> @@ -47,7 +47,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> index 369c5cf889b6..8758a68136ea 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> @@ -55,7 +55,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> index 654449afd3a4..a9478e2cce4d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> @@ -56,7 +56,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> index e20311386745..a2ff5040eadf 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> @@ -44,7 +44,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index d5938a4a6da3..c3e8083ba08c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -241,7 +241,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 3bca8023638d..edb7ed6b0ec0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -102,7 +102,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
> index 1b9097a30251..15795889cb53 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
> @@ -46,7 +46,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> index 1e5c6f984945..5e0abda613e4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts
> @@ -183,7 +183,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> index 4c1a75b926ee..dbd72fe0f53f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts
> @@ -39,7 +39,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
> index 2da49cfbde77..c2bf6f4cdfd2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi
> @@ -201,7 +201,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> index b4f88ed6273b..8d216a594d7b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
> @@ -136,7 +136,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> index 073b47ce8c3c..ff3ba97872ec 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> @@ -52,7 +52,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> index 2ecc6ebd5a43..5d9ddb814164 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
> @@ -142,7 +142,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> index c09da40ff7b0..ab8e06aa2b32 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
> @@ -149,7 +149,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 12e26f99d4f0..5943bc810678 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -184,7 +184,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
> index bfac00e76ba3..b5981c0b1494 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
> @@ -75,7 +75,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
> index c10f66031ecd..602777702984 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
> @@ -24,7 +24,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> index 6ff567225fee..a4d354cc93a5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
> @@ -115,7 +115,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
> index ec281a9e9e77..a22a8a435427 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
> @@ -23,7 +23,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
> index 924414861b72..6a1b65bf84da 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts
> @@ -55,7 +55,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
> index c6132fb71dfc..3a9a801f33d4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts
> @@ -130,7 +130,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> index ca7c4e8e7cac..75db2a5c96b3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts
> @@ -135,7 +135,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> index cac15b89c573..9e571b96bde6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
> @@ -125,7 +125,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> index 4e89d6f6bb57..0a6664275bcb 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
> @@ -74,7 +74,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> index 6cbdfde00e12..277fb34981c7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts
> @@ -167,7 +167,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> index 401064b0428d..fe1df108892c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
> @@ -149,7 +149,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> index 8b41e340f919..9da495cca787 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts
> @@ -57,7 +57,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
> index a9c5881c9783..1e4d3fdd0b22 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts
> @@ -98,7 +98,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> index 2a09b3d550e2..5b1aafe16d5c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> @@ -157,7 +157,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> index 773107cc47dd..81f5eb3da5dc 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts
> @@ -93,7 +93,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> index 9d5a481b309f..9626a2621a3d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
> @@ -108,7 +108,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>,
>   				  <&clkc CLKID_MPLL2>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index 7daa9b122d5c..73aa6b5a5de7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -189,7 +189,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> index ac9c4c2673b1..cb8b0f98beb4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
> @@ -207,7 +207,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> index 3c43d3490e14..7c67e459c602 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> @@ -29,7 +29,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
> index 445c1671ede7..e841c44c69de 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts
> @@ -29,7 +29,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> index eeaff22edade..8d12bd1702d3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts
> @@ -29,7 +29,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> index 697855fec476..0cd306569312 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> @@ -64,7 +64,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> index 7b3a014d4cde..3c671676e453 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> @@ -29,7 +29,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index c4524eb4f099..5cd6a2c13eb1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -181,7 +181,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> index 024d2eb8e6ee..64b4e4b209b8 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -246,7 +246,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> index e4a3a2a8ad06..ecb6aa79302d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> @@ -29,7 +29,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
> index fff92e0d6dd5..24a6a679b377 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts
> @@ -29,7 +29,6 @@ sound {
>   		assigned-clocks = <&clkc CLKID_MPLL2>,
>   				  <&clkc CLKID_MPLL0>,
>   				  <&clkc CLKID_MPLL1>;
> -		assigned-clock-parents = <0>, <0>, <0>;
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260114-amlogic-parent-clock-cleanup-5fc20d5c6767
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
