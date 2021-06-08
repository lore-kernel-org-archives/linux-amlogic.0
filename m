Return-Path: <SRS0=JVYJ=LC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E29C47082
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 09:54:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E7DD61008
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jun 2021 09:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E7DD61008
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8KhjqRZvzt2y5crBY5qipDBmvta+EMCZHE9YY7hZYA=; b=Zh2jD4mULNp4HO
	lpXDVVt+ewjZ7QHlndFX9sTT1uD0jtzwMzv64wW3Wg1xq1yvfEzvtEwLt/ICoYG+Y2sDX3gUGn4aM
	kuxIbZ5Cr3vp72viax0FKmq0GpHdRnWFyMer3HckHi7nYBz8TQypeRn02tyjTpI0BsWvdg6qJ/IgX
	9WnBJ7eni6PVEsB650Vkjyg8l0FuEpBzei4MB0bWqyKuke3WfM4MNoMgnv6UZubE1DuafiwZTcPMd
	fY14zKXXDPW76BxkvZCDFOLkoZtpMWyD8y0p/DOw2rkvbADJWk1r0zpNFM9EhVjo1zuG4Spjxwyui
	uulHVD0RC3DlJUHsxsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqYR2-007YMa-5Y; Tue, 08 Jun 2021 09:54:12 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqYPa-007Xi7-Fz
 for linux-amlogic@lists.infradead.org; Tue, 08 Jun 2021 09:52:44 +0000
Received: by mail-ua1-f53.google.com with SMTP id 68so11362666uao.11
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Jun 2021 02:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/rk3Y2ettFtVoPEnKalPeMnbYq3ARaEwmF9GRRUmO5w=;
 b=begL8KLqzw9rAtLtAYdXwMmRn8WFf6sZeBDic6wJ5D19gfuk51U8VvgbVyt+iVFyow
 pOEfJYiggGVGCRJly9Fs5ZEOb+usKv7UdbJF0Po6k24P7s1WfEK4qP4U8MBBNv6d7j6W
 4IDjvgo+HrpX+fI+0/SjTIdrB+r+eEK7WZ1FRfg4+KRgwWvwrGgsPGpObFi6Pb2oe72l
 nWJG8/bQ0F96ZR+78Y01wqYB9ihSMLu0PtcrX0Zl9wJLu2pPZIVIgLP3c+MksFAgS7Fu
 afk4GTFhocma+nXjWWqAaNXs47PUPoHFJw5YpWrnC/EXulzAS2s0HX0jiXbc1nSM/00x
 goRA==
X-Gm-Message-State: AOAM5318b8yxb5OkO+3Y03PX41tdVLOICTakDUPpEGNOSG0DoCvZFDxs
 6Iq2vlj8Qj4CTTXsi7pklRyW1NAMl7H23W1Sxak=
X-Google-Smtp-Source: ABdhPJxN9Z7jevDKkx2pTcmDaqBW2d4kxYDssKn9WqH4piX4DQv+lGLxW25TxJ1FWbqsUDDK3Z89U2oUxYzCTHLbtrA=
X-Received: by 2002:ab0:708c:: with SMTP id m12mr12993880ual.4.1623145957700; 
 Tue, 08 Jun 2021 02:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210429083823.59546-1-jbrunet@baylibre.com>
 <162008674673.40672.14279142646066453043.b4-ty@baylibre.com>
In-Reply-To: <162008674673.40672.14279142646066453043.b4-ty@baylibre.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Jun 2021 11:52:26 +0200
Message-ID: <CAMuHMdVhrMNzuXkD9BQxPaiwS41bsOyJU_kwGYwk5ftto-AGBQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: meson: select COMMON_CLK
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_025242_571551_C717724F 
X-CRM114-Status: GOOD (  21.67  )
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

Hi Jerome,

On Tue, May 4, 2021 at 2:06 AM Kevin Hilman <khilman@baylibre.com> wrote:
> On Thu, 29 Apr 2021 10:38:23 +0200, Jerome Brunet wrote:
> > This fix the recent removal of clock drivers selection.
> > While it is not necessary to select the clock drivers themselves, we need
> > to select a proper implementation of the clock API, which for the meson, is
> > CCF
>
> Applied, thanks!
>
> [1/1] arm64: meson: select COMMON_CLK
>       commit: aea7a80ad5effd48f44a7a08c3903168be038a43
>
> Best regards,
> --
> Kevin Hilman <khilman@baylibre.com>

Why is this needed, and why would this make any difference?
COMMON_CLK is always enabled on arm64, as the main ARM64 symbol in
arch/arm64/Kconfig selects it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
