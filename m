Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC44AC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 15:14:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8933F20771
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 15:14:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JOrciI+m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEso7u3y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8933F20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/kiUbVTUjtwOQXBHp6EP3F1hakCjqWKt/wGnpEjBZuU=; b=JOrciI+mffTSSCOrzEzymIvO1
	q9pOMkG8mY7BSmwjITc7dazj8dGHgFxV7zkhlLbwww1H5tvG20qk7Bd74WVSWIbBDlwgTIrcMHVUc
	tCoXQXCWy6fs4LLyElDlgE6sdH4zYO+e1CxHIkhsyC6CEcFUY0/Zi+zp2r3x0XYiZnEFlalyFHh2H
	k0Dt5DR7vgjLlmzNa44ww9C4H8PXndwqO4ntQz9pnYRHTjvK0Y6Z7HcdzMtyi7grpiNZLwM9dNjtA
	OznuStvDe/cN+a4okurYDVUzaXfdiDGw30pcl+n+EBGerxsRqNg+29We1C3I1lIwz5DGhgZVOiX8R
	C6FHsPitg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jycvU-0005Yv-S2; Thu, 23 Jul 2020 15:14:28 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jycvS-0005Y2-Io; Thu, 23 Jul 2020 15:14:27 +0000
Received: by mail-il1-x134.google.com with SMTP id p15so4574376ilh.13;
 Thu, 23 Jul 2020 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ihgcQx50sLqVgv6s6jIU6oGjjJ/Afu62iYnga8RSKrg=;
 b=AEso7u3yjhMBkeJmn/ZoJWc7/ZJvGOM68NSpF32QMRMA+HfvIFolSJPoLf9zh7Tow2
 M/eiyZwxZL4zrLPUN6xezTh2nBjDYFVG5XppeLburvEWhFotNzpG1cobCPYbEBCqbSkR
 QHnMb8gsg9DrnAnTJ4/vissZ4oZoc9rpNvMTI1EZ/6hYIcursJwaseSoYXB3orlKLwmv
 ff9qLsdHiIBIudBrbVQAf9TiOwlVDnUNrQVKkXrx4Qqs5PcyJpHS7t4+73KZrufOOyk0
 Kk4XrBh1nJ4TzP/+9g8LhFHZP4DakYm/Hgq+vHooQPMbkE8cm9Z+VCVnJz83zfUWKlZA
 Uv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ihgcQx50sLqVgv6s6jIU6oGjjJ/Afu62iYnga8RSKrg=;
 b=EkRWhv5sCakK9VkYZocMrboihO4iCX5oEn6csHeneDxGGd4vVihestJzHAY2uyi+No
 XDWR9vfNlKyqP76Y7xjasBVqNvU6z8tunVq53bZDDk3mxnDFmU03Os/K3w/Q4kQrwqiU
 5mOXdCMkO/YybOZsPJMqKiw/rYsPhe1rm/lx20y9O94CLhmhblO7cNcqXWfnw0KxWePf
 iAUUCqC9spcW7nohxesL+7PtnZka50U6twYtx74JOn8h2gdeJrCnrXblVgaCACQNbPP1
 WCfYnUSLkVJLJdi9dWTSUKFp16Ky3B79b6CP9R2NqOgdHcIb0rcgNSHUcqv0U0oql3HO
 hf5g==
X-Gm-Message-State: AOAM5314otkjCUKWftDCyzkzsDzSRMi+PMNAe8hJZyJMApAU4Ang7WTQ
 yNkVM5j2X1MateFPPqSVhIW28BUYwWftiLpQn4Y=
X-Google-Smtp-Source: ABdhPJzaA/vp2+Nzq5vjgPaSDhNMer963g9cBBDWf8VhS3GO47YcST8NgxpnRcwsZK7Cqy8crchfAj2DhcgpM4q3zGg=
X-Received: by 2002:a92:dc8c:: with SMTP id c12mr5445047iln.243.1595517262812; 
 Thu, 23 Jul 2020 08:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <CANAwSgTMu_VSgZPtX1a3weJnp-qUve8Q1qYiTEB6Tkn2rL-+Rw@mail.gmail.com>
 <e695300d-4974-2c75-d227-eb74de60c8a7@baylibre.com>
