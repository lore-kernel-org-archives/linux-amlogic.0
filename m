Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEF9C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:00:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F63760F0F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F63760F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oWopEiHDLVteMRxV6Qn5KDG3upDQeOM71nXoykPGE7A=; b=WHYhIkhHPmGaKHgseeIX5hIwMO
	gVmOYQA5TJP2C0HxPyHb9kssfN+KX+CzG8/KNLVUmEFY89GKHDmIEuv3vgXgGcK5M2k3x6ftEfkM3
	jAOWstNrkTnzxR0sX0+z5SXosjhMfdPtxzL50DYHFVxXrNdsqy5UFQc0lM+LfhTnhvBp7jWFqG/vM
	RROlwdS78cg1GrZcKi7lbeApzEAXCF+LLVjO6dCZtkDqexpuo7l5k3DOsmTTA3rE+TlxefCJ6oLbH
	m0HQVyMRU462E2Hnw3UE5KSHvF+ex0hhoQ0P+Qyi5uw8duDopqVfTomCeXAKnYHx4aTZkqM4n/B2i
	AUN8Nftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vXN-00A3gT-HY; Mon, 26 Jul 2021 08:00:33 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vX1-00A3ZK-5h
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 08:00:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q3so10009736wrx.0
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 01:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BJpyEeHTDudroREb/Jyt5I/e4kbgAgcH314KeB9WrAE=;
 b=XJPIJtQcxc3JCZhnqQoBM4SWGnvoSWYYIoIeUkb8F+5tGmSoSKviWG4CC3pL6MJPSW
 xwi6Yx6KDnqzZkRvQp6k+DauGfZjchvG7RqsVZeR+74PRqET+IJzmRYrbzLN+lyVdv0C
 NajS5n3FPISZ9KAasG/jOR2hZLXtRgQ7yGa7+gWI6rNx2ntY+ODMZKtAlDpb3HcT0jx9
 g19E74bWWT2t312gSrB4exubXfq6oJKrR0vhgsmcXKRHmzSV+lA6SF9QrEAwuFAr7MFZ
 9uLtRKAUHTrPR48TdGHtduMAjHTDa4mrYsJQrW/fcIdbRAAkmp6J8181WgWfnRcDsq4Q
 J7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=BJpyEeHTDudroREb/Jyt5I/e4kbgAgcH314KeB9WrAE=;
 b=tSyqzkmaJSQw1BTLZiSR3JVCwFdxddjTrUHMq0ciW1Q/0meCq25MrkH9ysc32H76bN
 lg5x1TrmVvO8EdTE6oDjb4WJUs/qZMCN/rkYMryc+X0sByEMfpFSA1ggtRG83w1y0Rpr
 NylljD/W21cRaw33uHw1KnoVU+G/KRBhfF50uMxtm+IceLX2IYgJgCfvzEhZERU3ZjMr
 gy2aWXXRqyTrNx1cjyCrWnZwY3eMkGX2TQvjDGn33YpYd4OHJJCipt4Yu9ccG1RJrukB
 vSrrKy2q4q6g1m14UJlJ4pxivNJbDnRMhmC9YOzCWqWf11JCFIKJRA96IPaomUEWkr9g
 iuTQ==
X-Gm-Message-State: AOAM5306STDV+oygneC7k6zQspwfzyGwg0aVmKov2MASK8/1p4LtZu3u
 f1uognHx8G5W1HzJDG5k1odzuA==
X-Google-Smtp-Source: ABdhPJwEEKx0yAZ8gOlSwvDVdvwmXCM0J0EKT9gCXWOSr3C62EOI7n31GiLfh97VnYbZ4TCHs14CnQ==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr17751961wro.281.1627286409776; 
 Mon, 26 Jul 2021 01:00:09 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:32b6:aa71:d2df:4f1d?
 ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id r19sm43916628wrr.32.2021.07.26.01.00.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 01:00:09 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] ARM: dts: meson: Add the AIU audio controller
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210717233030.331273-1-martin.blumenstingl@googlemail.com>
 <20210717233030.331273-2-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <48116849-8a76-7048-2d71-9a2853db94b5@baylibre.com>
