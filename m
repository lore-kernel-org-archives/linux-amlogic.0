Return-Path: <SRS0=RlPG=M3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8468DC432BE
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 21:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D55861078
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Aug 2021 21:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D55861078
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fsZZJkACcGzjxfUck4yQZlYLDfNdFyDmQKxrJseSvg=; b=IsbGrZFwN99Jax
	n9I1yF3qJ+WhT02+8d+BJA84KfUnWhsjwXJMIo2g6kVmegPsFkcEm/tjbapCQrXi/ANCFRfgHaVlN
	Q8AizTGXUuzuSv9Hjjok2RE2EGX11jHAAhxTNrEa6FNb4GM44tKlPshl4ITono4V6Rp9Y5PfC3jBf
	xmFfQz1BAQsIT6EOG23HvNqt4nC3M//VFrcI2gNUSqlR635XmvjSVa0RaZ0luKdLHGIzjDLwipl7e
	9PJCDt3gACek0Bats/c1TBjZU73A2Sy5vP+VNwuPx3l4YAlTvHWT/fpohZZ+85XRTKGh4b/mIbe84
	eC0beEQxEmu/joV4cjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBOuZ-007Wn3-09; Wed, 04 Aug 2021 21:58:51 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBOuL-007Wjr-R4; Wed, 04 Aug 2021 21:58:39 +0000
Received: by mail-ej1-x62f.google.com with SMTP id oz16so5934772ejc.7;
 Wed, 04 Aug 2021 14:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UDFP+Kh/RXp5326ifRvFQhSNe6psMCNDhU/dD1rM8SA=;
 b=aJO8jUZNJLtuyY3pbXnWfLurE2o2BUbvMDRodBpaALLIZ2vk5/obf8tI5CyYpMWTl4
 S5XUXdJF3PHtTAjg1DnFFgd/mL0mQPgOyIfSKCMBkE3duy8WCvdniyRU3ptJt6GCKL4I
 AmFaCUzJ4/DmqYkLrHG+EIqPrkKkmjWYETYbTwpidM68uG/HOw2hgTJMXL1IsS1iPgXJ
 gu6v4/zddwPtMK9qctadVp9lM8/aFvqZF/tklCEWR1KjObJTv+twR7GK4pTmy5nR2Uac
 aoh16hY5LSJeQccnLabchOIf2UooX6zYGnswmEMOHR9ZBaIFCgYCc1l/WXNjd/jPragF
 3zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDFP+Kh/RXp5326ifRvFQhSNe6psMCNDhU/dD1rM8SA=;
 b=d0bQi3/KKrUk3ev2uBUjT/Uc13czRdgcMyvgExfb4tm0lqK0WFLZ3vhYHTblKIrvEg
 IXWpcxRwMh03xUR6pCxqjBstkanr50zN+FZfA5rP9DoSs6ITcTxpmCThQZ3QO43afE7e
 FdDvTXCeyLZGga5EoZfIN5j+Ky6WOwTShUxWX+rA7CjOkPnwPiQ6LTBSUhGcFeDR+ofL
 b9fUhxYZq65WL4/oWW0TJieR1HkchGBWvx+46IR9iqGGyGbj/tejA+2nIQSPS9RGowom
 Kqm4pylkPx9eQQn1hUp6TPiiJQjEneilnFruHUaf84nOEDxpvg4ruGfTmkf2GLIiHyG5
 JsPA==
X-Gm-Message-State: AOAM531ebXeLdQYBYS4Z7MCMLFL9vyjgznXZbXi9lw07Jufokc/D5o8s
 CdVY3aVqAtQGJQDAAgAYiyJeFMVDs609j6WTSlg=
