Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5641C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jan 2023 10:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSFT4GM5r4bp9La+ZGLRla7HKcnzZ9JG2EnIUQ02bOY=; b=jbRnu/BrFY4Asd
	tJa4A16PvnHpc730wgbRrdCad5ciepl+x/aTwRt7A5dhBppU00LW/6pAX3w2lw2RkBpQvns3XJzqE
	VKEPDPkOm6g5+Qkx8f/mdSgYY0YtRkDYFLmjfDp2hTSbsWDd8MBVM4PCYi5UrC0vVKQkORjzFSYH4
	cHLAVrG70HjN1QxSJt8BTIp5zh6fQSVFjzuSyanYqROuaINTnd93Rva+9enNsnBpMVO+tS9kWUewV
	UmAQKgXpdeIgSZXIRku9tslM9L8vC+AQxn4AfagF3jsbmFaAWw9bZgUnT1SzvXKmn6homE9GvnbeU
	9aekTTM8EMLlxDjpzM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD1GC-008UnS-L0; Wed, 04 Jan 2023 10:44:40 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCyu9-007YQk-VE; Wed, 04 Jan 2023 08:13:48 +0000
Received: by mail-vk1-xa31.google.com with SMTP id g65so12976606vkh.8;
        Wed, 04 Jan 2023 00:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3I30bgfMY9WUrJgksaYM9KczmD0tI2Za+tq643ww4R8=;
        b=N6J087Fm7kluyC4fhNaJ87HE4sYhM9FEquXeCTQkm3b3v0GzHcRiiGKrVvXK8G52Gl
         LH9XiEVYn0jgy7SfFtUZOm5q4zr8P8fvUQoMSGV3r5sS7Lu3Gvgjkyd+XWXAJcDMA1MB
         m7ShwnQ7roaoNvw2jiMjACtJ0WC1n/J7JKlUj+j4RDPpSBE27ar+X51je4AboKlhKnar
         wlUlvMyaNTTglPNaXb3YwdbkqCF260DHwPVwMxJNj/g53HnykeYjGNUGPgL1LRJQU1P0
         AEioHXbWTkXPSxgwCJDJIYKmcyFlKpUZyUWeLy/m/w/7pBCuuSnXdR+lgEpq1Z7sMkye
         eRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3I30bgfMY9WUrJgksaYM9KczmD0tI2Za+tq643ww4R8=;
        b=clE8NnFTIPjSfxro1vqbokRBsPCy2yaX9/WpAcaiJVZ6xG/Mhk73ZWcWMWULGinnS0
         huLs5UQqZdUt77WbS4+QNx41WTLDiQuXTiC887XsjzvaU6qIB0HR4cbuqRNUq073wIg9
         G3Vy0EvcVNFGkENm6c6DJUViaXAS/s5heLJamd4syMq5bQ+vaE7bOzBvrsAOk+ibGV+K
         MvUVRj7PecVfga9K4GtoG0Te0r/mj+foGhwc+egPGxxbMWXno6ujJixY6O2XqdgLfX1H
         9t8IRC+546up2vR7rm5O1hX/GxNsxWcdtQt/c32Y/UMmPgc4Z6jlwDoWiqpUVh0Azuuw
         21SQ==
X-Gm-Message-State: AFqh2ko2xEAM8Ah6AQ1l56aW2Cflx43qNEhSVJGJY6RSeA9wbXtxO96L
	h3SQ5fKqo7SdaV/rhXknIDbZyPx1sAZfbY6Xruk=
X-Google-Smtp-Source: AMrXdXubfkmk2rZfaNt3+6R7QotOTAbeXp9zG6pDl071rqB1KImQAd+e41xSjnzQgG1g+2zNhv1zW/xBORRaxw4AzcY=
X-Received: by 2002:a05:6122:b66:b0:3d5:d67e:e5a8 with SMTP id
 h6-20020a0561220b6600b003d5d67ee5a8mr811956vkf.33.1672820017377; Wed, 04 Jan
 2023 00:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-4-linux.amoon@gmail.com>
 <CAFBinCCtJbF6UjG3czQjVy_Zy_B4DO8BkcayOqDirn0OXw3PtQ@mail.gmail.com> <CANAwSgTS+j_oRrckwmi60afX6-D=OP0oy05m3eQga_gEZJJ_mg@mail.gmail.com>
