Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B51AC4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8/iWjnmzoVzUUg4xlYlMALdGq/EV/TwtHik6Vz7BrE=; b=WDok+5nTSqIqWm
	2nxnhHBST4iI2zxMUu/k5ktINY5w4egY7DqdxtjplCIbR4rJTu3jOrHM8DGwIJlwx3P10Fsph4mXD
	YXmnW1oc44N9XM7/Vr9zqFiRboM8Q2vK4ghI0QOmxu5QRuZY/weMIQW6Gk1LC9w9sw1ufkaOMxDHf
	v7wMAjdt/lmFTUsJJyaX2lQHLrL78shSZk0AxDqpwQ1vqHl891RAG/5jJAIc9D5IZUbelHsmZSIwg
	M0eR9r147dHNTr/tpwfz+00BCC99FJdWfPadEcuuEw7D18pqgxkHKDlF7Azq2wXVP4oqNZQjIoCmX
	h9KjiUDuq+rNAO+SNOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14p7-00GDMR-8K; Fri, 02 Dec 2022 12:07:21 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14ov-00GDHy-KB
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 12:07:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id u12so6527522wrr.11
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 04:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=ufkksRCnKTyw8dIplA/b/uLD8QaAG4PtkuYozKAX1Z0=;
        b=Z0M6DwF7LCtwmn/juE9eFrYObIzTrdrAjL4bg6fXZ9E6KUOBabZPQY0qTqII5jvLBp
         cMw2Ack4Ouvc5Ma5M8TUMhU5ZFHANZTj+BNojedcmz4qxNKUFGVjoEJ3LG6lXKFzKpHO
         /aJz+K/ZjoCZIEdycG9SH4B2stg9SGb9yEuQUJFBdiqKIWqy4F3Tbsn5D4jmDd42zG8U
         EQwSdpBKOdFIyG0K4vqZ9MXMtn6F8bHyiBN4gsK4jGpR3ydfLSmtyRPo4Lp9CM6XUdlQ
         agajMzxyImZ3PZfXKMjzknUtcFHE13TUbPuNwcAYTGK2t5ysDZK2em3Mvj72Eg05koL5
         ypYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufkksRCnKTyw8dIplA/b/uLD8QaAG4PtkuYozKAX1Z0=;
        b=QkFTeVNiXl6CT8VpgcaidxuU3lVUg03Xy5cIrWKJgvyFD1Gx5V07+C4puFXzJ3+mQJ
         3BMpihh0klIHQTc2KWwHc0j6PnH8QX3pdE7Z1Ab3qn2cHEe55HJZN1xC6LGbvvS3UiNV
         rHPbT+KUBuFdCbtAKxpIx8sNfsr3cDL3YnIA72GWb9CAXDyhyIrh7ULAZThaKiiK6KJP
         PVus3jjii1AcdQK2FfERehVtHU975sW3fHuY+gySVBzz5XashLuxYdMtPCtHmifThU0/
         bN6rQB35NN76nQz3VC4sNYOGuZNGo8FdZLPhTejFeU5q97CtiCvjiz5FscKW94/iHM1o
         NTZw==
X-Gm-Message-State: ANoB5pmAz96Ylc/UQ5maPRyf7w7Mj1+IgQKIEeZeHb6LjZGbyMQA0uM/
	lFHvrAU0JEmaXUQ1FcNAaS1dzw==
X-Google-Smtp-Source: AA0mqf7OMOowsFNaor0Sk6Vwy+31GQ71GxxItMw6BB+vya1kxwo11iMY7T1bzqWILnH0q/SYNXJl2g==
X-Received: by 2002:a05:6000:1b86:b0:241:9606:1123 with SMTP id r6-20020a0560001b8600b0024196061123mr38434943wru.537.1669982826911;
        Fri, 02 Dec 2022 04:07:06 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a23-20020a05600c225700b003cfe1376f68sm8168690wmm.9.2022.12.02.04.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 04:07:06 -0800 (PST)
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-12-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 11/11] arm64: dts: meson: a1: introduce PLL and
 Peripherals clk controllers
Date: Fri, 02 Dec 2022 13:03:59 +0100
In-reply-to: <20221201225703.6507-12-ddrokosov@sberdevices.ru>
Message-ID: <1jlenq6mc7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_040709_668675_940D7BC4 
X-CRM114-Status: GOOD (  17.43  )
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


On Fri 02 Dec 2022 at 01:57, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> This patch adds clkc_periphs and clkc_pll dts nodes to A1 SoC main dtsi.
> The first one clk controller is responsible for all SoC peripherals
> clocks excluding audio clocks. The second one clk controller is used by
> A1 SoC PLLs. Actually, there are two different APB heads, so we have two
> different drivers.

Please send this change through a separate patcheset.

One patcheset/series for clk (and bindings)
Another one for the DTS (usually sent after the first one is accepted)

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

device name should be generic so

clkc_periphs: clock-controller@800 would be better

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

Same here

> +				compatible = "amlogic,a1-pll-clkc";
> +				reg = <0 0x7c80 0 0x18c>;
> +				#clock-cells = <1>;
> +				clocks = <&clkc_periphs CLKID_XTAL_FIXPLL>,
> +					 <&clkc_periphs CLKID_XTAL_HIFIPLL>;
> +				clock-names = "xtal_fixpll", "xtal_hifipll";
> +			};
>  		};
>  
>  		gic: interrupt-controller@ff901000 {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
