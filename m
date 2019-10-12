Return-Path: <SRS0=gqBQ=YF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A449C10F14
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Oct 2019 14:29:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C951C206CD
	for <linux-amlogic@archiver.kernel.org>; Sat, 12 Oct 2019 14:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UopM+wPJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9MGv9kY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C951C206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mF/x2A7i6lartGcPC3HuTSQDQ9/wsL74cR1IcYR2o2Y=; b=UopM+wPJBvNqCBuGFANFYlv1J
	wdzt0xJctGXoxNC/qhUPdyESHxCYkvDvsKV3zUOdWhRWkCsbkVUAerd2MznBsSiKH6Z2vBD+rBjd2
	HaTdzzUx9eTGDMCQEm+mJPfHH5SEVrZ8ZN25psHGkvc7GLMiDlbmf5ELlWfOX2H80DKlZfadS+VH2
	wQMd5PZW3QaRM7GC+jAj9I159HbmkkeANENl557uNSspgZKS2I3+4gPVTRLbbffcR5M6nWe2wR6lF
	4Hry3DiyARfcFxMnHy+iInX2VkfNgDq4GkQGtnnDlTMV3eJXtz9/U1HVffN1EXDQcJlodZKfXpX2m
	Fq8+r5ldA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJIOg-0005OW-OM; Sat, 12 Oct 2019 14:29:30 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJIOW-0005HM-Ln; Sat, 12 Oct 2019 14:29:22 +0000
Received: by mail-pf1-x442.google.com with SMTP id h195so7793248pfe.5;
 Sat, 12 Oct 2019 07:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wFyrE4sJHknnmugam0lljEG4OV3Sn7PQE66jy+Yciqg=;
 b=E9MGv9kYieDKfFWbqE5FwUfJUM5++tBgIQvj3HKqKOgPv43YdfdXMth7sZeg7VBwvC
 yk0jSZIxDigDYE3hrQY8ZPLGpC1C+WiE+7P2g3hRx9lZwBR7W0KrRL+ITA16ubR6adJF
 rQoKDHD6YIbsb3pFG8d+F0B2/PEq37Isz3C6Oglg6hJELf5pTjQskYn9fSGxTbyncnR9
 tM4xavzdY1/iaSDcNb462vgTajdbr6sqhxv8vQbBsRx/8YIBhuoayKl864djph3g2Nv2
 u+Rt62saXcJzH4BwkjkIB63q9VRxUG4NZY1+26BCDb4KMt6eyK/EoI5iBA/mDUeCuTiw
 hKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wFyrE4sJHknnmugam0lljEG4OV3Sn7PQE66jy+Yciqg=;
 b=OGjjd9SpYiR631QEU6+v2gWnT3Hoxv6VnWaNhFHNNUAK2nAcL2jV6pk9WwTuIZA5Ms
 fVvxNOJL+l5IOOhKhOEfO4VKK+9QaTIKNbuV68Py+ofVlkiFOgtcxsOHmDxXBoshHPCb
 nPFvuIKtfz4P97cTPmZQexf7a96Pb4q9qPDgUycoYnhOG1h+wzFmmznluHi4Z9XmQLkQ
 JkzgIHNGIOFq804hlkm3OByWEGOYHy28mDhdP6wwxXsOAyMFeClD72dbLqH+KLKy1tiQ
 MIz1qeWJxSSRrnd1aWq0VAFHHKRgA/2DjYYk2rliiEaPsl/kYngrQAvvDWjJ4gPuo2xd
 1jrQ==
X-Gm-Message-State: APjAAAUM1PfOduJ8YzKPyQ/B2WvvnMBdcI3Yc2xbD0c7WDCe08kJyhH8
 p4kaMMEamnzQfRO36jQDC4A=
X-Google-Smtp-Source: APXvYqxPHup9PSwGxijToNsQGC3Z5sdQTsb9RH+Ajc7G6sO7cQwSJey0vCuxBByAKPHw6GFrGaa67Q==
X-Received: by 2002:aa7:9525:: with SMTP id c5mr22152324pfp.22.1570890559108; 
 Sat, 12 Oct 2019 07:29:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 u3sm12501348pfn.134.2019.10.12.07.29.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 12 Oct 2019 07:29:17 -0700 (PDT)
Subject: Re: [PATCH 3/4] watchdog: add meson secure watchdog driver
To: Xingyu Chen <xingyu.chen@amlogic.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>
References: <1570874721-36077-1-git-send-email-xingyu.chen@amlogic.com>
 <1570874721-36077-4-git-send-email-xingyu.chen@amlogic.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <07e8aef0-c991-f212-d500-c5ce77b3dea3@roeck-us.net>
Date: Sat, 12 Oct 2019 07:29:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570874721-36077-4-git-send-email-xingyu.chen@amlogic.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191012_072920_743863_8C5774C2 
X-CRM114-Status: GOOD (  27.94  )
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
Cc: Qianggui Song <qianggui.song@amlogic.com>, linux-watchdog@vger.kernel.org,
 Jianxin Pan <jianxin.pan@amlogic.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/12/19 3:05 AM, Xingyu Chen wrote:
