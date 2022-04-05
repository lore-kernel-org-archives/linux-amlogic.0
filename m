Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE132C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Apr 2022 12:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3p5dTnjzK9IhfGPcDEweJsRLgdzPkOnXNaqqJZIW1I=; b=h56+A80L1Z5EXb
	E3weOwBpAnmz0bDdRbOtZGsoMlhrtHr9YecQXpaKFB3uX4fOV0MKhikdC8kC7r2ouk+Qdeghntjxj
	uNxI3qTpdTIVH9qTVxo6XA4SKQHYbvHLXN21rtHHzuYxfvOBHfAm8FBoWIPVHjva6wz96RXJgC/Pb
	qoPFxqNeA65g4K5jJixkREPB1Azcj3D1uWgaZYkNBrGAoUj/9lKsOcI6doySmTagtu7qOrCN76peN
	2gGc5Y5Hn8ONEMk8oVAxgEzKbFfUl1Rd55j97XzwmlWzVjwwPSke26VLwwOjKE1YHACQ3vYla9tce
	TchKGVvzZeYMZvWCxA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbi3g-000vo5-GN; Tue, 05 Apr 2022 12:13:16 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbi3V-000vjj-3m
 for linux-amlogic@lists.infradead.org; Tue, 05 Apr 2022 12:13:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id g20so14634068edw.6
 for <linux-amlogic@lists.infradead.org>; Tue, 05 Apr 2022 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MPvaywVSzLQsDypuAZWtv58R2kwucV8I6O2XfMn8CQ0=;
 b=K14qIg6mMRkLPr4OiAE9Cpu4U+tbA3P91G4RHNesqQyi39uh/EQnwZQg47N4I1HFGa
 VaAqAu3jWh3kOpu/vkFSBsrj1wlQcT4uTVYmxgreiwzNn3G4cU5MD051hiN68+YGuGmY
 cWQCyd0GCycNunk8Wgl1kQf10tQCes43bS272nOze5ZBtFeq/ovHUODYcVLcH0YQyWiB
 gjAhy8svdiXMCYEiMuuZdKtDH70VTPDrXTpKYTpEPlY5O8uUWZtdPs0P7eBHzY2zgCU7
 sPECd23ZpDiAOHiDWi0xlIBEdLwSexx11IbYL6ItqaYg5rExP1x8AxgVNc8xIyvnJDdV
 uHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPvaywVSzLQsDypuAZWtv58R2kwucV8I6O2XfMn8CQ0=;
 b=nni4jOHfMjMh3MQ4d9FejwU1dVqcc9sltZNFDuCgGFSvE1p3G/I2fL8hmh4ghyBl3f
 En2LVfSfaHmgJPAZMFGfeCHibRL4ss9/yqhVp1TQGkcHEcd5BHyURyKaNArC9LMVIwcX
 T8J+1U8v0vWbJ03LkWvOy3qu4lHhCVsTdu8kmzYd/BbsWYuezJhrGpfVZPXmFOwfQYPY
 PLIeQ6bH//LYAGg1Gl9Ae5xmtcstDZeVF6nanUu8AsOXdpqLqDb99r9SeCESYPTxL4fd
 actlY6cv5Pj+PsjQQGid2P12dTDOIqckU3869YRf6Yo7d2NdaPB9VslOj8zISoAkk/2t
 IQQg==
X-Gm-Message-State: AOAM533IkmrsrqfblS1Pfn1EW22GgC/HRJIE8CLes57Q0fos8Rh4TNkt
 UgAkHN+2dvknCvZurEK6Nl8KaJkVl5Meg1th0Q/Z5Q==
X-Google-Smtp-Source: ABdhPJyK6ciXtk4jJTmoikX0fzgqwOpbxHs/TrQKtZElemmsFiXP5Rij+6j+c5XTQ4r1vrmfsngJLLE7wspd4bNThOM=
X-Received: by 2002:a05:6402:d4c:b0:410:a415:fd95 with SMTP id
 ec12-20020a0564020d4c00b00410a415fd95mr3310237edb.288.1649160780633; Tue, 05
 Apr 2022 05:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220401103604.8705-2-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 5 Apr 2022 14:12:50 +0200
Message-ID: <CAMRc=McWk1piiJu60Zgzkiw5zJPmH=1Pizdn06H7YKn0HzVTHA@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] gpiolib: Introduce for_each_gpiochip_node() loop
 helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, 
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
 Philipp Zabel <p.zabel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_051305_180914_A7EE9836 
X-CRM114-Status: GOOD (  15.84  )
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

On Fri, Apr 1, 2022 at 12:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Introduce for_each_gpiochip_node() loop helper which iterates over
> the GPIO controller child nodes of a given device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/linux/gpio/driver.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index 98c93510640e..bfc91f122d5f 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -3,13 +3,14 @@
>  #define __LINUX_GPIO_DRIVER_H
>
>  #include <linux/device.h>
> -#include <linux/types.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/lockdep.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/property.h>
> +#include <linux/types.h>
>
>  struct gpio_desc;
>  struct of_phandle_args;
> @@ -750,4 +751,8 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
>  }
>  #endif /* CONFIG_GPIOLIB */
>
> +#define for_each_gpiochip_node(dev, child)                                     \
> +       device_for_each_child_node(dev, child)                                  \
> +               if (!fwnode_property_present(child, "gpio-controller")) {} else
> +
>  #endif /* __LINUX_GPIO_DRIVER_H */
> --
> 2.35.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
