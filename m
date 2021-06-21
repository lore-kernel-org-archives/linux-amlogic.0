Return-Path: <SRS0=jJRA=LP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3677AC48BE5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 07:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1753610CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 07:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1753610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8S540r0JOUJ7sVdOt27k40wCQe03NWYo8fUJi6zN/fk=; b=4CmOAU6TV0nDwj
	xpnS4ST128UQTohLgs57o30ZjUCfK4Z51ho16AQP9sauHhe7ZsWkB34TL54g8zDaqaKyIETjOInZB
	P7n8Gce6025PU+l/KWVADa8bJ9L8uMRoZ0CPM0u4l8DFE8lyaqJiauOXMQNDQfl+jd2Nnc4UoV4vf
	TZFuSBreJMfGm5rwR4Sr/Bgc0LbYlLuutJnYVREE1lp1gpZsdhLcBF9Raog0ItVM+0PI4ql/KEmij
	JsPMMfKZqe3K/a0enBmnYTQUHd33BIAqaDuLM2aVF4YffYJ1wGJBuCd/s7YgfgnRc6eRPHmU8yAEs
	/W/7Mc7R1Oy40qVWqKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvEEx-002SaX-Hg; Mon, 21 Jun 2021 07:21:03 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvEEj-002SXu-P1; Mon, 21 Jun 2021 07:20:51 +0000
Received: by mail-ej1-x62f.google.com with SMTP id my49so26959898ejc.7;
 Mon, 21 Jun 2021 00:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c+vUa1UJEeV1Fh7yDKg8NRJV7NdKihQmk+VqSoLdyls=;
 b=IBCbfCu2aVToYUBGsB3mk6ZzTcO1+EH5TzeGBu+qs+lR9jet/M56aMR+DLm1aCA4/r
 3VWDQgWXSF9EUqg2A90ImiN2xJ+8xZF6rdEkCdLdse1n8hYDW4BOrh/R3uL6DsbjA5PI
 WYX9Tn9Vk47w+EPDC25Qi86hSBgpxl++WfnKHYU83gX066L6gS2NRYTl5S5C2m3uVlKJ
 7J8+ni7Lycj/x1Aml4Nm7ZQrNJ6fRsY5eoxnhhMLu4wwfF4dFq5Ou5vqr0SQqeufYvXH
 WalN4szoBpN/ZsA0gPEgViHEihMW5wjbH2r2YsdC6kFBrhI9EV6oHKYFdx0wmvXYdT39
 qFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c+vUa1UJEeV1Fh7yDKg8NRJV7NdKihQmk+VqSoLdyls=;
 b=DB+BxthEKt1HYniCnKJ2LJZPoK8lxOoJ/bHaK6LhVv38Yfhj4DU+dJZJymTIgsEsVC
 TUWOptP/5jscOnp7Um9hmloH6IsExV8MD7bud+0Vd+kgPI8OoVBjrUZyI1fweUSuzabz
 GRSTkc3NuYxTLt6Q1aWFv+uB737PgEWJofFas+QY1VJplvCJee/ERHjL3hu5xX9eFaIT
 90rhqQ8U3x7fYc1a8mFME6gffvrYKAoT6cEheEJ4ZT/yUNnyRIjFsfJXdpAuNfZvNOV9
 67uJ0CZwrIJjpxkmDeSEBTz3lWXEO/75/1ZhMotq8F7qOD2PsJsimVhFiOAHUOBgN1vo
 j8yQ==
X-Gm-Message-State: AOAM530AhFSXe981R9azfXC6sXRCdJsiogLCg3ZVTnbCHutTo/Bw6Hhr
 V6ibDIT6QOToVHnA9pLOufHFpuCiBBFxLjgY3no=
X-Google-Smtp-Source: ABdhPJwqVaVz7oYbyjo8YPm/cHzc9kY/RLwkhcnBJ0YDnWvcOUPBi2NcPjXu7d1xZVjKLJI0/io3de4kP7XnO6l0spY=
X-Received: by 2002:a17:907:2625:: with SMTP id
 aq5mr7670564ejc.373.1624260048564; 
 Mon, 21 Jun 2021 00:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-5-linux.amoon@gmail.com>
 <CAFBinCB1rrmJ5=M0tSGS_47BarFcrs2Kz5qFzrHw8+OEYxX3DA@mail.gmail.com>
 <CANAwSgQVgKUoTpfaJyfxdphqc6M=Oq6jj5zZ7An9St7PdzQHYA@mail.gmail.com>
 <CAFBinCDpQybqD96CCMBDKYUXEYCABr0QMfxFH1AWrXP12UxxMg@mail.gmail.com>
