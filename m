Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=DATE_IN_PAST_03_06,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB56C10F03
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 20:13:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A71520840
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 20:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YiTyB+yg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AfopLt0G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A71520840
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j2kxremo14gFnPNktJN34JFRBI3TqMlaMrSgTZsbYww=; b=YiTyB+ygVbypNY
	9vRg/VNhLSidbo5oXutosWg6oaI5jZQoMG5Iovqg1X2PtKC1xOmmjbw/HHtpa/HhF8OFzplMXBbFv
	0v7nR5rVl59cpBOufWd5Hx32H1ZecDt0214PykTzs3wp8t0a/3L27N7I4iDt5UwfBX6t16wQ3ltIx
	hCFp2f5D4o0UA/WawPuV9hhcOZHKtyhZ/EQ/829mFdZlcUMnFlPJHcWUin4q3DJgE1uhCjdtqAN6F
	U4gpt7hAf4/LbWH69ABaI8s92ExG7x7nbhXu7wDuhcfRu/QFuzMKH2rF/BFK+ocWsDyAEIyRFCcpH
	ura5wkoEoh0XbZo52EPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1zO9-0000T9-AB; Thu, 07 Mar 2019 20:13:09 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1zO5-0000S8-6n
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 20:13:07 +0000
Received: by mail-pg1-x544.google.com with SMTP id b2so12119396pgl.9
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 12:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=HtAq65+h72qZeFMBTWl8ROmb6MDABZ7sCzWx3pvY3uk=;
 b=AfopLt0GqQkeWv1Y0MryN4AsHROAJwU+S+3DOh+ik+9Bm0SGn9PQMrP2M8MLnQcmP3
 vZVPmL7HvWdUr9hOdXDYiv9z4d3TlgxKIE6QJHNEOcL13gC+WPLkZhNpnuTU7f6YkbxX
 bP8HKxNzjcVjRNpgoJYPtkdRpdQzPsjYYlMErChfFgSu0VmNN9pV+HY/ntQOhuB/H9fH
 cqyJTJekK+HFQXcSH01oQFn7J/ogJI7mc65B3lTKM5OBFPd4ce8f4Iu8sj35/PQvh2W7
 ejxgannGD/kiKFweabxgpuwZKlNrWEc1H6gzbjxlLmXC88CxNQtXgFa2YuKZ6SvStwkA
 LM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HtAq65+h72qZeFMBTWl8ROmb6MDABZ7sCzWx3pvY3uk=;
 b=QyA8I7+5+IQmeYOiheb/Y5DdmikWB6GlMobS1khODg8KZnsH5aEBkoyN0Cozr1ypPa
 xpOj7+KwRdz6zDHOjZUaNqGQpLCBJnvsppFln0YCVWISe6kR9JsKjXURV1FE4rS9EY38
 f9J0Mf79jKLH+ov9wGE6P3YHBQwE5VbpJdN8fi0PWB2gDyatXmcq0FV6eImPaRVMlR1t
 0K1ptFmKKeVIfD2aPiVbTC5xmpWpyX65Y98KbawB+TCv7tK4tVGQF0E63v/mtdwgycXC
 o0+Nvsy+NtKrnT4ppjVIHYkv1JMuhEofYypksM8bRGhLAXYNlDxQe3yQd9IDTcrR9gI8
 Bp1g==
X-Gm-Message-State: APjAAAV1x+4GWgCtzECblGqh25WN+FfuBVun4Jtwdn7t/v+9wh4fnwmd
 ZuQ183L4r7GhirPcnYT4NWVzQQ==
X-Google-Smtp-Source: APXvYqyb4Tq3F/eEvKr8eJIGl9DbKZzb+ocYNQ2FMD3Rpy1NIa1LzEMRUTIIbdzxbrS61Wlp5rdaUA==
X-Received: by 2002:a17:902:7d84:: with SMTP id
 a4mr14904184plm.76.1551989583400; 
 Thu, 07 Mar 2019 12:13:03 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:98f2:d444:5b9e:15fd])
 by smtp.googlemail.com with ESMTPSA id
 k125sm19615975pgc.51.2019.03.07.12.13.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Mar 2019 12:13:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: Power Domains on Amlogic SoCs
