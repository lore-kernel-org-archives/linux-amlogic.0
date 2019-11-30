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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2476C432C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 17:48:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94C3C2073C
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Nov 2019 17:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c/aunH1j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVHVcEqE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94C3C2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAkjWrokyazv6pQZ6lIuqGJi9X6v10A1qcFE0sXO+hs=; b=c/aunH1jA+12Z1
	v5u63ELORGoBSysjXIsAOp0HDMgzQL2iLuo+jTCqx0LKbKf0o0JkMTirAeizt4mFHhx1hLcxBEDd6
	XUZTVr3oOxE4TOAeTbm6HDXux4Kp0JL88CHSI9swjnpYUtsv0fRsbylFG0EOzA4KWMUHNkBXeunlt
	hZTmfSX5qXtO1SGNAQrsDQg2RgSPGrkIGScvyMgMmPUSZE6c8jH4SOyROHOO/kgJ2oWIuKEoj1c5a
	0F9dp8sAVH2aON8CfECFe2lnq6tqulOno2z3g7wOHmqpxTBT+IR2QakN6lh5rr1HFa5nRwA4BIfOD
	7b6fVu8s9cTGrOrm8vOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ib6qh-0002Hp-D5; Sat, 30 Nov 2019 17:48:03 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ib6qf-0002HR-1Z
 for linux-amlogic@lists.infradead.org; Sat, 30 Nov 2019 17:48:02 +0000
Received: by mail-wm1-x343.google.com with SMTP id y23so7400715wma.0
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Nov 2019 09:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=poGibO9qdNshU37AQtEu7PiMmZHvBRxqCoaasj/1GA8=;
 b=XVHVcEqEaftrXiD8BRTcviTNWANZEUEBU6y9diugyXPcRpwCA4SmSKruP1qqR70iD6
 H7hnTWQVHUsqyluMJOQR/SdiOWdVG83vAPeTtxWr8QevOuWcK1OgkTN1LMBGumuxTBkY
 zFFtI9NqbTVo8X/shcUOzc1wAdIvMqWsWLxe1W7eYBXARjLPlXjSpL9qTYElHQmTKS5z
 YmfZyXHpV1N72F20PeCOeerXnh8f4CSwlfRclnCsgs0eufU7ophQeSsOIUUiLCslTKm0
 jhzRS4XJrUg6YIVEfOReABIH35/YyDjlXxnj+71pq0+h1P0w34o61HMXvVIWfo8aET3o
 z6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=poGibO9qdNshU37AQtEu7PiMmZHvBRxqCoaasj/1GA8=;
 b=R2OYiowOXT5qW9uNxAioMT7WjXzNkZ28nucgJJT2s9iv7ZvjYTOhswHzWvpdND+rVv
 FuHHe+/X2xQJVsWIsQaNMeb+dhBlxx2ax/F4s+8TJzukXJwFhdFz2yeJfvF8xdD3y9GO
 pr4VO0X+bC02vpw/FtsBzHV/optnuyF5C+ugZ7f7G84bOqkivOYPXc3RTRFxDjwGemV7
 IEDw8rFtAnuuuxZzgKZHt49PwsI8JmWfUZniD5xBkwIOf5F2Iq+vMbSYqlr76GEJi6Jm
 ohIJ5bMpdSVYHcy7E6wq1VxGIuSlpYjggGK4GFA1FmhhSrBVbmt8zuYS0iePXNrP+GJq
 JtGw==
X-Gm-Message-State: APjAAAUUicDauyeWR0zqhmOThGerKiG0rG+C4hREZ+KFGZkdrOme6Jkk
 GYrfkjSS/qbzUMvQqygK3u+LgUpTEpP0jw==
X-Google-Smtp-Source: APXvYqwpTPQRPBMuX6GWtHUmaUx6kn8JGbMcyBT2GtUVHCpmbhmUujHwyBLXCny+bnB0FFZrC/xYVQ==
X-Received: by 2002:a05:600c:2283:: with SMTP id
 3mr15860652wmf.100.1575136076380; 
 Sat, 30 Nov 2019 09:47:56 -0800 (PST)
Received: from localhost ([37.238.188.27])
 by smtp.gmail.com with ESMTPSA id v20sm17760305wmj.32.2019.11.30.09.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 09:47:55 -0800 (PST)
