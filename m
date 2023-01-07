Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA79C46467
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Jan 2023 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVT6+y/5KgkOAQUPFw6h8IbIRDsJxS1z0vw9QRr8+lI=; b=ebn4qA7/6ZmdV8
	0HbAmtsKQL6PvVvkYG9PnZEPdS9ODuMykekNyLMg6LssVsJCGSzgYMufHc60ZXqYbttl490fFljGX
	0vYikv7QeC6Iou4Vp7WUWErCBg4NzwavHnibDp88kTedCUNhADX8HxA71ZMKMU4wxfWXfVitVZjyO
	jmQ/0NxGPyaTqXhiKt/AHYbYRq4V111GH0ftHkdlTTtNiA/UrigJ30pI/K8yxn11K4083C3NEfaeV
	0vLZ567ygoMMx9GX1ieG2sLCplqmudbcXOOOhet5ON78cGj2136Ggd7jcj3ZnHs6J3pjZ+a2mD4DO
	RpkUd0dR0M2Kkp0erkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAcl-007QuO-J7; Sat, 07 Jan 2023 14:56:43 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAcX-007Qs8-HQ; Sat, 07 Jan 2023 14:56:31 +0000
Received: by mail-vs1-xe35.google.com with SMTP id i185so4333763vsc.6;
        Sat, 07 Jan 2023 06:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dFyLUIx8VXvv71DzGWZEEjL5hj6rPhYAH4n7XJ6OnbU=;
        b=ooXLw1zSzyjR8WV8a1SL5uV4hNdB567FCOLxUPAvYIu0IbfF79B+FPKP+QNnAKaeCE
         /xJuOTC+4evgPpENIFNGaFn3ZnfBToFYoUZwF+5kabwSTs0c4mr1czfBj0fmtdxBthPX
         LXwXbsYVB1oqJ0sBOxV+GVQkosHX+xogHXy+RJaKx8lQyVrr795FbJmRVfr6a22wt40C
         0XGkyuWl+O0kXoLzPAQZuxWnZTjjH51h640x0m0fUSnPhDti0efpZChBfAsSt0TUb9CX
         KGbATst2J89nrnZP45Jj/0BmcRvYhY3vZRIP9/5Ixc+97q8qgMPjkrTMoXLY/RWUTRu3
         ht9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dFyLUIx8VXvv71DzGWZEEjL5hj6rPhYAH4n7XJ6OnbU=;
        b=HbWD4gS7tJ6zv8/ivrsshdbhyOX2WXapEXuoLS9SRiEw1jLjIZ9Ic/XUyuLzsvEHka
         tnKq5bYC08GQ4ifUxnV8wxPUkftq5WCSWYZQDLfCLdQncUOpQk65QEe7fZXZ/x9FigG4
         GZ58H93Wc79ew3ZLpK0o/+obXNSgK1p6igdmy1HL0MYj+mwRpu/t21yPTyTpGM5DmGDc
         mXkDE6SGRmB73BhTDAf9oGybXvpbRfD7e2uk9zvwnpquYwOTpPPREmwpAMvI9OhyL/DB
         wyo3qwb/gPrXPEOgqAZC5H5tg1w7xLziiejK5ByJJeGfxDWbf9qJZGXeXQm5SucnzEVL
         30xw==
X-Gm-Message-State: AFqh2krbNldSr8d5XVQChPxdJ+DJMOk6TMd2efK03WA05cNYn8I7vakQ
	Bk88xvSv2e7cVML3q51fQCuW8uzCkFqPM3cxj0Q=
X-Google-Smtp-Source: AMrXdXtwgQnBccAmp5deA8Qb6NaBwtu2mLi/Xeu599Y9cfSvJcQOgMPGlzs0i9INqGyGNOHhdAp7Q/uoH2RT3ShqOaU=
X-Received: by 2002:a67:5c03:0:b0:3ce:a7c5:3757 with SMTP id
 q3-20020a675c03000000b003cea7c53757mr2460727vsb.63.1673103386173; Sat, 07 Jan
 2023 06:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <CANAwSgTS+j_oRrckwmi60afX6-D=OP0oy05m3eQga_gEZJJ_mg@mail.gmail.com>
 <CANAwSgTc=uGyZ0H_-ZckYoKztMB--DRfx7apBtP9zAbAU1XTvA@mail.gmail.com> <2188024.ZfL8zNpBrT@steina-w>
In-Reply-To: <2188024.ZfL8zNpBrT@steina-w>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 7 Jan 2023 20:26:09 +0530
Message-ID: <CANAwSgT1xo1Nt84p2ruXBQ+Aq+aAr62VL8Gf8iRU8u_09y8BaA@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: amlogic: Used onboard usb hub reset
 on odroid c2
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_065629_643592_5BC66FC4 
X-CRM114-Status: GOOD (  32.73  )
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

