Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1873FC64EC4
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+YXT0n7wQpebMFn2nQxvSZSDptL2zRvF10FiWMVov4=; b=dZfAFh3QKPzjezmqSbspqZ6q41
	PxBOu8weJn1dI+2DMAud3rAd8FvHrdg0n/xULRUrKm4KaBw7oRnRbYBVSdwlb8Q+XFtR0/zzYL7yQ
	3nvLDLMYjaD54adIAHgbOrNw5/rgj1Onsb//Isdb/FG3cYveHTPxfyGlkYYWK45eUDrbNVromaBde
	vOrbr/P0MrOeT25SNYf+WvuJt1irZ2KnYllid+pTOvkoEju73Zx+ts5hWORBAvTYZOJT0cUggurtW
	RFIb7uVq9y1X1B1vg43Vm+Sbqxvo/9ncGsArMgl9UJF9fzL180va9Fl+BED3++3pyWXgRZGgSxr3t
	ncRv5zGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsna-004oqe-Bw; Wed, 08 Mar 2023 12:21:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZsnM-004olq-V3
	for linux-amlogic@lists.infradead.org; Wed, 08 Mar 2023 12:21:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id p16so9672773wmq.5
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Mar 2023 04:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678278083;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DdmHRVA/vk3lRtO265cC0Ziw677vWqjaNx8Bv1rPy7Q=;
        b=cM+fM6PeOeblfCflPYpRuWpukH3n/XjmUcQtQtvmelnQNcg0ZSBy0THIZM4wN/oZZ9
         VE0liMcw00FziUaqSLK6TO+6OlgLQppeZwyBWxG+wHPFNi2wqWKe6alh0+doXkX4jqpB
         1Rzkd+fpsr/Jq7q77voKbU7VTeqfY65m7wQUmpOIUURPP5hx2bvUyHvFAtAGa0vtGWR9
         I6Y8qUIIzVcCrUQUunvAaI30zsw1b7fdU0YyKNLor0Yf78QVFJmDZSOVVm/CiN284nYu
         KhyXZOueZBZ1XpoFA0sCxZueNxMlE4/ptJ+xZmEuWW38E1YJbLTrAnlLoJplBXnrWlgq
         o8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678278083;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdmHRVA/vk3lRtO265cC0Ziw677vWqjaNx8Bv1rPy7Q=;
        b=mw2luBxNODClXu+JrgstgTjRLKa3qXtFVsy6HNxcgjTFXMpsC/y0bKh++YpVOzmoHu
         uesiXAYLi9+zUILL+i5/mtiOaZTGl8sQa56S1c8LmcM+iL0LMJO0wgF9nigdkc+jrxDW
         uOXCWbJlAFE/1s2Fc9WHAWDblCffhBD8mbcrqIppt46RsDA7FWsRkIAVphBfcYbsTFRa
         LVrgmwTA3/9H83MPGGRreKtdhuPKBh6j/W5FPUqo2H6elaXQXQh+haC7MoQJQRkcHmcj
         B+zrztDS/Qkdk1Ux/O87JD5fSdk1x63VvnLX+5rCKZ/Zu62gWgdUZcVcCnuSdOfGFesK
         mLAg==
X-Gm-Message-State: AO0yUKU9NKBRrUbsXbb2g7J0BOntXLqlIn9oP5g/9j6OnmGSZENVP+3z
	TGCMjFZ7XPKjTnWfF/7r4tjqww==
X-Google-Smtp-Source: AK7set/5hxCmMl5VY0/C9jx9+DScKu0vsgidAstlJ0JD4TIm/rxgPcMe+P5nzv+rQWReggKXtZCZ1w==
X-Received: by 2002:a05:600c:1d24:b0:3da:1f6a:7b36 with SMTP id l36-20020a05600c1d2400b003da1f6a7b36mr15995476wms.0.1678278083146;
        Wed, 08 Mar 2023 04:21:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34? ([2a01:e0a:982:cbb0:b029:83b9:1fb8:7c34])
        by smtp.gmail.com with ESMTPSA id m1-20020a05600c4f4100b003e01493b136sm21246036wmq.43.2023.03.08.04.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 04:21:22 -0800 (PST)
Message-ID: <5325f790-50d8-56eb-b8ac-99840d5b3ad2@linaro.org>
Date: Wed, 8 Mar 2023 13:21:21 +0100
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
X-CRM114-CacheID: sfid-20230308_042125_035034_076E419B 
X-CRM114-Status: GOOD (  16.29  )
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

Actually I'm ok if Greg takes the whole patchset, including this one, via
the tty tree.

Neil

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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
