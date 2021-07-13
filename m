Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161EFC07E96
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 18:45:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C639D6127C
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 18:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C639D6127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPrjrtBXsOYKEMYlR5NhYAAAYM79CuxUj5SAIDR4gxs=; b=m5OBK3DFg+jawP
	Grorwv82d8ESJsxVsrghKlhVPc2bVE9Y9qN24Dz23gIk+yUwPDNNDTqH9gj2QeaLWnbMEKXFdopn/
	kNFGuxYyCWUveYrp9ix2wyTgOb6sLEOdikGpDoFQqPbWS8XrPjm5vrLXplC3BeRoLAiSjA2MzdNgI
	UHLujSvVZboBjw82eJHbt4B4q4LJDEelLQW3fRdTZuKm/IbGYfgqhiN8MFIJ3k8e5XybJ5TWOkosU
	EnzgJ25uVRhT0gtdeoV6nCWUQj2istT3FedvWtBmx91I5gHJfkrsjv+6gJn5tAEBttJGF6n7iNQSD
	OEbNYBsCCL+utfnGUjbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3NPE-00BArb-HN; Tue, 13 Jul 2021 18:45:20 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3NP0-00BApG-M9; Tue, 13 Jul 2021 18:45:08 +0000
Received: by mail-ed1-x52f.google.com with SMTP id s15so34481972edt.13;
 Tue, 13 Jul 2021 11:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhZvAZqqLk0cTR7vw/Ukii3edchRAWA35SbjXDGbRo0=;
 b=jSqR0TciKE1j+fOveVsQHXfCD4RwjQVVN1wnFUMg0gW6QRx8utwRgvZq1Vw/ZkuNKD
 l2Z18akSng37x4HSTFhLoH/MhDBN+k0UVi5UYVLPqNTTwFBerFXyooZbG4GdsjsJkAlT
 1KUP+ond46vDz6gPxMcpHOwfpA4ULQwV1X0cZsYBNNMNB3bw55w42wBskC+0JUlMHRCv
 MyR7iwBOmCKzzJDnvR3QTWleqLxhPL49KLTsNE+WwF4qcakte3ZdzmVScdC54rWKykHp
 HNgspzIqVXdMt5oJB0xFyV/5Gxv+YqNpIBPAxQkyvizxMQYG8GPF41Lv4Z2Iv2WMEQeQ
 /oFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhZvAZqqLk0cTR7vw/Ukii3edchRAWA35SbjXDGbRo0=;
 b=eA14iyoS6/KQ2AmKi7qMCyTM5/B+hTmtf4ICbRi9/BkJiDEmk4k1ThTo97sa59UlRQ
 0AyGR0GY4XT1dWgXM1vlPVktY4FKTcMRDNN5PTmRiO2Ko9H953AEgLFaOs3AWuAD4hqn
 n8FA/eYMnLxLbSk13trysB6LOGTTya7/joL7k14i6kqNS/yd8TsxoRjcTG11YfAJx2bm
 2TFBzzbfZ92wKNIsc2AnT4tS8IW/SnRugZger2VTV812yUQ9uNhV0olj4yVYzaaZuEHM
 JXn7Lv9FyriRyGl35H72yzDXShF/59YQugfRm9FZz/QlrObxNm8IfC3ElbSsfI3PcO9J
 Bpjw==
X-Gm-Message-State: AOAM530daXDsg1jCoQ8YvwjdSs3Z8Gvt+mVxA4uJJCSAZG9A/AXEjNzg
 ADgmpODhctVJXc3+ycak7sH81Wk2FaekGLige4Y=
X-Google-Smtp-Source: ABdhPJz3r6yDNV+B/zDzSSlPR3IcuzwWtSlGnz5S1NjPSQtpiBrftSjvtbCQd8s0RPRzKAZfuOYDpUuB7KCSyOkNN04=
X-Received: by 2002:aa7:c550:: with SMTP id s16mr7537666edr.130.1626201905236; 
 Tue, 13 Jul 2021 11:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210713055227.1142-1-linux.amoon@gmail.com>
 <20210713055227.1142-2-linux.amoon@gmail.com>
 <CAFBinCD3ahpNQhP_jWZ3-4nXx8OqZOAANCpTN3BrsULRbYZHVw@mail.gmail.com>