In-Reply-To: <CAFBinCDpQybqD96CCMBDKYUXEYCABr0QMfxFH1AWrXP12UxxMg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 21 Jun 2021 12:50:37 +0530
Message-ID: <CANAwSgTd1zq_gHbVZesLY=e3DRRGgn_o5omuDo9Lub4FavOtbQ@mail.gmail.com>
Subject: Re: [RFCv1 4/8] phy: amlogic: meson8b-usb2: Use phy set_mode callback
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
X-CRM114-CacheID: sfid-20210621_002049_858133_EED83D24 
X-CRM114-Status: GOOD (  33.17  )
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

On Sat, 19 Jun 2021 at 01:31, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Fri, Jun 18, 2021 at 3:19 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > > I suggest dropping this patch until we know for sure if and which
> > > registers need to be updated based on the DR mode.
> >
> > Yes, I have observed this, Can you give these small changes a try?
> > With the below changes, I got the  PHY_MODE_USB_DEVICE support working.
> first of all: sorry that I have not linked my source of information previously:
> - Meson8b: [0]
> - Meson8 and Meson8m2: [1]
>
> Unfortunately I don't have any datasheet or "better documentation" of
> how the registers should be programmed.
> This is why I am a bit defensive when I am asked to change something
> there - as I simply have no way of knowing if the changes are good or
> not. I can only tell whether they're "identical" or "different" from
> what the vendor kernel does.
>
> [...]
> > +       case PHY_MODE_USB_DEVICE:
> > +       case PHY_MODE_USB_OTG:
> > +               regmap_update_bits(priv->regmap, REG_ADP_BC,
> > +                                  REG_ADP_BC_DCD_ENABLE,
> > +                                  REG_ADP_BC_DCD_ENABLE);
> > +
> > +               udelay(ACA_ENABLE_COMPLETE_TIME);
> > +
> > +               regmap_read(priv->regmap, REG_ADP_BC, &reg);
> > +               if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
> > +                       dev_warn(&phy->dev, "USB ID detect failed!\n");
> > +                       return -EINVAL;
> > +               }
> > +               regmap_update_bits(priv->regmap, REG_ADP_BC,
> > +                                  REG_ADP_BC_ID_PULLUP, REG_ADP_BC_ID_PULLUP);
> > +               break;
> According to the vendor kernel this should only be applied to
> "host-only" USB_PORT_IDX_B (which is usb1 in the mainline .dtsi).
> Based on that I think it's not correct to apply this for DEVICE and OTG modes.
>
> The vendor kernel does not configure REG_ADP_BC_ID_PULLUP anywhere.
> Also DCD_ENABLE is only ever set to 0 (while you are enabling it now), see [2].
>
> As mentioned before: all I can say about this patch is that it
> programs the registers differently than the vendor kernel does.
> From your description I am not sure if you are now getting different
> behavior on Odroid-C1 with this patch (compared to what we had
> before).
>

In order to enable USB phy we probably need to do a little bit
differently than the vendor kernel.
Yes I have observed many configuration parameters are missing.

OTG port on Odroid C1+ and Odroid C2 server two purposes
1 > It could act as USB host port.
2 > It could be used as USB power on the devices, just like Raspberry pi.
      What I meant is we need some driver code to protect the power to SbC.

So depending on the mode, it gets configured host mode or PCD mode,
I am not completely sure right now.
So I saw your work on extcon, that's the reason I would like to void
any changes PHY right now.

I observe some failures like below.
[    6.013859] dwc2 c9000000.usb: DWC OTG HCD URB Dequeue
[    6.013897] dwc2 c9000000.usb: Called usb_hcd_giveback_urb()
[    6.013902] dwc2 c9000000.usb:   urb->status = -115

Still investigating this issue,

>
> Best regards,
> Martin
>
Yes, I will go through the features for debugging in the future.
>
> [0] https://github.com/endlessm/linux-meson/blob/03393bb8e8478626e03ee93b0a2a225d6de242b5/arch/arm/mach-meson8b/usbclock.c#L120
> [1] https://github.com/endlessm/linux-meson/blob/03393bb8e8478626e03ee93b0a2a225d6de242b5/arch/arm/mach-meson8/usbclock.c#L120
> [2] https://github.com/endlessm/linux-meson/blob/d6e13c220931110fe676ede6da69fc61a7cb04b6/drivers/amlogic/usb/dwc_otg/310/dwc_otg_pcd.c#L71

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
