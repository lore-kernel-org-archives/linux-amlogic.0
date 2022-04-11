Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80785C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaHWNQJtqBk8IyiXmxQyFBYY21/yG0LhAHLZSaENCKY=; b=nKfnjv4pQ6eym2
	vonElb1XYfg0SoDQzbba7wA9lsJKIeF8M+6ZJ8UFNUBuu+QGIcmk64tWWwRXmhcuGx5nyD6HahV9q
	X4/rqeS6l9GM6n99zn4eQ32ukWqeeaGfaaPcJm4O6UM/VN2CeAJ+9pL78LmSxVFRAzIzPAp1V+1ye
	5tI3F6OmeHWe1gLgqNRkkdgxCriV8MB7+7wLLD5Qd/PdxMiisicsBO898tP2o1X54ONkFcr0XZAss
	t82u3S0axbgIPplQwb/Vv3hZbdS5bnNQgXNnM9lM6P0l+ctICutmQqTrdFDhoyrjPOhiV3rWgH3j8
	ht5Kdx343cFXgrZFLHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqGu-007svF-8j; Mon, 11 Apr 2022 09:23:44 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndq5p-007nny-Op; Mon, 11 Apr 2022 09:12:20 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 y3-20020a056830070300b005cd9c4d03feso10852702ots.3; 
 Mon, 11 Apr 2022 02:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TRi0bNPoJj9i+0TdWcYotMzzdlJV8VxAkudB/T4n5g=;
 b=itN7bzWHJ0xmmfybqM5mO0f9iSfuN3UUoUU0i3SQqp28amf9YAfK41HHEFM8yCrIkf
 uP2GU+cm9k66Yo1LNUMZXy3yvKNRMcc59skmyETX0adbkGzzJNl9NMW3zRt7+5o2f8tX
 w3urayTNrLrPH70g7AVHYA41iUqljxD9CaDfoiIdpqid02TPWWzsrLUWnC037oRARwx5
 R0vTR5085sTqXVbo2DBeCV5tuWUf9fQaSHSKn2m4vJQ+WU6i4RKDzEoEYt9gwvuUFQWt
 5pYlKknf/Hkt0fgSaoCEprqN5ZRuVM0fmA/Hd072qtI0HzlSk6hqsWqsv4zpobSKaApG
 a/dA==
X-Gm-Message-State: AOAM532dxT+4bV7a+iW/137CrAn3rOtqq54utscQCUHoq9To9X/GZOap
 oI6NSa1XCZvqlxqxNQ/Ke1awaqsTxH2LXQ==
X-Google-Smtp-Source: ABdhPJw9QKi8omZM4Yg3qP6+RHfmj1QvTskaibatIRG2lRsuT9r5jcS4FzqpAI8I/PKfjpRPIYEzvw==
X-Received: by 2002:a05:6830:2709:b0:5ce:b0b:1a02 with SMTP id
 j9-20020a056830270900b005ce0b0b1a02mr10844291otu.21.1649668326341; 
 Mon, 11 Apr 2022 02:12:06 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com.
 [209.85.210.43]) by smtp.gmail.com with ESMTPSA id
 w7-20020a9d6387000000b005b2265711fcsm12089725otk.16.2022.04.11.02.12.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 02:12:06 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso10846116otj.7; 
 Mon, 11 Apr 2022 02:12:06 -0700 (PDT)
X-Received: by 2002:a0d:e743:0:b0:2eb:3106:9b32 with SMTP id
 q64-20020a0de743000000b002eb31069b32mr25689449ywe.512.1649667851285; Mon, 11
 Apr 2022 02:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-10-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220401103604.8705-10-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Apr 2022 11:04:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8zWA-3_=Je7sB_72G8Ky7-syqCH-RXGxNMazUipW-2g@mail.gmail.com>
Message-ID: <CAMuHMdX8zWA-3_=Je7sB_72G8Ky7-syqCH-RXGxNMazUipW-2g@mail.gmail.com>
Subject: Re: [PATCH v4 09/13] pinctrl: meson: Rename REG_* to MESON_REG_*
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_021217_913310_A3105E34 
X-CRM114-Status: GOOD (  20.52  )
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

On Fri, Apr 1, 2022 at 12:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Currently compilation test fails on x86 due to name collision. The usual
> way to fix that is to move both conflicting parts to their own namespaces.
>
> Rename REG_* to MESON_REG_* as a prerequisite for enabling COMPILE_TEST.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -63,12 +63,12 @@ struct meson_reg_desc {
>   * enum meson_reg_type - type of registers encoded in @meson_reg_desc
>   */
>  enum meson_reg_type {
> -       REG_PULLEN,
> -       REG_PULL,
> -       REG_DIR,
> -       REG_OUT,
> -       REG_IN,
> -       REG_DS,
> +       MESON_REG_PULLEN,
> +       MESON_REG_PULL,
> +       MESON_REG_DIR,
> +       MESON_REG_OUT,
> +       MESON_REG_IN,
> +       MESON_REG_DS,
>         NUM_REG,

MESON_NUM_REG?

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