In-Reply-To: <CAFBinCCvEkV2a9OBY2k-f0OqS2tU0HFsuehSLcbREg2_O6z0yA@mail.gmail.com>
References: <CAFBinCD6gWS0RiJc=secdFDBM329PKxSiGejo1wSQ6Pwe6ynJw@mail.gmail.com>
 <CAPDyKFp0U1E3rbWfuxmtokpF015a+fmorQoLAYCR7euJBB9u2g@mail.gmail.com>
 <CAFBinCCvEkV2a9OBY2k-f0OqS2tU0HFsuehSLcbREg2_O6z0yA@mail.gmail.com>
Date: Thu, 07 Mar 2019 23:50:13 +0900
Message-ID: <7hmum6g2my.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_121305_309800_60310725 
X-CRM114-Status: GOOD (  44.96  )
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


> On Mon, Mar 4, 2019 at 4:41 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>>
>> On Fri, 1 Mar 2019 at 23:30, Martin Blumenstingl
>> <martin.blumenstingl@googlemail.com> wrote:
>> >
>> > Hello,
>> >
>> > I would like to start a discussion how to structure the power domain
>> > drivers for the Amlogic SoCs.
>> > My main motivation is getting video output and video decoders working
>> > on the 32-bit SoCs.
>> >
>> > The Amlogic SoCs we various registers for "power domains", the ones I
>> > know (in no specific order):
>> > 1. HHI_MEM_PD_REG0 (contains: HDMI memory PD, Ethernet memory PD,
>> > audio DSP memory PD - at least on the 32-bit SoCs)
>> > 2. HHI_VPU_MEM_PD_REG{0,1,2} (contains: various VPU related power domains)
>> > 3. AO_RTI_GEN_PWR_SLEEP0, AO_RTI_GEN_PWR_ISO0 (contains: HDMI PD, HDMI
>> > isolation, video codec PDs, video code isolation, ...)
>> > 4. AO_RTI_PWR_A9_CNTL0/AO_RTI_PWR_SYS_CPU_PD0,
>> > P_AO_RTI_PWR_A9_CNTL1/AO_RTI_PWR_SYS_CPU_PD1 (contains: CPU core
>> > related power bits)
>>
>> It would be nice to know a bit more about if/how the hierarchical PM
>> domain topology looks like. Do you have this information?
> unfortunately I don't have this information
> Jianxin, maybe you can give us some details here (see also below)?

I have some reasonble documentation that sheds some light here, at least
at the logical level, but with that I can guess at some of the physical
layout, and then hopefully get clarification/confirmation from Jianxin
as needed.

First off, AFAICT, there are 3 primary rails from the PMIC

- AO (always-on) domain
- EE (everything else) domain
- CPU domain (called A53 on the 64-bit SoCs)

