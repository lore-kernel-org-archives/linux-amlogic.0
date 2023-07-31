Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EFAC001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 08:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9kS+HXATWmEeT0p2j4HVRqrxE0Anxqo5liMp097wOg=; b=4PxhVq7gLQvNreZpzNzXVFbAXr
	rs/xqU4kYcIdVUoRIIIC93NaaS53CSNoEE1uNt0Mwq4slI0YOCLeiA0LYXgCfpIz3jIpBNE4uR0JT
	WgqLjz8YLNxmmYmIcL6/rO50p1HLl7YDhv7ZBYcMdAfYmNcnsO2GOV/1GZA7nsc7Pc3iABd61FGwp
	OOgd5jfzT90PPx1rcLp5mMlB+boywh6FyzyLn8efIjvYSTXjW+k90iPj/PN6caGefX1xBzlbCbsIX
	Ou2mQu8ZDTn7e1QN/UHnia6jrZ6j4HZkw6eDwO62HI++IEy/bD/52EzXKUjpYpg3YgbJKBT/tqGd8
	7hKeYkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOZR-00Eabc-1G;
	Mon, 31 Jul 2023 08:48:05 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOZM-00EaaS-1d
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 08:48:03 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fe24b794e5so1596435e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 01:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690793279; x=1691398079;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hyd4ReqeWeU/rILMco8wFalj1QG9zWXdvj1Ok9YyiWc=;
        b=LDcImLish2bLuvYGLJWqNlRppWHw8f3XsBX+3BL+7I1FQH2sdrCJFJ9Bwe9KOCpNNP
         XtCmOl2iPgu+qqJpj2Nqh588Btzw7hVotiZtHWQiNKlZlm4s9OUBElrxbczxU4C5980n
         xV0+cHWc7B03AQdJMrrVukwkYxpQ6Ao2XMRjUw4lSReKdght9FI1wipl7ofS+9ctJ9tz
         bbjLekctPLEhOK87pfBV0QIfn39EytSLcl8DZ+76NgN5H9eAI4RENLn6Hq27i1CmQ4Db
         Y3EJVXtcR8jrikAsAUAZm4JVQOuCH36xE9qrwnydm6ztiBJDKLffKhUZAR7i0bUpMrxW
         YuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793279; x=1691398079;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hyd4ReqeWeU/rILMco8wFalj1QG9zWXdvj1Ok9YyiWc=;
        b=enw55ro+VOteKH7ZdyS1+PAvtMBGAzVcNZt7Vzi39fuoq/vdB7xzW6ezNd5zSqXJnZ
         takUT2cQHtO6IL5bZuRSdgzTPOVJBd/l+MT0p/fH3nIcm17y7SUXpMo0CcSkU19Z2uuO
         KDhiE30AhqTOvFn9GZdNaXBbIbpyo52id8Jf1QduQwcSukHt7F5gIgtSvqWddd1yeKPk
         uqTUGzcC9vdHebK2W8YVbKCP8lvejdyG7IGROaJ46LuxCIKEEqjWFAxEAI/TB1B0WlKY
         LwBh3aUyfMcgJ4hPhHmI112TaTIvRRLcbcomHmfidE8tvulRCdNvmROWs+WBz4iB2vs/
         cDoA==
X-Gm-Message-State: ABy/qLZLYbYq34fnC4/Ye3T3E9sQ9NADxSyNaYlG4OC30Gpmj+Xf2yCt
	rQ4Xura+2//HStdHUEArkmtW0Q==
X-Google-Smtp-Source: APBJJlGiY8uI6mK248/4fXP+CJ8WI/2WVg1zhROG/gZhB2lmjqbumZSYmvnqjYSZCTzF7hJ86raB3w==
X-Received: by 2002:a7b:c7d9:0:b0:3fe:2186:e9ad with SMTP id z25-20020a7bc7d9000000b003fe2186e9admr1066752wmk.6.1690793279158;
        Mon, 31 Jul 2023 01:47:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id e5-20020a5d5005000000b00311d8c2561bsm12268111wrt.60.2023.07.31.01.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 01:47:58 -0700 (PDT)
Message-ID: <1cc36fa4-28b9-3bdc-e6b3-e78d3198f67b@linaro.org>
Date: Mon, 31 Jul 2023 10:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 3/3] arm64: dts: Replace the IRQ number with the IRQID
 macro definition
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linus.walleij@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20230724060108.1403662-1-huqiang.qin@amlogic.com>
 <20230724060108.1403662-4-huqiang.qin@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230724060108.1403662-4-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_014800_595542_13B99AAE 
X-CRM114-Status: GOOD (  13.99  )
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

