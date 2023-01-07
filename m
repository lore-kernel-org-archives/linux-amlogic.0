Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A579C46467
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Jan 2023 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bNyC4yhXN8tzQBt3jbXMT4Qa83xoz1HhqHyERXMJ274=; b=B4LFygUc4YLaWd
	jumrfZEiB/saRB5D4uMI8ldWWeLshZsjqxIjXdC5DdWujfmJQvkI/sKsB8Y5b327sT9PuLOqtNmiq
	utGN5f8o7p8c5e357moTQWKAxScd3YCOofdpDPTdliE9smNeo5P4vZ5En4Q6/t0BBM/0hfn+NEUyH
	jov1EqXC9ne3xONuyeUXbFNnqYsMQ0EudJk1b8lzkKxq7CMIZq9pzDjf4eCSIUOp3qEgUE6EfCH6E
	9WEDVGoGDrJtCYQYlRKnIUUVVc/fUtkDYtrptuLaA5DxAS7Ifm/KQ8Y0miAtPDdN+uqKBx7YTMgLo
	lxrdpDITNF2KmQ8l6o/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAg1-007RXh-9S; Sat, 07 Jan 2023 15:00:05 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEAfz-007RWa-3U; Sat, 07 Jan 2023 15:00:04 +0000
Received: by mail-vs1-xe30.google.com with SMTP id o63so4325772vsc.10;
        Sat, 07 Jan 2023 07:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pUeYKFgvLPiNMDM/RYrWoAcPJilIX0tcsPxNUG3sYRI=;
        b=LcbTRcIK/JQfnMLnFYv5XRqS2M1x009CwjIGyBo0OAekQMPw1uFcM3z/RPHVFkEDE/
         1NxqDM037qsuOHNstiIgd6IJ961yP2Rm0Wy8ImjQ4wMolFKQvVYQiI7DodOaU1YZd9+1
         /YNCWT6wCwkTE9UEPbHrs6UTKKAAqgPdGB+/rUWs0DCZILbN/9mCOmQarHroRLUI+lhz
         HC39jrfN7SDWdVQTVZslDvD2tr9GcmcbKyW2KA9bheDISUSAjHmMGQvBmx5gG9bTUmHe
         0298bE92L49yIi+r6QBgBnqDnvzWVoI9xz+eDTPLIT6aML+AH3L1Ly9eA9wUUQrUiWlz
         OeXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUeYKFgvLPiNMDM/RYrWoAcPJilIX0tcsPxNUG3sYRI=;
        b=U62CmGeKiCZOk1TcAVHm/gmHmG00LC0CZmF+zl2wmxAYcMFYtYlA5zOsDSp3cQQ9Yv
         8UGrhqlMk5KXQh4zHlEWSQcYslOIx2qDMJ4I3NmW6cL1aU1Ta1kqEPBvqslYhZ+22MfY
         rp6V7NI3+9+yfaJs/MKHM+S/AhT13wYK6f84wRezXrXmXFVPF7NdZq8vT4qobNYZeaWL
         o1uBmiZsW7K0vTFQkOGYz1rz8VNiER+v5TrV4OWYCgh+zSWAlNI6dDQqyU9FYcvdILsd
         1Jn+0YC/8v6/whPpAN8Ib1ybkJKd5V1mLMjIeAVV1V0mcyUndVm4z8I/lHCLfwcZ+g2+
         MKZA==
X-Gm-Message-State: AFqh2kq0Tdae3XAKvUjdDJE5BgMNhV9/5PFn3QxPHcAhbt9etbrhj3NZ
	e1LQ1RJhL3a/1I06uWBhJs8JXi/ASSzFa6GjSnA=
X-Google-Smtp-Source: AMrXdXvIB1aVw+jb60rfsdRyjxZioez123SYKtkZI05xvV4D8KCmVLZVNWmYhdkBAsWD6SEIUzvHwqQ/I4KuvF9Qnmk=
X-Received: by 2002:a05:6102:dca:b0:3ce:af78:6ae6 with SMTP id
 e10-20020a0561020dca00b003ceaf786ae6mr2247789vst.2.1673103601868; Sat, 07 Jan
 2023 07:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-3-linux.amoon@gmail.com>
 <c5b0e7e3-7e74-308f-a64b-f472acd670eb@linaro.org>
In-Reply-To: <c5b0e7e3-7e74-308f-a64b-f472acd670eb@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 7 Jan 2023 20:29:45 +0530
Message-ID: <CANAwSgTiJ9=oA6TWPF+YT2fZd4gDifmG-idW6LfHCh2VGYZoVQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] ARM: dts: amlogic: Used onboard usb hub reset to
 enable usb hub
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_070003_179759_7DE85C37 
X-CRM114-Status: GOOD (  18.26  )
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

Hi Krzysztof,

On Wed, 28 Dec 2022 at 20:39, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/12/2022 11:03, Anand Moon wrote:
> > On Odroid c1 previously use gpio-hog to reset the usb hub,
> > switch to used on board usb hub reset to enable the usb hub
> > and enable power to usb hub.
> >
> > Add usb hub regulator as per the schematic.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/arm/boot/dts/meson8b-odroidc1.dts | 40 +++++++++++++++++---------
> >  1 file changed, 27 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > index 04356bc639fa..3b29169aac43 100644
> > --- a/arch/arm/boot/dts/meson8b-odroidc1.dts
> > +++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
> > @@ -185,6 +185,33 @@ vdd_rtc: regulator-vdd-rtc {
> >
> >               vin-supply = <&vcc_3v3>;
> >       };
> > +
> > +     usb_otg_pwr: regulator-usb-pwrs {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "USB_OTG_PWR";
> > +
> > +             regulator-min-microvolt = <5000000>;
> > +             regulator-max-microvolt = <5000000>;
> > +
> > +             /* signal name from schematics: PWREN */
> > +             gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> > +             enable-active-high;
> > +             vin-supply = <&p5v0>;
> > +     };
> > +
> > +     usb {
> > +             dr_mode = "host";
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +
> > +             hub@1 {
> > +                     /* Genesys Logic GL852G-OHG usb hub */
> > +                     compatible = "genesys,usb5e3,610";
>
> Wrong compatible. Does not match pattern in usb-device.yaml.
>

ok, will fix this in the next version.

>
> Best regards,
> Krzysztof
>

Thanks


-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
