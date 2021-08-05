Return-Path: <SRS0=o4E8=M4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1446FC4338F
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Aug 2021 18:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E3A61004
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Aug 2021 18:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5E3A61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1GN4DZVNxN1q42v02T2iOVbiFMSCq++QRguADytzRE=; b=1R45lb3VZ+j0KQ
	ucMpqooih+Pyj8F9uU2zZY1Ii2Lv370bw14uKQlMdII92G5G4P8isWAe5w7FVNjm/nocia6O6kmyp
	b1kni6AImShsCq6PVREKtOM3tMtOdZ2RC2GQBb3Ndc/bRIeOFvwS2z81tfTVrCJT4ZcbwIf6CmSZj
	HhI5thn8ISvLEYgZkzLRuMoXRTJ/DoubBxX4wR/A+run7JNlomO7LjzHB2T0+jMs80CjxQU5+edd2
	UUMwzqbwOWmlwjAjrkF2P5AzFqBHgGMwzJhJa2Z36Hvq/hegErhcNkJU5bhvRi/zAY3Lymfgc3O3i
	bnVttJHbi7iR3d7wRW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBhx9-00AWDp-7k; Thu, 05 Aug 2021 18:18:47 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBhwv-00AWCV-Vq; Thu, 05 Aug 2021 18:18:35 +0000
Received: by mail-ed1-x536.google.com with SMTP id cf5so9687810edb.2;
 Thu, 05 Aug 2021 11:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ojNM9xV3H+nI1/a7NsvJNdRoof5hRfKC/9tKy/ZhcHw=;
 b=olqN3ikMo81rNz4+DbVRQ5Gbl0vu0cGksnagpE9AgmSSecjhUJyB2hL20W+uRwdVkZ
 cmeZCYW7JCSZ/NYW0/792UKXVObEHntrwM0GTVFi4UwIV/gNTlp2HXmft1lA96HTWIuY
 bunfazBEz48qFAV19PJIS6M7B1NmkQhrW5o9iWBSgv8YZr7zlXEkqZ/758h1kjTJSA6H
 4CpzFlazcO/6PiXkUUJuP6CNMezIy0+raIkR6RrivKelpHFimF71gUxhmbtION74UFwD
 wwtoNDpw3trioZGMrWgBU0Alwn86VCLubOfleCkMpfO6DnO9roiE3VkgzfqqkB8qIhqp
 Am9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ojNM9xV3H+nI1/a7NsvJNdRoof5hRfKC/9tKy/ZhcHw=;
 b=JRmn0az4pskKPGiCNFqFzkzNM4EBpYdr26BggSQXYUwATRCRByM3Pw78Bxu7SLNX4e
 zsg3z3aR8kHsV4JoQFJdAtqx2+S4XiMwx4GwuU1ebL88BUEKW3SYKfHmCzq0BcZ26x+M
 KmQwLTql2JOxNWuLea5xnxFpoMpUsV6acYXEdlTcPUM6U247bA6iZW2vYuldyIq34ZJP
 LeliwYxs0JS26bDqhW2vKxQKH+17IrF8E0/spQTUiV6UcRpaxKmInT3xg2hrNf78NLeJ
 vP0ZFzKc27xwKEods5gzkNs8IlVM60YvcLSSX3xjPRYZ8Lk2G0MzIGnSuQKx2muLEpfc
 Qq3g==
X-Gm-Message-State: AOAM531E9YuiqiPepTWYw2p/9arsmi46PoQqdRG2+eq4DbjGJ3zagJxp
 gGh6BQ79hBe7SeoW9JVtOFX8J+vs3FxkCEbUZjE=
X-Google-Smtp-Source: ABdhPJxAQxK02kP1hoG/1FTsH5hCNBUCJGicnRD8GVaXqj7qpLOmlEdfipZjtgyGJx3opxXShvtRUFnXaflfYi8bGXY=
X-Received: by 2002:a05:6402:cae:: with SMTP id
 cn14mr8314025edb.31.1628187511800; 
 Thu, 05 Aug 2021 11:18:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210716103651.1455-1-linux.amoon@gmail.com>
 <20210716103651.1455-2-linux.amoon@gmail.com>
 <CAFBinCDeqauw_V-Vn9cat9HaCXj6HEMz6G+G+VbqCNtGEFGYzg@mail.gmail.com>
 <CANAwSgQ5PDGUWMH-jxnz5wwutUVniTn7RAe=4J=8-jbmqxYRRg@mail.gmail.com>
 <CAFBinCBhg+dije+3DvV_V_kqHv9q+r4EPxXCYFti6KuA4mK7KQ@mail.gmail.com>
 <CANAwSgT9-5zGr67aGzBmW6WDBfeiAvjv_zv2UbRC+YbgAGg==A@mail.gmail.com>
 <CAFBinCCGA0b=LVjbQood+iN+DHLodY0RJ-GrSOcgdzrDFJ25pQ@mail.gmail.com>
 <CAFBinCAohjxcsY3D1rdAiYVGL+==cnjzZxg1GmYxSNVhxSTDoA@mail.gmail.com>
 <CAFBinCAP_DDvPLn4h1yQKEdU_x1ovokHUTPeq3vNV_sDF8PcWg@mail.gmail.com>
