Return-Path: <SRS0=jJRA=LP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55987C48BE5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 07:16:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14B36611C1
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 07:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14B36611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QPSEw3lGpcfZZw4UCStscAGVfUFyH57L1uFt/uggMQ=; b=v03tfZMxhYbq4H
	vOWejZz4exMHpeYl594l2cTXARu5uj+0aTdswtsSASZ7nvzfBIdeVBKC6rVY0A+Sq7g6mZ0xg8fsB
	gTwK6sOGZbKmPGQc8ERYwBWPmsUBkBwkLUWiRhRm3D0Gs7OPVgfFN84C7kw9MPDf3Q4Bsw1d7pN/D
	jOntWoVxUuKFwjQxQETYivhZ700kYcsepwJgfY8vuOOcEBVEOjymGtJL7VvUEHeubXCU1dqnq7Dv1
	n0wNpInAR4Cq0hbVxWtERU18bdDM54jxAaYEYZJgA5cHPrEG1peRVn6mJEk29p8MevIUgjkfFthGf
	i+wx41CelX1ZMxN+Y9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvEAL-002RnV-VE; Mon, 21 Jun 2021 07:16:17 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvEA7-002Rkf-U5; Mon, 21 Jun 2021 07:16:05 +0000
Received: by mail-ej1-x62f.google.com with SMTP id dm5so14656202ejc.9;
 Mon, 21 Jun 2021 00:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VE3Ea4BPCkopgR+SceHAr1CcKWEjirXXxv6I5VlDKz0=;
 b=qbSM3/qKaTaSN0EQ3YLpVscDDK+ngUMX3KIPIhHAP2PDiU8+Wf/6ujNs24RvtsqRUp
 4Y5NmxXeJLO5c6sx2iIU8Tm6wuXCC0njxNS68hxYMn37lIUiZLtPxhfw4f8mUi/yYLrC
 fpt0OPlfU7LlZt4Gp1eVkJAUp707ANoNxcyseCOSyJUKlCsRZFMusrUL1cdm8j7RU7bF
 A+sutLhNIfN/oLkQvp82MU7wZ1kIVsbV2Gk4TbwwBGJe6t2deLkDm4DAS6i1ctjn1b5W
 BKh/mU1llpRav2+8kIaYKmFkL5/8VW9fKdyzvm/JTqw3L+BpY6hqOkfIKqJRqLkLpCZr
 DjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VE3Ea4BPCkopgR+SceHAr1CcKWEjirXXxv6I5VlDKz0=;
 b=IQCK45akHrpGDa5Zh9/WksBlzuLW4Jb1RU77EV52tkM0q3yNtsa7y7fVul/0Y4AL2C
 WzswacD1svh/D7S63O4qMoHee8MI14YGrOtI1wYa0m9/FvwBUR/0ZHYPpf3ZVnwDL289
 84x/y2vRqediAGffCck26u3AKdgdbO+R4HyjH+scTIwA6aDyb8EtMz3yj2Arcq00CCwg
 Dy1ZecR4uiWTfDrO+cv9ymnOI1TfKDMTUkOc5u4p2bJkM2flyar2pRPb9kFMPjk2/XXv
 NAhiUSh5RGrDtsniNUqTNYvw/nME5CmDw93bVZ9TPFA7PIkFID2O1K9RmpLN9hutH7Qv
 QD5A==
X-Gm-Message-State: AOAM533Oym08sxBHEDTXVhfDlN080tBezavAIMGnRuBIJoWSpmOM9oEt
 gbpf4oTH/qEuiI/aLf4xfpG9s7IWw2By9yFQA+Q=
X-Google-Smtp-Source: ABdhPJwlhXn1ZUS4AdM5ajJYAe3cfRVYfAgGzqYz3WTPupXpBrrnVxTMG5QmLY1S1tVt2GhIwlmiJFWoIa91wRifW6I=
X-Received: by 2002:a17:907:7789:: with SMTP id
 ky9mr6329024ejc.191.1624259762466; 
 Mon, 21 Jun 2021 00:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-7-linux.amoon@gmail.com>
 <CAFBinCCE+6G7QtDoxfbcZVVRf-MDX-epSo=_k_PJZgWX+_Whvg@mail.gmail.com>
 <CANAwSgRqixugUr-t2OheLBVwD=EOkaLqxnGkT-Bx=p_A4Nyr8Q@mail.gmail.com>
 <CAFBinCALsnpbJGEb4LBLd_jy3E8fOZAQaacz-P7ijfkeyYg2dA@mail.gmail.com>
In-Reply-To: <CAFBinCALsnpbJGEb4LBLd_jy3E8fOZAQaacz-P7ijfkeyYg2dA@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 21 Jun 2021 12:45:51 +0530
Message-ID: <CANAwSgRABOyWYJPrrw64Wa6j2D94T4tybn7MHGCTbBowt7UncA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210621_001604_075234_6032DA3A 
X-CRM114-Status: GOOD (  26.98  )
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

