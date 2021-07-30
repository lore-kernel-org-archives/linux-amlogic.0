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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA55DC4338F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 06:53:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97C2C60F6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jul 2021 06:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97C2C60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbeOCTGhkHVcm4cdNXusVHzqZrOyt4wZKvyhPXlGIPs=; b=Ap+weRYT9bcwQ4
	xeQan6oIjqLHojNYyB6v1/7su2wYFQJhx0OXlQa7m3vTq5RKPr8VlIFhhnEIv9Fhfp91xvJFFpCZX
	/uVqa5Fh6wYKuR4PnExOsiBc12RHVFIr5Fu0bIRp1ep9pec7+UogC1GWVuo5e0s6xICkBxFMM841t
	/fGdufi/IqsWNehnG0k2Q/ctJ7YHCUAU5oUgDBIJTyUIEG1LOEqhigHNbFShhKzUlcCX9aYTldx2o
	rwhwHzzT7oJBdfp8UbSG9MYWPuy1XIok6jxhhPGrsaT7rQlJMlffXF5zdev36k7Ti8sYQPdjlJBDu
	pnQBXMh1k1N5N+IRCOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9MOT-007WlX-Fz; Fri, 30 Jul 2021 06:53:17 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9MOG-007WkX-R4; Fri, 30 Jul 2021 06:53:06 +0000
Received: by mail-il1-x133.google.com with SMTP id r1so8374010iln.6;
 Thu, 29 Jul 2021 23:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j6IF2835VrIHwDYkTgZV/+UoCjQH2G1E3gkSxTW7I4w=;
 b=K8mj6p+ayOG673+GlZiXV/IYCS1RDMIdPmDN71kg7b/4hCa4ztjyAcw1g/VrEPbHVN
 sva4/ol5hrLN8kJ/VYsfP9v1Cl3LcYvhdg6uY6C821zlozKRO33c9Y3D7fK0O6lJbsT0
 wSJ60IykQ6HGfBPAszYFiQ8t7ysXukJMWsu4so228rtzlj1Evu0eMjrMFnNj0vikup/y
 u6xdEAXSfea46EmaaRLT82Yw3SeK1DDA2AGf86vQEFP7Gqdbp3hBCmAZvhjzYVfRzX/J
 nRxOCqjAzl5OuiB1Z3qPRKcrvIGAzyUWHZH/LESWGcjHyKi0s+UMr30geOc2k0s7qBZt
 QQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j6IF2835VrIHwDYkTgZV/+UoCjQH2G1E3gkSxTW7I4w=;
 b=cVUF7upnFiI8vkAyF3IAoH3ygpHKmq8YFPQlAOQELiV7RN+dEY2CSNhlOmt5M9smKN
 vUUofBR/IlUIHeg0PN3F/dIecIdrCdbrqBLF9164vxOH4MnTdrQqmmvvVtunnSlvWANO
 ZkTW+Wt0UEvLNJx0z18R7HKeeXxFjkkP6zrUEJOp9mNrEWiCBFHgrF1ekj+WCS9Xx0sv
 BmJGhTzKIlwwG+exiIYU3eZddq+uIypUiPfgH8Of0vseWivWuzF31BeBKPirs1y9K2YO
 C9luzk6A08dBE7NQ5kYzXSeLJiXQPUeZEqCdIoyrr900Ah7Xmfys1FVnQmFcPvM1zhlg
 PNTw==
X-Gm-Message-State: AOAM530a5lME2zaHZeUevTBzjVVpBVa5ScXafTPF9UY7I9Xoyb8ng+jT
 gGjnoCCezfgqzxHII2iNLrCdcyhh1i9mjdtTCV4=
X-Google-Smtp-Source: ABdhPJzj4gqNEOi1QeT0MXntI3totaMLSia+EA4wE+PYYt0Fc0LmOB2npBvlj4Pe0hYU2ZzQVHS8mscsCIZZ5BftD3c=
X-Received: by 2002:a05:6e02:d09:: with SMTP id g9mr72441ilj.153.1627627983180; 
 Thu, 29 Jul 2021 23:53:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-4-art@khadas.com>
 <20210730045857.GC2110311@roeck-us.net>
In-Reply-To: <20210730045857.GC2110311@roeck-us.net>
From: Art Nikpal <email2tema@gmail.com>
Date: Fri, 30 Jul 2021 14:52:51 +0800
Message-ID: <CAKaHn9LjZUFJu9+6B3nEZkAXGeAPkXTNcToRnvtSJjEXBJULKw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210729_235304_919080_35310DE5 
X-CRM114-Status: GOOD (  29.05  )
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

Thank you very much for the helpful and detailed comments

Artem

On Fri, Jul 30, 2021 at 12:59 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Jul 30, 2021 at 12:13:55PM +0800, Artem Lapkin wrote:
> > Remove watchdog_stop_on_reboot()
> >
> > Meson platform still have some hardware drivers problems for some
> > configurations which can freeze device on shutdown/reboot stage and i
> > think better to have reboot warranty by default.
> >
> > I feel that it is important to keep the watchdog running during the
> > reboot sequence, in the event that an abnormal driver freezes the reboot
> > process.
> >
> > This is my personal opinion and I hope the driver authors will agree
> > with my proposal, or just ignore this commit if not.
> >
> > https://lore.kernel.org/linux-watchdog/20210729072308.1908904-1-art@khadas.com/T/#t
> >
>
> A much better description would be something like
>
> "The Meson platform still has some hardware drivers problems for some
>  configurations which can freeze devices on shutdown/reboot.
>  Remove watchdog_stop_on_reboot() to catch this situation and ensure
>  that the reboot happens anyway.
>  Users who still want to stop the watchdog on reboot can still do so
>  using the watchdog.stop_on_reboot=1 module parameter.
>  "
>
> That leaves the personal opinion out of the picture and provides both
> a rationale for the change and an alternative for people who want
> to stop the watchdog on reboot anyway.
>
> > Signed-off-by: Artem Lapkin <art@khadas.com>
>
> As mentioned, I'd still like to get an opinion from the driver
> author and/or some other users of this platform. However, I'll
> accept the patch with the above description change if I don't get
> additional feedback.
>
> Thanks,
> Guenter
>
> > ---
> >  drivers/watchdog/meson_gxbb_wdt.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> > index 945f5e65db57..d3c9e2f6e63b 100644
> > --- a/drivers/watchdog/meson_gxbb_wdt.c
> > +++ b/drivers/watchdog/meson_gxbb_wdt.c
> > @@ -198,7 +198,6 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >
> >       meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> >
> > -     watchdog_stop_on_reboot(&data->wdt_dev);
> >       return devm_watchdog_register_device(dev, &data->wdt_dev);
> >  }
> >
> > --
> > 2.25.1
> >

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
