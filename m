Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5120CC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jan 2023 10:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RP200atM6BHMTF/oQZJ+aqTan3Wio44KflXqxZ6KHLQ=; b=OvKoLUvFlo9IK5
	1vnl6PMFywm6kMnPilBPwr+MfRgtCGeQsK659gpUJtScHS5aVIY8kog3ke65zKOfjLgO7g4D87guO
	dnS68t+jM9Gm+YU28cS+3+wlVhR2UsPWl7LeMAY/YwbPaEHMdl7ymX16fMTiiJjSAPNyeH8oxMcqd
	Spl7cHccsD8nLwWFIIZhl8yXNz0K5v13upz6zfSu2N0FT4mlNelmVzs7V7JOtdxqDND0sgH+wSA0Q
	Lk8avWnhB72eEs0nFnEg/3KfI/N9gBLAM/pVVSEbcf2R+IaMuqCSsvTFcd4DLKTVVj1wehytl61n0
	vDTlEsFVsWq2AtOMqg7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD1IH-008VxV-3a; Wed, 04 Jan 2023 10:46:49 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCzuF-007yjq-4u; Wed, 04 Jan 2023 09:17:56 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 6so16464038vkz.0;
        Wed, 04 Jan 2023 01:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QWfac0aQEJappowHl+xwXF9NDWJ8QlQ5XBo8UGwpyxo=;
        b=aHGIqXJVUzEVVBwFiVoh37pUXnb/eZT1qiq2eEoGXYZaCwKA51WizZm1PK7VCQ+5cE
         4RldFqpaytdMQzGkv/JIY+JmUR4NL9J7gAqnPTgSZFiEhigRNT1lTx4QmcYpz0dYb7VK
         Iqwjy9e72ygobOW9GLj33J7F0aUKTG3G9MDIR8UW9tc5NHEPHkAWjzfOBnIRpyV39z+p
         voEOlQUULjG9v6zSVdGezq77dMqcZlVSOtH+aDp5wCm386+Qs9jJfhSoETFt+R9TjpNF
         qfhv5wecBRX4MXBWW7VRMoFGlWv8MuTkEkxhT3ikeEXVJmSyeoGcpZgwSqwqqEoBffzX
         ffLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QWfac0aQEJappowHl+xwXF9NDWJ8QlQ5XBo8UGwpyxo=;
        b=jiWQNgtOU17dAZi3WZNKi4TlbqrscFNPKU7XEwdjs4uNwx7VxUge/hV+vhdWQMcRDh
         y6DjvcEhxStP8KxrN1/6YhbYe9hC6BgWO9xGRmd+8Zus8HWxWEVN+KoH3E0SCiaiz5SM
         RRmUfHM7mZU58dBe2yHn5GLJ5xcHTYhb0LwN2BZ2w8BYvl4lMo7GWzuU8DuaDKxsfaMS
         Mpo3HevIra5wt9X2HtXL9eQ0MIsLdzfDlDqR6qTXiWajBdggcoLul0wx3K+V0tPxq/GV
         iNSg9St/gRMPHDlSiHq9mTJUi0OXgk+AXFRHnsCfe23INDxkjb3BXDcfuS1Q2+Z8KTHo
         /NUg==
X-Gm-Message-State: AFqh2kqmgh0Ixs4cjHNziowo4KtrbYCx7MGfIheNssOY4zRKx9oGqB5O
	/fUMCVzm13u3ISlmKXzbnYo6DFwYR7XsPmJB6ss=
X-Google-Smtp-Source: AMrXdXueJ2O/V6xI9cs0KjLDr/43ol/vB+ey5HZomdeAQuT0cl+7SvEeUpSmSXHPTnEOPvSjRBLrRGZEo+g9KbsL5JM=
X-Received: by 2002:a05:6122:1689:b0:3c5:db35:9288 with SMTP id
 9-20020a056122168900b003c5db359288mr4946405vkl.32.1672823873536; Wed, 04 Jan
 2023 01:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-4-linux.amoon@gmail.com>
 <CAFBinCCtJbF6UjG3czQjVy_Zy_B4DO8BkcayOqDirn0OXw3PtQ@mail.gmail.com>
 <CANAwSgTS+j_oRrckwmi60afX6-D=OP0oy05m3eQga_gEZJJ_mg@mail.gmail.com>
 <CANAwSgTc=uGyZ0H_-ZckYoKztMB--DRfx7apBtP9zAbAU1XTvA@mail.gmail.com> <260b70ae-0758-592b-9c4d-90938e8a5b00@linaro.org>
In-Reply-To: <260b70ae-0758-592b-9c4d-90938e8a5b00@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 4 Jan 2023 14:47:36 +0530
Message-ID: <CANAwSgT4TXbz+dmMqiKP5JdbeaVHTh_oOtNQ_Tx-Ws+dBaWOCQ@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: amlogic: Used onboard usb hub reset
 on odroid c2
To: neil.armstrong@linaro.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_011755_323336_39890838 
X-CRM114-Status: GOOD (  26.29  )
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

Hi Niel,


On Wed, 4 Jan 2023 at 14:26, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 04/01/2023 09:13, Anand Moon wrote:
> > Hi Martin,
> >
> > On Wed, 28 Dec 2022 at 20:14, Anand Moon <linux.amoon@gmail.com> wrote:
> >>
> >> Hi Martin,
> >>
> >> On Wed, 28 Dec 2022 at 18:21, Martin Blumenstingl
> >> <martin.blumenstingl@googlemail.com> wrote:
> >>>
> >>> Hi Anand,
> >>>
> >> Thanks for your review comments.
> >>
> >>> thank you for working on this topic!
> >>>
> >>> On Wed, Dec 28, 2022 at 11:05 AM Anand Moon <linux.amoon@gmail.com> wrote:
> >>> [...]
> >>>> +       usb {
> >>>> +               dr_mode = "host";
> >>>> +               #address-cells = <1>;
> >>>> +               #size-cells = <0>;
> >>>> +
> >>>> +               hub@1 {
> >>>> +                       /* Genesys Logic GL852G-OHG usb hub */
> >>>> +                       compatible = "genesys,usb5e3,610";
> >>>> +                       reg = <1>;
> >>>> +                       vdd-supply = <&usb_otg_pwr>;
> >>>> +                       reset-gpio = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_LOW>;
> >>>> +               };
> >>>> +       };
> >>> My understanding is that the hub@1 node should be part of the
> >>> corresponding USB controller node, not a new node.
> >>> In this case hub@1 should go into the existing &usb1 node. That way we
> >>> describe the way the hardware is set up (meaning: hub@1 is connected
> >>> to &usb1).
> >>>
> >>
> >> Ok, I will move this code under &usb0 and &usb1 nodes.
> >>
> >> onboard_usb_hub module just assists in usb hub reset.
> >> so these changes are meant to replace the gpio-hog.
> >>
> >> $ dmesg | grep onboard
> >> [    5.405558] usbcore: registered new device driver onboard-usb-hub
> >> [    6.383428] onboard-usb-hub 1-1: reset high-speed USB device number
> >> 2 using dwc2
> >>
> >> Here is the boot log of the odroid c2 [0] https://pastebin.com/PFy5waPb
> >>
> >
> > Moving the usb hub into usb subnode usb0 or usb1 does not work
> > on Odroid n2 and c4, we have a combo phys of usb 2.0 and usb 3.0
> > so the onboard usb hub reset does not get initialized until both the PHY
> > and USB nodes are brought up by the drivers.
>
> Fine, then add a comment before the usb node explaining that.
>

Sure, thanks.

> Thanks,
> Neil
>
Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
