Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB798C6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynBvAzF4IaDk2I2ih2oqfKJprl+O2muPDwA8Wtqd2+g=; b=XhwGbjpBf31DuAXWV7kOZ/u7DM
	44KF4T8UXwJo4+T4EJXR4gPKk3u+S6WW5kAn0rXLwSrdaqB0IuCBjTuytRSYkWNK2nYiQhoB3asp4
	LL/QuuLsX7o/QXM++Sbi7otBQeKFlDcm47EoYozgSXjcd/kUoeIW3oL9uIrRmSPI/8Ee9R9WigLZk
	BcdxIig1eQre43Mcpp9nh6EbS/zdbw+SZK4BfGppDv23hj2r+UrDcX/vkcdaFFjxqfAGmU5YPczRq
	I3GhQ+Cuq4zS+/AcZVj3mq6SIzc87MUuzJIoUQWVs2jQcWtl8nJaXOvL85qwrflvF/U0NamRsAGkT
	sTrjdQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZslz-004oE0-AA; Wed, 08 Mar 2023 12:19:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZslw-004oBt-5D
	for linux-amlogic@lists.infradead.org; Wed, 08 Mar 2023 12:19:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso1170631wmb.0
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Mar 2023 04:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678277993;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M0PT41N9/9aKEVWUCfnXqycSPIwscUdDNY/YmWQMOBc=;
        b=k4wPvfxf2rr+T0Dkk71MslV3OsYWjfXdYEyEikFNcloMvkxqleaMMX4PS1+8Jr17nx
         tjh3yjudHmxX5Lo4xVahN7eqitEFaADkyAFH/6v8k1f35HFlHeCjdxYpOZG/n4A+BR//
         F1UEKnuVtRQZ/j0ef38bQPqHZh6BtZX9ui/C5wB914i2/8yrmKl6J/P89j4644c9feZ+
         DE+HQkYpluF+tT2yQqAkFO6U8GNjtJn7gbqn21Gwat0zH8lZeJqBHP/fcMaWpjJ04qzH
         9IRRU6QMYfbX8NrthMk9iTS1DpFLQy8ug1deFEWXhD2KT665WxGDiLDG0wB3QMDkWGkF
         BGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678277993;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0PT41N9/9aKEVWUCfnXqycSPIwscUdDNY/YmWQMOBc=;
        b=uCD431BM7AbfZiBZW/zsLlx2qyZFodENMT6T0EljpI/lq1aO/S7I5jxok8wt4I2/8/
         zSMK7dX4sCYeU4JlcTWr9rkh4fnVTMf+BjGxhtvMgHJTItSyUbAg+AaOPOTKY7uctpYu
         0KLLrEk8Aab0MhjzujPYOj6vX693uWcIzgnbu1SBRG0z1TU0gMm2+Efj8IVL3/ZMJykK
         r/wR0slbybIbDw0P4S8GUVM2IKK8FsCZdCkkV3LNRDHAdEew6SnQyf/Nvj8ev5OtRtTm
         4w5tZWNpyFs7idUQBt3hnBwEXVukFx99/UBGu3wA0D1G/KjjKHRTXQrLde0z8kiuYnMq
         g8eA==
X-Gm-Message-State: AO0yUKV5afi7Spji21zqQboTPs0v6LY9TTu73s1GoOPOIYa2PR8L8jrq
	RNzNOZVo92wsLyFdEA5JKXyclg==
X-Google-Smtp-Source: AK7set/1ESdVmy/r7adhh0sf1VIdxSRaRJPt2FLSS8Mj6zEHB7dr0uJsp1xqOpWMYbJJuMVcjqBPyg==
X-Received: by 2002:a05:600c:3504:b0:3ea:e677:5017 with SMTP id h4-20020a05600c350400b003eae6775017mr16080220wmq.8.1678277992817;
        Wed, 08 Mar 2023 04:19:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34? ([2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34])
        by smtp.gmail.com with ESMTPSA id j17-20020adff011000000b002c5a1bd527dsm14995123wro.96.2023.03.08.04.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 04:19:52 -0800 (PST)
