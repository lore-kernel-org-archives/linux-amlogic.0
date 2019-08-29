Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA790C3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77FDC205C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KMUEd4Sg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tUNmQb+L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77FDC205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2h8dzFHXSSrLBcSM2pOr+SKvEHQ9y7NpqvZyi9DgSQY=; b=KMUEd4Sg8VEzpg
	flEqZnAdDIuBH5/pkSR6EZlyURy6mukNYfB8J8dPmKrMEsgmVssiovkCohqH+szhIfDEiNeo96n0L
	ioWIJwopnpe25Q25xdpBwkl7uVj/Az9lztGN+CTA9knJuiz+rCvbVMiFGRUgNpHtD56YdRv/lUWbW
	T+uz754MeIr2dodeEDniIYk2BETS38AyL1vgSxOAoy4z3gVVVArdyFKIK50bcWRwbJwXw/oPqlVY+
	m7EA/thvJf4rKpHcpdy4Qi0nFWY1GQ4gaQVez2GhqQKQnnxTq/JdJNOQZlGPomNo98PNZv4rz8Dwv
	dVZA0lpFSqu5Uj1SWH/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3PH8-0007Nw-K9; Thu, 29 Aug 2019 18:36:02 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3PGv-00074V-EF; Thu, 29 Aug 2019 18:35:50 +0000
Received: by mail-io1-xd41.google.com with SMTP id p12so8937616iog.5;
 Thu, 29 Aug 2019 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dE7PRZQ345omAc8kJ4IwmsYptXobZW+/ikZLYjrE7WQ=;
 b=tUNmQb+LFpYbL1cSRPf5bCe64L++eHLfZ3CowzYJsxcHu6DWB7Khliqd+0WFFTUkut
 UgliUO5/JyqxYdKS3oPQorxRPZMGv/eyYDZinzXKZUFcL8wfTyTXE54NmzJF+Vo+c7C9
 /6CxcG+neGPSPOpPtQfvL+hWLHQo3leLd6FTrsSEHeCFcPw6gCq5tkMfnr/hnLWY6L/x
 hHQ9oTXwrZyOpp4pFqG1Ae7f1l91G0oPB0ISu+2CigxbB/+gg3e8WkinItIZ66L9sl3y
 sod6Sj1WOSojNdn7hOqcp4ojk/QPz2fC6PhALJTTkADd14rbnYMIbd76D8s9Zygo3Bwj
 /JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dE7PRZQ345omAc8kJ4IwmsYptXobZW+/ikZLYjrE7WQ=;
 b=ifwcTHd1x2sRw3HRzhVR46Zlh+uAaovX43ZDQrg0Kw1ti1THH7ZCwDHpngO3V0zXIs
 kTZRc/6CwzspXHD/k2McfWRk5Vv6KBlpcNPnsXZBgYnIpASBpyqEI9nAScbgL6emj6k0
 9hs7/WRwQNNuCK+3u8M6XUcstloTIpky1noHQw9PAbvBorcIvw+/jvsFJVEb2ZbbaZ0T
 ptnaVWqsGi2hoUX9eO1fpv4yDqJPA4hesSte3DfXqwcrOLvhF2LYzG4osAWY7dyuULBm
 g5h/xmOrQ8eOHBb2DOO09KRx2Ic+YntTdQKOugPjqJnoq0Ip6F27uF21WBTl3/WBCEZj
 8C3w==
X-Gm-Message-State: APjAAAXC3Dcj136vPmd243h2wcI6v9LreFnSUdiTQ4qphPeV800e+0Xj
 4qi9g4QOQ8T2A6ZjoGbzM0nEynop/Qzi7XHz108=
X-Google-Smtp-Source: APXvYqzg2TrSvQ2sGfxlX6InibTPJ6qPNmnESCZkxiQHWcDZTe8CGM/4kKFmZ8yqnYQphNmu4/FiJ2pT0Ndftf28zJ8=
X-Received: by 2002:a5d:9bd4:: with SMTP id d20mr1721932ion.243.1567103748387; 
 Thu, 29 Aug 2019 11:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
In-Reply-To: <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 30 Aug 2019 00:05:37 +0530
Message-ID: <CANAwSgShr-K-44UzdxFC7pvpTye_pbEMdS6ug1eWwYhnsVNGdQ@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Odroid c2 missing regulator linking
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_113549_501162_3E7FC32B 
X-CRM114-Status: GOOD (  10.08  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Thu, 29 Aug 2019 at 13:58, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 28/08/2019 22:27, Anand Moon wrote:
> > Below small changes help re-configure or fix missing inter linking
> > of regulator node.
> >
> > Changes based top on my prevoius series.
>
> For the serie:
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>

Thanks for your review.

> >
> > [0] https://patchwork.kernel.org/cover/11113091/
> >
> > TOOD: Add support for DVFS GXBB odroid board in next series.
>
> I'm curious how you will do this !

I was just studying you previous series on how you have implemented
this feature for C1, N2 and VIM3 boards.

[0] https://patchwork.kernel.org/cover/11114125/

I started gathering key inputs needed for this ie *clk / pwm*
like VDDCPU and VDDE clk changes.

But it looks like of the complex clk framework needed, so I leave this to the
expert like your team of developers to do this much quick and efficiently.

Best Regards,
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