Hi Alexander,

Thanks for your review comments.

On Wed, 4 Jan 2023 at 15:06, Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Mittwoch, 4. Januar 2023, 09:13:21 CET schrieb Anand Moon:
> > Hi Martin,
> >
> > On Wed, 28 Dec 2022 at 20:14, Anand Moon <linux.amoon@gmail.com> wrote:
> > > Hi Martin,
> > >
> > > On Wed, 28 Dec 2022 at 18:21, Martin Blumenstingl
> > >
> > > <martin.blumenstingl@googlemail.com> wrote:
> > > > Hi Anand,
> > >
> > > Thanks for your review comments.
> > >
> > > > thank you for working on this topic!
> > > >
> > > > On Wed, Dec 28, 2022 at 11:05 AM Anand Moon <linux.amoon@gmail.com>
> > > > wrote:
> > > > [...]
> > > >
> > > > > +       usb {
> > > > > +               dr_mode = "host";
> > > > > +               #address-cells = <1>;
> > > > > +               #size-cells = <0>;
> > > > > +
> > > > > +               hub@1 {
> > > > > +                       /* Genesys Logic GL852G-OHG usb hub */
> > > > > +                       compatible = "genesys,usb5e3,610";
> > > > > +                       reg = <1>;
> > > > > +                       vdd-supply = <&usb_otg_pwr>;
> > > > > +                       reset-gpio = <&gpio_ao GPIOAO_4
> > > > > GPIO_ACTIVE_LOW>;
> > > > > +               };
> > > > > +       };
> > > >
> > > > My understanding is that the hub@1 node should be part of the
> > > > corresponding USB controller node, not a new node.
> > > > In this case hub@1 should go into the existing &usb1 node. That way we
> > > > describe the way the hardware is set up (meaning: hub@1 is connected
> > > > to &usb1).
> > >
> > > Ok, I will move this code under &usb0 and &usb1 nodes.
> > >
> > > onboard_usb_hub module just assists in usb hub reset.
> > > so these changes are meant to replace the gpio-hog.
> > >
> > > $ dmesg | grep onboard
> > > [    5.405558] usbcore: registered new device driver onboard-usb-hub
> > > [    6.383428] onboard-usb-hub 1-1: reset high-speed USB device number
> > > 2 using dwc2
> > >
> > > Here is the boot log of the odroid c2 [0] https://pastebin.com/PFy5waPb
> >
> > Moving the usb hub into usb subnode usb0 or usb1 does not work
> > on Odroid n2 and c4, we have a combo phys of usb 2.0 and usb 3.0
> > so the onboard usb hub reset does not get initialized until both the PHY
> > and USB nodes are brought up by the drivers.
> >
> > # On Odroid n2 has a combo hub
> > alarm@odroid-n2:~$ lsusb -tv
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
> >     ID 1d6b:0003 Linux Foundation 3.0 root hub
> >
> >     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
> >
> >         ID 05e3:0620 Genesys Logic, Inc. GL3523 Hub
> >
> >         |__ Port 1: Dev 5, If 0, Class=Mass Storage, Driver=usb-storage,
> >         |5000M
> >
> >             ID 174c:5106 ASMedia Technology Inc. ASM1051 SATA 3Gb/s bridge
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
> >     ID 1d6b:0002 Linux Foundation 2.0 root hub
> >
> >     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
> >
> >         ID 05e3:0610 Genesys Logic, Inc. Hub
> >
> >         |__ Port 2: Dev 4, If 0, Class=Vendor Specific Class,
> >
> > Driver=ax88179_178a, 480M
> >             ID 0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet
> >
> > # Odroid C4 also has a combo hub
> >
> > alarm@odroid-c4:~$ lsusb -tv
> > /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
> >     ID 1d6b:0003 Linux Foundation 3.0 root hub
> >
> >     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
> >
> >         ID 2109:0817 VIA Labs, Inc.
> > /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
> >     ID 1d6b:0002 Linux Foundation 2.0 root hub
> >
> >     |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
> >
> >         ID 2109:2817 VIA Labs, Inc.
> >
> > So I will continue to work with this usb hub node to do a proper reset
> > of the USB hub.
>
> If your USB hub does both USB2.0 and USB3.0 you need to add both devices in DT
> and reference them using 'peer-hub'property. See ca69b6c78d5d ("arm64: dts:
> tqma8mpql: add support for 2nd USB (host) interface") for a reference.
>

Yes, I have updated the DTS example for using peer-hub for both devices.

> Best regards,
> Alexander
>
Thanks



-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