In-Reply-To: <e695300d-4974-2c75-d227-eb74de60c8a7@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 23 Jul 2020 20:44:12 +0530
Message-ID: <CANAwSgQ3=Dup203+hRcC4eqOuSmearrDPKGe-ce-2+wUGmo8_Q@mail.gmail.com>
Subject: Re: Reset controller on the Amlogic SoC board.
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_111426_733917_D1977A96 
X-CRM114-Status: GOOD (  18.29  )
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

On Thu, 23 Jul 2020 at 18:36, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Anand,
>
> On 23/07/2020 12:49, Anand Moon wrote:
> > Hi Neil / Martin / Jerome / Kevin.
> >
> > I am a bit investigating the reset controller for the Amlogic SoC board.
> > Each of thes reset controllers have different reset IP features.
> > So we should map the reset controller to appropriate IP nodes
> > in the DTS to make this work.
>
> Correct support is already done for Meson8/8b/GXL/GXBB/G12A/A1.
>
> Can you specify which features are missing ?

Yes, the reset controller is working fine.
Currently we have only one reset controller _reset-controller@1004_

But what observation is that we could have different reset controller
reset-controller@1004
|--22  Sys_cpu_capb3
|--21  Dos_capb3
|--20  Mali_capb3
|--19  Hdmitx_capb3
|--18  Nand_capb3
|--17  Capb3_decode
|--16  Gic

reset-controller@1008
|--14   Sd_emmc_c
|--13   Sd_emmc_b
|--12   Sd_emmc_a
|--11   Ethernet
|--02  USB_OTG

reset-controllet@4410
|--8  Audio DAC
|--6  AHB BRIDGE CNTL
|--5  tvfe
|--4  AIFIFO
|--3  Sys_cpu_bvci
|--2  EFUSE
|--1  SYS CPU
|--0  Ring oscillator

reset-controller@4414
|--15  I2C_Master 1
|--14  I2C_Master 2
|--33  VENCL
|--12  VDI6
|--10  RTC
|--9   VDAC

This is what I would like to make it work.

-Anand

>
> >
> > Following are the reset controller reg ip blocks as per the Datasheet
> > Datasheet :- S805_Datasheet V0.8 20150126
> > Datasheet :- S905X_Datasheet V0.3 20170314publicversion-Wesion
> > On GXBB / GLX
> > RESET_REGISTER   ----> 0xc11004404
> > RESET1_REGISTER ----> 0xc11004408
> > RESET2_REGISTER ----> 0xc1100440c
> > RESET3_REGISTER ----> 0xc11004410
> > RESET4_REGISTER ----> 0xc11004414
> > RESET5_REGISTER ----> 0xc1100441c
> > RESET6_REGISTER ----> 0xc11004420
> >
> > DataSheet - S922X_Public_Datasheet_V0.2-Hardkernel.pdf
> > G12B / S905X3
> > RESET0_REGISTER ---> 0xFFD01004
> > RESET1_REGISTER ---> 0xFFD01008
> > RESET2_REGISTER ---> 0xFFD0100C
> > RESET3_REGISTER ---> 0xFFD01010
> > RESET4_REGISTER ---> 0xFFD01014
> > RESET5_REGISTER ---> 0xFFD0101c
> > RESET7_REGISTER ---> 0xFFD01020
> >
> > Each of the reset controllers have some different bit fields,
> > For that we need to have reset binding macros accordingly.
>
> It's a documentation issue, the register layout is the same from Meson8
> to G12A.
>
> Neil
>
> >
> > Please share your thoughts and If you have some inputs or
> > another approach please let me know.
> > I just want your feedback before preparing
> > and submitting some patches.
> >
> > Sorry my English is a bit poor to express hope you
> > will understand what changes I am proposing.
> >
> > -Anand
> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