Date: Mon, 26 Jul 2021 10:00:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210717233030.331273-2-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_010011_257742_0B6036AD 
X-CRM114-Status: GOOD (  19.51  )
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

On 18/07/2021 01:30, Martin Blumenstingl wrote:
> Add the AIU audio controller to the Amlogic Meson6/8/8b/8m2 SoC DT. This
> provides I2S and SPDIF outputs as well as codec glues for the internal
> HDMI controller.
> Also add the clock inputs and pin mux definitions on Meson8/8b/8m2. On
> Meson6 this is omitted because we neither have a clock nor pin
> controller node there yet.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  arch/arm/boot/dts/meson.dtsi   | 12 +++++++
>  arch/arm/boot/dts/meson8.dtsi  | 63 ++++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/meson8b.dtsi | 63 ++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index bd0e864964e9..3be7cba603d5 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/sound/meson-aiu.h>
>  
>  / {
>  	#address-cells = <1>;
> @@ -36,6 +37,17 @@ hhi: system-controller@4000 {
>  				reg = <0x4000 0x400>;
>  			};
>  
> +			aiu: audio-controller@5400 {
> +				compatible = "amlogic,aiu";
> +				#sound-dai-cells = <2>;
> +				sound-name-prefix = "AIU";
> +				reg = <0x5400 0x2ac>;
> +				interrupts = <GIC_SPI 48 IRQ_TYPE_EDGE_RISING>,
> +					     <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
> +				interrupt-names = "i2s", "spdif";
> +				status = "disabled";
> +			};
> +
>  			assist: assist@7c00 {
>  				compatible = "amlogic,meson-mx-assist", "syscon";
>  				reg = <0x7c00 0x200>;
> diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
> index 686c7b7c79d5..f80ddc98d3a2 100644
> --- a/arch/arm/boot/dts/meson8.dtsi
> +++ b/arch/arm/boot/dts/meson8.dtsi
> @@ -317,6 +317,29 @@ mali: gpu@c0000 {
>  	};
>  }; /* end of / */
>  
> +&aiu {
> +	compatible = "amlogic,aiu-meson8", "amlogic,aiu";
> +	clocks = <&clkc CLKID_AIU_GLUE>,
> +		 <&clkc CLKID_I2S_OUT>,
> +		 <&clkc CLKID_AOCLK_GATE>,
> +		 <&clkc CLKID_CTS_AMCLK>,
> +		 <&clkc CLKID_MIXER_IFACE>,
> +		 <&clkc CLKID_IEC958>,
> +		 <&clkc CLKID_IEC958_GATE>,
> +		 <&clkc CLKID_CTS_MCLK_I958>,
> +		 <&clkc CLKID_CTS_I958>;
> +	clock-names = "pclk",
> +		      "i2s_pclk",
> +		      "i2s_aoclk",
> +		      "i2s_mclk",
> +		      "i2s_mixer",
> +		      "spdif_pclk",
> +		      "spdif_aoclk",
> +		      "spdif_mclk",
> +		      "spdif_mclk_sel";
> +	resets = <&reset RESET_AIU>;
> +};
> +
>  &aobus {
>  	pmu: pmu@e0 {
>  		compatible = "amlogic,meson8-pmu", "syscon";
> @@ -340,6 +363,38 @@ gpio_ao: ao-bank@14 {
>  			gpio-ranges = <&pinctrl_aobus 0 0 16>;
>  		};
>  
> +		i2s_am_clk_pins: i2s-am-clk-out {
> +			mux {
> +				groups = "i2s_am_clk_out_ao";
> +				function = "i2s_ao";
> +				bias-disable;
> +			};
> +		};
> +
> +		i2s_out_ao_clk_pins: i2s-ao-clk-out {
> +			mux {
> +				groups = "i2s_ao_clk_out_ao";
> +				function = "i2s_ao";
> +				bias-disable;
> +			};
> +		};
> +
> +		i2s_out_lr_clk_pins: i2s-lr-clk-out {
> +			mux {
> +				groups = "i2s_lr_clk_out_ao";
> +				function = "i2s_ao";
> +				bias-disable;
> +			};
> +		};
> +
> +		i2s_out_ch01_ao_pins: i2s-out-ch01 {
> +			mux {
> +				groups = "i2s_out_ch01_ao";
> +				function = "i2s_ao";
> +				bias-disable;
> +			};
> +		};
> +
>  		uart_ao_a_pins: uart_ao_a {
>  			mux {
>  				groups = "uart_tx_ao_a", "uart_rx_ao_a";
> @@ -460,6 +515,14 @@ mux {
>  			};
>  		};
>  
> +		spdif_out_pins: spdif-out {
> +			mux {
> +				groups = "spdif_out";
> +				function = "spdif";
> +				bias-disable;
> +			};
> +		};
> +
>  		spi_nor_pins: nor {
>  			mux {
>  				groups = "nor_d", "nor_q", "nor_c", "nor_cs";
> diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> index c02b03cbcdf4..b49b7cbaed4e 100644
> --- a/arch/arm/boot/dts/meson8b.dtsi
> +++ b/arch/arm/boot/dts/meson8b.dtsi
> @@ -279,6 +279,29 @@ mali: gpu@c0000 {
>  	};
>  }; /* end of / */
>  
> +&aiu {
> +	compatible = "amlogic,aiu-meson8b", "amlogic,aiu";
> +	clocks = <&clkc CLKID_AIU_GLUE>,
> +		 <&clkc CLKID_I2S_OUT>,
> +		 <&clkc CLKID_AOCLK_GATE>,
> +		 <&clkc CLKID_CTS_AMCLK>,
> +		 <&clkc CLKID_MIXER_IFACE>,
> +		 <&clkc CLKID_IEC958>,
> +		 <&clkc CLKID_IEC958_GATE>,
> +		 <&clkc CLKID_CTS_MCLK_I958>,
> +		 <&clkc CLKID_CTS_I958>;
> +	clock-names = "pclk",
> +		      "i2s_pclk",
> +		      "i2s_aoclk",
> +		      "i2s_mclk",
> +		      "i2s_mixer",
> +		      "spdif_pclk",
> +		      "spdif_aoclk",
> +		      "spdif_mclk",
> +		      "spdif_mclk_sel";
> +	resets = <&reset RESET_AIU>;
> +};
> +
>  &aobus {
>  	pmu: pmu@e0 {
>  		compatible = "amlogic,meson8b-pmu", "syscon";
> @@ -302,6 +325,46 @@ gpio_ao: ao-bank@14 {
>  			gpio-ranges = <&pinctrl_aobus 0 0 16>;
>  		};
>  
> +		i2s_am_clk_pins: i2s-am-clk-out {
> +			mux {
> +				groups = "i2s_am_clk_out";
> +				function = "i2s";
> +				bias-disable;
> +			};
> +		};
> +
> +		i2s_out_ao_clk_pins: i2s-ao-clk-out {
> +			mux {
> +				groups = "i2s_ao_clk_out";
> +				function = "i2s";
> +				bias-disable;
> +			};
> +		};
> +
> +		i2s_out_lr_clk_pins: i2s-lr-clk-out {
> +			mux {
> +				groups = "i2s_lr_clk_out";
> +				function = "i2s";
> +				bias-disable;
> +			};
> +		};
> +
> +		i2s_out_ch01_ao_pins: i2s-out-ch01 {
> +			mux {
> +				groups = "i2s_out_01";
> +				function = "i2s";
> +				bias-disable;
> +			};
> +		};
> +
> +		spdif_out_1_pins: spdif-out-1 {
> +			mux {
> +				groups = "spdif_out_1";
> +				function = "spdif_1";
> +				bias-disable;
> +			};
> +		};
> +
>  		uart_ao_a_pins: uart_ao_a {
>  			mux {
>  				groups = "uart_tx_ao_a", "uart_rx_ao_a";
> 


Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
