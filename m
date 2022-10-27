Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3DBFA3740
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Oct 2022 12:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ysn0xCIi+8muOv0/tLtkfpSG0+lJcyS0jmvHud3zgqI=; b=OLpwSd7oLz3PKXuKWsVLRkQb40
	8lMGhEtU7YB+8Yp2JMhodiWcVL+DRjULwhmKV5djOpT3ltC9VGyylGVmM604nsyYoc6kboTzJI3ba
	Szy9EroFhBg14Hmf+utqr5i8TZMBfyDgg57HkyBCkeVK/4MHgSA7LAimI/k/D1yQ71lVXnK+g3oij
	hjz19gKH38GEEXd3PN/7L39oqlX2OX8adAxYb2Uz4lztbS58vaoUDrwjujlMreZJPXwSx+Rxj5ktr
	hhigrHUbJHP+K/rkhVhnthe3EB1xdC1ybALIoNEW80WbQi1T2xq5NYXMGlWODHcZ+PTcAi81p7eo0
	5n05vhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2K8-00DEDO-AK; Thu, 27 Oct 2022 12:49:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2Jw-00DE9N-9X
	for linux-amlogic@lists.infradead.org; Thu, 27 Oct 2022 12:49:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id c7-20020a05600c0ac700b003c6cad86f38so4106365wmr.2
        for <linux-amlogic@lists.infradead.org>; Thu, 27 Oct 2022 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q36OlMnP3Ys/6ybhANV3Apdof3npa1Vh+Mgsx1pBVWU=;
        b=OQyezL4cGU1S6Th8YVxCSmmKg8MDodYMD5HBV7ElzJz4DtRh+iegPU5J4dVfdCItuH
         dH97BHd68JdE3Jo/G/zHfYvNNSReIHiHCRWAFXj8kofujxZxdQnVrTmj28ukfotkS3MN
         HCvGo5DIIw9WZcsyGtfu66qsxa1g6nBLzRhprzhByHv8I7+eMkYkxlU1B5D3xq3I4KOf
         /28vnmmORF0AvfXt4fvhe9ftj7JGy12h86+fvleBteEpTJrSSCwPNZW1SuahFhQyjGJu
         Cv4MvPWxyx1NHB3qoqVJeBCgSm0DwTbCnQCRHfUpV2PaPjloUpfwAxtiC3iz5FqnGXB7
         6YrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q36OlMnP3Ys/6ybhANV3Apdof3npa1Vh+Mgsx1pBVWU=;
        b=VLoA34NiY35a2fZR0udBxF9E6yHrnPUgDBX6Q5wKi9oyDoPBCl11hRD3ORskm3a0/c
         xfg4wU4BR847qgFG1TrGic8wscwH0YR2j55cJxhQPd/4nXaaVYsGDp8XIVareQneDCKG
         Lk83g6prGFWC7U5mrSADwW0MQfgo8Hw9DbnIgjYm/NPSI3CZ6qPhx7dS+1bZoNEOBl32
         4kcHzfU2qzFU7R5Ivk/8NUU9KbezcVnHunNzvcq881GvgVqxULhwp6LUSy7jPEzeGdes
         bFqYd3MUjzeel8MgsFev3gOlb7z0l1JhR9WSRhV+5r8jYscDT6dANkXT0SCrwMjd04iV
         8FEg==
X-Gm-Message-State: ACrzQf0w4ldlFSBuJmleXhsC/76CKQnn46plzZ0nHHRv2Y+4oMlXNQQf
	HlHoae1GTcAmNsw7RKr2nW76Kg==
X-Google-Smtp-Source: AMsMyM7H83+TH22aHNQ6HRVyJaoDi39AW5Sf28cYzigPPM7qK21FcZrwDuemt/vdFqzRpl+/R7UhNg==
X-Received: by 2002:a05:600c:4f45:b0:3c7:176b:2505 with SMTP id m5-20020a05600c4f4500b003c7176b2505mr5771448wmq.185.1666874954196;
        Thu, 27 Oct 2022 05:49:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:1cb7:f7ba:a36e:de10? ([2a01:e0a:898:f380:1cb7:f7ba:a36e:de10])
        by smtp.gmail.com with ESMTPSA id bg33-20020a05600c3ca100b003b49bd61b19sm4977299wmb.15.2022.10.27.05.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:49:13 -0700 (PDT)