On 24/07/2023 08:01, Huqiang Qin wrote:
> Replacing IRQ numbers with IRQID macro definitions makes node properties
> easier to understand and also makes GPIO interrupts easier to use.
> 
> Associated platforms:
> - Amlogic Meson-G12A
> - Amlogic Meson-G12B
> - Amlogic Meson-SM1
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> ---
> 
> V1 -> V2: Include header file changed to amlogic,meson-g12a-gpio-intc.h
> 
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    |  1 +
>   arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts   |  2 +-
>   .../boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi    |  2 +-
>   arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi |  2 +-
>   .../boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts  |  4 ++--
>   .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi |  2 +-
>   arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi     |  2 +-
>   .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts   |  2 +-
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi  |  4 ++--
>   arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts    |  2 +-
>   arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi    |  2 +-
>   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts     | 12 ++++++------
>   .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts      |  2 +-
>   13 files changed, 20 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 0c49655cc90c..d8b94a3167c3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/clock/g12a-aoclkc.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/amlogic,meson-g12a-gpio-intc.h>
>   #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
>   #include <dt-bindings/thermal/thermal.h>
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index b2bb94981838..c79f3e8d26b7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -344,7 +344,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> index 97e522921b06..428b35e1d79c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
> @@ -201,7 +201,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> index 83709787eb91..c69b0f803916 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi
> @@ -327,7 +327,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> index 276e95b34022..eed2a23047ca 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
> @@ -380,7 +380,7 @@ rk818: pmic@1c {
>   		compatible = "rockchip,rk818";
>   		reg = <0x1c>;
>   		interrupt-parent = <&gpio_intc>;
> -		interrupts = <7 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_7 */
> +		interrupts = <IRQID_GPIOAO_7 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_7 */
>   		#clock-cells = <1>;
>   
>   		vcc1-supply = <&vdd_sys>;
> @@ -519,7 +519,7 @@ rk817: pmic@20 {
>   		reg = <0x20>;
>   		interrupt-parent = <&gpio_intc>;
>   
> -		interrupts = <5 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_5 */
> +		interrupts = <IRQID_GPIOAO_5 IRQ_TYPE_LEVEL_LOW>; /* GPIOAO_5 */
>   
>   		vcc1-supply = <&vdd_sys>;
>   		vcc2-supply = <&vdd_sys>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 24d0442dffb2..01aa970b2f8c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -185,7 +185,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> index b40d2c1002c9..ac8b7178257e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
> @@ -269,7 +269,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> index d1debccdc1c2..95e03bb02af2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts
> @@ -100,7 +100,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> index 17045ff81c69..62404743e62d 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
> @@ -45,7 +45,7 @@ key {
>   			linux,code = <BTN_1>;
>   			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
>   			interrupt-parent = <&gpio_intc>;
> -			interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
> +			interrupts = <IRQID_GPIOAO_3 IRQ_TYPE_EDGE_BOTH>;
>   		};
>   	};
>   
> @@ -217,7 +217,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> index 0f6660e68e72..ebda1dd30fa6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts
> @@ -100,7 +100,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> index 2fce44939f45..86b90f44a4b3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
> @@ -283,7 +283,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> index 9068a334ea57..4f07d6387bb1 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -53,7 +53,7 @@ key-1 {
>   			linux,code = <BTN_0>;
>   			gpios = <&gpio GPIOH_6 GPIO_ACTIVE_LOW>;
>   			interrupt-parent = <&gpio_intc>;
> -			interrupts = <34 IRQ_TYPE_EDGE_BOTH>;
> +			interrupts = <IRQID_GPIOH_6 IRQ_TYPE_EDGE_BOTH>;
>   		};
>   
>   		key-2 {
> @@ -61,7 +61,7 @@ key-2 {
>   			linux,code = <BTN_1>;
>   			gpios = <&gpio GPIOH_7 GPIO_ACTIVE_LOW>;
>   			interrupt-parent = <&gpio_intc>;
> -			interrupts = <35 IRQ_TYPE_EDGE_BOTH>;
> +			interrupts = <IRQID_GPIOH_7 IRQ_TYPE_EDGE_BOTH>;
>   		};
>   
>   		key-3 {
> @@ -69,7 +69,7 @@ key-3 {
>   			linux,code = <BTN_2>;
>   			gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_LOW>;
>   			interrupt-parent = <&gpio_intc>;
> -			interrupts = <2 IRQ_TYPE_EDGE_BOTH>;
> +			interrupts = <IRQID_GPIOAO_2 IRQ_TYPE_EDGE_BOTH>;
>   		};
>   
>   		key-mic-mute {
> @@ -78,7 +78,7 @@ key-mic-mute {
>   			linux,input-type = <EV_SW>;
>   			gpios = <&gpio_ao GPIOE_2 GPIO_ACTIVE_LOW>;
>   			interrupt-parent = <&gpio_intc>;
> -			interrupts = <99 IRQ_TYPE_EDGE_BOTH>;
> +			interrupts = <IRQID_GPIOE_2 IRQ_TYPE_EDGE_BOTH>;
>   		};
>   
>   		key-power {
> @@ -86,7 +86,7 @@ key-power {
>   			linux,code = <KEY_POWER>;
>   			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
>   			interrupt-parent = <&gpio_intc>;
> -			interrupts = <3 IRQ_TYPE_EDGE_BOTH>;
> +			interrupts = <IRQID_GPIOAO_3 IRQ_TYPE_EDGE_BOTH>;
>   		};
>   	};
>   
> @@ -583,7 +583,7 @@ &uart_A {
>   	bluetooth {
>   		compatible = "brcm,bcm43438-bt";
>   		interrupt-parent = <&gpio_intc>;
> -		interrupts = <95 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupts = <IRQID_GPIOX_18 IRQ_TYPE_LEVEL_HIGH>;
>   		interrupt-names = "host-wakeup";
>   		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
>   		max-speed = <2000000>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> index 7e1a74046ba5..6ee406066ee0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts
> @@ -100,7 +100,7 @@ external_phy: ethernet-phy@0 {
>   
>   		interrupt-parent = <&gpio_intc>;
>   		/* MAC_INTR on GPIOZ_14 */
> -		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
> +		interrupts = <IRQID_GPIOZ_14 IRQ_TYPE_LEVEL_LOW>;
>   	};
>   };
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