> The watchdog controller on the Meson-A/C series SoCs is moved to secure
> world, watchdog operation needs to be done in secure EL3 mode via ATF,
> Non-secure world can call SMC instruction to trap to AFT for watchdog
> operation.
> 
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
> ---
>   drivers/watchdog/Kconfig         |  16 +++
>   drivers/watchdog/Makefile        |   1 +
>   drivers/watchdog/meson_sec_wdt.c | 205 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 222 insertions(+)
>   create mode 100644 drivers/watchdog/meson_sec_wdt.c
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 58e7c10..e6b0707 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -826,6 +826,22 @@ config MESON_GXBB_WATCHDOG
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called meson_gxbb_wdt.
>   
> +config MESON_SEC_WATCHDOG
> +	tristate "Amlogic Meson Secure watchdog support"
> +	depends on ARCH_MESON || COMPILE_TEST

Did you try COMPILE_TEST (eg allmodconfig) on, say x86_64 ?
AFAICS the meson sm calls are only available if MESON_SM is
enabled, and that depends on both ARCH_MESON and ARM64_4K_PAGES.
This dependency is not expressed here, and neither is enabled
with COMPILE_TEST.

> +	select WATCHDOG_CORE
> +	help
> +	  The watchdog controller on the Meson-A/C series SoCs is moved to
> +	  secure world, watchdog operation needs to be done in secure EL3
> +	  mode via ATF, non-secure world can call SMC instruction to trap
> +	  to ATF for the watchdog operation.
> +
> +	  Say Y here if watchdog controller on Meson SoCs is located in
> +	  secure world.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called meson_sec_wdt.
> +
>   config MESON_WATCHDOG
>   	tristate "Amlogic Meson SoCs watchdog support"
>   	depends on ARCH_MESON || COMPILE_TEST
> diff --git a/drivers/watchdog/Makefile b/drivers/watchdog/Makefile
> index 2ee352b..5e6b73d 100644
> --- a/drivers/watchdog/Makefile
> +++ b/drivers/watchdog/Makefile
> @@ -78,6 +78,7 @@ obj-$(CONFIG_QCOM_WDT) += qcom-wdt.o
>   obj-$(CONFIG_BCM_KONA_WDT) += bcm_kona_wdt.o
>   obj-$(CONFIG_TEGRA_WATCHDOG) += tegra_wdt.o
>   obj-$(CONFIG_MESON_GXBB_WATCHDOG) += meson_gxbb_wdt.o
> +obj-$(CONFIG_MESON_SEC_WATCHDOG) += meson_sec_wdt.o
>   obj-$(CONFIG_MESON_WATCHDOG) += meson_wdt.o
>   obj-$(CONFIG_MEDIATEK_WATCHDOG) += mtk_wdt.o
>   obj-$(CONFIG_DIGICOLOR_WATCHDOG) += digicolor_wdt.o
> diff --git a/drivers/watchdog/meson_sec_wdt.c b/drivers/watchdog/meson_sec_wdt.c
> new file mode 100644
> index 00000000..2b5357c
> --- /dev/null
> +++ b/drivers/watchdog/meson_sec_wdt.c
> @@ -0,0 +1,205 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + * Author: Xingyu Chen <xingyu.chen@amlogic.com>
> + *
> + */
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/watchdog.h>
> +#include <linux/firmware/meson/meson_sm.h>
> +
> +#define MESON_SIP_WDT_DISABLE		0x1
> +#define MESON_SIP_WDT_ENABLE		0x2
> +#define MESON_SIP_WDT_PING		0x3
> +#define MESON_SIP_WDT_INIT		0x4
> +#define MESON_SIP_WDT_RESETNOW		0x5
> +#define MESON_SIP_WDT_SETTIMEOUT	0x6
> +#define MESON_SIP_WDT_GETTIMELEFT	0x7
> +
> +#define DEFAULT_TIMEOUT			30 /* seconds */
> +
> +/*
> + * Watchdog timer tick is set to 1ms in secfw side, and tick count is
> + * stored in the bit[16-31] of WATCHDOG_CNT register, so the maximum
> + * timeout value is 0xffff ms.
> + */
> +#define MAX_TIMEOUT_MS			0xFFFF
> +
> +struct meson_sec_wdt {
> +	struct watchdog_device wdt_dev;
> +	struct meson_sm_firmware *fw;
> +};
> +
> +static int meson_sec_wdt_start(struct watchdog_device *wdt_dev)
> +{
> +	int ret;
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			    MESON_SIP_WDT_ENABLE, 0, 0, 0, 0); > +	if (ret)
> +		return ret;
> +
> +	return 0;

This is equivalent to
	return ret;
or even
	return meson_sm_call(...);

> +}
> +
> +static int meson_sec_wdt_stop(struct watchdog_device *wdt_dev)
> +{
> +	int ret;
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			    MESON_SIP_WDT_DISABLE, 0, 0, 0, 0);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Same as above.

