Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC2DC05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 15:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eh8Den9fSi/IuyBRyvZKlxz1QfqCXNiIlOO+6gA4E0=; b=uOpWRX4Wu5BE4ZqqshHCtIAeq2
	Q6pGK2FqPSL1Q7J+M/gqyiDoc+2ZhcCnun7mzDJjJbpmJS+yoBpVvFj5SUbTCsUGlAP8crq7uCoqR
	4wW+q7zNTNtKAQz1N4T3qVzHR8dO4tHsGvuRDnLCeZ7p15SWBfw1I2HRXvzATJeK9hp1JIZD8UONX
	EEJppuuiyRmhC5IY9VCTBGVXuXbA4uECywwFTW+LQ3kp6U6Yk6Ems0WDkRaPslvGpIAkY9Kbr+YpA
	O1XpkM7saMfZ25iRVBOcVP8M1hlmbJDd+auud1Wqw0CxQxNMNXib7jlw2PElxPF9EcnR+e32S6se7
	HGyXZ7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVRb-006N68-Dd; Fri, 10 Feb 2023 15:36:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQVRY-006N5I-7l
	for linux-amlogic@lists.infradead.org; Fri, 10 Feb 2023 15:36:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso6551544wmp.3
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Feb 2023 07:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B0iJ9ifSxWtyxJLdg8qNKxhkPjPgSJPt4W8qmCIqg0Q=;
        b=HfNMVsmPPDvMYvt5+tJkozBjMlVdYJItOX28z5S2ADhR2yM3++LVa0ez+38on/yuKa
         HqsAaYjJ2EtFYAa3Yh8caBZG+2cJfnlULiqsNBt9Lhp/pd2iY3s6pPSC5eD7wQFAkho2
         x6yD+LC3ka9DW/O1HzcoxLSdpocpgptkr4VEmzxBpNFgWJOqE/RhpLWcrFC1Zikm1IGD
         8FnPhEGX3RH4GRbiSoncBItI/i8fgJUjtMIJVKspNKu/oQH5fsF26ebzcXrERaJszpCE
         ha9nM6Y5qlVn7z9YIQRbaBUgKe0AWXnuuOJOsv1hECz3O9p9mlLgSLQlDCI+o5iIwPYV
         qf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0iJ9ifSxWtyxJLdg8qNKxhkPjPgSJPt4W8qmCIqg0Q=;
        b=JAGvgsds5XDdW8LCmB0ZOippW/YhhI09L4lRw1/IyoKLOSCcYAmNVdJX0CpnKkLT9Z
         cq3TGIeLtDHGd4LKYHK860nqpGZd+5tCLMry6o3Jvnwn1N2TfNM8IQwhQunvcQAIs2sA
         s6eGLVLJjjLG8eTO+ldOkYRVeCcPPRMqywPKllENAUUmluQNaHc13HhcUgxnv5tXJhgt
         MlvwYKOrlST+h5IZwMKQEfJle5CpTNHJbt2TkhHoKzMfJnQYIfWds9dRSCqrvC5C3dpU
         IfS37dOYtiIKIv0jfmeaOL5WqGczmmDMlUasYMwuKaepdDD4MDMdvWAXyqgeCtk/XiEz
         YWBw==
X-Gm-Message-State: AO0yUKXrNdSzD1p0D5L9VQlf5fWdAR+tHDsySW7cVwXhc/Jjn0Lj3L6a
	fx+MlED/rXPcDyXtwCroOadUzg==
X-Google-Smtp-Source: AK7set9f0qq7kzrpbHSL06E28VSOJyoJFskmV0IOe9AnouV/GnHZKvzhSNxuFumH/NZ3ZMOfYhmZVg==
X-Received: by 2002:a05:600c:a68f:b0:3db:1f68:28f with SMTP id ip15-20020a05600ca68f00b003db1f68028fmr12508990wmb.24.1676043366716;
        Fri, 10 Feb 2023 07:36:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id p1-20020a1c7401000000b003cfa622a18asm8806159wmc.3.2023.02.10.07.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:36:06 -0800 (PST)
Message-ID: <09b018a6-ffd7-b929-4ce0-bac18ebcb2b1@linaro.org>
Date: Fri, 10 Feb 2023 16:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: meson: gxbb-kii-pro: add initial audio
 support
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ferass El Hafidi <vitali64pmemail@protonmail.com>
References: <20230210122817.1027765-1-christianshewitt@gmail.com>
 <20230210122817.1027765-4-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230210122817.1027765-4-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_073608_307111_C4AACA93 
X-CRM114-Status: GOOD (  13.71  )
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

On 10/02/2023 13:28, Christian Hewitt wrote:
> Add initial support for HDMI and S/PDIF audio output.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
> ---
>   .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> index 435ae2aa404e..b6ee76011d82 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> @@ -9,11 +9,19 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/sound/meson-aiu.h>
>   
>   / {
>   	compatible = "videostrong,kii-pro", "amlogic,meson-gxbb";
>   	model = "Videostrong KII Pro";
>   
> +	spdif_dit: audio-codec-0 {
> +		#sound-dai-cells = <0>;
> +		compatible = "linux,spdif-dit";
> +		status = "okay";
> +		sound-name-prefix = "DIT";
> +	};
> +
>   	leds {
>   		compatible = "gpio-leds";
>   
> @@ -35,6 +43,59 @@ button-reset {
>   			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
>   		};
>   	};
> +
> +	sound {
> +		compatible = "amlogic,gx-sound-card";
> +		model = "KII-PRO";
> +		assigned-clocks = <&clkc CLKID_MPLL0>,
> +				  <&clkc CLKID_MPLL1>,
> +				  <&clkc CLKID_MPLL2>;
> +		assigned-clock-parents = <0>, <0>, <0>;
> +		assigned-clock-rates = <294912000>,
> +				       <270950400>,
> +				       <393216000>;
> +		status = "okay";

Drop this okay

> +
> +		dai-link-0 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
> +		};
> +
> +		dai-link-1 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_FIFO>;
> +		};
> +
> +		dai-link-2 {
> +			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
> +			dai-format = "i2s";
> +			mclk-fs = <256>;
> +
> +			codec-0 {
> +				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
> +			};
> +		};
> +
> +		dai-link-3 {
> +			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
> +
> +			codec-0 {
> +				sound-dai = <&spdif_dit>;
> +			};
> +		};
> +
> +		dai-link-4 {
> +			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
> +
> +			codec-0 {
> +				sound-dai = <&hdmi_tx>;
> +			};
> +		};
> +	};
> +};
> +
> +&aiu {
> +	status = "okay";
> +	pinctrl-0 = <&spdif_out_y_pins>;
> +	pinctrl-names = "default";
>   };
>   
>   &ethmac {


With that change:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
