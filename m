Return-Path: <SRS0=PIQu=XZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028C4C4360C
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 09:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C868521855
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Sep 2019 09:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+FjKU9E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9JUUAoK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C868521855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/RP7OmpfrUWCqZNB+Rvz7rgVcd/yXvENW4GJ3JFQBkM=; b=O+FjKU9E/pb2Qo
	ti/w3dw/5LvYkRFxTxEJrrqlRhBxaJfdn6i2n109/MmChxTbACN3Yhd8ZoxpRE+vv3OTJZET999jM
	NAUbXaaRcOD5aiP2rTHKt3+djXEs1fla67URBdz+hpD57AkKjTeHN+TesdAziLI9Q2k+NGNq7AHZ0
	kfJPLQ2bysdqyBePc5tm3TMgeidK0su/ZGpGcZRA1Te01W2hHL12O/W0toSX6qxUqm5pqWCBmFG0n
	cmJUlnktvZX+bsFHztj7+ZsL9pflZjnfqP2vCVdYo1r+c0pf4KmXKZCfzWtV5WU1Md8Zhvr1ViIVv
	c8cNCC4p6Eus4o7aKcyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEs87-0003vj-KK; Mon, 30 Sep 2019 09:38:07 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEs84-0003uI-4O
 for linux-amlogic@lists.infradead.org; Mon, 30 Sep 2019 09:38:06 +0000
Received: by mail-vs1-xe43.google.com with SMTP id z14so6262027vsz.13
 for <linux-amlogic@lists.infradead.org>; Mon, 30 Sep 2019 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Eb0h8Bb/VxV1goQ9YVuDHHMV4XEvBP4jNtrzRAKJeQ=;
 b=l9JUUAoK+g0I09OCbzEqgrx5H7gqT4mD+Vxo+QO9QAtTXNgNA9LYDrscQZA+V3HOKE
 rpN6z13Lj2Mf81GQ5G4nPn9SuaKCZzDucG+uOQndCdGkOYlCH1+sD4BGclerU1yrIU6z
 Spyhh3P3AT1QUZC4gqG7G8tS1iXSNElRCpOm87D0klRYrNiC/BW/oXzxJhydUTW3hw1c
 SMNdV2vHTj6IQZxKxu6Y2VhUNddpPUvoOqE4oxQUMO6Oa9kZ7I48NH/6dUf3aeW/ui4z
 omrMIas202b2Vp+NZ2WlaCZACP+2ahBOJDrsIyOf+YWCMv4j/rMN3BAkT+7+nFCMmKvT
 NRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Eb0h8Bb/VxV1goQ9YVuDHHMV4XEvBP4jNtrzRAKJeQ=;
 b=EKHLPLTm+lpeXIc2LwdRp7/4xE3RPZVyHpldGAfpJvd0eNVT8GLB9hRe2yEOjtkqAl
 OT5Mm1eeiqg+SgBf+gksNYERcyiGkSP8u7b7xt3GUt8RXsSVcNkYhezStZG49j4Kmqpd
 wIqlZTkuRvSGU/VyFmuRLFeOvjb7TtOwUdBttYgjlEANE9G0MLKO2UubR3uBzM/BQ0IX
 hjWBN6GmZxRKUGkjtCuBUynBNYgRoQ5lTtadua6hYeKAOVOVPw0FtKt4sPq1bS870CZw
 ox3vmxeioUgiaK97ZBJk7nc1y1UTZg9hytmDor7/frrC2pAS/lqNj/bRxTibS8KdT5Ww
 XP9g==
X-Gm-Message-State: APjAAAXNKgvuHOZRtf6CGEiftSFiCM04n4QlCPZcmOArbme6PvcqvePk
 psQ2O4nci2/DFSCcsRiSlTBdCQ2KINpVUgQ4IMaFoz6ZU5ZYfPee
