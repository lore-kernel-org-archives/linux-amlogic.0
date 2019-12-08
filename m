Return-Path: <SRS0=R+dC=Z6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F798C2D0BE
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 18:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78940205ED
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 18:05:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="snTPxsNN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="K319RU8L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78940205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6kkJmjOJjC0yLPzgJxGa4UU/V19QbiOnubcDy+qCfU=; b=snTPxsNNpkL65P
	LfIR6LR3djFhwLb9FDxVTE+2DDsObHZfvNxfWV5F4bzRrRrpuENSKvsRPHxBGtk0PV/5KebQc/6IK
	IC+Wjs5dteKjfTdv4gTbTE1Qjfq1V/b4dG6MQHvELmdB5nyeNFdep4HIjoB204zdURR4/Dtb4Hf4A
	KORckxGOQwvS+poxh8z84uQv39uBPAkqIecNeBF/S81v/zKrbzNwTgwpVB6fFlq8DYBs2xhOUoS8d
	WNj8g7oKwIzt0jmXuYydz+EhaIgim4Sg2sl0W+0H0PtqoJ8fBvYjX9uFpP10EFk5yuvyERRprtJt2
	cH8FWtg6ELapST1QTTdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie0w3-0003Gc-Ew; Sun, 08 Dec 2019 18:05:35 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie0w0-0003FM-FU
 for linux-amlogic@lists.infradead.org; Sun, 08 Dec 2019 18:05:33 +0000
Received: by mail-oi1-x244.google.com with SMTP id 6so4354372oix.7
 for <linux-amlogic@lists.infradead.org>; Sun, 08 Dec 2019 10:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mTKk2xaW6izThy3AlF0F8z6eeCX0vy7qq8T/sGHhvO8=;
 b=K319RU8L98AdTYk+TFFH07liuRfMqrUGSHeB1yVizEaZI6tXBYIJ9U1sVAHlpPqkeV
 8tT9kA6NvUJ6/a38fuTRpRIzIrjkaJosKJZy9PLidQKCmNHsJCabru0flsca74oTBtSs
 IdKJzEC3hiUvqROeWgwGkV7LfATiSnJNBePgk8ilsolml224mUrQI9KxGk0LZjn+LhSs
 nQl2G+dPsJAnsQj4j67dwKHH+6DyM17L2T76Gf9zhNekSINUnp0fNEZAwe4r4PtxmZGC
 /CP1KywXsi2+YdqjsISyMOiL3rx8neF68UBtXhPwFwdg2qVq9WgHkxHgr8jmC26B4+4S
 3CRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mTKk2xaW6izThy3AlF0F8z6eeCX0vy7qq8T/sGHhvO8=;
 b=A/bEtWM3ueyZPZT3qIK7GvJL+YB/J728+di+8YEWNQvGvwzsNTcet2eIim9nXETlyg
 N7gjdi3rTnB8Nif/vcmKFltDEo7CoH0hzJ43S/lkk3zhHRYDGimUH9+lljkebb3lmuwN
 6KkcpncSIaJnu/ftY/Rd9XGAI5y2MoORzY5Riokq55BWUvigqrTukxR6HbbCVyxC6tLJ
 gL/3v2LfuEZHVbVcrVRgMayqHNYWwlT/SJC04kxJZYTiQ6+UWVTeNr/dWSC/TcP6Wv3a
 Lqf41/5wwmSyF6bHjhWHZU2DFAx/+HTXo8OupM304+RGYgR2kZuBilxU+fl4AqLGzUDn
 ktOw==
X-Gm-Message-State: APjAAAVapvSzR2zTlWGIDNRJTtBUNxcbA9VmFQEyIYs5Lh3FPgXeoq+h
 RcceSS3MOqbdaPrvmZCL92NsC0jbV6vQCnzsPCI=
X-Google-Smtp-Source: APXvYqwP8CfD4nzvIAMNoJSw6b/s3OlcStAt+9hJdYSDZk0uioly16Xg/QyBa2wBGQwlsNfEfJZOqcez8T1vcmuzP90=
X-Received: by 2002:aca:dc45:: with SMTP id t66mr15872202oig.39.1575828327856; 
 Sun, 08 Dec 2019 10:05:27 -0800 (PST)
MIME-Version: 1.0
References: <20191206100218.480348-1-jbrunet@baylibre.com>
 <20191206100218.480348-5-jbrunet@baylibre.com>
In-Reply-To: <20191206100218.480348-5-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Dec 2019 19:05:16 +0100
Message-ID: <CAFBinCDMxf6tJt+bkfN7W5CMJrqZ+F1zTC=q8xmYtxg7gpEJxg@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: meson: add libretech-pc boards support
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_100532_518918_C11A8E87 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

this is looking good overall - I have some questions / nit-picks below

On Fri, Dec 6, 2019 at 11:02 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> +       adc_keys {
on most boards we use "adc-keys" instead of "adc_keys"

[...]
> +               button-onoff {
> +                       label = "On/Off";
> +                       linux,code = <KEY_VENDOR>;
based on the label I assumed that the code is KEY_POWER
why is KEY_VENDOR the better choice here?

[...]
> +       cvbs-connector {
> +               compatible = "composite-video-connector";
> +               status = "disabled";
is there CVBS on the board? if I remember correctly the VPU driver
works fine when omitting the CVBS connector
so if the board doesn't have it you may drop the whole node instead of
keeping it disabled

[...]
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               green {
> +                       label = "librecomputer:green:disk";
you can use the "function" and "color" properties instead of the (now
deprecated) "label"

[...]
> +&external_mdio {
> +       external_phy: ethernet-phy@0 {
> +               reg = <0>;
it would be great to have a comment above which PHY is used on this board

> +               max-speed = <1000>;
> +               reset-assert-us = <10000>;
> +               reset-deassert-us = <30000>;
> +               reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
> +               interrupt-parent = <&gpio_intc>;
a comment like /* MAC_INTR on GPIOZ_15 */ would be great here
> +               interrupts = <25 IRQ_TYPE_LEVEL_LOW>;

[...]
> +&pinctrl_periphs {
> +       /*
> +        * Make sure the reset pin of the usb HUB is driven high to take
> +        * it out of reset.
> +        */
> +       usb1_rst_pins: usb1_rst_irq {
> +               mux {
> +                       groups = "GPIODV_3";
> +                       function = "gpio_periphs";
> +                       bias-disable;
> +                       output-high;
> +               };
> +       };
on other boards (like Odroid-C2) we use a GPIO hog for this. I'm not
sure which one is better

[...]
> +&pinctrl_periphs {
> +       /*
> +        * Make sure the irq pin of the TYPE C controller is not driven
> +        * by the SoC.
is this because the SoC default configuration pulls the IRQ line LOW,
which then generates "phantom" IRQs?

[...]
> +       fusb302@22 {
typec-portc@22

[...]
> +               interrupt-parent = <&gpio_intc>;
> +               interrupts = <59 IRQ_TYPE_LEVEL_LOW>;
a comment above with the GPIO number would be great


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
