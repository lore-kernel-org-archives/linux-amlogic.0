Return-Path: <SRS0=VwQk=ZW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36FA1C432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 19:07:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095EE2073C
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 19:07:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eD52Ga0N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNk8Pl+M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095EE2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91oDjt+hMk1xlPExN4pMJ7XFPNqwQlPj5bXf7ztQQYU=; b=eD52Ga0N8UR6bx
	Rq1xXcIcPHtwutuiNuYSvf8xddfPn1qcTabPY0km8gioVfk4oAQecn8IJ60H4TUWYg3y/3lkNGbUD
	Ef8/R1AbPzQ4ggvnwbhuZxtZ4Dzl9rO18iKL2zMyclBWHrykhos4xUhP5yLAjP6OeyBUeMxmceSuX
	LriAAc5gNcb+Fmu4d2nC7gQvcKe86qRlk6AUQuUInGt9FOvS+zFFYJew+kpMHjLMDHEeOhytQfFxc
	e5Fx586sC4jnaQYBqIOUj096WalIqR0RRvUnRVtMTs6kAC8+sUbYId52D5CBo6rBiNEY7UlOPLmuP
	nwxHC0whQj752OekCNCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib85E-0001H4-VI; Sat, 30 Nov 2019 19:07:08 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib85C-0001Gb-2q
 for linux-amlogic@lists.infradead.org; Sat, 30 Nov 2019 19:07:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id t14so911099wmi.5
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Nov 2019 11:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UldZt5/RKBZCnAACjeFXU/p+/VIq8eUMQZYuIgLgfZo=;
 b=eNk8Pl+MmA6gWkthbIunSrphy72Zw36pA7thCv4y7TXxffYiQ/xZWxBM7GAtPyvSq7
 oLuBUFco4ENDYRU+zBk8Agq8PYkn5xvw3GGkIt0trblWm2HBV4SCCd6FCneUupCt6ktN
 oA+aezjaxRuGK2GxjD+aOLnoESwPNiTzjphC9vMy7Ns1U8IKAvQm59O4jAXzhhzRxR5l
 bWm2IZpo7fqw6mq/QK+TTAu/3OOooYHovWxeGXwjpOH4eHhzii0gs1WRCGQOZJRb8GoV
 0DngMuUe9y/JbrTbGYRhaopUSAq6V46rNzGJnsYXKMDfik82FDcA5NT/CCQHzY9UM1a4
 B9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UldZt5/RKBZCnAACjeFXU/p+/VIq8eUMQZYuIgLgfZo=;
 b=c3rlXf2dkiYe3PFp2YBh9s/Xsb5DM5souD0f1tpOhBrCv159McDGHOkNzXdCYy2MGu
 jX4YsAii9S2sDKr0UfWzZzg+Xth5U9Vae2M/7Qmhimj7y8Sl3V8G7f/LNSQgq7AO9FCY
 zsgNt/re2NijrMx3Xa6BaRXk0uJv1bkxQKoYk5jKN+J13EXsCVVPC4IjqNnD8xts+Hya
 kwIIr95dX/jvkb8qW2qK5ANlZgrSzGBq2Ky7iipLrAMUca2vTPIT9Iotv3o5gg9/NvtT
 eefQIg1bvzUvzbqc2iOMG+dpel1PCPAt+A7xvdtSdbIW/bcDERsj3abPSbXAyC1uaWdp
 7v+A==
X-Gm-Message-State: APjAAAWdhTZ4vuv9rnQMp/aV5mdlzWOBuKkzOEeE3I/nc6N3KLEqubWF
 KFMV9W8u11vahy89MyN2ne0=
X-Google-Smtp-Source: APXvYqxiqdt+GkYlzr5i1CQMpOv+ujv8KITHQM45b26Z2gITm3CsZ9XYRFtKM1mum1iE1ndVDwGB+w==
X-Received: by 2002:a1c:ed0e:: with SMTP id l14mr19370331wmh.74.1575140824702; 
 Sat, 30 Nov 2019 11:07:04 -0800 (PST)
Received: from localhost ([37.238.188.27])
 by smtp.gmail.com with ESMTPSA id s8sm31838960wrt.57.2019.11.30.11.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 11:07:04 -0800 (PST)
