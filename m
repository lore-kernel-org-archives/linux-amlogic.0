Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B10D637A3
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Nov 2024 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wv7n7YehB/NV3Oosn9Tncbq8tbS78lR5prV+1kAWhQg=; b=A95/hxOn1RqtMi
	/Fv4ZHv1EfqDZe6zrHeuSD7Vd9KugSkuFra1WW92oB1pDkztL3ZmabqdXNCXio5GgtQvoVdfzYBPn
	BAjUj/Ego94cWvQyK0XCqbIdVtTdkr7D4cKAQTW++nRpDRbR3gy24iDsdXrkehoJVK7vJ88uA0a9e
	e1zHtsOq6dwkE/hYLPPMghRp4ACunOz5d5zGtIt5ASDzvkrgsrSdm9i+8yUIxzmlQ0bhHuOX6+XAv
	GqX5xbv0plx2uzyynOffXwJ0r3FY7zM4yuzOIaK04U7NBYTv3yS8jCJsiChOZXEX+QPOJhzcD+cny
	lWtgoINdmRMccR7NNRvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHir-00000007eRu-3T6B;
	Wed, 13 Nov 2024 18:04:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBHip-00000007eRH-45yB;
	Wed, 13 Nov 2024 18:04:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBD5E5C54BF;
	Wed, 13 Nov 2024 18:03:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC10DC4CEC3;
	Wed, 13 Nov 2024 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731521047;
	bh=nhpDZhwOTC7eq1C5andGhd85RsJd8uDMIHm6QrWJbRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+PSwtbZVHbcyPrMdnmwJ8aIqQWdg4o0ysf4aXQgGrCOJS7yST7kceJCqvR9XqqsF
	 +IwVbKONTuZZ7up1wumL3Uj3RrxwEblLjdllO9MvmZY3SU1mXOhgzROj9Ck3bPk4yg
	 Bduj2rZSf+V6p2MQ1ri8ZTZ0p+JQxg5hiwFbK+2P+Ay8ckqqYoizvhzqLM+DcnFOyl
	 iTKKERLYcR3zr0zQX+kT9U+e4Q78OPL6rphVL29JadjTEp2krzHouC8zq7HCSt5wtM
	 s1s2Tgl9x7YMp7wZFkvzNx44qLyeBfeT+aWtaHusrxpJgUTwgifK0ixwK66LWJp5IQ
	 OzmihPx61K0Nw==
Date: Wed, 13 Nov 2024 12:04:05 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/5] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
Message-ID: <20241113180405.GA653353-robh@kernel.org>
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-4-35ba2401ee35@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113-a4_pinctrl-v6-4-35ba2401ee35@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_100408_126920_6C7E346A 
X-CRM114-Status: GOOD (  20.65  )
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

On Wed, Nov 13, 2024 at 03:29:42PM +0800, Xianwei Zhao wrote:
> Add a new pinctrl driver for Amlogic A4 SoCs which share
> the same register layout as the previous Amlogic S4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pinctrl/meson/Kconfig              |    6 +
>  drivers/pinctrl/meson/Makefile             |    1 +
>  drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1324 ++++++++++++++++++++++++++++
>  3 files changed, 1331 insertions(+)
> 
> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
> index cc397896762c..3e90bb5ec442 100644
> --- a/drivers/pinctrl/meson/Kconfig
> +++ b/drivers/pinctrl/meson/Kconfig
> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
>  	select PINCTRL_MESON_AXG_PMX
>  	default y
>  
> +config PINCTRL_AMLOGIC_A4
> +	tristate "Amlogic A4 SoC pinctrl driver"
> +	depends on ARM64
> +	select PINCTRL_MESON_AXG_PMX
> +	default y
> +
>  config PINCTRL_AMLOGIC_C3
>  	tristate "Amlogic C3 SoC pinctrl driver"
>  	depends on ARM64
> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
> index 9e538b9ffb9b..c92a65a83344 100644
> --- a/drivers/pinctrl/meson/Makefile
> +++ b/drivers/pinctrl/meson/Makefile
> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) += pinctrl-meson-axg.o
>  obj-$(CONFIG_PINCTRL_MESON_G12A) += pinctrl-meson-g12a.o
>  obj-$(CONFIG_PINCTRL_MESON_A1) += pinctrl-meson-a1.o
>  obj-$(CONFIG_PINCTRL_MESON_S4) += pinctrl-meson-s4.o
> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) += pinctrl-amlogic-a4.o
>  obj-$(CONFIG_PINCTRL_AMLOGIC_C3) += pinctrl-amlogic-c3.o
>  obj-$(CONFIG_PINCTRL_AMLOGIC_T7) += pinctrl-amlogic-t7.o
> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> new file mode 100644
> index 000000000000..edc5f2ba2c8a
> --- /dev/null
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -0,0 +1,1324 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Pin controller and GPIO driver for Amlogic A4 SoC.
> + *
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + *         Huqiang Qin <huqiang.qin@amlogic.com>
> + */
> +
> +#include "pinctrl-meson.h"
> +#include "pinctrl-meson-axg-pmx.h"
> +#include <dt-bindings/gpio/amlogic-gpio.h>
> +
> +/* Standard port */
> +
> +#define GPIOE_0				0
> +#define GPIOE_1				1
> +
> +#define GPIOD_0				2
> +#define GPIOD_1				3
> +#define GPIOD_2				4
> +#define GPIOD_3				5
> +#define GPIOD_4				6
> +#define GPIOD_5				7
> +#define GPIOD_6				8
> +#define GPIOD_7				9
> +#define GPIOD_8				10
> +#define GPIOD_9				11
> +#define GPIOD_10			12
> +#define GPIOD_11			13
> +#define GPIOD_12			14
> +#define GPIOD_13			15
> +#define GPIOD_14			16
> +#define GPIOD_15			17

The conversion from bank+index to a single index space seems less than 
ideal, and looks like a work-around to fit into the existing driver from 
a brief look at it.

If there's not really banks of GPIOs here, then DT shouldn't have them 
either. The question is does anything need to know the bank number 
and/or index? If it's only for human readability (and matching to 
datasheet), then just something like this can be done:

#define GPIOD(n) (2 + (n))

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
