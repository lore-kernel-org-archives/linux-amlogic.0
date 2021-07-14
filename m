Return-Path: <SRS0=cPU3=MG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3594FC07E9A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 17:25:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F010360FF1
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Jul 2021 17:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F010360FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ea7GiFyzHIQKzGW4JJuEhC8dTUlnJbAhBSkbkAp2dxU=; b=gva3C+wU2cTysi
	ss0dxx9B3l9V91H0u6CNJfVxhNX4ijmVHNMF7UaocxG8nl+/9CFhnl+NfVoMlt/NXLA3bazaXZU2e
	WTI3fSX6WwDKzJwBooIche+smCaXFTObVI6mi+CrEuHF9UNaxeeX8TIhKKjax6MSIRIGK9jBRmUpe
	sCmA+h50q6Zl4QIH/OxyaEdqPar5dXssRjGqtXp/CSuvMw7ggsPRZSm4t4iQxGF8EqSZ5Ce2XVB8V
	bB/7ZOxPhQhnkv07AVJ9wjSd4xdvblvH+qWx5a9mWthNISmb5HL6JVQ0GciWW5JasHJI8SzAxotlf
	+1swRBy/9+M+dsTxdALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3idl-00EHvY-DV; Wed, 14 Jul 2021 17:25:45 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3idX-00EHt4-07; Wed, 14 Jul 2021 17:25:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id ca14so4214781edb.2;
 Wed, 14 Jul 2021 10:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HDdCuzsEIRQEbRqLmbLMr2Fppo157cgcX7veAgVnwEU=;
 b=TzmPBxh3FWomK3cu+C3DIxWGyEoanH1pzsFzSntP9kxCNDpVNaQUiFLNee1Box43iM
 ZDUfQ4JNpb+CHvvX2upwIg4eje5SwmM2gXT/44LFl30KM7u6isNs5LMqO9VIke3uOb0g
 cwajO1CNW13jcCD5XQBTIk6dIu9K3zcYHBf+/qnSmWxUfk+IbQaKi6HSjS35dIWesMap
 TcSWXjoLOcwXeIpqQOkzkGnQEzZw35lbiuZLr3OB7Wu7941jqf2+RLiRKkrKFSp+i3Kf
 PHWXqWEFoF5Cn8+OiOVwy7M+BPZs33r5xpHhX5RXa9rdaqSZGO3gfBuw3cqEDQYy2BTU
 hCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HDdCuzsEIRQEbRqLmbLMr2Fppo157cgcX7veAgVnwEU=;
 b=N0O0Xg024RjzcY+2LdH0EjepBE6QQXa9UbcN6iv71ah8wguPLdKKFFat+qFxXLCLFh
 i7q7DJX5nBXI446w1M7gEkKTg4o7/n+0cB4mh6gyb1KhRyEcfY+XTVTlqwvl8aVGvCir
 djpBKq8167Nb3ehqx1fSGA9d5meB4qFi856irnahLmJwzgicrLgYRLciq+F5Go8P1Oit
 pdLMKNfnDY9xJyMA+0foAxINP+8pZIlF8t1Qf92g1b+3kuoGZkgZT+wLQRAPOfEcQ8h8
 JRU+MfuEfI/NMrntvH6BrGRDFmEyEYhIGraEzppp7usx7eYIhiPYJbWJ7qXmx6ayW7zS
 Dlzg==
X-Gm-Message-State: AOAM532nz4u0V3gimlYkF6ZwF4H4ZchIBRQ1I4M17dHE4EazD+DTq2eV
 q68STJoYbskioOsziDzaXaPiyKFWzTStmYwiX0Q=
X-Google-Smtp-Source: ABdhPJzcmA22NEs/yt9L3GEI+PYHcmiGVgaPU9Jc2/SrrPTJMDEJEyCfK4ZSeMMHL6UYvAFdyJyUbjgshPbU8UU7qRU=
X-Received: by 2002:aa7:d344:: with SMTP id m4mr15199160edr.184.1626283527708; 
 Wed, 14 Jul 2021 10:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210713055227.1142-1-linux.amoon@gmail.com>
 <20210713055227.1142-2-linux.amoon@gmail.com>
 <CAFBinCD3ahpNQhP_jWZ3-4nXx8OqZOAANCpTN3BrsULRbYZHVw@mail.gmail.com>
 <CANAwSgTh02qg=cMT8tpHcEfAs5yW2vHQ7tPOkvuKXos_fOmh8A@mail.gmail.com>
 <CAFBinCC-kD-MW+bwqCZH5AjYDhxWa_pN2WEnHuiZpx=RhUdROQ@mail.gmail.com>
 <CANAwSgTf4sjoufrZuK-EjE=+yA8zSoVbqhEyNhJJFBLUCOVZmQ@mail.gmail.com>
In-Reply-To: <CANAwSgTf4sjoufrZuK-EjE=+yA8zSoVbqhEyNhJJFBLUCOVZmQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 14 Jul 2021 22:55:15 +0530
Message-ID: <CANAwSgR5nNN3D+NZjqNNjyp=rVYE=RG2icnJAc=5F23xSh9Bvg@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_102531_091478_55025C93 
X-CRM114-Status: GOOD (  36.96  )
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

