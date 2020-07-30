Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA741C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 18:04:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79FB020809
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 18:04:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hvgHRWVQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3DMeRPa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79FB020809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MFkHbzTnEku6vbX9qyeW4mpZ8O1UBV9GP2+I8/vxk88=; b=hvgHRWVQGekP5ti2SI/duCuZv
	5t9iv4e2fUJZQle6Koz5pDRVdSYegzt7GjEacR5bcd3suzQ+CA43LzbInWzi7Vs7DTdzxZbQayGxL
	HfRkcYMzaQPogkN4r9XAB2u7d3lAG7cfmc+6cTbsNwY8V7AAOCY2KOrIH+KW0wvNpdBZbFjZw0KlQ
	lpNjl8XUalM+EkAmRql6QhEgoLBoWeutMVWM4TQspFCITrNg4zCJp95DpVpXVnmkl1KwWJ+o4bQXc
	JgBSNpW7QSPk/cer7LTLujhPBV7e3c03Uafj6q+InuQd1gBZNrMjWoIU1aSBYpb87Nj66Ncan3ZXy
	VB1DZy6jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Cuw-0007Ev-QW; Thu, 30 Jul 2020 18:04:34 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Cur-0007DE-5n; Thu, 30 Jul 2020 18:04:31 +0000
Received: by mail-io1-xd42.google.com with SMTP id s189so21913363iod.2;
 Thu, 30 Jul 2020 11:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SbohfH5DAY5a2wdU4IfWtw507ZRto9ZCyhmtrDJmfJE=;
 b=n3DMeRPadb4b0N87W5rCGjnywt3TF0JMKaw/3Uu2sBNI5sszD0HOJkArFiaJ1ctosG
 FyKkz4n0UwcxOx0YTCaYzD+3U16kMNHZwuLUwfSqE5dT4zY+kGPgh/gJqs6XxgakZRkA
 DVHECIdI+4N6cTgiobAua7m1ZRIb9nieZaJc75JgsORlY3U5p9hDgwha3HjX5uObdK/n
 wFaYHXPIsnnNlYOAJvyqTJzEtvzZ87LJMpG8h31luh1POMq51Nb9zYQ9AVFrGXV2YLCn
 evaOWzFHiZ3CeqbYvxI/C59+i51rLEEi5kYDATfz/1MCl5cmB0FUPry2GAO+QJhYcilt
 yPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SbohfH5DAY5a2wdU4IfWtw507ZRto9ZCyhmtrDJmfJE=;
 b=CNwEpwAxejY99TaJeeuJXu4/Y4l+wUOUB84EC0ztRuXWGqi4AThcNTbfV70UrZxtSe
 kEMsH0EhToI5UXQr6/1QnCYg979usiXbigPDEYWKFkFkgwwnpqr29uzhP5Or/8vQxAdK
 aFtWSFRoTdD5IWPhMwWtHmTXGWCYXc2TzpIhjK5EXuf+c9s7fT/hHDN31uS4gLzNvs7J
 wfnFpIUwI406jQ6Kp4tuAQY9fbEoxkwrhWoemMtKpJajSSmIQAOF+8PeY9ALC3pHu/eo
 zEsNM14Zs1zf0iFKd+8r1+mL3j7bT25213QndX8E1YZ6CMtqAhv0KlCTq7MoGmvynYo4
 0Zdw==
X-Gm-Message-State: AOAM533pFpRkkFE4WzZ/s6ucBFXbqO/NWqJCWqkq19dc4Wz1bgGJ4W3z
 07g5I4Mqx2Q1ouQVtandGc4gSRcPYMSrWqJcFnc=
X-Google-Smtp-Source: ABdhPJwsrkVnTBNxc8+t6sYXnoo5mMO98kYe8TKS3cUmsvSpycNi3Qe/yhX2rj/mEJ9GoR77q+81OjUnJOhdLibazIg=
X-Received: by 2002:a05:6602:811:: with SMTP id
 z17mr17686604iow.110.1596132267120; 
 Thu, 30 Jul 2020 11:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200730100209.793-1-linux.amoon@gmail.com>
 <1jeeot8bbu.fsf@starbuckisacylon.baylibre.com>
 <1jd04d8air.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgSnqHL=gxsEmTxrDitmowtwuM8cwPG9SD7cbpoShEd1EA@mail.gmail.com>
 <1jbljx85vh.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jbljx85vh.fsf@starbuckisacylon.baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 30 Jul 2020 23:34:16 +0530
Message-ID: <CANAwSgR2awx2SnwvVrkjnzBDaSU4rP4as2663+hD+wUddkHSqg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Add missing ethernet reset ID for Amlogic SoC
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_140429_305190_3B397E82 
X-CRM114-Status: GOOD (  26.71  )
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

Hi Jerome,

On Thu, 30 Jul 2020 at 19:25, Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 30 Jul 2020 at 15:46, Anand Moon <linux.amoon@gmail.com> wrote:
>
> > Hi Jerome
> >
> > On Thu, 30 Jul 2020 at 17:44, Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>
> >>
> >> On Thu 30 Jul 2020 at 13:57, Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>
> >> > On Thu 30 Jul 2020 at 12:02, Anand Moon <linux.amoon@gmail.com> wrote:
> >> >
> >> >> These patch fix the Ethernet issue on Odroid C2 & Odroid N2
> >> >> Some time Ethernet interface come up but no DHCP request
> >> >> is forwaded to the Router, this happens quite offern on
> >> >> my side. Adding Reset controller to ethernet node FIx the
> >> >> inilization issue.
> >> >>
> >> >
> >> > I'm seeing this on other device as well. Strange that it pops up only
> >> > now. Change tested on S905x, seems to help.
> >>
> >> Strike that one - still seeing random DHCP issue on boot with this
> >> applied
> >>
> >> >
> >> >> -Anand
> >> >>
> >> >> Anand Moon (3):
> >> >>   arm64: dts: amlogic: meson-gx: add missing ethernet reset ID
> >> >>   arm64: dts: amlogic: meson-axg: add missing ethernet reset ID
> >> >>   arm64: dts: amlogic: meson-g12: add missing ethernet reset ID
> >> >
> >> > None of the patches apply, please rebase on kevin's dt64 branch.
> >> >
> >> > With that, you can add
> >> >
> >> > Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> >>
> > So I have to drop the Tested-by  ?
>
> Yes
>
> >
> >> So still worth rebasing and applying on I suppose but I don't think it
> >> solves the problem as described in this cover letter.
> >>
> >
> > I have a mac address mapped to the ip address on my router,
> > So I am just testing with the latest u-boot-2000.07 on my boards.
> > Usually the ethernet comes up with no packet getting forwarded,
> > Even ping to the device is not working, which is what I observed at
> > my end many times.
>
> This is not the use case descibed in the cover letter. Please clarify if
> you resubmit.
>

This was some observation at my end. If these changes don't fix the issue.
I will drop my observation and just send the missing reset controller
for ethernet

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
