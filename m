Return-Path: <SRS0=dufR=MK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C27C636CA
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jul 2021 19:10:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5BD96101E
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jul 2021 19:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5BD96101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7l0pdJhpwGTN7AxGNnFICllK0xB3tvjb7QdgG7fuouQ=; b=usLIQ6ETjoCBcO
	En7GAgYXiXtcpmRdLYgD7/C2Q7lP/t1+2+xdY37LLbFJdZ247H0/KMCOarM5DATKojt3WJP6Gcx2q
	To7ELO8KajJig39QaRm/ftqiuLDKl68aAHL6T9NSKPQoZBIxQLz3eFltRLi/zsnxfHikl2lIF4aWP
	D/iCZ6k/rlZwLhLvtlq9vmVdcjdsKGXWfKOm2Gv89o9+CAvEOZg8QBXnQsHpykJhsY5BlFIANUQ2l
	/oLPsquVBnMkKI19/3zvUcWLNz1q8YbqLZtdbnMiJiqer9xp1gL/ap+9ScU+R/2C8wtmOIujI/qW/
	NLQuIt/3kOu+CGuArniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5CAt-007x4r-Mc; Sun, 18 Jul 2021 19:10:03 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5CAf-007x3G-Gy; Sun, 18 Jul 2021 19:09:51 +0000
Received: by mail-ej1-x632.google.com with SMTP id bu12so24620646ejb.0;
 Sun, 18 Jul 2021 12:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U82uzeomBrhPOCBHAYxh8jyMr6tQJdWYTR0Qx4qRmNU=;
 b=Z4P9CQ6iqomziZz/jcl8opJbfqVVp4QoErkY0tPbuDTM/fA3u6SKEBQaW6pTbeTQ/p
 mUhDtIRbfCKXUmilIilYI1qx3lbxnXDC/wBXuEa0wzYcsnzfQefrrYic1xCrOBhJ4zb3
 A5SVH+no/knap8mKmC2rTwuCeKDXYbpdoA5xJMvV5cKQ8N1JUMEHJdAPxKPe6SjUjp97
 5fDrnjRh1WH5m6lxoBc9vG4jwOgwbNoUt0ilDbqd/jl+8nT+5/2yRUKBYedoPukwBNID
 naId4kB0HDF4anvmkhYO4W8MKD2p22K8bhipJ5MOxk/zepqdwTj0udQ3yo4U3cKN1DHz
 I0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U82uzeomBrhPOCBHAYxh8jyMr6tQJdWYTR0Qx4qRmNU=;
 b=bXeTjH+iPIIDc3Pda6qogHtwjIQi6zZx+y4WQ3yf8XpxVlzGyOy71mqfjVuBFXl3k/
 CY9rzrAbQb66C1GQiNd2P/vhpDHYXAabPt9uHL7vtebY4Iph6NLfHwX/LQXbwGUnqJnc
 PSrMpFG60ZyvYcG8dPHZ869Okd/nj7HFqFcDrjTMFv5ofaA7PGFv921hJb88wXQHIc9K
 KNW5LkdCxCA/d2qVbFuKsv1FGOq8+d6ikhPD2D1iKakt/K2Z2z0O4klZ36vTSuxBkZDI
 zgXZ5O7hGX8o31tQgbTwgxOO/3/vya/nvj+SNXGfyTvswge1wZOp3pB6eOtLkVNcgc1e
 0H4Q==
X-Gm-Message-State: AOAM533bl9lLp34JkA+4DnEsufMCQhnew9UzhokFA4i5ho+Q1I3heWdC
 iKbWCciP3ckrxe3/0x6dUSMioOXXax0HWdyghDA=
X-Google-Smtp-Source: ABdhPJxCpf5X8w6uhmCTyQt3HmLgZRZ90bPCajWh6ucfIM0czJC6hy4B0HLA2V8pZTDlfoFe/M+4rg775D2dxfW+4E0=
X-Received: by 2002:a17:907:9719:: with SMTP id
 jg25mr16476100ejc.362.1626635387829; 
 Sun, 18 Jul 2021 12:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210716103651.1455-1-linux.amoon@gmail.com>
 <20210716103651.1455-2-linux.amoon@gmail.com>
 <CAFBinCDeqauw_V-Vn9cat9HaCXj6HEMz6G+G+VbqCNtGEFGYzg@mail.gmail.com>
 <CANAwSgQ5PDGUWMH-jxnz5wwutUVniTn7RAe=4J=8-jbmqxYRRg@mail.gmail.com>
 <CAFBinCBhg+dije+3DvV_V_kqHv9q+r4EPxXCYFti6KuA4mK7KQ@mail.gmail.com>
 <CANAwSgT9-5zGr67aGzBmW6WDBfeiAvjv_zv2UbRC+YbgAGg==A@mail.gmail.com>
 <CAFBinCCGA0b=LVjbQood+iN+DHLodY0RJ-GrSOcgdzrDFJ25pQ@mail.gmail.com>
