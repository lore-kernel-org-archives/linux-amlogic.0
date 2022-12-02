Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60849C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 10:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6PDLOrbfFG5yElcPr03mUMegXxKf2EnFN0XC4VfVfk=; b=Ma6Q9sN/N8QqhU
	OwFY1XvqmLQ94WW7R5hBVojC1o6XHzqQ4Z8DxA7svKz5Zmy8WSdNMH5CT9s9JOFeW21bCCIua1OuI
	+GTAVb0YnDqVAdkbo4PKkMGPA9EmdbbuFFq+Golby9ScgLgw0ws9lu2fHHuHz7AHSZO76doUBTM+y
	O0scsJGFZigizO/0E8yG1gLWpHtUqTR/o0BLXPEf0cCpejt9X0hl2U3U7BaWGm+nzBQYJIK7KpdkT
	b+/H1l3Dv0OD9j9VYMhGX66n6D7uqyZHfQrGuS7AxMDpQdd4q8pVIUjiPJzaH1Yi4iS1zqJlRxYBm
	dLdKHexapBdtKiAKh6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13XC-00FgID-Ef; Fri, 02 Dec 2022 10:44:46 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13WH-00FfnK-FV
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 10:43:51 +0000
Received: by mail-lj1-x235.google.com with SMTP id x11so4965061ljh.7
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 02:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Gh8vJHIwEcZh0BB+hdOKO4iOl8pjW8TLkF7IbShPHk=;
        b=y0m4WKANY+8cYSi44wZYupyb4+rS2O6rePrY3CL/B/YnmcZYckRyjjM9nsz3VZ9uHP
         IAcNvBIlpnDMdH68c+vKhuF3X+leoXp+rrFJnl/kEfg9TSXYElLpt1PaQtzHW+Fr2n2S
         wvYMAOaqbhQN9CWLtUPNR/AZrbWUBqzUTUhOux7+OKjDARu63VhndgAeRoqZl/0vdXQW
         XYGkyHgNWEn4WjQDA7+GE/6GRN/yCzy+rJl/tKzqaFyAxuQpyWuiwVLS8g+pmv8LCAh+
         gFlocbEaX3vAdLzfKOHP3NeqEt3QtlVqciEEKD/jc2Pjy5NkgZ3Ck5RR/rfdKPqKTsv1
         hVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gh8vJHIwEcZh0BB+hdOKO4iOl8pjW8TLkF7IbShPHk=;
        b=K6qQd0a9l4qLL1UHB1UnnxdNf3DWiHkDwDFa8mi46o4gKgJ7HeIripHUDM12PpBuMp
         kltKLyWWweRvmeHJJBZo5roYN4H57p2peC4piDxBxCyWYgKpOxaL30K1kCgD5TAJuOx4
         T4TeZz9OifeWBN8bHZsSJCEGjVbpj1ScFFUHAq7wB0vOZGyVzIWpOzTFV2URTuJ0TaTm
         I/5yL526+ShhOjfJFKqhQDWToqK/YLKGjINjoRTHQJOs7H7LYyufeD2zZX0kospfgyaN
         Y1P5sRY9iF0IHm7+sD16wid/s5BEBayGy88rJW9H7c17eCfWTbV1sBzXSsjltlvKs3Zb
         JH1g==
X-Gm-Message-State: ANoB5pnHj0ZMuq5KN4Ngsblw7kkm2avPJoarsWQPvd6fu8awbk7qzCua
	2Zp3o4ZyXLSWELkHYnRLaPz5pA==
X-Google-Smtp-Source: AA0mqf51Xx3+naumP4tnr+tAYf/9/xsFBGF8FoUavqS+Qrvcm63i1zMQscLL+RPsitJw/PJXEf1jew==
X-Received: by 2002:a2e:a885:0:b0:26e:768c:11ed with SMTP id m5-20020a2ea885000000b0026e768c11edmr20487809ljq.436.1669977828099;
        Fri, 02 Dec 2022 02:43:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u22-20020ac258d6000000b0049e9122bd1bsm971023lfo.164.2022.12.02.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:43:46 -0800 (PST)
Message-ID: <18d5ed96-1411-1bf7-6791-6202488b4f6a@linaro.org>
Date: Fri, 2 Dec 2022 11:43:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 11/11] arm64: dts: meson: a1: introduce PLL and
 Peripherals clk controllers
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-12-ddrokosov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201225703.6507-12-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_024349_893091_22D51651 
X-CRM114-Status: GOOD (  16.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/12/2022 23:57, Dmitry Rokosov wrote:
> This patch adds clkc_periphs and clkc_pll dts nodes to A1 SoC main dtsi.
> The first one clk controller is responsible for all SoC peripherals
> clocks excluding audio clocks. The second one clk controller is used by
> A1 SoC PLLs. Actually, there are two different APB heads, so we have two
> different drivers.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 27 ++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index b4000cf65a9a..38e6517c603c 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -6,6 +6,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/meson-a1-gpio.h>
> +#include <dt-bindings/clock/a1-pll-clkc.h>
> +#include <dt-bindings/clock/a1-clkc.h>
>  
>  / {
>  	compatible = "amlogic,a1";
> @@ -81,7 +83,6 @@ apb: bus@fe000000 {
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x1000000>;
>  
> -
>  			reset: reset-controller@0 {
>  				compatible = "amlogic,meson-a1-reset";
>  				reg = <0x0 0x0 0x0 0x8c>;
> @@ -124,6 +125,30 @@ uart_AO_B: serial@2000 {
>  				clock-names = "xtal", "pclk", "baud";
>  				status = "disabled";
>  			};
> +
> +			clkc_periphs: periphs-clock-controller@800 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +				compatible = "amlogic,a1-periphs-clkc";
> +				reg = <0 0x800 0 0x104>;
> +				#clock-cells = <1>;
> +				clocks = <&clkc_pll CLKID_FCLK_DIV2>,
> +					 <&clkc_pll CLKID_FCLK_DIV3>,
> +					 <&clkc_pll CLKID_FCLK_DIV5>,
> +					 <&clkc_pll CLKID_FCLK_DIV7>,
> +					 <&clkc_pll CLKID_HIFI_PLL>,
> +					 <&xtal>;
> +				clock-names = "fclk_div2", "fclk_div3",
> +					      "fclk_div5", "fclk_div7",
> +					      "hifi_pll", "xtal";
> +			};
> +
> +			clkc_pll: pll-clock-controller@7c80 {

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +				compatible = "amlogic,a1-pll-clkc";


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
