Return-Path: <SRS0=o/5p=RE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EB9C43381
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 22:30:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 777592083E
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Mar 2019 22:30:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXFgFJxF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JKR9Aw60"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 777592083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sls0W0r0RE7CMJkMBvZuLX+2nbIyPJzIswKr6z8QuzI=; b=iXFgFJxFlRQU53
	sEE7rLPTWeBwncRCYo2RfdPIydscRLmrDUOUikq7DVo+JKlQuDXqE7qq2/OG3Ct9t103Adt5qHK3/
	UjOs4HDMdilMv5NdBEAvysPvV/SBBZuNvbir3d2EUJKX107v2YURfIS5Nf5ocs3Sda0z8ZF7NTOkO
	0AGdTYyhZiM+5avqKiIaf93RT/e3oMnqoOfIu1rV2lQP/y2RNjEYNi6Wa9ffF23WevzfMWSQPOfck
	WW1TPdVd4KmHPNHmcSg+FPGAMKbliJLVaPmBGHtAeV6hy/D1mqzrwPDN8hDJf/BuO6yAnwWsjoJJZ
	QqWK7MQFnHE/KKDl0X2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzqfd-0004Nb-SW; Fri, 01 Mar 2019 22:30:21 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzqfa-0004N9-Hk
 for linux-amlogic@lists.infradead.org; Fri, 01 Mar 2019 22:30:20 +0000
Received: by mail-oi1-x242.google.com with SMTP id w66so20814898oia.4
 for <linux-amlogic@lists.infradead.org>; Fri, 01 Mar 2019 14:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=wxBGfNNYhmcBuZuw+YQQIgZG/+pe/rmswvlOAQiwEW4=;
 b=JKR9Aw608h2x+geERZiPC0ljH20YrGBBFQ3rXamioiB4tyIng8lZB0ALZHSXqkXIeZ
 k9jbDlFjbGf4p7+PSqyjLyzbR2LjW7VEGtyy/rzzAlxHep6noTTPTO03MZ42h61s9coJ
 O75SUqQrAHVb/iZ4ldMIFpIwiGbQnElC+Bbdqr2ni6SEHn4Q0VnDcoCN4ClCipnnDuVr
 MxxanlHKlVqD63CaoRz+8HYZGA3SE4IkmUSUywWguPogLOTVC/S/A4H9bqbXOk7Df8R5
 XplH+5JW5BZR+7cDrWdJ+XcBkgOFE8gWQluZ5+mHQVNhyFVlaPTYBWwQDBWnxm5HOpwk
 7XEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=wxBGfNNYhmcBuZuw+YQQIgZG/+pe/rmswvlOAQiwEW4=;
 b=GsvmhQ49Q9frPa4ifxNkNtzg6DKU02SrN3ofLAEbZ1NcsV20VHeGloq4iBVrKo4A0k
 6k5AFGAuPo02fycoN5aHASwi5LsG5JGUhJ+TmyOWyZajHvvIySB04p8IyCols53uJNro
 fouHfVVoOEgPNuD5zI6JhvcTGc1D8bb/zMzhyBepUDJO7u07dIlQxnOdWrLcHaQmxKkd
 VmptVRXicI0clyHdtzpmJrHzu70ljDRLJYwiWxp3oMme3n+7EYLKJcBMCY4Hj0D8x3+b
 6f+RcOo63apNUeDIakocuMbkQc9n8QPNnVz6w5fFfV3XO25h5aiwP5jPy+5N4u+g6LXf
 Xf+g==
X-Gm-Message-State: AHQUAub8K5e96BYrIEDkZuRwLYzAKAoNlIjhB6dWiLcX1K8AU2gx8raI
 OHer4Cjy68DSWHfkroHt0Z5HOZkuApNwjbk6C3tv8rp+
X-Google-Smtp-Source: AHgI3IZHmk12W3XZlxq8im9CbLIoyZlAvRiyh8kyW0x22jU8A/9xrexwRjZ51O0fAqoNfG1dPPmIBIsoEblGhuc3DN8=
X-Received: by 2002:aca:aacb:: with SMTP id t194mr4879512oie.129.1551479416627; 
 Fri, 01 Mar 2019 14:30:16 -0800 (PST)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 1 Mar 2019 23:30:05 +0100
Message-ID: <CAFBinCD6gWS0RiJc=secdFDBM329PKxSiGejo1wSQ6Pwe6ynJw@mail.gmail.com>
Subject: Power Domains on Amlogic SoCs
To: Neil Armstrong <narmstrong@baylibre.com>, mjourdan@baylibre.com, 
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_143018_614265_C056D0E2 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: ulf.hansson@linaro.org, khilman@kernel.org, rjw@rjwysocki.net,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

