Return-Path: <SRS0=7XO7=FY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21011C4361B
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Dec 2020 13:46:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 633AE216FD
	for <linux-amlogic@archiver.kernel.org>; Sun, 20 Dec 2020 13:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 633AE216FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ojtf0P5eQ+B1q0PfFvkANq2VvyudeuRawf6DTtCS4oM=; b=fuApLDuZY7fZdxYOvGtYJKfXw
	gZatmAJdNtEjXLljbA8oc0KFCov7IqoJ+wZ5y+2pCkyoFQqVh92J+HPwEy/42Nvi+hRy1P/oKsEqw
	tV81cn5lvgAsDiqpbLs886HdmhLrOA8E72lzP/mP9cEh9CEu/2+rI7O9V6slIjx7rvE8eZqgkVg2f
	EZya5fPB1C4Ua6z4N3jBQQlcDXicAOm5TjS+nLwsuMIXp+QZMv3Xpm9+hGUcQEuGk4ZPunHUD15F9
	8VqddEWJHmNb2zPOtOohBzN77HyRQ7I9dRhtlPR5bbg860Y2GB3PQwp08KGUC2UaCbDHhLFuCxrgI
	JIWsdkiUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqz2c-0000Ey-QL; Sun, 20 Dec 2020 13:46:30 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqz2a-0000EL-Du
 for linux-amlogic@lists.infradead.org; Sun, 20 Dec 2020 13:46:29 +0000
Received: by mail-ej1-x635.google.com with SMTP id x16so9847686ejj.7
 for <linux-amlogic@lists.infradead.org>; Sun, 20 Dec 2020 05:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BeTOS/rYJ0fcNZBWPplili8VWvjxTf4J+PREB3OpPiM=;
 b=kmfA4hvNiNajXa4RaqDB2fRkaMgK1amKxtQicT11Am60/OcppvCIjsXajxxp5Uk/iR
 zN0aPE0O9G4PoH0jUiF9aISWgBStBB6pMO9h38uPUJrw+MIcYfcQ0HAFwV6me2UZt8ZB
 WulmKMcE586IeP+Birf/OO+TDr9QteCo9aH8P0SNbaV4GV1sL58i/pVOD9h84QpY915R
 FrQo8PbBvEbQT9dR73w/hbuGE52kbghaGH+KpIChWDGzBdFDA0TENOiMfhZiwLQXZK7s
 iO5i6DxGfbkOCK4YbCZKTsVxP0ARlmypfJeYUb4s9fQ2SDvndH9To2GrYy/RyBxiWZHV
 Kt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BeTOS/rYJ0fcNZBWPplili8VWvjxTf4J+PREB3OpPiM=;
 b=KESnpTz8ygpUDwZSDcjVRaZCa3latmvvs0lWMqPlSJtyXaKcfep2A8OMeggoBPWBZL
 6ZL32ohOb20bfCRie/XygzVxQh96rm2VAFunX/lSpgJmtr+JAKmWJ1If+eFe8UlIt2X9
 U+mXhgVeXqrzGI9ccs3HHvzizwyXzhHCm3Kzh0azHqypBf3WkEGqcsO/mzC8xB0G3KON
 8vHwcY/J6KfW6vSGrxFzdcPFGHmTm4ISqY1mVyJbjPVwA2hAvQQ7q+3oKf4NYQmrkIBM
 71z3abju0Y60z3hTZg/0Hs6qWsYO+JXicU277Rm4vhwmjzmiHQqcEG5e24g+8if8r23M
 i9vw==
X-Gm-Message-State: AOAM530BG4dhCoH4u2YU12hvYeAE+VE8jeWcIZiTW4CglwHLg5qWJxnp
 My23YcTj8Jy1MZix5ntO7d1sxL07gFK/gRY91uA=
X-Google-Smtp-Source: ABdhPJy544hNZzRxLerPORqC+tZM84OOsTpfRJEjiga4JvKMAyfJMOWb3/LhDrCH5P2iZATj2bdxOHp7Gak4pXwndg0=
X-Received: by 2002:a17:906:d87:: with SMTP id
 m7mr11761297eji.108.1608471985962; 
 Sun, 20 Dec 2020 05:46:25 -0800 (PST)
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
In-Reply-To: <CAFBinCDaT_z_+bbQ-LaSc56wuWLPmr6kz-2aYowCnQwN9VNqUw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 20 Dec 2020 19:16:14 +0530
Message-ID: <CANAwSgRED_HEjjCO+bTzz4Yqzp=b+jPHAjFoZ5txSJ-KKyPSLQ@mail.gmail.com>
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201220_084628_554655_DE210D81 
X-CRM114-Status: GOOD (  32.46  )
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

Hi Martin,

