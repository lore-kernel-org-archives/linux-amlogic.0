Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B47C04FFE
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 May 2024 01:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68CMec13K7v2Mow4YXNKlqtsyYlLQDYZROtIK6TA9u4=; b=bYFFfqXBesMk9e
	kRJANWXB2TSLg0hOpvYx5L48yBEoWBFYaVM00wvNGmNoSgbkyeoAxY9KuVJDSkwekGI62zsxzZXZH
	PuUGSOGW9Px5zVTtGm2DcO7NTZmD8x59NYWI8FO/gTTJuO7cbK319TPml26LY2urrXrAGAzwd9szG
	YrcWrnZu+2eR21U78JywuF879P//QE42aWUbZvaN9VoEk6H5hiTCrj6Uu4ZUaNLoecMlplMqTO/Kw
	v7o/my2ox8RfGY/BCx5+GvaJyJpnkIxdC53A1ZOSj2LpdzanX5ERHKwimXYtGbPSKxdOAVsnDIM1k
	YTeFPCCsI1npBVij+CVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s88t4-00000009MVU-32Rf;
	Sat, 18 May 2024 01:29:26 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s88t0-00000009MUf-0yUc
	for linux-amlogic@lists.infradead.org;
	Sat, 18 May 2024 01:29:25 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 25810120009;
	Sat, 18 May 2024 04:29:07 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 25810120009
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1715995747;
	bh=AZKg+0v7j7yA5sSyJOkuQm+dR23h+2ArrHxYVBhrY/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=OwEPqBh5WFlvxcpgmcDV+4R53+Se/IdjZdTbRaeQAAwS91uU/kYPgmZY2NBe96eRR
	 Gwoj3/Mt6SRZJuDeSsasD0Nu6yOi9adgr+wTM+VeMh+ICIq5WMXNhm4D12Dyr4lwxp
	 FphRtZGexpF9XpnwHz5JGhqgM3p+4bHZaes3Ha8k3YyXEBwpz4W3g3CAoypKQ0aVdr
	 hkkwbXMS3wsxJ5HkHmHKgAmwolvUgqNcdRIGYLwCSOh4o6YjNRvugozwdYZ0E5phjc
	 TDghzoSB62uMt3RSfTFjiQINVmbJDkBmZB+B+EYgQaK5UP0xX6j1YQqendRNBDchJP
	 P4fRnOObd33Pw==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 18 May 2024 04:29:06 +0300 (MSK)
Received: from [192.168.20.2] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sat, 18 May 2024 04:29:06 +0300
Message-ID: <da32106a-5768-4ee2-bf96-6dcf4d9aed0f@salutedevices.com>
Date: Sat, 18 May 2024 04:28:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/9] reset: amlogic: add auxiliary reset driver
 support
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
 <20240516150842.705844-8-jbrunet@baylibre.com>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <20240516150842.705844-8-jbrunet@baylibre.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185325 [May 18 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;100.64.160.123:7.1.2;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/05/17 20:54:00 #25244128
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_182922_836094_39B382DC 
X-CRM114-Status: GOOD (  24.53  )
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



On 5/16/24 18:08, Jerome Brunet wrote:
> Add support for the reset controller present in the audio clock
> controller of the g12 and sm1 SoC families, using the auxiliary bus.
> 
> This is expected to replace the driver currently present directly
> within the related clock driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/reset/Kconfig                         |  1 +
>  drivers/reset/reset-meson.c                   | 46 ++++++++++++++++++-
>  include/soc/amlogic/meson8b-auxiliary-reset.h | 17 +++++++
>  3 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 include/soc/amlogic/meson8b-auxiliary-reset.h
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 85b27c42cf65..4ceb4dc48fbc 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -134,6 +134,7 @@ config RESET_MCHP_SPARX5
>  config RESET_MESON
>  	tristate "Meson Reset Driver"
>  	depends on ARCH_MESON || COMPILE_TEST
> +	depends on AUXILIARY_BUS

I don't understand, who enables AUXILIARY_BUS. If I'm not mistaken,
AUXILIARY_BUS should be selected by something that is going to use it,
and it is not intended for defconfig.

>  	default ARCH_MESON
>  	help
>  	  This enables the reset driver for Amlogic Meson SoCs.
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index e34a10b15593..b5ddb85296ec 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2016 BayLibre, SAS.
>   * Author: Neil Armstrong <narmstrong@baylibre.com>
>   */
> +#include <linux/auxiliary_bus.h>
>  #include <linux/err.h>
>  #include <linux/init.h>
>  #include <linux/io.h>
> @@ -16,6 +17,8 @@
>  #include <linux/slab.h>
>  #include <linux/types.h>
>  
> +#include <soc/amlogic/meson8b-auxiliary-reset.h>
> +
>  struct meson_reset_param {
>  	const struct reset_control_ops *reset_ops;
>  	unsigned int reset_num;
> @@ -218,6 +221,47 @@ static struct platform_driver meson_reset_pltf_driver = {
>  };
>  module_platform_driver(meson_reset_pltf_driver);
>  
> -MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
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
> +	},
> +};
> +MODULE_DEVICE_TABLE(auxiliary, meson_reset_aux_ids);
> +
> +static int meson_reset_aux_probe(struct auxiliary_device *adev,
> +				 const struct auxiliary_device_id *id)
> +{
> +	const struct meson_reset_param *param =
> +		(const struct meson_reset_param *)(id->driver_data);
> +	struct meson8b_reset_adev *raux =
> +		to_meson8b_reset_adev(adev);
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
> +MODULE_DESCRIPTION("Amlogic Meson Reset driver");
>  MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/include/soc/amlogic/meson8b-auxiliary-reset.h b/include/soc/amlogic/meson8b-auxiliary-reset.h
> new file mode 100644
> index 000000000000..0a465deb4440
> --- /dev/null
> +++ b/include/soc/amlogic/meson8b-auxiliary-reset.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __SOC_AMLOGIC_MESON8B_AUX_RESET_H
> +#define __SOC_AMLOGIC_MESON8B_AUX_RESET_H
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +#include <linux/regmap.h>
> +
> +struct meson8b_reset_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *map;
> +};
> +
> +#define to_meson8b_reset_adev(_adev) \
> +	container_of((_adev), struct meson8b_reset_adev, adev)
> +
> +#endif /* __SOC_AMLOGIC_MESON8B_AUX_RESET_H */

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
