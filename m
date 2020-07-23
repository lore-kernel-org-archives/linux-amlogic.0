Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828ADC433E5
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 16:39:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5021A20714
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 16:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YbblpIlw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imMZqJV2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5021A20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EfAvB1MuWdmAAy9xLWANkhSWTOtNWCZRmRnHALAlMPk=; b=YbblpIlwpIFg7l4972ibc1PM7
	S9LEHgsCswI3z3GfaiARYqG2FWfzKorf2pMvmUkriLb9YA9N2oKn4h07wFwkTXbVZiPe+phdiPnYK
	9y1pYQyIXvoOq+4V+4ugimT7i4Htf5LzAgnpqauhGvpykSorrvD8MBQxbyxAFVHsEZFyV6/2ZMhMt
	0p/0Jnl22uXLPel0ZTAsdjUY5aki9ljrsxfpH9oGe9l9Psx+N2EzP+o2lRrR9nZ/sbOPYgUASbx3b
	IZ6XOR4pu7GNCUUcaUgdRQsyBTk11U0s/54zwkfuenLnLjw8gFu39nkO0CzbM8acqgW5/6gTEGdB4
	CAagbcggQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyeFb-0006uz-Hy; Thu, 23 Jul 2020 16:39:19 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyeFZ-0006uG-EH; Thu, 23 Jul 2020 16:39:18 +0000
Received: by mail-io1-xd2c.google.com with SMTP id c16so6917075ioi.9;
 Thu, 23 Jul 2020 09:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jfwkgKXjA4rZJdvfOkr18zfHovpTl2qK8+3WS/946WU=;
 b=imMZqJV2JMMnBaa30KdcVhomPQNNC6CV3GYKiGzSxlNyXc9vZtoXKWQjUuenFDGLsw
 PD8GG8/wTuyD3p/LroFIufDCYE8oYo3we+uXjZAxiVwz6iRbIoBbeqB84TZeqWpPG7OS
 cTvhAMU0CytFPi+grl09e20gf28IttmGjAeAcPtQqKJO7ezD82tjuuQHWhhfgl3I3tpY
 lp2K4WDb5Qdzl9VsoXF8TOMXinmxKa8ZAjKscf6bFF6JEYxGnQeWaI5pQSry44KxmLit
 khkx/6zIKztkAeck8DaoDVt2wcMQLe+MXUKe18kWeH5FJiHKQSHre+VTYeWRrpqqRCFg
 R/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jfwkgKXjA4rZJdvfOkr18zfHovpTl2qK8+3WS/946WU=;
 b=sRFmvWkVPqKtwln/cmC/dxmcssk4FQPhZ9KkmIPg/dARkNPlNAGrjpyYm6PC1E40U2
 seaevOdTkYO41oNI4b0VcMpGVpn9Uz83v4x1uHE1u7OSU7ZF6nIwoTAAG6KtYdlVCGJQ
 1JEjZv5HGUXEMdprhp/5VO8FPUZnxP0zEIp0NdMaLH7Pa8QrVyDBblqjjv8Ivuq4yTJS
 BKZwXJzogLR5bWUmp2467g5E2eoGMcKpz6P3DzZJyDCcJCVny1K4KVH2g65KaNORHfck
 9oB/JaT4Wacm4AdE/jwz859HW6xr48My5T0/vjXSV3ErmZoyTEdquOGsMrwVlHn8+tIn
 hTFw==
X-Gm-Message-State: AOAM533/VS8n9qwuuWCvH7CPD0dbYTxyfcTfEhdVBbUpukPfKfO64THb
 bqYSW/pdaCrpC5nhOaznw5CCH85U+J6lj5kRXVs=
X-Google-Smtp-Source: ABdhPJwRc4UvPALRPfePltdHvr/B1RKeGFKIsaLQ6yulYmLlABw1BhRkLmZHtkdvZ615/OMA1xDtJxEeqF8lpkoA3ak=
X-Received: by 2002:a02:1107:: with SMTP id 7mr6099038jaf.84.1595522355423;
 Thu, 23 Jul 2020 09:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <CANAwSgTMu_VSgZPtX1a3weJnp-qUve8Q1qYiTEB6Tkn2rL-+Rw@mail.gmail.com>
 <e695300d-4974-2c75-d227-eb74de60c8a7@baylibre.com>
 <CANAwSgQ3=Dup203+hRcC4eqOuSmearrDPKGe-ce-2+wUGmo8_Q@mail.gmail.com>
 <05221f68-aa15-2e8d-b002-3e41071c64f0@baylibre.com>
In-Reply-To: <05221f68-aa15-2e8d-b002-3e41071c64f0@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 23 Jul 2020 22:09:04 +0530
Message-ID: <CANAwSgSZ0jkQjrJMCHvN3=wbobunvq9xqWORuid1oOGfv=KenA@mail.gmail.com>
Subject: Re: Reset controller on the Amlogic SoC board.
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_123917_559621_95EB7001 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Thu, 23 Jul 2020 at 21:12, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 23/07/2020 17:14, Anand Moon wrote:
> > Hi Neil,
> >
> > On Thu, 23 Jul 2020 at 18:36, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >> Hi Anand,
> >>
> >> On 23/07/2020 12:49, Anand Moon wrote:
> >>> Hi Neil / Martin / Jerome / Kevin.
> >>>
> >>> I am a bit investigating the reset controller for the Amlogic SoC board.
> >>> Each of thes reset controllers have different reset IP features.
> >>> So we should map the reset controller to appropriate IP nodes
> >>> in the DTS to make this work.
> >>
> >> Correct support is already done for Meson8/8b/GXL/GXBB/G12A/A1.
> >>
> >> Can you specify which features are missing ?
> >
> > Yes, the reset controller is working fine.
> > Currently we have only one reset controller _reset-controller@1004_
> >
> > But what observation is that we could have different reset controller
>
> Sorry I don't see any good reasons for that, it's a single reset controller
> with multiple lines split over 8 registers.
>
> You are free to do the work and submit the changes, but it will break the current
> bindings and offer no changes or new features over the actual design.
>
> Neil
>

Thank you for your comments.
Ok I got your point.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