Message-ID: <18ae0876-2d37-cde9-183f-894dfcdf4be9@linaro.org>
Date: Thu, 27 Oct 2022 14:49:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCHv3] arm64: dts: meson: Enable active coling using gpio-fan
 on Odroid N2/N2+
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Dan Johansen <strit@manjaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221022084737.1028-1-linux.amoon@gmail.com>
 <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
 <CANAwSgRzdD0FWg+z6hTFs7KvpsD64bChX-k0dPXJfACXZH2zbQ@mail.gmail.com>
 <CAFBinCCNJiL-ZKRYesQAwys6bBMpYHJbUDK-Zi_VhGDVSvF7uQ@mail.gmail.com>
 <CANAwSgTLTCA9=WvWXcR-40baauN3kAk2qx9k4FQOPCa1+_O0Yw@mail.gmail.com>
 <5d2ffeca-b41c-20b4-454b-703c39bbb29e@linaro.org>
 <CANAwSgR1CN=Gho6NGMoM1bH92KyeGqoAphmT6NqtnL=+3Zg_jQ@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CANAwSgR1CN=Gho6NGMoM1bH92KyeGqoAphmT6NqtnL=+3Zg_jQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_054916_369757_F604440C 
X-CRM114-Status: GOOD (  17.76  )
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

On 26/10/2022 18:02, Anand Moon wrote:
> Hi Neil,

<snip>

> 
> When I try to use pwm_AO_cd,,
> Either one of the PWM binds will fail to get the following error.
> 
>   &pwm_AO_cd {
> -       pinctrl-0 = <&pwm_ao_d_e_pins>;
> +       pinctrl-0 = <&pwm_ao_d_e_pins>, <&pwm_ao_d_10_pins>;
>          pinctrl-names = "default";
>          clocks = <&xtal>;
>          clock-names = "clkin1";
> 
> [    3.941700] pwm-regulator regulator-vddcpu-b: error -EBUSY: Failed to get PWM
> [    3.943198] pwm-regulator: probe of regulator-vddcpu-b failed with error -16
> 
> [    3.956356] pwm-fan pwm-fan: error -EBUSY: Could not get PWM
> [    3.956396] pwm-fan: probe of pwm-fan failed with error -16

Yeah because PWM "D" is already used by the "pwm_AO_ab" controller, so you can't use it for the FAN.

> 
> Below are my changes with  pwm_AO_ab
> ---------------------------------------------------------------------------------------------
> alarm@odroid-n2:~/linux-amlogic-5.y-devel$ git diff
> arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index fd3fa82e4c33..d038ba1e2453 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -39,6 +39,14 @@ emmc_pwrseq: emmc-pwrseq {
>                  reset-gpios = <&gpio BOOT_12 GPIO_ACTIVE_LOW>;
>          };
> 
> +       fan: pwm-fan {
> +               compatible = "pwm-fan";
> +               pwms = <&pwm_AO_ab 1 1250 0>;

Here you use the "B" PWM signal, not the D.

> +               fan-supply = <&vcc_5v>;
> +               #cooling-cells = <2>;
> +               cooling-levels = <0 100 170 230>;
> +       };
> +
>          leds {

<snip>

> 
> +&pwm_AO_ab {
> +       pinctrl-0 = <&pwm_ao_d_10_pins>;

The "pwm_AO_ab" controller only controls the PWM "A" & "B signals, not the "D" !

This basically enables the PWM "D" pin function to GPIOAO_10, it doesn't assign it to the "pwm_AO_ab" controller.

So by enabling this pinctrl, it will duplicate the pwm_ao_d_e_pins signal to pwm_ao_d_10_pins, this is why the FAN spins non-stop.

> +       pinctrl-names = "default";
> +       clocks = <&xtal>;
> +       clock-names = "clkin1";
> +       status = "okay";
> +};
> +
>   &pwm_AO_cd {
>          pinctrl-0 = <&pwm_ao_d_e_pins>;
>          pinctrl-names = "default";
> -------------------------------------------------------------------------------------------
>>>
>>> Thanks
>>>
>>> -Anand
>>
>> Neil

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
