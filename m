Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1777C433E3
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 17:14:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8455A20748
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 17:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CaLG1Bwv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="qCziGrqP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8455A20748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j7FG/vzTr5bLTe/h41cbdlx1aszEH/fxwEHimUBjPYY=; b=CaLG1BwvoIkR8nNb7VJ6pHhPj
	CDD2OTx8qtX1Y1qqoeAqiI42lyoWQdrRQizQxPgCS4SXzENo4aYdYlZiydh/yD8rfHqZuEDsOFPo0
	hGyezgvdvi5OjD7eaHtCSF6yZYtmwUFmjLZE9QulJSVmHw9nHS4bhJ7So81zPW/bHysodhHYXC8x2
	C/cM7mk5D4AjbJONhpkp0gS2TMvsd4vnbdeC2qd+m5Q2EkNwqfxnFjUEamJnO8ifT4x5U/Itzp3Tk
	P6FV9xNP9KQVatUYjU5B6LMIEkqjqfHOwjdYw5rKFFLS2YDF/VNpNaFPC5jgEAZQxctUkgIzy+Wnd
	NgC2GajmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9Acq-0006zo-Uw; Fri, 21 Aug 2020 17:14:48 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9Acn-0006yI-Gu
 for linux-amlogic@lists.infradead.org; Fri, 21 Aug 2020 17:14:46 +0000
Received: by mail-il1-x141.google.com with SMTP id f12so2009909ils.6
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2020 10:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RTvsFOhGC05ImvCGxAXHe80DLl0Vnoh8uhjw9uG61SY=;
 b=qCziGrqPDSVtOLmbK1hFmaPBOq+huaVij1yQ263tMaWZonY5TWfaBxMerhZMu5VEP3
 RoPEPwzz/xcjuV+sZCG1Saoia1u3YKqx63vETf1XPu5IrA200TfHKvEGxaOTNHo5W+mG
 tCpVqh73Ai1QJJiviJSfv/he9dZ0cRwKhv0cdp7vo+LbX6FHoujL6bkQB7Qzicv6p2hE
 x4koMTN4PnrpDrX8npHVGmmmPy8pj+MUkr0jW05+KtnOLdeBNgPBu3vwKyD3t1KNEL7u
 BWwPpeGGTD5KgVYO5yUReKtkMR1+S+ZD4oeEDFdPiKx6JydchJQlt24N3BzYvr5uqc7g
 MsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RTvsFOhGC05ImvCGxAXHe80DLl0Vnoh8uhjw9uG61SY=;
 b=tiePa6+RDNlFGIWBsIxB5WaL9AEB+d8jWWc7pvFYItCJfJuSmjCnctf0sPI6OueuMD
 D/BUpo+KKOKk00TGQDM0H3bsg1mGMP7LfzadiZqm0cv0uLlAikK/b3gO6XI74IUAWCrh
 dr19zt+ZwgcLYiSlbLVSTJr1iE77flC5lBYiZtP6Wu86elhrJco5+9AnjJqF+NgMSxsH
 PmGKKrF7CvF3No2L08GFDnFjVaoyTP2zRJ18/sJhiiOfLF/yLfxSv/HMdCYU5URO1B6Z
 gsCX4iWWXug+iKjQNTp77AJ4RRcZukx+9c0jRxo9nTlkyiE/ozWTrfuaYZ+sPJdSeb4D
 u/ZQ==
X-Gm-Message-State: AOAM530N2uDBwB5vlFJ8w53uUeIh/lnGvJc5NjdAQNfGeqkN9IevhwZr
 eY1sDR1TpK2gDJKaMWPKuMs5nI4pp4RFNNjDTatCaQ==
X-Google-Smtp-Source: ABdhPJzBtpIobytboUBjp0jMvWUO7qPOEborYgyUfFC+VcbkdjoC05hgYoAhDbvXVVliplquim8DuARZHvyU0DBp/us=
X-Received: by 2002:a92:5209:: with SMTP id g9mr3383963ilb.72.1598030083248;
 Fri, 21 Aug 2020 10:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200819221750.2055932-1-robh@kernel.org>
 <20200821011237.GA4527@lx2k>
 <CAL_JsqLfzDMJXDdqtVBYWrvuB8kBDHECWmNkS5EJStiwSFtp-g@mail.gmail.com>
