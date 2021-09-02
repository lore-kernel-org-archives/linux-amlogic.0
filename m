Return-Path: <SRS0=tLoi=NY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87352C83026
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 17:01:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4889C61041
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Sep 2021 17:01:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4889C61041
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCM9VsWQP7FbdCjaYVxpa8LeoQojvEv8vN89V8AfG+Q=; b=MWY49VuzzC9xwO
	OunwHR3+CeQwTNM/WZMGxunhjUbb03t0eZvniOB16qAoNr2cXHrpcvMgRN40rU61Fq6jsnjlOaTP6
	8L0Uec1PnghnfS/p9t0p5xm3VRQ7z1y8x91fegkp5QJasbjR/f7JrGwxteT8tdQGd7WFbY66Jjjy7
	5/4O54lF/oR2coeZFR3/H8zs+EP2Xx8Vz7ugrMJrMR/v8qfbLUMXoxABRFXt4RqyoS/HcoUqg+/0c
	4+bwa+2/XOa3uemmlx3fxozih64zTvYuTI3GyGbSsR1lgbCvy67d9g5mNLW7ErnwmdqjCCC2FH2+1
	yGrhUmPCPXRgIBzulK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLq5m-00A4eW-K3; Thu, 02 Sep 2021 17:01:34 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLq5Z-00A4c8-Gh
 for linux-amlogic@lists.infradead.org; Thu, 02 Sep 2021 17:01:22 +0000
Received: by mail-yb1-xb29.google.com with SMTP id v26so5128607ybd.9
 for <linux-amlogic@lists.infradead.org>; Thu, 02 Sep 2021 10:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PpysPmik57x5vnDmjTrZwtUlMx9bD37Da+iZfWbm5qg=;
 b=MjoPmyE65znm1D0n+HXu82MDj+gi8kUK0hXr1O6+Bjv/0XAG2S5ahgwzwBD+Cnu3oO
 mCweJVAtssAovQojoUmS6Ci++Uti7Ht6PYH1jWKKoI5eVjR67tdebUj2PCrXVlmfg8tM
 GyiQeXcN+v9qtEiprBzVjjzZ7yQjO3B3RB0RjTjVFZec+EtnhvmuxQV6HzPf1Ce4rVYk
 Gy9f0zlDrqqWd5K0smV29f3g4eEijuq462wK6TYG45R1D1Ize7UGrVUTJ2rR8JN5ILQ9
 GYAjv/Mfjox9wtbxaEeHdHUz20MaTDkDSEcwV5fAbMdjTM64pRm6mNidTYDDG6UJo3t6
 KbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PpysPmik57x5vnDmjTrZwtUlMx9bD37Da+iZfWbm5qg=;
 b=NoeWtwLd+EmQ4KMod1wYjRly6BSeijHSQ3arBou3F/7f76my7YKgva85e+3SEfqxC1
 zLR3IghaObSNB2fZDBqFTf+Z78FSw6/uWY+so/JsezTEJqwh5wXQBkSWQFY1OumoPND/
 VyrfOVza4rYVW/3CusseJQg3+G8dG2JZ+F/g0zh8vdem2q6lDXQmiULfZXPQK69DDml0
 SBSwzLgYsrguq8eTLo9tG3V9UyIZZ1p4zxih370JSJbLTo6GTuGVKFpoIC5uOs16OnM3
 JBaGNDtT22KxJwLTNnRfAziVZX0GvdwcCO/LB86iCBZYBLNDJcZrqLGs07PsEgHaO+k4
 //fA==
X-Gm-Message-State: AOAM530K9aXfqrIbp3MP6wmfIOakOXRzJ/MQVhOREeJmLdaV2Aau/H9r
 hADG++AVPjVzOeJG3z/AtV+eDkc6hmB+fzE+m1Je3Q==
