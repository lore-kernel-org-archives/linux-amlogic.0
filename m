Return-Path: <SRS0=7XO7=FY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8EA7C4361B
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Dec 2020 14:34:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C93322DFA
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Dec 2020 14:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C93322DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/7+b9/e37SJxiR0SoBPBHDO6dwExmpJJiz8nTTsDYM4=; b=CAyL95qyrqCG2Nmu7AG6TiQFd
	vA+NdWeNOIB3yFv9EVOCxLv46fhe3OvZq/2Z3Ra7gLNe/GK7/YI6U21Tbaz4BaJ/qOG+4oAFdbJSF
	rVwBJXSG7Ddy7AJZtWTqsS2pwk9/150IXaL+DE2rKdtaATR+iquB+5Uc3jT2sE1gpI1wSxjANTCCB
	myzbEHTfsZZr5t7LX38/U9hStodvnnLYhcvHbPfmv2YD3X6bGV2bYwD3o2RMZ5V2SQbDDTxQSmX79
	lSpcklkvm9V5u+UmVg25td6k7nldXyiGoXlZt5YWphyeA1+lpKtmpgfidBZ7TL3buwXJEsMmtxz63
	3UVHYDe8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqzmg-0001wF-IQ; Sun, 20 Dec 2020 14:34:06 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqzme-0001vp-EO
 for linux-amlogic@lists.infradead.org; Sun, 20 Dec 2020 14:34:05 +0000
Received: by mail-ej1-x62c.google.com with SMTP id q22so9967116eja.2
 for <linux-amlogic@lists.infradead.org>; Sun, 20 Dec 2020 06:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pn5k7d0zWkOPxZ8Vt0pt5QLW2E2ZSYeANfFObptVI/U=;
 b=V0Nzl0efEuBVMpbG7avywniFivcnVECPbBxFbUgxfg38S5GeVZ9CsNtgMl6ltCP+Kl
 bOyxy0Yvgqg2q5h0c27mg+DJ4qfd49DJnAooWYiJI02PTd10jarJnapTIlXEubS/XBcz
 j4MyHO3adRQmpZTKvyDOp+r7ebvey4WbMEUN2gcUc/bW+D6zMyCyUbJB9JX1b+VSRukF
 g8mqWLZ+Vx7Z41qEZoH5+HbDz81LHq0kFOOcHsa7OTpGvE8yyeFEeQ49o+Ks8ZEShUD5
 mZ+mXayXKdcaXyjVnzQIs2D7VoFH6ZWKvWGcnzW+hJCCfC0I7yZAT2hFSTdloMgoj+/6
 1svQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pn5k7d0zWkOPxZ8Vt0pt5QLW2E2ZSYeANfFObptVI/U=;
 b=IDzPmLe1p7zOCbpINN4ZjE5buLExrNG2JRqmvmqSVgEcCgmqRSviM3f2wK1Yfk7bLX
 O3wcJ1ECEKZ1sAAPZmi7WqYyZUsBqUdRTfl5UzOTdXFefcSyEz0EkL3HVoGBx9VnUcgY
 l5x7LJ/+EKk7EKtB4Ek+mdX7P1UvVCTnZ0tkPMMW3n7L4WblS0tLFw+h+xxNeI1Bf8a+
 kHZZ6G38fCF9x3bnghpNNHiGtfDShlSHV5envUaADMXNif2BdYvgL4Gm6To7cnHyt7HC
 h3nYHeREwv+f/VJtQllxCN281XTLaYmqRmekXaElVjAOBVgnIjKNPkfAOFIcOz3KTMj9
 JStw==
X-Gm-Message-State: AOAM533DZFP0oMdAjzF67lkEj2GlMoMN7cZyqGguR7cCoqSRGW5mJH1Y
 KWFfzmcKVi5YBpV0HOwTmnDmUDJuC2srIlIPHhc=
X-Google-Smtp-Source: ABdhPJzmoq+9Ig4uflXHDZL6ItSIxzSlpuiAPCkGpm1sVttMB+BFnXiExxeGsoMUtyhncy7KEevGzS/0FHemoFyMX4Y=
X-Received: by 2002:a17:906:447:: with SMTP id
 e7mr11903090eja.172.1608474841471; 
 Sun, 20 Dec 2020 06:34:01 -0800 (PST)
MIME-Version: 1.0
References: <c2dc3507-67a7-3c18-374f-050295bc1d59@gmx.net>
 <CAFBinCDrMj4GP2cy4dBSt_isGXf4CuhmDz=uAs+gZwUGQc=o6A@mail.gmail.com>
 <8afb2adb-4581-a847-e7e0-db1e915e9247@gmx.net>
 <CAFBinCD6aqna6YYvXgO5iKWa9N3yvqehhB+SAirLaUu3xScy2Q@mail.gmail.com>
 <bd9d96d2-8b66-db93-a855-5e179adca8c9@gmx.net>
 <0d05671d-b5f4-55e4-f5bd-58410cc92d08@baylibre.com>
 <dd160e55-55e9-1c41-afcb-22990a05a86b@gmx.net>
 <CAFBinCDv+TgEgf1g7xBTknr-aJMhC3K1wOW87-06YG4sQ9wUAg@mail.gmail.com>
 <531138bc-d343-1081-d208-ab6c98c1ddd8@gmx.net>
 <CAFBinCBoWGV02hF=0DK_geLpArDtm-qbAKCrXQitpb33UU_zYA@mail.gmail.com>
 <CANAwSgQuZbH_E7Kaxycu0vkTxzL-XqC3PneGKM3PpaPvwDQgDg@mail.gmail.com>
 <CAFBinCDaT_z_+bbQ-LaSc56wuWLPmr6kz-2aYowCnQwN9VNqUw@mail.gmail.com>
 <CANAwSgRED_HEjjCO+bTzz4Yqzp=b+jPHAjFoZ5txSJ-KKyPSLQ@mail.gmail.com>
