Return-Path: <SRS0=wk+L=NV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6295C432BE
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 07:45:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C23B6023F
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Aug 2021 07:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C23B6023F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=S7YiiyxAfxiNL1PJ+6xubq7JbgRWNvWIcHPJ/QFaPTY=; b=D7Tg8AgiXWR0hLJNqTcSOYI4w0
	TrZla933xDA4pIDNewTQVbO+BY3uAtA5Ld08fJkpWMYfJMyOs5qiswc3GzfnD9cePAro7FBcwbrC/
	qHZj4gCGwdGrENFPrv7BQvCl1OtwNdBfEYG0zY6nHDSIXWFGJYsb6b2PsHSw4xEKYOXUdAH/gIw2H
	ZXqNmU4dUC+ddGK2EJ6yJ9G4HJObv+BK5x216dJNbXspo4YeEobDgPARP1V9qZr59NGhZStCW6poB
	g15c2ANid/9wvWj58Rl823G43/c7vS+/Kxk1OjeiXVZLVmv9sJwsTqQ9KFIwdtvuaiGNjitMfhnFX
	sAOO4Dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKbzF-00GeQZ-0h; Mon, 30 Aug 2021 07:45:45 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKbyz-00GeMY-KQ
 for linux-amlogic@lists.infradead.org; Mon, 30 Aug 2021 07:45:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id u16so21087404wrn.5
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Aug 2021 00:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JmmtJ+a+mV12UNw1rZr4wpix3L8Nuoi+h1F+J6JIITU=;
 b=jgDIyApDbeuxGB4yb1kORYbMRMQKQ4DPtMap5Rcl3Wkw0Et/Z2++NHx+0M5LT1KQwv
 r0pGok1bF5nZVO9Cw1uVYplSp+nb1LyfdaC6ZU74/80lgIJQTc619hruPhEBrIgkAb8t
 KJ9jY8J4udNnfndgInbSFlP1wlYHU5HJHEus8mThb296XKldMQp/TiSlOqycbF2D79KS
 zk4GjcQ8x+v/7tQnFqMrPlt/JTEclApC5w/n8U9BYgCInWILNu8EqOPEOYjRLJCtvJws
 lCxZ4zfuOd2TbEtZ9UqElX9UbAVU/muPliuvvy49R8t9iJ6oSlamhTm65wvB1RvAu9IG
 wTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JmmtJ+a+mV12UNw1rZr4wpix3L8Nuoi+h1F+J6JIITU=;
 b=to5J7rPk37p+85pl3bZuonNSqqQQx+am2ofA6aFkx/k/8dH+Ou0izNor+lWK+HeeHL
 WX46gNjQM72TMBsXTpAcQfom97kxEY+LJYC9STcFmT3yPfHB80ljBz6rk1yozKZHNAUd
 BxRpMZkzqXXTthbcy4yB89hnZR4QurxS1HvDnMkAZyxkxA706PUywJE1c+iM+9KtDbdb
 XQaJOD+gHXrdf52cw3jEl3jKaUXILb7XbhRfcoK3ssELkDB6QDYL5EJoXS4msrdlfal+
 wAuDJbYV1G00KUZNtG7GO1wpKBuUTCrZwouXLNesj0vD3CEHra+R6+XYGxDETn+BTT+L
 hZxA==
X-Gm-Message-State: AOAM531rNtZYC/40vg0XELjhcUHO1atZTBTyEeUKqFkHLA0aga+SlLq/
 x597x7mBpt/+r4JdiTJPJedbeg==
X-Google-Smtp-Source: ABdhPJx0KFabuLNOqRvUQkIv6P6jI44f7L82OW4/X1oIRfnWJn1JU1qIsaCvVIKvykvKmrvlL81w4g==
X-Received: by 2002:adf:ec8b:: with SMTP id z11mr24464082wrn.122.1630309527740; 
 Mon, 30 Aug 2021 00:45:27 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:2ecd:4eac:486d:7a1?
 ([2001:861:44c0:66c0:2ecd:4eac:486d:7a1])
 by smtp.gmail.com with ESMTPSA id n8sm14723382wra.24.2021.08.30.00.45.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 00:45:27 -0700 (PDT)
Subject: Re: [PATCHv3 1/6] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Anand Moon <linux.amoon@gmail.com>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Matt Corallo <oc2udbzfd@mattcorallo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>
References: <20210817041548.1276-1-linux.amoon@gmail.com>
 <20210817041548.1276-2-linux.amoon@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c7f6213b-5ddc-881c-1aea-9cc7b03e6a4f@baylibre.com>
Date: Mon, 30 Aug 2021 09:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817041548.1276-2-linux.amoon@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_004529_719907_1BB8E18A 
X-CRM114-Status: GOOD (  24.88  )
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

Hi,

On 17/08/2021 06:15, Anand Moon wrote:
> Add missing usb phy power node for usb node fix below warning.
> P5V0 regulator supply input voltage range to USB host controller.
> As described in the C1+ schematics, GPIO GPIOAO_5 is used to
> enable input power to USB ports, set it to Active Low.
> 
> [    1.260772] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
> [    1.260784] dwc2 c90c0000.usb: Looking up vbus-supply property in
> 		mode /soc/usb@c90c0000 failed

First of all, DT is not here to fix boot message.

Secondly, if the vbus-supply is optional, the message should be removed from
the driver/regulator core instead.

Finally, I looked at the Odroid-C1 schematics and the GPIOAO.BIT5 is an input
to the S805, and the PWREN signal is controlled by the USB Hub so this regulator
should not be added at all.

Neil

> 
> Fixes: 2eb79a4d15ff (ARM: dts: meson: enabling the USB Host
> 		controller on Odroid-C1/C1+ board)
> 
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> V2 > changes gpio polarity ACTIVE_HIGH to ACTIVE_LOW.
>      Fix the source power from phy-supply to vbus-supply.
> 
> [1] https://lore.kernel.org/linux-devicetree/20210716103651.1455-2-linux.amoon@gmail.com/
> 
> V1 > Fix the Input GPIO polarity from HIGH to LOW.
> 
> previous version
> [0] https://patchwork.kernel.org/project/linux-amlogic/patch/20190113181808.5768-1-linux.amoon@gmail.com
> 
> changes fix the vbus-suppy to phy-supply, drop enable usb0
> 
>     USB_PWR                       2    1      0 unknown  5000mV     0mA  5000mV  5000mV
>        phy-c1108820.phy.0-phy     2                                 0mA     0mV     0mV
> ---
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index c440ef94e082..30ec6a7f20c7 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -32,6 +32,23 @@ emmc_pwrseq: emmc-pwrseq {
>  		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
>  	};
>  
> +	usb_pwr_en: regulator-usb-pwr-en {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "USB_OTG_PWR";
> +
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		/*
> +		 * signal name from schematics: USB_POWER - P5V0
> +		 */
> +		vin-supply = <&p5v0>;
> +		/*
> +		 * signal name from schematics: PWREN - GPIOAO.BIT5
> +		 */
> +		gpios = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  		blue {
> @@ -119,7 +136,6 @@ vcc_3v3: regulator-vcc-3v3 {
>  		regulator-name = "VCC3V3";
>  		regulator-min-microvolt = <3300000>;
>  		regulator-max-microvolt = <3300000>;
> -
>  		vin-supply = <&p5v0>;

As martin said, only a single functional change per patch please, this line removal should go in another patch.

>  	};
>  
> @@ -382,4 +398,5 @@ &usb1_phy {
>  
>  &usb1 {
>  	status = "okay";
> +	vbus-supply = <&usb_pwr_en>;
>  };
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