X-Google-Smtp-Source: APXvYqz7Qp+fOy6eoE4jdi2Ru9B+c3xebiBBV938o/gOtcUuIFQ14xtnQQEEG5i9lQrjfM+HlvdDrKgTSSg+k9ykEgQ=
X-Received: by 2002:a67:d789:: with SMTP id q9mr8472951vsj.159.1569836283067; 
 Mon, 30 Sep 2019 02:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190927184352.28759-1-glaroque@baylibre.com>
 <20190927184352.28759-3-glaroque@baylibre.com>
In-Reply-To: <20190927184352.28759-3-glaroque@baylibre.com>
From: Amit Kucheria <amit.kucheria@linaro.org>
Date: Mon, 30 Sep 2019 15:07:51 +0530
Message-ID: <CAHLCerO3QaUwR-iua8xOYkg+Y82hDAMUdwqB2-kMd24w1gfz+w@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] thermal: amlogic: Add thermal driver to support
 G12 SoCs
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190930_023804_189485_A7EC530A 
X-CRM114-Status: GOOD (  28.29  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>,
 linux-amlogic@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
 lakml <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Sep 28, 2019 at 12:14 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> Amlogic G12A and G12B SoCs integrate two thermal sensors
> with the same design. One is located close to the DDR controller
> and the other one is located close to the PLLs (between the CPU and GPU).
>
> The calibration data for each of the thermal sensors instance is stored
> in a different location within the AO region.
>
> Implement reading the temperature from each thermal sensor.
>
> The IP block has more functionality, which may be added to this driver
> in the future:
> - chip reset when the temperature exceeds a configurable threshold
> - up to four interrupts when the temperature has risen above a
> configurable threshold
> - up to four interrupts when the temperature has fallen below a
> configurable threshold
>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>


Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/Kconfig           |  11 +
>  drivers/thermal/Makefile          |   1 +
>  drivers/thermal/amlogic_thermal.c | 333 ++++++++++++++++++++++++++++++
>  3 files changed, 345 insertions(+)
>  create mode 100644 drivers/thermal/amlogic_thermal.c
>
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 9966364a6deb..0f31bb4bc372 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -348,6 +348,17 @@ config MTK_THERMAL
>           Enable this option if you want to have support for thermal management
>           controller present in Mediatek SoCs
>
> +config AMLOGIC_THERMAL
> +       tristate "Amlogic Thermal Support"
> +       default ARCH_MESON
> +       depends on OF && ARCH_MESON
> +       help
> +         If you say yes here you get support for Amlogic Thermal
> +         for G12 SoC Family.
> +
> +         This driver can also be built as a module. If so, the module will
> +         be called amlogic_thermal.
> +
>  menu "Intel thermal drivers"
>  depends on X86 || X86_INTEL_QUARK || COMPILE_TEST
>  source "drivers/thermal/intel/Kconfig"
> diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
> index 74a37c7f847a..baeb70bf0568 100644
> --- a/drivers/thermal/Makefile
> +++ b/drivers/thermal/Makefile
> @@ -54,3 +54,4 @@ obj-$(CONFIG_MTK_THERMAL)     += mtk_thermal.o
>  obj-$(CONFIG_GENERIC_ADC_THERMAL)      += thermal-generic-adc.o
>  obj-$(CONFIG_ZX2967_THERMAL)   += zx2967_thermal.o
>  obj-$(CONFIG_UNIPHIER_THERMAL) += uniphier_thermal.o
> +obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> new file mode 100644
> index 000000000000..8a9e9bc421c6
> --- /dev/null
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -0,0 +1,333 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Amlogic Thermal Sensor Driver
> + *
> + * Copyright (C) 2017 Huan Biao <huan.biao@amlogic.com>
> + * Copyright (C) 2019 Guillaume La Roque <glaroque@baylibre.com>
> + *
> + * Register value to celsius temperature formulas:
> + *     Read_Val            m * U
> + * U = ---------, Uptat = ---------
> + *     2^16              1 + n * U
> + *
> + * Temperature = A * ( Uptat + u_efuse / 2^16 )- B
> + *
> + *  A B m n : calibration parameters
> + *  u_efuse : fused calibration value, it's a signed 16 bits value
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/thermal.h>
> +
> +#include "thermal_core.h"
> +
> +#define TSENSOR_CFG_REG1                       0x4
> +       #define TSENSOR_CFG_REG1_RSET_VBG       BIT(12)
> +       #define TSENSOR_CFG_REG1_RSET_ADC       BIT(11)
> +       #define TSENSOR_CFG_REG1_VCM_EN         BIT(10)
> +       #define TSENSOR_CFG_REG1_VBG_EN         BIT(9)
> +       #define TSENSOR_CFG_REG1_OUT_CTL        BIT(6)
> +       #define TSENSOR_CFG_REG1_FILTER_EN      BIT(5)
> +       #define TSENSOR_CFG_REG1_DEM_EN         BIT(3)
> +       #define TSENSOR_CFG_REG1_CH_SEL         GENMASK(1, 0)
> +       #define TSENSOR_CFG_REG1_ENABLE         \
> +               (TSENSOR_CFG_REG1_FILTER_EN |   \
> +                TSENSOR_CFG_REG1_VCM_EN |      \
> +                TSENSOR_CFG_REG1_VBG_EN |      \
> +                TSENSOR_CFG_REG1_DEM_EN |      \
> +                TSENSOR_CFG_REG1_CH_SEL)
> +
> +#define TSENSOR_STAT0                  0x40
> +
> +#define TSENSOR_STAT9                  0x64
> +
> +#define TSENSOR_READ_TEMP_MASK         GENMASK(15, 0)
> +#define TSENSOR_TEMP_MASK              GENMASK(11, 0)
> +
> +#define TSENSOR_TRIM_SIGN_MASK         BIT(15)
> +#define TSENSOR_TRIM_TEMP_MASK         GENMASK(14, 0)
> +#define TSENSOR_TRIM_VERSION_MASK      GENMASK(31, 24)
> +
> +#define TSENSOR_TRIM_VERSION(_version) \
> +       FIELD_GET(TSENSOR_TRIM_VERSION_MASK, _version)
> +
> +#define TSENSOR_TRIM_CALIB_VALID_MASK  (GENMASK(3, 2) | BIT(7))
> +
> +#define TSENSOR_CALIB_OFFSET   1
> +#define TSENSOR_CALIB_SHIFT    4
> +
> +/**
> + * struct amlogic_thermal_soc_calib_data
> + * @A, B, m, n: calibration parameters
> + * This structure is required for configuration of amlogic thermal driver.
> + */
> +struct amlogic_thermal_soc_calib_data {
> +       int A;
> +       int B;
> +       int m;
> +       int n;
> +};
> +
> +/**
> + * struct amlogic_thermal_data
> + * @u_efuse_off: register offset to read fused calibration value
> + * @calibration_parameters: calibration parameters structure pointer
> + * @regmap_config: regmap config for the device
> + * This structure is required for configuration of amlogic thermal driver.
> + */
> +struct amlogic_thermal_data {
> +       int u_efuse_off;
> +       const struct amlogic_thermal_soc_calib_data *calibration_parameters;
> +       const struct regmap_config *regmap_config;
> +};
> +
> +struct amlogic_thermal {
> +       struct platform_device *pdev;
> +       const struct amlogic_thermal_data *data;
> +       struct regmap *regmap;
> +       struct regmap *sec_ao_map;
> +       struct clk *clk;
> +       struct thermal_zone_device *tzd;
> +       u32 trim_info;
> +};
> +
> +/*
> + * Calculate a temperature value from a temperature code.
> + * The unit of the temperature is degree milliCelsius.
> + */
> +static int amlogic_thermal_code_to_millicelsius(struct amlogic_thermal *pdata,
> +                                               int temp_code)
> +{
> +       const struct amlogic_thermal_soc_calib_data *param =
> +                                       pdata->data->calibration_parameters;
> +       int temp;
> +       s64 factor, Uptat, uefuse;
> +
> +       uefuse = pdata->trim_info & TSENSOR_TRIM_SIGN_MASK ?
> +                            ~(pdata->trim_info & TSENSOR_TRIM_TEMP_MASK) + 1 :
> +                            (pdata->trim_info & TSENSOR_TRIM_TEMP_MASK);
> +
> +       factor = param->n * temp_code;
> +       factor = div_s64(factor, 100);
> +
> +       Uptat = temp_code * param->m;
> +       Uptat = div_s64(Uptat, 100);
> +       Uptat = Uptat * BIT(16);
> +       Uptat = div_s64(Uptat, BIT(16) + factor);
> +
> +       temp = (Uptat + uefuse) * param->A;
> +       temp = div_s64(temp, BIT(16));
> +       temp = (temp - param->B) * 100;
> +
> +       return temp;
> +}
> +
> +static int amlogic_thermal_initialize(struct amlogic_thermal *pdata)
> +{
> +       int ret = 0;
> +       int ver;
> +
> +       regmap_read(pdata->sec_ao_map, pdata->data->u_efuse_off,
> +                   &pdata->trim_info);
> +
> +       ver = TSENSOR_TRIM_VERSION(pdata->trim_info);
> +
> +       if ((ver & TSENSOR_TRIM_CALIB_VALID_MASK) == 0) {
> +               ret = -EINVAL;
> +               dev_err(&pdata->pdev->dev,
> +                       "tsensor thermal calibration not supported: 0x%x!\n",
> +                       ver);
> +       }
> +
> +       return ret;
> +}
> +
> +static int amlogic_thermal_enable(struct amlogic_thermal *data)
> +{
> +       int ret;
> +
> +       ret = clk_prepare_enable(data->clk);
> +       if (ret)
> +               return ret;
> +
> +       regmap_update_bits(data->regmap, TSENSOR_CFG_REG1,
> +                          TSENSOR_CFG_REG1_ENABLE, TSENSOR_CFG_REG1_ENABLE);
> +
> +       return 0;
> +}
> +
> +static int amlogic_thermal_disable(struct amlogic_thermal *data)
> +{
> +       regmap_update_bits(data->regmap, TSENSOR_CFG_REG1,
> +                          TSENSOR_CFG_REG1_ENABLE, 0);
> +       clk_disable_unprepare(data->clk);
> +
> +       return 0;
> +}
> +
> +static int amlogic_thermal_get_temp(void *data, int *temp)
> +{
> +       unsigned int tval;
> +       struct amlogic_thermal *pdata = data;
> +
> +       if (!data)
> +               return -EINVAL;
> +
> +       regmap_read(pdata->regmap, TSENSOR_STAT0, &tval);
> +       *temp =
> +          amlogic_thermal_code_to_millicelsius(pdata,
> +                                               tval & TSENSOR_READ_TEMP_MASK);
> +
> +       return 0;
> +}
> +
> +static const struct thermal_zone_of_device_ops amlogic_thermal_ops = {
> +       .get_temp       = amlogic_thermal_get_temp,
> +};
> +
> +static const struct regmap_config amlogic_thermal_regmap_config_g12a = {
> +       .reg_bits = 8,
> +       .val_bits = 32,
> +       .reg_stride = 4,
> +       .max_register = TSENSOR_STAT9,
> +};
> +
> +static const struct amlogic_thermal_soc_calib_data amlogic_thermal_g12a = {
> +       .A = 9411,
> +       .B = 3159,
> +       .m = 424,
> +       .n = 324,
> +};
> +
> +static const struct amlogic_thermal_data amlogic_thermal_g12a_cpu_param = {
> +       .u_efuse_off = 0x128,
> +       .calibration_parameters = &amlogic_thermal_g12a,
> +       .regmap_config = &amlogic_thermal_regmap_config_g12a,
> +};
> +
> +static const struct amlogic_thermal_data amlogic_thermal_g12a_ddr_param = {
> +       .u_efuse_off = 0xf0,
> +       .calibration_parameters = &amlogic_thermal_g12a,
> +       .regmap_config = &amlogic_thermal_regmap_config_g12a,
> +};
> +
> +static const struct of_device_id of_amlogic_thermal_match[] = {
> +       {
> +               .compatible = "amlogic,g12a-ddr-thermal",
> +               .data = &amlogic_thermal_g12a_ddr_param,
> +       },
> +       {
> +               .compatible = "amlogic,g12a-cpu-thermal",
> +               .data = &amlogic_thermal_g12a_cpu_param,
> +       },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);
> +
> +static int amlogic_thermal_probe(struct platform_device *pdev)
> +{
> +       struct amlogic_thermal *pdata;
> +       struct device *dev = &pdev->dev;
> +       void __iomem *base;
> +       int ret;
> +
> +       pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
> +       if (!pdata)
> +               return -ENOMEM;
> +
> +       pdata->data = of_device_get_match_data(dev);
> +       pdata->pdev = pdev;
> +       platform_set_drvdata(pdev, pdata);
> +
> +       base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base)) {
> +               dev_err(dev, "failed to get io address\n");
> +               return PTR_ERR(base);
> +       }
> +
> +       pdata->regmap = devm_regmap_init_mmio(dev, base,
> +                                             pdata->data->regmap_config);
> +       if (IS_ERR(pdata->regmap))
> +               return PTR_ERR(pdata->regmap);
> +
> +       pdata->clk = devm_clk_get(dev, NULL);
> +       if (IS_ERR(pdata->clk)) {
> +               if (PTR_ERR(pdata->clk) != -EPROBE_DEFER)
> +                       dev_err(dev, "failed to get clock\n");
> +               return PTR_ERR(pdata->clk);
> +       }
> +
> +       pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
> +               (pdev->dev.of_node, "amlogic,ao-secure");
> +       if (IS_ERR(pdata->sec_ao_map)) {
> +               dev_err(dev, "syscon regmap lookup failed.\n");
> +               return PTR_ERR(pdata->sec_ao_map);
> +       }
> +
> +       pdata->tzd = devm_thermal_zone_of_sensor_register(&pdev->dev,
> +                                                         0,
> +                                                         pdata,
> +                                                         &amlogic_thermal_ops);
> +       if (IS_ERR(pdata->tzd)) {
> +               ret = PTR_ERR(pdata->tzd);
> +               dev_err(dev, "Failed to register tsensor: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = amlogic_thermal_initialize(pdata);
> +       if (ret)
> +               return ret;
> +
> +       ret = amlogic_thermal_enable(pdata);
> +
> +       return ret;
> +}
> +
> +static int amlogic_thermal_remove(struct platform_device *pdev)
> +{
> +       struct amlogic_thermal *data = platform_get_drvdata(pdev);
> +
> +       return amlogic_thermal_disable(data);
> +}
> +
> +static int __maybe_unused amlogic_thermal_suspend(struct device *dev)
> +{
> +       struct amlogic_thermal *data = dev_get_drvdata(dev);
> +
> +       return amlogic_thermal_disable(data);
> +}
> +
> +static int __maybe_unused amlogic_thermal_resume(struct device *dev)
> +{
> +       struct amlogic_thermal *data = dev_get_drvdata(dev);
> +
> +       return amlogic_thermal_enable(data);
> +}
> +
> +static SIMPLE_DEV_PM_OPS(amlogic_thermal_pm_ops,
> +                        amlogic_thermal_suspend, amlogic_thermal_resume);
> +
> +static struct platform_driver amlogic_thermal_driver = {
> +       .driver = {
> +               .name           = "amlogic_thermal",
> +               .pm             = &amlogic_thermal_pm_ops,
> +               .of_match_table = of_amlogic_thermal_match,
> +       },
> +       .probe  = amlogic_thermal_probe,
> +       .remove = amlogic_thermal_remove,
> +};
> +
> +module_platform_driver(amlogic_thermal_driver);
> +
> +MODULE_AUTHOR("Guillaume La Roque <glaroque@baylibre.com>");
> +MODULE_DESCRIPTION("Amlogic thermal driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.17.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
