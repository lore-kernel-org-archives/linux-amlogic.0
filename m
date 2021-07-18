Return-Path: <SRS0=dufR=MK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C93C636C8
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jul 2021 11:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF2461179
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jul 2021 11:37:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACF2461179
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CQUHdVNakowTtFgNu14KcC1ovA8XkKlvOkry8n1rOwI=; b=IDQEhHdRwssRxM
	pqPf5I4eLAkYV0Dm8I/6Nw42uUgwe9b/8hmmbUWUis0mt3RPdb6AMO6/cbRHB2YlJSILpcfL788u9
	dW+N7BT9nrd6HAzwdvhxG3VU+F9RFIRC13VqbuMvDJF+PftTU+YjdnpdSTyER7wu5Pp6fv4XSXOTz
	2nJMUT+IdthKs+3RllG7XXZmkZsqhSx3TrpM3rcpmZlG5Vw8w+BXutT6Q/WMU0ypi0MMn3EOSPV1x
	niNZQCcbsNXUldfnuS9s5H5ozQ7+Zfdj5PvhWr36FEShS29a54eaAc/e6MEFWiDPFBXN5VkmQjJNp
	UTKbFHmmgSA3XQTptPyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m556w-007dEO-TW; Sun, 18 Jul 2021 11:37:30 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m556j-007dDA-73; Sun, 18 Jul 2021 11:37:19 +0000
Received: by mail-ed1-x52c.google.com with SMTP id l26so19451392eda.10;
 Sun, 18 Jul 2021 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PHSGuty7B6YPbzNEfZoQuX908EWj8TjgLEyoDQArPbY=;
 b=hJN18CfEEkE/cugKeyj1SYBW9Lg5TNVKdTNTlRgKfefOOwd+8cUuqSF5m68G4ybP//
 s/OCkyiVN7fnU9rqcM3mfuFrz+xFO/6Yahq/b111SZjy5ZDrcsadiuRjAI2oyeMQ/uFF
 5/qsw4Rxg8sZV/FlBbVJGIMhM3/03emT/Swyq+/wQTnQfrFNEpbvAOwhdl0CewD20nEn
 ebH1Swh4DuumFGxN16wEtKQvTdepIF5y1nihDHVURMSgUAth82OSNVdCMMZLRmpGJF1d
 WeMgAdarlVc6rZJWBunOgC121EbH5PigtP9tFc4ieseqO8XAN4feZabeK/U7Yve1Ow/W
 iTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PHSGuty7B6YPbzNEfZoQuX908EWj8TjgLEyoDQArPbY=;
 b=k9JVvJFwbN20hrDy5swIrjvN5/utceCNE/IN8uRohOvXM6nSCUVXzGrhTW4Hmwzzvx
 h55/4dczac2TI9uP7aIg5M6l7BqWTXZ6X/nLDyxNw0fP+WPIY8Z/sp9rqwJHiriwrvSc
 Vbth7JnANM6+DXwuNF1i4bBfWLYwVDHSnqYtIg/FWFXf/S+CIO1NVVCZ8lvIzqxkuyv6
 4aNPxpUSxCOkaJikUsYIbvncRaKaFcbHXwbDClWNYKHvy60DGMxR6lis+2KCMdUuw9TS
 aAPhhmFbIYBLPHiQPIxx96lagjd1T8U21dD1s9FGW3reiOEGrnvVlI6jkZeSyQysF2rE
 CfTQ==
X-Gm-Message-State: AOAM5308E2bdi8MWEv0gCpz8+3zf4YZAR6T9LLWWDuEPHh9fE2jIMkGY
 Zcal8Bhx4go4D0xnrnli8J9pUZhdv+k4y6RvF3g=
X-Google-Smtp-Source: ABdhPJyZ/uIBWh6k8oyyLLVMxBTrqWfesWZ/ycTiPYUPmALnvu5NB4epSQ/odsfu7AvpOsOBet5S+b9cfadOkPgjV4k=
X-Received: by 2002:aa7:c74e:: with SMTP id c14mr28017980eds.40.1626608235749; 
 Sun, 18 Jul 2021 04:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210716103651.1455-1-linux.amoon@gmail.com>
 <20210716103651.1455-2-linux.amoon@gmail.com>
 <CAFBinCDeqauw_V-Vn9cat9HaCXj6HEMz6G+G+VbqCNtGEFGYzg@mail.gmail.com>
 <CANAwSgQ5PDGUWMH-jxnz5wwutUVniTn7RAe=4J=8-jbmqxYRRg@mail.gmail.com>
In-Reply-To: <CANAwSgQ5PDGUWMH-jxnz5wwutUVniTn7RAe=4J=8-jbmqxYRRg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 18 Jul 2021 13:37:04 +0200
Message-ID: <CAFBinCBhg+dije+3DvV_V_kqHv9q+r4EPxXCYFti6KuA4mK7KQ@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Matt Corallo <oc2udbzfd@mattcorallo.com>, 
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>, 
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_043717_323895_54FD6BB2 
X-CRM114-Status: GOOD (  42.55  )
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

Hi Anand,

