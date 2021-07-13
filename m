Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AF7C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 20:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAC946128E
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 20:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAC946128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rA02YRN03xlFx/Bl05ZvGMg7dNU+WInMh6Oa+jIx3ko=; b=E80qdQzvJ8Devy
	C3FDCNpfIZh5aZAQdN0YSDO3ArJjfk8XpQiiS1LdSbjPJcLmhIDFNGstKIj4ZPzsdbqHskdQOo+aG
	i9fXDU/UkW6HWmO39Z3sm8UCD3wUCTYVRH0HD4e+DGvPbWwolNxSsJmq/N0KIWTeP4jLt9iVWdqwX
	JkmTfh8qqNjrhFNzJDh1DL8k+z3BNRANfa0FhA+3GHIE+slW407wECaEFUkb6qUfQlm/ziMd3NTgr
	pOjjDO+OTCKsin0yfghbpAqXq/xN2ty8ljG86ZvC6n/nO3sr+HBryjCBYq3hA1AAczG4Wa83J511Z
	XLEjYO7dky6gg8mZ7TRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3P83-00BK0k-TY; Tue, 13 Jul 2021 20:35:43 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3P7q-00BJyW-3M; Tue, 13 Jul 2021 20:35:31 +0000
Received: by mail-ed1-x529.google.com with SMTP id ca14so18052488edb.2;
 Tue, 13 Jul 2021 13:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lz1iNRVmJl/8c02nO6mcAo+x0LUik5FJFjS42Nicby8=;
 b=I93Jw38f4suLZLxrcS11ROvBezOGU4JjFfcwHEGortMfxkTfN8UAqSPN2szzMQAE1d
 er50D8stbzEiVr8XMg/kJF9abJbF/jEILEq+03llk6uLCKV4l6mvLKVURuLRWX5jDO1N
 6lZUTJqBPyMJnqbGgBCap5EmeHutNScznEb6M3SAf+4+1tCA2UZ+C1I0JvqBECH2O2uo
 Habw2ErqzBpxlKBIy5n7bDd40kv1SiqUqkdD5kFy2Ri+Ds5oprwISZsx66w577mnLpwx
 f7wx0iZY+ozU/lpPvIjZdZkdG8/gJ2Z613VMV3zROZv0ZkbAXj2hjH/7wovNCCu/34CS
 zeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lz1iNRVmJl/8c02nO6mcAo+x0LUik5FJFjS42Nicby8=;
 b=e5j2kjMaz2HSSiN20fWhRSgWSS7Hb/BnPvZBDi++1tF90NxhHGD2I7SqrfcKTEAD1F
 SVpWEjaRlJEK/pueTqX9ziu2qxsUhfLJLNTWEA/elSti/VCpVn5AyFEq3xj5XdLH30z2
 CQt3C7CYGteKgrDvG8yBYUO3eh1Ipk59UpjtLS5PF5dlZ5lwTbvJfWxTOQntDvKCDS3v
 EtRL9zQxFo6IHe1UrMbaKiUIShKq6sUSty7ORDljY4h6/OSYW9GaVaIZ2jngfDeySjWY
 fXd1O6hjCggMzZ+MCNE3wzbAScB5/352KiU6YQHDgnYXFr/j4HCVUkZViiGmMZZSCu8s
 AQrw==
X-Gm-Message-State: AOAM532gJ8XHS/N6L/ZTr6ICBdp6oZhyABGjVe0KlXDoclEYEYYlq1Iu
 mXf5wB+IdKb+VTSX9lKevxIU9Jq3eTyG27q7x7c=
X-Google-Smtp-Source: ABdhPJxtOwqdJeTKPSUanACIrHdPw1eVvCe+a/6kJEv5H4LVBcI1ek6HLhA0gFT9a/FkLDXR9ho5PMGWfIoQ2V5HXnU=
X-Received: by 2002:a05:6402:190c:: with SMTP id
 e12mr8137065edz.176.1626208528146; 
 Tue, 13 Jul 2021 13:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210713055227.1142-1-linux.amoon@gmail.com>
 <20210713055227.1142-2-linux.amoon@gmail.com>
 <CAFBinCD3ahpNQhP_jWZ3-4nXx8OqZOAANCpTN3BrsULRbYZHVw@mail.gmail.com>
 <CANAwSgTh02qg=cMT8tpHcEfAs5yW2vHQ7tPOkvuKXos_fOmh8A@mail.gmail.com>
