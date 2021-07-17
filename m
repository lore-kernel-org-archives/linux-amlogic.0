Return-Path: <SRS0=V7O5=MJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B10C636CB
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 19:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9675061165
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Jul 2021 19:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9675061165
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xP5JP44zpKlcMNZI+VRuOWKfuPWgGhV2P5pFelZ1FZw=; b=e9SC+QpUWzjnhu
	GKRQ9iHvW3setDPAgSc55gXFwKh4LZkYy82axDwc2XsHrvIsn8b8+AxquZv7wn3LoKuZyylRf9aGP
	PxgJzundIsWvK7+qj4jooacz5FGZxectRtuPYVSZCZbLDUpTTKSjaiW3DCp4H19mXak0o7walt+3C
	Jj9UJucHkfv9Uehz/SPr7X8qv4v7wupeON9rpwfgUM+Yo5DYngjb+US6NJW/Eng2kt1/p21Ff0vam
	ZoPVZxaQBOpMDLgmOAIShE0aZfHvtphK9PlGvrolYBE8Zlno6iMOavk2myF3hONCf8b7GZxXE8N49
	C4PLrqtrlWJ/Vzy7K09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4qGc-006zAs-7i; Sat, 17 Jul 2021 19:46:30 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4qGP-006z9w-EH; Sat, 17 Jul 2021 19:46:19 +0000
Received: by mail-ed1-x52c.google.com with SMTP id v1so17477962edt.6;
 Sat, 17 Jul 2021 12:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uf9ovgwZadCx9qH0j7ni/tLHBwLpSqqtIpLKHpJ2A5k=;
 b=amz7jyI6NWsc3UfcTGAZpqkYN7ZZ39sstx2gCWuQeDsnK4T5Ds0rAbwzj59MV3qOXS
 qVBOaKZ2v2IvqGnmHG45Qz/VtbUPE17qbDEoAlnZq3s2G8uVUJfgtKR9iPtmnIe5ysn5
 BLzMd6KEt5ugFv4yzpBAFSmWGCLCkxJb/Q/7C65uhvWIGqhce9y0rC+ugflM0C6mC0Xg
 +fBx+8vWN4IsZzoKP9raOuZ3QwjDUK5navpcxbsZCn3GpNR+6F/5EdOrvXWsr+Wq5R+9
 Q//P+eGDC4wTeAwLxtTeytA1HziCt4zF+/uqs4ulnlwH0QRKMQQdvwUymuTTlWDryeiZ
 oPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uf9ovgwZadCx9qH0j7ni/tLHBwLpSqqtIpLKHpJ2A5k=;
 b=cpAx8/gMxQmsmrSgvkTQ2uz4v8hOfwLYZNvw2PSrzjcONFi2o/FIDDpbLNw5WZaqeb
 AjAU0s4SBEKi5vOKK1xPlqglY5ZQNqed3WD2sDtM6BRr29R605ofIIzIXJriIpxQvYKr
 SC0dN6I5uBaQrD/tn7Z+IYna3jWugNgLRcQZgMbG9gW5YAiVBbOU0VwmfM1qoyRxF76t
 xbCqQOyOQl0qyDM0Wy6GGKTiuUbzMZGZ9H3p5SDIyBBSJddnnI3JYQ0U/2mwwPEs1Qup
 G/dMGrwqYwHaCZsUETRoG2DEMAQMqI4x8EJqZpNMxtf56F0AH6sYHza36f0PiMWodGnD
 WwWw==
X-Gm-Message-State: AOAM532ZgAGbGCJ0i3uAUiUtTpp/eZZzTAv+QKedpbCJ/0Oz1IN8T2kf
 GN4qinXbCXduUsSlpOzor2oeN1LGT7PBharCKxQ=
X-Google-Smtp-Source: ABdhPJwdhDJeG3UUdeAYHhaU+cyLC7AqaAQpYGsHZwnBCdZoSn/tUwKYj1BghaowLSKgddaJsiwEdUkYfnDBaoQm8q8=
X-Received: by 2002:aa7:c550:: with SMTP id s16mr23560320edr.130.1626551174723; 
 Sat, 17 Jul 2021 12:46:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210716103651.1455-1-linux.amoon@gmail.com>
 <20210716103651.1455-2-linux.amoon@gmail.com>
In-Reply-To: <20210716103651.1455-2-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 17 Jul 2021 21:46:04 +0200
Message-ID: <CAFBinCDeqauw_V-Vn9cat9HaCXj6HEMz6G+G+VbqCNtGEFGYzg@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Matt Corallo <oc2udbzfd@mattcorallo.com>, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, 
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Brian Kim <brian.kim@hardkernel.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_124617_549513_3CAB3010 
X-CRM114-Status: GOOD (  20.28  )
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

On Fri, Jul 16, 2021 at 12:37 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Add missing usb phy power node for phy mode fix below warning.
> P5V0 regulator suppy input voltage range to USB host controller.
low prio - typo: suppy -> supply

> As descriped in the C1+ schematics, GPIO GPIOAO_5 is used to
low prio - typo: descriped -> described

> enable input power to USB ports, set it to Active Low.
>
> [    1.253149] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
> [    1.253166] phy phy-c1108820.phy.0: Looking up phy-supply property
>                 in node /soc/cbus@c1100000/phy@8820 failed
high prio:
Can you please describe how I can test this patch?
My concern is that previously I have tested your patch with ACTIVE_LOW
and ACTIVE_HIGH polarity.
In both cases USB is working and I cannot observe any change (apart
from this debug message being gone).

In the Odroid-C1 schematics (page 1) GPIOAO.BIT5 is connected to USB_OTG *only*.
I cannot give my Acked-/Reviewed-/Tested-by without a description of
how I can actually test the GPIO potion of this patch.

[...]
> +               /*
> +                * signal name from schematics: PWREN - GPIOAO.BIT5
> +                */
> +               gpios = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
low prio:
Even though it's strictly not necessary I think this is confusing to read.
Since there's no "enable-active-high" property the GPIO will be
considered as "active low".
My suggestion is to change GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW

Also if you have any extra information since you last pinged me on IRC
then it would be great if you could document it.
I am referring to these IRC message, where you are stating that the
correct polarity should be "active high":
<armoon> xdarklight I have a question on USB GPIO Polarity on Odroid C1+
<armoon> As per the
https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20160226.pdf
<armoon> MP62551DGT-LF IC controls the power for the USB PORTS
<armoon> https://www.mouser.com/datasheet/2/277/MP62550-1384050.pdf is
MP62551DGT datasheet
<armoon> As per the data sheet in section ORDERING INFORMATION  Active
enable signal is set below MP62551DGT Active High

[...]
>  &usb1_phy {
>         status = "okay";
> +       phy-supply = <&usb_pwr_en>;
medium priority:
I have raised the following concern in one of my previous emails on this topic:
> The mistake I made before is considering USB VBUS as PHY power supply.
> I believe the USB PHY is actually powered by the AVDD18_USB_ADC and
> USB33_VDDIOH signals. See the S905 datasheet [0], page 25
> These are 1.8V and 3.3V signals while you are adding a 5V regulator.
you replied with:
> OK, thanks.
so I don't understand what "OK, thanks" means.
If it means "Martin, you are wrong" then please provide a description
so I can also learn something!


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