In-Reply-To: <CAFBinCD3ahpNQhP_jWZ3-4nXx8OqZOAANCpTN3BrsULRbYZHVw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 14 Jul 2021 00:14:53 +0530
Message-ID: <CANAwSgTh02qg=cMT8tpHcEfAs5yW2vHQ7tPOkvuKXos_fOmh8A@mail.gmail.com>
Subject: Re: [PATCHv1 1/3] ARM: dts: meson8b: odroidc1: Add usb phy power node
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
X-CRM114-CacheID: sfid-20210713_114506_772042_2F9AF13B 
X-CRM114-Status: GOOD (  28.42  )
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

Thanks for reviewing the changes,

On Tue, 13 Jul 2021 at 20:35, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Tue, Jul 13, 2021 at 7:53 AM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Add missing usb phy power node for phy mode fix below warning.
> >
> > [    1.253149] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
> > [    1.253166] phy phy-c1108820.phy.0: Looking up phy-supply property
> >                 in node /soc/cbus@c1100000/phy@8820 failed
> I did some testing on my own Odroid-C1+ and this patch is not doing
> anything for me.
> more information below.
Some device node for USB will have

>
> [...]
> > +               /*
> > +                * signal name from schematics: USB_POWER
> > +                */
> Just a few lines below you're saying that the name from the schematics is PWREN
> If this patch is getting another round then please clarify the actual
> signal name, or name both signals if the schematics is actually using
> both names.
>
As per the schematics.
PWREN ---> GPIOAO.BIT5      gpio pin control
USB_POWER ---> P5V0          power source regulator.

> [...]
> > +               gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> I booted my Odroid-C1+ with this and USB was working fine.
> Then I replaced these two lines with:
>   gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_LOW>;
> and I found that USB is still working.
>
Yep it should be GPIOAO_5 GPIO_ACTIVE_LOW, my mistake

> Can you please give this a try on your Odroid-C1 as well?
> The conclusion from my own testing is that GPIOAO_5 doesn't seem to be
> related to USB1 (host-only) because if it was then inverting the
> polarity (from active high to active low) should result in a change.
>

Ok I have modified as per above but not changes in gpio polarity
from active high to active low. see below.

# Odroid C1
[alarm@archl-c1e ~]$ sudo cat /sys/kernel/debug/gpio | grep USB
 gpio-1953 (USB_HUB_RST_N       |usb-hub-reset       ) out hi
 gpio-1954 (USB_OTG_PWREN       |regulator-usbp_pwr_e) out hi

# Odroid C2
[alarm@archl-c2lm ~]$  sudo cat /sys/kernel/debug/gpio | grep usb
 gpio-501 (USB HUB nRESET      |usb-hub-reset       ) out hi
 gpio-502 (USB OTG Power En    |regulator-usb-pwrs  ) out hi

> [...]
> >  &usb1_phy {
> >         status = "okay";
> > +       phy-supply = <&usb_pwr_en>;
> From the schematics it seems that this is not the PHY supply (which I
> admittedly have used incorrectly for VBUS before).
> In the schematics that I have (odroid-c1+_rev0.4_20150615.pdf) it
> seems to be enabling VBUS.
> So in that case a vbus-supply property should be used inside &usb1 instead.
>
As per the debug log I have added this since core phy looking for this property

[    1.250044] phy phy-c1108820.phy.0: Looking up phy-supply from device tree
[    1.250060] phy phy-c1108820.phy.0: Looking up phy-supply property
in node /soc/cbus@c1100000/phy@8820 failed
[    7.222566] libphy: stmmac: probed

vbus-supply power is needed for dwc2 node see below.

[    1.257714] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
[    1.257725] dwc2 c90c0000.usb: Looking up vbus-supply property in
node /soc/usb@c90c0000 failed

>
> Best regards,
> Martin

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