In-Reply-To: <CANAwSgTh02qg=cMT8tpHcEfAs5yW2vHQ7tPOkvuKXos_fOmh8A@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 13 Jul 2021 22:35:17 +0200
Message-ID: <CAFBinCC-kD-MW+bwqCZH5AjYDhxWa_pN2WEnHuiZpx=RhUdROQ@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] ARM: dts: meson8b: odroidc1: Add usb phy power node
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
 devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_133530_203514_76B6D1E7 
X-CRM114-Status: GOOD (  29.30  )
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

On Tue, Jul 13, 2021 at 8:45 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> Thanks for reviewing the changes,
>
> On Tue, 13 Jul 2021 at 20:35, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> > On Tue, Jul 13, 2021 at 7:53 AM Anand Moon <linux.amoon@gmail.com> wrote:
> > >
> > > Add missing usb phy power node for phy mode fix below warning.
> > >
> > > [    1.253149] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
> > > [    1.253166] phy phy-c1108820.phy.0: Looking up phy-supply property
> > >                 in node /soc/cbus@c1100000/phy@8820 failed
> > I did some testing on my own Odroid-C1+ and this patch is not doing
> > anything for me.
> > more information below.
> Some device node for USB will have
The mistake I made before is considering USB VBUS as PHY power supply.
I believe the USB PHY is actually powered by the AVDD18_USB_ADC and
USB33_VDDIOH signals. See the S905 datasheet [0], page 25
These are 1.8V and 3.3V signals while you are adding a 5V regulator.

[...]
> > > +               /*
> > > +                * signal name from schematics: USB_POWER
> > > +                */
> > Just a few lines below you're saying that the name from the schematics is PWREN
> > If this patch is getting another round then please clarify the actual
> > signal name, or name both signals if the schematics is actually using
> > both names.
> >
> As per the schematics.
> PWREN ---> GPIOAO.BIT5      gpio pin control
> USB_POWER ---> P5V0          power source regulator.
ah, thanks for clarifying this
my suggestion is to put that exact paragraph into the comment to avoid confusion

[...]
> > Can you please give this a try on your Odroid-C1 as well?
> > The conclusion from my own testing is that GPIOAO_5 doesn't seem to be
> > related to USB1 (host-only) because if it was then inverting the
> > polarity (from active high to active low) should result in a change.
> >
>
> Ok I have modified as per above but not changes in gpio polarity
> from active high to active low. see below.
>
> # Odroid C1
> [alarm@archl-c1e ~]$ sudo cat /sys/kernel/debug/gpio | grep USB
>  gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
>  gpio-1954 (USB_OTG_PWREN       |regulator-usbp_pwr_e) out hi
>
> # Odroid C2
> [alarm@archl-c2lm ~]$  sudo cat /sys/kernel/debug/gpio | grep usb
>  gpio-501 (USB HUB nRESET      |usb-hub-reset       ) out hi
>  gpio-502 (USB OTG Power En    |regulator-usb-pwrs  ) out hi
that's strange, my result is different

  gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
  enable-active-high;
gives me:
  # grep USB_OTG_PWREN /sys/kernel/debug/gpio
  gpio-418 (USB_OTG_PWREN       |regulator-usb-pwr-en) out hi

  gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
gives me:
  # grep USB_OTG_PWREN /sys/kernel/debug/gpio
  gpio-418 (USB_OTG_PWREN       |regulator-usb-pwr-en) out lo ACTIVE LOW

Did you remove the "enable-active-high;" in your "active low" test?
GPIO polarity for regulators is managed with that flag, not just with
GPIO_ACTIVE_{HIGH,LOW}

[...]
> > >  &usb1_phy {
> > >         status = "okay";
> > > +       phy-supply = <&usb_pwr_en>;
> > From the schematics it seems that this is not the PHY supply (which I
> > admittedly have used incorrectly for VBUS before).
> > In the schematics that I have (odroid-c1+_rev0.4_20150615.pdf) it
> > seems to be enabling VBUS.
> > So in that case a vbus-supply property should be used inside &usb1 instead.
> >
> As per the debug log I have added this since core phy looking for this property
Let's discuss the results with different polarities first, then we can
also discuss the rest.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
