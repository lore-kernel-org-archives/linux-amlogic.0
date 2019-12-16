Return-Path: <SRS0=UcGz=2G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B40C43603
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 08:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7024B206D3
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 08:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OPtmHv9x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Mspx/K+Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7024B206D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8IZq/izwiaHFwBhGTAiTxL0ULXHQSJ/3BbfTROjMFmo=; b=OPtmHv9x9l7aqBPa4hUEtgM2Dx
	YWB2av83Bi1oHMWljOpOSO0IbWBY+Kspsm+n88zK4qQsk2lZFxSAlibvVmrNgebDHyVZremb5LWal
	Wq1hZERuD1npLMqnPEhE0TsLS3xzaFsQHWZs/eoisTbcibcpVIxjgDgYcHqc+glosVQybuuCJQG2t
	WrbZ1RtBMQ7ROllP4XzCLQ3BEQ3h3pA1QrtCybjqdJ2t5WisERlnJSxbLi2ss3NB0xxqNw8ec1lPI
	6MRYmP/o0cM1L3H1LT3Ri4AhGU79aHuHwEX2DCXjJsuiQvQJWw5hYr92zdUeA10+jNBo81KxIYnyo
	XCAv3dpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igm3S-0004s5-EW; Mon, 16 Dec 2019 08:48:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igm2Z-0004Bp-GK
 for linux-amlogic@lists.infradead.org; Mon, 16 Dec 2019 08:47:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id q6so6145328wro.9
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Dec 2019 00:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=UCb1aLRLTzlVhWNMjZXZKGwuML6x7jOTgc2nDzZf58E=;
 b=Mspx/K+QfHmNRZPHL6k5AJMceeZwtVPDzqXbxtrPfcHZCmPaxeuVIFSA4Rgd3YhD76
 fT1t/dd8PunfVmAPihW8z0V8ypiLOnVwMbhLN4+gap6qinf7YXJvcPpIeGJRt3jqvGMP
 3L8w5kf1WLsdAvw1jjEl1qSFmI63h9J4n93J7R3Y0Qvg/KFDNSb2eFhUeaKcTUaB1jsa
 zEIaqTjvq2F8nfDEBLolbmA+4K+N1iHBaF7kroMNF6OpMRIEiSp934EJ5jmxrXlU4ZUS
 D9xcCyfF7GBak9VY4qWm+AmbxpIupPIY1r/KSd43sD5ioVrT3JoOFBgx4Zsazft7dbYf
 dssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=UCb1aLRLTzlVhWNMjZXZKGwuML6x7jOTgc2nDzZf58E=;
 b=ZYYwwqeOo5DzK0EIbDW/3zRzA5kb8Bpid6k2vRpwCzEpokFGStVNRAECl2582BjcrN
 pKw5xWlIw/9ca0z/5yf7RsXR74r7yzrgUCh5uw3NNeMdFKs14cIIA2HEtM/cOA7iEWY5
 n4XdDmcbbp75KxYxWpGkLU+BmrzMVrAkrKsTb6l4NB8b0DDxetxMWDbjvwCd5QshWrU+
 hmGY1LFCnaGKcp+Sg1+MqlZDElsHkFP8SLxnbwqOgneNUD3J78ZD07O1VRMyrq6CvjAB
 H3jHIX71Mz2tm9rgeR6RpmmIhWYumBEfUPwsaMCnQxCdJQfHzHxkcxRse+KGcXAp0vej
 gwNA==
X-Gm-Message-State: APjAAAV+u5vM4MJ9Qm4z+fCp4oDyhv4rMtB/2TtgctQFTFadGMfVmd+z
 wtwvHrMK4CI3hO44iJjLJ90G5g==
X-Google-Smtp-Source: APXvYqyLnlEaVpkiF1HI78n8G1vzJZongnJIMYz+ifesrg0LxQphKWK8bFoJHiH4Wxje2YoxtG06rw==
X-Received: by 2002:adf:fc03:: with SMTP id i3mr29498932wrr.306.1576486061156; 
 Mon, 16 Dec 2019 00:47:41 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id z18sm19958406wmf.21.2019.12.16.00.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 00:47:40 -0800 (PST)
References: <20191208210320.15539-1-repk@triplefau.lt>
 <1jpngxew6l.fsf@starbuckisacylon.baylibre.com>
 <20191215113634.GB7304@voidbox>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH 0/2] PCI: amlogic: Make PCIe working reliably on AXG
 platforms