Hi Martin

Thanks for your review comments.

On Sat, 19 Jun 2021 at 01:36, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Fri, Jun 18, 2021 at 5:33 PM Anand Moon <linux.amoon@gmail.com> wrote:
> [...]
> > > For shared resets (like the one we have here) reset_control_reset will
> > > only trigger the reset line once until all drivers using that reset
> > > line are unloaded.
> > > So effectively this new phy_ops.reset callback will be a no-op.
> >
> > I know his register is shared between two USB IPs,
> > but I have not observed any issues.
> have you checked at which point we're then actually triggering the reset?
> I assume that you will find that the reset is only triggered for the
> very first power_on/init call - which makes this patch effectively a
> no-op (yes, we're calling reset_control_reset then, but that doesn't
> mean that a reset is triggered on hardware level - see
> drivers/reset/core.c at around line 346).
>
Ok Thanks for the inputs. got your point.

I was also looking into Amlogic source code for reset. (aml_cbus_update_bits)
[0] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/drivers/amlogic/usb/phy/phy-aml-new-usb.c
is there some feature to iomap the USB with cbus?

> [...]
> > > > -       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
> > > > +       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
> > > I think this breaks compatibility with existing .dtbs and our
> > > dt-bindings (as we're not documenting a "reset-names" property).
> > > What is the goal of this one?
> > >
> >
> > OK, If we pass NULL over here there is the possibility
> > USB phy will not get registered.
> I don't understand why - with NULL everything is working fine for me.
> Also no matter which name you give to the reset line (in reset-names),
> it will be the same reset line in all cases. If it's the same reset
> line before and after: why is this needed?
>
I need to investigate this reset feature. With my setup with current changes
after I update the below.
-       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, "phy");
+       priv->reset = devm_reset_control_get_optional_shared(&pdev->dev, NULL);
        if (PTR_ERR(priv->reset) == -EPROBE_DEFER)
                return PTR_ERR(priv->reset);

Reset will break the USB initialization, see below output.

[    1.265403] dwc2 c9040000.usb: mapped PA c9040000 to VA (ptrval)
[    1.265540] dwc2 c9040000.usb: Looking up vusb_d-supply from device tree
[    1.265554] dwc2 c9040000.usb: Looking up vusb_d-supply property in
node /soc/usb@c9040000 failed
[    1.265585] dwc2 c9040000.usb: supply vusb_d not found, using dummy regulator
[    1.265717] dwc2 c9040000.usb: Looking up vusb_a-supply from device tree
[    1.265730] dwc2 c9040000.usb: Looking up vusb_a-supply property in
node /soc/usb@c9040000 failed
[    1.265752] dwc2 c9040000.usb: supply vusb_a not found, using dummy regulator
[    1.265812] dwc2 c9040000.usb: registering common handler for irq35
[    1.265867] dwc2 c9040000.usb: Looking up vbus-supply from device tree
[    1.265880] dwc2 c9040000.usb: Looking up vbus-supply property in
node /soc/usb@c9040000 failed
[    1.267066] dwc2 c9040000.usb: Core Release: 3.10a (snpsid=4f54310a)
[    1.270983] dwc2 c9040000.usb: dwc2_core_reset: HANG! Soft Reset
timeout GRSTCTL_CSFTRST
[    1.271319] dwc2: probe of c9040000.usb failed with error -16
[    1.273296] dwc2 c90c0000.usb: mapped PA c90c0000 to VA (ptrval)
[    1.273426] dwc2 c90c0000.usb: Looking up vusb_d-supply from device tree
[    1.273440] dwc2 c90c0000.usb: Looking up vusb_d-supply property in
node /soc/usb@c90c0000 failed
[    1.273471] dwc2 c90c0000.usb: supply vusb_d not found, using dummy regulator
[    1.273607] dwc2 c90c0000.usb: Looking up vusb_a-supply from device tree
[    1.273621] dwc2 c90c0000.usb: Looking up vusb_a-supply property in
node /soc/usb@c90c0000 failed
[    1.273641] dwc2 c90c0000.usb: supply vusb_a not found, using dummy regulator
[    1.273700] dwc2 c90c0000.usb: registering common handler for irq36
[    1.273750] dwc2 c90c0000.usb: Looking up vbus-supply from device tree
[    1.273762] dwc2 c90c0000.usb: Looking up vbus-supply property in
node /soc/usb@c90c0000 failed
[    1.274966] dwc2 c90c0000.usb: Core Release: 3.10a (snpsid=4f54310a)
[    1.278888] dwc2 c90c0000.usb: dwc2_core_reset: HANG! Soft Reset
timeout GRSTCTL_CSFTRST
[    1.279224] dwc2: probe of c90c0000.usb failed with error -16



>
> Best regards,
> Martin

Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