In-Reply-To: <CANAwSgTS+j_oRrckwmi60afX6-D=OP0oy05m3eQga_gEZJJ_mg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 4 Jan 2023 13:43:21 +0530
Message-ID: <CANAwSgTc=uGyZ0H_-ZckYoKztMB--DRfx7apBtP9zAbAU1XTvA@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: amlogic: Used onboard usb hub reset
 on odroid c2
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_001346_139431_278570D3 
X-CRM114-Status: GOOD (  32.77  )
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

Hi Martin,

On Wed, 28 Dec 2022 at 20:14, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> On Wed, 28 Dec 2022 at 18:21, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> Thanks for your review comments.
>
> > thank you for working on this topic!
> >
> > On Wed, Dec 28, 2022 at 11:05 AM Anand Moon <linux.amoon@gmail.com> wrote:
> > [...]
> > > +       usb {
> > > +               dr_mode = "host";
> > > +               #address-cells = <1>;
> > > +               #size-cells = <0>;
> > > +
> > > +               hub@1 {
> > > +                       /* Genesys Logic GL852G-OHG usb hub */
> > > +                       compatible = "genesys,usb5e3,610";
> > > +                       reg = <1>;
> > > +                       vdd-supply = <&usb_otg_pwr>;
> > > +                       reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
> > > +               };
> > > +       };
> > My understanding is that the hub@1 node should be part of the
> > corresponding USB controller node, not a new node.
> > In this case hub@1 should go into the existing &usb1 node. That way we
> > describe the way the hardware is set up (meaning: hub@1 is connected
> > to &usb1).
> >
>
> Ok, I will move this code under &usb0 and &usb1 nodes.
>
> onboard_usb_hub module just assists in usb hub reset.
> so these changes are meant to replace the gpio-hog.
>
> $ dmesg | grep onboard
> [    5.405558] usbcore: registered new device driver onboard-usb-hub
> [    6.383428] onboard-usb-hub 1-1: reset high-speed USB device number
> 2 using dwc2
>
> Here is the boot log of the odroid c2 [0] https://pastebin.com/PFy5waPb
>

Moving the usb hub into usb subnode usb0 or usb1 does not work
on Odroid n2 and c4, we have a combo phys of usb 2.0 and usb 3.0
so the onboard usb hub reset does not get initialized until both the PHY
and USB nodes are brought up by the drivers.

# On Odroid n2 has a combo hub
alarm@odroid-n2:~$ lsusb -tv
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
        ID 05e3:0620 Genesys Logic, Inc. GL3523 Hub
        |__ Port 1: Dev 5, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
            ID 174c:5106 ASMedia Technology Inc. ASM1051 SATA 3Gb/s bridge
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 05e3:0610 Genesys Logic, Inc. Hub
        |__ Port 2: Dev 4, If 0, Class=Vendor Specific Class,
Driver=ax88179_178a, 480M
            ID 0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet

# Odroid C4 also has a combo hub

alarm@odroid-c4:~$ lsusb -tv
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/1p, 5000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 5000M
        ID 2109:0817 VIA Labs, Inc.
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci-hcd/2p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/4p, 480M
        ID 2109:2817 VIA Labs, Inc.

So I will continue to work with this usb hub node to do a proper reset
of the USB hub.

> > In case hub@1 is not detected within &usb1 then you maym need something
> > like [0] (not tested for your use-case).
> > If that helps: feel free to include that patch in your series.
> >
>
> Thanks, will check if this is needed in this case. As of now it just
> reinitializes the hub.
>
> >
> > Best regards,
> > Martin
> >
> >
> > [0] https://github.com/xdarklight/linux/commit/d8b96e5bc9c20ab2585194e0e59580c3b062c431
>
> Thanks
> -Anand

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
