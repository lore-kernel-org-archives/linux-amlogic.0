Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791B5C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Apr 2022 21:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mFJkB+oXgixCLgCsNZsp4CIsCEWLMykeI9MAwjBAxQ0=; b=1VEyRuYWVKgA6S
	k+syEBS5uKznedjpWSDisGrolZuEqr9pP/jnvz47Jv9TqHMNuBk5kyRCvRALalTL/DuwHuT1+yiyS
	cdRYsBMeknOGRM9I7pmhj8nxUnt1Fed8WXPH40NCyTgmfTzRkyH5cuWdDFIhDfkhgz1n1/2Urj8ll
	xPMfNmEl114fqiqVyTjxooLGu3+DstfDcEyFzKEXGd9BmFwedD8odtSjxdpyTNcdpx1GPvCld3nNO
	LkwyUUcgGJxB6Nr/txG2wd0ZUTrzALnYCediccF0c2mtzPuLFFeC5jMmonxwwOoCnD6DLIk4y7v20
	VnQ6a3ZtcpMAM32nBpBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngvlD-006SAj-2C; Tue, 19 Apr 2022 21:51:47 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngvky-006S0L-En
 for linux-amlogic@lists.infradead.org; Tue, 19 Apr 2022 21:51:34 +0000
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2f19fdba41fso61956907b3.3
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Apr 2022 14:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8LhDtsOPaDlH3w6gyeu3mci7iJleTkKy6Uui9MQ6Hds=;
 b=TmJ0eiZYxAZdUE5sh6L1cK/xtUM2pWMJ2d6VLd7GncE5o2BPF8IhN74KoYLmbqhlqJ
 751S7YfxUmlLYCB/tgrlgHFmP1pOaZYQvNOegYyL7AEw/AvmbnEgaGsD6reGB657DSW5
 SLtQWdiI4av5zn9s6lCHbNTOxDNFgFbjdU2/ySPN/iks+s7ygV4PF2EChzm99R1Sj6fd
 uHkOK44JlKGAdcPmAK92pVDG8HfBkBMdNY8y7hgaIzSXq+dYT0pMiMXVOwmYskbMLIwP
 RdLXDObtdw0G6sxyzlQRmVRWV0d9Lzy0dn9bQ+kQB910wQWErhsL9r8ObnCdXEon9VKY
 xtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8LhDtsOPaDlH3w6gyeu3mci7iJleTkKy6Uui9MQ6Hds=;
 b=y80T7d8Ga8YNusUJPqBMCUoGhWYlBdy5hgGUItAnfEYOyGG6+NuosXMJZx2ZMJ0AQz
 3uJ+bbpdAdPvtM6wTX4s12FqE8MCflcZS1zVRgUJ+FsFTE0U4lEfcw0bSRpPYpI6Zm6m
 0QbUwG68qDd0AG5Fiiz/Xm1mqT4sNHmLM+QZVOXCj7AaIIFdPRNIPGJr+bP2umq1rvww
 2hAgstKji4+Efhfq4/56hFZRiAoDuOp+FmWCpFSmx1BHSnIv6DHUbiTtGiOY+/NpBiqF
 QmHqOHAYUb1NgrjZY7oatgbrz3jtWc4W5PChWqoWOdNM5HCBGf/YZ58zOLhQ1uLbeBiG
 ovYQ==
X-Gm-Message-State: AOAM5303u8i4h35Ba4WKGfLlEGIQWoa74RO7rlxlUjQeO6Y93gcgL8Hi
 b2zOYx4PCm5ANbTBsL+CSJbfzLQYi0HyYfG+/kJWPw==
X-Google-Smtp-Source: ABdhPJycEnrH7NVifO4MaU0HhRu9JHmy3mauXkWvCyOyFGBRyszpFOK/1t0vV+rQEn1AzyuIAhpReNnCvDyBl6IzkMs=
X-Received: by 2002:a0d:e813:0:b0:2ec:1e83:e5f0 with SMTP id
 r19-20020a0de813000000b002ec1e83e5f0mr18570099ywe.151.1650405089150; Tue, 19
 Apr 2022 14:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Apr 2022 23:51:17 +0200
Message-ID: <CACRpkdanmmwfMHHQsK+d_CXq92YkFj4Pw0EhsJStukL6C7Qa0A@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] gpiolib: more helpers and fwnode conversion
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_145132_540682_83F8FC98 
X-CRM114-Status: GOOD (  13.93  )
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

On Thu, Apr 14, 2022 at 9:02 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> This is a spin-off (*) of the previous work of switching GPIO library
> to use fwnode instead of of_node. Here we introduce a couple of
> a new macro helpers, which allows to switch some of the drivers
> to use fwnode and partially fwnode APIs. As a result of this cleanup
> a few drivers switched to use GPIO fwnode instead of of_node.
>
> *) it's subset of it with a new (patch 1) helper.
>
> Marek, Martin, can you give this a try?
> This requires at least two patches for GPIO library to be applied.
>
> Bart, Linus, I can take it thru my tree with an immutable branch if
> it's the way you prefer, otherwise please suggest on how to proceed.

Hmmm that sounds best, patch 1 does not apply to the pinctrl
tree so I suppose there are already dependencies in the GPIO
tree?

FWIW, the series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I'm of course a fan of this nice refactoring series.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
