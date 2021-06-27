Return-Path: <SRS0=mKTp=LV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F34CC48BC2
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 20:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F420D619A0
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Jun 2021 20:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F420D619A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pevseqj3LHpmQ8Xbg2OgEM6AuxUtE9lUNm4e1MxKWME=; b=E+4+FDcaVoUQ8V
	Pmv8XnYAu4ecfwT87i/kHxIs4+3s1k842GZ8dP4qdfdqAc4tZKL73dDu/UNqaAvMEyUowXGuOH4UK
	oZNsz9cq+gkzDENdyIUUDIO5WrtbvtiFOVfd11dt3o20ZTlKxnhZveu91zAYH5QwhM5DB9MgFuMYi
	MncRUGfCXHqZ8oGqdX62WuVKvit0KGfo4Z5bxkzopwm3Q5dCcVpqlqOxM7A85VpDdSAWPqdgVHCUz
	I8AEp4KHmnQTz3AeoM7gzl91wC1UDFKOB6MvSQdcN3wUgVsUJ4dxnlNgtp7yxhu/aI54F77QGvabx
	AJEsqaHAfoRYUP3/Rvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxb48-0065M2-DQ; Sun, 27 Jun 2021 20:07:40 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxb3p-0065IX-UN; Sun, 27 Jun 2021 20:07:23 +0000
Received: by mail-ej1-x62b.google.com with SMTP id hc16so25445460ejc.12;
 Sun, 27 Jun 2021 13:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4GZy7C/9sgJCYlkJRGJmqppC27IF56G6yPi0fir+u+U=;
 b=de4EKYnhin6OAMnO4NukNewMbCn4Zn1bjZgwVULo2pw+OtuWKDioNaQhBcWfz8B6cl
 oycpWnt9HXe1QFrQq64XdbXJzCoUK3FQeGs9srdADy379zwTm+DqZRwoGpcnAfewgdL5
 gTdfcnqTAkI3Zg82deaEmUuV0dbKEcf7mydBk02Cj4C/044Q1OhbaZMFJ4vclbT4LBNA
 y8iQn2mFj2Jvf26lrUhkSL/zS6WLpwvtCkfCvqI/0pwVU5b5lvPTSyFcIWqbChg0l8wp
 mqokW+gvWBt7e3CjvhgjWR6UrLn4bwXZ5E99FuwMZTWVjoVcBRNrNqQLAii68EyCyh8Z
 6qEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4GZy7C/9sgJCYlkJRGJmqppC27IF56G6yPi0fir+u+U=;
 b=qPTwMR/u/cGK/ujdoYP2dRl5yLkWU+5DWLN78VxtUYwcmvrdiHK2mbvxoslPUoRHO5
 sc817HWHH1z1hPBYw4KEOESK2RQzUA5t4avIWGG6ttrNStlTE7TQns6ihpuaGyI3kTg1
 rFsF9Bo/RoIkqQhH5CRnaeZK4QhNhcI3+vZYZDPuVWwflWaIYFG00Q5PwaJiP8AqwpLa
 AaNuy9qrfHx3/bRsTBGLAYFbzH2/BsCOwWNEuzfAIy/JETP8ZjpSGBEvYjXdkKSWKzCu
 Nj4qoqwfpJRDjDljbwmYiV+JfxZHAyMvW/M342r9OgwCbac6ghhAix3x843Icp5jNPpE
 Sfaw==
X-Gm-Message-State: AOAM5300YHI9isjJJS294r5BDquaJ6rIgwb8PIN3ruhpDtAFyB8VhMrg
 CzpnVKY9EKw1AduxHThVpP7LOcs98IC5S9MMMPU=
