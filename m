Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29439CFC268
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 06:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PosnLRYRcPXMYUMIOfYEx5IA5KdrnRQFwB3a0/p6XW4=; b=pY094YzIhXfQhS
	9FXAG8nmK6fIYZ5Xomb7sUx683F/MJCEoVGiWr2tawMdCgp3qH+MB7gXvx6/6J/5uyiYKB8X34EuN
	/v9roXSa/CDgagilwUi8VQIsZ3EZASda+lLEGks+bAQuPKVORKSfoQYkNgqAzZDV0S/TK4Nl9OqCp
	bZR7u9RU1NSSXg8Jz5/bWoNVUVRL+q1r6thldrv5A1z7XBaabuoup9hAvuaxqXwMBqI/P6jVzSC6v
	yeoklBUThbcrtMhhSOW8fxTWznkJvxgUTgtGU7F02FI6PeRQ22mB/HsgByZDcVdW6UYHWpWP3qMDS
	Osm8vWxzWUX1H1g81auQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ae1-00000007ACn-2A4S;
	Tue, 15 Oct 2024 06:02:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0act-00000007A21-1nuU;
	Tue, 15 Oct 2024 06:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 424405C5C37;
	Tue, 15 Oct 2024 06:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA9CC4CEC7;
	Tue, 15 Oct 2024 06:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728972106;
	bh=hjLVAsAxmaKiJMaFRVR95Sfr8mL4+9Ch2JcbTvocQLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8qwitj+XNX7VmqfwUPzOqQ3tX62tj/bJMrhXxBiUBNPV7km+tKe3BmC/jGpu8aeO
	 WY7Itdqyv3omV3ZJF4opKEmTc4TgT/isawrqO326Bw6GmW/FwKikym4GrYbm8J770O
	 ZluFfdA3Je2ReIeCf9X7kc2PuAb2cPjQPuqmNhzGo0w5My0Alx/U04jrMBc4VF7KYf
	 HVc7RCA7p3w2zV97n6tFG+i1+OYeKgm/IZsukdvLR6yFecXroGehmcCqWvcaDJx68u
	 MI2hqVkRRaBKzPIwjlBsh0sQanM8jwCf9GMIiMbKYMP3OwhZxBDs7TjfuwNIMLTIKV
	 XmT8ecabPa08g==
Date: Tue, 15 Oct 2024 08:01:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
Message-ID: <aju3dgugbmj52i74j7csyuwejczsvk4sxtsdzuq62jutq7jxbe@wbc7fveloxv2>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
 <20241014-a4_pinctrl-v2-2-3e74a65c285e@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014-a4_pinctrl-v2-2-3e74a65c285e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_230147_587615_A2CC13AF 
X-CRM114-Status: GOOD (  18.33  )
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

On Mon, Oct 14, 2024 at 05:05:52PM +0800, Xianwei Zhao wrote:
> Add a new pinctrl driver for Amlogic A4 SoCs which share
> the same register layout as the previous Amlogic S4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pinctrl/meson/Kconfig              |    6 +
>  drivers/pinctrl/meson/Makefile             |    1 +
>  drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1176 ++++++++++++++++++++++++++++
>  3 files changed, 1183 insertions(+)
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
> index 000000000000..dee1ae43edb5
> --- /dev/null
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> @@ -0,0 +1,1176 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Pin controller and GPIO driver for Amlogic A4 SoC.
> + *
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + *         Huqiang Qin <huqiang.qin@amlogic.com>
> + */
> +
> +#include <dt-bindings/gpio/amlogic-a4-gpio.h>

I do not see any usage of it.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
