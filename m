Return-Path: <SRS0=O/xb=RI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A38C43381
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:38:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 086C620675
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:38:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IxvJ61ZS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="N7PnLcob"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 086C620675
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/7KhQQnb/XnoHBijZDhPLmyb5PGqC2gCoKO349o4Sc=; b=IxvJ61ZSvxquP9
	8ERMpyD8ya0TqBYr/dbP+QMIjA6iomK0TC5GRlMBOE6wKQmO2CHKnrVg3o0q4SnRdZrLdO0Cmlw9E
	sJnbpkErf6M+nxUfCoH7GxDBzQjxF7yr4E0BlLyajSbGSXp+12bx/B2ws7jJVaUdywe2RtZtReasw
	PCWyx8AV9rImsxLndMdrLukjR2iuAYPdv1OiCyPZybu/GUuJQq1No+9WS9wLQCeNFmo9ZLHjBSjLp
	u35tEFzG/PMr7ZBJB8vITEv6RZQIED9bXxRDWqMxXS5Kj7cpstJpxRXbu8tlaRiuqMVIeaFHbjw/u
	XPvdQr9mVLczxSAZ4AHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1HlE-0007on-2W; Tue, 05 Mar 2019 21:38:04 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1HlB-0007oA-Ed
 for linux-amlogic@lists.infradead.org; Tue, 05 Mar 2019 21:38:03 +0000
Received: by mail-oi1-x243.google.com with SMTP id i8so8096005oib.10
 for <linux-amlogic@lists.infradead.org>; Tue, 05 Mar 2019 13:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zTT6dQN4jZmRkHJ9J/ip5jx+RjK+oNNf+NGu0q2iMrA=;
 b=N7PnLcob6EjRIYSfpvZickvH2txMrB+3eh957ysPRKnUQQ0ZhgdQEBHdXVgiH0/BaM
 rOg9Hobm/c65fF9UMSY7AUEFmyrc+RpAZplBhFQt23nHBIIk1BNQoCWZnqL7HOensgZU
 Z3kF7S4+PqirBsff8JGk1fdc9M0UVy3OzxjTQieFDD2jegUA7pOFJw1ovlTj8xJFP9zX
 vCIK3oohDF2SXZpEm6yD7xZKzhYJXv1QmLrdNCcXdCs6KWFL8agWHOFIwod/IcuKN44c
 aVCBz2Il38yeiEmQdWOEl6KQbA/1jjoasky6TsqWqe/q3rEBjY1qzR0Qw3fo5YrdFIxk
 gRnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zTT6dQN4jZmRkHJ9J/ip5jx+RjK+oNNf+NGu0q2iMrA=;
 b=FxTxsaqwu8/ZMNbjmO8N+lhmypamr2XZmdUrn73yzhW/Kra/Dlb5rlZyIonmfs5Vn7
 9PwISybPFq8BU+OPdWAVeLQw18/HCjg8E1WeG4yGOoOmg6o7JSrI2ydkRThCCb4Hk72T
 5hGQS4GGYAYjcS4Hw20WRimq9jD28EAbyYSW7noywBELPHs3jmoRHOWdRYS3JD9BcASG
 q0V1tfj1ZrUsubO2jv9h2uwujUnMyzNp10YC8mqBj0INHrYisOugu6HFh8WjLqZSG5IL
 lRxGl0D0Ja+woo2xhJYnpo9j0aHZwHbjlMyxg2azE5u1U/2OP304nd4oWTkOEGlPFokR
 DYAQ==
X-Gm-Message-State: APjAAAVk1QMItpnQEWWnDf08bIlpDfe1q3G4YujExbSIW1dSa0YpsFpv
 1FK83V81hwaRtsd625NzmibK6cd4zNTgNW1Xt9o=
X-Google-Smtp-Source: APXvYqzs+cxtuHPAfHes0xXSA8Mlb8a03LFDpIqpmfkycVqoHoNpFER/XWxr0eAJQ/C045ooC1F4nsxv0v9r734WpMw=
X-Received: by 2002:aca:af01:: with SMTP id y1mr390357oie.140.1551821879169;
 Tue, 05 Mar 2019 13:37:59 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCD6gWS0RiJc=secdFDBM329PKxSiGejo1wSQ6Pwe6ynJw@mail.gmail.com>
 <CAPDyKFp0U1E3rbWfuxmtokpF015a+fmorQoLAYCR7euJBB9u2g@mail.gmail.com>