X-Google-Smtp-Source: ABdhPJz3tOQ8PoogIkkWY4d9SpFZHJZzPxU5NFlcG/A9Se/KywrauH1fHDuTX8VG/enLAVqFiT0qZLkI6kfBd0EyAuo=
X-Received: by 2002:a17:907:1dd9:: with SMTP id
 og25mr20771185ejc.108.1624824440004; 
 Sun, 27 Jun 2021 13:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-7-linux.amoon@gmail.com>
 <CAFBinCCE+6G7QtDoxfbcZVVRf-MDX-epSo=_k_PJZgWX+_Whvg@mail.gmail.com>
 <CANAwSgRqixugUr-t2OheLBVwD=EOkaLqxnGkT-Bx=p_A4Nyr8Q@mail.gmail.com>
 <CAFBinCALsnpbJGEb4LBLd_jy3E8fOZAQaacz-P7ijfkeyYg2dA@mail.gmail.com>
 <CANAwSgRABOyWYJPrrw64Wa6j2D94T4tybn7MHGCTbBowt7UncA@mail.gmail.com>
 <CAFBinCD91eYNXSqnmDKoAvJHWqqRbXVjnaq9RuRNCnip9kKqkw@mail.gmail.com>
 <CANAwSgRzY+699aSS9MVGAJYVR6_0Ni75JPhO9=LKunHQK0p=oA@mail.gmail.com>
In-Reply-To: <CANAwSgRzY+699aSS9MVGAJYVR6_0Ni75JPhO9=LKunHQK0p=oA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 28 Jun 2021 01:37:08 +0530
Message-ID: <CANAwSgQktfn9Q=PJhx5Uq0UQ2dHqJwjKu1RWyb2k=-dA9=+BSQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210627_130722_059262_B65882C7 
X-CRM114-Status: GOOD (  39.07  )
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

