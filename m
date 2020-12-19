Return-Path: <SRS0=kh+7=FX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB47C4361B
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 22:31:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C6B8233FE
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 22:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C6B8233FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QqHoi4iiYPmXDVodVpjlJfYk4s5YQ+VBdVeBKpCKNhI=; b=NQ5utkKOf8vJpOUgtv0ymcCBs
	e9S3X08Vk3hT2Z1inKqiROhJ6sETSaZkqiGHMYEdKGabupHtohdXsgNkwC31AI+V36KFap+5txmy6
	j8Jqi/G8VykxEZrrs1ZDcqQMQ8o+wjPVkHFUP4fF7luidJ/WLNv4zFctJOnXInvXFNo6005BpQ+Wl
	IO1gkeEHMtmEFdqcp4+daJFoxPmq3loP8aTqm+s2Aek30vRRkeWrENkjaZRodNPyMtRZSU2zSPODG
	Zs92Cm40AqtNJdrJCMGrK3Fje789ieEyrE8ysGBRuqh1O6yxDXrs7mZuTcPuE1LrIjKG+rYYIE3Pk
	A5kLQ1qCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqkkz-0002GE-0D; Sat, 19 Dec 2020 22:31:21 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqkkw-0002Ff-9U
 for linux-amlogic@lists.infradead.org; Sat, 19 Dec 2020 22:31:19 +0000
Received: by mail-ej1-x630.google.com with SMTP id j22so8373462eja.13
 for <linux-amlogic@lists.infradead.org>; Sat, 19 Dec 2020 14:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BaXdLw3v1jonc9NWcCJTOo369ubiSnEjm3+3KJqRATM=;
 b=uQqNkRGeDbmEZf4kwXHXdZus/yBb9aGrXrYXzpM/NAjenzirVeNEPGFXpHHmW/NBcN
 kg7Z7y+MubT+NkUCOFlBHyIUM0b+yryaAK07G9BxtrKR2xLWklqRtp1Ie/xCGgob6rcW
 bAKvUsZB3gn8eAyhBE9oqRXgvZ6G7nSplApte/51SDjbZDvjawcWBiZpLHg7tDQ1kJ0O
 rAve4WEYo/P5Gtgx8QP68ykvEhv9cu0MZP50LJosNaREQzgZaEZ6Okn94h075BJxALZt
 jQrq+khvdTro17fIUnE1CRivcYq1UwYhPaexuAY+AXVpP2bizq9rOpNzeXKWPBmNRgjK
 t2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BaXdLw3v1jonc9NWcCJTOo369ubiSnEjm3+3KJqRATM=;
 b=DBu3JHD4o3hTO5r97fBTdCYV4+s40OoWO4hv4yZ7j4+/BctnCzoU5Ay1zhVI74uOnN
 LMpxb/8vyTRFNIEXF2xU7fPN/NE7It2B7c7V6b8bBm3MFXW2ck3yvfQKu0BlkxrLXiaK
 1kaB3qETexx5B8GZ84feY+Ev4bnCIzYQKrov2MrINRxqfjrixmcNoj0x5k8rVQJkXBh4
 KOjdIqslD0GCVGXyLPftDgC4Snd296cILd7N7vv6l0D0qOlaSGQDT8+U5eUwGm9prF5D
 ihjz2vAMUAm0J6dbx8SNS0MCMXT7t324fc68dePAZDM9GHUSbxkNUzSdFqoqtAy7M1nF
 nPBA==
X-Gm-Message-State: AOAM532HlmdGLNgac9T+I16TsWfR2PN0VMTs3CcrLhc8E2ERtjnsLnRa
 N6sjA9IY606hW3gX1puhECxi0dvZLwFxDzIvYVs=
