Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511C9C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 19:31:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E1D120859
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 19:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="od/rKoOd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="u1f7OpyJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E1D120859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yecLwXfM//fmo983XrFUnqY236OBBN2CyNlXA1MRYag=; b=od/rKoOdqWJ/jn
	gMjMyEPz5pvvLQ2dmKNJ/ERyHL/3O/AUUmTM/9SacGgYTaKfCEpjS7Sg7bfUjsWKa41BcFML6NI9G
	aHucviZ9tjKberv/vwaYi9o5X6A+BoSnvuatbGJdeDaoXvi60WzYa4XgsrRNSTE67Yo2NRyAhZn0u
	lOCKwBUBuo1DW8jzPe8aGSBsMAnRURQ5Tp2CdqzC/xx0LAb9K8+dFCxNR4y9KP7OVN9+Zj5WlnTtt
	NKS1P160auio+2v4E3735CkzzBakWScEL0tWCYyPCZ16PslF5agIv12l7LL50030HEpAEUifJHfHq
	bS72fuVfNt5rEZYfUBUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkDO7-0002Gk-25; Thu, 17 Jan 2019 19:31:39 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkDO3-0002Fw-SI
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 19:31:37 +0000
Received: by mail-oi1-x243.google.com with SMTP id i6so7096015oia.6
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WPiKxAsqViOka5al7bPffF5qlXbjgAKnpAeml+B0w3g=;
 b=u1f7OpyJbnr59QVGAIwHouOJwBtVaKjRp+hk+Wv5Ec54epZnUL+R54In3pDJMGaiMn
 QAsiPdxBm8WAoPLkmmqa3UlVLaprI/f0n2tEfUVKiTANV2T7RpLCOeDGDk8eIb9XuUP2
 3HnE2GWPiDfZwNx9JFT9tDd3MBzz/mi6iSLZZOIO+agyl1rtUINw9MClO37OazgD2p9L
 hj7GXE/b52/q5MuOzJpnBK+DCpPIWzapnrFQhRoBo/spTOKCDED/XhaNg721K2DGqJN9
 DSAjGQmaTiGZ/ujaKNs8EghnCzDM0N9P0jM+s55/fgJotCiyG1VnW8nOFdMbOiTuR/Ka
 8JoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WPiKxAsqViOka5al7bPffF5qlXbjgAKnpAeml+B0w3g=;
 b=gyJgouHo1R9gIPFL/bHJHodOVt/Ao6gxsg58rqj9oCqKFpPful6uKEuonfP6swJO1P
 jHNvOziebVmXgC2BhkADQ8E7aFeR8uOn+6YOqmg+JpdzhTvGEyuEXnKFsgIFuyJB7XKU
 svvOENQGyB0e+Xmqj9bAPamP03Zg+FWFHdPjhZw084uqrRZBETtMD4GAG1JFoTlNIbl8
 Ab9zZ3cABr7CBUoe81MT86ph8dpuf0EJnN+sccJ72scwSaVae7qZ7SJ/uImiJMrme306
 cdj0ZigrMlAqakNLGLN+Fdt/rz+dA4waRn4ejfr7odLGr8FV8DGbHaEmahY+aNMGd1K4
 PMJA==
X-Gm-Message-State: AJcUukf3bvajdhfNev1426aJSCPIvAFlFZAKVWM470ioLzvAKJ7qDVq2
 2ThXJhZxEXPRW/0Mp1yejj9s0tMYmF+EQU1MDHM4Gg==
X-Google-Smtp-Source: ALg8bN4WKVDYuQlVLhDdco5RGZUyqNHyxIJjjpcj5lidO0QT8N4meb9MB8KM1KPf365dhI3dGr9sabL+/+yGhj1UZiY=
X-Received: by 2002:aca:720a:: with SMTP id p10mr645392oic.169.1547753494203; 
 Thu, 17 Jan 2019 11:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20171110084650.31325-1-yixun.lan@amlogic.com>
 <alpine.DEB.2.21.1811121115520.14703@nanos.tec.linutronix.de>
 <alpine.DEB.2.21.1901161112090.1655@nanos.tec.linutronix.de>
 <7hbm4fccb1.fsf@baylibre.com>
In-Reply-To: <7hbm4fccb1.fsf@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
Date: Thu, 17 Jan 2019 11:31:23 -0800
Message-ID: <CAOi56cV2j-ZKuJHLO3+1MArSJjXKLJm4c4zFE4xLzMq3UR_iYQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add bindings for the Meson-AXG
 SoC Reset Controller
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_113135_927034_E11D9C8F 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Carlo Caione <carlo@caione.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Jan 17, 2019 at 11:29 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> [ + Jianxin since Yixun is no longer at Amlogic ]
>
> Thomas Gleixner <tglx@linutronix.de> writes:
>
> > On Mon, 12 Nov 2018, Thomas Gleixner wrote:
> >
> > Gentle ping.
> >
> >> Yixun,
> >>
> >> On Fri, 10 Nov 2017, Yixun Lan wrote:
> >>
> >> > +/*
> >> > + *
> >> > + * Copyright (c) 2016 BayLibre, SAS.
> >> > + * Author: Neil Armstrong <narmstrong@baylibre.com>
> >> > + *
> >> > + * Copyright (c) 2017 Amlogic, inc.
> >> > + * Author: Yixun Lan <yixun.lan@amlogic.com>
> >> > + *
> >> > + * SPDX-License-Identifier: (GPL-2.0+ OR BSD)
> >>
> >> There are two things wrong:
> >>
> >>   1) The placement. See Documentation/process/license-rules.rst
> >>
> >>   2) BSD is not a valid license id. You really have to decide which BSD
> >>      variant to use.
> >>
> >> Please get that fixed as especially #2 is broken. The goal of using SPDX is
> >> to provide reliable license information for compliance tools.
> >
> > This still is broken:
> >
> > # scripts/spdxcheck.py include/dt-bindings/
> > include/dt-bindings/reset/amlogic,meson-axg-reset.h: 9:41 Invalid License ID: BSD
>
> Jianxin, can you fix this and clarify which BSD license was intended by
> Amlogic?
>
> If this isn't fixed soon, I will cleanup and remove the BSD part and
> Amlogic can clarify with a subsequent patch.

Oops, nevermind.  Looks like Jerome already did the cleanup.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