In-Reply-To: <CAFBinCCGA0b=LVjbQood+iN+DHLodY0RJ-GrSOcgdzrDFJ25pQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 18 Jul 2021 21:09:36 +0200
Message-ID: <CAFBinCAohjxcsY3D1rdAiYVGL+==cnjzZxg1GmYxSNVhxSTDoA@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] ARM: dts: meson8b: odroidc1: Add usb phy power node
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
X-CRM114-CacheID: sfid-20210718_120949_611929_E0F39ADE 
X-CRM114-Status: GOOD (  27.97  )
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

On Sun, Jul 18, 2021 at 4:01 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[...]
> > From the schematics [1]
> > https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20160226.pdf
> >
> > You could find references to PWREN  <--- GPIOAO.BIT5
> > The second reference is USB HOST Power Switch
> > The third reference is USB HOST POWER.
> >
> > Hope I am clean in my thought process now.
> Can you please point out the page numbers for me?
>
> What I am seeing on page 1 is:
> GPIOAO_5 (called GPIOAO.BIT5) is connected as an INPUT to the USB_OTG
> PWREN signal (that's the green box with the label "USB_OTG.SchDoc"
> above it).
I unfortunately missed your question on IRC on this topic:
<armoon> xdarklight: just want to understand the confusion on PWREN,
either is INPUT / OTPUT to usb hub am I correct
My understanding of the INPUT/OUTPUT direction in the Odroid-C1
schematics (which you linked) above is that the arrow direction shows
whether it's an input or output.
For example (all on page one):
- HDMI_HPD is an input to the Meson8b SoC, arrow direction is: HDMI => S805
- IR_IN is an input to the Meson8b SoC, arrow direction is: S805 <=
GPIOAO.BIT7 IR_IN
- PWM is an output, arrow direction is: S805 => PWM.C VCCK_PWM
- 3.3V/1.8V switch for the SD card is an output, arrow direction is:
S805 => GPIOAO.BIT3 TF_3V3N_1V8_EN

That tells me: the arrow direction shows which connections are inputs
or outputs.
Some pins can be input and output at the same time (HDMI_CEC). But
let's keep it simple for now any only look at inputs/output.

Based on this information I am looking at the arrow direction for
USB_OTG: GPIOAO.BIT5 PWREN <= S805
So this confirms that GPIOAO_5 is an output to the SoC.
Please note though that this part is not linked with any USB host
connector, it's only linked to the USB OTG path.

For the next part the S805 SoC is not involved:
USB1 USB_HOST_PWR_SW PWREN <= PWREN USB_HUB_GL852G
USB2 USB_HOST_PWR_SW PWREN <= PWREN USB_HUB_GL852G
This tells me that the PWREN signal for the two USB_HOST_PWR_SW (USB
host power switches / current limiters) is driven by the GL852G USB
hub.

The GL852G USB hub datasheet [0] mentions on page 14:
pin name: PWREN1#~4
I/O type: O (which stands for: OUTPUT)
description: Active low. Power enable output for DSPORT1~4 PWREN1# is
the only power-enable output for GANG mode.
This seems to confirm my understanding of the Odroid-C1 schematics,
where the PWREN signal of the current limiters is coming from the USB
hub (so the Meson8b SoC is not involved directly).

<armoon> sorry I am not the expert in schematics interpretation, but
what I understand is PWREN (GPIOAO.BIT5) is input signal to
MP62551DGT-LF-Z which controls the VBUS signal power to USB HUB to pin
V5 on GL852G IC
That part is unfortunately hard to say because the author of the
Odroid-C1 schematics decided to two different signals called PWREN.
Now it's not clear if this refers to the USB_OTG PWREN or USB_HOST
PWREN signal.
Based on page 1 I *assume* that it's linked to the USB_HOST PWREN signal.

<armoon> plz check the GL852G power section.        it has 5V Power
input. It need be NC if using external regulator
<armoon> 5V and V33 are the regulator for GL852G IC HUB,
Looking at page 27 of the Odroid-C1 schematics I can see that PSELF,
PGANG, V33, AVDD1, AVDD2, AVDD3 and DVDD are supplied by a 3.3V power
supply called HUB_AVDD.
V5 is a 5V signal which is not connected (there's a red cross next to it).

<armoon> I feel setting GPIOAO.BIT5 setting to Active Low just enable
the 5V via external regulator MP62551DGT-LF-Z
My understanding is that GPIOAO.BIT5 enables or disables VBUS for the
USB_OTG port (&usb1 in our .dts)
See page 28 of the schematics, the RT9715EGB power switch uses a PWREN
signal for it's ENABLE pin based on page 1 of the schematics.
MP62551DGT-LF-Z would then be getting it's PWREN signal from the GL852G hub.

Having different power switches for USB HOST and USB OTG makes sense
because for USB OTG the VBUS signal needs to be disabled when in
peripheral/device mode (for example when connecting the Odroid-C1 via
micro-USB cable to a computer).

<armoon> I don't know much on internal IC signal apart from this, may
be I need to check with the board designer Odroid / Hardkernel for
more details
That would be great actually. Unfortunately Brian Kim's email address
(which you had Cc'ed in the beginning of this conversation) is not
valid anymore.
If you have any other contact at Hardkernel then it would be great if
you could add them to the loop so they can clear our questions.


Best regards,
Martin


[0] https://datasheet.lcsc.com/szlcsc/Genesys-Logic-GL852G-HHG12_C136618.pdf

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
