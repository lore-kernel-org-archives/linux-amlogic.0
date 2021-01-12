Return-Path: <SRS0=68yh=GP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7607DC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jan 2021 23:43:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C0623130
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jan 2021 23:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15C0623130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P67/yILNU+GSF7ibM5pUSCWKm9bgl7Sr87TQAi9M2C8=; b=RP/+l4BgZdvPgq4+lUkTcp7Go
	7+l+GREWtv6JoKGNTosw5YDD3H94E953hL+eS2QkK2Fk1JMTdI9quLL7cVvd//hZRNRLsbETREtPN
	9ZcnlD4vNJ+d6x/YLO0Q9pZcmfp/zLUDCfCX/HQEwpTr7tiRh+OovJHOB7jCjcihnolpjQ7Ciw0dc
	RDHDu6ACuWI3GvLVcUtIfm9E5Khh5NlnGTWb/IjTZzgi9/UB3CGUcBKM/qXX/MLTcZ6SIOk6WFE+D
	QcVifw8QZvYW4WdNqcUS0ACIcqm8C4MO/tTVn4QoU7GbTDk9W1l8IXnXTwpb2L1j5rb+xqR0ha7rH
	tD8N/KXog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzTK8-00086K-7F; Tue, 12 Jan 2021 23:43:40 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzTK4-000849-0f
 for linux-amlogic@lists.infradead.org; Tue, 12 Jan 2021 23:43:37 +0000
Received: by mail-pg1-x534.google.com with SMTP id i5so266953pgo.1
 for <linux-amlogic@lists.infradead.org>; Tue, 12 Jan 2021 15:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=32Kp6/sD46+sAwhgF+rfAJ8qDBHi38S+G0rBkcScl0M=;
 b=k/zcTILluI13d9wsQcCKcz94dXeq5vvxf09aqE2SxtcZxn/e5psVYrHoNDAnniUwoR
 PZNUT0XJk7W7evklZOD1TAUPFNqgglLNiprj1+9mcYsOmNiqi2aYrQYyQYg3Svdm/1HZ
 +8qCK/Yk6G/UTEdJ0CcwE7siUHqQtXUJK5Abu8cn2HA9TIUrKRCElWB9vOSry8Vzl3o5
 u6g7pi8TOgj2sp/J6MciiKQHcpz1k0Y8qhWhswj4GVTjmNv0ULINQ661wgsfdh7+pEBA
 EAlMQdd+Kexrzr9e0Bjv9n2zNjt5PViGsO+vkBL0KaHmn1nJCUJgxCJkBfc+Wz5wOgcZ
 2rag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=32Kp6/sD46+sAwhgF+rfAJ8qDBHi38S+G0rBkcScl0M=;
 b=IpO1qfJ4l25THixpMOf5PtCrsIoYNiV6MALFrdAZW7eU8RYj3NK2XJcs0E0vBh/fzV
 L7qO66KOhRJFy224MdANrjahAW9ALQSbHXwm0W7KtNzYLD3vIdqtKDio51evF/oURjYQ
 tqyKFVHOmebKMigpnIb1spHArO/Byfhyqh7oPVGNo5gGUhciygmwzZo/AtusKW1+QTAo
 LGuli8C3fL0UOyDDfiE9gopsEQsxovujMHxm4e8qsRFF7KwNZsMbfMpGZ1vqnOoAkrK8
 wJviva5tEADrXaNpSqXpzz/zqQWgyp6jBDDh57PpA0Me/fEZL3qSOrv6VrEr+tfLRTAk
 oDRA==
X-Gm-Message-State: AOAM530tfigatf7QI3nQYzqM4XZC9h21sX+GvITvx8ubBIavTu4tX2yO
 PxiJCa80l0IUy/rOlj/tN5ju5g==
X-Google-Smtp-Source: ABdhPJybelxnuiC/lBZZ87VVxXUp+zZ5RK34oDS0mQDhofDCVCvvv3ryjWyMlO0Du7sPdCKOX9n3YA==
X-Received: by 2002:a63:d246:: with SMTP id t6mr1454523pgi.283.1610495013394; 
 Tue, 12 Jan 2021 15:43:33 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id u25sm216586pfn.101.2021.01.12.15.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 15:43:32 -0800 (PST)
Date: Tue, 12 Jan 2021 16:43:30 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v2 4/5] remoteproc: meson-mx-ao-arc: Add a driver for the
 AO ARC remote procesor