Message-ID: <6af5bb93-650e-5ea3-ac14-4e37baf4a902@linaro.org>
Date: Wed, 8 Mar 2023 13:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 3/3] arm64: dts: meson-g12-common: Use the G12A UART
 compatible string
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
 <20230307222651.2106615-4-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230307222651.2106615-4-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_041956_260409_11A70BB7 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/03/2023 23:26, Martin Blumenstingl wrote:
> Switch meson-12-common.dtsi to use the Meson G12A specific UART
> compatible string. This enables the "divide XTAL by 2" divider which
> improves support for UART attached Bluetooth modules (for example
> RTL8822CS) running at a baud rate of 1500000. Without dividing XTAL
> (24MHz) by 2 a baud rate of 1500000 cannot be generated cleanly and the
> resulting jitter breaks communication with the module.
> 
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Greg, please don't take this through your tree. I included this patch
> to show the overall goal of this series. If Neil won't take this as
> part of another series then I'll send it separately.
> 
> Changes from v1 -> v2:
> - keep meson-gx-uart as fallback compatible string
> 
> Changes from v2 -> v3:
> - none
> 
> 
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 123a56f7f818..904bcd4d2acf 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -2046,7 +2046,8 @@ pwm_AO_cd: pwm@2000 {
>   			};
>   
>   			uart_AO: serial@3000 {
> -				compatible = "amlogic,meson-gx-uart",
> +				compatible = "amlogic,meson-g12a-uart",
> +					     "amlogic,meson-gx-uart",
>   					     "amlogic,meson-ao-uart";
>   				reg = <0x0 0x3000 0x0 0x18>;
>   				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
> @@ -2056,7 +2057,8 @@ uart_AO: serial@3000 {
>   			};
>   
>   			uart_AO_B: serial@4000 {
> -				compatible = "amlogic,meson-gx-uart",
> +				compatible = "amlogic,meson-g12a-uart",
> +					     "amlogic,meson-gx-uart",
>   					     "amlogic,meson-ao-uart";
>   				reg = <0x0 0x4000 0x0 0x18>;
>   				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
> @@ -2293,7 +2295,8 @@ clk_msr: clock-measure@18000 {
>   			};
>   
>   			uart_C: serial@22000 {
> -				compatible = "amlogic,meson-gx-uart";
> +				compatible = "amlogic,meson-g12a-uart",
> +					     "amlogic,meson-gx-uart";
>   				reg = <0x0 0x22000 0x0 0x18>;
>   				interrupts = <GIC_SPI 93 IRQ_TYPE_EDGE_RISING>;
>   				clocks = <&xtal>, <&clkc CLKID_UART2>, <&xtal>;
> @@ -2302,7 +2305,8 @@ uart_C: serial@22000 {
>   			};
>   
>   			uart_B: serial@23000 {
> -				compatible = "amlogic,meson-gx-uart";
> +				compatible = "amlogic,meson-g12a-uart",
> +					     "amlogic,meson-gx-uart";
>   				reg = <0x0 0x23000 0x0 0x18>;
>   				interrupts = <GIC_SPI 75 IRQ_TYPE_EDGE_RISING>;
>   				clocks = <&xtal>, <&clkc CLKID_UART1>, <&xtal>;
> @@ -2311,7 +2315,8 @@ uart_B: serial@23000 {
>   			};
>   
>   			uart_A: serial@24000 {
> -				compatible = "amlogic,meson-gx-uart";
> +				compatible = "amlogic,meson-g12a-uart",
> +					     "amlogic,meson-gx-uart";
>   				reg = <0x0 0x24000 0x0 0x18>;
>   				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
>   				clocks = <&xtal>, <&clkc CLKID_UART0>, <&xtal>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