Date: Sat, 30 Nov 2019 22:07:02 +0300
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: meson-gxbb: add support for
Message-ID: <20191130190702.52zjhlh65gpq2ugj@manjaro.localdomain>
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
 <20191130115824.31778-3-mohammad.rasim96@gmail.com>
 <CAFBinCAxt5v6K3qcWeaECnqufRpb-0OK-Q+QFR+qph_tPVaXvg@mail.gmail.com>
 <20191130174753.6ajv5spl6n3ojhqy@manjaro.localdomain>
 <CAFBinCBdGHX2dR89C+sy+v_ZmPPeu95GGDu1t0E03TYg33SChQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCBdGHX2dR89C+sy+v_ZmPPeu95GGDu1t0E03TYg33SChQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_110706_171739_23CF13F0 
X-CRM114-Status: GOOD (  28.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 19/11/30 07:57PM, Martin Blumenstingl wrote:
> On Sat, Nov 30, 2019 at 6:47 PM Mohammad Rasim
> <mohammad.rasim96@gmail.com> wrote:
> >
> > On 19/11/30 02:59PM, Martin Blumenstingl wrote:
> > > Hi Mohammad,
> > >
> > > this patch should be third in the series.
> > > the currently missing patch for the dt-bindings should be patch two.
> > > you can take the following commit as an example:
> > > effdd8a6b6ecb30b088f36ed0a1fb67cdc7610a9 ("dt-bindings: arm: amlogic:
> > > add SEI Robotics SEI610 bindings")
> > >
> > > On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
> > > <mohammad.rasim96@gmail.com> wrote:
> > > >
> > > > This patch adds support for the Videostrong KII Pro tv box which is
> > > > based on the gxbb-p201 reference design
> > > >
> > > > The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
> > > > which was merged recently into torvalds tree
> > > >
> > > > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> > > >  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 76 +++++++++++++++++++
> > > >  2 files changed, 77 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > > >
> > > > diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> > > > index 84afecba9ec0..a795a170dcab 100644
> > > > --- a/arch/arm64/boot/dts/amlogic/Makefile
> > > > +++ b/arch/arm64/boot/dts/amlogic/Makefile
> > > > @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
> > > >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> > > >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
> > > >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> > > > +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
> > > >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> > > >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
> > > >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> > > > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > > > new file mode 100644
> > > > index 000000000000..5d120e6ca338
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > > > @@ -0,0 +1,76 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +/*
> > > > + * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include "meson-gxbb-p20x.dtsi"
> > > > +
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +#include <dt-bindings/input/input.h>
> > > > +/ {
> > > > +       compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
> > > > +       model = "Videostrong KII Pro";
> > > > +
> > > > +       leds {
> > > > +               compatible = "gpio-leds";
> > > > +               red {
> > > > +                       label = "status";
> > > this property seems to be deprecated now, see
> > > Documentation/devicetree/bindings/leds/common.txt
> > > but I'm not sure whether Kevin has made a decision yet when to not
> > > accept "label" properties here anymore
> > OK, I will remove the deprecated property
> > but I'm not sure what should I choose as a function, LED_FUNCTION_STATUS
> > or LED_FUNCTION_ACTIVITY ?
> I haven't used function and color myself but I believe it works like
> this (untested):
> - add an #include <dt-bindings/leds/common.h> next to the other
> #includes (keep alphabetical ordering). this include file also
> contains all the #defines for color and function
> - add a color property, for example: color = <LED_COLOR_ID_RED>;
> - add a function property, for example: function = <LED_FUNCTION_STATUS>;
> - test, debug and fix potential issues ;)
Yes, I've already tested it but I'm just not sure what should be in the
function property, LED_FUNCTION_STATUS and LED_FUNCTION_ACTIVITY both
seem like good choices,
in my tests this property was prepended to the label
So the following:

		status {
			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
			default-state = "off";
			color = <LED_COLOR_ID_RED>;
			function = LED_FUNCTION_STATUS;
		};
resulted in a led labeled red:status
[root@alarm ~]# ls /sys/class/leds/
input1::capslock  input1::numlock  input1::scrolllock  red:status

if this property only used to lable the led then LED_FUNCTION_STATUS is
ok, but maybe this is used by userspace to trigger the led ?!

Regards
>
>
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