In-Reply-To: <CANAwSgRED_HEjjCO+bTzz4Yqzp=b+jPHAjFoZ5txSJ-KKyPSLQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 20 Dec 2020 15:33:50 +0100
Message-ID: <CAFBinCB9ybe_kGXodY4=XN2XaKO4-nU0Oj7FH00LR3=NY_=Dow@mail.gmail.com>
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_093404_579676_FC118F08 
X-CRM114-Status: GOOD (  34.91  )
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 u-boot-amlogic@groups.io, Otto Meier <gf435@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Sun, Dec 20, 2020 at 2:46 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > On Sat, Dec 19, 2020 at 8:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
> > [...]
> > > I was also looking into this issue so I made some changes in the
> > > phy driver to resolve the issue. Plz share your thoughts on the changes below.
> > first I have some questions :-)
> > 1. do you see the same problem that Otto sees? this means: a) USB
> > hotplug works as long as at least one device is plugged in at boot b)
> > (if I understand Otto correctly then) it breaks once all USB devices
> > have been removed
>
> On C1/C2 issue is when single usb hdd is connected to board it will
> not get detected.
> unless you connect another usb keyboard or wireless dongle to the board.
>
> *USB hot plug only works if two ore more usb devices are connected.*
I am not sure if that's really the same issue as described by Otto

[...]
> > > amoon@ThinkPad-T440s:~/mainline/linux-aml-5.y-devel$ git diff
> > > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > > b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > > index 7c029f552a23..363dd2ac17e6 100644
> > > --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > > @@ -20,6 +20,7 @@ usb0_phy: phy@c0000000 {
> > >                         #phy-cells = <0>;
> > >                         reg = <0x0 0xc0000000 0x0 0x20>;
> > >                         resets = <&reset RESET_USB_OTG>;
> > > +                       reset-names = "phy-reset";
> > >                         clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
> > >                         clock-names = "usb_general", "usb";
> > >                         status = "disabled";
> > > @@ -30,6 +31,7 @@ usb1_phy: phy@c0000020 {
> > >                         #phy-cells = <0>;
> > >                         reg = <0x0 0xc0000020 0x0 0x20>;
> > >                         resets = <&reset RESET_USB_OTG>;
> > > +                       reset-names = "phy-reset";
> > >                         clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
> > >                         clock-names = "usb_general", "usb";
> > >                         status = "disabled";
> > I don't see why the above two changes are needed
> > see my comment about of_reset_control_get_shared below
> >
>
> Yep I borrowed this logic from rockchip usb phy controller.
> but I missed the action on reset.
>
> err = devm_add_action_or_reset(base->dev, rockchip_usb_phy_action,  rk_phy);
> if (err)
> return err;
(assuming that your comment relates to the of_reset_control_get_shared
call below)
I checked rockchip_usb_phy_action and it's not calling reset_control_put either
this looks strange to me and I would say that there's a memory leak.

[...]
> > >  static const struct phy_ops phy_meson8b_usb2_ops = {
> > >         .power_on       = phy_meson8b_usb2_power_on,
> > >         .power_off      = phy_meson8b_usb2_power_off,
> > > +       .reset          = phy_meson8b_usb2_reset,
> > >         .owner          = THIS_MODULE,
> > >  };
> > I tested this on my Odroid-C1: phy_meson8b_usb2_reset is never called
> > after checking the dwc2 code this is expected: only in one very
> > specific case the dwc2 driver calls phy_reset
> > can you please find out how phy_meson8b_usb2_reset is called in your kernel?
> >
>
> Yep, Its not getting called on my board, l might be missing some thing.
are you sure that your patch fixes USB hotplug for you?

the new reset callback is a no-op because it's not called
the code below (of_reset_control_get_shared) only fetches the same
reset line that we are already using
so I am not sure what changed behavior you are seeing - can you please
explain this in more detail?

> > > @@ -271,6 +277,10 @@ static int phy_meson8b_usb2_probe(struct
> > > platform_device *pdev)
> > >                 return -EINVAL;
> > >         }
> > >
> > > +       priv->reset = of_reset_control_get_shared(pdev->dev.of_node,
> > > "phy-reset");
> > this causes a memory-leak upon driver removal
> > also a few lines above we are already getting the reset line, so why
> > is this needed?
>
> I had a feeling that USB_OTG reset will be shared between both the phy
> controller.
indeed, the USB_OTG reset is shared

> Odroid C2 reset controller have additional RESET_USB_DDR_[0,3] reset,
> but Odroid C1 dose not have this feature.
have you found where the patched Amlogic kernel/u-boot use these reset lines?
if they need to be managed by us then we probably have a bug, because
we're not currently using these anywhere

> Next time I will try to do more testing on both the devices C1/C2.
> before sending some code for review or testing.
I am happy about everyone who helps fixing the USB hotplug issue!
it's a tricky issue where I don't even know if the USB PHY, dwc2
controller or something else is the culprit
so any help is appreciated :)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
