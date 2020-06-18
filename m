Return-Path: <SRS0=F2gE=77=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69625C433E0
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 09:58:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3984A21548
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jun 2020 09:58:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cQGT0Dnj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JwHF7p0h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3984A21548
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0szJFJ89t4Xg2IomRcQ3YlMmH0kQKnU/QaLW1ky4Jlg=; b=cQGT0DnjUnIyagc6S1TZjQNcwS
	RCAotjCQn1X4W07jh7/jCF0Cf+yh6V4XYsSKunfxZ+YMlIRbuVnTJCXLDGPgNX2GDRQkTTjLKMJdC
	74nBgWTFY0P16eIGOJpUZvQQihhlQIEj2F/ZeFAz0DO/IEuzFj68FNMMZQs1zigVJkD660ZzBLl1q
	v+SWKReAiMcQfldbOwoBjaZv2xt5LcRT03KbsgcduzMLL9srvVMkcxuvpogWhhnKHYI5fXi4OFf8+
	C4Lg+W7t8hQh4eo5aUjePc0XLPfmQC5fNk4W2lkoihc7XH+uBSzZo5druTo9hIh8eUGyaxOZJxlKy
	OMEhD4+w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlrJ2-0001Q5-HC; Thu, 18 Jun 2020 09:58:00 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlrIz-0001NK-KW
 for linux-amlogic@lists.infradead.org; Thu, 18 Jun 2020 09:57:59 +0000
Received: by mail-wr1-x443.google.com with SMTP id l10so5364732wrr.10
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Jun 2020 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oB+sr7MarpIhTklSTJ0b5AoqV07ZKXnBx9msDuhOmAs=;
 b=JwHF7p0hmsOVotfWERqLLhPZchita0CGD06rKGuPbykk/1QB3j7AASyvI5jNlxSSEs
 hXhoif4qnB6t6VotdyJGtpJ7kvcIpIqvd6GyaOoFlIob5LM8TezgTJin+/QfZsUa5G96
 TnwPSwd2io/UXga4iJzqXFb72z1lnJMaozSVBMKeTL+2V5r09vi2IwR4N8CDXtRrCuh9
 G2i2lHqWy8qsiFtqsZQ1B67+fDerqa5JpR8OV/IQRNZnFBDwvGpqmRtjbtzCwiyCngZD
 eoQA6jwnwJnP97fH3t2dkFani7CPgOTKdPlmFuRRddE9OG6ZOyQqTgKVt+Ij2f4mrPJL
 LP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=oB+sr7MarpIhTklSTJ0b5AoqV07ZKXnBx9msDuhOmAs=;
 b=FMUnJdyA3VmRkYM3wMVlENiHFoWZgQhvCxLWTDlYZro6pUka/e5gDwp68+r9BPfxE6
 si9DJJRNBFWmxDrB3ylikFZAQpNctrzShrtFC3cTr/BYX6jU6oOTnHrEVumioxdYf2C5
 CVaxzjE12XZIRktQQZ3igsh8C7AqZ8g7Srp33mz2OAwb8IrvFWIjctvq9JxAcZ02Fddb
 mNO916gDnl3m/XOqEoHVDpbmgprgfERi/3CNCvgozCKXZ4Nb8Vd0Hzv8+uy2nJEKKlwc
 iS4VL87j0AabtdGTZyb9cg5nmboEmpjrP1Zaa/4B6pj5EXs9rf5fsLjXK6POn/6FiZnd
 IV9Q==
X-Gm-Message-State: AOAM532s1MrUz1OuUst/WdRSi5QINfRVxpWszxPkHUafLpp+zNEtN2iM
 1HU2Bq00hNFQmNjQEpgF8rP1Hmw3IPKMYA==
