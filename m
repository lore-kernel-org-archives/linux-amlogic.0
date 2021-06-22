Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3581BC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 11:53:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB0E161374
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 11:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB0E161374
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUB2rHrB++hxrTDlf84a9WAMEQwqXi1rciNgB4yWhog=; b=h3N8RDI8musAje
	/4DuKSw3mTpg+uLzSYWNfdOZeoFhTyWULqUp4dAkf1zst2SgutYvygq73Ay6yszZywirQDe8O1VY/
	b2jZilSLm2+KOwfVewPksSyOvSdwlFpBK6XKWTqIJ1Zl7Mogi49PQb1ydx6iBtK6xvGOCWIY5eVKz
	tY4Uz1LCfADsS8YT5VXqCRw7LUcosH5RwECEl9fxvF14NQ8J0GLxUO1Lop63dJVWoocQrapHXk23a
	5vEq0KipCuiB4LRnwU9R9W0KZsLFHsENZfnTIgrJF6MrYvEzG2Is0bA9ru1fS08RHow25rEYFLpt9
	qt/WAvHrNgYcIBtea2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lveyS-0071ru-8L; Tue, 22 Jun 2021 11:53:48 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lveyD-0071ob-As; Tue, 22 Jun 2021 11:53:34 +0000
Received: by mail-il1-x12d.google.com with SMTP id v5so1522577ilo.5;
 Tue, 22 Jun 2021 04:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aEO6IsSb/vSQr97ckfCz5XZnU7Vfp5IGu1nUSLuT5l4=;
 b=RvthV7XkZyLt3MdCSxQARYM/1IxDbMDd52DXZoNCb8myUKUX2HdJDMmj8ajmImESE+
 1YhiPL7AkmUy9+cBVfun0eIl1owNe2aPEEEMINQAkV/wn2VNgqp/sK86ySxe3xwpHREk
 yXwonpUnHvIGiVOijHM/Ns8B1Tpq7AbuS/ZAvy+QyxD97NPr2DBZZamMBTTFvhLyehfw
 PnmgP0tLyMQ3YO67sn8pxq4f3nvYw/+OhecRAOZdDVmERQZkPBuYFjosGBsK0/8eVIpL
 a2TIDp6j8FX6XAf7BpLZ+bUJup8HX7d6/ysP7xhCu/oCENW4U/Vpr9UgIdyHMVpiZESP
 rE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aEO6IsSb/vSQr97ckfCz5XZnU7Vfp5IGu1nUSLuT5l4=;
 b=O9ukLYhhEYzFlQs4R1uGKQk8l8L/+AHmxO3seor7L/+3r8HcuLpCTI2d2QZuo0hFz8
 xkc7r0J9NbuM4cVKkTAyW1AIgt62/ujzX/X7hABrfu5MaaXKYQViRc01mGyN0My6NQTw
 sDNvhDPIgX//trGBFOZgE+a1oBoHZqkLUhQwGgMxMSWTCtLQmI+BnoEygfjDsz5FXgW/
 s3jDQAlZhpvkTQ1xYJcu+5InSB9edNCzA5k+/6QvGQQERtAXDFvkM9TzxDbwvj22oJXQ
 GeoRNp1UR9APzSNp3JkjVxMHn1EKHeVXKDNfBQvZroa/E42n55+lf18ZLH+NK1H92Nvm
 z9vQ==
X-Gm-Message-State: AOAM532HF9CbOSeDqsywHaMup3ShYGp/inHV4jDMoxZsLUhuWUmsi04L
 a+quV3FIwaVgWPr839GJBfLloBZGN4lwGKU4qD0=
X-Google-Smtp-Source: ABdhPJzeeyDHHT1XJPI850M+JNrR7YAXKf3+LUFD9db7XL/PT7RSo6wi5mgvgSt1imENq+oFdTPc7FRVNKKaO43oYBg=
X-Received: by 2002:a92:7b0f:: with SMTP id w15mr2458228ilc.150.1624362812494; 
 Tue, 22 Jun 2021 04:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210622095639.1280774-1-art@khadas.com>
 <bfa12322-bc49-2337-2988-199e87e34b87@baylibre.com>
In-Reply-To: <bfa12322-bc49-2337-2988-199e87e34b87@baylibre.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Tue, 22 Jun 2021 19:53:21 +0800
Message-ID: <CAKaHn9JpH2Yh-1njO6jEnFeu-GMhbonftN=-VXdbvjdug16qHA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: meson_gxbb_wdt: improve
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-watchdog@vger.kernel.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-kernel@vger.kernel.org, 
 Artem Lapkin <art@khadas.com>, Nick Xie <nick@khadas.com>,
 Gouwa Wang <gouwa@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_045333_434650_F0BDF742 
X-CRM114-Status: GOOD (  21.95  )
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

> Neil
> Can you split the patch in 4 distinct changes ?

yes  no problem i can try to do it tomorrow !
maybe somebody have other ideas, suggestion, comments ...


On Tue, Jun 22, 2021 at 7:08 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi Art,
>
> On 22/06/2021 11:56, Artem Lapkin wrote:
> > Improve meson_gxbb_wdt watchdog driver
> > 1) added module param timeout and nowayout same as other modules
> > 2) print watchdog driver start status
> > 3) add watchdog_stop_on_unregister
> > 4) remove watchdog_stop_on_reboot ( still can be activated by
> > watchdog.stop_on_reboot=1 ) i think this driver configuration more useful
> > becouse we can get reboot waranty for abnormal situations on shutdown stage
>
> Can you split the patch in 4 distinct changes ?
>
> Neil
>
> >
> > Signed-off-by: Artem Lapkin <art@khadas.com>
> > ---
> >  drivers/watchdog/meson_gxbb_wdt.c | 20 ++++++++++++++++++--
> >  1 file changed, 18 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> > index 5a9ca10fbcfa..15c889932c13 100644
> > --- a/drivers/watchdog/meson_gxbb_wdt.c
> > +++ b/drivers/watchdog/meson_gxbb_wdt.c
> > @@ -35,6 +35,17 @@ struct meson_gxbb_wdt {
> >       struct clk *clk;
> >  };
> >
> > +static bool nowayout = WATCHDOG_NOWAYOUT;
> > +static unsigned int timeout = DEFAULT_TIMEOUT;
> > +
> > +module_param(nowayout, bool, 0);
> > +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
> > +                     __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> > +
> > +module_param(timeout, uint, 0);
> > +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> > +                     __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> > +
> >  static int meson_gxbb_wdt_start(struct watchdog_device *wdt_dev)
> >  {
> >       struct meson_gxbb_wdt *data = watchdog_get_drvdata(wdt_dev);
> > @@ -174,7 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >       data->wdt_dev.ops = &meson_gxbb_wdt_ops;
> >       data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
> >       data->wdt_dev.min_timeout = 1;
> > -     data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> > +     data->wdt_dev.timeout = timeout;
> >       watchdog_set_drvdata(&data->wdt_dev, data);
> >
> >       /* Setup with 1ms timebase */
> > @@ -186,7 +197,12 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
> >
> >       meson_gxbb_wdt_set_timeout(&data->wdt_dev, data->wdt_dev.timeout);
> >
> > -     watchdog_stop_on_reboot(&data->wdt_dev);
> > +     watchdog_set_nowayout(&data->wdt_dev, nowayout);
> > +     watchdog_stop_on_unregister(&data->wdt_dev);
> > +
> > +     dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)",
> > +             data->wdt_dev.timeout, nowayout);
> > +
> >       return devm_watchdog_register_device(dev, &data->wdt_dev);
> >  }
> >
> >
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
