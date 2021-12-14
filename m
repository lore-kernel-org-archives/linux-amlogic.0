Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C221C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Dec 2021 12:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6N48tn5rzoC2jz3ddiVQ5o4/Z3DCDi4qdtBjwSJaNs8=; b=vjv7OPO0PdEj6P
	tpfGk6RfUo3MnEWe5AWktEgGvu0niBLXvqSy8aALeH0uspopoHA17JGTBfMTxjRFJt8RF2fvnDKMa
	2iIjZcelomcUWp8TrV9UhkBTmrdM5LW9pWCFGgATfw9hJUhnoO2gYWPdedPWvscS+osvvjaCGizFb
	01uYleY7WBDOGJDSJCW4ohMis+O10YoFF1a8WFyJKd+izLC5cVcN/ISvPXmhHXUs9y+BJZ99rOCtL
	4UDcEQzNRLPJx1vWFKyVrm2XEKwsUWtiOl5hWxVOM9jPewuMu18ky90Elih/7Ts0b67/4sVnQrBKu
	3JoTlzonJQSRQK+ke/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx6bJ-00DqJz-Sc; Tue, 14 Dec 2021 12:08:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx6S7-00Do03-TA; Tue, 14 Dec 2021 11:58:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id e3so63033801edu.4;
 Tue, 14 Dec 2021 03:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Yz7eU35vqRDb2z6sN8MYznQDPOspquHEIsAYoRHMKo=;
 b=crUZ9vPwt6eX1JdysOVY5ooAd1RjhuZm8E1RTpcm6qUCJWz16hkXEznHIA1sGMi7Sb
 4K5IsW59L/sdKwK5GNA33DsQPilDyHTC7a0HYFiecf5fj0K0xPXnO/VA+70diYxna3/T
 yozXmg+GrB6pb2pyMS61LEGotetWw95G37HeGy+n/BHdBwmZH5gXJDa5oM0teKbJem1q
 sBQV8VrooDTadO0wbKnnpHZxWkkaxcj8jMY+yKGqEECPha6Pw3uCWJOWVAjO1KKC31/P
 KKOMSJ8AMjTB55JqekbQvfiRbZfu5E/sy4LY4RI29ClPetueHWkh7wmwxNVYpzInW6hd
 b+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Yz7eU35vqRDb2z6sN8MYznQDPOspquHEIsAYoRHMKo=;
 b=zVCpFPSritGoVdPKkCGLT4blJfdCAvu6Gw6vJ6EEj3YcIy7kBM+s0i5hGZkoBQ4up8
 vWD3Amx5s2QMdHho35WymmwJUhZQOazmqRwRK6zcWufZKxokELLxQ1a28WKXrpBHg0J7
 LlSt0p5A8ZCG7lDhnydbLQgS42S4TJgJwqSNv33ym0hazzSh4xFD+1DBVihpeJvXu0Vk
 MRX07Opjnzu89Z+mRq/L4F8K6e//Ley2EPwwCGEjluQy5HJQILhavdoL4A41vBMc8aEm
 vna24gvJE0Rf2svKbjDiThyL1Ziu/KCA4GHMsfOP4zAzMqNA8wHJK8UxWysvrj/7DPCv
 LqRg==
X-Gm-Message-State: AOAM532JHd+qAWEg3ytiHTRCDPdnKIl2+x8g7yGTcvKHQRpO0eQhK7Xx
 LrftYZVTVBv8yhQULxa7X7L+GBWux4kjujljBDI=
X-Google-Smtp-Source: ABdhPJz1hiBiXGOUcreG+/Of5n2uneQz2aXfnvCnSmW7WT2ZBwmwo9wPrFJOwFncr/N/AwQQ+FfBPBaevPLiKUBiMl4=
X-Received: by 2002:a17:907:75f0:: with SMTP id
 jz16mr5581618ejc.77.1639483116361; 
 Tue, 14 Dec 2021 03:58:36 -0800 (PST)
MIME-Version: 1.0
References: <20211214022100.14841-1-qianggui.song@amlogic.com>
 <20211214022100.14841-4-qianggui.song@amlogic.com>
In-Reply-To: <20211214022100.14841-4-qianggui.song@amlogic.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Dec 2021 13:57:06 +0200
Message-ID: <CAHp75VczRGaKY_O3SV9xx-G95Rk8uFPwNFuVE1iy+HAxgL+oVg@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: meson: add pinctrl driver support for
 Meson-S4 Soc
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_035840_051770_37604202 
X-CRM114-Status: GOOD (  14.32  )
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

On Tue, Dec 14, 2021 at 6:27 AM Qianggui Song <qianggui.song@amlogic.com> wrote:
>
> Add new pinctrl driver for Amlogic's Meson-S4 SoC which share the
> same register laytout as the previous Meson-A1.

layout

...

> +config PINCTRL_MESON_S4
> +       tristate "Meson s4 Soc pinctrl driver"
> +       depends on ARM64
> +       select PINCTRL_MESON_AXG_PMX

> +       default y

Why is it needed on other (non-MESON_S4) SoCs?

...

> +static const char * const i2c1_groups[] = {
> +       "i2c1_sda_c", "i2c1_scl_c",
> +       "i2c1_sda_d", "i2c1_scl_d",
> +       "i2c1_sda_h", "i2c1_scl_h",
> +       "i2c1_sda_x", "i2c1_scl_x"

In this and all the rest similar cases leave a comma.

> +};

...

> +static const struct of_device_id meson_s4_pinctrl_dt_match[] = {
> +       {
> +               .compatible = "amlogic,meson-s4-periphs-pinctrl",
> +               .data = &meson_s4_periphs_pinctrl_data,
> +       },

> +       { },

When it's a terminator entry, no comma is needed.

> +};

...

> +static struct platform_driver meson_s4_pinctrl_driver = {
> +       .probe  = meson_pinctrl_probe,
> +       .driver = {
> +               .name   = "meson-s4-pinctrl",
> +               .of_match_table = meson_s4_pinctrl_dt_match,
> +       },
> +};

> +
> +module_platform_driver(meson_s4_pinctrl_driver);

Swap above two lines, first module_...() followed by a blank line.

> +MODULE_LICENSE("Dual BSD/GPL");

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