On Sun, Jul 18, 2021 at 5:38 AM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > > enable input power to USB ports, set it to Active Low.
> > >
> > > [    1.253149] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
> > > [    1.253166] phy phy-c1108820.phy.0: Looking up phy-supply property
> > >                 in node /soc/cbus@c1100000/phy@8820 failed
> > high prio:
> > Can you please describe how I can test this patch?
> > My concern is that previously I have tested your patch with ACTIVE_LOW
> > and ACTIVE_HIGH polarity.
> > In both cases USB is working and I cannot observe any change (apart
> > from this debug message being gone).
> >
> > In the Odroid-C1 schematics (page 1) GPIOAO.BIT5 is connected to USB_OTG *only*.
> > I cannot give my Acked-/Reviewed-/Tested-by without a description of
> > how I can actually test the GPIO potion of this patch.
This question is still open.
Even with all your explanations below I am missing a way to verify if
GPIOAO_5 is the correct GPIO to use.

> > [...]
> > > +               /*
> > > +                * signal name from schematics: PWREN - GPIOAO.BIT5
> > > +                */
> > > +               gpios = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> > low prio:
> > Even though it's strictly not necessary I think this is confusing to read.
> > Since there's no "enable-active-high" property the GPIO will be
> > considered as "active low".
> > My suggestion is to change GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW
> >
> My apologies, I might have sent the wrong set of patches its
> GPIO_ACTIVE_LOW I meant
> I have formatted with and in the course of testing and verifying It
> might have got SKIPPED.
> I didn't do this intentionally it happen with a mistake with my two
> repositories.
> I don't intend to repeat my mistake, again and again, *sorry for the trouble*.
no worries, that's why I mentioned that it's low priority

> > Also if you have any extra information since you last pinged me on IRC
> > then it would be great if you could document it.
> > I am referring to these IRC message, where you are stating that the
> > correct polarity should be "active high":
> > <armoon> xdarklight I have a question on USB GPIO Polarity on Odroid C1+
>  > <armoon> As per the
> > https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20160226.pdf
> > <armoon> MP62551DGT-LF IC controls the power for the USB PORTS
> > <armoon> https://www.mouser.com/datasheet/2/277/MP62550-1384050.pdf is
> > MP62551DGT datasheet
> > <armoon> As per the data sheet in section ORDERING INFORMATION  Active
> > enable signal is set below MP62551DGT Active High
> >
>
> [1] https://www.mouser.com/datasheet/2/277/MP62550-1384050.pdf
>
> I have read the datasheets MP62551DGT EN*  pin its Enable input. Active Low:
>        *EN I Enable input. Active Low: (MP62550), Active High: (MP62551).*
>
> I have tested with ACTIVE_LOW and followed all the steps invalidating
>  this with debugfs output.
>
> Last login: Tue Jul 13 00:02:49 2021 from 10.0.0.14
> [alarm@archl-c1e ~]$ sudo cat /sys/kernel/debug/gpio | grep usb
>  gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
>  gpio-1954 (USB_OTG_PWREN       |regulator-usb-pwr-en) out lo ACTIVE LOW
This means that whatever is configured in the .dts is also showing up
in debugfs.
It doesn't mean that the correct GPIO or polarity is used -> that is
why I want to understand how to actually test this patch.
Technically I can write a patch that makes GPIOAO_13 (which is
connected to the status LED) show up as being used by
regulator-usb-pwr-en in debugfs.

[...]
> > >  &usb1_phy {
> > >         status = "okay";
> > > +       phy-supply = <&usb_pwr_en>;
> > medium priority:
> > I have raised the following concern in one of my previous emails on this topic:
> > > The mistake I made before is considering USB VBUS as PHY power supply.
> > > I believe the USB PHY is actually powered by the AVDD18_USB_ADC and
> > > USB33_VDDIOH signals. See the S905 datasheet [0], page 25
> > > These are 1.8V and 3.3V signals while you are adding a 5V regulator.
> > you replied with:
> > > OK, thanks.
> > so I don't understand what "OK, thanks" means.
> > If it means "Martin, you are wrong" then please provide a description
> > so I can also learn something!
>
> Yes, I understood your inputs. But from the logs below is seen to
> looking for phy-supply
This sentence is correct

> This is the reason I went ahead with phy-supply as the core phy node
> needs this property.
This sentence is not correct
From drivers/phy/phy-core.c:
    phy->pwr = regulator_get_optional(&phy->dev, "phy");

As you can see, the "phy-supply" regulator is marked as optional in
the PHY subsystem.
This matches with
Documentation/devicetree/bindings/phy/phy-bindings.txt where
"phy-supply" is marked as an optional property.

> Please check below commit
> e841ec956e53 ("ARM64: dts: meson-gxbb-odroidc2: fix usb1 power supply")
That commit is from 2017. You'll also find some commits where I am
also using the phy-supply property (I didn't know better back then).
However, in 2018 things changed when the dwc2 driver gained a
vbus-supply property in commit 531ef5ebea9639 ("usb: dwc2: add support
for host mode external vbus supply")
So for new .dts support phy-supply should not be used anymore for VBUS
because phy-supply (described as "Phandle to a regulator that provides
power to the PHY." in
Documentation/devicetree/bindings/phy/phy-bindings.txt) and
vbus-supply are two different things.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
