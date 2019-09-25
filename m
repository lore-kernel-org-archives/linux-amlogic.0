Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339FCC432C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 22:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0152A208C3
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 22:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RqIOiYof";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JB6Q2GHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0152A208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaVv3kchuaLH9yyNjIhheEr77rihxe/ovezDm53pe78=; b=RqIOiYofB/vccJ
	VxsOHDYStHFdFmHoNxn65wu4N9qVemw03k+3rVgL/CnJYBa1sRbCjhzAWjvzTikFXdElrokKWvVtQ
	JWjJqjLBcm6pHq6XDocuUD31rvQKjW+lFL8B0PCZB8cMrKUYvMV+Ibj8PJiRi5x/vzX67N7DS3taq
	C+5OQ9U4hHr70mnkTaYheven7+SqbYKBplsYOmdVJUSekjoYaxKpIJXMQ9VeZbQjQuvmrTPghmAD6
	NPpyej33y1AZ55xD5ojdK8jFEDWGzuQmQcr4Rc0D2BiLEggOIMwrogmc1hviNe4QbsycTzLEWBjsR
	RYTMTwdXAuFXR+O4RzOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDFy9-0005VI-9Q; Wed, 25 Sep 2019 22:41:09 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDFy5-0005UO-Mh
 for linux-amlogic@lists.infradead.org; Wed, 25 Sep 2019 22:41:08 +0000
Received: by mail-pf1-x442.google.com with SMTP id y72so377396pfb.12
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Sep 2019 15:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DJZS+2hMW3BHIlvQqQIKWZQ/S9upQg+UWPkKnBDMHaY=;
 b=JB6Q2GHp1ZV70uEzjZQJ/AO6u5nX3s65TPoASr9MkSGdNQyIQ/0WXlmik2tJ5AF0bM
 zMM9MnNksBAQKlIfLF+LrCuJD6Np180fmKkkFjYu1a0RkLWb43TTUkiy58OdSa2U8Z6W
 004LqA6M4DeOJJ+E9vS5afyjUOvm3f7jguC0WgTHJmFwEY62dRZA0QxfucOwWX0eBwPu
 XcMr5uC3GssTrfeE58sdRAc6IJPOVyA+4uWwIAaBRc+d+SAXlrZMRyh9LoNQRZKONnfy
 4sq8BoEiSm4ra4nbgK+mdgZO9QiPd+30urNbhkelZ7Hy3CWDvi9HiEsSu1A2znaLjAGX
 3T/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DJZS+2hMW3BHIlvQqQIKWZQ/S9upQg+UWPkKnBDMHaY=;
 b=M79Z18PFoVZxh8SskR89WeDaOP9KdErBPYpmBsh0ZqiephgUa3PTsxxX72SqoVXoVF
 BCdf84EthBESczbtBMXVxuwNedbTFIV9Z5aCU/mmYPAZsyNgsfWcWMkmZ8s43TZDEvdr
 h+56+41jymTfwWoC9Q81TLygzlwGLhPeJ7xsAirPJ2wFO7odiDnJO4/eKPbdKR7uzzuv
 N2BnLwPI+JzpYMqMAPcG2eZyUMN2TU2uNzfYhFxAj4j+s1NGBVHRJq2alX7+0oQS0ntN
 QBEFamNtOFShsd3lhsz/dvNwdb0fOmoqSqer0UVLbLB4y7LxWKxie730fhgGNY2Cdsyh
 YBJQ==
X-Gm-Message-State: APjAAAWo3ftpGjcD36BDIPoYuMmQRDQioHolO8ghGsUd0fry/9+PJrHO
 T5mKkI/qPDVTSsu8rxPwVad4mg==
X-Google-Smtp-Source: APXvYqxyMgJ5m1Xh8eUiGWUqSpHwcA3KjJXudlODQh+BYXuGy9MiW1RYEL7P75vrRNRYeQpn2BJWFg==
X-Received: by 2002:a17:90a:fc8c:: with SMTP id
 ci12mr86276pjb.38.1569451263240; 
 Wed, 25 Sep 2019 15:41:03 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id e21sm53200pfd.149.2019.09.25.15.41.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Sep 2019 15:41:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 2/3] soc: amlogic: Add support for Secure power domains
 controller
In-Reply-To: <1568895064-4116-3-git-send-email-jianxin.pan@amlogic.com>
References: <1568895064-4116-1-git-send-email-jianxin.pan@amlogic.com>
 <1568895064-4116-3-git-send-email-jianxin.pan@amlogic.com>
