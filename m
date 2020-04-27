Return-Path: <SRS0=4IOV=6L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2734DC54FD0
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 06:59:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBDD206B6
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2020 06:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LRdf7UxM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R/yZNbJ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBDD206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqKchMWs/qAW95gLhXCvxaTZmwgzhRK/ZXKd8HKAEqU=; b=LRdf7UxM5887gY
	0FzmNLA4P0iSeOEMTBnQc6hzYywbl1G01V6piiUdMNmULjptGFMHZmCP0C06b9PXXAxP7f0MHSgzu
	InbfwulA/I98hH5sBHtgBaGgQ/wSOG3J4QFgSUhHsc5qZu91y76e5/0qHml3fgY8zKHYyDXoc+F/q
	BGpf9EHATIicrgcXNH20I3TTsMK1mOyVEyfTt7rSVdtyUqaWGSJRq6HjKD9S2/GbCSOsvpyYP3RYy
	pD9BPrqIbIpAKqb3TJ8xSDkI0HjQSF833D/22wCZTFvOdG0VT2mrNbazNeuPeW93iMgcwv7pJcHNy
	eg0VhQp9JAUC7J0uHXAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSxjg-000089-Du; Mon, 27 Apr 2020 06:59:24 +0000
Received: from mail-ua1-x942.google.com ([2607:f8b0:4864:20::942])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSxjX-0008RP-AW
 for linux-amlogic@lists.infradead.org; Mon, 27 Apr 2020 06:59:16 +0000
Received: by mail-ua1-x942.google.com with SMTP id a10so16256754uad.7
 for <linux-amlogic@lists.infradead.org>; Sun, 26 Apr 2020 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p75ZI/P1vAKdvQGL/dkDYNcJX48p538uaKviA/7sw78=;
 b=R/yZNbJ/FXJTeWHoBM/VGrSujsjvdbo2k6YfYwGCyStA4w4Vu+3r6pSliy3CmjHCY9
 SfTABC9U26Iuir75W2uhDMbjYrKuCe5gUJz+hjZT/9SPfNH7Wq+s6evzjQF/O4AlxycF
 7sWy9vdMYVW9+yX3/Mj1hq8Cq3GpFlBCf+O/f2/OrfpFFZM2dIPGtKvQdDFpzz+h3cRb
 YxUtXuByeXDj0ep4IIuVfFOTzrd8fJuc5IhLadjFSz8WuRsGOpPAvfFz5aPQ12iGPdpR
 +6r3h9+BxdYKM75iYz3wwyH0hWBh//y4y7f8slVNxEbN4lNLXnntUxChGWyVjmNjp1tw
 oeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p75ZI/P1vAKdvQGL/dkDYNcJX48p538uaKviA/7sw78=;
 b=sCAQ7UmWKgJ4GWjLGU8rCEUk2AkJYgzTf6Rn62HHV+w+cw82O18+nQ4cOffDuyR2g3
 TJ7MmpV40atV28jcvLZwFwDBsIHyoN3Wgcgd6hnIWVQ8959yN5av5bhhcw2p15gQ83/s
 olglo+fLzl96kSrIP3g2ESVKqJrVyUa4VtB4GfFQ1CiBZH18yMxQIvI/0VrB+NC6zrKQ
 +ryaBH/ATp7RD925wUb2sLhJd9HYpXlR57GVqN9bU/N8xXz6WzyZAXzATcYekB2KL3zG
 NQYnLGImdYV5jw6LDs8D7YscPyUj2z2HwCtDlvQ3pgm53n83wCTFJ1Vt5/ViPbEu9dGs
 6DAA==
X-Gm-Message-State: AGi0PuaCqkliEVypdmk5Smmg4gCnbnO7M9Fcr0ZnJ2laCyYznVOnAShd
 xCd+cvOr0ZfbJruWLgrQsg6D8JyXrHuDtHy6d+MA/w==
X-Google-Smtp-Source: APiQypLgdu94xf46n59WAXNWbtQ/etKr47I9IXWtRxhdXwH7gOWdeXqlB5oxfaZVEhk0xe+ABAYpaedqjH2ouRHKL5s=
X-Received: by 2002:a67:11c4:: with SMTP id 187mr15068680vsr.34.1587970753925; 
 Sun, 26 Apr 2020 23:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
 <CAFBinCDCv-zNf1FX+8FHMxcNdJ_69yog+O_=QPz3Fzryg3ynAw@mail.gmail.com>
In-Reply-To: <CAFBinCDCv-zNf1FX+8FHMxcNdJ_69yog+O_=QPz3Fzryg3ynAw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Apr 2020 08:58:37 +0200
Message-ID: <CAPDyKFqNgS4JGRqMDeMgguAHd11W_OpzxyKDjaWoTUXUdc6fwg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Amlogic 32-bit Meson SoC SDHC MMC controller driver
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_235915_377099_3A225614 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yinxin_1989@aliyun.com, Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 25 Apr 2020 at 22:27, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Ulf,
>
> On Sat, Mar 28, 2020 at 1:33 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> [...]
> > Martin Blumenstingl (3):
> >   dt-bindings: mmc: Document the Amlogic Meson SDHC MMC host controller
> >   clk: meson: add a driver for the Meson8/8b/8m2 SDHC clock controller
> >   mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host
> I have Rob's reviewed-by for the dt-bindings patch and three
> tested-by's for the MMC driver in patch #3 (which means that patch #2
> was implicitly tested as well)
> I tried to answer all your previous questions where possible, but for
> some of your questions I simply don't have an answer.
>
> is there anything from your side which is holding this driver back
> from being merged?

Apologize for the delay. I will have a look asap.

>
> +Cc Jerome, because he is the maintainer of the Amlogic clock
> controller drivers - where this series adds another one, so we need to
> coordinate where patches go.

It seems like you may need to resend the series so the clock
maintainers (Stephen and Jerome) can get a look as well.

Perhaps it's better if the series is queued together - and can help to
do that, but then I need acks from Stephen/Jerome for the clock patch.

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