In-Reply-To: <CAL_JsqLfzDMJXDdqtVBYWrvuB8kBDHECWmNkS5EJStiwSFtp-g@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 21 Aug 2020 10:14:31 -0700
Message-ID: <CAOesGMhFGTZddCdusgfcUjfTP847am+F8jTAWrqYXjq1PLXxag@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: Reformat PCI ranges/dma-ranges entries
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_131445_618059_B65B5B98 
X-CRM114-Status: GOOD (  24.54  )
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
List-Id: <soc.lore.kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>, Wei Xu <xuwei5@hisilicon.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 DTML <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, SoC Team <soc@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Li Yang <leoyang.li@nxp.com>,
 Tero Kristo <t-kristo@ti.com>, Robert Richter <rrichter@marvell.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Aug 21, 2020 at 9:14 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Aug 20, 2020 at 8:53 PM Olof Johansson <olof@lixom.net> wrote:
> >
> > On Wed, Aug 19, 2020 at 04:17:50PM -0600, Rob Herring wrote:
> > > While bracketing doesn't matter for a DTB, the DT schema checks rely on
> > > bracketing around each distinct entry. Reformat ranges and dma-ranges
> > > entries to fix warnings such as:
> > >
> > > arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: [[2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576]] is not valid under any of the given schemas (Possible causes of the failure):
> > >         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges: True was expected
> > >         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0: [2197815296, 0, 4194304000, 0, 4194304000, 0, 31457280, 2164260864, 0, 4225761280, 0, 4225761280, 0, 1048576] is too long
> > >         arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml: pcie@f8000000: ranges:0:0: 2197815296 is not one of [16777216, 33554432, 50331648, 1107296256, 1124073472]
> >
> > Seems like a bug in your tool? Why would we bother with this churn?
>
> It's a feature. :)

The feature is better linting of ranges, the new lack of being able to
do that for the way we've always been allowed to write ranges is a
bug.

> In this case, with the entries bracketed, we can check the PCI top
> address cell contents in the common PCI schema and check how many
> ranges entries in the specific bridge schemas if they have some
> constraints. The use of bracketing is useful to defining the number of
> entries not just for ranges, but everywhere. A device binding defines
> how many register regions or interrupts for example. It makes sense to
> delineate entries in some way. While yes, we have #.*-cells, there's
> not really any way to handle that in json-schema. And let's face it,
> #.*-cells is an odd construct.
>
> Currently, the dtc dts->yaml output maintains all this formatting. I
> suppose we could change that such that we parse #.*-cells and define
> the boundaries based on them. But then dtc has to know about every
> case of #.*-cells. That's not impossible to do, but doesn't keep the
> tool and binding data separate.

That's already the case, isn't it? Run that part of the check if you
have a new enough dtc, otherwise warn that it's too old but do all the
other checks.

It's also just a change in one place: the tool, instead of evolving
the language by adding ad-hoc restrictions that the compiler doesn't
even know about, and requiring old code to change.

This way DTC could even warn/recommend bracketing per cell, when you
give it the ability to parse/handle it.

> Looking at it another way, do we really want to just allow anything? A
> device with 3 interrupts could be written as:
>
> interrupts = <1>, <2>, <3>;
> interrupts = <1 2 3>;
> interrupts = <1>, <2 3>;
> interrupts = [ 00 00 00 01 00 00 00 02 00 00 00 03 ];
>
> Or can we have some coding standards that are no more onerous or
> pedantic than what we have everywhere else?

We're generally quite careful about applying new restrictions and
expectations on coding standards all across the tree, and when we add
new ones we usually don't require legacy code to change overnight,
only when there are other relevant changes to those files.


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
