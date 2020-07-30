Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6399AC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 13:46:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F9EE20829
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 13:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YsP68iar";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQZw+1lZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F9EE20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FvxXYCIknW2VpEigkPjbCTLzDQgZGTVNUEBuEuIW0FQ=; b=YsP68iarzOonc3VHpRYoIPaAf
	KibbZ5ZOE7QIzGAozw/5eqmiNhV7yvT8OS3HnucfN4FO5bnzElKrUwJBxMFowJniIN/Pk4cPbRrL5
	hLX1hVK9hcevZaxi3b8UZ4eYsJ7zfVSv5IJu5w8mvqWiM+wzoBJvfIGcNmlfROBk+PeGy/exUFTZ4
	R6r7pA4fStraMzZEEV8x6HwsqBLV4DrW/LysPj1ywmvPFKaUk5uNABwSqjYr+Q2SbbK5zsbe+gnvA
	lGLvuxR2//JP9eqH2UA9WBBQrqPfFhqLOcrp+JrwsWIuAZKtCXySFGqgd0XPJPQRvcZOPJnvfaDL2
	0ADT5+Seg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k18tL-00076i-NS; Thu, 30 Jul 2020 13:46:39 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k18tH-00075k-Ee; Thu, 30 Jul 2020 13:46:36 +0000
Received: by mail-io1-xd44.google.com with SMTP id z6so28294973iow.6;
 Thu, 30 Jul 2020 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m3GxVmp28rAT+I62GoqjxPs5c3SaDbTvU5JFSanMnkc=;
 b=WQZw+1lZtq/DSy4+mFHyf3N6oIF2/p0tPdD431JQE9qLVseQcJFZ1tSYjRwU4soDU2
 Eg4XKLAXik7VZJI7Ai1J41xtzyiBj6i2oBDtCiaUstLUSGY7EzBD/mh2vKJk3Dzemrhm
 l7AbmNhyBi6YVlvTexPATJsM0o9I29Y5fTfgTx1Qyo3WyClkoF5EeHhUVSnetsvz1tRj
 d1P0a+3CsQzEW5Vak2DnuW1J7gtWICm4kH393a+N5TMhJQBzEIwpREco9V/g7gvHm6Qo
 zHkqGLuNVimjGQaXpnH/NQVzntvtfmqmcpP9bmDrrYCaeBxJ5U7boOlNmfMh1UVgyfIZ
 ugtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m3GxVmp28rAT+I62GoqjxPs5c3SaDbTvU5JFSanMnkc=;
 b=dUSQuBJhA0bAFihN5v/WFlxGxWdKPxe2Jp/yfias01ZcF08U+7Uq14ODMqt8GDAXsY
 L/p1jEe13Vlxkre+VPChYSOFKfMhx+soRoXAfeK5KMk0rsL2bhiTcTVybu5pnsYmbuGt
 jUSJwJdN69FuYHRG5KZQrCl9g2pFJF1Cr5ynk+cJ2Qzz30QswCRPRZckLjZKArxdh7WO
 cwCNaSi4i+4qd1ZHQ5z56Xr/ImwRLX2qEqxG/W5D/0VOWgEuDkTB+Af6lzvfE7/Sd6ex
 Azx30oRdGhO3QROfD5tFD0ut0DtrH4OZ8q+iilf4aD56FybudFqgIoJrvkQ/TNsQLqyv
 S3xA==
X-Gm-Message-State: AOAM530c5+VhRCiPlxSHOx5O2hMlSqs3x3gjF+IHc7UeqhUeSc+dYDVj
 pKNztY2TGPrPNuNr9f84YscDxXRRRFTPWVfinxE=
X-Google-Smtp-Source: ABdhPJw9nW5ayZBZvQ50736jt6FO3M6IPfdhzLBQC9Nt543tU3ea+chhsdEFGWLmGj18G+zlfmoGKHgsbJBoSvOEm3k=
X-Received: by 2002:a02:838e:: with SMTP id z14mr3641360jag.84.1596116793647; 
 Thu, 30 Jul 2020 06:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200730100209.793-1-linux.amoon@gmail.com>
 <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
 <1jd04d8air.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jd04d8air.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 30 Jul 2020 19:16:23 +0530
Message-ID: <CANAwSgSnqHL=gxsEmTxrDitmowtwuM8cwPG9SD7cbpoShEd1EA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_094635_533881_98E70169 
X-CRM114-Status: GOOD (  23.26  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome

On Thu, 30 Jul 2020 at 17:44, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 30 Jul 2020 at 13:57, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> > On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> >> These patch fix the Ethernet issue on Odroid C2 & Odroid N2
> >> Some time Ethernet interface come up but no DHCP request
> >> is forwaded to the Router, this happens quite offern on
> >> my side. Adding Reset controller to ethernet node FIx the
> >> inilization issue.
> >>
> >
> > I'm seeing this on other device as well. Strange that it pops up only
> > now. Change tested on S905x, seems to help.
>
> Strike that one - still seeing random DHCP issue on boot with this
> applied
>
> >
> >> -Anand
> >>
> >> Anand Moon (3):
> >>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
> >>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
> >>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
> >
> > None of the patches apply, please rebase on kevin's dt64 branch.
> >
> > With that, you can add
> >
> > Tested-by: Jerome Brunet <jbrunet@baylibre.com>
>
So I have to drop the Tested-by  ?

> So still worth rebasing and applying on I suppose but I don't think it
> solves the problem as described in this cover letter.
>

I have a mac address mapped to the ip address on my router,
So I am just testing with the latest u-boot-2000.07 on my boards.
Usually the ethernet comes up with no packet getting forwarded,
Even ping to the device is not working, which is what I observed at
my end many times.

I will try to rebase on top of Kevin's v5.9/dt64 if needed.
Please let me know.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
