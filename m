Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B222C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=In91m0aI9LQ2M4HPAqnEC45zQhWjAA48GczknRRNA/E=; b=yjj/naK/1kdWOW
	d8GI7sjb76w4uqWFQdFAfppNjs2j+QU8tgo5URqVta2+y+gVaIuhmfuNKwwRZg/ixg4A01WVyBh+W
	doHX2o7XFww7VCnqHWauRpybAR0H1pI4sKLx7Oy7q6e/4/MMieCOXG7rSmvB8hJmHWNVvoq2kbTg+
	F2h2uBXaHLQgLxA9fZ8SdgDHIYemsq3y/UxiZYaP3dUHtUmWaMaTNGgBLAW0t5dYVUKR0lJ+pO/9h
	Hg6Iw2YxKnOvJDNaBKX0TalqRmixFz3eMb6Mp7G+NTWRNTHJ7b8RbkYrhPy6hkmA0wgCZ0FrIPKPw
	0NBJAe02rq58ablAbjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZV8u-00F6Ii-4z; Wed, 30 Mar 2022 10:01:32 +0000
Received: from mail-qv1-f49.google.com ([209.85.219.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZV8Z-00F69e-1O; Wed, 30 Mar 2022 10:01:12 +0000
Received: by mail-qv1-f49.google.com with SMTP id gi14so16505302qvb.0;
 Wed, 30 Mar 2022 03:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eWVEyP8xb0gTFVWSPikhwxNAnBSVX8r5lpCe0its8eQ=;
 b=mR38YI0ArLBexzBRMKbzwql47IbsZqMYd5w3QnwymdL+L08hyiTdmGE64SA7YcG8Zj
 klytdu6jo+yLWBzCXw9xUDmmZNF6mKyJMqepvW5gafBxUdOmvVSkK++we70bwp+lW9RA
 j1++htYUM5+UJHrkaETo5ERuPFn72tUpUmpDx4CFfIR4PGK3HTXCAgNZRq8ZkmS75v+F
 2ZDI60fu9OurfzTByVmbX67KTwHOXuQ3Iy2wYbxCz0O57Ucla3Gn48WyHtdNRUBuQ+tD
 k9xioWUABJLcRmzOuDuzsnQNEh8trY5xrZON6DuyqOoahgIvtDYAKjSw12HU7a5x0DnA
 TFiQ==
X-Gm-Message-State: AOAM531RHzmdvXJ8+CTzG7J65iZb7z7YacJ7oJxkdhvhdXWply7LH9RL
 iSEzUuuTQZ53Aux/7lKQXOYU8hx4I3wSog==
X-Google-Smtp-Source: ABdhPJwuuwzqdnkHX51SwzOgsnFvAGn+PorGGLy0eCxXAOmJXTXlO1Z06cKfGpo7RDiJDtRIGjQBAw==
X-Received: by 2002:a05:6214:529e:b0:441:2c37:52e5 with SMTP id
 kj30-20020a056214529e00b004412c3752e5mr29990671qvb.4.1648634468323; 
 Wed, 30 Mar 2022 03:01:08 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 p10-20020a05620a132a00b0067f926e36b2sm10370804qkj.91.2022.03.30.03.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:01:07 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2e6650cde1bso211465527b3.12; 
 Wed, 30 Mar 2022 03:01:06 -0700 (PDT)
X-Received: by 2002:a25:aa0e:0:b0:633:7c3b:94a0 with SMTP id
 s14-20020a25aa0e000000b006337c3b94a0mr33028380ybi.546.1648634466403; Wed, 30
 Mar 2022 03:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220329152926.50958-2-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 12:00:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhiLi8YxxG0f9hBfBkwds3LAdJNSOBSR9FYE4_z=RvcA@mail.gmail.com>
Message-ID: <CAMuHMdXhiLi8YxxG0f9hBfBkwds3LAdJNSOBSR9FYE4_z=RvcA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] gpiolib: Introduce for_each_gpiochip_node() loop
 helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_030111_110922_78F252C2 
X-CRM114-Status: GOOD (  16.10  )
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

On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Introduce for_each_gpiochip_node() loop helper which iterates over
> the GPIO controller child nodes of a given device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
