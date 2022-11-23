Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2309C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6EgP7K74ENs0R2D50wibmDGb+m/tQm19jqExMaCPmM=; b=FAD5PMv25Q5q56
	utMbTUM4bfXD9/52uKJpCOLSEY3Lj1q2Dp3W52nHhDFyFnEV7f8DarDq48GPo7Q7WWBOR23VVgmCF
	LZU+KH9kxd5AHPjEcUXzZfNzGz+UO1KogJ/tPHxgzF2Fdad2wXk+lmVfNpzkFNdqlQ2SLIl8GCKZu
	1wyDgeOs7gRiMePS+jyt6Fmc+/RrWFyk8aRq69LUd+jiEPs/0hh3PGLLY/VaTJ0X5OG2RXEXofb6C
	5ynZIKqIl9oUJjnA7K71lephcQlKiBdWeTESonbl6VefZ1iOvbTu9tzigwr8HKtHGbJvLMemXUdKQ
	F8XMINekkt9L8SCdWW6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmgT-00GFmv-Fs; Wed, 23 Nov 2022 10:08:49 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmgE-00GFey-D0
	for linux-amlogic@lists.infradead.org; Wed, 23 Nov 2022 10:08:36 +0000
Received: by mail-lf1-x133.google.com with SMTP id g7so27475183lfv.5
        for <linux-amlogic@lists.infradead.org>; Wed, 23 Nov 2022 02:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/6KnfI+9/uy7ITylHecTvTbunNR+ZrgdbZvYW8L95tE=;
        b=Z3GYxeYtlrpUJfiFGwuiU+qI838C6YNMSXBcHWKBD3OeHCuCpAlyNpJ8dlXJnsreT2
         ZHoxcAjO1+dtsBH+otG8+/Eio4ekhaqXw5Pf86DXPzHPYVI9FqurhcQ1tFCeKdeVHMeq
         HXZY1PF/BRopuElmeMKJ9v4BgMDgc7YOw3H/ofTFPFA9uadwEIdommTGe3+jGWihL9H6
         TSRxyjHtgKYP1s8pNCrOLghvCh9R8k+MlrpX/HlNjPaspZBPXSG3oYzAGvkJ/tbUdjdK
         DviI9Rv/n0Mik+Af52qds+pdsGXkSOY4Hp2Abdhx7PiTfKrygUxb6coVInzQhVxBrBKz
         J6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/6KnfI+9/uy7ITylHecTvTbunNR+ZrgdbZvYW8L95tE=;
        b=ED39RV0b43tZSzPDa+6GKkX/rxZYr2OTrt++IR0Ee+oZa0+VbbEY5pzZGBFK2EjBfT
         n4nlwO9kcpReLoY7K0oju7pD5Gp6Ylimk5nje/Oig6z13KBhFGZi/rDXUefWhNAg8YPV
         YQPQZ1Q0vi7+Zd607SCff2z0kZWt2RLWyBgV9llzaQ77gOmZfeC1KFKp4w52fweA6DMm
         fAgBoPnLcX/05tF9Y6D6a2yNjfuV7xxDApffsrRBEe/5g1Le07puiRUTh0AWBy0rRoqq
         SdSsSRV9C1zqvOUrypkeNG4wwM7zOlwIcAnsXburxLwJYbUw/gciW+Cio5jDMSVGQYiY
         KhIQ==
X-Gm-Message-State: ANoB5plYCLPfgpwNV+m9D+pwzJaz1MIABmFtC9rTpsc/DU//uJjentGs
	qceMTROorWMNXL979ZaCYJm2DQ==
X-Google-Smtp-Source: AA0mqf7ledULYqnBZnfQi9FuTJ2ZzfaNniMGFoQ0mm+yVXMomPygKM0YjBxAcGyJgZZx2qeB1bwHQw==
X-Received: by 2002:ac2:58d9:0:b0:4b3:ccea:9b2e with SMTP id u25-20020ac258d9000000b004b3ccea9b2emr10307267lfo.379.1669198110899;
        Wed, 23 Nov 2022 02:08:30 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d18-20020a2e8912000000b002770eafaafbsm2199487lji.99.2022.11.23.02.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 02:08:30 -0800 (PST)
Message-ID: <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
Date: Wed, 23 Nov 2022 11:08:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123021346.18136-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_020834_484283_D8B5A283 
X-CRM114-Status: GOOD (  15.96  )
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

On 23/11/2022 03:13, Yu Tu wrote:
> Add the S4 PLL clock controller found and bindings in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   |  51 +

This is v5 and still bindings are here? Bindings are always separate
patches. Use subject prefixes matching the subsystem (git log --oneline
-- ...).

And this was split, wasn't it? What happened here?!?


>  MAINTAINERS                                   |   1 +
>  drivers/clk/meson/Kconfig                     |  13 +
>  drivers/clk/meson/Makefile                    |   1 +
>  drivers/clk/meson/s4-pll.c                    | 875 ++++++++++++++++++
>  drivers/clk/meson/s4-pll.h                    |  88 ++
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |  30 +
>  7 files changed, 1059 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 drivers/clk/meson/s4-pll.c
>  create mode 100644 drivers/clk/meson/s4-pll.h
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> new file mode 100644
> index 000000000000..fd517e8ef14f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson S serials PLL Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Yu Tu <yu.hu@amlogic.com>
> +
One blank line.

> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-pll-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xtal
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkc_pll: clock-controller@fe008000 {
> +      compatible = "amlogic,s4-pll-clkc";
> +      reg = <0xfe008000 0x1e8>;
> +      clocks = <&xtal>;
> +      clock-names = "xtal";
> +      #clock-cells = <1>;
> +    };


> +#endif /* __MESON_S4_PLL_H__ */
> diff --git a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> new file mode 100644
> index 000000000000..345f87023886
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h

This belongs to bindings patch, not driver.

> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + * Author: Yu Tu <yu.tu@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
> +
> +/*
> + * CLKID index values
> + */
> +
> +#define CLKID_FIXED_PLL			1
> +#define CLKID_FCLK_DIV2			3

Indexes start from 0 and are incremented by 1. Not by 2.

NAK.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
