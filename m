Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EF1C19F2B
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Aug 2022 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Es66rU2hc3GNNZq+eoD1cF9hIek68+GvpBxLKewPbOw=; b=0j7LOEF5ztciaC
	qT+I1dvuXtq8ANSv5O8ef41h9qPWI2bUwBrUEtKlYIPijLrlsYLYbus7xse2Sr9NWYuYObPFp/fTR
	RTMlFDDzDi2ZS3hH+yyYTnuhIAGtSs8zpUQunA5V9psbMvmMQZ7tGNPXC85M1M449EgG3FXziKsyC
	0pXRLqelE6WEjkVNyxGpv1tuZuVxtcxkANg5WW46JM5QR8TZk6u2yZsUzrpD4VVY/rXRPgzIGhRb2
	XUgJxDZE56hAEjJJb31BDJRtx46A8T/LJ1P6JgYZ4G54mizr9EMbJ9wYNJzMvLMmtArsaWCxtnT8x
	72Z4+q9YEBD2NHQZ21qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIPZA-003Ij9-AC; Mon, 01 Aug 2022 07:10:16 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIPZ7-003Ifj-Be
	for linux-amlogic@lists.infradead.org; Mon, 01 Aug 2022 07:10:14 +0000
Received: by mail-lf1-x12d.google.com with SMTP id u3so13123111lfl.3
        for <linux-amlogic@lists.infradead.org>; Mon, 01 Aug 2022 00:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9emDdEzFMs69Gipidjg/4iPnKc74czbXBSfH7BXoX7E=;
        b=Sr72hQDSRLuQjtIWdvTg4GI/F/ghx7wAZJ5xA2IE7SrVxy89DYVfbRwLHbl6upi5PO
         iDCh9ERhAlD6CzLccqGjaoHqeIVFE6CbRMe9P1JcD/LltWBV55SBpYqHCFDTQxq58wmy
         J0TriKfvsvLdoDDSrJIq8xNCyYo+30wOO8P0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9emDdEzFMs69Gipidjg/4iPnKc74czbXBSfH7BXoX7E=;
        b=kgFrAO240F2+BpTPjbfnRFuws3hQEbsRe4R1esNwW6+TLHtw0SwFaaiF7R1wKvZXBT
         MnVsohzGRerHBGsW41Z35I8XQ989y8eJKQC5+x5oPpX4yqC7484HGwPSrqWWWVx5pWP7
         Uh45/Ac7mXriNUM3XsEtKBaTPTnNTEGVqRH5ZacxgPWoe2Vx4qDDVfk0jUhifUv/kQjy
         LAug8Ky09bnWIbDzv/lA5wJrSvWSDEF68l5akoMzUPyM00SW5bK61ahKUB7jsPo4xsk8
         ifEP0KCwdQRm9RX+zGM6j9Vv2ZcD2ZKKyY32+9/NeUx7ld8RhbTqcjnNxg7g9SXFVdZ6
         c9NA==
X-Gm-Message-State: AJIora8qvMzceiCdrRyopFD7xuCuCoHe/wbU/Nbv8LHuXRN+8HNBzdAL
	TFcTXercjkQqrkDA0EADgfbTy3ZR2wIxbu+iVhDjXw==
X-Google-Smtp-Source: AGRyM1vBHdLCnhaNWq0HuuIE7YCt3LPsNRwJNG31/7DbQcPUKGPTpoP0Izd3uAQBHIk9teMUQ7eUriiQ4S/AQJXREb8=
X-Received: by 2002:a05:6512:1584:b0:481:31e4:1489 with SMTP id
 bp4-20020a056512158400b0048131e41489mr5001425lfb.509.1659337809812; Mon, 01
 Aug 2022 00:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <ca9560eb-af9c-3cfa-c35e-388e7e71aab7@gmail.com>
 <CAFBinCCMinq1U2Pqn2LPjC9c+HqfHjvW81b1ENMxdoGmB6byEw@mail.gmail.com> <88d6ef05-f77a-57a2-f34a-e3998a8d70d4@gmail.com>
In-Reply-To: <88d6ef05-f77a-57a2-f34a-e3998a8d70d4@gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Mon, 1 Aug 2022 03:09:56 -0400
Message-ID: <CACdvmAgSvsYj6zorYDrBaEUvZzPi_c0XpVzx3fz8nHp8+TXMuQ@mail.gmail.com>
Subject: Re: Meson GXL and Rockchip PHY based on same IP?
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_001013_459974_1F4F5132 
X-CRM114-Status: GOOD (  20.12  )
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

On Sat, Jul 30, 2022 at 3:31 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 30.07.2022 19:06, Martin Blumenstingl wrote:
> > Hi Heiner,
> >
> > On Sat, Jul 30, 2022 at 5:59 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >>
> >> Meson GXL and Rockchip ethernet PHY drivers have quite something in common.
> >> They share a number of non-standard registers, using the same bits
> >> and same bank handling. This makes me think they they may be using
> >> the same IP. However they have different quirk handling. But this
> >> doesn't rule out that actually they would need the same quirk handling.
> > You made me curious and I found the following public Microchip
> > LAN83C185 datasheet: [0]
> > Page 27 has a "SMI REGISTER MAPPING" which matches the definitions in
> > meson-gxl.c.
> > Also on page 33 the interrupt source bits are a 100% match with the
> > INTSRC_* marcos in meson-gxl.c
> >
> Great, thanks for investigating!
>
> > Whether this means that:
> > - Amlogic SoCs embed a LAN83C185
> > - LAN83C185 is based on the same IP core (possibly not even designed
> > by Amlogic or SMSC)
> > - the SMI interface design is something that one hardware engineer
> > brought from one company to another
> > - ...something else
> > is something I can't tell

Per Jerome, both are OmniPHY IP.


> >
> >
> > Best regards,
> > Martin
> >
> >
> > [0] https://ww1.microchip.com/downloads/en/DeviceDoc/LAN83C185-Data-Sheet-DS00002808A.pdf
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
