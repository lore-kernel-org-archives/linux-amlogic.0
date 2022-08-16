Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B0FC32771
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Aug 2022 08:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l73ie7+AotSSFhWG2nMgxmYR5w1nlj7ci4eRW05RZuk=; b=gyjjyil6zSFi+S
	RkPRBjRG6thtPUNXXUUqAZiNHsliiiMHk32063jtmjBwSWGd1PU5da1zIOHIUSd8EWwjTKMFwn5Hz
	TrwZwsYU83cFGZbHzHTuO/Iuk7amNgI/EMvJW1Ct8Jm3HIeFAiJ0NrEKCi6FqMYEQ+yIaI9WkqZvI
	6TuFhPAiHVGFnuiRK8KkxGOVK9W4GphZ3xYI5OQUoZfxoZhaipsi6nqmzU5os0UtRQUhXR+gKhFG8
	+mqj5ET0NM1NZF0AFrFDT1kFry1BeoJf7zf3N4lnvhYGs/K/tPCxIRnYG4s9SIEx0Orkh1VMiYKF4
	TY8FZ4/YBOjNEQhx+OFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrrv-00GZhM-Ek; Tue, 16 Aug 2022 08:24:11 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNrrs-00GZeG-4u; Tue, 16 Aug 2022 08:24:09 +0000
Received: by mail-qt1-x832.google.com with SMTP id e28so7616339qts.1;
        Tue, 16 Aug 2022 01:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=URNWhoG6Jht3PNpZTFjRMq9C2xuK/GPJGs5c4/qP8Qo=;
        b=WMTSsJZCsuR2GWexgektS/N4A4uFwS5j+U4U9bXLj9a3L47qI380JV+vKz4DRgUo7m
         JQ0ZPw6GRXuu40crI4HPnyfuU8Mwuj1qNeEIP4TcZGai2JWBghl1MLZHSVb55P06F6bx
         B1nlcqlENsza+hf4Ohd1X2ICgnXG9gNZC7PGiYkFdA7ZFjkUfcc87MSd36YKblkLzxGa
         2BnwA9oruaCFleVvpGTBbHY4dKpfAmqqekOjjv8m9YDssWVu8bRB/z5KMz8EGrrjZ7Sy
         Eu4fOB4U87dlJ/FQykdL1H5XL0UdE1RlRY7jmsZJ10A3yVUtG2esLd0xOaEnLq9ua0pr
         3xdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=URNWhoG6Jht3PNpZTFjRMq9C2xuK/GPJGs5c4/qP8Qo=;
        b=EQvzvK434IM1+epSjYitpL4yPARGC9YtWtAa5E4rGCrxCCHBpMaEmfUYDiDOveEzmd
         NODBjfjC3UiUI28UbshQp+5dfv8sTfi6gGQ7Bup73kvGVMdI+FP95fu+DnJ1PKAPCMAk
         9wOm4i4rc4VH/rc7+uDhTTbCvTAyH5Y5pRfL72cgU9Ux/c/8bAdPhtHWHaRT2Z6qCPbP
         aj8tHZE9zBvk+Al8gAbgBOuCUhB4X1Mzy2hVoe1bfDFCXC1x1uU2KjU8NZxvjLZIMkw5
         diHiOxiLid9aZYTkrQRHYcRe9nCOwy58O+bGsoigf92SojXJNrjFf5oLxVvgX5+u7ldF
         TEOA==
X-Gm-Message-State: ACgBeo3YoOngYUf05AnJd4PywLoELAAcHSF9IJdx7XXa++DU+UAzwnI9
	7QtQ8q0xUzdvrTVEtYMkNvBwgFL+SAaUAEsv+Gw=
X-Google-Smtp-Source: AA6agR5pnQGi7oingWiXnnixDq3edlax9wsTNuhcRBi9pIKjuflZ8obEieyrcjYpsw/u/5tbgjY0kZ/rOVvlBmyXAN8=
X-Received: by 2002:a05:622a:14cf:b0:343:5b6:68ca with SMTP id
 u15-20020a05622a14cf00b0034305b668camr16705479qtx.195.1660638245828; Tue, 16
 Aug 2022 01:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org> <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk> <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
In-Reply-To: <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Aug 2022 11:23:29 +0300
Message-ID: <CAHp75VcAS2Km_aWOV-XhMe9JkLER-1DYbJbkM9pa-i9yhHqsFQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Neil Armstrong <narmstrong@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Documentation List <linux-doc@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Miaoqian Lin <linmq006@gmail.com>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Guenter Roeck <linux@roeck-us.net>, Jonas Karlman <jonas@kwiboo.se>, Stephen Boyd <sboyd@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jean Delvare <jdelvare@suse.com>, 
	Alexandru Ardelean <aardelean@deviqon.com>, linux-hwmon@vger.kernel.org, 
	linux-clk <linux-clk@vger.kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Robert Foss <robert.foss@linaro.org>, Aswath Govindraju <a-govindraju@ti.com>, 
	David Airlie <airlied@linux.ie>, linux-iio <linux-iio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_012408_266718_997D3EAB 
X-CRM114-Status: GOOD (  10.25  )
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

On Mon, Aug 15, 2022 at 11:20 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Aug 15, 2022 at 05:33:06PM +0100, Mark Brown wrote:

...

> However, should a devm_clk_get_enable() or similar function be
> implemented, we'll run into trouble.

And in 5.19 we have devm_clk_get_enable(), are we already in trouble?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
