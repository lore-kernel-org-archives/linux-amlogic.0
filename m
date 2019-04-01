Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CAAC43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 17:13:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98D6121934
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 17:13:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXNW/n9a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hjJxvs/w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D6121934
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30yBZh27cYyew5AMLOXSzvyqhGWL7Tl7yGOEUl+yXl0=; b=TXNW/n9adZEae9
	V0QI6Aume6cxH6lOFV83VlWv29fDVLL7bK1tt+CqKPPGLFYRovQ//EkLQAjDpCrplnS0ruXdO4FPD
	jJG2uHkU01mxFd4XSin8rUHVBwGDVmDSlEiwoW0HnP6VTcWtjvONTG4Q3ZFQMcgYjPQnrYLcvre8n
	FCDDbwoNvsfr8a4gu7vOeRHLTviFNS6ZcO6MIYeLZOBBy2wCSkUzdK5Iq6fsv2LZZpznltYUj7K5U
	NmZXPtotLK5l7gXNYJFhXAJWJ5hQclWuGaOvzbkarXnfDJA6xv1LRRPf9XGQHoNh2x5px1WRjYSfp
	qM1cRoG5moBMaUD5vMug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB0VC-0002DP-8x; Mon, 01 Apr 2019 17:13:42 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB0V8-0002Cm-QZ
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 17:13:40 +0000
Received: by mail-oi1-x241.google.com with SMTP id y84so7904154oia.12
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I9KG8YRsGRGrU2T58TvsypKkYeTkXfM4zE288zWPThs=;
 b=hjJxvs/wvcrWjAdsN1P7VS9K5C7ulw6tB4fUYHEB0wh86hBXHPJRCWMM/Fc+HU8UMk
 ZQA1Ikqz62U3StGyhS1Dy0+Ns9dFhslkMTP8w5Eexx51ofACfr+24qnloQu31bEbpZSI
 LYSqXgyijvJ7SltzHhLyF6CctlYgTtuZlTTQAYzEhfuzjmgaSAboYcLCmtusx2EZyP8L
 QzNz3lS99Jx3AZeEnTyYoFUKdFfsRI9CbEywAvr058lkeb1KpIbhs23OPnalvYtvUZs0
 S8xkA0fj6oBgps0jJOv9ZMiVLmjkBkTB52yP7J3wAK5wcWeWDbfPL6ivmIj+oeyTriCA
 86xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I9KG8YRsGRGrU2T58TvsypKkYeTkXfM4zE288zWPThs=;
 b=AFwn4j1TTuWMZeehM61g3eBP9jr7uQtUActQPoP0B2gc+am+fovh8LGSnlrJktaV2c
 ISWSE2VbWqhIPht0CevwJl6jwE7YcpKDi5g5tmRHYzVycgb5OT73Iq1ocxUL0IB8/QXt
 e0Az8QOQ1ceF9+pI7Wms0OMPhcvitPDDgF30hDHdzTSyjuGIRjFofm/fzLfbOkExOM3y
 m7EOudKWnvivVyQ1zZQooglACkMAwrPeUFwZrH8lfjo9oicohXI+4KVQXJMlyW0QzhkD
 tLY3XZqwPYv0yd55D9n8W6w6C0Z9IBhM5FVUIp2e7AFtxxHunoTlNIy2d1GUuQSWkXdN
 tmnA==
X-Gm-Message-State: APjAAAUecMrGZ/HC2Odb4NnuE/uzBWlUMcuaugOq1z0U+wZ9Yp6jA4Tt
 coHmlchPmcZwd2fSIhIPN1QQYMCvkaPjAABa/JA=
X-Google-Smtp-Source: APXvYqz0Zo1b/yxQsg5oeaOOOvDi5tYiySBQK96I/pncHVnMsjHJOyvO9dsGUWWxO661wefLruYAoSQe0CrODg+n2D4=
X-Received: by 2002:aca:bdc4:: with SMTP id
 n187mr13875749oif.140.1554138817395; 
 Mon, 01 Apr 2019 10:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190329153325.23869-1-jbrunet@baylibre.com>
 <20190329153325.23869-2-jbrunet@baylibre.com>
 <CAFBinCDnoY41ZcoHqsngR4WTeczkmOu93R=2G_JOXbdUmHSjMw@mail.gmail.com>
 <3bef1bb26e9eff0cfc20cd4bb78a5d7cea4c5076.camel@baylibre.com>
 <CAFBinCCUrKGPWpTu_u3okaHVfMY4CN5F5qaRcKdTRbg35xrMEQ@mail.gmail.com>
 <63fc525faf2d82cb2436a17ab2206293aeef6c31.camel@baylibre.com>
In-Reply-To: <63fc525faf2d82cb2436a17ab2206293aeef6c31.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 1 Apr 2019 19:13:26 +0200
Message-ID: <CAFBinCB7iqg17-YM4R_X0UidxzAi7xH-jAKC05NnWw1zRaQm3A@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: meson: mpll: properly handle spread spectrum
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_101338_886786_1FF75282 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Mon, Apr 1, 2019 at 10:40 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> On Sat, 2019-03-30 at 16:56 +0100, Martin Blumenstingl wrote:
> > Hi Jerome,
> >
> > On Sat, Mar 30, 2019 at 12:07 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > On Fri, 2019-03-29 at 20:39 +0100, Martin Blumenstingl wrote:
> > > > Hi Jerome,
> > > >
> > > > On Fri, Mar 29, 2019 at 4:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > > > > The bit 'SSEN' available on some MPLL DSS outputs is not related to the
> > > > > fractional part of the divider but to the function called
> > > > > 'Spread Spectrum'.
> > > > >
> > > > > This function might be used to solve EM issues by adding a jitter on
> > > > > clock signal. This widens the signal spectrum and weakens the peaks in it.
> > > > >
> > > > > While spread spectrum might be useful for some application, it is
> > > > > problematic for others, such as audio.
> > > > >
> > > > > This patch introduce a new flag to the MPLL driver to enable (or not) the
> > > > > spread spectrum function.
> > > > >
> > > > > Fixes: 1f737ffa13ef ("clk: meson: mpll: fix mpll0 fractional part ignored")
> > > > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > > > ---
> > > > >  drivers/clk/meson/clk-mpll.c | 9 ++++++---
> > > > >  drivers/clk/meson/clk-mpll.h | 1 +
> > > > >  2 files changed, 7 insertions(+), 3 deletions(-)
> > > > >
>
> [...]
>
> > >
> > > Yes, none of our application require spread spectrum
> > thank you for the explanation. can you please add it to the patch description?
>
> I think I described spread spectrum already in the commit description.
I haven't been clear about this one -  let me do it better this time:
if you have to re-send the patches can you please add a note stating
that "none of our application require spread spectrum" to the
description so it's clear that you're disabling spread spectrum on
purpose.
your explanation about spread spectrum itself is perfectly fine


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
