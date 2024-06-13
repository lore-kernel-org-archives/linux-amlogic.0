Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22870C27C6E
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OH8lEohtKFtNgLU9zouO14ByCof+TMlVwpLmUuV7f5Y=; b=SjBmz1+mJAVrNw
	U2aeOhe2PE/96dOoCcex/tEZSfkR6jN9vas7+q6SA9KfXnzeysB0u1/PJkboDmJQqT1m/+Qa2gyBd
	JmeFijXXLjBmHHCayahAgRFf82ksBoV0CGTn5gLvVv7RZWRwy4oQQdsQFc+PaQx4wZ4AeFX2FPSRa
	zuPrkYSt1k6UXVW4MVRejkLnmj60mKi8ffBNSXTd1pyGh/r4xfx3gohpGoEjRnWMrOHq5ipH0Y5Du
	EIwZP574O3xo5zlAzh7bUxR9dBSIBQIkF35NIkzLCragL4SdOR95d/AC02qWbj3rTnwNWNvwSe15K
	OpKfsryW7Fde/SD5Zitw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnvy-0000000HSwq-1l4r;
	Thu, 13 Jun 2024 17:08:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHnvu-0000000HSwH-34eo;
	Thu, 13 Jun 2024 17:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05B3F61B8C;
	Thu, 13 Jun 2024 17:08:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA55C3277B;
	Thu, 13 Jun 2024 17:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718298497;
	bh=/mtpv7oQiB/HDp/WMox9w7Z6Glgw+lsaHSyHSzXTWnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kji33KUAszF4cmuHylrzAFirU0EPFC5g79J6Z9DPYf+d1UcS5mMwA0fMS7EvkEUiO
	 rRWaNB2iErp6PePjPgvoD+b2VLVc06h1pPT7BIRbPQYeM1DK1NjZAUDt+/rYGP+PN7
	 3gL9u2LbjI6hPjo/Kp5gFQ4JqV5CXSttTaU3iPCzk9x3uTAqMfc4DKppjDA+IF88ho
	 529fdp2nWG0brVsVe2N/wi9CkC3vE0t3wBo9uN06AVakPJ/Jj4Or2welFU3vumKzk6
	 5f4y7uFW/7vXZvonpkdAUH1s1OWcA3AcDdrr0xri0UkAjLrHM0pmCrTFm4X6Wf/JPw
	 +/SllKTYDwMOw==
Date: Thu, 13 Jun 2024 11:08:16 -0600
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
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
Message-ID: <20240613170816.GA2020944-robh@kernel.org>
References: <20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com>
 <20240611-a4_pinctrl-v1-1-dc487b1977b3@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240611-a4_pinctrl-v1-1-dc487b1977b3@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_100818_921499_561FAE5E 
X-CRM114-Status: GOOD (  18.74  )
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

On Tue, Jun 11, 2024 at 01:10:57PM +0800, Xianwei Zhao wrote:
> Add the new compatible name for Amlogic A4 pin controller, and add
> a new dt-binding header file which document the detail pin names.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |  2 +
>  .../dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h    | 21 +++++
>  .../dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h  | 93 ++++++++++++++++++++++
>  3 files changed, 116 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> index d9e0b2c48e84..f5eefa0fab5b 100644
> --- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml
> @@ -15,6 +15,8 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - amlogic,a4-aobus-pinctrl
> +      - amlogic,a4-periphs-pinctrl
>        - amlogic,c3-periphs-pinctrl
>        - amlogic,t7-periphs-pinctrl
>        - amlogic,meson-a1-periphs-pinctrl
> diff --git a/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h b/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h
> new file mode 100644
> index 000000000000..7c7e746baed5
> --- /dev/null
> +++ b/include/dt-bindings/gpio/amlogic,a4-aobus-pinctrl.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_A4_AOBUS_PINCTRL_H
> +#define _DT_BINDINGS_AMLOGIC_A4_AOBUS_PINCTRL_H
> +
> +/* GPIOAO */
> +#define GPIOAO_0			0
> +#define GPIOAO_1			1
> +#define GPIOAO_2			2
> +#define GPIOAO_3			3
> +#define GPIOAO_4			4
> +#define GPIOAO_5			5
> +#define GPIOAO_6			6

I find defines with the value of the define in the name pretty 
pointless.

> +
> +#define GPIO_TEST_N			7
> +
> +#endif
> diff --git a/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
> new file mode 100644
> index 000000000000..dfabca4b4790
> --- /dev/null
> +++ b/include/dt-bindings/gpio/amlogic,a4-periphs-pinctrl.h
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
> +#define _DT_BINDINGS_AMLOGIC_A4_PERIPHS_PINCTRL_H
> +
> +/* GPIOE */
> +#define GPIOE_0				0
> +#define GPIOE_1				1
> +
> +/* GPIOD */
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

I'm not really much of a fan of using defines for GPIOs, but if you do, 
wouldn't be better to split banks and lines up rather than a global 
number space. See ASPEED_GPIO() or tegra header.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
