Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C51EC3815B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 18:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11BF6221EB
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 18:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiItAt6R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MI3PIN03"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11BF6221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGBdG68fb/bADQDlLrlZd/lGPtMRB4zo39QUZfoDg1w=; b=aiItAt6Rkwjo2w
	lYuQQve5E7ANrhrDT3iTw9vyzGlBtghGapwbmjt1WpyJL0O3r85CoM343QRh+cxKONXjKkrxnqu5X
	r+P7XdOTE0vhNGgXxX2yrjBLx7BbBPrxCiEQh43YnfXYR1AbQfEzMDS4H78oe1li8IcykkGtciceL
	zhcbmNc9ZSrZvAg5oT7dfMRKhtpoaybFzjrsRNVl60PnvBf2Qx0ra+5HPMCESvliYsT+JxsNa3E/M
	AoyRdXzguwCPPc4sqCdHSuD9IaQzZPAIb6+tBOBbK/mqwFvKrqjzdA4v5XAlsCtG9fFlc5tHiVn39
	f8U6diIvAE2Y+Q/eyFOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP90Z-0001Bn-Vb; Thu, 16 Apr 2020 18:13:03 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP90X-0001BJ-JQ; Thu, 16 Apr 2020 18:13:02 +0000
Received: by mail-ej1-x644.google.com with SMTP id n4so1979862ejs.11;
 Thu, 16 Apr 2020 11:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3BujPtYkPgE5qbv/kcmnLou5PuLayVpEmjsVIPVlZ6c=;
 b=MI3PIN03g9mte9tt/J80yvDslXb3w5cZmZDi6gm4zlUVzFOR9lZnuarDbb8wWGmYJm
 NKMmuKGIWz9Nz2eRwTDCAUTxmweTc9el3ER8sG3w1TZGBshbNfx0vMTldgm65Cdlll78
 WZ0BOuepmKQy15b9XnY3Qdn8gQLvqy1E4Q2orei2X8a6KbkHoOcwwOtIxXnDlFnjGLph
 WJlmU9GbCvAa/WFA3EY+gzuUHVqwVyMe8Qx3igEX0O4wX4MUu293I9QfiuaXqLadpIhX
 KsQFZRC2lLEBWh/0JvCD2aW0+aa7shBCg2fiEqcRiFN3SmaW39m+JikfaII+EJxJHEzA
 2dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3BujPtYkPgE5qbv/kcmnLou5PuLayVpEmjsVIPVlZ6c=;
 b=udvIhBgb8HWPHVdniJdM6NHR4CQbQRhoqwpWNngJQPwREmxAMA/pji+F41FkE1LnPj
 yIeR6W6Aknjq1+jeCBALTX4kPdbOJ31musI/cStqGibJZgS96rW9MdYtrHIGo0evADyR
 5C/GBGLfQ2UH11V8mHUBwB3FRXzL+yQHy33PgVH5mej1uV+UWH8esjxloD7FUU7Wst79
 Bdu/fHpmPrwwFwrwZed3v2L8hCOd53O1LMWD+taBdd1n8JE2QT2RSCNZEGtxZsXSOg93
 F7Pc6jyPxBuZly99hDZtoVt2l0I1pucucWA6rrV1tfexYuT0oUS3CgiPRuyJaxG3Wlx9
 zY0Q==
X-Gm-Message-State: AGi0PuYfvuoEpbhpD+YOWO3mXkHokd1z0gTlQrfz4AY1PVkgxiB7cH2p
 NVE70t2VLBfhBTKXy8vogvvxGbG8BazGSUS7daU=
X-Google-Smtp-Source: APiQypIkLNljPlUdohCkcdi0muKk9NtkNh8bkA9dgBVjbBN/j84bykCU96fEtuK2GZpJZGQwXkyrDlqZd1lfhqCqzrA=
X-Received: by 2002:a17:906:2962:: with SMTP id
 x2mr10118232ejd.233.1587060779605; 
 Thu, 16 Apr 2020 11:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200414200017.226136-1-martin.blumenstingl@googlemail.com>
 <20200414200017.226136-3-martin.blumenstingl@googlemail.com>
 <1ja73bbtqt.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1ja73bbtqt.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 16 Apr 2020 20:12:48 +0200
Message-ID: <CAFBinCAtSPTHfbr5KGNFFg3eo_d2p2q59fQfMXu+XkOb8WVrDQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: meson: meson8b: Fix the polarity of the RESET_N
 lines
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_111301_640845_62EF70B7 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 16, 2020 at 12:38 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> >
> >       if (id >= ARRAY_SIZE(meson8b_clk_reset_bits))
> >               return -EINVAL;
> >
> >       reset = &meson8b_clk_reset_bits[id];
> >
> > +     if (assert == reset->active_low)
> > +             value = 0;
> > +     else
> > +             value = BIT(reset->bit_idx);
>
> if (assert ^ reset->active_low)
>         value = BIT(reset->bit_idx);
I can do that, but I prefer "!=" over "^" because the result is
expected to be a bool (and because I'm not used to reading "^" for
logical comparisons)
will this work for you as well?


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
