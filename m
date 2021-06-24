Return-Path: <SRS0=xcCT=LS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3E6C49EA6
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jun 2021 14:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE96B60C3E
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jun 2021 14:55:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE96B60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDDT246dszjffWc1aue75usheUzfzKh90V4kDwRTzVs=; b=i3mDoawBtYRAbX
	EsCD1CZJmxYpMyrtQPOgkMfWdgjNoyBHpqxwhqqmA9adLbUiyBLAj+kpRkrQgeN7Nv2Sahkq6Ki88
	bjqQX85ObjN5y0ZYU8QIo2g/lLj0125WhRuoBCuWiJoqwX2FF7SlqXpKhWsQa8TtB51DvE9dMEdB0
	HEbbvbO2Ig8RULbIRwa1Zia1YVUp0f/MkQQbR4MG/nILoE4cLPGJksPC6Kzd9KXrLSwpCOTuW0Wag
	n05It64zKtz8RYYditbfrDMEzQ+c796kG/kosNorbnL3H3yCJsOgT5ekw16/phT+aU16EsCQ52u0R
	0TvPRoCabswec9vpbFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwQl4-00F7xL-CR; Thu, 24 Jun 2021 14:55:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwQkq-00F7vE-Pq; Thu, 24 Jun 2021 14:54:58 +0000
Received: by mail-ed1-x52a.google.com with SMTP id i5so8994226eds.1;
 Thu, 24 Jun 2021 07:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDkuOJgh5C+WDvt537xufC47ONbIjJXep0BnGb2gBVw=;
 b=t9RkEIBOrAGkGWMdPyS5yH5Xiwep9OjZjnF0UMNlBoJvK3vwY8+92jPQIVd/nEoHmG
 A7WzPHR7uYwqhi5t7RmUnbqvefir1G1vOQHAsz6autNr++V9sYiUoucE7oyYUNoqhkL+
 TF6We/J0y9R090jUgImLbCsgJbm2j/F/O2Qv7IRQhdLQSkX2Yle0cMRuTE4J+JNMUy/9
 ONkkRYjo9ENONlTY8uRzKNMmE6n4e7+NHv58vJEKfI1ypZPxYP4wiE/pP9sWOxpgb7y7
 swqmpH4OI3qQGEPiK+RASk2EBo4IEs1YD5trfV2oF+3byXgswnzxpDJkh8x03zKet5Q8
 dOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDkuOJgh5C+WDvt537xufC47ONbIjJXep0BnGb2gBVw=;
 b=DFBelE7/XN4qp/MOCwZkuXpS3v0mQtFA5U4uuVqq69QTnirZKV8BbP9TskAG1ZyBQJ
 PopQSGmxpC3AMwV92Y2Zfb0v8gtXaxHG7zAqgbfsV1Z17fJI/w2JmdfVnfUHlMLoGnw3
 kyQSdvy7jKYfZ6h1kzEDvbgf1elk8kP6kH7hXuu91CCyauOBxbhdydXPnfaqBf3c822/
 xIZd1U3S5txLZKGxYny7PPrJL560LYbeNI554K8gSKGtLeWrK4wGgWPm/PowMLb0XRu4
 HPZdx0NWbyYJKbke5yRJFqzaHVqMhKslZixJncEOefSIm2zTdq8ac318O+DWgCQtGnFf
 TVDg==
X-Gm-Message-State: AOAM530sCyDPhyKxz8+s8XCJQxbrxKKwSG5c4CIXxY4hkjttnPF9c7L3
 bJ7z/6bMMiBjUycmVaxxA/qpeMg4HeiTQbWStR4=
X-Google-Smtp-Source: ABdhPJz7flfGG4Jo9YL8PvaGhSQvFXCvoM7XYKaKr0PGFS8TRqS5Q+S2stv2YD2ZGvEAzlYAii4X7wQ36jtMzKbV69Q=
X-Received: by 2002:a50:fc90:: with SMTP id f16mr7829930edq.254.1624546493652; 
 Thu, 24 Jun 2021 07:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-7-linux.amoon@gmail.com>
 <CAFBinCCE+6G7QtDoxfbcZVVRf-MDX-epSo=_k_PJZgWX+_Whvg@mail.gmail.com>
 <CANAwSgRqixugUr-t2OheLBVwD=EOkaLqxnGkT-Bx=p_A4Nyr8Q@mail.gmail.com>
 <CAFBinCALsnpbJGEb4LBLd_jy3E8fOZAQaacz-P7ijfkeyYg2dA@mail.gmail.com>
 <CANAwSgRABOyWYJPrrw64Wa6j2D94T4tybn7MHGCTbBowt7UncA@mail.gmail.com>
 <CAFBinCD91eYNXSqnmDKoAvJHWqqRbXVjnaq9RuRNCnip9kKqkw@mail.gmail.com>
In-Reply-To: <CAFBinCD91eYNXSqnmDKoAvJHWqqRbXVjnaq9RuRNCnip9kKqkw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 24 Jun 2021 20:24:42 +0530
Message-ID: <CANAwSgRzY+699aSS9MVGAJYVR6_0Ni75JPhO9=LKunHQK0p=oA@mail.gmail.com>
Subject: Re: [RFCv1 6/8] phy: amlogic: meson8b-usb2: Use phy reset callback
 function
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_075456_909113_5CF02552 
X-CRM114-Status: GOOD (  32.61  )
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