In-reply-to: <20191215113634.GB7304@voidbox>
Date: Mon, 16 Dec 2019 09:47:39 +0100
Message-ID: <1jsglkbqs4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_004743_649910_B6C8B7FE 
X-CRM114-Status: GOOD (  21.51  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 15 Dec 2019 at 12:36, Remi Pommarel <repk@triplefau.lt> wrote:

> On Mon, Dec 09, 2019 at 09:32:18AM +0100, Jerome Brunet wrote:
>> 
>> On Sun 08 Dec 2019 at 22:03, Remi Pommarel <repk@triplefau.lt> wrote:
>> 
>> > PCIe device probing failures have been seen on some AXG platforms and were
>> > due to unreliable clock signal output. Setting HHI_MIPI_CNTL0[26] bit
>> > solved the problem. After being contacted about this, vendor reported that
>> > this bit was linked to PCIe PLL CML output.
>> 
>> Thanks for reporting the problem.
>> 
>> As Martin pointed out, the CML outputs already exist in the AXG clock
>> controller but are handled using HHI_PCIE_PLL_CNTL6. Although
>> incomplete, it seems to be aligned with the datasheet I have (v0.9)
>> 
>> According to the same document, HHI_MIPI_CNTL0 belong to the MIPI Phy.
>> Unfortunately bit 26 is not documented
>> 
>> AFAICT, the clock controller is not appropriate driver to deal with this
>> register/bit
>> 
>
> Regarding both @Martin's and your remark.
>
> Unfortunately the documentation I have and vendor feedback are a bit
> vague to me. I do agree that CLKID_PCIE_PLL_CML_ENABLE is not a proper
> name for this bit because this register is MIPI related.
>
> Here is the information I got from the vendor [1]. As you can see
> HHI_MIPI_CNTL0[29] and HHI_MIPI_CNTL0[26] are related together, and
> HHI_MIPI_CNTL0[29] is implemented in the clock controller as
> axg_mipi_enable which is why I used this driver for HHI_MIPI_CNTL0[26].
>

Seems I should have paid more attention when axg_mipi_enable.
Bit 29 is yet another undocumented bit

> So maybe I could rename this bit to something MIPI related ?

This register region is simply not part of the main clock
controller. The bits in it are not related to this controller but the
MIPI PHY. It should not have been mapped in this way to begin with.

I can see how it would be convient to model this with a gate to just
flip the bit when needed but it is just wrong.

The documentation says the register are for the MIPI analog PHY, it
should be implemented as such and used by the PCIe as needed.

Of course, fixing this (remapping the region and removing
axg_mipi_enable) will be a bit messy. If you want to make that MIPI Phy
driver, I can help you with the clock part.

>
>> >
>> > This serie adds a way to set this bit through AXG clock gating logic.
>> > Platforms having this kind of issue could make use of this gating by
>> > applying a patch to their devicetree similar to:
>> >
>> >                 clocks = <&clkc CLKID_USB
>> >                         &clkc CLKID_MIPI_ENABLE
>> >                         &clkc CLKID_PCIE_A
>> > -                       &clkc CLKID_PCIE_CML_EN0>;
>> > +                       &clkc CLKID_PCIE_CML_EN0
>> > +                       &clkc CLKID_PCIE_PLL_CML_ENABLE>;
>> >                 clock-names = "pcie_general",
>> >                                 "pcie_mipi_en",
>> >                                 "pcie",
>> > -                               "port";
>> > +                               "port",
>> > +                               "pll_cml_en";
>> >                 resets = <&reset RESET_PCIE_PHY>,
>> >                         <&reset RESET_PCIE_A>,
>> >                         <&reset RESET_PCIE_APB>;
>> 
>> A few remarks for your future patches:
>> 
>> * You need to document any need binding you introduce:
>>   It means that there should have been a patch in
>>   Documentation/devicetree/... before using your newclock name in the
>>   pcie driver. As Martin pointed out, dt-bindings should be dealt with
>>   in their own patches
>> 
>> >
>> >
>> > Remi Pommarel (2):
>> >   clk: meson: axg: add pcie pll cml gating
>> 
>> Whenever possible, patches intended for different maintainers should be
>> sent separately (different series)
>
> Thanks, will do both of the above remarks.
>
>> 
>> >   PCI: amlogic: Use PCIe pll gate when available
>> >
>> >  drivers/clk/meson/axg.c                | 3 +++
>> >  drivers/clk/meson/axg.h                | 2 +-
>> >  drivers/pci/controller/dwc/pci-meson.c | 5 +++++
>> >  include/dt-bindings/clock/axg-clkc.h   | 1 +
>> >  4 files changed, 10 insertions(+), 1 deletion(-)
>> 
>
> Thanks for reviewing this.
>
> [1] https://i.snipboard.io/bHMPeq.jpg


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
