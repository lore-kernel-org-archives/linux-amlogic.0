Return-Path: <SRS0=vfsC=76=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58557C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2020 05:40:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2090120853
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2020 05:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sr8XNSPu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=verdurent-com.20150623.gappssmtp.com header.i=@verdurent-com.20150623.gappssmtp.com header.b="kz5EDsy5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2090120853
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verdurent.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDt9f/zg6eBqvH+f0lSQbq+ZBlvTOC3NViRaCaSMx1c=; b=Sr8XNSPuUGFM5q
	LODJePI7j/1ucOogoX9huBIH3O/yE1Y+GE6WidizKGaOk9mHpBpdtM6tXmpmj1JaDmjllyB7/sW6I
	RwACQMexM5ZBcjxk9lNXiDo5Q+26ppW2mQlpCSg66M3zi4H8fT+9Fbv6/DNiCc8GQwChM4S54gXiC
	nk6LqNZb3eaNFYoM8XfGrubDdFDgqeE+3Cwupamgr20B3roBK09VnM2Cd/MquEFe090SN7NdWAPx8
	J/+KXMTaxpn5xn9lOxpfhNK8LwuMs/OyOpPirIPNrEahxO0J43JYby1nszsp4A+v9cBoscNDHKsJI
	QOMTMte3u+Rw+MmDP/9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlQnR-0002wi-5c; Wed, 17 Jun 2020 05:39:37 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlQnO-0002vo-Ls
 for linux-amlogic@lists.infradead.org; Wed, 17 Jun 2020 05:39:36 +0000
Received: by mail-vs1-xe44.google.com with SMTP id c1so641560vsc.11
 for <linux-amlogic@lists.infradead.org>; Tue, 16 Jun 2020 22:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=verdurent-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vagjVKSkecC/z5l23mqjlUJhPMrSeSw7xH2X0+6z0lQ=;
 b=kz5EDsy5OwgZsAA8HYLMeWwC0dLYIH2p0Rt2PGqOE/VBizT4ojX7X7YXeCTs263LpB
 DGIv3XKtXblVdKAWygKjF6Jo8N3TpDFXd6pxFTTUOrGxGN6ZRBIgUu6nkKrI3Rc+RVx2
 1pzbmyf6x67qKW6fwH63zuHn0mD8dVxRHp7gOoi/eSxTzpRzQzvAgPVc0Ky4HB+1GjnA
 7wvw4OHr9B7ToBfNwmek//rEEGYubF28sy+OzkWX9XBf5uqIsumwe6XgCKst2FS/5KI7
 Ie7/cjzlRdRopraP84WlLXNGckUh+qrMkONlPI1Wa07AoQ8sVSEA3TuYFJOhhUVrwYbV
 z/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vagjVKSkecC/z5l23mqjlUJhPMrSeSw7xH2X0+6z0lQ=;
 b=HMWzcF4puD6/fjv4wQiwg+ABiIecP75d4QCmEf0VfMK/kg7aUSsmeN3ly5tFNtfQRK
 VGpk2X1jL33P1BmD1xGqAy/BFXhSPj3BbdbU7TeTkK/O90ZEgPXvd5IE5zAsWCqUqJeA
 hFSB4PDi+T6wP0mVwqzhgV8x1fUtpMF4IOnRD1FWLyWj8bPodE/s2tZ8KW0OvogqwOug
 zGAl78wt8audHTZ0gWamcrGD1Ege4Cr+q0cGZkd3oISEkzWbe9Hc4IG3OgBvULnmw4vg
 /x5/wloCsyyFHxRrJdXcvcMrGfNq5Tm1lwyZzjNgHPKmW6l6zKxo8QJV20VzfikNFtpV
 /FYg==
X-Gm-Message-State: AOAM5330rdcaVUy/eh1m1b3km4F2Dxw3zGk2CkGEBKjmQVI5RYO5ShO5
 kSRi+DVE3HiSSZxJBmIvj9/UUUc7jD4R5IWlL8qMzQ==