Date: Wed, 25 Sep 2019 15:41:01 -0700
Message-ID: <7hh850t2wy.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_154105_750229_92FFD578 
X-CRM114-Status: GOOD (  22.80  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhiqiang Liang <zhiqiang.liang@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> Add support for the Amlogic Secure Power controller. In A1/C1 series, power
> control registers are in secure domain, and should be accessed by smc.
>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> Signed-off-by: Zhiqiang Liang <zhiqiang.liang@amlogic.com>

Thanks for the new power domain driver.

> ---
>  drivers/soc/amlogic/Kconfig             |  13 +++
>  drivers/soc/amlogic/Makefile            |   1 +
>  drivers/soc/amlogic/meson-secure-pwrc.c | 182 ++++++++++++++++++++++++++++++++
>  3 files changed, 196 insertions(+)
>  create mode 100644 drivers/soc/amlogic/meson-secure-pwrc.c
>
> diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
> index bc2c912..6cb06e7 100644
> --- a/drivers/soc/amlogic/Kconfig
> +++ b/drivers/soc/amlogic/Kconfig
> @@ -48,6 +48,19 @@ config MESON_EE_PM_DOMAINS
>  	  Say yes to expose Amlogic Meson Everything-Else Power Domains as
>  	  Generic Power Domains.
>  
> +config MESON_SECURE_PM_DOMAINS
> +	bool "Amlogic Meson Secure Power Domains driver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	depends on PM && OF
> +	depends on HAVE_ARM_SMCCC
> +	default ARCH_MESON
> +	select PM_GENERIC_DOMAINS
> +	select PM_GENERIC_DOMAINS_OF
> +	help
> +	  Support for the power controller on Amlogic A1/C1 series.
> +	  Say yes to expose Amlogic Meson Secure Power Domains as Generic
> +	  Power Domains.
> +
>  config MESON_MX_SOCINFO
>  	bool "Amlogic Meson MX SoC Information driver"
>  	depends on ARCH_MESON || COMPILE_TEST
> diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
> index de79d044..7b8c5d3 100644
> --- a/drivers/soc/amlogic/Makefile
> +++ b/drivers/soc/amlogic/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
>  obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
>  obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
>  obj-$(CONFIG_MESON_EE_PM_DOMAINS) += meson-ee-pwrc.o
> +obj-$(CONFIG_MESON_SECURE_PM_DOMAINS) += meson-secure-pwrc.o
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> new file mode 100644
> index 00000000..00c7232
> --- /dev/null
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc.
> + * Author: Jianxin Pan <jianxin.pan@amlogic.com>
> + */
> +#include <linux/io.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <dt-bindings/power/meson-a1-power.h>
> +#include <linux/arm-smccc.h>
> +
> +#define PWRC_ON		1
> +#define PWRC_OFF	0
> +#define SMC_PWRC_SET	0x82000093
> +#define SMC_PWRC_GET	0x82000095
> +
> +struct meson_secure_pwrc_domain {
> +	struct generic_pm_domain base;
> +	unsigned int index;
> +};
> +
> +struct meson_secure_pwrc {
> +	struct meson_secure_pwrc_domain *domains;
> +	struct genpd_onecell_data xlate;
> +};
> +
> +struct meson_secure_pwrc_domain_desc {
> +	unsigned int index;
> +	unsigned int flags;
> +	char *name;
> +	bool (*get_power)(struct meson_secure_pwrc_domain *pwrc_domain);
> +};
> +
> +struct meson_secure_pwrc_domain_data {
> +	unsigned int count;
> +	struct meson_secure_pwrc_domain_desc *domains;
> +};
> +
> +static bool pwrc_secure_get_power(struct meson_secure_pwrc_domain *pwrc_domain)
> +{
> +	struct arm_smccc_res res;
> +
> +	arm_smccc_smc(SMC_PWRC_GET, pwrc_domain->index, 0,
> +		      0, 0, 0, 0, 0, &res);
> +
> +	return res.a0 & 0x1;

Please use a #define with a readable name for this mask.

> +}

What does the return value for this function mean?  Does true mean
"powered off" or "powered on"?

See the rename I just did on the ee-pwrc driver:
https://lore.kernel.org/linux-amlogic/20190925213528.21515-2-khilman@kernel.org/

> +static int meson_secure_pwrc_off(struct generic_pm_domain *domain)
> +{
> +	struct arm_smccc_res res;
> +	struct meson_secure_pwrc_domain *pwrc_domain =
> +		container_of(domain, struct meson_secure_pwrc_domain, base);
> +
> +	arm_smccc_smc(SMC_PWRC_SET, pwrc_domain->index, PWRC_OFF,
> +		      0, 0, 0, 0, 0, &res);
> +
> +	return 0;
> +}
> +
> +static int meson_secure_pwrc_on(struct generic_pm_domain *domain)
> +{
> +	struct arm_smccc_res res;
> +	struct meson_secure_pwrc_domain *pwrc_domain =
> +		container_of(domain, struct meson_secure_pwrc_domain, base);
> +
> +	arm_smccc_smc(SMC_PWRC_SET, pwrc_domain->index, PWRC_ON,
> +		      0, 0, 0, 0, 0, &res);
> +
> +	return 0;
> +}
> +
> +#define SEC_PD(__name, __flag)			\
> +{						\
> +	.name = #__name,			\
> +	.index = PWRC_##__name##_ID,		\
> +	.get_power = pwrc_secure_get_power,	\
> +	.flags = __flag,			\
> +}
> +
> +static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
> +	SEC_PD(DSPA,	0),
> +	SEC_PD(DSPB,	0),
> +	SEC_PD(UART,	GENPD_FLAG_ALWAYS_ON),

This flag should only be used for domains where there are no linux
drivers.

Rather than using this flag, you need to add a 'power-domain' property
to the uart driver in DT, and then update the meson_uart driver to use
the runtime PM API so that the domain is enabled whenever the UART is in
use.

> +	SEC_PD(DMC,	GENPD_FLAG_ALWAYS_ON),

Please explain the need for ALWAYS_ON.

> +	SEC_PD(I2C,	0),
> +	SEC_PD(PSRAM,	0),
> +	SEC_PD(ACODEC,	0),
> +	SEC_PD(AUDIO,	0),
> +	SEC_PD(OTP,	0),
> +	SEC_PD(DMA,	0),
> +	SEC_PD(SD_EMMC,	0),
> +	SEC_PD(RAMA,	0),
> +	SEC_PD(RAMB,	GENPD_FLAG_ALWAYS_ON),

Please explain the need for ALWAYS_ON.

> +	SEC_PD(IR,	0),
> +	SEC_PD(SPICC,	0),
> +	SEC_PD(SPIFC,	0),
> +	SEC_PD(USB,	0),
> +	SEC_PD(NIC,	GENPD_FLAG_ALWAYS_ON),

Please explain the need for ALWAYS_ON.

> +	SEC_PD(PDMIN,	0),
> +	SEC_PD(RSA,	0),
> +};
> +
> +static int meson_secure_pwrc_probe(struct platform_device *pdev)
> +{
> +	const struct meson_secure_pwrc_domain_data *match;
> +	struct meson_secure_pwrc *pwrc;
> +	int i;
> +
> +	match = of_device_get_match_data(&pdev->dev);
> +	if (!match) {
> +		dev_err(&pdev->dev, "failed to get match data\n");
> +		return -ENODEV;
> +	}
> +
> +	pwrc = devm_kzalloc(&pdev->dev, sizeof(*pwrc), GFP_KERNEL);
> +	if (!pwrc)
> +		return -ENOMEM;
> +
> +	pwrc->xlate.domains = devm_kcalloc(&pdev->dev, match->count,
> +					   sizeof(*pwrc->xlate.domains),
> +					   GFP_KERNEL);
> +	if (!pwrc->xlate.domains)
> +		return -ENOMEM;
> +
> +	pwrc->domains = devm_kcalloc(&pdev->dev, match->count,
> +				     sizeof(*pwrc->domains), GFP_KERNEL);
> +	if (!pwrc->domains)
> +		return -ENOMEM;
> +
> +	pwrc->xlate.num_domains = match->count;
> +	platform_set_drvdata(pdev, pwrc);
> +
> +	for (i = 0 ; i < match->count ; ++i) {
> +		struct meson_secure_pwrc_domain *dom = &pwrc->domains[i];
> +
> +		if (!match->domains[i].index)
> +			continue;
> +
> +		dom->index = match->domains[i].index;
> +		dom->base.name = match->domains[i].name;
> +		dom->base.flags = match->domains[i].flags;
> +		dom->base.power_on = meson_secure_pwrc_on;
> +		dom->base.power_off = meson_secure_pwrc_off;
> +
> +		pm_genpd_init(&dom->base, NULL,
> +			      (match->domains[i].get_power ?
> +			      match->domains[i].get_power(dom) : true));
> +
> +		pwrc->xlate.domains[i] = &dom->base;
> +	}
> +
> +	return of_genpd_add_provider_onecell(pdev->dev.of_node, &pwrc->xlate);
> +}
> +
> +static struct meson_secure_pwrc_domain_data meson_secure_a1_pwrc_data = {
> +	.domains = a1_pwrc_domains,
> +	.count = ARRAY_SIZE(a1_pwrc_domains),
> +};
> +
> +static const struct of_device_id meson_secure_pwrc_match_table[] = {
> +	{
> +		.compatible = "amlogic,meson-a1-pwrc",
> +		.data = &meson_secure_a1_pwrc_data,
> +	},
> +	{ }

as mentioned by Martin, please add the sentinel string here.  Helps for
readability.

> +};
> +
> +static struct platform_driver meson_secure_pwrc_driver = {
> +	.probe = meson_secure_pwrc_probe,
> +	.driver = {
> +		.name		= "meson_secure_pwrc",
> +		.of_match_table	= meson_secure_pwrc_match_table,
> +	},
> +};
> +
> +static int meson_secure_pwrc_init(void)
> +{
> +	return platform_driver_register(&meson_secure_pwrc_driver);
> +}
> +arch_initcall_sync(meson_secure_pwrc_init);

Please use builtin_platform_driver() or explain in detail why the
initcall is needed.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
