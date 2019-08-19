Return-Path: <SRS0=FxKK=WP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F5AC3A5A0
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2019 23:57:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E408206C1
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Aug 2019 23:57:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JacDlTlL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tHSxGQVt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E408206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1V6X7cgEc4/3HI6Im/SAyMNTUFNeEgy9pAFs5D0DYiU=; b=JacDlTlL9ud6Pl
	HFwCXdNPpTRSaHk0nHv6fknO1k/VHuRLxxOVIMfi8e3rfDy2sV3sDO012sOu8U0LQw7W9E+zs/+nt
	jX2y9agrDRjwnzHOVdBgoooxVIz3VcrGk33xQl77JfpjWtY5at8ErP4RwaYY4PN1ONbE86YQsgFcX
	loI8hvo9I+BDo4SlB4k93XmiWtXPvy8h6OsVftL1+Gt9QDApT0USBjI9lsR1uxU/em5BHL1ZH11jC
	0NrG0P+oArbTX7IAzEphhfBteC08JOANFphZPaGiYAFmAGO22jH342a1W1PPLjkDZOM+d5IMZEjlv
	19v55qEO1eDIHvS7Nr8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzrWQ-0007KE-MB; Mon, 19 Aug 2019 23:57:10 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzrWM-0007JG-Na
 for linux-amlogic@lists.infradead.org; Mon, 19 Aug 2019 23:57:09 +0000
Received: by mail-pg1-x541.google.com with SMTP id e11so2104832pga.5
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2019 16:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rz5flzgwGak4NNzNVSfLJ5qh9oyJuRgNqH+DgyR69y0=;
 b=tHSxGQVtPdwNCbdBlr3EUeet2KzcghwAx5OLJmU1osGsm5s7ayUadXIPOZAdRSrAM2
 HnhD0t5RLFE6J+MeJ/5YdgsBe2xzaMdKD93BkYDFjuJkP8FCHX0Mn3AJnYsmjaK5Hda9
 wW7Vm6kRMV4LLduRWAgj4hqH1cGX8AKgt+1VrdgebZ10JgUmc8nNOx0BQZ3ER/yhkNXH
 shVJsQ+vVSdRtcAvZc7Wxp00stxPl/8jwdzUkFoQE2EoQX9U5OGNZqj0cUauczTLmqdH
 PlrQi83nFCcDfHNvDeyk4G0EntDzf3mZJp4kWdvZsPGovrEza3/HrmnU2BIJ25OXLF4S
 61/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rz5flzgwGak4NNzNVSfLJ5qh9oyJuRgNqH+DgyR69y0=;
 b=Wb3/Dw8NXlIYBg6DHqJ46aVIe4kbUvOVxlLh2NBG2q3l0AXxoXh9ICnvzu6q6fttqi
 t9JUqG7pIY/d4L4Xf53o5OmwvG7pL9O8r8TDgMlQiwz8ydYgE/4kgwSpPsmDennL4z38
 NjjXGtHQMfmuShfZqCHPt8kfgVX9WD4KY2pAbzqg8I6/V34zzxHOmODc3SbDLfxrDTL+
 AQG0DqQKzF5Sq+SUyTdrFUQa0vCs8gnuVux6cyZB7IoPk2LRCnOcO2a1Kq6Ah40044CM
 NBJ/rwvgrq7y2ymE3tcvemDq3E6bkqpIl5hPn3ttL3LIvFwK+RTiTuDg5zvimJzH6a5T
 4ykA==
X-Gm-Message-State: APjAAAV9mRPpL2V6rTqTGjuued30rrK7oN1v3lIRNyDVTidhbo7eOyD+
 k5yRzI2F2YAMRoula02FxRwrebH7oIc=
X-Google-Smtp-Source: APXvYqyG2CFR6aRg5YaSP/aZOjNzo2KmtAnC64ArOTdPKTGyLWnsgG+SwjMw2iOl5rS7+z69nBAy7w==
X-Received: by 2002:a65:4b89:: with SMTP id t9mr21830331pgq.55.1566259025209; 
 Mon, 19 Aug 2019 16:57:05 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:35:cf9b:bad:702c])
 by smtp.gmail.com with ESMTPSA id c199sm21383170pfb.28.2019.08.19.16.57.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 19 Aug 2019 16:57:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, jbrunet@baylibre.com