X-Google-Smtp-Source: ABdhPJy+1zg5ha6tdssaaLOTO5ub8yD6ePygjh/AQXLvSk2ersQk/TktWkm2YuWkuPfs+j45CXhQuk4L7keHv/Dy1cE=
X-Received: by 2002:a17:906:b0c5:: with SMTP id
 bk5mr1228728ejb.428.1628114314016; 
 Wed, 04 Aug 2021 14:58:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210716103651.1455-1-linux.amoon@gmail.com>
 <20210716103651.1455-2-linux.amoon@gmail.com>
 <CAFBinCDeqauw_V-Vn9cat9HaCXj6HEMz6G+G+VbqCNtGEFGYzg@mail.gmail.com>
 <CANAwSgQ5PDGUWMH-jxnz5wwutUVniTn7RAe=4J=8-jbmqxYRRg@mail.gmail.com>
 <CAFBinCBhg+dije+3DvV_V_kqHv9q+r4EPxXCYFti6KuA4mK7KQ@mail.gmail.com>
 <CANAwSgT9-5zGr67aGzBmW6WDBfeiAvjv_zv2UbRC+YbgAGg==A@mail.gmail.com>
 <CAFBinCCGA0b=LVjbQood+iN+DHLodY0RJ-GrSOcgdzrDFJ25pQ@mail.gmail.com>
 <CAFBinCAohjxcsY3D1rdAiYVGL+==cnjzZxg1GmYxSNVhxSTDoA@mail.gmail.com>
In-Reply-To: <CAFBinCAohjxcsY3D1rdAiYVGL+==cnjzZxg1GmYxSNVhxSTDoA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 4 Aug 2021 23:58:23 +0200
Message-ID: <CAFBinCAP_DDvPLn4h1yQKEdU_x1ovokHUTPeq3vNV_sDF8PcWg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210804_145837_934304_B89D8400 
X-CRM114-Status: GOOD (  27.85  )
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

On Sun, Jul 18, 2021 at 9:09 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Sun, Jul 18, 2021 at 4:01 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> [...]
> > > From the schematics [1]
> > > https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20160226.pdf
> > >
> > > You could find references to PWREN  <--- GPIOAO.BIT5
> > > The second reference is USB HOST Power Switch
> > > The third reference is USB HOST POWER.
> > >
> > > Hope I am clean in my thought process now.
> > Can you please point out the page numbers for me?
> >
> > What I am seeing on page 1 is:
> > GPIOAO_5 (called GPIOAO.BIT5) is connected as an INPUT to the USB_OTG
> > PWREN signal (that's the green box with the label "USB_OTG.SchDoc"
> > above it).
> I unfortunately missed your question on IRC on this topic:
> <armoon> xdarklight: just want to understand the confusion on PWREN,
> either is INPUT / OTPUT to usb hub am I correct
> My understanding of the INPUT/OUTPUT direction in the Odroid-C1
> schematics (which you linked) above is that the arrow direction shows
> whether it's an input or output.
> For example (all on page one):
> - HDMI_HPD is an input to the Meson8b SoC, arrow direction is: HDMI => S805
> - IR_IN is an input to the Meson8b SoC, arrow direction is: S805 <=
> GPIOAO.BIT7 IR_IN
> - PWM is an output, arrow direction is: S805 => PWM.C VCCK_PWM
> - 3.3V/1.8V switch for the SD card is an output, arrow direction is:
> S805 => GPIOAO.BIT3 TF_3V3N_1V8_EN
>
> That tells me: the arrow direction shows which connections are inputs
> or outputs.
> Some pins can be input and output at the same time (HDMI_CEC). But
> let's keep it simple for now any only look at inputs/output.
>
> Based on this information I am looking at the arrow direction for
> USB_OTG: GPIOAO.BIT5 PWREN <= S805
> So this confirms that GPIOAO_5 is an output to the SoC.
> Please note though that this part is not linked with any USB host
> connector, it's only linked to the USB OTG path.
>
> For the next part the S805 SoC is not involved:
> USB1 USB_HOST_PWR_SW PWREN <= PWREN USB_HUB_GL852G
> USB2 USB_HOST_PWR_SW PWREN <= PWREN USB_HUB_GL852G
> This tells me that the PWREN signal for the two USB_HOST_PWR_SW (USB
> host power switches / current limiters) is driven by the GL852G USB
> hub.
Hardkernel team responded on the Odroid forums to the request from Anand:
"Power-Enable signal to the USB load switch ICs is connected to the
USB hub controller.
It is not connected the CPU GPIO."

The regulator from Anand's patch is therefore connected to the micro USB port.
This means that the patch needs updating in case Anand wants to have
it included.


Best regards,
Martin


[0] https://forum.odroid.com/viewtopic.php?p=332217#p332217

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
