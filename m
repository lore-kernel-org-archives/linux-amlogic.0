Return-Path: <SRS0=Jxtm=P4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43DE0C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 07:59:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1948D610F8
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Nov 2021 07:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1948D610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlZC+ULXQ61zJ6NAaVRl4X5KU9wroXaMWv5eh/pppys=; b=FnoMeJ5oyURxgk
	N162NJqLfp32ricCPF4pq4fkIlpC7WD/67u1BSKAIG6QrpDVaaPf8CAsIR6AEROwM4ds8qDaKIDI7
	Ydoivub+vJQ4ax4C6PKkyO6+W4CDcgJjC6t5E+iKOhbV/a+Q3PZM/PxiFFk7y7EQUmwNaGiYI5+mV
	BUMjL1rWcx+6ctvG44VudTivuMp5rNPh24/GmFQRTVA2sR7tqgnFR9Ukt8th/AHL8FZTdtQC5Un2A
	f914J6PFsinpDutUdL7Re6YEzOfkaBMYPvLr5Bfw4PKQgF0bBlrRnM7jDnkeriOA2XLjpCfN49DVn
	IQq8PFYbj53byQbTtGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkM2s-000uDQ-Md; Tue, 09 Nov 2021 07:59:54 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkM2c-000u59-4E; Tue, 09 Nov 2021 07:59:39 +0000
Received: by mail-io1-xd2d.google.com with SMTP id y16so4359424ioc.8;
 Mon, 08 Nov 2021 23:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hmUXkB89ButE1Z765XTXNCp1u56Qd6wf2aziMZ8NFk0=;
 b=fPJfNMm7/gUHIcEaWXU0OyZFNfTULORu2U0KvhHno5JtoDHlzPuUJjMj4GVCujegFG
 BdKQgfjyqgTKSAYS79g/RqXm+G1PzsSt8gTyMXYlXmyezGwJa0qlXIAmMEOPmFphTueV
 JFzA+gRzqP7Ewtcy1AXSZoN+DauAGj+uSKT/QHHJ6Tkz+ky0xhgWeYKJHl7z7jiux0Zo
 ybetTnGpNrJEhscCYcb0R+W1iK4UKpY6hQhOWSSDWEOCNkVLnotlFtYvhM2YORJWUM9h
 HnIDgXiJq0MnnXUhsHr69QFe3CJD5VSHXmjKJMmMMR/kcZpi2ukQGLbNbThwHBe6tu/K
 z1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hmUXkB89ButE1Z765XTXNCp1u56Qd6wf2aziMZ8NFk0=;
 b=1KVN3htoaybNPtM9t/RILd87nsSaL8rBN2vDXzx3EPCR1PHkEzcJYAdB5VdCPkj90p
 4x1PTyPk/mAes4S9/lN+TBVIWmLtPgGguv/8BDxcZULkH8ZEvs/paooaPjIs2ABkMUgp
 eoIdTpFynfZcGJ0bStcZM3HZqLPzTzTmScAyUSmNO+zkkmFppKyl5N3ETEX/YWQ1OYuH
 rC1YGGtbquEEBbF0cT41jV6kYBi6lkWaBTH9oHbpkHZ1TX+lXQtTQtEeaiCcke8v4j+O
 OW+zqOgiURYij8XHYOFJENSq/d07a6632ifWIi0Lb2SHR1we9/YrmIOz3jEQtjvB7haR
 eUNA==
X-Gm-Message-State: AOAM531QvRM8oPEcLHP0s5z8IxT1kEQfay1ARlhmuK9WOWw4KUJyujSd
 xGPf5XuwH4Pt1mtTe1iGpigxUl2NpXxVnG/8cOU=
X-Google-Smtp-Source: ABdhPJys23Mg+2iXv/lIUi7n2/IVdgSVVAilVV/JSel59JmYZMTCPc+6nhl9NIQxciF+CVnJrp0huAqMosOzfu+wt0U=
X-Received: by 2002:a05:6638:2650:: with SMTP id
 n16mr3998715jat.72.1636444777348; 
 Mon, 08 Nov 2021 23:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20210730041355.2810397-1-art@khadas.com>
 <20210730041355.2810397-3-art@khadas.com>
In-Reply-To: <20210730041355.2810397-3-art@khadas.com>
From: Art Nikpal <email2tema@gmail.com>
Date: Tue, 9 Nov 2021 15:59:26 +0800
Message-ID: <CAKaHn9+MsrXOObVqb53gwGdoUwzRsaxUMhrDMhiM6wkwSFJXmA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] watchdog: meson_gxbb_wdt: add timeout parameter
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: wim@linux-watchdog.org, Guenter Roeck <linux@roeck-us.net>, 
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
X-CRM114-CacheID: sfid-20211108_235938_197873_EF3D9D0C 
X-CRM114-Status: GOOD (  14.55  )
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

On Fri, Jul 30, 2021 at 12:14 PM Artem Lapkin <email2tema@gmail.com> wrote:
>
> Add timeout module parameter
>
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  drivers/watchdog/meson_gxbb_wdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index 5aebc3a09652..945f5e65db57 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -34,6 +34,11 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started default="
>                  __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>
> +static unsigned int timeout;
> +module_param(timeout, uint, 0);
> +MODULE_PARM_DESC(timeout, "Watchdog heartbeat in seconds="
> +                __MODULE_STRING(DEFAULT_TIMEOUT) ")");
> +
>  struct meson_gxbb_wdt {
>         void __iomem *reg_base;
>         struct watchdog_device wdt_dev;
> @@ -180,6 +185,7 @@ static int meson_gxbb_wdt_probe(struct platform_device *pdev)
>         data->wdt_dev.max_hw_heartbeat_ms = GXBB_WDT_TCNT_SETUP_MASK;
>         data->wdt_dev.min_timeout = 1;
>         data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +       watchdog_init_timeout(&data->wdt_dev, timeout, dev);
>         watchdog_set_nowayout(&data->wdt_dev, nowayout);
>         watchdog_set_drvdata(&data->wdt_dev, data);
>
> --
> 2.25.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