I would like to start a discussion how to structure the power domain
drivers for the Amlogic SoCs.
My main motivation is getting video output and video decoders working
on the 32-bit SoCs.

The Amlogic SoCs we various registers for "power domains", the ones I
know (in no specific order):
1. HHI_MEM_PD_REG0 (contains: HDMI memory PD, Ethernet memory PD,
audio DSP memory PD - at least on the 32-bit SoCs)
2. HHI_VPU_MEM_PD_REG{0,1,2} (contains: various VPU related power domains)
3. AO_RTI_GEN_PWR_SLEEP0, AO_RTI_GEN_PWR_ISO0 (contains: HDMI PD, HDMI
isolation, video codec PDs, video code isolation, ...)
4. AO_RTI_PWR_A9_CNTL0/AO_RTI_PWR_SYS_CPU_PD0,
P_AO_RTI_PWR_A9_CNTL1/AO_RTI_PWR_SYS_CPU_PD1 (contains: CPU core
related power bits)

currently we have three drivers, which handle *some* of these power
domain registers:
drivers/soc/amlogic/meson-gx-pwrc-vpu.c:
- partially manages HHI_MEM_PD_REG0
- fully manages HHI_VPU_MEM_PD_REG{0,1,2}
- partially manages AO_RTI_GEN_PWR_SLEEP0

arch/arm/mach-meson/platsmp.c:
- manages AO_RTI_PWR_A9_CNTL0 and P_AO_RTI_PWR_A9_CNTL1
- only for the 32-bit SoCs, these registers (or their replacements)
are controlled by the firmware on the 64-bit SoCs

drivers/media/platform/meson/vdec/* (not upstream yet due to firmware
blob licensing questions, latest patchset: [1]):
- also partially manages AO_RTI_GEN_PWR_SLEEP0, AO_RTI_GEN_PWR_ISO0
(the former is also partially managed by meson-gx-pwrc-vpu)

To use the meson-gx-pwrc-vpu driver on the 32-bit SoCs I would have to
create an "AO regmap/syscon" and pass it to that driver. However, the
register layout of the "AO bus" on these older SoCs is different to
what we have on the 64-bit SoCs. So having a big "AO regmap/syscon" is
not easy (I also believe that it even if we could achieve it then it
wouldn't be a good representation of the hardware).
The video decoder driver currently requires the same "AO regmap/syscon".

I would like to focus on the AO_RTI_GEN_PWR_SLEEP0,
AO_RTI_GEN_PWR_ISO0 registers for now. This will make it easier to
support VPU and the video decoder drivers on the 32-bit SoCs.
My idea is to create a separate power domain provider which manages
these registers. Each power domain is exposed with it's own ID (just
like we have the CLKIDs in the clock driver) and can then be passed to
the various consumer drivers.
The genpd improvements in v4.19 and v4.20 make this possible as each
power domain can now be managed at runtime (not just at driver probe
time), see: [0]

With a separate power domain provider the meson-gx-pwrc-vpu and video
decoder drivers would not access the AO registers anymore. Instead we
would pass all relevant power domains from the "AO power domain
provider" to their respective consumers.

Examples (incomplete) from the VPU power domain / video decoder perspective:
&vpu_power_domain {
  power-domains = <&ao_pwrc AO_VPU_HDMI_PD>, <&ao_pwrc AO_VPU_HDMI_ISO_PD>;
  power-domain-names = "vpu_hdmi", "vpu_hdmi_iso";
};

&video_decoder {
  power-domains = <&ao_pwrc AO_PWR_VDEC_1_PD>, <&ao_pwrc
AO_ISO_VDEC_1_PD>, <&ao_pwrc AO_PWR_VDEC_HVEC_PD>, <&ao_pwrc
AO_ISO_VDEC_HVEC_PD>;
  power-domain-names = "vdec_1", "vdec_1_iso", "vdec_hvec", "vdec_hvec_iso";
};

My main concern is "backwards compatibility". We need to take care of
the VPU power domain driver and the video decoder driver. The latter
is not mainlined yet, so I'm not sure we need to be backwards
compatible here.

Please let me know if you have any concerns, ideas, suggestions, ...
I can build an "RFC" series for this topic if this makes the discussion easier.


Regards
Martin


[0] https://linuxplumbersconf.org/event/2/contributions/130/attachments/138/170/Genpd-Improvements.pdf
[1] https://patchwork.kernel.org/patch/10669873/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
