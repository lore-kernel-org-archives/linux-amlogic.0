Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA94DC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Nov 2021 02:28:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76FA461073
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Nov 2021 02:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76FA461073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+fQlzAzqU9u7qgDJjG1iRed+sNBitqMAkiY8ruqTxw=; b=Cr0RKrQq0psQ3K
	aM7LhAgVZn7QBJtty8Pq2X4OZXGifdFDaaneUzDtH+4qm6y0jTBQhrzmfSnUQ3x5ghou2KI1A5QDf
	SUzgv4c3xP+aED444uTYFFnK1+Sp9pgup9Enn5KVAzQqO4XYOgm2Pf6VOZ/PnBTk0pIFy/ALPrwzo
	8QxC74jcThI+OpN2hdA6uVGzWu0kSz9AlVqdwRyQt4mytduhLJuciSwPBml297O/NFt6H1Uk0phF+
	JytrDHBzE0W9kmRfgM2qGAxpkVBkvqLxoTB8MhzBfenBscqb529ysgyYBs2W1vhX6iGMNYkk5c4fV
	RueHotlBhjMFwb2ar26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkdLT-004KOM-CC; Wed, 10 Nov 2021 02:28:15 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkdLF-004KLv-W7; Wed, 10 Nov 2021 02:28:03 +0000
Received: by mail-io1-xd2d.google.com with SMTP id r8so1059062iog.7;
 Tue, 09 Nov 2021 18:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZa7ro0mt+1m73OfXo7S1sh7QMO6OoAdAVHj6tyyP3w=;
 b=RwGT3awlgpV7L6eTUuK+fhfL8t4M2SvV96j1JF+T3BtTm0WgyYoxws36gSEjazdUx0
 ooWxhkSKADc5pu1Z+APBY73BmzWMW92OvwmvQ9sdHM5PdJGdoBz8OLih73W+n159xsP2
 F1U4CwQ1qMuhi86TruvllC0JEulr9Sn28uQEhk/XsNtTf9BgsG9rhVxgMeYx8yjkcqXn
 sl2LbIEhHfS2XKjo1sMHoV7XsYMnB2pEj4Xjlh4gvFbsCyl1ZqPzBj6qVbbw4EV4DOGk
 YQ4SWyErdWOOnHbsXgvuE6QTzkHZdVEqQ58qq6SaDrI+20EcSJH67EaDQNy0n7GlXEe4
 MKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZa7ro0mt+1m73OfXo7S1sh7QMO6OoAdAVHj6tyyP3w=;
 b=7Yju3yw1ZjBmEHHU59qysbl2xHigzl4bpe/bDEHmFWQgkE8wgzl6YGRw0NJ4RCEnmd
 26et+dIRiM5cHNrMHDMgkzJdwtG7Nt6UMHO0ABKLpvX4nJT+XsqSOGh1TRzY7bIJ/2sV
 vrJMoDF53ikj40Mx96KdEqhS3PwjI9fPr1ftVeGu5A9nq2Ksip0jvcceqrvf4oSzTFij
 P4GLooA3tnf114AXW2ygbw8r9ZahFyRpiGnlJKyVqeH0dC9czvhvQ4+kRC8jngqNzR4C
 4aVvRlrLSgPTfxNhvr4Pat32TQAHuMXIzA+lKXtDmo7SaXYTDpHFB4vKq4eR53wMnAIZ
 5Nsw==
X-Gm-Message-State: AOAM5314drUBO+kvm2mswt5YqYNsB7MaKoF7FFdCTJOBO3h4pzQjIr2S
 fwf1Eqp6nSz7V8xKvRWyNIhdkihm2nW848y4P10=
X-Google-Smtp-Source: ABdhPJz2OQAmvT8DPC+HdByniVeapr1YeGE2uk9XjMA0mDMCS0vKj6j44XdMVIWTqAolIW3RZSLLDd9BdIE5WyvnXqU=
X-Received: by 2002:a02:cf3c:: with SMTP id s28mr9384203jar.140.1636511280320; 
 Tue, 09 Nov 2021 18:28:00 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-4-art@khadas.com>
 <CAKaHn9KxZDAHdKGZg3-Pi3jZO5E3knESHCFjgaV09u5QYe074A@mail.gmail.com>
 <24363743-48fb-c01f-eb5d-0cd486d099f7@roeck-us.net>
In-Reply-To: <24363743-48fb-c01f-eb5d-0cd486d099f7@roeck-us.net>
From: Art Nikpal <email2tema@gmail.com>
Date: Wed, 10 Nov 2021 10:27:48 +0800
Message-ID: <CAKaHn9JgcZUHDu8=rWiN8p=Pow-iK73Be9s837+oyS_YcMkCxA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] watchdog: meson_gxbb_wdt: remove stop_on_reboot
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
X-CRM114-CacheID: sfid-20211109_182802_070885_F1744E57 
X-CRM114-Status: GOOD (  23.50  )
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

On Tue, Nov 9, 2021 at 11:30 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/8/21 11:59 PM, Art Nikpal wrote:
> > hi Guenter Roeck
> > why still not merged to upstream ?
> >
>
> I had asked you to provide an updated description, without the "personal
> opinion" part which does not belong into a commit log. The other two
> patches wait for Wim to send them upstream.
>

ok i have send this patch with new description again

> Guenter
>
>
> > On Fri, Jul 30, 2021 at 12:14 PM Artem Lapkin <email2tema@gmail.com> wrote:
> >>
> >> Remove watchdog_stop_on_reboot()
> >>
> >> Meson platform still have some hardware drivers problems for some
> >> configurations which can freeze device on shutdown/reboot stage and i
> >> think better to have reboot warranty by default.
> >>
> >> I feel that it is important to keep the watchdog running during the
> >> reboot sequence, in the event that an abnormal driver freezes the reboot
> >> process.
> >>
> >> This is my personal opinion and I hope the driver authors will agree
> >> with my proposal, or just ignore this commit if not.
> >>
> >> https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
> >>
> >> Signed-off-by: Artem Lapkin <art@khadas.com>
> >> ---
> >>   drivers/watchdog/meson_gxbb_wdt.c | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> >> index 945f5e65db57..d3c9e2f6e63b 100644
> >> --- a/drivers/watchdog/meson_gxbb_wdt.c
> >> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> >> @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >>
> >>          meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> >>
> >> -       watchdog_stop_on_reboot(&data->wdt_dev);
> >>          return devm_watchdog_register_device(dev, &data->wdt_dev);
> >>   }
> >>
> >> --
> >> 2.25.1
> >>
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
