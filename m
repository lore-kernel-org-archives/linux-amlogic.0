Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE9CC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSgGIXO6YWsMr/dl1VD8NS1sSByolsLk31WJyMhbEcs=; b=x90x98ivKMcwcF
	uUN/JzYKGkOnnqbtiRXQI/r509qvr5iHw2Bcgh+zG68mREEp1w1ql/+8EiU0vkwf64kVgoUl7572X
	3FwIXBEYSc9X2plWRa2KUcBvc+yZXQ6bKEXN8Tz9VT1sZbBbKQvaAuEgaQ8OtNnaMFWR4DWwzD8WX
	+yipPoZw4Ux+o1iYubrO9xpLdHbPsz6LI1lU1omGkLMQinhDSpXimEgkpPvJp4QTNJIchuWfDIo0G
	mYQ8kIH8xKIUU6uzlKzyxJspLHR1IXiQuym7pLt1TkIS7HbIIBMCtH6VFn01INl7CPpJwLJHBqjU3
	KQb5jF1fFxoTERvCJ9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZVA4-00F6rT-Gk; Wed, 30 Mar 2022 10:02:44 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZV9j-00F6i3-0r; Wed, 30 Mar 2022 10:02:24 +0000
Received: by mail-qv1-f51.google.com with SMTP id kl29so16457129qvb.2;
 Wed, 30 Mar 2022 03:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxF35tmxxnkPH4ZK5NEAQj60FJRzpVvnSJO5oaHeufw=;
 b=erlYgveh6OUV2It7STm/ySVjsE5MD2DIsem7mcWspWw5xXkPYwL/9LUmryNyB9Vs+T
 S6ZlmIQq0EPejlH4+kb/BTNORxtzWnQ0aWdIHTJiBerAjBjXJq07/09v0MLy77CWkMzy
 IV9UU2okVq5MDHYq7Usc12+QhJYR6zWVW65zwrRC4Mmh0tHR7ceeBEKgWnMJyytAWdPz
 geKWOgw98mETBWLlagYQCXfJseNVZfy5uNt7nAgbg0PVfvFqfXpPsbuSFvdDzLQbv55S
 O5QTHmaFeCENnvj/JxdTG5tXJopJCHfb407Vp9ly77oDacKNMrGoSQfnoJkKEurvyCpT
 kkTQ==
X-Gm-Message-State: AOAM531+ATG/6SVj+VrmqvW2KVScOKrbO8Qed2hNFAMtW3H//10zNI8F
 phiaoB4Xz9bELirwTydufPhXVw0/i4C7dQ==
X-Google-Smtp-Source: ABdhPJwOx4he8Sa2GMhsR36an9D7Ai59usGNGsnEp2GILWRD/+H1/xo8gh+KgGnk9PBQRzo+YeRDfA==
X-Received: by 2002:a05:6214:2aaa:b0:441:5342:8614 with SMTP id
 js10-20020a0562142aaa00b0044153428614mr16888969qvb.63.1648634541017; 
 Wed, 30 Mar 2022 03:02:21 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 y12-20020a05622a164c00b002e1e277885esm16517886qtj.8.2022.03.30.03.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:02:19 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2e592e700acso212468767b3.5; 
 Wed, 30 Mar 2022 03:02:18 -0700 (PDT)
X-Received: by 2002:a0d:ccd6:0:b0:2e7:98e2:a5a2 with SMTP id
 o205-20020a0dccd6000000b002e798e2a5a2mr28100571ywd.479.1648634538529; Wed, 30
 Mar 2022 03:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220329152926.50958-3-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 12:02:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFENTrXsYq3PKRFBqUL570-pPMG43Vct62=U9cyyF0yQ@mail.gmail.com>
Message-ID: <CAMuHMdWFENTrXsYq3PKRFBqUL570-pPMG43Vct62=U9cyyF0yQ@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] gpiolib: Introduce gpiochip_node_count() helper
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
X-CRM114-CacheID: sfid-20220330_030223_117538_4CDB291E 
X-CRM114-Status: GOOD (  22.04  )
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
> The gpiochip_node_count() helper iterates over the device child nodes that
> have the "gpio-controller" property set. It returns the number of such nodes
> under a given device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -755,4 +755,16 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
>         device_for_each_child_node(dev, child)                                  \
>                 if (!fwnode_property_present(child, "gpio-controller")) {} else
>
> +static inline unsigned int gpiochip_node_count(struct device *dev)
> +{
> +       struct fwnode_handle *child;
> +       unsigned int count;

Preinitialize to zero?

> +
> +       count = 0;
> +       for_each_gpiochip_node(dev, child)
> +               count++;
> +
> +       return count;
> +}
> +
>  #endif /* __LINUX_GPIO_DRIVER_H */

Regardless:
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
