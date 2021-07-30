Return-Path: <SRS0=tAAW=MW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D44C5C4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 02:09:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E19960F4B
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 02:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E19960F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZrI8m/RAzNzQHenIUIhLWGFCeKN/424+VztGgJUinzY=; b=U7ve1yJNxgwd7y
	9GnVacODKUdipQI7/ipKVWjdKUa2gmr/CBJ/SBjQRuv3J16M3nvnjWlFQl38GULxT0fvprZ9tUX3g
	KB3xee3RN4dvpbbIwnP11lfcaiJaa4yh0m7HjvEjoHH1vyeJfU+yfoTR5Acn2SAxdNEqgCddSKjdE
	m5mEH/ZY8X2BSN+WIqiE0G7yaUMeRfhxkAxLzfli7uxoLlY9eaRQQSp59TAJf7dr7b462OPvuqjET
	oCIa9XbumRsd6swpMd8YKierirae0q1bp2kEccULUUzMC6Sgbwi2PanpR9QE5jSrE+r7+HR7pleUA
	SN3k7bLDqp9fLyTqxg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Hy3-006fwy-7Q; Fri, 30 Jul 2021 02:09:43 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Hxp-006fvg-Uv; Fri, 30 Jul 2021 02:09:31 +0000
Received: by mail-il1-x135.google.com with SMTP id x7so4521610ilh.10;
 Thu, 29 Jul 2021 19:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QxqMJC3Xkqptbj7jiRiylO7ezNGtuGhPY6uv3BBuL78=;
 b=Jy0WFDHB6TL+JzlXeZXGXRMT7sdxQrYste3cn8VKqMSFq+kxnrxRRAD+SGc8OKsdke
 XOP37UxKq3EsGTyW7WUShQqV9O1He0NEChIsoHn+0z9l8uTG+gMsgPahC40iY0kK6L5u
 AB2EvyI7D9SHeYTT8jQR4juJz9R8PBp3IMyxCjVhHE8gfwP9h1D/SOLPtHkoRGM+/jjD
 kB8lFmecbjTVvSeUBrogOCfYzxObRqtMUguuHu0l90i4MxsbywU3wjH7V8MPLEK8z1W0
 e3ga0GO4H8t+SQuHWJ/4uSy0dJpKvBxD/ZUh0C3KaLrPMbYj/Aicl2AEUMFpooL7t4fv
 5jWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QxqMJC3Xkqptbj7jiRiylO7ezNGtuGhPY6uv3BBuL78=;
 b=fI8aaB3r+wk0MVwwesxwa0FcLodLP8umWIBWQnOtO8oMs4IYEZbjSvgQW9/nKiw1Ya
 TdexHose5KLh/aker6XyD9GsOFegdA2MtyjXSL0VwLaTuLvJy7RoErO+eDuEUETZzH8/
 /iv1y0+Y9Si6cGrzuqGAEqTYRmbTysvV/mdo4NDaQSlkv0E0vuEbf7ydcrdfHBjxqUS6
 JAeaVg36zoj/Vxj/tgrcGuiLRKD/B5k27O3U00wek1WXfMHBSkhzaoM7BdjN+Iexitzu
 nn7iQv7uLN0Z1O6STyskSuil0Jt5ymrvc15HqEtwtvSYrdhD4Qi3NO7aIxLwU1+HOV+Q
 2Wxg==
X-Gm-Message-State: AOAM530J7SS8EzgLNlP+Jmo8ECrVI3buED5OEqLpTL3CzPGrTCbAvUpD
 yn0ziwgZrmJpUs2yGgx5DO47b7wv/NkPT0wFspU=
X-Google-Smtp-Source: ABdhPJzBsShOhxk9cSEtPV39lcj3OF5ThN73CmwlEzrAlKuHBCBHYgy/yo68wnLdLMeHRgPd1aZFJu4g/uMN4LjH3ys=
X-Received: by 2002:a05:6e02:d09:: with SMTP id
 g9mr144092ilj.153.1627610968479; 
 Thu, 29 Jul 2021 19:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210729072308.1908904-1-art@khadas.com>
 <20210729072308.1908904-4-art@khadas.com>
 <024cd37a-39a0-d43b-9a2f-cec43eb3b9e8@roeck-us.net>
In-Reply-To: <024cd37a-39a0-d43b-9a2f-cec43eb3b9e8@roeck-us.net>
From: Art Nikpal <email2tema@gmail.com>
Date: Fri, 30 Jul 2021 10:09:17 +0800
Message-ID: <CAKaHn9+EE+ZLeL1fmhU7j9AKsZ63H7MaJokhT_jnVGAvsLr9gw@mail.gmail.com>
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: remove stop_on_reboot
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
X-CRM114-CacheID: sfid-20210729_190930_041475_7DA311BA 
X-CRM114-Status: GOOD (  22.14  )
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

Yes i totally agree with you , i will rewrite this patches again
properly and explain more detail about why need remove
watchdog_stop_on_reboot

i have check already other watchdog sources / half of them have
watchdog_stop_on_reboot another half dont have it , and i think both
have some reasons

> I'll be happy tolisten to input from others.

Same will be happy.

Our situation very simple - meson platform still have some hardware
drivers problems for some configuration which can freeze device on
shutdown/reboot stage and i hope better to have some reboot warranty

> some reboots take longer than the watchdog timeout.
I have check this situation to - our drivers shutdown stage its about
1 sec default watchdog timeout 30 sec i think its enough - cant see
any problem
anybody can use watchdog.stop_on_reboot=1 if need freeze identification.

Artem

On Thu, Jul 29, 2021 at 10:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/29/21 12:23 AM, Artem Lapkin wrote:
> > Remove watchdog_stop_on_reboot()
> >
>
> This warrants a much longer explanation to even be considered.
> Your explanation/reasoning needs to be here. Others won't have
> the benefit of reading the summary e-mail, even more so since
> you declined to number and sequence the series.
>
> Personally' I don't find it acceptable, but I'll be happy to
> listen to input from others. Such changes should be based on
> real problems, not on personal opinions. If we accept this patch,
> someone else might come in later reverting it with the personal
> opinion that some reboots take longer than the watchdog timeout.
>
> Guenter
>
> > Signed-off-by: Artem Lapkin <art@khadas.com>
> > ---
> >   drivers/watchdog/meson_gxbb_wdt.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> > index 3f3866878..cafc6cdc0 100644
> > --- a/drivers/watchdog/meson_gxbb_wdt.c
> > +++ b/drivers/watchdog/meson_gxbb_wdt.c
> > @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >
> >       meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> >
> > -     watchdog_stop_on_reboot(&data->wdt_dev);
> >       return devm_watchdog_register_device(dev, &data->wdt_dev);
> >   }
> >
> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
