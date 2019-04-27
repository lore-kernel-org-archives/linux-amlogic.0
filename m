Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D4DC43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 19:45:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F3E2206C1
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 19:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qB5Dh6aJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tAFNMZnu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F3E2206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZloQiL43VGOIDOzyJlj5507skqIEFzriPGwhiFIDy74=; b=qB5Dh6aJGeT/mK
	DYLfpXftXWTFLhceHCc7aH8kOt9znsARVeh78M2xv3cArA+r2SkMHviAcsvTa2Je2rr7H3oqToHbn
	FHB9AiWP8FlgNFnoe1b1OuncjrnhVnDHgRnbtCXdlDqmbteSm9+zaum/aYx/M+hq1dmVjpN06kNtA
	dMl/QQTiol0nxH14ZfhgZdne//eQPnUbDCwo9DkmaZrFPvhK2GTOGaDGHN9MHYrNAZlbV0UXrBDd8
	1n9wagIw9vktxWyiWkM2UXzYFwULC6zTwlX1d7mb5BNi2Y8x+hcWYbY4RIhqoV9wCxoFnAVnGsKib
	YTC0iFDV4k0TMjf7h3bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTFy-0005SQ-9l; Sat, 27 Apr 2019 19:45:06 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTFt-0004jb-SE
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 19:45:03 +0000
Received: by mail-ot1-x342.google.com with SMTP id e5so5454294otk.12
 for <linux-amlogic@lists.infradead.org>; Sat, 27 Apr 2019 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZrnkBtzqFuZG5/YU7lSJzinvOKQp1C+Dl/uLWBt5lyY=;
 b=tAFNMZnuynUw3OoIdV0FAWki/AcGKSFLOOYJT4Xo1WF+gl14ydAwEWjmPoOjGO5/7C
 XmL98xMhSGeswWJW8llFTj9ObOeiD2afRkGLHUwMjGqO+B7YARy3pgA96bTu6OCkYg+/
 KpzHlhai5QoT33dTl8rBD3eG62y3lt36xPjzS6pJaE0P1RApaO4AjMzMsONDkgUhO9iP
 5eQb5iYCUXMw5dC+OU03UmhI4zAxLFOPH8DOndsaGe8ZS2DZB3BuYxKxiSJkkfuu5Ypv
 ibdq6JaxQvbzpwT3g2SM3nyou2uBNkM4Z+fp2ZHiTlsAaQXx2x5UMxewoQzimXnRFjt+
 aW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZrnkBtzqFuZG5/YU7lSJzinvOKQp1C+Dl/uLWBt5lyY=;
 b=r/BokH4FNWxQT1BdAX9SZOyes+6md6NYdBdQPpC2YKiCrUuGkPFg0h93x0gBpF3Pg7
 Ru7rfgMyhmQE/9IQWd0QsJ03rzSvUehY75L/ViWyA7nGgb6oGtWe6l3ibQWFi5AqxCVl
 enJQUrcQV1hkpayO/F+6o75+S5kgr8jnrgUkaYMZ/0gP3jXZ+ptSztsZDetDo/DqnSbD
 qUQU0uH0LpDdjUC3BLFXW7nAXFFAO8BwNcK9P0djV1nY6pC3yl0w9cDrjuRk3kpH6qW6
 lPWxPih3sKcWnGB1VCPdJfc+yl+yuHHBTIAzW4PRaGcwIzDdge1xiFFo+VhMHMzxtz/4
 0D7A==
X-Gm-Message-State: APjAAAUd84CAm0m12xySO6N88r9Tq9/VLNZIHJB4hzC0jw/cFsD5Oil2
 uErG/ngCyQaUyEXvOsziwafhmbkrVI1sKovU+hE=
X-Google-Smtp-Source: APXvYqzRcnvobZTohYXk9BC4EGQlSfX/Obs6I7q01vTAhbUN/oXkSSPI8KQMEb/0XON1eZrfgCcpTwsUmH5B8MxLLS8=
X-Received: by 2002:a9d:5e90:: with SMTP id f16mr31000556otl.86.1556394300465; 
 Sat, 27 Apr 2019 12:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-5-glaroque@baylibre.com>