Date: Sat, 30 Nov 2019 20:47:53 +0300
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: meson-gxbb: add support for
Message-ID: <20191130174753.6ajv5spl6n3ojhqy@manjaro.localdomain>
References: <20191130115824.31778-1-mohammad.rasim96@gmail.com>
 <20191130115824.31778-3-mohammad.rasim96@gmail.com>
 <CAFBinCAxt5v6K3qcWeaECnqufRpb-0OK-Q+QFR+qph_tPVaXvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAxt5v6K3qcWeaECnqufRpb-0OK-Q+QFR+qph_tPVaXvg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191130_094801_112044_F115E459 
X-CRM114-Status: GOOD (  26.86  )
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

On 19/11/30 02:59PM, Martin Blumenstingl wrote:
> Hi Mohammad,
>
> this patch should be third in the series.
> the currently missing patch for the dt-bindings should be patch two.
> you can take the following commit as an example:
> effdd8a6b6ecb30b088f36ed0a1fb67cdc7610a9 ("dt-bindings: arm: amlogic:
> add SEI Robotics SEI610 bindings")
>
> On Sat, Nov 30, 2019 at 12:58 PM Mohammad Rasim
> <mohammad.rasim96@gmail.com> wrote:
> >
> > This patch adds support for the Videostrong KII Pro tv box which is
> > based on the gxbb-p201 reference design
> >
> > The device tree includes a new compatible for bluetooth "brcm,bcm4335a0"
> > which was merged recently into torvalds tree
> >
> > Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
> > ---
> >  arch/arm64/boot/dts/amlogic/Makefile          |  1 +
> >  .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 76 +++++++++++++++++++
> >  2 files changed, 77 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> >
> > diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> > index 84afecba9ec0..a795a170dcab 100644
> > --- a/arch/arm64/boot/dts/amlogic/Makefile
> > +++ b/arch/arm64/boot/dts/amlogic/Makefile
> > @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
> > +dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
> >  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-odroidc2.dtb
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > new file mode 100644
> > index 000000000000..5d120e6ca338
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> > @@ -0,0 +1,76 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright (c) 2019 Mohammad Rasim <mohammad.rasim96@gmail.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "meson-gxbb-p20x.dtsi"
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +/ {
> > +       compatible = "videostrong,kii-pro", "amlogic,p201", "amlogic,s905", "amlogic,meson-gxbb";
> > +       model = "Videostrong KII Pro";
> > +
> > +       leds {
> > +               compatible = "gpio-leds";
> > +               red {
> > +                       label = "status";
> this property seems to be deprecated now, see
> Documentation/devicetree/bindings/leds/common.txt
> but I'm not sure whether Kevin has made a decision yet when to not
> accept "label" properties here anymore
OK, I will remove the deprecated property
but I'm not sure what should I choose as a function, LED_FUNCTION_STATUS
or LED_FUNCTION_ACTIVITY ?
>
> > +                       gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
> > +                       default-state = "off";
> > +               };
> > +       };
> > +
> > +       gpio-keys-polled {
> > +               compatible = "gpio-keys-polled";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +               poll-interval = <20>;
> > +
> > +               button@0 {
> please name this button-reset (even though we've done it wrong for
> other boards in the past)
> @0 indicates a unit-address, but the button has no address
Ok, will fix it in the next version
>
> > +                       label = "reset";
> > +                       linux,code = <KEY_POWER>;
> > +                       gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_HIGH>;
> > +               };
> > +       };
> > +
> > +};
> > +
> > +
> > +
> > +&uart_A {
> > +       status = "okay";
> > +       pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
> > +       pinctrl-names = "default";
> > +       uart-has-rtscts;
> > +
> > +       bluetooth {
> > +               compatible = "brcm,bcm4335a0";
> > +       };
> > +};
> > +
> > +
> > +
> > +&ethmac {
> > +       status = "okay";
> > +       pinctrl-0 = <&eth_rmii_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       phy-handle = <&eth_phy0>;
> > +       phy-mode = "rmii";
> > +
> > +       mdio {
> > +               compatible = "snps,dwmac-mdio";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               eth_phy0: ethernet-phy@0 {
> > +                       /* IC Plus IP101GR (0x02430c54) */
> > +                       reg = <0>;
> > +                       reset-assert-us = <10000>;
> > +                       reset-deassert-us = <10000>;
> > +                       reset-gpios = <&gpio GPIOZ_14 GPIO_ACTIVE_LOW>;
> > +               };
> thank you for switching to the new PHY bindings :)
>
> assuming Kevin still accepts the LED "label" and you rename the button
> node then you can add my:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> (don't forget that we still need an additional dt-bindings patch though)
>
I'm sending a new version anyways so I will remove the lable property

Thanks
>
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