Subject: Re: [RFC 04/11] soc: amlogic: Add support for SM1 power controller
In-Reply-To: <20190701104705.18271-5-narmstrong@baylibre.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-5-narmstrong@baylibre.com>
Date: Mon, 19 Aug 2019 16:56:55 -0700
Message-ID: <7hftlwvhdk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_165706_913654_3E4956A3 
X-CRM114-Status: GOOD (  17.15  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Add support for the General Purpose Amlogic SM1 Power controller,
> dedicated to the PCIe, USB, NNA and GE2D Power Domains.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

I like this driver in general, but as I look at all the EE power domains
for GX, G12 and SM1 they are really very similar.  I had started to
generalize the gx-pwrc-vpu driver and it ends up looking just like this.

I think this driver could be generalized just a little bit more and then
replace the the GX-specific VPU one, and AFAICT, then be used across all
the 64-bit SoCs, and be called "meson-pwrc-ee" or something like that...

> ---
>  drivers/soc/amlogic/Kconfig          |  11 ++
>  drivers/soc/amlogic/Makefile         |   1 +
>  drivers/soc/amlogic/meson-sm1-pwrc.c | 245 +++++++++++++++++++++++++++
>  3 files changed, 257 insertions(+)
>  create mode 100644 drivers/soc/amlogic/meson-sm1-pwrc.c
>
> diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
> index 5501ad5650b2..596f1afef1a7 100644
> --- a/drivers/soc/amlogic/Kconfig
> +++ b/drivers/soc/amlogic/Kconfig
> @@ -36,6 +36,17 @@ config MESON_GX_PM_DOMAINS
>  	  Say yes to expose Amlogic Meson GX Power Domains as
>  	  Generic Power Domains.
>  
> +config MESON_SM1_PM_DOMAINS
> +	bool "Amlogic Meson SM1 Power Domains driver"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	depends on PM && OF
> +	default ARCH_MESON
> +	select PM_GENERIC_DOMAINS
> +	select PM_GENERIC_DOMAINS_OF
> +	help
> +	  Say yes to expose Amlogic Meson SM1 Power Domains as
> +	  Generic Power Domains.
> +
>  config MESON_MX_SOCINFO
>  	bool "Amlogic Meson MX SoC Information driver"
>  	depends on ARCH_MESON || COMPILE_TEST
> diff --git a/drivers/soc/amlogic/Makefile b/drivers/soc/amlogic/Makefile
> index bf2d109f61e9..f99935499ee6 100644
> --- a/drivers/soc/amlogic/Makefile
> +++ b/drivers/soc/amlogic/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_MESON_CLK_MEASURE) += meson-clk-measure.o
>  obj-$(CONFIG_MESON_GX_SOCINFO) += meson-gx-socinfo.o
>  obj-$(CONFIG_MESON_GX_PM_DOMAINS) += meson-gx-pwrc-vpu.o
>  obj-$(CONFIG_MESON_MX_SOCINFO) += meson-mx-socinfo.o
> +obj-$(CONFIG_MESON_SM1_PM_DOMAINS) += meson-sm1-pwrc.o
> diff --git a/drivers/soc/amlogic/meson-sm1-pwrc.c b/drivers/soc/amlogic/meson-sm1-pwrc.c
> new file mode 100644
> index 000000000000..9ece1d06f417
> --- /dev/null
> +++ b/drivers/soc/amlogic/meson-sm1-pwrc.c
> @@ -0,0 +1,245 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (c) 2017 BayLibre, SAS
> + * Author: Neil Armstrong <narmstrong@baylibre.com>
> + */
> +
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/bitfield.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of_device.h>
> +#include <dt-bindings/power/meson-sm1-power.h>
> +
> +/* AO Offsets */
> +
> +#define AO_RTI_GEN_PWR_SLEEP0		(0x3a << 2)
> +#define AO_RTI_GEN_PWR_ISO0		(0x3b << 2)
> +
> +/* HHI Offsets */
> +
> +#define HHI_MEM_PD_REG0			(0x40 << 2)
> +#define HHI_NANOQ_MEM_PD_REG0		(0x46 << 2)
> +#define HHI_NANOQ_MEM_PD_REG1		(0x47 << 2)
> +
> +struct meson_sm1_pwrc;
> +
> +struct meson_sm1_pwrc_mem_domain {
> +	unsigned int reg;
> +	unsigned int mask;
> +};
> +
> +struct meson_sm1_pwrc_domain_desc {
> +	char *name;
> +	unsigned int sleep_reg;
> +	unsigned int sleep_bit;
> +	unsigned int iso_reg;
> +	unsigned int iso_bit;
> +	unsigned int mem_pd_count;
> +	struct meson_sm1_pwrc_mem_domain *mem_pd;
> +};

If you add resets and clocks (using clk bulk like my other proposed
patch to gx-pwrc-vpu) then this could be used for VPU also.  We could
ignore my clk bulk patch and then just deprecate the old driver and use
this one for everything.

We would just need SoC-specific tables selected by compatible-string to
select the memory pds, and the clocks and resets could (optionaly) come
from the DT.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