On Thu, 24 Jun 2021 at 20:24, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> On Wed, 23 Jun 2021 at 01:42, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> > On Mon, Jun 21, 2021 at 9:16 AM Anand Moon <linux.amoon@gmail.com> wrote:
> > [...]
> > > Ok Thanks for the inputs. got your point.
> > >
> > > I was also looking into Amlogic source code for reset. (aml_cbus_update_bits)
> > > [0] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/drivers/amlogic/usb/phy/phy-aml-new-usb.c
> > > is there some feature to iomap the USB with cbus?
> > for that specific code: that's what we do inside drivers/reset/reset-meson.c
> > Amlogic's vendor kernel uses an increment of 4 bytes per value, so
> > 0x1102 translates to 0x4408
> >
> > then in mainline's meson8b.dtsi we have:
> >     compatible = "amlogic,meson8b-reset";
> >     reg = <0x4404 0x9c>;
> > as you can see 0x4408 is part of the reset controller node.
> >
> > next in include/dt-bindings/reset/amlogic,meson8b-reset.h we have:
> >     #define RESET_USB_OTG                 34
> >
> > the register used for reset line 34 is translated using:
> >     0x4404 (first register) + 4 (4 * reset line / 32 = 1) = 0x4408
> > then the bit inside this register is translated using:
> >     reset line % 32 = 2
> >
> > that's how we express aml_cbus_update_bits(0x1102, 0x1<<2, 0x1<<2); in
> > the mainline kernel (by going through the reset subsystem)
> >
>
> Thank you very much for clearing my long-standing doubt on *reset
> logic* on Amlogic SoC.
>
> > [...]
> > > > > > > -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> > > > > > > +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
> > > > > > I think this breaks compatibility with existing .dtbs and our
> > > > > > dt-bindings (as we're not documenting a "reset-names" property).
> > > > > > What is the goal of this one?
> > > > > >
> > > > >
> > > > > OK, If we pass NULL over here there is the possibility
> > > > > USB phy will not get registered.
> > > > I don't understand why - with NULL everything is working fine for me.
> > > > Also no matter which name you give to the reset line (in reset-names),
> > > > it will be the same reset line in all cases. If it's the same reset
> > > > line before and after: why is this needed?
> > > >
> > > I need to investigate this reset feature. With my setup with current changes
> > > after I update the below.
> > > -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
> > > +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> > >         if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
> > >                 return PTR_ERR(priv->reset);
> > >
> > > Reset will break the USB initialization, see below output.
> > interesting, I have not seen that USB problem before and neither is
> > Kernel CI seeing it: [0]
> > Is it only happening with this patch or did you also see it before?
> >
> Yes, it could happen with this patch but It could be also linked to
> reorder the phy configuration.
> See below logs, when core reset fails on USB PHY no USB is getting registered.
>
> [    1.267620] dwc2 c9040000.usb: mapped PA c9040000 to VA (ptrval)
> [    1.267768] dwc2 c9040000.usb: Looking up vusb_d-supply from device tree
> [    1.267783] dwc2 c9040000.usb: Looking up vusb_d-supply property in
> node /soc/usb@c9040000 failed
> [    1.267814] dwc2 c9040000.usb: supply vusb_d not found, using dummy regulator
> [    1.267940] dwc2 c9040000.usb: Looking up vusb_a-supply from device tree
> [    1.267954] dwc2 c9040000.usb: Looking up vusb_a-supply property in
> node /soc/usb@c9040000 failed
> [    1.267975] dwc2 c9040000.usb: supply vusb_a not found, using dummy regulator
> [    1.268037] dwc2 c9040000.usb: registering common handler for irq35
> [    1.268090] dwc2 c9040000.usb: Looking up vbus-supply from device tree
> [    1.268102] dwc2 c9040000.usb: Looking up vbus-supply property in
> node /soc/usb@c9040000 failed
> [    1.269267] dwc2 c9040000.usb: Core Release: 3.10a (snpsid=4f54310a)
> [    1.273185] dwc2 c9040000.usb: dwc2_core_reset: HANG! Soft Reset
> timeout GRSTCTL_CSFTRST
> [    1.273510] dwc2: probe of c9040000.usb failed with error -16
> [    1.275474] dwc2 c90c0000.usb: mapped PA c90c0000 to VA (ptrval)
> [    1.275603] dwc2 c90c0000.usb: Looking up vusb_d-supply from device tree
> [    1.275617] dwc2 c90c0000.usb: Looking up vusb_d-supply property in
> node /soc/usb@c90c0000 failed
> [    1.275646] dwc2 c90c0000.usb: supply vusb_d not found, using dummy regulator
> [    1.275784] dwc2 c90c0000.usb: Looking up vusb_a-supply from device tree
> [    1.275798] dwc2 c90c0000.usb: Looking up vusb_a-supply property in
> node /soc/usb@c90c0000 failed
> [    1.275819] dwc2 c90c0000.usb: supply vusb_a not found, using dummy regulator
> [    1.275877] dwc2 c90c0000.usb: registering common handler for irq36
> [    1.275930] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
> [    1.275942] dwc2 c90c0000.usb: Looking up vbus-supply property in
> node /soc/usb@c90c0000 failed
> [    1.277125] dwc2 c90c0000.usb: Core Release: 3.10a (snpsid=4f54310a)
> [    1.281042] dwc2 c90c0000.usb: dwc2_core_reset: HANG! Soft Reset
> timeout GRSTCTL_CSFTRST
 > [    1.281353] dwc2: probe of c90c0000.usb failed with error -16
 >

Sorry for the delay.
We could switch the reset logic to
*devm_reset_control_get_optional_exclusive* as below
to fix the reset line, since both the dwc2 c90c0000.usb and c9040000.usb
will have their own context to reset control register, it means the
reset line is not share
between two USB PHY nodes.

-       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
+       priv->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
+                                                               "reset");

> >
> > Best regards,
> > Martin
> >
> >
> > [0] https://storage.staging.kernelci.org/next/master/next-20210617/arm/multi_v7_defconfig+ltp-ima/gcc-8/lab-baylibre/baseline-meson8b-odroidc1.html

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