In-Reply-To: <CAFBinCAP_DDvPLn4h1yQKEdU_x1ovokHUTPeq3vNV_sDF8PcWg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 5 Aug 2021 23:48:20 +0530
Message-ID: <CANAwSgS2vi7hZqX0LWxNTvk-3aN=n1fEErj4Zt0_4CCpZGyRkg@mail.gmail.com>
Subject: Re: [PATCHv2 1/4] ARM: dts: meson8b: odroidc1: Add usb phy power node
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
X-CRM114-CacheID: sfid-20210805_111834_068554_3136873B 
X-CRM114-Status: GOOD (  34.21  )
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

On Thu, 5 Aug 2021 at 03:28, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> On Sun, Jul 18, 2021 at 9:09 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> > On Sun, Jul 18, 2021 at 4:01 PM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > [...]
> > > > From the schematics [1]
> > > > https://dn.odroid.com/S805/Schematics/odroid-c1+_rev0.4_20160226.pdf
> > > >
> > > > You could find references to PWREN  <--- GPIOAO.BIT5
> > > > The second reference is USB HOST Power Switch
> > > > The third reference is USB HOST POWER.
> > > >
> > > > Hope I am clean in my thought process now.
> > > Can you please point out the page numbers for me?
> > >
> > > What I am seeing on page 1 is:
> > > GPIOAO_5 (called GPIOAO.BIT5) is connected as an INPUT to the USB_OTG
> > > PWREN signal (that's the green box with the label "USB_OTG.SchDoc"
> > > above it).
> > I unfortunately missed your question on IRC on this topic:
> > <armoon> xdarklight: just want to understand the confusion on PWREN,
> > either is INPUT / OTPUT to usb hub am I correct
> > My understanding of the INPUT/OUTPUT direction in the Odroid-C1
> > schematics (which you linked) above is that the arrow direction shows
> > whether it's an input or output.
> > For example (all on page one):
> > - HDMI_HPD is an input to the Meson8b SoC, arrow direction is: HDMI => S805
> > - IR_IN is an input to the Meson8b SoC, arrow direction is: S805 <=
> > GPIOAO.BIT7 IR_IN
> > - PWM is an output, arrow direction is: S805 => PWM.C VCCK_PWM
> > - 3.3V/1.8V switch for the SD card is an output, arrow direction is:
> > S805 => GPIOAO.BIT3 TF_3V3N_1V8_EN
> >
> > That tells me: the arrow direction shows which connections are inputs
> > or outputs.
> > Some pins can be input and output at the same time (HDMI_CEC). But
> > let's keep it simple for now any only look at inputs/output.
> >
> > Based on this information I am looking at the arrow direction for
> > USB_OTG: GPIOAO.BIT5 PWREN <= S805
> > So this confirms that GPIOAO_5 is an output to the SoC.
> > Please note though that this part is not linked with any USB host
> > connector, it's only linked to the USB OTG path.
> >
> > For the next part the S805 SoC is not involved:
> > USB1 USB_HOST_PWR_SW PWREN <= PWREN USB_HUB_GL852G
> > USB2 USB_HOST_PWR_SW PWREN <= PWREN USB_HUB_GL852G
> > This tells me that the PWREN signal for the two USB_HOST_PWR_SW (USB
> > host power switches / current limiters) is driven by the GL852G USB
> > hub.
> Hardkernel team responded on the Odroid forums to the request from Anand:
> "Power-Enable signal to the USB load switch ICs is connected to the
> USB hub controller.
> It is not connected the CPU GPIO."
>
> The regulator from Anand's patch is therefore connected to the micro USB port.
> This means that the patch needs updating in case Anand wants to have
> it included.
>

Yes, I will send a corrected version of the patches soon.

>
> Best regards,
> Martin
>
>
> [0] https://forum.odroid.com/viewtopic.php?p=332217#p332217

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