In-Reply-To: <20190418124758.24022-5-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 21:44:49 +0200
Message-ID: <CAFBinCDNz1txJ7_aQU8MwjpeVFC6BgyG_gkg-jJRnnerSjbP9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: meson: add support of drive-strength-uA
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_124501_950399_278052EC 
X-CRM114-Status: GOOD (  25.39  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Guillaume,

On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> drive-strength-uA is a new feature needed for G12A SoC.
> the default DS setting after boot is usually 500uA and it is not enough for
> many functions. We need to be able to set the drive strength to reliably
> enable things like MMC, I2C, etc ...
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
I gave this a go on Meson8m2 (meaning I applied all four patches from
this series and booted the result on my board):
[Meson8m2 doesn't support drive strength and still boots without any
crashes or obvious regressions]
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c |  36 ++---
>  drivers/pinctrl/meson/pinctrl-meson.c      | 166 ++++++++++++++++-----
>  drivers/pinctrl/meson/pinctrl-meson.h      |  20 ++-
personally I would have split this into two separate patches:
- one for the generic pinctrl-meson part which adds drive-strength-uA support
- another patch for enabling this on G12A

if nobody else wants you to split this then it's fine for me as well

>  3 files changed, 163 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index d494492e98e9..3475cd7bd2af 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -1304,28 +1304,28 @@ static struct meson_pmx_func meson_g12a_aobus_functions[] = {
>  };
>
>  static struct meson_bank meson_g12a_periphs_banks[] = {
> -       /* name  first  last  irq  pullen  pull  dir  out  in */
> -       BANK("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
> -            4,  0,  4,  0,  12,  0,  13, 0,  14, 0),
> -       BANK("H",    GPIOH_0,    GPIOH_8, 28, 36,
> -            3,  0,  3,  0,  9,  0,  10,  0,  11,  0),
> -       BANK("BOOT", BOOT_0,     BOOT_15,  37, 52,
> -            0,  0,  0,  0,  0, 0,  1, 0,  2, 0),
> -       BANK("C",    GPIOC_0,    GPIOC_7,  53, 60,
> -            1,  0,  1,  0,  3, 0,  4, 0,  5, 0),
> -       BANK("A",    GPIOA_0,    GPIOA_15,  61, 76,
> -            5,  0,  5,  0,  16,  0,  17,  0,  18,  0),
> -       BANK("X",    GPIOX_0,    GPIOX_19,   77, 96,
> -            2,  0,  2,  0,  6,  0,  7,  0,  8,  0),
> +       /* name  first  last  irq  pullen  pull  dir  out  in  ds */
> +       BANK_DS("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
> +               4,  0,  4,  0,  12,  0,  13, 0,  14, 0, 5, 0),
> +       BANK_DS("H",    GPIOH_0,    GPIOH_8, 28, 36,
> +               3,  0,  3,  0,  9,  0,  10,  0,  11,  0, 4, 0),
> +       BANK_DS("BOOT", BOOT_0,     BOOT_15,  37, 52,
> +               0,  0,  0,  0,  0, 0,  1, 0,  2, 0, 0, 0),
> +       BANK_DS("C",    GPIOC_0,    GPIOC_7,  53, 60,
> +               1,  0,  1,  0,  3, 0,  4, 0,  5, 0, 1, 0),
> +       BANK_DS("A",    GPIOA_0,    GPIOA_15,  61, 76,
> +               5,  0,  5,  0,  16,  0,  17,  0,  18,  0, 6, 0),
> +       BANK_DS("X",    GPIOX_0,    GPIOX_19,   77, 96,
> +               2,  0,  2,  0,  6,  0,  7,  0,  8,  0, 2, 0),
>  };
>
>  static struct meson_bank meson_g12a_aobus_banks[] = {
> -       /* name  first  last  irq  pullen  pull  dir  out  in  */
> -       BANK("AO",   GPIOAO_0,  GPIOAO_11,  0, 11,
> -            3,  0,  2, 0,  0,  0,  4, 0,  1,  0),
> +       /* name  first  last  irq  pullen  pull  dir  out  in  ds */
> +       BANK_DS("AO", GPIOAO_0, GPIOAO_11, 0, 11, 3, 0, 2, 0, 0, 0, 4, 0, 1, 0,
> +               0, 0),
>         /* GPIOE actually located in the AO bank */
> -       BANK("E",   GPIOE_0,  GPIOE_2,   97, 99,
> -            3,  16,  2, 16,  0,  16,  4, 16,  1,  16),
> +       BANK_DS("E", GPIOE_0, GPIOE_2, 97, 99, 3, 16, 2, 16, 0, 16, 4, 16, 1,
> +               16, 1, 0),
>  };
these definitions are really hard to read, but it's been like this
even before your patch

>  static struct meson_pmx_bank meson_g12a_periphs_pmx_banks[] = {
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 96a4a72708e4..5108e5aa6514 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -174,62 +174,106 @@ int meson_pmx_get_groups(struct pinctrl_dev *pcdev, unsigned selector,
>         return 0;
>  }
>
> -static int meson_pinconf_set(struct pinctrl_dev *pcdev, unsigned int pin,
> -                            unsigned long *configs, unsigned num_configs)
> +static int meson_pinconf_set_bias(struct meson_pinctrl *pc, unsigned int pin,
> +                                 enum pin_config_param conf)
can you please confirm that I understood the purpose of this correctly:
I think you introduce this to make setting the bias consistent with
how you set the drive-strength.
if so then it would be great to have a separate patch which describes
that it's only a code-style change and a functional no-op

additionally the function arguments are not consistent with
meson_pinconf_get_drive_strength():
- here you pass the pinctrl subsystem specific parameters (enum
pin_config_param conf)
- in meson_pinconf_get_drive_strength the conversion for pinctrl
subsystem specific values (pinconf_to_config_argument) is part of
meson_pinconf_set
I'm wondering whether two separate functions
(meson_pinconf_disable_bias and meson_pinconf_enable_bias) would make
things easier to read. I haven't tried whether this would really make
things better, so I'd like to hear your opinion on this Guillaume!

[...]
> +static int meson_pinconf_set_drive_strength(struct meson_pinctrl *pc,
> +                                           unsigned int pin, u16 arg)
>  {
> -       struct meson_pinctrl *pc = pinctrl_dev_get_drvdata(pcdev);
>         struct meson_bank *bank;
> -       enum pin_config_param param;
>         unsigned int reg, bit;
> -       int i, ret;
> +       unsigned int ds_val;
> +       int ret;
> +
> +       if (!pc->reg_ds) {
> +               dev_err(pc->dev, "drive-strength not supported\n");
> +               return -ENOTSUPP;
in meson_pinconf_set() we don't complain (with a dev_err) for this case.
I'm not sure what the best-practice is for the pinctrl subsystem,
maybe Linus can comment on this

> +       }
>
>         ret = meson_get_bank(pc, pin, &bank);
>         if (ret)
>                 return ret;
>
> +       meson_calc_reg_and_bit(bank, pin, REG_DS, &reg, &bit);
> +       bit = bit << 1;
> +
> +       if (arg <= 500) {
> +               ds_val = MESON_PINCONF_DRV_500UA;
> +       } else if (arg <= 2500) {
> +               ds_val = MESON_PINCONF_DRV_2500UA;
> +       } else if (arg <= 3000) {
> +               ds_val = MESON_PINCONF_DRV_3000UA;
> +       } else if (arg <= 4000) {
> +               ds_val = MESON_PINCONF_DRV_4000UA;
> +       } else {
> +               dev_warn_once(pc->dev,
> +                             "pin %u: invalid drive-strength : %d , default to 4mA\n",
> +                             pin, arg);
> +               ds_val = MESON_PINCONF_DRV_4000UA;
why not return -EINVAL here? (my assumption is that the pinctrl
subsystem would like to have -EINVAL instead of drivers doing
fallbacks if the values are out-of-range, but I'm not 100% sure about
this)

[...]
> +static int meson_pinconf_get_drive_strength(struct meson_pinctrl *pc,
> +                                           unsigned int pin, u16 *arg)
> +{
> +       struct meson_bank *bank;
> +       unsigned int reg, bit;
> +       unsigned int val;
> +       int ret;
> +
do you need to return -ENOTSUPP here if pc->reg_ds is NULL, similar to
what you already have in meson_pinconf_set_drive_strength()?


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
