Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666DEC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 15:42:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F316206B8
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 15:42:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RbR+DCRz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R39Ide2n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F316206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=atmRIj5809TZcvIlVeQHfQ3DA/ERDZNID7azYIxAGQQ=; b=RbR+DCRzX2tNS4
	LfRjqwPVayXl0KKEUF705VJphUDTvpRG8hAonF3gKtBrTqYHQpENOk5VHXMC/8viSQvF8bAjltFi/
	OplR+dcN+4aMdP59FfFHbUCNW2gxZZQbsXNrZWq0Dfel+eMXMIbEtcW/etnO64o0i2yJvBfSjip4s
	cBytD72sGWQp6WcSfHvzkG29VuXWGpo0fQgVxxqLnkzMAqL6P57cL0s5U8zhZTyRR6AfReHNHfqLi
	ZVNRl11pTBisZaxxrUTXkQKSoWqZ1sKoVJZcO/NGCDETzuqsC5sO8PHPHEXMp0jv1UfFafGCQykSh
	nJZc21DLP0yaZvqSgAsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0pjA-0002dN-NB; Mon, 04 Mar 2019 15:42:04 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0pj6-0002cv-Sa
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 15:42:02 +0000
Received: by mail-ua1-x943.google.com with SMTP id c5so4766970uaq.7
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 07:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbcfmXa7Izd55cdP3yRkxpwbLtDz3PVr3SM8og/KPlk=;
 b=R39Ide2nbfKRxfwXeWjnYxEMzoZPX6y83IBhisb3aa/vNSVtCltIftuEVrXjKp8alg
 we3hj1W7z8ar0TUBgpoc87Xi2TKx2OTJN1z6EGEt+XfyB+MFPMwj3KKgaIa476ZsaL40
 X3cOdtXctOb37roKmf8Tscl/MQDYdw5go8B+Dg6pT4r0io61vB1H5/8FzcPfxxhCvjFF
 2SwLFilDHbw4OB5i2rEgoZVtMhOeMy9S4A8qg3nQsfS7R3f1B3H5ThxUscYw0gXSIpMV
 ubI1Ol3KmNQp/VHokj4OI5AV8dd52wGCOxSHt2/TSyQ3hHr4YLcnrBd0t5Of+BB21ETS
 hJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbcfmXa7Izd55cdP3yRkxpwbLtDz3PVr3SM8og/KPlk=;
 b=KwwHJBSeiHNC8Ta3642HndSmJ66cJx6VP+jd6t0pIf6wBZX4SwBFV9lYR//WPesUYW
 8Qz81VlTFDFGYvTJHfltcdcKA6Bu3o86+ZP9+lcTvWCK1g9YVNzPo4SDztTqpOlgOz6O
 KF1iGuMRvAZIMHGEdlQRjBJGf8VZb2OEeVWNTCgNQW9wrUMzNsRrFwiTvdp1hVDU/lV+
 x5gdm3jdWEgMoPBrqM1w/zsAmDcM6MZeUCTo2hjdmSshWigCiupVMLOshUQUnelhR8Rh
 JE4+XZ32LaEsUXXoHuDprV+YiR3P2vupacnz8VK7/8Upbuewt8DEhf5Dl+V8gX8b32ID
 KKew==
X-Gm-Message-State: APjAAAVzOKbNgQrsXwrxPhxuayfNKNhhUFNtax1aw+PDwPsSwAXd5P6B
 puxaWl1lbaNTQbT9BeNs4WxMqpp/nj4SxuNTH/GlbtcRDEk=
X-Google-Smtp-Source: APXvYqylDNXGCxFlzKV9oRdUQSXuDsLpWDCxwiIlHUYGnnm0C446cIbyPcdnIXuHNe8TtjUfuRLCJSnYK+Ga4irb51U=
X-Received: by 2002:ab0:6016:: with SMTP id j22mr9564856ual.119.1551714118828; 
 Mon, 04 Mar 2019 07:41:58 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCD6gWS0RiJc=secdFDBM329PKxSiGejo1wSQ6Pwe6ynJw@mail.gmail.com>
In-Reply-To: <CAFBinCD6gWS0RiJc=secdFDBM329PKxSiGejo1wSQ6Pwe6ynJw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 4 Mar 2019 16:41:22 +0100
Message-ID: <CAPDyKFp0U1E3rbWfuxmtokpF015a+fmorQoLAYCR7euJBB9u2g@mail.gmail.com>
Subject: Re: Power Domains on Amlogic SoCs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_074200_935413_5C3D5E72 
X-CRM114-Status: GOOD (  27.83  )
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
Cc: mjourdan@baylibre.com, Linux PM <linux-pm@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 1 Mar 2019 at 23:30, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hello,
>
> I would like to start a discussion how to structure the power domain
> drivers for the Amlogic SoCs.
> My main motivation is getting video output and video decoders working
> on the 32-bit SoCs.
>
> The Amlogic SoCs we various registers for "power domains", the ones I
> know (in no specific order):
> 1. HHI_MEM_PD_REG0 (contains: HDMI memory PD, Ethernet memory PD,
> audio DSP memory PD - at least on the 32-bit SoCs)
> 2. HHI_VPU_MEM_PD_REG{0,1,2} (contains: various VPU related power domains)
> 3. AO_RTI_GEN_PWR_SLEEP0, AO_RTI_GEN_PWR_ISO0 (contains: HDMI PD, HDMI
> isolation, video codec PDs, video code isolation, ...)
> 4. AO_RTI_PWR_A9_CNTL0/AO_RTI_PWR_SYS_CPU_PD0,
> P_AO_RTI_PWR_A9_CNTL1/AO_RTI_PWR_SYS_CPU_PD1 (contains: CPU core
> related power bits)