Message-ID: <20210112234330.GA192175@xps15>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
 <20210102205904.2691120-5-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210102205904.2691120-5-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_184336_147446_2C3E0470 
X-CRM114-Status: GOOD (  43.58  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Sat, Jan 02, 2021 at 09:59:03PM +0100, Martin Blumenstingl wrote:
> Amlogic Meson6, Meson8, Meson8b and Meson8m2 embed an ARC core in the
> Always-On (AO) power-domain. This is typically used for waking up the
> ARM cores after system suspend.
> 
> The configuration is spread across three different registers:
> - AO_REMAP_REG0 which must be programmed to zero, it's actual purpose
>   is unknown. There is a second remap register which is not used in the
>   vendor kernel (which served as reference for this driver).
> - AO_CPU_CNTL is used to start and stop the ARC core.
> - AO_SECURE_REG0 in the SECBUS2 register area with unknown purpose.

I certainly appreciate your candor.

> 
> To boot the ARC core we also need to enable it's gate clock and trigger
> a reset.
> 
> The actual code for this ARC core can come from an ELF binary, for
> example by building the Zephyr RTOS for an ARC EM4 core and then taking
> "zephyr.elf" as firmware. This executable does not have any "rsc table"
> so we are skipping rproc_elf_load_rsc_table (rproc_ops.parse_fw) and
> rproc_elf_find_loaded_rsc_table (rproc_ops.find_loaded_rsc_table).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/remoteproc/Kconfig           |  11 ++
>  drivers/remoteproc/Makefile          |   1 +
>  drivers/remoteproc/meson_mx_ao_arc.c | 240 +++++++++++++++++++++++++++
>  3 files changed, 252 insertions(+)
>  create mode 100644 drivers/remoteproc/meson_mx_ao_arc.c
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 9e7efe542f69..0e7fb91635fe 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -125,6 +125,17 @@ config KEYSTONE_REMOTEPROC
>  	  It's safe to say N here if you're not interested in the Keystone
>  	  DSPs or just want to use a bare minimum kernel.
>  
> +config MESON_MX_AO_ARC_REMOTEPROC
> +	tristate "Amlogic Meson6/8/8b/8m2 AO ARC remote processor support"
> +	depends on HAS_IOMEM
> +	depends on (ARM && ARCH_MESON) || COMPILE_TEST
> +	select GENERIC_ALLOCATOR
> +	help
> +	  Say m or y here to have support for the AO ARC remote processor
> +	  on Amlogic Meson6/Meson8/Meson8b/Meson8m2 SoCs. This is
> +	  typically used for system suspend.
> +	  If unusre say N.

s/unusre/unsure

> +
>  config PRU_REMOTEPROC
>  	tristate "TI PRU remoteproc support"
>  	depends on TI_PRUSS
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index bb26c9e4ef9c..ce1abeb30907 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
>  obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
>  obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
>  obj-$(CONFIG_KEYSTONE_REMOTEPROC)	+= keystone_remoteproc.o
> +obj-$(CONFIG_MESON_MX_AO_ARC_REMOTEPROC)+= meson_mx_ao_arc.o
>  obj-$(CONFIG_PRU_REMOTEPROC)		+= pru_rproc.o
>  obj-$(CONFIG_QCOM_PIL_INFO)		+= qcom_pil_info.o
>  obj-$(CONFIG_QCOM_RPROC_COMMON)		+= qcom_common.o
> diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
> new file mode 100644
> index 000000000000..1deb03ca30f4
> --- /dev/null
> +++ b/drivers/remoteproc/meson_mx_ao_arc.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2020 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/property.h>

Is it possible for this to go after platform_device.h?

> +#include <linux/genalloc.h>
> +#include <linux/io.h>
> +#include <linux/ioport.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/remoteproc.h>
> +#include <linux/reset.h>
> +#include <linux/sizes.h>
> +
> +#include "remoteproc_internal.h"
> +
> +#define AO_REMAP_REG0					0x0
> +#define AO_REMAP_REG1					0x4
> +
> +#define AO_CPU_CNTL					0x0
> +	#define AO_CPU_CNTL_MEM_ADDR_UPPER		GENMASK(28, 16)
> +	#define AO_CPU_CNTL_HALT			BIT(9)
> +	#define AO_CPU_CNTL_UNKNONWN			BIT(8)
> +	#define AO_CPU_CNTL_RUN				BIT(0)

Any reason for the extra tabulation at the beginning of the lines?

> +
> +#define AO_CPU_STAT					0x4
> +
> +#define AO_SECURE_REG0					0x0
> +	#define AO_SECURE_REG0_UNKNOWN			GENMASK(23, 8)
> +
> +#define MESON_AO_RPROC_SRAM_USABLE_BITS			GENMASK(31, 20)

As per your comments in the cover letter I assume we don't know more about this?

> +#define MESON_AO_RPROC_MEMORY_OFFSET			0x10000000
> +
> +struct meson_mx_ao_arc_rproc_priv {
> +	void __iomem		*remap_base;
> +	void __iomem		*cpu_base;
> +	unsigned long		sram_va;
> +	phys_addr_t		sram_pa;
> +	size_t			sram_size;
> +	struct gen_pool		*sram_pool;
> +	struct reset_control	*arc_reset;
> +	struct clk		*arc_pclk;
> +	struct regmap		*secbus2_regmap;
> +};
> +
> +static int meson_mx_ao_arc_rproc_start(struct rproc *rproc)
> +{
> +	struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
> +	phys_addr_t phys_addr;
> +	int ret;
> +
> +	ret = clk_prepare_enable(priv->arc_pclk);
> +	if (ret)
> +		return ret;
> +
> +	writel(0, priv->remap_base + AO_REMAP_REG0);
> +	usleep_range(10, 100);

That's wonderful - here too I assume there is no indication as to why this is
needed? 

> +
> +	regmap_update_bits(priv->secbus2_regmap, AO_SECURE_REG0,
> +			   AO_SECURE_REG0_UNKNOWN, 0);
> +
> +	ret = reset_control_reset(priv->arc_reset);
> +	if (ret) {
> +		clk_disable_unprepare(priv->arc_pclk);
> +		return ret;
> +	}
> +
> +	usleep_range(10, 100);
> +
> +	/* convert from 0xd9000000 to 0xc9000000 as the vendor driver does */
> +	phys_addr = priv->sram_pa - MESON_AO_RPROC_MEMORY_OFFSET;
> +
> +	writel(FIELD_PREP(AO_CPU_CNTL_MEM_ADDR_UPPER,
> +			  FIELD_GET(MESON_AO_RPROC_SRAM_USABLE_BITS, phys_addr)) |
> +	       AO_CPU_CNTL_UNKNONWN | AO_CPU_CNTL_RUN,

This is really hard to read - please unpack.

> +	       priv->cpu_base + AO_CPU_CNTL);
> +	usleep_range(20, 200);
> +
> +	return 0;
> +}
> +
> +static int meson_mx_ao_arc_rproc_stop(struct rproc *rproc)
> +{
> +	struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
> +
> +	writel(AO_CPU_CNTL_HALT, priv->cpu_base + AO_CPU_CNTL);
> +
> +	clk_disable_unprepare(priv->arc_pclk);
> +
> +	return 0;
> +}
> +
> +static void *meson_mx_ao_arc_rproc_da_to_va(struct rproc *rproc, u64 da,
> +					    size_t len)
> +{
> +	struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
> +
> +	if ((da + len) >= priv->sram_size)
> +		return NULL;

This isn't an index so it should be '>' rather than '>='.  You should be able to
ask for the whole range and get it, which the above prevents you from doing.

Moreover are you sure 'da' always starts at 0? This seems to be at odds with
your comment in meson_mx_ao_arc_rproc_start() about converting from 0xd9000000
to 0xc9000000.

> +
> +	return (void *)priv->sram_va + da;
> +}
> +
> +static struct rproc_ops meson_mx_ao_arc_rproc_ops = {
> +	.start		= meson_mx_ao_arc_rproc_start,
> +	.stop		= meson_mx_ao_arc_rproc_stop,
> +	.da_to_va	= meson_mx_ao_arc_rproc_da_to_va,
> +	.get_boot_addr	= rproc_elf_get_boot_addr,
> +	.load		= rproc_elf_load_segments,
> +	.sanity_check	= rproc_elf_sanity_check,
> +};
> +
> +static int meson_mx_ao_arc_rproc_probe(struct platform_device *pdev)
> +{
> +	struct meson_mx_ao_arc_rproc_priv *priv;
> +	struct platform_device *secbus2_pdev;
> +	struct device *dev = &pdev->dev;
> +	const char *fw_name;
> +	struct rproc *rproc;
> +	int ret;
> +
> +	ret = device_property_read_string(dev, "firmware-name", &fw_name);

I would have expected of_property_read_string() but that is also fine.

> +	if (ret)
> +		fw_name = NULL;
> +
> +	rproc = devm_rproc_alloc(dev, "meson-mx-ao-arc",
> +				 &meson_mx_ao_arc_rproc_ops, fw_name,
> +				 sizeof(*priv));
> +	if (!rproc)
> +		return -ENOMEM;
> +
> +	rproc->has_iommu = false;
> +	priv = rproc->priv;
> +
> +	priv->sram_pool = of_gen_pool_get(dev->of_node, "sram", 0);
> +	if (!priv->sram_pool) {
> +		dev_err(dev, "Could not get SRAM pool\n");
> +		return -ENODEV;
> +	}
> +
> +	priv->sram_size = gen_pool_avail(priv->sram_pool);
> +
> +	priv->sram_va = gen_pool_alloc(priv->sram_pool, priv->sram_size);
> +	if (!priv->sram_va) {
> +		dev_err(dev, "Could not alloc memory in SRAM pool\n");
> +		return -ENOMEM;
> +	}
> +
> +	priv->sram_pa = gen_pool_virt_to_phys(priv->sram_pool, priv->sram_va);
> +	if (priv->sram_pa & ~MESON_AO_RPROC_SRAM_USABLE_BITS) {
> +		dev_err(dev, "SRAM address contains unusable bits\n");
> +		ret = -EINVAL;
> +		goto err_free_genpool;
> +	}
> +
> +	priv->secbus2_regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
> +							       "amlogic,secbus2");
> +	if (IS_ERR(priv->secbus2_regmap)) {
> +		dev_err(dev, "Failed to find SECBUS2 regmap\n");
> +		ret = PTR_ERR(priv->secbus2_regmap);
> +		goto err_free_genpool;
> +	}
> +
> +	priv->remap_base = devm_platform_ioremap_resource_byname(pdev, "remap");
> +	if (IS_ERR(priv->remap_base)) {
> +		ret = PTR_ERR(priv->remap_base);
> +		goto err_free_genpool;
> +	}
> +
> +	priv->cpu_base = devm_platform_ioremap_resource_byname(pdev, "cpu");
> +	if (IS_ERR(priv->cpu_base)) {
> +		ret = PTR_ERR(priv->cpu_base);
> +		goto err_free_genpool;
> +	}
> +
> +	priv->arc_reset = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->arc_reset)) {

Looking at __devm_reset_control_get(), this should probably be IS_ERR_OR_NULL().

Thanks,
Mathieu

> +		dev_err(dev, "Failed to get ARC reset\n");
> +		ret = PTR_ERR(priv->arc_reset);
> +		goto err_free_genpool;
> +	}
> +
> +	priv->arc_pclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->arc_pclk)) {
> +		dev_err(dev, "Failed to get the ARC PCLK\n");
> +		ret = PTR_ERR(priv->arc_pclk);
> +		goto err_free_genpool;
> +	}
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	ret = rproc_add(rproc);
> +	if (ret)
> +		goto err_free_genpool;
> +
> +	return 0;
> +
> +err_free_genpool:
> +	gen_pool_free(priv->sram_pool, priv->sram_va, priv->sram_size);
> +	return ret;
> +}
> +
> +static int meson_mx_ao_arc_rproc_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc = platform_get_drvdata(pdev);
> +	struct meson_mx_ao_arc_rproc_priv *priv = rproc->priv;
> +
> +	rproc_del(rproc);
> +	gen_pool_free(priv->sram_pool, priv->sram_va, priv->sram_size);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id meson_mx_ao_arc_rproc_match[] = {
> +	{ .compatible = "amlogic,meson8-ao-arc" },
> +	{ .compatible = "amlogic,meson8b-ao-arc" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, meson_mx_ao_arc_rproc_match);
> +
> +static struct platform_driver meson_mx_ao_arc_rproc_driver = {
> +	.probe = meson_mx_ao_arc_rproc_probe,
> +	.remove = meson_mx_ao_arc_rproc_remove,
> +	.driver = {
> +		.name = "meson-mx-ao-arc-rproc",
> +		.of_match_table = of_match_ptr(meson_mx_ao_arc_rproc_match),
> +	},
> +};
> +module_platform_driver(meson_mx_ao_arc_rproc_driver);
> +
> +MODULE_DESCRIPTION("Amlogic Meson6/8/8b/8m2 AO ARC remote processor driver");
> +MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.30.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
