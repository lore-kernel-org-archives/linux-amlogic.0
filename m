Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F5CC3DA42
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 22:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/8V0lUASfddbNstKXQBJmURhSwlOAKeL2WgZRX3pJ8=; b=Y68q13xF6ZTw0i
	ywhqtKnGT+K0OvMfCaxuQ3HBGvGVzbEQMbOqqN0ZG5/ehzba76yGSAurcJjSTrvZ9rwQIjOVB86sr
	fA1gxnLkCwTpC4JzIcCQojQZWwuH0swfau0lHRk+UpcYzOdnoM4hCyIhcmAD3zsyWx0JlIWn3ixDR
	An7Zy5iIF5eQwCZDEMPMI2+EFHuXpkk+PV14hedQ+IE3G3xMXcutEbC1Wh0F5SMkw538IzrIvkAKU
	Kf6YRJgpJKT1y/wiI16hUXC2ZOBxPYVZG2tAMZRihGlE61E+TYYtydDZ4BD1Z5JRNge9fp5tTwX8t
	IqKo7sNXLKuK5RHNg7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRg88-0000000Byz8-3SCE;
	Wed, 10 Jul 2024 22:49:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRg86-0000000Byyb-16hF
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 22:49:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87ECB61BED;
	Wed, 10 Jul 2024 22:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5EDC32781;
	Wed, 10 Jul 2024 22:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720651781;
	bh=duthhsCiMaf6+uYQBqrPWZwMJtFLktyeXPQfhoZLBK8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=l2G6n3eIgTuRCXBmGTi2GFdLbX8g+Hpmz0n3jJIxIdhxE0yB9zIb47iyYSje/PRnf
	 v6XPBi0MN4jip4cMkBo6D/ua15qWgK0WouDNoKaTygqPzzbXEjDLBPnLnldXlMxPaP
	 Yv9idnlkozzWfdTqb3Wz9XQ2rbdBJ5Ro1LqZfQCadRLRMe1kgB0SeLwg5KiVc9IYQ2
	 D276Iq6wWTeLP8WsmPvrxx0OLP/E7p/QDhUD0/qn8a7fQ6BIyaaZ4S9J5bGutsB9ui
	 CAQLezJIEKyU/Ioa2HSdeViffBVLFOPdMlJDhkDUpAaL8CcyGmk9JqE1h/4OqLsPYi
	 yGgq/EZYVsAWQ==
Message-ID: <88d1dbd92e922ad002367d8dac67d0eb.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240710162526.2341399-8-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com> <20240710162526.2341399-8-jbrunet@baylibre.com>
Subject: Re: [PATCH 7/8] reset: amlogic: add auxiliary reset driver support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Jan Dakinevich <jan.dakinevich@salutedevices.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 10 Jul 2024 15:49:38 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_154942_409491_DBE864E1 
X-CRM114-Status: GOOD (  14.62  )
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

Quoting Jerome Brunet (2024-07-10 09:25:16)
> diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
> index e34a10b15593..5cc767d50e8f 100644
> --- a/drivers/reset/reset-meson.c
> +++ b/drivers/reset/reset-meson.c
[...]
> +
> +int devm_meson_rst_aux_register(struct device *dev,
> +                               struct regmap *map,
> +                               const char *adev_name)
> +{
> +       struct meson_reset_adev *raux;
> +       struct auxiliary_device *adev;
> +       int ret;
> +
> +       raux = kzalloc(sizeof(*raux), GFP_KERNEL);
> +       if (!raux)
> +               return -ENOMEM;
> +
> +       ret = ida_alloc(&meson_rst_aux_ida, GFP_KERNEL);

Do we expect more than one device with the same name? I wonder if the
IDA can be skipped.

> +       if (ret < 0)
> +               goto raux_free;
> +
> +       raux->map = map;
> +
> +       adev = &raux->adev;
> +       adev->id = ret;
> +       adev->name = adev_name;
> +       adev->dev.parent = dev;
> +       adev->dev.release = meson_rst_aux_release;
> +       device_set_of_node_from_dev(&adev->dev, dev);
> +
> +       ret = auxiliary_device_init(adev);
> +       if (ret)
> +               goto ida_free;
> +
> +       ret = __auxiliary_device_add(adev, dev->driver->name);
> +       if (ret) {
> +               auxiliary_device_uninit(adev);
> +               return ret;
> +       }
> +
> +       return devm_add_action_or_reset(dev, meson_rst_aux_unregister_adev,
> +                                       adev);
> +
> +ida_free:
> +       ida_free(&meson_rst_aux_ida, adev->id);
> +raux_free:
> +       kfree(raux);
> +       return ret;
> +

Nitpick: Drop extra newline?

> +}
> +EXPORT_SYMBOL_GPL(devm_meson_rst_aux_register);
> +
> +MODULE_DESCRIPTION("Amlogic Meson Reset driver");
>  MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
> +MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/include/soc/amlogic/meson-auxiliary-reset.h b/include/soc/amlogic/meson-auxiliary-reset.h
> new file mode 100644
> index 000000000000..8fdb02b18d8c
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
> +#ifdef CONFIG_RESET_MESON
> +int devm_meson_rst_aux_register(struct device *dev,
> +                               struct regmap *map,
> +                               const char *adev_name);
> +#else
> +static inline int devm_meson_rst_aux_register(struct device *dev,
> +                                             struct regmap *map,
> +                                             const char *adev_name)
> +{
> +       return -EOPNOTSUPP;

Shouldn't this be 'return 0' so that the clk driver doesn't have to care
about the config?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