X-Google-Smtp-Source: ABdhPJxWowRsFQ1IbM5RwgcdulqAGuppFwfKDP1U+MS7zeEJdVnoGHTWwwTdkcDGGkHKBbm5xzJtVA==
X-Received: by 2002:adf:bb02:: with SMTP id r2mr3914474wrg.143.1592474275824; 
 Thu, 18 Jun 2020 02:57:55 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:9902:c1f0:76c7:9dbc?
 ([2a01:e35:2ec0:82b0:9902:c1f0:76c7:9dbc])
 by smtp.gmail.com with ESMTPSA id g18sm2933319wme.17.2020.06.18.02.57.54
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2020 02:57:55 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: odroid: add spicc0 controller node
To: linux-amlogic@lists.infradead.org
References: <20200618095150.GA9713@home-desktop>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <75c279d1-70ad-c94e-d2dc-a7e6cc38b9ea@baylibre.com>
Date: Thu, 18 Jun 2020 11:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618095150.GA9713@home-desktop>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_025757_683631_81CC4207 
X-CRM114-Status: GOOD (  18.05  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi,

On 18/06/2020 11:51, Hyeonki Hong wrote:
> Add enabled spicc0 controller node with annotations describing the
> physical SPI0 pin number based on the 40 pin header on the Odroid
> board.

Thanks for the patch, but unfortunately this enables SPICC on the 40pin
headers, and since these pins can be used in various ways this doesn't
match the upstream device tree policy.

This should be used as a DT overlay instead.

> 
> Signed-off-by: Hyeonki Hong <hhk7734@gmail.com>
> ---
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 26 +++++++++++++++++--
>  .../boot/dts/amlogic/meson-sm1-odroid-c4.dts  | 24 ++++++++++++++++-
>  2 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> index 169ea283d4ee..ec6d345caaae 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
> @@ -16,8 +16,9 @@
>  	model = "Hardkernel ODROID-N2";
>  
>  	aliases {
> -		serial0 = &uart_AO;
>  		ethernet0 = &ethmac;
> +		serial0 = &uart_AO;
> +		spi0 = &spicc0
>  	};
>  
>  	chosen {
> @@ -328,7 +329,7 @@
>  
>  &ext_mdio {
>  	external_phy: ethernet-phy@0 {
> -		/* Realtek RTL8211F (0x001cc916) */	
> +		/* Realtek RTL8211F (0x001cc916) */
>  		reg = <0>;
>  		max-speed = <1000>;
>  
> @@ -451,6 +452,27 @@
>  	vqmmc-supply = <&flash_1v8>;
>  };
>  
> +&spicc0 {
> +	status = "okay";
> +
> +	/*
> +	 * 40 Pin Header : MOSI(GPIOX.8->19 Pin),
> +	 *		   MISO(GPIOX.9->21 Pin),
> +	 *		   SPI0_CLK(GPIOX.11->23 Pin)
> +	 *		   SPI_CE0(GPIOX.10->24 Pin),
> +	 */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spicc0_x_pins>, <&spicc0_ss0_x_pins>;
> +
> +	spidev@0 {
> +		compatible = "spidev";

spidev alone is not allowed either, since there is no true fixed
devices here.

> +		status = "okay";
> +		/* spi default max clock 100Mhz */
> +		spi-max-frequency = <100000000>;
> +		reg = <0>;
> +	};
> +};
> +
>  /*
>   * EMMC_D4, EMMC_D5, EMMC_D6 and EMMC_D7 pins are shared between SPI NOR pins
>   * and eMMC Data 4 to 7 pins.
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> index 00d90b30f8b4..f809b2ba6b15 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> @@ -14,8 +14,9 @@
>  	model = "Hardkernel ODROID-C4";
>  
>  	aliases {
> -		serial0 = &uart_AO;
>  		ethernet0 = &ethmac;
> +		serial0 = &uart_AO;
> +		spi0 = &spicc0;
>  	};
>  
>  	chosen {
> @@ -381,6 +382,27 @@
>  	vqmmc-supply = <&flash_1v8>;
>  };
>  
> +&spicc0 {
> +	status = "okay";
> +
> +	/*
> +	 * 40 Pin Header : MOSI(GPIOX.8->19 Pin),
> +	 *		   MISO(GPIOX.9->21 Pin),
> +	 *		   SPI0_CLK(GPIOX.11->23 Pin)
> +	 *		   SPI_CE0(GPIOX.10->24 Pin),
> +	 */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&spicc0_x_pins>, <&spicc0_ss0_x_pins>;
> +
> +	spidev@0 {
> +		compatible = "spidev";
> +		status = "okay";
> +		/* spi default max clock 100Mhz */
> +		spi-max-frequency = <100000000>;
> +		reg = <0>;
> +	};
> +};
> +
>  &uart_AO {
>  	status = "okay";
>  	pinctrl-0 = <&uart_ao_a_pins>;
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
