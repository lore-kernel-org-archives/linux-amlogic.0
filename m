Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D30ACFC267
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Oct 2024 06:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qo+YI5Y0mCRH+5zVHW8PL6iIbkw0j1eLNlsCrmbu4HM=; b=r5ubpnWPXW58Tq
	1eOneCFqTwKXh3TJ6y3tGi/iZ5wi0TdPxjxwIOPOJZht4L+WCQacsCB5pP2zQEDunMpErojJMrucB
	ZSSqfUVxeRHAmmDC0kL/9GIxxMHO9eY8T+nY6dBaWKLWsqNSFQlY0ChcPO17BrcmU/h4OlnXRUJ3Q
	gMlF34h12183Pa5lGz23H8GSClloWAVd9ScNhq7JlrFSyEsT8hJ+g3bq+oPnvfaGFbDT1mcMZeS8n
	KLRkE1JJW8AtYwwI9l5eQ0HHbyHVXFTS1tMJfSFwcTStQ87YBURWHkFsKD9rS5+meviDgL5Zrt3ra
	Er+Kmicp7NHET2+QOW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0abA-000000079mG-10XS;
	Tue, 15 Oct 2024 06:00:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ab5-000000079lI-3wo6;
	Tue, 15 Oct 2024 05:59:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C973BA401EC;
	Tue, 15 Oct 2024 05:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42377C4CEC7;
	Tue, 15 Oct 2024 05:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728971994;
	bh=0Ra8CCMbg3ZRBIPWHy4Ub9PO/HhTwfF7f9lE/56wZQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLR5p9h+4z4+In8S1EerfKLedkQPAGen1+dqrGPyppIFDaCAqM7jVOhUQifwHk/Go
	 X7XVdbrjV2fMdLVXpJNX68E9YHJVlHPuAHbMGMx7lcwEQo7/iPoim0g3fORWY5ziz6
	 5WGqwBYNa5b1lG18pQ+JbqZtvovQWHbzKZYwgOlnONrgONewD4U3kCkORJJqVV87ac
	 A4vilIEX1pW3sB+hN0/BbxpsWiKiQGO7rJR7+DSuODAYvd1JY8nP5oEezmuWLn9apZ
	 jrjSSX7+xzunrYjejByq1qvUPHB1WWiUY0q2gRPEm8RyBuQ+TIcj+sygcyocdDecLr
	 50heymx4iTvuw==
Date: Tue, 15 Oct 2024 07:59:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
Message-ID: <u4afxqc3ludsic4n3hs3r3drg3ftmsbcwfjltic2mb66foo47x@xe57gltl77hq>
References: <20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com>
 <20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_225956_075683_D3C0792F 
X-CRM114-Status: GOOD (  14.54  )
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

On Mon, Oct 14, 2024 at 05:05:51PM +0800, Xianwei Zhao wrote:
> Add the new compatible name for Amlogic A4 pin controller, and add
> a new dt-binding header file which document the detail pin names.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---

...

> +++ b/include/dt-bindings/gpio/amlogic-a4-gpio.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_A4_GPIO_H
> +#define _DT_BINDINGS_AMLOGIC_A4_GPIO_H
> +
> +/* Standard port */
> +#define GPIOB_START	0
> +#define GPIOB_NUM	14
> +
> +#define GPIOD_START	(GPIOB_START + GPIOB_NUM)
> +#define GPIOD_NUM	16
> +
> +#define GPIOE_START	(GPIOD_START + GPIOD_NUM)
> +#define GPIOE_NUM	2
> +
> +#define GPIOT_START	(GPIOE_START + GPIOE_NUM)
> +#define GPIOT_NUM	23
> +
> +#define GPIOX_START	(GPIOT_START + GPIOT_NUM)
> +#define GPIOX_NUM	18
> +
> +#define PERIPHS_PIN_NUM	(GPIOX_START + GPIOX_NUM)
> +
> +/* Aobus port */
> +#define GPIOAO_START	0
> +#define GPIOAO_NUM	7
> +
> +/* It's a special definition, put at the end, just 1 num */
> +#define	GPIO_TEST_N	(GPIOAO_START +  GPIOAO_NUM)
> +#define	AOBUS_PIN_NUM	(GPIO_TEST_N + 1)
> +
> +#define AMLOGIC_GPIO(port, offset)	(port##_START + (offset))

I do not think you implemented previous feedback. None of above are
bindings. Drop.

> +
> +#endif /* _DT_BINDINGS_AMLOGIC_A4_GPIO_H */
> 
> -- 
> 2.37.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
