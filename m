Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEEEC3DA49
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jul 2024 01:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTeuft88zY9wGET93OmRJq1Ghf4W+/aFbkTexaZuaDw=; b=LHQWLX+5bcvpqe
	w15jVW8ZzpTb3dkRrN3o4h4pJ1fEDA2X+LpgzsyXb6DQeDYyCeL1DZ73JI75OhZinxIvEKlldFdRa
	vA9jBLXmoe1LeBidh7RtgkQZpWdgA9Yg5YyI586l8gfOY5gL0Gg9MdLuHP9x+MgW32cbz4Yn2eawn
	vIdk8G20WZMbQeU+Lwy4SO7Cy/crK9ZiKC/R5Vme9uSEf67F0w4S7DVQ0FVjtKpaL9QjTR+q2fyt+
	xdQdjDZfeANfAc+pb9eHzUhS1N403KLLhqArh2VdSO+H6/HCv9W3ux1pFp4n9QEUrbwEhOeKmxNTJ
	4CxxuXLyle1Oa5NgpRuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWQgZ-0000000Dzrq-3QG7;
	Wed, 24 Jul 2024 01:20:55 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWQgV-0000000Dzoe-1lbX
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jul 2024 01:20:53 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 0CA61100008;
	Wed, 24 Jul 2024 04:20:44 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 0CA61100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1721784044;
	bh=q2ckd34mx4TWbRYSYcwBCcSeAj+nSLVFIxnsrndcMhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=cfDVnVuarZUxe4kbQmR3LDS6MxjZR0t6PW+YMPzwdn2zhKWUJm8nSahLnengd5Cxy
	 PWji54tyeB1FnsRH4j+hR1E5a2y1DkuTeJAd2mLbKB3cOz2OAoG2PrayT4Lj0Q5oBq
	 asUYoWmBbtor0IE58smdjDSB3jwOR763YD3eqdgDbOGuZ4I3MSfNs477AIMyICUYiD
	 Q7Phg6IsKfE2N5rqzpNGOrXu/jT6tv4w/sc3AdagNFWZEVWY7ysix5dA14KbIqaRRU
	 myPlxsGpA3QYbIm2HhpI/HB5/1USvP6eX1k4+aJXxh6pzqK2o7paACiylQYgXPGMrU
	 yu54tZS2zIrkg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 24 Jul 2024 04:20:43 +0300 (MSK)
Received: from [192.168.20.2] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 24 Jul 2024 04:20:43 +0300
Message-ID: <f6b7f390-cf76-420f-801b-928f3b1ce51b@salutedevices.com>
Date: Wed, 24 Jul 2024 04:18:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] reset: amlogic: add auxiliary reset driver support
To: Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
 <20240718095755.3511992-10-jbrunet@baylibre.com>
