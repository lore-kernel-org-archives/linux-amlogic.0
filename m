Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD9EC2BB55
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 17:50:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A152214D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 17:50:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FirKbJUb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="rfmBJsjW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A152214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zoQErBsb3UZl5iF/Y38Dhf1ChCXbsfibilNbDrNS9s0=; b=FirKbJUbVkK1EH
	Sq/pgBQUXnrpMNGXO3PleovxPAXTunzQZh96RDt3t0S7QuXU1mL+hRWWfn2stw5LE8F6/7I9rdWPi
	4nd6SF6IA2AI8YUvHbyxesJZVTyXqcNk47RAYeYB40nck3XIPRnfBavn3+RjUmbrDHtfzanskEvZJ
	AiDPWXd9t7Fsccm1gj+Jje3b2JX49Dpdcmp+tGk7PMrFgI02BTVQSKoeH2R0xVPEj3fH6877IGtC6
	WevJmId/GBlQ+oTkBYz7m8ojOmBe4Avln5zDvnofCJAdMRuk/PST/fUJNhG1FDuw1vqo1gNmCn2vG
	DWqBoykbsAAfVX3/COcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP8eF-0000aF-Bq; Thu, 16 Apr 2020 17:49:59 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP8eC-0000ZZ-QC; Thu, 16 Apr 2020 17:49:58 +0000
Received: by mail-ej1-x642.google.com with SMTP id n4so1925443ejs.11;
 Thu, 16 Apr 2020 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O9vqKvQJSosI2zy51g44Ony9xOnUOUnQzLKmbPYbXLs=;
 b=rfmBJsjW7+iTxonwOCa9eCjK/EmzWmpsGcOogRYhp8EKYhNyd9HpF5Ix//iAy7xSf2
 Mzq9b7MumB9KO/PUheOIa/m+S6RHDonRpqTFDuMG15bAWrFdQJea/fVK3pL4tIiv25YI
 E1u5q1/jCMFhdUA1jQ8jvzX0mzbNXFLEAys1Gju0aZITfFrNkM7TqdgdFzNvw2UjwIZN
 POeYLUtBG+z/YvS9AI46Ddr8gt5atrXRUib1JNxz4OiBBWl7ijjeVA/eTLQ97eAlrJO3
 8Df88AU9SeyWCF+ufDJ9hXne0Ahwgg1njLoo0yg25cXkPYpsQyn8i6sY1jhOVX2Au0mO
 A3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9vqKvQJSosI2zy51g44Ony9xOnUOUnQzLKmbPYbXLs=;
 b=cXcX97auNeQTMn4FD9F1HDP7dDJ0rhiKwBYeb7Pb0gQ2yL+ejr13DwBj17MGfghQha
 nKecxYfZrf5T6Giz66FUxAKSeaM7KmKpAGRzApZDPfdPPapQgU7ztPf2oCEf0zmz/iE8
 rKv91TM/6kAEYZoa5GTCJ06Qr0CHl5EqQwCUi9kURxATqBUrhK5SVelQRjKjRmYxeTKL
 teJVz1ypSNQW8tPWHeaieT3vxTgIbNCjN2u8kcJFBtYsUD5aRMgQZN7tf9msMksKTMlZ
 SrvL6tpb5yCFxuLcrBsYGTO1/qIkhF71GP8UZji/cFbSApCaIbTKRV101SgHxV7AezyC
 HLlQ==
X-Gm-Message-State: AGi0PubzFxT5bZ2e25NTlS2gLoiUzQyoNCi9BNs0xTuertAsVyvdZGqG
 hhZcV5x/RxEjkQwMtvJddis/bYHv9er1DoyRMeJLTSdZ
X-Google-Smtp-Source: APiQypLEk2gMPX17Qyadyvo1VqaylHm20tB8KtuyppUGRUqPXNDwTXsEmsPQN4DGCwkKaSyK8Y5IYXm3qjuuAz/y7dQ=
X-Received: by 2002:a17:906:2962:: with SMTP id
 x2mr10033635ejd.233.1587059393912; 
 Thu, 16 Apr 2020 10:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200414200017.226136-1-martin.blumenstingl@googlemail.com>
 <20200414200017.226136-2-martin.blumenstingl@googlemail.com>
 <1jblnrbu16.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jblnrbu16.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 16 Apr 2020 19:49:42 +0200
Message-ID: <CAFBinCCV=RNqLpJfj6JUkoc_+NXMWNgsdUSdAfucLCJCFWddUQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: meson: meson8b: Fix the first parent of
 vid_pll_in_sel
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_104956_875980_C84C061D 
X-CRM114-Status: GOOD (  14.97  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, sboyd@kernel.org,
 mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Thu, Apr 16, 2020 at 12:32 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Tue 14 Apr 2020 at 22:00, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>
> > Use hdmi_pll_lvds_out as parent of the vid_pll_in_sel clock. It's not
> > easy to see that the vendor kernel does the same, but it actually does.
> > meson_clk_pll_ops in mainline still cannot fully recalculate all rates
> > from the HDMI PLL registers because some register bits (at the time of
> > writing it's unknown which bits are used for this) double the HDMI PLL
> > output rate (compared to simply considering M, N and FRAC).
>
> Have you considered adding a fixed_factor pre-multiplier, like in the
> gxbb driver ?
>
> Seems to be the same thing
it seems like I haven't been clear enough here: the doubling only
happens for some - but not all - PLL settings.

Let me give you two examples with values from the 3.10 vendor kernel:
1. the CVBS modes use a hdmi_pll_dco freq of 1296MHz
it uses: M = 54, N = 1 and FRAC = 0
with our existing clock tree this works out perfectly: 24MHz * 54 / 1 = 1296MHz

2. HDMI 1080P mode uses hdmi_pll_dco freq of 2970MHz
it uses M = 61, N = 1 and FRAC = 3584
with our existing clock tree this doesn't end up right: (24MHz * 61 /
1)  + (24MHz * 3584 / 4095) = 1485MHz

I did play with the registers and our clock-measurer.
it *seems* that the HHI_VID_PLL_CNTL3 and/or HHI_VID_PLL_CNTL4 are
related to this doubling, but I don't know for sure
my assumption is that there's either a fixed pre-multiplier like you
suggested and then a configurable "divide by 2" somewhere or there's
simply a configurable "multiply by 2" somewhere
Either way, I want to fix that at some point but since I don't know
the related bits I want to do that later on (in separate patches once
I have figured it out)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