Thanks for testing and sharing your view points.

On Sun, 20 Dec 2020 at 04:01, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Sat, Dec 19, 2020 at 8:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > I was also looking into this issue so I made some changes in the
> > phy driver to resolve the issue. Plz share your thoughts on the changes below.
> first I have some questions :-)
> 1. do you see the same problem that Otto sees? this means: a) USB
> hotplug works as long as at least one device is plugged in at boot b)
> (if I understand Otto correctly then) it breaks once all USB devices
> have been removed

On C1/C2 issue is when single usb hdd is connected to board it will
not get detected.
unless you connect another usb keyboard or wireless dongle to the board.

*USB hot plug only works if two ore more usb devices are connected.*

> 2. does the mainline u-boot patch mentioned by Otto fix the problem
> for you? according to him it fixes the problem and he did not have to
> modify the USB PHY driver
>

I have not check this out, I will verify this later.

> > amoon@ThinkPad-T440s:~/mainline/linux-aml-5.y-devel$ git diff
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > index 7c029f552a23..363dd2ac17e6 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> > @@ -20,6 +20,7 @@ usb0_phy: phy@c0000000 {
> >                         #phy-cells = <0>;
> >                         reg = <0x0 0xc0000000 0x0 0x20>;
> >                         resets = <&reset RESET_USB_OTG>;
> > +                       reset-names = "phy-reset";
> >                         clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
> >                         clock-names = "usb_general", "usb";
> >                         status = "disabled";
> > @@ -30,6 +31,7 @@ usb1_phy: phy@c0000020 {
> >                         #phy-cells = <0>;
> >                         reg = <0x0 0xc0000020 0x0 0x20>;
> >                         resets = <&reset RESET_USB_OTG>;
> > +                       reset-names = "phy-reset";
> >                         clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
> >                         clock-names = "usb_general", "usb";
> >                         status = "disabled";
> I don't see why the above two changes are needed
> see my comment about of_reset_control_get_shared below
>

Yep I borrowed this logic from rockchip usb phy controller.
but I missed the action on reset.

err = devm_add_action_or_reset(base->dev, rockchip_usb_phy_action,  rk_phy);
if (err)
return err;

> > diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c
> > b/drivers/phy/amlogic/phy-meson8b-usb2.c
> > index 03c061dd5f0d..31523becc878 100644
> > --- a/drivers/phy/amlogic/phy-meson8b-usb2.c
> > +++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
> > @@ -143,14 +143,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
> >         u32 reg;
> >         int ret;
> >
> > -       if (!IS_ERR_OR_NULL(priv->reset)) {
> > -               ret = reset_control_reset(priv->reset);
> > -               if (ret) {
> > -                       dev_err(&phy->dev, "Failed to trigger USB reset\n");
> > -                       return ret;
> > -               }
> > -       }
> > -
> >         ret = clk_prepare_enable(priv->clk_usb_general);
> >         if (ret) {
> >                 dev_err(&phy->dev, "Failed to enable USB general clock\n");
> > @@ -222,9 +214,23 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
> >         return 0;
> >  }
> >
> > +static int phy_meson8b_usb2_reset(struct phy *phy)
> > +{
> > +       struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
> > +
> > +       if (priv->reset) {
> > +               reset_control_assert(priv->reset);
> > +               udelay(10);
> > +               reset_control_deassert(priv->reset);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct phy_ops phy_meson8b_usb2_ops = {
> >         .power_on       = phy_meson8b_usb2_power_on,
> >         .power_off      = phy_meson8b_usb2_power_off,
> > +       .reset          = phy_meson8b_usb2_reset,
> >         .owner          = THIS_MODULE,
> >  };
> I tested this on my Odroid-C1: phy_meson8b_usb2_reset is never called
> after checking the dwc2 code this is expected: only in one very
> specific case the dwc2 driver calls phy_reset
> can you please find out how phy_meson8b_usb2_reset is called in your kernel?
>

Yep, Its not getting called on my board, l might be missing some thing.

> > @@ -271,6 +277,10 @@ static int phy_meson8b_usb2_probe(struct
> > platform_device *pdev)
> >                 return -EINVAL;
> >         }
> >
> > +       priv->reset = of_reset_control_get_shared(pdev->dev.of_node,
> > "phy-reset");
> this causes a memory-leak upon driver removal
> also a few lines above we are already getting the reset line, so why
> is this needed?

I had a feeling that USB_OTG reset will be shared between both the phy
controller.

Odroid C2 reset controller have additional RESET_USB_DDR_[0,3] reset,
but Odroid C1 dose not have this feature.

Next time I will try to do more testing on both the devices C1/C2.
before sending some code for review or testing.

Best Regards
-Anand

>
>
> Best regards,
> Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