Hi Martin.

On Wed, 14 Jul 2021 at 17:29, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> On Wed, 14 Jul 2021 at 02:05, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> > On Tue, Jul 13, 2021 at 8:45 PM Anand Moon <linux.amoon@gmail.com> wrote:
> > >
> > > Hi Martin,
> > >
> > > Thanks for reviewing the changes,
> > >
> > > On Tue, 13 Jul 2021 at 20:35, Martin Blumenstingl
> > > <martin.blumenstingl@googlemail.com> wrote:
> > > >
> > > > Hi Anand,
> > > >
> > > > On Tue, Jul 13, 2021 at 7:53 AM Anand Moon <linux.amoon@gmail.com> wrote:
> > > > >
> > > > > Add missing usb phy power node for phy mode fix below warning.
> > > > >
> > > > > [    1.253149] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
> > > > > [    1.253166] phy phy-c1108820.phy.0: Looking up phy-supply property
> > > > >                 in node /soc/cbus@c1100000/phy@8820 failed
> > > > I did some testing on my own Odroid-C1+ and this patch is not doing
> > > > anything for me.
> > > > more information below.
> > > Some device node for USB will have
> > The mistake I made before is considering USB VBUS as PHY power supply.
> > I believe the USB PHY is actually powered by the AVDD18_USB_ADC and
> > USB33_VDDIOH signals. See the S905 datasheet [0], page 25
> > These are 1.8V and 3.3V signals while you are adding a 5V regulator.
> >
> OK, thanks.
> > [...]
> > > > > +               /*
> > > > > +                * signal name from schematics: USB_POWER
> > > > > +                */
> > > > Just a few lines below you're saying that the name from the schematics is PWREN
> > > > If this patch is getting another round then please clarify the actual
> > > > signal name, or name both signals if the schematics is actually using
> > > > both names.
> > > >
> > > As per the schematics.
> > > PWREN ---> GPIOAO.BIT5      gpio pin control
> > > USB_POWER ---> P5V0          power source regulator.
> > ah, thanks for clarifying this
> > my suggestion is to put that exact paragraph into the comment to avoid confusion
> >
> > [...]
> > > > Can you please give this a try on your Odroid-C1 as well?
> > > > The conclusion from my own testing is that GPIOAO_5 doesn't seem to be
> > > > related to USB1 (host-only) because if it was then inverting the
> > > > polarity (from active high to active low) should result in a change.
> > > >
> > >
> > > Ok I have modified as per above but not changes in gpio polarity
> > > from active high to active low. see below.
> > >
> > > # Odroid C1
> > > [alarm@archl-c1e ~]$ sudo cat /sys/kernel/debug/gpio | grep USB
> > >  gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
> > >  gpio-1954 (USB_OTG_PWREN       |regulator-usbp_pwr_e) out hi
> > >
> > > # Odroid C2
> > > [alarm@archl-c2lm ~]$  sudo cat /sys/kernel/debug/gpio | grep usb
> > >  gpio-501 (USB HUB nRESET      |usb-hub-reset       ) out hi
> > >  gpio-502 (USB OTG Power En    |regulator-usb-pwrs  ) out hi
> > that's strange, my result is different
> >
> >   gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> >   enable-active-high;
> > gives me:
> >   # grep USB_OTG_PWREN /sys/kernel/debug/gpio
> >   gpio-418 (USB_OTG_PWREN       |regulator-usb-pwr-en) out hi
> >
> >   gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
> > gives me:
> >   # grep USB_OTG_PWREN /sys/kernel/debug/gpio
> >   gpio-418 (USB_OTG_PWREN       |regulator-usb-pwr-en) out lo ACTIVE LOW
> This gpio pin number dose not match the gpio pin on Odroid c1+, see below.
> >
> > Did you remove the "enable-active-high;" in your "active low" test?
> No
> > GPIO polarity for regulators is managed with that flag, not just with
> > GPIO_ACTIVE_{HIGH,LOW}
>
> It's just with changes the following, below
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -47,7 +47,7 @@ usb_pwr_en: regulator-usb-pwr-en {
>                 /*
>                  * signal name from schematics: PWREN
>                  */
> -               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> +               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
>                 enable-active-high;
>         };
>

Can you give these small changes a try,
$ git diff
diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts
b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 748f4c6a050a..066523f14074 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -47,8 +47,9 @@ usb_pwr_en: regulator-usb-pwr-en {
                /*
                 * signal name from schematics: PWREN
                 */
-               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
+               gpio = <&gpio_ao GPIOAO_5 GPIO_OPEN_DRAIN>;
                enable-active-high;
+               regulator-always-on;
        };

[alarm@archl-c1e ~]$ sudo cat /sys/kernel/debug/gpio | grep usb
 gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
 gpio-1954 (USB_OTG_PWREN       |regulator-usb-pwr-en) out lo

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
