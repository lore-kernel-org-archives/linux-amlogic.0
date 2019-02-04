Return-Path: <SRS0=P8k8=QL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B716CC282C4
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Feb 2019 13:29:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 854E42081B
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Feb 2019 13:29:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nA5Zw65R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="FC/Lj5os"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 854E42081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPQXaBwu3jaQf1Gphamowy96PjGaUxMhlGDkkjS6v3Y=; b=nA5Zw65RRBOFJ6
	ICVh0vQAbgpfVrI/rCw5OfF5LJ51Qx7fI1fWUyBAD53pDYUr1pEn5a0411xltGbmKd2Yw2/cAjcYX
	WJyDwyEymxoTwbCMGOq9DJIdbB7VNG2VIQasoArGj4JqzyJ8gaseU1Eb0w3pmKW2uYi/DXHR/E8QT
	QGNL0kJYEAkjoDm6nfcSgsOmIoJKRuJSwq3/oEBCiCWAuabzbeO0Btb49pS00mIfD0w7rG2s75oka
	a3BCWkHjGDBRDsdnwiG7u/d+2Xcagh8eLosTgdMVsSFBDLdRbsUdCJSchvXAK6ziqlxkq5ATFKCnn
	1ytqA7iPeG0cs6zNPswQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqeJe-00035g-En; Mon, 04 Feb 2019 13:29:38 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqeJR-0002u9-Qu; Mon, 04 Feb 2019 13:29:27 +0000
Received: by mail-ot1-x342.google.com with SMTP id s5so12878937oth.7;
 Mon, 04 Feb 2019 05:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PX2nUzOGWM+v+00iyKADhvLbXKt1XtuA7NyX41AbHds=;
 b=FC/Lj5osIryTBPylmcglOuuMp/bV+WbMVVYEMTgclPIFBe8f8xm7+D0aEjvXYLEhij
 EdrNG7ymwb3bRtyBN7uyV0KWk+34H21Ji+if6JxHGzd9qiJPMdt7zj3M7cGBpozHcUMO
 coqBccAtqVZ4TtlaRkTqNvBeZsz3o/QhrkvNINMAmGYH1lN6WD7FnETa6RQIffojZ/T0
 KLJafKzFIlSyA7D7fJAZjkMsEZKObea+EAxGxA5aCWtXzQzF/JRWtmJroe+jmIcXTpLE
 WZ6BCCmvbwy+cXUgjPHNqKKNDOT4m8dRQXiGcc0Uh1u98DLoBMus9H/drb2pCnTAXXY2
 RS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PX2nUzOGWM+v+00iyKADhvLbXKt1XtuA7NyX41AbHds=;
 b=bYazpDnfcKFBXb/mhgsl3r8Rm9LOE3b5b+MC6NtBNznhR9MLekwfx0QVSnU2t209u0
 x4iPFVX6vyUOrMIpjEZKlRz42Czg15vz1s1UOy0UNGbv0pDWW6MjNiwSPfORDX/aGbdJ
 lG4tpDiV3xP7xYft+3R7S3rHwF9zV0M8W+kTcKYA0Rvdm3SpNjio3lIRHreCzZBtTdEr
 z9AWTn8hy3rsZkMahDA2dWW3/MDu0V9g7S4+Je9R89YLNYTllk0sSoSs48XZxMTTPTzH
 SIigCx+H8/uOekztEDVfRl49FeM4VEAtd/lvHPANdVusvjUKA1piBrJLENfymND9cXUS
 dK3Q==
X-Gm-Message-State: AHQUAuaDT5CgYcTfAlqYszJyhqREyHQLhU5ywb0sj+JMMIhx3moTu456
 /6mSLAQinS34/LuLnuDz0kFi2ttsPTVT7veJbTgnXA==
X-Google-Smtp-Source: ALg8bN5AbN5bptebWAOliyvj2C8cUFjuUpD2hmKz69j2eyEWTPWLnmRiP6pfskvLHkKGq7mDGwJkxsz3ocmvgOkur3s=
X-Received: by 2002:aca:3586:: with SMTP id c128mr27603341oia.47.1549286963850; 
 Mon, 04 Feb 2019 05:29:23 -0800 (PST)