It would be nice to know a bit more about if/how the hierarchical PM
domain topology looks like. Do you have this information?

>
> currently we have three drivers, which handle *some* of these power
> domain registers:
> drivers/soc/amlogic/meson-gx-pwrc-vpu.c:
> - partially manages HHI_MEM_PD_REG0
> - fully manages HHI_VPU_MEM_PD_REG{0,1,2}
> - partially manages AO_RTI_GEN_PWR_SLEEP0
>
> arch/arm/mach-meson/platsmp.c:
> - manages AO_RTI_PWR_A9_CNTL0 and P_AO_RTI_PWR_A9_CNTL1
> - only for the 32-bit SoCs, these registers (or their replacements)
> are controlled by the firmware on the 64-bit SoCs

So, the AO_RTI_PWR_A9_CNTL* is used to power off/on the CPU, entirely.
If I understand correct, the AO_RTI_PWR_SYS_CPU_PD* is used to put a
CPU in a deeper idlestate, like CPU retention, right?

If I am correct, you need a cpuidle driver to deal with this, of course.

For 64-bit SoCs, the custom FW/code is replaced by the PSCI FW?

>
> drivers/media/platform/meson/vdec/* (not upstream yet due to firmware
> blob licensing questions, latest patchset: [1]):
> - also partially manages AO_RTI_GEN_PWR_SLEEP0, AO_RTI_GEN_PWR_ISO0
> (the former is also partially managed by meson-gx-pwrc-vpu)
>
> To use the meson-gx-pwrc-vpu driver on the 32-bit SoCs I would have to
> create an "AO regmap/syscon" and pass it to that driver. However, the
> register layout of the "AO bus" on these older SoCs is different to
> what we have on the 64-bit SoCs. So having a big "AO regmap/syscon" is
> not easy (I also believe that it even if we could achieve it then it
> wouldn't be a good representation of the hardware).
> The video decoder driver currently requires the same "AO regmap/syscon".
>
> I would like to focus on the AO_RTI_GEN_PWR_SLEEP0,
> AO_RTI_GEN_PWR_ISO0 registers for now. This will make it easier to
> support VPU and the video decoder drivers on the 32-bit SoCs.
> My idea is to create a separate power domain provider which manages
> these registers. Each power domain is exposed with it's own ID (just
> like we have the CLKIDs in the clock driver) and can then be passed to
> the various consumer drivers.
> The genpd improvements in v4.19 and v4.20 make this possible as each
> power domain can now be managed at runtime (not just at driver probe
> time), see: [0]
>
> With a separate power domain provider the meson-gx-pwrc-vpu and video
> decoder drivers would not access the AO registers anymore. Instead we
> would pass all relevant power domains from the "AO power domain
> provider" to their respective consumers.

Overall, this seems like a reasonable way forward.

I guess the important point is that we model the topology of the HW
correctly in DT (no short cuts), as otherwise we may encounter issues
in the end I think.

>
> Examples (incomplete) from the VPU power domain / video decoder perspective:
> &vpu_power_domain {
>   power-domains = <&ao_pwrc AO_VPU_HDMI_PD>, <&ao_pwrc AO_VPU_HDMI_ISO_PD>;
>   power-domain-names = "vpu_hdmi", "vpu_hdmi_iso";
> };
>
> &video_decoder {
>   power-domains = <&ao_pwrc AO_PWR_VDEC_1_PD>, <&ao_pwrc
> AO_ISO_VDEC_1_PD>, <&ao_pwrc AO_PWR_VDEC_HVEC_PD>, <&ao_pwrc
> AO_ISO_VDEC_HVEC_PD>;
>   power-domain-names = "vdec_1", "vdec_1_iso", "vdec_hvec", "vdec_hvec_iso";
> };
>
> My main concern is "backwards compatibility". We need to take care of
> the VPU power domain driver and the video decoder driver. The latter
> is not mainlined yet, so I'm not sure we need to be backwards
> compatible here.

Yeah, that could be a bit troublesome, at least short term.

I think I have mentioned it before, in some thread - perhaps we should
add an OF helper function, which tells the caller the number of
power-domains that is described in the device node. That could help to
make the code more flexible in drivers/buses that deal with the PM
domain attach/detach, thus also potentially simplify to support
backwards compatibility, if/when that makes sense.

>
> Please let me know if you have any concerns, ideas, suggestions, ...
> I can build an "RFC" series for this topic if this makes the discussion easier.

It's always easier to look at code, unless there is a whiteboard available. :-)

If you keep me cced, I do my best to review it!

>
>
> Regards
> Martin
>
>
> [0] https://linuxplumbersconf.org/event/2/contributions/130/attachments/138/170/Genpd-Improvements.pdf
> [1] https://patchwork.kernel.org/patch/10669873/

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