Content-Language: en-US
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240718095755.3511992-10-jbrunet@baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 186690 [Jul 24 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 24 0.3.24 186c4d603b899ccfd4883d230c53f273b80e467f, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;salutedevices.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/07/23 17:33:00 #26132980
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_182052_007025_B4729A70 
X-CRM114-Status: GOOD (  30.34  )
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



On 7/18/24 12:57, Jerome Brunet wrote:
> Add support for the reset controller present in the audio clock
> controller of the g12 and sm1 SoC families, using the auxiliary bus.
> 
> This is expected to replace the driver currently present directly
> within the related clock driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/amlogic/Kconfig               |   8 ++
>  drivers/reset/amlogic/Makefile              |   1 +
>  drivers/reset/amlogic/reset-meson-aux.c     | 136 ++++++++++++++++++++
>  drivers/reset/amlogic/reset-meson-core.c    |  25 +++-
>  drivers/reset/amlogic/reset-meson-pltf.c    |   3 +
>  drivers/reset/amlogic/reset-meson.h         |   4 +
>  include/soc/amlogic/meson-auxiliary-reset.h |  23 ++++
>  7 files changed, 198 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
>  create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h
> 
> diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
> index 04c7be0f3165..ee1c7620a2b1 100644
> --- a/drivers/reset/amlogic/Kconfig
> +++ b/drivers/reset/amlogic/Kconfig
> @@ -11,6 +11,14 @@ config RESET_MESON
>  	help
>  	  This enables the reset platform driver for Amlogic SoCs.
>  
> +config RESET_MESON_AUX
> +	tristate "Meson Reset Platform Driver"

Is it correct? I suppose you mean "... Auxiliary Driver", because there
is another "Meson Reset Platform Driver" several lines above.

> +	depends on ARCH_MESON || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select RESET_MESON_CORE
> +	help
> +	  This enables the reset auxiliary driver for Amlogic SoCs.
> +
>  config RESET_MESON_AUDIO_ARB
>  	tristate "Meson Audio Memory Arbiter Reset Driver"
>  	depends on ARCH_MESON || COMPILE_TEST
> diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
> index 0f8f9121b566..5d53a4b11ed9 100644
> --- a/drivers/reset/amlogic/Makefile
> +++ b/drivers/reset/amlogic/Makefile
> @@ -1,3 +1,4 @@
>  obj-$(CONFIG_RESET_MESON) += reset-meson-pltf.o
> +obj-$(CONFIG_RESET_MESON_AUX) += reset-meson-aux.o
>  obj-$(CONFIG_RESET_MESON_CORE) += reset-meson-core.o
>  obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
> diff --git a/drivers/reset/amlogic/reset-meson-aux.c b/drivers/reset/amlogic/reset-meson-aux.c
> new file mode 100644
> index 000000000000..caf26eb67c14
> --- /dev/null
> +++ b/drivers/reset/amlogic/reset-meson-aux.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Amlogic Meson Reset Auxiliary driver
> + *
> + * Copyright (c) 2024 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/slab.h>
> +
> +#include "reset-meson.h"
> +#include <soc/amlogic/meson-auxiliary-reset.h>
> +
> +static DEFINE_IDA(meson_rst_aux_ida);
> +
> +struct meson_reset_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *map;
> +};
> +
> +#define to_meson_reset_adev(_adev) \
> +	container_of((_adev), struct meson_reset_adev, adev)
> +
> +static const struct meson_reset_param meson_g12a_audio_param = {
> +	.reset_ops	= &meson_reset_toggle_ops,
> +	.reset_num	= 26,
> +	.level_offset	= 0x24,
> +};
> +
> +static const struct meson_reset_param meson_sm1_audio_param = {
> +	.reset_ops	= &meson_reset_toggle_ops,
> +	.reset_num	= 39,
> +	.level_offset	= 0x28,
> +};
> +
> +static const struct auxiliary_device_id meson_reset_aux_ids[] = {
> +	{
> +		.name = "axg-audio-clkc.rst-g12a",
> +		.driver_data = (kernel_ulong_t)&meson_g12a_audio_param,
> +	}, {
> +		.name = "axg-audio-clkc.rst-sm1",
> +		.driver_data = (kernel_ulong_t)&meson_sm1_audio_param,
> +	}, {}
> +};
> +MODULE_DEVICE_TABLE(auxiliary, meson_reset_aux_ids);
> +
> +static int meson_reset_aux_probe(struct auxiliary_device *adev,
> +				 const struct auxiliary_device_id *id)
> +{
> +	const struct meson_reset_param *param =
> +		(const struct meson_reset_param *)(id->driver_data);
> +	struct meson_reset_adev *raux =
> +		to_meson_reset_adev(adev);
> +
> +	return meson_reset_probe(&adev->dev, raux->map, param);
> +}
> +
> +static struct auxiliary_driver meson_reset_aux_driver = {
> +	.probe		= meson_reset_aux_probe,
> +	.id_table	= meson_reset_aux_ids,
> +};
> +module_auxiliary_driver(meson_reset_aux_driver);
> +
> +static void meson_rst_aux_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +	struct meson_reset_adev *raux =
> +		to_meson_reset_adev(adev);
> +
> +	ida_free(&meson_rst_aux_ida, adev->id);
> +	kfree(raux);
> +}
> +
> +static void meson_rst_aux_unregister_adev(void *_adev)
> +{
> +	struct auxiliary_device *adev = _adev;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +int devm_meson_rst_aux_register(struct device *dev,
> +				struct regmap *map,
> +				const char *adev_name)
> +{
> +	struct meson_reset_adev *raux;
> +	struct auxiliary_device *adev;
> +	int ret;
> +
> +	raux = kzalloc(sizeof(*raux), GFP_KERNEL);
> +	if (!raux)
> +		return -ENOMEM;
> +
> +	ret = ida_alloc(&meson_rst_aux_ida, GFP_KERNEL);
> +	if (ret < 0)
> +		goto raux_free;
> +
> +	raux->map = map;
> +
> +	adev = &raux->adev;
> +	adev->id = ret;
> +	adev->name = adev_name;
> +	adev->dev.parent = dev;
> +	adev->dev.release = meson_rst_aux_release;
> +	device_set_of_node_from_dev(&adev->dev, dev);
> +
> +	ret = auxiliary_device_init(adev);
> +	if (ret)
> +		goto ida_free;
> +
> +	ret = __auxiliary_device_add(adev, dev->driver->name);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	return devm_add_action_or_reset(dev, meson_rst_aux_unregister_adev,
> +					adev);
> +
> +ida_free:
> +	ida_free(&meson_rst_aux_ida, adev->id);
> +raux_free:
> +	kfree(raux);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(devm_meson_rst_aux_register);
> +
> +MODULE_DESCRIPTION("Amlogic Meson Reset Auxiliary driver");
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_IMPORT_NS(MESON_RESET);
> diff --git a/drivers/reset/amlogic/reset-meson-core.c b/drivers/reset/amlogic/reset-meson-core.c
> index 5e23f3212e6d..1e5883b27c30 100644
> --- a/drivers/reset/amlogic/reset-meson-core.c
> +++ b/drivers/reset/amlogic/reset-meson-core.c
> @@ -86,12 +86,33 @@ static int meson_reset_deassert(struct reset_controller_dev *rcdev,
>  	return meson_reset_level(rcdev, id, false);
>  }
>  
> -static const struct reset_control_ops meson_reset_ops = {
> +static int meson_reset_level_toggle(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	int ret;
> +
> +	ret = meson_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	return meson_reset_deassert(rcdev, id);
> +}
> +
> +const struct reset_control_ops meson_reset_ops = {
>  	.reset		= meson_reset_reset,
>  	.assert		= meson_reset_assert,
>  	.deassert	= meson_reset_deassert,
>  	.status		= meson_reset_status,
>  };
> +EXPORT_SYMBOL_NS_GPL(meson_reset_ops, MESON_RESET);
> +
> +const struct reset_control_ops meson_reset_toggle_ops = {
> +	.reset		= meson_reset_level_toggle,
> +	.assert		= meson_reset_assert,
> +	.deassert	= meson_reset_deassert,
> +	.status		= meson_reset_status,
> +};
> +EXPORT_SYMBOL_NS_GPL(meson_reset_toggle_ops, MESON_RESET);
>  
>  int meson_reset_probe(struct device *dev, struct regmap *map,
>  		      const struct meson_reset_param *param)
> @@ -106,7 +127,7 @@ int meson_reset_probe(struct device *dev, struct regmap *map,
>  	data->map = map;
>  	data->rcdev.owner = dev->driver->owner;
>  	data->rcdev.nr_resets = param->reset_num;
> -	data->rcdev.ops = &meson_reset_ops;
> +	data->rcdev.ops = data->param->reset_ops;
>  	data->rcdev.of_node = dev->of_node;
>  
>  	return devm_reset_controller_register(dev, &data->rcdev);
> diff --git a/drivers/reset/amlogic/reset-meson-pltf.c b/drivers/reset/amlogic/reset-meson-pltf.c
> index 97e933b4aa34..2bc3ea42c6ec 100644
> --- a/drivers/reset/amlogic/reset-meson-pltf.c
> +++ b/drivers/reset/amlogic/reset-meson-pltf.c
> @@ -16,6 +16,7 @@
>  #include "reset-meson.h"
>  
>  static const struct meson_reset_param meson8b_param = {
> +	.reset_ops	= &meson_reset_ops,
>  	.reset_num	= 256,
>  	.reset_offset	= 0x0,
>  	.level_offset	= 0x7c,
> @@ -23,6 +24,7 @@ static const struct meson_reset_param meson8b_param = {
>  };
>  
>  static const struct meson_reset_param meson_a1_param = {
> +	.reset_ops	= &meson_reset_ops,
>  	.reset_num	= 96,
>  	.reset_offset	= 0x0,
>  	.level_offset	= 0x40,
> @@ -30,6 +32,7 @@ static const struct meson_reset_param meson_a1_param = {
>  };
>  
>  static const struct meson_reset_param meson_s4_param = {
> +	.reset_ops	= &meson_reset_ops,
>  	.reset_num	= 192,
>  	.reset_offset	= 0x0,
>  	.level_offset	= 0x40,
> diff --git a/drivers/reset/amlogic/reset-meson.h b/drivers/reset/amlogic/reset-meson.h
> index c2e8a5cf2e46..5ab2ac9ab2e5 100644
> --- a/drivers/reset/amlogic/reset-meson.h
> +++ b/drivers/reset/amlogic/reset-meson.h
> @@ -12,6 +12,7 @@
>  #include <linux/reset-controller.h>
>  
>  struct meson_reset_param {
> +	const struct reset_control_ops *reset_ops;
>  	unsigned int reset_num;
>  	unsigned int reset_offset;
>  	unsigned int level_offset;
> @@ -21,4 +22,7 @@ struct meson_reset_param {
>  int meson_reset_probe(struct device *dev, struct regmap *map,
>  		      const struct meson_reset_param *param);
>  
> +extern const struct reset_control_ops meson_reset_ops;
> +extern const struct reset_control_ops meson_reset_toggle_ops;
> +
>  #endif /* __MESON_RESET_CORE_H */
> diff --git a/include/soc/amlogic/meson-auxiliary-reset.h b/include/soc/amlogic/meson-auxiliary-reset.h
> new file mode 100644
> index 000000000000..f70dd864ef6a
> --- /dev/null
> +++ b/include/soc/amlogic/meson-auxiliary-reset.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __SOC_AMLOGIC_MESON_AUX_RESET_H
> +#define __SOC_AMLOGIC_MESON_AUX_RESET_H
> +
> +#include <linux/err.h>
> +
> +struct device;
> +struct regmap;
> +
> +#if IS_ENABLED(CONFIG_RESET_MESON_AUX)
> +int devm_meson_rst_aux_register(struct device *dev,
> +				struct regmap *map,
> +				const char *adev_name);
> +#else
> +static inline int devm_meson_rst_aux_register(struct device *dev,
> +					      struct regmap *map,
> +					      const char *adev_name)
> +{
> +	return 0;
> +}
> +#endif
> +
> +#endif /* __SOC_AMLOGIC_MESON_AUX_RESET_H */

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
