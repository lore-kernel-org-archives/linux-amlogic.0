Return-Path: <SRS0=Jxtm=P4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9714DC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 07:59:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A338610F8
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 07:59:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A338610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mifdR+xSIUpU1MrPEFmGhYVQ4TlRA6A+G7uoLAu7R+0=; b=N8NzdL3x7iOPxu
	JAlMIolB/nS2yddWDvp+k04KMtoK9F7Bj78qNlc1uObz1xRjBgRk/ohZGyPEDQAqx0pSA3f0PhleU
	5MSw7me75KEodpfAMP4ynQqvtbUDUESuOpK5FXowF5SDGtWIfIPCxsBb6smZOL20300rvTdMMHf8m
	/1WLymLR7wMnzMR0z0BWXKJCe+wbq26pzlJtQySbA4othE8tnNsF49jtdU9TjwdjqktbMzDZuT1mS
	xal9mdNyZKQ8lQnpvPRD/qaj501/pCV2009URUfZzws9lsOyEchDnrLpMbl2KLyn6fcRZxVxgWwNa
	dsW8dPJT8P9Wv6n238Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkM2T-000u1Y-8V; Tue, 09 Nov 2021 07:59:29 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkM2F-000tvL-2Z; Tue, 09 Nov 2021 07:59:16 +0000
Received: by mail-io1-xd32.google.com with SMTP id r8so7649231iog.7;
 Mon, 08 Nov 2021 23:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3dqwTZmCriG4FBtW0Dj6eQjJQwrJD1vpEOEBYRc03hQ=;
 b=l9t7XJJQyuTms6XdlpuI3CXb8lhtPGmNo/2GOP86zR7v4reD/UwlbevzwkwWBwslGK
 bbV2kQLqFrYUtkx320JM3asdIJ07W18N4Cj61nW/nWorcAOzxve9FLTDVIFWlpzvxU7b
 MVGECHR1bMn1jkUed9sKZOL7pUd8+IN6OoIKpU7jtp8tmL8gnj8P/Z6tIAEaXE34llry
 xsSczdQovB0c4fgPSg0/oXF4DS03Kxpx8EclpIiWiUzoJlluZpMcPBdVnK7wvtdo9aN5
 zrH0a5W0irYJcsBYRJ5TQx1Feghzzsr6YINpcw9Sphn+m9uDgSwC7GApDg6iFPXi+XBa
 ZHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3dqwTZmCriG4FBtW0Dj6eQjJQwrJD1vpEOEBYRc03hQ=;
 b=nvJNQDCctwMXCTRBc3gQHXVyB0ggiYTdXU4Tgb1+/5Zn6TIOdc1hlDZcfwR6ZNY3x+
 bCP/Des74G6+GNbUPeRfaOG0pkI1i7HJDaZbc9hBmNxcO3v0v4lq01mwtpkFOlpo26sM
 gKYnRhVDMqku0ousEK1Bwtni/rcGdJRA9DUgexFzekzVLwjs3efFKaiQqewBvt32M1aJ
 OMFU6jwWgmwHn23/VXetCY7aVznX596gUs4KyeFOoRHptQTWq48XEiWvHFklkHrHgexd
 2h3zRO0SCu87Uwc8Lgj0ZIggW5OTGVPv11Bb2Ag+KliYWt9Ib8IWDh+M20bsNOVxi2ME
 fhQw==
X-Gm-Message-State: AOAM5304OfmwQQZtSUs6I/DQDXi43i+4f5+jTb03+3m5cSjIy2gyrJ4b
 dujKnEhVqcPrIi1PA7ndRM7+H7jUN0Z1dZfO4XY=
X-Google-Smtp-Source: ABdhPJxbSrFiGYk9Uu30K4T24GGtAKXGSf5L5IRpY6dpQETbJb4emTri0zTlJHUZIvH4Fvf4igTuMFeD3YvFAoHMvCg=
X-Received: by 2002:a6b:b886:: with SMTP id i128mr3746017iof.151.1636444754272; 
 Mon, 08 Nov 2021 23:59:14 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-2-art@khadas.com>
 <20210730044538.GA2110311@roeck-us.net>
In-Reply-To: <20210730044538.GA2110311@roeck-us.net>
From: Art Nikpal <email2tema@gmail.com>
Date: Tue, 9 Nov 2021 15:59:03 +0800
Message-ID: <CAKaHn9L5h98XgndA+xBP2MUrRevVM7pRPJN6zFh4fBaUdv7QZA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] watchdog: meson_gxbb_wdt: add nowayout parameter
To: Guenter Roeck <linux@roeck-us.net>
Cc: Neil Armstrong <narmstrong@baylibre.com>, wim@linux-watchdog.org, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
 Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_235915_141947_71CEC2F8 
X-CRM114-Status: GOOD (  22.19  )
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

hi Guenter Roeck
why still not merged to upstream ?

On Fri, Jul 30, 2021 at 12:45 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jul 30, 2021 at 12:13:53PM +0800, Artem Lapkin wrote:
> > Add nowayout module parameter
> >
> > Signed-off-by: Artem Lapkin <art@khadas.com>
> > ---
>
> <Formletter>
> Change log goes here. If it is missing, I won't know what changed.
> That means I will have to dig out older patch versions to compare.
> That costs time and would hold up both this patch as well as all other
> patches which I still have to review.
>
> For this reason, I will not review patches without change log.
> </Formletter>
>
> The change is small and recent enough that I remember, so
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>
> but please keep this in mind for future submissions.
>
> Thanks,
> Guenter
>
> >  drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> > index 5a9ca10fbcfa..5aebc3a09652 100644
> > --- a/drivers/watchdog/meson_gxbb_wdt.c
> > +++ b/drivers/watchdog/meson_gxbb_wdt.c
> > @@ -29,6 +29,11 @@
> >  #define GXBB_WDT_TCNT_SETUP_MASK             (BIT(16) - 1)
> >  #define GXBB_WDT_TCNT_CNT_SHIFT                      16
> >
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
> > +              __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> >  struct meson_gxbb_wdt {
> >       void __iomem *reg_base;
> >       struct watchdog_device wdt_dev;
> > @@ -175,6 +180,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >       data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
> >       data->wdt_dev.min_timeout = 1;
> >       data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> > +     watchdog_set_nowayout(&data->wdt_dev, nowayout);
> >       watchdog_set_drvdata(&data->wdt_dev, data);
> >
> >       /* Setup with 1ms timebase */
> > --
> > 2.25.1
> >

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