MIME-Version: 1.0
References: <20190123151209.2080-1-linux.amoon@gmail.com>
 <20190123151209.2080-3-linux.amoon@gmail.com>
In-Reply-To: <20190123151209.2080-3-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 4 Feb 2019 14:29:13 +0100
Message-ID: <CAFBinCAdf0rtt-7tON_LRNH_cpvGJXX3LX8g-i4xsC3wahZSVA@mail.gmail.com>
Subject: Re: [RFCv1 2/3] ARM: dts: meson8b: odroidc1: fix USB power supplies
 for phy
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_052925_875953_129FB9D8 
X-CRM114-Status: GOOD (  22.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Wed, Jan 23, 2019 at 4:12 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> This patch enables the USB Host controller (USB0) and the relative USB0 PHY.
> From the shematics GPIOAO.BIT5 gpio input for the PWREN signal of the
> USB_OTG controller (usb0) which is also linked to USB_HOST controller (usb1).
> Add missing phy-supply link to both  USB0 and USB1 phy controller
> This changes fixed the power issue on usb ports. Changes help fix usb reset warning.
I prefer to change the way patches 2 and 3 are split:
- this one should only add the regulators and link it with the USB controller
- patch 3 should enable usb0 and usb0_phy

the reason behind this is the "Fixes" tag below. it's good to have it,
so please keep it in this patch!
however, enabling usb0 is not a fix for a commit which enables the
"USB host controller on Odroid-C1/C1+" (which is why enabling usb0 and
usb0_phy should be part of patch 3)

> [  821.991470] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  825.243385] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  828.151310] usb 1-1.2: reset high-speed USB device number 3 using dwc2
> [  830.991241] usb 1-1.2: reset high-speed USB device number 3 using dwc2
>
> Fixes: 2eb79a4d15ff ("ARM: dts: meson: enabling the USB Host controller on Odroid-C1/C1+ board")
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Changes from previous patch.
>
> Fix the subject and commit message as per Martin's request
>  --Add the signal name in the comment
>  --Replace vbus-supply with phy-supply linking the power supply to phy node as pointed by Marine
>    which a PWREN signal in the USB_HOST controller (usb1)
>
> USB_VBUS                      4    2      0 unknown  5000mV     0mA  5000mV  5000mV
>    phy-c1108820.phy.1         2                                 0mA     0mV     0mV
>    phy-c1108800.phy.0         2                                 0mA     0mV     0mV
> ---
>  arch/arm/boot/dts/meson8b-odroidc1.dts | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> index 58669abda259..bfa472a679d9 100644
> --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> @@ -83,6 +83,22 @@
>                 regulator-max-microvolt = <5000000>;
>         };
>
> +       usb_vbus: regulator-usb-vbus {
> +               compatible = "regulator-fixed";
> +
> +               regulator-name = "USB_VBUS";
> +               regulator-min-microvolt = <5000000>;
> +               regulator-max-microvolt = <5000000>;
> +
> +               vin-supply = <&p5v0>;
> +
> +               /*
> +                * signal name from schematics: PWREN
> +                */
> +               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> +               enable-active-high;
> +       };
> +
>         tflash_vdd: regulator-tflash_vdd {
>                 /*
>                  * signal name from schematics: TFLASH_VDD_EN
> @@ -295,8 +311,18 @@
>         pinctrl-names = "default";
>  };
>
> +&usb0_phy {
> +       status = "okay";
> +       phy-supply = <&usb_vbus>;
I'm not sure whether phy-supply is correct here
with the PHY framework and the dwc2 controller regulators can be set as:
- phy-supply (inside the PHY node)
- vbus-supply (inside the dwc2 controller node)

phy-supply is always enabled when the PHY is enabled.
vbus-supply is smarter: it's enabled whenever the controller is in
host mode (or OTG detects hosts mode), but disabled in
device/peripheral mode

as far as I understand we don't want to send power to the "Micro USB"
port if we're in device/peripheral mode.


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