X-Google-Smtp-Source: ABdhPJzRRUswoGanXtfI1tAmrtuA6BOvFYnBKprvwwQrE+7ToLUGrzsvYUG0Ho+RFm1cMii6QOQ1yLXDbuPQoMW3yVk=
X-Received: by 2002:a67:ea98:: with SMTP id f24mr4220921vso.159.1592372371922; 
 Tue, 16 Jun 2020 22:39:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200608091739.2368-1-narmstrong@baylibre.com>
 <20200608091739.2368-4-narmstrong@baylibre.com>
In-Reply-To: <20200608091739.2368-4-narmstrong@baylibre.com>
From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Wed, 17 Jun 2020 11:09:21 +0530
Message-ID: <CAHLCerNJ4F3w2+nJHtq5+c-t7KNDnN-2eRQVSUDk7xB4y=X9YA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] thermal: add support for the MCU controlled FAN on
 Khadas boards
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_223934_788387_112AB07E 
X-CRM114-Status: GOOD (  19.76  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Linux PM list <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-amlogic@lists.infradead.org,
 Zhang Rui <rui.zhang@intel.com>, lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jun 8, 2020 at 2:47 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The new Khadas VIM2 and VIM3 boards controls the cooling fan via the
> on-board microcontroller.
>
> This implements the FAN control as thermal devices and as cell of the Khadas
> MCU MFD driver.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>


> ---
>  drivers/thermal/Kconfig          |  11 ++
>  drivers/thermal/Makefile         |   1 +
>  drivers/thermal/khadas_mcu_fan.c | 174 +++++++++++++++++++++++++++++++
>  3 files changed, 186 insertions(+)
>  create mode 100644 drivers/thermal/khadas_mcu_fan.c
>
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 91af271e9bb0..53efd381f434 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -490,4 +490,15 @@ config SPRD_THERMAL
>         help
>           Support for the Spreadtrum thermal sensor driver in the Linux thermal
>           framework.
> +
> +config KHADAS_MCU_FAN_THERMAL
> +       tristate "Khadas MCU controller FAN cooling support"
> +       depends on OF || COMPILE_TEST
> +       depends on MFD_KHADAS_MCU
> +       select MFD_CORE
> +       select REGMAP
> +       help
> +         If you say yes here you get support for the FAN controlled
> +         by the Microcontroller found on the Khadas VIM boards.
> +
>  endif
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index 8c8ed7b79915..460428c2122c 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -60,3 +60,4 @@ obj-$(CONFIG_ZX2967_THERMAL)  += zx2967_thermal.o
>  obj-$(CONFIG_UNIPHIER_THERMAL) += uniphier_thermal.o
>  obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
>  obj-$(CONFIG_SPRD_THERMAL)     += sprd_thermal.o
> +obj-$(CONFIG_KHADAS_MCU_FAN_THERMAL)   += khadas_mcu_fan.o
> diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
> new file mode 100644
> index 000000000000..6995b443cad4
> --- /dev/null
> +++ b/drivers/thermal/khadas_mcu_fan.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Khadas MCU Controlled FAN driver
> + *
> + * Copyright (C) 2020 BayLibre SAS
> + * Author(s): Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/khadas-mcu.h>
> +#include <linux/regmap.h>
> +#include <linux/sysfs.h>
> +#include <linux/thermal.h>
> +
> +#define MAX_LEVEL 3
> +
> +struct khadas_mcu_fan_ctx {
> +       struct khadas_mcu *mcu;
> +       unsigned int level;
> +       struct thermal_cooling_device *cdev;
> +};
> +
> +static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
> +                                   unsigned int level)
> +{
> +       int ret;
> +
> +       ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
> +                          level);
> +       if (ret)
> +               return ret;
> +
> +       ctx->level = level;
> +
> +       return 0;
> +}
> +
> +static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
> +                                       unsigned long *state)
> +{
> +       struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
> +
> +       if (!ctx)
> +               return -EINVAL;
> +
> +       *state = MAX_LEVEL;
> +
> +       return 0;
> +}
> +
> +static int khadas_mcu_fan_get_cur_state(struct thermal_cooling_device *cdev,
> +                                       unsigned long *state)
> +{
> +       struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
> +
> +       if (!ctx)
> +               return -EINVAL;
> +
> +       *state = ctx->level;
> +
> +       return 0;
> +}
> +
> +static int
> +khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
> +                            unsigned long state)
> +{
> +       struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
> +
> +       if (!ctx || (state > MAX_LEVEL))
> +               return -EINVAL;
> +
> +       if (state == ctx->level)
> +               return 0;
> +
> +       return khadas_mcu_fan_set_level(ctx, state);
> +}
> +
> +static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
> +       .get_max_state = khadas_mcu_fan_get_max_state,
> +       .get_cur_state = khadas_mcu_fan_get_cur_state,
> +       .set_cur_state = khadas_mcu_fan_set_cur_state,
> +};
> +
> +static int khadas_mcu_fan_probe(struct platform_device *pdev)
> +{
> +       struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
> +       struct thermal_cooling_device *cdev;
> +       struct device *dev = &pdev->dev;
> +       struct khadas_mcu_fan_ctx *ctx;
> +       int ret;
> +
> +       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +       ctx->mcu = mcu;
> +       platform_set_drvdata(pdev, ctx);
> +
> +       cdev = devm_thermal_of_cooling_device_register(dev->parent,
> +                       dev->parent->of_node, "khadas-mcu-fan", ctx,
> +                       &khadas_mcu_fan_cooling_ops);
> +       if (IS_ERR(cdev)) {
> +               ret = PTR_ERR(cdev);
> +               dev_err(dev,
> +                               "Failed to register khadas-mcu-fan as cooling device: %d\n",
> +                               ret);
> +               return ret;
> +       }
> +       ctx->cdev = cdev;
> +       thermal_cdev_update(cdev);
> +
> +       return 0;
> +}
> +
> +static int khadas_mcu_fan_disable(struct device *dev)
> +{
> +       struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
> +       unsigned int level_save = ctx->level;
> +       int ret;
> +
> +       ret = khadas_mcu_fan_set_level(ctx, 0);
> +       if (ret)
> +               return ret;
> +
> +       ctx->level = level_save;
> +
> +       return 0;
> +}
> +
> +static void khadas_mcu_fan_shutdown(struct platform_device *pdev)
> +{
> +       khadas_mcu_fan_disable(&pdev->dev);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int khadas_mcu_fan_suspend(struct device *dev)
> +{
> +       return khadas_mcu_fan_disable(dev);
> +}
> +
> +static int khadas_mcu_fan_resume(struct device *dev)
> +{
> +       struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
> +
> +       return khadas_mcu_fan_set_level(ctx, ctx->level);
> +}
> +#endif
> +
> +static SIMPLE_DEV_PM_OPS(khadas_mcu_fan_pm, khadas_mcu_fan_suspend,
> +                        khadas_mcu_fan_resume);
> +
> +static const struct platform_device_id khadas_mcu_fan_id_table[] = {
> +       { .name = "khadas-mcu-fan-ctrl", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(platform, khadas_mcu_fan_id_table);
> +
> +static struct platform_driver khadas_mcu_fan_driver = {
> +       .probe          = khadas_mcu_fan_probe,
> +       .shutdown       = khadas_mcu_fan_shutdown,
> +       .driver = {
> +               .name           = "khadas-mcu-fan-ctrl",
> +               .pm             = &khadas_mcu_fan_pm,
> +       },
> +       .id_table       = khadas_mcu_fan_id_table,
> +};
> +
> +module_platform_driver(khadas_mcu_fan_driver);
> +
> +MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> +MODULE_DESCRIPTION("Khadas MCU FAN driver");
> +MODULE_LICENSE("GPL");
> --
> 2.22.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