X-Google-Smtp-Source: ABdhPJyt8C3Ru+98FAhkc1VPkGvpkiogD6mUaNAdSCekNWLAzApbq4a2RvTAF9sHto1glvhd7SJ6dQ+62d8ugoff0lE=
X-Received: by 2002:a25:6746:: with SMTP id b67mr6335807ybc.96.1630602080287; 
 Thu, 02 Sep 2021 10:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210902134914.176986-1-narmstrong@baylibre.com>
 <20210902134914.176986-2-narmstrong@baylibre.com>
In-Reply-To: <20210902134914.176986-2-narmstrong@baylibre.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 2 Sep 2021 10:00:44 -0700
Message-ID: <CAGETcx9KYWmmSYjXGPW6awmVYcKr6sdmxhc_tP=hf149=8Pm6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] irqchip: irq-meson-gpio: make it possible to build as
 a module
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: maz@kernel.org, tglx@linutronix.de, jbrunet@baylibre.com, 
 khilman@baylibre.com, lee.jones@linaro.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210902_100121_586056_02721C8E 
X-CRM114-Status: GOOD (  19.96  )
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

On Thu, Sep 2, 2021 at 6:49 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> In order to reduce the kernel Image size on multi-platform distributions,
> make it possible to build the Amlogic GPIO IRQ controller as a module
> by switching it to a platform driver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/irqchip/Kconfig          |  5 +++--
>  drivers/irqchip/irq-meson-gpio.c | 15 +++++++++------
>  2 files changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 4d5924e9f766..2aba485025fd 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -400,8 +400,9 @@ config IRQ_UNIPHIER_AIDET
>           Support for the UniPhier AIDET (ARM Interrupt Detector).
>
>  config MESON_IRQ_GPIO
> -       bool "Meson GPIO Interrupt Multiplexer"
> -       depends on ARCH_MESON
> +       tristate "Meson GPIO Interrupt Multiplexer"
> +       depends on ARCH_MESON || COMPILE_TEST
> +       default ARCH_MESON
>         select IRQ_DOMAIN_HIERARCHY
>         help
>           Support Meson SoC Family GPIO Interrupt Multiplexer
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index e50676ce2ec8..d90ff0b92480 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -436,8 +436,7 @@ static const struct irq_domain_ops meson_gpio_irq_domain_ops = {
>         .translate      = meson_gpio_irq_domain_translate,
>  };
>
> -static int __init meson_gpio_irq_parse_dt(struct device_node *node,
> -                                         struct meson_gpio_irq_controller *ctl)
> +static int meson_gpio_irq_parse_dt(struct device_node *node, struct meson_gpio_irq_controller *ctl)
>  {
>         const struct of_device_id *match;
>         int ret;
> @@ -463,8 +462,7 @@ static int __init meson_gpio_irq_parse_dt(struct device_node *node,
>         return 0;
>  }
>
> -static int __init meson_gpio_irq_of_init(struct device_node *node,
> -                                        struct device_node *parent)
> +static int meson_gpio_irq_of_init(struct device_node *node, struct device_node *parent)
>  {
>         struct irq_domain *domain, *parent_domain;
>         struct meson_gpio_irq_controller *ctl;
> @@ -521,5 +519,10 @@ static int __init meson_gpio_irq_of_init(struct device_node *node,
>         return ret;
>  }
>
> -IRQCHIP_DECLARE(meson_gpio_intc, "amlogic,meson-gpio-intc",
> -               meson_gpio_irq_of_init);
> +IRQCHIP_PLATFORM_DRIVER_BEGIN(meson_gpio_intc)
> +IRQCHIP_MATCH("amlogic,meson-gpio-intc", meson_gpio_irq_of_init)
> +IRQCHIP_PLATFORM_DRIVER_END(meson_gpio_intc)
> +
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:meson-gpio-intc");
> --

Acked-by: Saravana Kannan <saravanak@google.com>

Marc, my mdio-mux patches have landed.

-Saravana

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