In-Reply-To: <CAPDyKFp0U1E3rbWfuxmtokpF015a+fmorQoLAYCR7euJBB9u2g@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Mar 2019 22:37:48 +0100
Message-ID: <CAFBinCCvEkV2a9OBY2k-f0OqS2tU0HFsuehSLcbREg2_O6z0yA@mail.gmail.com>
Subject: Re: Power Domains on Amlogic SoCs
To: Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_133801_517708_7134B996 
X-CRM114-Status: GOOD (  39.09  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mjourdan@baylibre.com, Jianxin Pan <jianxin.pan@amlogic.com>,
 Linux PM <linux-pm@vger.kernel.org>, Kevin Hilman <khilman@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ulf,

On Mon, Mar 4, 2019 at 4:41 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 1 Mar 2019 at 23:30, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hello,
> >
> > I would like to start a discussion how to structure the power domain
> > drivers for the Amlogic SoCs.
> > My main motivation is getting video output and video decoders working
> > on the 32-bit SoCs.
> >
> > The Amlogic SoCs we various registers for "power domains", the ones I
> > know (in no specific order):
> > 1. HHI_MEM_PD_REG0 (contains: HDMI memory PD, Ethernet memory PD,
> > audio DSP memory PD - at least on the 32-bit SoCs)
> > 2. HHI_VPU_MEM_PD_REG{0,1,2} (contains: various VPU related power domains)
> > 3. AO_RTI_GEN_PWR_SLEEP0, AO_RTI_GEN_PWR_ISO0 (contains: HDMI PD, HDMI
> > isolation, video codec PDs, video code isolation, ...)
> > 4. AO_RTI_PWR_A9_CNTL0/AO_RTI_PWR_SYS_CPU_PD0,
> > P_AO_RTI_PWR_A9_CNTL1/AO_RTI_PWR_SYS_CPU_PD1 (contains: CPU core
> > related power bits)
>
> It would be nice to know a bit more about if/how the hierarchical PM
> domain topology looks like. Do you have this information?
unfortunately I don't have this information
Jianxin, maybe you can give us some details here (see also below)?

> >
> > currently we have three drivers, which handle *some* of these power
> > domain registers:
> > drivers/soc/amlogic/meson-gx-pwrc-vpu.c:
> > - partially manages HHI_MEM_PD_REG0
> > - fully manages HHI_VPU_MEM_PD_REG{0,1,2}
> > - partially manages AO_RTI_GEN_PWR_SLEEP0
> >
> > arch/arm/mach-meson/platsmp.c:
> > - manages AO_RTI_PWR_A9_CNTL0 and P_AO_RTI_PWR_A9_CNTL1
> > - only for the 32-bit SoCs, these registers (or their replacements)
> > are controlled by the firmware on the 64-bit SoCs
>
> So, the AO_RTI_PWR_A9_CNTL* is used to power off/on the CPU, entirely.
> If I understand correct, the AO_RTI_PWR_SYS_CPU_PD* is used to put a
> CPU in a deeper idlestate, like CPU retention, right?
yes, we use AO_RTI_PWR_A9_CNTL* (in arch/arm/mach-meson/platsmp.c) to
turn on/off the CPU cores for SMP boot and CPU hotplug on the 32-bit
SoCs

> If I am correct, you need a cpuidle driver to deal with this, of course.
so far only SMP boot and CPU hotplug are implemented for the 32-bit SoCs.
I don't know about AO_RTI_PWR_SYS_CPU_PD* because these registers
don't exist on the 32-bit SoCs (as far as I know)

> For 64-bit SoCs, the custom FW/code is replaced by the PSCI FW?
indeed, on the 64-bit SoCs this is managed by the PSCI firmware

> >
> > drivers/media/platform/meson/vdec/* (not upstream yet due to firmware
> > blob licensing questions, latest patchset: [1]):
> > - also partially manages AO_RTI_GEN_PWR_SLEEP0, AO_RTI_GEN_PWR_ISO0
> > (the former is also partially managed by meson-gx-pwrc-vpu)
> >
> > To use the meson-gx-pwrc-vpu driver on the 32-bit SoCs I would have to
> > create an "AO regmap/syscon" and pass it to that driver. However, the
> > register layout of the "AO bus" on these older SoCs is different to
> > what we have on the 64-bit SoCs. So having a big "AO regmap/syscon" is
> > not easy (I also believe that it even if we could achieve it then it
> > wouldn't be a good representation of the hardware).
> > The video decoder driver currently requires the same "AO regmap/syscon".
> >
> > I would like to focus on the AO_RTI_GEN_PWR_SLEEP0,
> > AO_RTI_GEN_PWR_ISO0 registers for now. This will make it easier to
> > support VPU and the video decoder drivers on the 32-bit SoCs.
> > My idea is to create a separate power domain provider which manages
> > these registers. Each power domain is exposed with it's own ID (just
> > like we have the CLKIDs in the clock driver) and can then be passed to
> > the various consumer drivers.
> > The genpd improvements in v4.19 and v4.20 make this possible as each
> > power domain can now be managed at runtime (not just at driver probe
> > time), see: [0]
> >
> > With a separate power domain provider the meson-gx-pwrc-vpu and video
> > decoder drivers would not access the AO registers anymore. Instead we
> > would pass all relevant power domains from the "AO power domain
> > provider" to their respective consumers.
>
> Overall, this seems like a reasonable way forward.
>
> I guess the important point is that we model the topology of the HW
> correctly in DT (no short cuts), as otherwise we may encounter issues
> in the end I think.
to get the DT part right I am thinking about the following questions:
- which IP blocks do we have? (I mentioned four in my original mail
where I *believe* that they are separate IP blocks, but I'm not sure)
- what are the inputs/outputs of each IP block? (example: IP block X
uses clock Y)
- what are the differences between the SoCs (not only the "new" 64-bit
ones, but also the 32-bit ones)?
- do we have dependencies between power domains? (like in: do we need
to enable power domain before removing "isolation")
- what about the "isolation" bits - how do these work with the actual
"power domain" bits?
- are the power domains just "on" or "off", or is there something in
between (like low/medium/high power or performance)?

Ulf, since I'm new to this whole power-domain area: do my questions
make sense? what am I missing?

Jianxin, can you please answer Ulf's and my questions on this topic?

> >
> > Examples (incomplete) from the VPU power domain / video decoder perspective:
> > &vpu_power_domain {
> >   power-domains = <&ao_pwrc AO_VPU_HDMI_PD>, <&ao_pwrc AO_VPU_HDMI_ISO_PD>;
> >   power-domain-names = "vpu_hdmi", "vpu_hdmi_iso";
> > };
> >
> > &video_decoder {
> >   power-domains = <&ao_pwrc AO_PWR_VDEC_1_PD>, <&ao_pwrc
> > AO_ISO_VDEC_1_PD>, <&ao_pwrc AO_PWR_VDEC_HVEC_PD>, <&ao_pwrc
> > AO_ISO_VDEC_HVEC_PD>;
> >   power-domain-names = "vdec_1", "vdec_1_iso", "vdec_hvec", "vdec_hvec_iso";
> > };
> >
> > My main concern is "backwards compatibility". We need to take care of
> > the VPU power domain driver and the video decoder driver. The latter
> > is not mainlined yet, so I'm not sure we need to be backwards
> > compatible here.
>
> Yeah, that could be a bit troublesome, at least short term.
indeed. the video decoder drivers are not part of mainline yet.
This means we "only" have to consider two "power domain consumers"
which already exist:
- VPU power domain / VPU driver (display support)
- SMP / CPU hotplug support on the 32-bit SoCs (this currently doesn't
use the power-domain framework but a syscon in the platsmp.c driver)

> I think I have mentioned it before, in some thread - perhaps we should
> add an OF helper function, which tells the caller the number of
> power-domains that is described in the device node. That could help to
> make the code more flexible in drivers/buses that deal with the PM
> domain attach/detach, thus also potentially simplify to support
> backwards compatibility, if/when that makes sense.
>
> >
> > Please let me know if you have any concerns, ideas, suggestions, ...
> > I can build an "RFC" series for this topic if this makes the discussion easier.
>
> It's always easier to look at code, unless there is a whiteboard available. :-)
OK, I'll wait for additional questions you may have so Jianxin can
provide the details we need to know about the actual hardware
implementation.
After that I can start an RFC series (Jianxin's input will help us to
focus on the Linux drivers rather than having to discuss - or even
guess - the hardware details over and over again)

> If you keep me cced, I do my best to review it!
I will do that.
thank you for taking the time to go through my mail and give feedback!


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
