Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246D8C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 10:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgOgIROnAxSbGQNG/UuSPOvaxdt4kWSZ4SlzVXZv4Q4=; b=2gjse/86uyfjek
	vNDiLbksDq3Tu4Ltga/ainfG7LlcaR5bMxmOoBINs9JVPIcw/nDREE2v65oOCrl74d+tEbDwO5P04
	a2/MY3AVWo8G/M5NOZEUFGdsstv2xkX6Y4vcwB4kFz7XO0mnJ07WajOO4fdy4sDDzfiykXKIQZiqC
	/1QJCApF2SP6lnKyEl7wlezOESzb9Aa5iOVf2Xhe3hXn5CSp/24nyH5wge3b1U7fz1yD7J2JuNoM/
	93vgjg/ULEc88p6mRXC7xaxqQR9yC5Cofx9qtoysPK3ALYwMFL10yQ0HFGNnVF7MRKeXUZggl7Biv
	Blm0QLkISqpQVc4bAQvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZV8L-00F66O-4U; Wed, 30 Mar 2022 10:00:57 +0000
Received: from mail-qv1-f41.google.com ([209.85.219.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZV85-00F61R-Eg; Wed, 30 Mar 2022 10:00:43 +0000
Received: by mail-qv1-f41.google.com with SMTP id gi14so16504499qvb.0;
 Wed, 30 Mar 2022 03:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBxbmNoSIF+gD71y4kkXlaJNmYHsVeI/sGoRnpdFxrc=;
 b=k4hdauQemjUfjg1W+yezxd6bHrA0jfrxRdmlOKfKEXDSl5YEyyyQMhVAEw+aKAnMWU
 G9lBKOeBbDCYp3s61NgNBvpGzzCQ1GU1BqXvhoBF0uWOZ9po0CcgcxLIqFPRsQHA73bA
 a3z7QtuTNvRZYwo39QlK8yhKTb1w+soId42p35abN1tfqIFeVixK0PmA9ZaXb6rQ1bz0
 AXt0AJX7S7sgYdRXBmMbvvO3Hqrv65eyxaRwjZZpvQB0ekWT8fL4F43c8Lq7I+J8U3bC
 0jtsaxHDyq8KTOjPxkiD3SgkSrm7R396A+vE+5dd9wfiBSBXVSnUpXkxB9ts5iGRFdzZ
 RHwA==
X-Gm-Message-State: AOAM53176xQ+EdCGkLf6k9l0vfJ6dy0l+4KltOMtwzyXBN7QwAfLeP7j
 5etD3jjzMvjzR2GTMptGYUYVCeXE8YEteg==
X-Google-Smtp-Source: ABdhPJz4+IUN9VXKLzMC59C6oZoib+QrodCK0GN8hnLm/8Lpl59Pen3593RiZL7RRsDoZoCRS/RrWg==
X-Received: by 2002:a05:6214:766:b0:441:a5df:8ace with SMTP id
 f6-20020a056214076600b00441a5df8acemr22858794qvz.87.1648634439386; 
 Wed, 30 Mar 2022 03:00:39 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 k73-20020a37a14c000000b0067b316a4161sm11057850qke.120.2022.03.30.03.00.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:00:38 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-2e592e700acso212349357b3.5; 
 Wed, 30 Mar 2022 03:00:38 -0700 (PDT)
X-Received: by 2002:a25:45:0:b0:633:96e2:2179 with SMTP id
 66-20020a250045000000b0063396e22179mr32596280yba.393.1648634438344; 
 Wed, 30 Mar 2022 03:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-8-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220329152926.50958-8-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 12:00:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
Message-ID: <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] pinctrl: renesas: rza1: Switch to use
 for_each_gpiochip_node() helper
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
X-CRM114-CacheID: sfid-20220330_030041_517933_FC7F55EB 
X-CRM114-Status: GOOD (  24.19  )
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

Hi Andy,

On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Switch the code to use for_each_gpiochip_node() helper.
>
> While at it, in order to avoid additional churn in the future,
> switch to fwnode APIs where it makes sense.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rza1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rza1.c

> @@ -1166,17 +1167,17 @@ static const struct pinmux_ops rza1_pinmux_ops = {
>   * @range: pin range to register to pinctrl core
>   */
>  static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
> -                              struct device_node *np,
> +                              struct fwnode_handle *fwnode,
>                                struct gpio_chip *chip,
>                                struct pinctrl_gpio_range *range)
>  {
>         const char *list_name = "gpio-ranges";
> -       struct of_phandle_args of_args;
> +       struct fwnode_reference_args of_args;

fw_args?

>         unsigned int gpioport;
>         u32 pinctrl_base;
>         int ret;
>
> -       ret = of_parse_phandle_with_fixed_args(np, list_name, 3, 0, &of_args);
> +       ret = fwnode_property_get_reference_args(fwnode, list_name, NULL, 3, 0, &of_args);
>         if (ret) {
>                 dev_err(rza1_pctl->dev, "Unable to parse %s list property\n",
>                         list_name);
> @@ -1197,13 +1198,12 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
>
>         *chip           = rza1_gpiochip_template;
>         chip->base      = -1;
> -       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
> -                                        np);
> +       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pfw", fwnode);

This changes the label from e.g. "/soc/pinctrl@fcfe3000/gpio-11" to "gpio-11".

%pfwP?

>         if (!chip->label)
>                 return -ENOMEM;
>
>         chip->ngpio     = of_args.args[2];
> -       chip->of_node   = np;
> +       chip->fwnode    = fwnode;
>         chip->parent    = rza1_pctl->dev;
>
>         range->id       = gpioport;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