At first glance, these would be the 3 top-level domains.  However, the
docs imply an explicit ordering in the AO powers on first, then EE, then
CPU domain. (Note: this obviously implies that from code running on the
CPU, we can never fully power off the EE domain itself, only sub-domains
of EE (e.g. GPU, VPU, VDEC, MMC, etc.)

So, while there are 3 distinct rails from the PMIC, the domains are
highly dependenent and we should probably model them as hierarchical.

That being said, the kernel is not going to be (directly) controlling
the CPU domain, because PSCI will be doing that (at least until I get
some time to work on OS-initiated mode for PSCI and experiment with CPU
PM domains.)  But it's probably worth modeling that in DT anyways, just
for the sake of documentation.

>> >
>> > currently we have three drivers, which handle *some* of these power
>> > domain registers:
>> > drivers/soc/amlogic/meson-gx-pwrc-vpu.c:
>> > - partially manages HHI_MEM_PD_REG0
>> > - fully manages HHI_VPU_MEM_PD_REG{0,1,2}
>> > - partially manages AO_RTI_GEN_PWR_SLEEP0
>> >
>> > arch/arm/mach-meson/platsmp.c:
>> > - manages AO_RTI_PWR_A9_CNTL0 and P_AO_RTI_PWR_A9_CNTL1
>> > - only for the 32-bit SoCs, these registers (or their replacements)
>> > are controlled by the firmware on the 64-bit SoCs
>>
>> So, the AO_RTI_PWR_A9_CNTL* is used to power off/on the CPU, entirely.
>> If I understand correct, the AO_RTI_PWR_SYS_CPU_PD* is used to put a
>> CPU in a deeper idlestate, like CPU retention, right?
> yes, we use AO_RTI_PWR_A9_CNTL* (in arch/arm/mach-meson/platsmp.c) to
> turn on/off the CPU cores for SMP boot and CPU hotplug on the 32-bit
> SoCs
>
>> If I am correct, you need a cpuidle driver to deal with this, of course.
> so far only SMP boot and CPU hotplug are implemented for the 32-bit SoCs.
> I don't know about AO_RTI_PWR_SYS_CPU_PD* because these registers
> don't exist on the 32-bit SoCs (as far as I know)
>
>> For 64-bit SoCs, the custom FW/code is replaced by the PSCI FW?
> indeed, on the 64-bit SoCs this is managed by the PSCI firmware
>
>> >
>> > drivers/media/platform/meson/vdec/* (not upstream yet due to firmware
>> > blob licensing questions, latest patchset: [1]):
>> > - also partially manages AO_RTI_GEN_PWR_SLEEP0, AO_RTI_GEN_PWR_ISO0
>> > (the former is also partially managed by meson-gx-pwrc-vpu)
>> >
>> > To use the meson-gx-pwrc-vpu driver on the 32-bit SoCs I would have to
>> > create an "AO regmap/syscon" and pass it to that driver. However, the
>> > register layout of the "AO bus" on these older SoCs is different to
>> > what we have on the 64-bit SoCs. So having a big "AO regmap/syscon" is
>> > not easy (I also believe that it even if we could achieve it then it
>> > wouldn't be a good representation of the hardware).
>> > The video decoder driver currently requires the same "AO regmap/syscon".
>> >
>> > I would like to focus on the AO_RTI_GEN_PWR_SLEEP0,
>> > AO_RTI_GEN_PWR_ISO0 registers for now. This will make it easier to
>> > support VPU and the video decoder drivers on the 32-bit SoCs.
>> > My idea is to create a separate power domain provider which manages
>> > these registers. Each power domain is exposed with it's own ID (just
>> > like we have the CLKIDs in the clock driver) and can then be passed to
>> > the various consumer drivers.
>> > The genpd improvements in v4.19 and v4.20 make this possible as each
>> > power domain can now be managed at runtime (not just at driver probe
>> > time), see: [0]
>> >
>> > With a separate power domain provider the meson-gx-pwrc-vpu and video
>> > decoder drivers would not access the AO registers anymore. Instead we
>> > would pass all relevant power domains from the "AO power domain
>> > provider" to their respective consumers.
>>
>> Overall, this seems like a reasonable way forward.
>>
>> I guess the important point is that we model the topology of the HW
>> correctly in DT (no short cuts), as otherwise we may encounter issues
>> in the end I think.
> to get the DT part right I am thinking about the following questions:
> - which IP blocks do we have? (I mentioned four in my original mail
> where I *believe* that they are separate IP blocks, but I'm not sure)

Besides the CPUs which we should handle separately, there's only 1 IP
blocks that are managed upstream today (VPU/HDMI), so that's all you
need to worry about for compatability, IMO.

> - what are the inputs/outputs of each IP block? (example: IP block X
> uses clock Y)
> - what are the differences between the SoCs (not only the "new" 64-bit
> ones, but also the 32-bit ones)?

AFAICT, the 64-bit ones are quite similar to each other.  I haven't
looked closely at the 32-bit ones at all.

> - do we have dependencies between power domains?

We definitely do between the top-level domains (see above.)

> (like in: do we need
> to enable power domain before removing "isolation")
> - what about the "isolation" bits - how do these work with the actual
> "power domain" bits?

The "isolation" is not a separate domain and should not be modeled as
such like in your DT examples below.  It's just a step in the process.
IOW, you isolate the domain, and then power it off.  Coming back, you
power it on and then un-isolate it.

> - are the power domains just "on" or "off", or is there something in
> between (like low/medium/high power or performance)?

In general, they are on/off.

However, CPUs are a bit special here as they can have various low-power
modes, which is why (until very recently) they have been managed by the
CPUidle framework, and not the power domain framework.  So for now, I
recommend we get the domains in place for all the peripherals, and then
consider the CPU management.

> Ulf, since I'm new to this whole power-domain area: do my questions
> make sense? what am I missing?
>
> Jianxin, can you please answer Ulf's and my questions on this topic?
>
>> >
>> > Examples (incomplete) from the VPU power domain / video decoder perspective:
>> > &vpu_power_domain {
>> >   power-domains = <&ao_pwrc AO_VPU_HDMI_PD>, <&ao_pwrc AO_VPU_HDMI_ISO_PD>;
>> >   power-domain-names = "vpu_hdmi", "vpu_hdmi_iso";
>> > };

As I mentioned above, don't model the "iso" as it's own domain.  The
driver should handle the isolation bit and power bit ordering itself.

>> > &video_decoder {
>> >   power-domains = <&ao_pwrc AO_PWR_VDEC_1_PD>, <&ao_pwrc
>> > AO_ISO_VDEC_1_PD>, <&ao_pwrc AO_PWR_VDEC_HVEC_PD>, <&ao_pwrc
>> > AO_ISO_VDEC_HVEC_PD>;
>> >   power-domain-names = "vdec_1", "vdec_1_iso", "vdec_hvec", "vdec_hvec_iso";
>> > };
>> >
>> > My main concern is "backwards compatibility". We need to take care of
>> > the VPU power domain driver and the video decoder driver. The latter
>> > is not mainlined yet, so I'm not sure we need to be backwards
>> > compatible here.
>>
>> Yeah, that could be a bit troublesome, at least short term.
> indeed. the video decoder drivers are not part of mainline yet.
> This means we "only" have to consider two "power domain consumers"
> which already exist:
> - VPU power domain / VPU driver (display support)

I don't think you have to worry about backward compatability at all.
Let's just create a new power-domain driver that manages everything (in
EE) with a new compatable, and switch to it, leaving the old one for
some time before eventually removing it.

> - SMP / CPU hotplug support on the 32-bit SoCs (this currently doesn't
> use the power-domain framework but a syscon in the platsmp.c driver)

And I don't thing you should switch this to power-domain either, so I
don't think this causes any concern for the new power domain driver.

>> I think I have mentioned it before, in some thread - perhaps we should
>> add an OF helper function, which tells the caller the number of
>> power-domains that is described in the device node. That could help to
>> make the code more flexible in drivers/buses that deal with the PM
>> domain attach/detach, thus also potentially simplify to support
>> backwards compatibility, if/when that makes sense.
>>
>> >
>> > Please let me know if you have any concerns, ideas, suggestions, ...
>> > I can build an "RFC" series for this topic if this makes the discussion easier.
>>
>> It's always easier to look at code, unless there is a whiteboard available. :-)
> OK, I'll wait for additional questions you may have so Jianxin can
> provide the details we need to know about the actual hardware
> implementation.
> After that I can start an RFC series (Jianxin's input will help us to
> focus on the Linux drivers rather than having to discuss - or even
> guess - the hardware details over and over again)

I can definitely help with this too.  If you can do an RFC with the "big
picture", and proposal for the 32-bit SoCs, I can fill in all the
missing pieces for the various 64-bit SoCs.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