> +}
> +
> +static int meson_sec_wdt_ping(struct watchdog_device *wdt_dev)
> +{
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +		      MESON_SIP_WDT_PING, 0, 0, 0, 0);
> +
> +	return 0;

Why ignore errors ?

> +}
> +
> +static int meson_sec_wdt_set_timeout(struct watchdog_device *wdt_dev,
> +				     unsigned int timeout)
> +{
> +	int ret;
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	wdt_dev->timeout = timeout;
> +	meson_sec_wdt_ping(wdt_dev);
> +

Unconditionally ? Also, the core does that after setting the timeout.

> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			    MESON_SIP_WDT_SETTIMEOUT,
> +			    wdt_dev->timeout, 0, 0, 0);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

same as above.

> +}
> +
> +static unsigned int meson_sec_wdt_get_timeleft(struct watchdog_device *wdt_dev)
> +{
> +	int ret;
> +	int timeleft;
> +	struct meson_sec_wdt *data = watchdog_get_drvdata(wdt_dev);
> +
> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, &timeleft,
> +			    MESON_SIP_WDT_GETTIMELEFT, 0, 0, 0, 0);
> +
> +	if (ret)
> +		return 0;

Really ? Why ? 0 is most definitely incorrect here.

> +
> +	return timeleft;
> +}
> +
> +static const struct watchdog_ops meson_sec_wdt_ops = {
> +	.start = meson_sec_wdt_start,
> +	.stop = meson_sec_wdt_stop,
> +	.ping = meson_sec_wdt_ping,
> +	.set_timeout = meson_sec_wdt_set_timeout,
> +	.get_timeleft = meson_sec_wdt_get_timeleft,
> +};
> +
> +static const struct watchdog_info meson_sec_wdt_info = {
> +	.identity = "Meson Secure Watchdog Timer",
> +	.options = WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE,
> +};
> +
> +static int __maybe_unused meson_sec_wdt_resume(struct device *dev)
> +{
> +	struct meson_sec_wdt *data = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&data->wdt_dev))
> +		meson_sec_wdt_start(&data->wdt_dev);

No error return ?

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused meson_sec_wdt_suspend(struct device *dev)
> +{
> +	struct meson_sec_wdt *data = dev_get_drvdata(dev);
> +
> +	if (watchdog_active(&data->wdt_dev))
> +		meson_sec_wdt_stop(&data->wdt_dev);

No error return ?

> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops meson_sec_wdt_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(meson_sec_wdt_suspend, meson_sec_wdt_resume)
> +};
> +
> +static const struct of_device_id meson_sec_wdt_dt_ids[] = {
> +	 { .compatible = "amlogic,meson-sec-wdt", },
> +	 { /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, meson_sec_wdt_dt_ids);
> +
> +static int meson_sec_wdt_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct meson_sec_wdt *data;
> +	struct device_node *sm_np;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
> +	if (!sm_np) {
> +		dev_err(&pdev->dev, "no secure-monitor node\n");
> +		return -ENODEV;

ENODEV is wrong here.

> +	}
> +
> +	data->fw = meson_sm_get(sm_np);
> +	of_node_put(sm_np);
> +	if (!data->fw)
> +		return -EPROBE_DEFER;

How do you know ?

> +
> +	platform_set_drvdata(pdev, data);
> +
> +	data->wdt_dev.parent = dev;
> +	data->wdt_dev.info = &meson_sec_wdt_info;
> +	data->wdt_dev.ops = &meson_sec_wdt_ops;
> +	data->wdt_dev.max_hw_heartbeat_ms = MAX_TIMEOUT_MS;
> +	data->wdt_dev.min_timeout = 1;
> +	data->wdt_dev.timeout = DEFAULT_TIMEOUT;
> +	watchdog_set_drvdata(&data->wdt_dev, data);
> +
No watchdog_init_timeout() ? Any special reason for not supporting
to set the timeout with a devicetree property ?

> +	ret = meson_sm_call(data->fw, SM_WATCHDOG_OPS, NULL,
> +			    MESON_SIP_WDT_INIT,
> +			    data->wdt_dev.timeout, 0, 0, 0);
> +	if (ret)
> +		return ret;
> +
> +	watchdog_stop_on_reboot(&data->wdt_dev);
> +
> +	return devm_watchdog_register_device(dev, &data->wdt_dev);
> +}
> +
> +static struct platform_driver meson_sec_wdt_driver = {
> +	.probe	= meson_sec_wdt_probe,
> +	.driver = {
> +		.name = "meson-sec-wdt",
> +		.pm = &meson_sec_wdt_pm_ops,
> +		.of_match_table	= meson_sec_wdt_dt_ids,
> +	},
> +};
> +
> +module_platform_driver(meson_sec_wdt_driver);
> +
> +MODULE_AUTHOR("Xingyu Chen <xingyu.chen@amlogic.com>");
> +MODULE_DESCRIPTION("Amlogic Secure Watchdog Timer Driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> 
BSD or MIT ? This should match the license identifier.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
