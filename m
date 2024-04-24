Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03DAC4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 20:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePMgSR+IW9zomYz4abaBXlPOQsreSO4/CDrAYBlxp7A=; b=I8H9rkaAqcD9g4
	g9Y/UIAWCKtwh/3KbTuVGMZJG2udobGSEhNOpkKhBfRHpH9HdE4ZiWGbNnQsdpE8ZPYCTPBPBbx7m
	NlBDMrAK6YuoMnyCtQjqpywEZ3CrmasDV/D63NoQJH0bMJr0FfnQ4e0tZHeCoJRRmYgZBhXlDYGEg
	met+0YjnDj5nj/rsvWVBiRks/W+eHm8amYRw8K7z2Wjd3cmP/ziH6k160JBod6Ub3mhey1s9HSQmY
	LFtxyUq6FlZLuQDYE8+z3uwCpNHP4WWiub89vYaHsClN9Fc8GLYf5OjPU80sx4gY/iVVMffVvJuja
	Bd4pDyQusGqXWCYRFSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzinq-00000005mpF-3jUm;
	Wed, 24 Apr 2024 20:01:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzinn-00000005mml-1OOd;
	Wed, 24 Apr 2024 20:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F8116197C;
	Wed, 24 Apr 2024 20:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23667C2BD10;
	Wed, 24 Apr 2024 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713988870;
	bh=pZJnhrqBEUNU8L74CRDodYNAWKN1FAjVYMm8hIp5g1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9U15ByIAFQBGd9skRQXTyRyW8pnoJsycZmxyPQe7bt/nQeOsflcdAiEPhRpZDlXd
	 NtAydSRRHY8MVh7kbicsB+D3eDn0yNiHvRhOdw187BP3/xgCZ3p5ZjCUHHyxjWkPGk
	 zoFr2Yk1jPynaSWrG7jBXSsfwnce/TggQhRrGbyPKXhQlTSGieK2Liyi+dWaRLFTKr
	 RAWT63JHPJ0340sl5u5sGkcXHaoy7QKRMZIpWm2oGp2erKM3q15g2bkazjDMSbpp+W
	 DTBH6DsPDHLXpEs57VIKXzX/EVdk6mYn09uvrZlbW0Os3QTzRdhfTC4PX4ciybMn19
	 ENt4PklHwh9cg==
Date: Wed, 24 Apr 2024 15:01:07 -0500
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Chuan Liu <chuan.liu@amlogic.com>
Subject: Re: [PATCH v7 5/5] clk: meson: c3: add c3 clock peripherals
 controller driver
Message-ID: <20240424200107.GA372179-robh@kernel.org>
References: <20240424050928.1997820-1-xianwei.zhao@amlogic.com>
 <20240424050928.1997820-6-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424050928.1997820-6-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_130111_540930_02827220 
X-CRM114-Status: GOOD (  20.39  )
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

On Wed, Apr 24, 2024 at 01:09:28PM +0800, Xianwei Zhao wrote:
> Add the C3 peripherals clock controller driver in the C3 SoC family.
> 
> Co-developed-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/clk/meson/Kconfig          |   15 +
>  drivers/clk/meson/Makefile         |    1 +
>  drivers/clk/meson/c3-peripherals.c | 2366 ++++++++++++++++++++++++++++
>  3 files changed, 2382 insertions(+)
>  create mode 100644 drivers/clk/meson/c3-peripherals.c
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 9f975a980581..0b85d584910e 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -142,6 +142,21 @@ config COMMON_CLK_C3_PLL
>  	  AKA C3. Say Y if you want the board to work, because PLLs are the parent
>  	  of most peripherals.
>  
> +config COMMON_CLK_C3_PERIPHERALS
> +	tristate "Amlogic C3 peripherals clock controller"
> +	depends on ARM64
> +	depends on ARM_SCMI_PROTOCOL

I may have missed it, but I don't see the dependency on SCMI in this 
driver.

> +	depends on COMMON_CLK_SCMI
> +	depends on COMMON_CLK_C3_PLL
> +	default y
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_DUALDIV
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	help
> +	  Support for the Peripherals clock controller on Amlogic C302X and
> +	  C308L devices, AKA C3. Say Y if you want the peripherals clock to
> +	  work.
> +
>  config COMMON_CLK_G12A
>  	tristate "G12 and SM1 SoC clock controllers support"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 4420af628b31..20ad9482c892 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
> +obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
>  obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> new file mode 100644
> index 000000000000..0f834ced0ee9
> --- /dev/null
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -0,0 +1,2366 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Amlogic C3 Peripherals Clock Controller Driver
> + *
> + * Copyright (c) 2023 Amlogic, inc.
> + * Author: Chuan Liu <chuan.liu@amlogic.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/of_device.h>

I don't think you need this header.

> +#include <linux/platform_device.h>
> +#include "clk-regmap.h"
> +#include "clk-dualdiv.h"
> +#include "meson-clkc-utils.h"
> +#include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