On Wed, 23 Jun 2021 at 01:42, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Mon, Jun 21, 2021 at 9:16 AM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > Ok Thanks for the inputs. got your point.
> >
> > I was also looking into Amlogic source code for reset. (aml_cbus_update_bits)
> > [0] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/drivers/amlogic/usb/phy/phy-aml-new-usb.c
> > is there some feature to iomap the USB with cbus?
> for that specific code: that's what we do inside drivers/reset/reset-meson.c
> Amlogic's vendor kernel uses an increment of 4 bytes per value, so
> 0x1102 translates to 0x4408
>
> then in mainline's meson8b.dtsi we have:
>     compatible = "amlogic,meson8b-reset";
>     reg = <0x4404 0x9c>;
> as you can see 0x4408 is part of the reset controller node.
>
> next in include/dt-bindings/reset/amlogic,meson8b-reset.h we have:
>     #define RESET_USB_OTG                 34
>
> the register used for reset line 34 is translated using:
>     0x4404 (first register) + 4 (4 * reset line / 32 = 1) = 0x4408
> then the bit inside this register is translated using:
>     reset line % 32 = 2
>
> that's how we express aml_cbus_update_bits(0x1102, 0x1<<2, 0x1<<2); in
> the mainline kernel (by going through the reset subsystem)
>

Thank you very much for clearing my long-standing doubt on *reset
logic* on Amlogic SoC.

> [...]
> > > > > > -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> > > > > > +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
> > > > > I think this breaks compatibility with existing .dtbs and our
> > > > > dt-bindings (as we're not documenting a "reset-names" property).
> > > > > What is the goal of this one?
> > > > >
> > > >
> > > > OK, If we pass NULL over here there is the possibility
> > > > USB phy will not get registered.
> > > I don't understand why - with NULL everything is working fine for me.
> > > Also no matter which name you give to the reset line (in reset-names),
> > > it will be the same reset line in all cases. If it's the same reset
> > > line before and after: why is this needed?
> > >
> > I need to investigate this reset feature. With my setup with current changes
> > after I update the below.
> > -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
> > +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> >         if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
> >                 return PTR_ERR(priv->reset);
> >
> > Reset will break the USB initialization, see below output.
> interesting, I have not seen that USB problem before and neither is
> Kernel CI seeing it: [0]
> Is it only happening with this patch or did you also see it before?
>
Yes, it could happen with this patch but It could be also linked to
reorder the phy configuration.
See below logs, when core reset fails on USB PHY no USB is getting registered.

[    1.267620] dwc2 c9040000.usb: mapped PA c9040000 to VA (ptrval)
[    1.267768] dwc2 c9040000.usb: Looking up vusb_d-supply from device tree
[    1.267783] dwc2 c9040000.usb: Looking up vusb_d-supply property in
node /soc/usb@c9040000 failed
[    1.267814] dwc2 c9040000.usb: supply vusb_d not found, using dummy regulator
[    1.267940] dwc2 c9040000.usb: Looking up vusb_a-supply from device tree
[    1.267954] dwc2 c9040000.usb: Looking up vusb_a-supply property in
node /soc/usb@c9040000 failed
[    1.267975] dwc2 c9040000.usb: supply vusb_a not found, using dummy regulator
[    1.268037] dwc2 c9040000.usb: registering common handler for irq35
[    1.268090] dwc2 c9040000.usb: Looking up vbus-supply from device tree
[    1.268102] dwc2 c9040000.usb: Looking up vbus-supply property in
node /soc/usb@c9040000 failed
[    1.269267] dwc2 c9040000.usb: Core Release: 3.10a (snpsid=4f54310a)
[    1.273185] dwc2 c9040000.usb: dwc2_core_reset: HANG! Soft Reset
timeout GRSTCTL_CSFTRST
[    1.273510] dwc2: probe of c9040000.usb failed with error -16
[    1.275474] dwc2 c90c0000.usb: mapped PA c90c0000 to VA (ptrval)
[    1.275603] dwc2 c90c0000.usb: Looking up vusb_d-supply from device tree
[    1.275617] dwc2 c90c0000.usb: Looking up vusb_d-supply property in
node /soc/usb@c90c0000 failed
[    1.275646] dwc2 c90c0000.usb: supply vusb_d not found, using dummy regulator
[    1.275784] dwc2 c90c0000.usb: Looking up vusb_a-supply from device tree
[    1.275798] dwc2 c90c0000.usb: Looking up vusb_a-supply property in
node /soc/usb@c90c0000 failed
[    1.275819] dwc2 c90c0000.usb: supply vusb_a not found, using dummy regulator
[    1.275877] dwc2 c90c0000.usb: registering common handler for irq36
[    1.275930] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
[    1.275942] dwc2 c90c0000.usb: Looking up vbus-supply property in
node /soc/usb@c90c0000 failed
[    1.277125] dwc2 c90c0000.usb: Core Release: 3.10a (snpsid=4f54310a)
[    1.281042] dwc2 c90c0000.usb: dwc2_core_reset: HANG! Soft Reset
timeout GRSTCTL_CSFTRST
[    1.281353] dwc2: probe of c90c0000.usb failed with error -16

>
> Best regards,
> Martin
>
>
> [0] https://storage.staging.kernelci.org/next/master/next-20210617/arm/multi_v7_defconfig+ltp-ima/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