X-Google-Smtp-Source: ABdhPJzQ79yc8Hqd2iLFmonA8JWZEFz6jPei5pwds+RYbgTjmWqUhrfgt1e5Le3Mq52CzED44UUvJRF7FSdLWO1nQmk=
X-Received: by 2002:a17:906:6c8b:: with SMTP id
 s11mr9904130ejr.187.1608417076732; 
 Sat, 19 Dec 2020 14:31:16 -0800 (PST)
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
In-Reply-To: <CANAwSgQuZbH_E7Kaxycu0vkTxzL-XqC3PneGKM3PpaPvwDQgDg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 19 Dec 2020 23:31:05 +0100
Message-ID: <CAFBinCDaT_z_+bbQ-LaSc56wuWLPmr6kz-2aYowCnQwN9VNqUw@mail.gmail.com>
Subject: Re: [BUG]odroid-c2 does not hotplug usb-devices
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_173118_404078_10ABB8E0 
X-CRM114-Status: GOOD (  23.21  )
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

On Sat, Dec 19, 2020 at 8:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> I was also looking into this issue so I made some changes in the
> phy driver to resolve the issue. Plz share your thoughts on the changes below.
first I have some questions :-)
1. do you see the same problem that Otto sees? this means: a) USB
hotplug works as long as at least one device is plugged in at boot b)
(if I understand Otto correctly then) it breaks once all USB devices
have been removed
2. does the mainline u-boot patch mentioned by Otto fix the problem
for you? according to him it fixes the problem and he did not have to
modify the USB PHY driver

> amoon@ThinkPad-T440s:~/mainline/linux-aml-5.y-devel$ git diff
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> index 7c029f552a23..363dd2ac17e6 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
> @@ -20,6 +20,7 @@ usb0_phy: phy@c0000000 {
>                         #phy-cells = <0>;
>                         reg = <0x0 0xc0000000 0x0 0x20>;
>                         resets = <&reset RESET_USB_OTG>;
> +                       reset-names = "phy-reset";
>                         clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB0>;
>                         clock-names = "usb_general", "usb";
>                         status = "disabled";
> @@ -30,6 +31,7 @@ usb1_phy: phy@c0000020 {
>                         #phy-cells = <0>;
>                         reg = <0x0 0xc0000020 0x0 0x20>;
>                         resets = <&reset RESET_USB_OTG>;
> +                       reset-names = "phy-reset";
>                         clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1>;
>                         clock-names = "usb_general", "usb";
>                         status = "disabled";
I don't see why the above two changes are needed
see my comment about of_reset_control_get_shared below

> diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c
> b/drivers/phy/amlogic/phy-meson8b-usb2.c
> index 03c061dd5f0d..31523becc878 100644
> --- a/drivers/phy/amlogic/phy-meson8b-usb2.c
> +++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
> @@ -143,14 +143,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
>         u32 reg;
>         int ret;
>
> -       if (!IS_ERR_OR_NULL(priv->reset)) {
> -               ret = reset_control_reset(priv->reset);
> -               if (ret) {
> -                       dev_err(&phy->dev, "Failed to trigger USB reset\n");
> -                       return ret;
> -               }
> -       }
> -
>         ret = clk_prepare_enable(priv->clk_usb_general);
>         if (ret) {
>                 dev_err(&phy->dev, "Failed to enable USB general clock\n");
> @@ -222,9 +214,23 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
>         return 0;
>  }
>
> +static int phy_meson8b_usb2_reset(struct phy *phy)
> +{
> +       struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
> +
> +       if (priv->reset) {
> +               reset_control_assert(priv->reset);
> +               udelay(10);
> +               reset_control_deassert(priv->reset);
> +       }
> +
> +       return 0;
> +}
> +
>  static const struct phy_ops phy_meson8b_usb2_ops = {
>         .power_on       = phy_meson8b_usb2_power_on,
>         .power_off      = phy_meson8b_usb2_power_off,
> +       .reset          = phy_meson8b_usb2_reset,
>         .owner          = THIS_MODULE,
>  };
I tested this on my Odroid-C1: phy_meson8b_usb2_reset is never called
after checking the dwc2 code this is expected: only in one very
specific case the dwc2 driver calls phy_reset
can you please find out how phy_meson8b_usb2_reset is called in your kernel?

> @@ -271,6 +277,10 @@ static int phy_meson8b_usb2_probe(struct
> platform_device *pdev)
>                 return -EINVAL;
>         }
>
> +       priv->reset = of_reset_control_get_shared(pdev->dev.of_node,
> "phy-reset");
this causes a memory-leak upon driver removal
also a few lines above we are already getting the reset line, so why
is this needed?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
