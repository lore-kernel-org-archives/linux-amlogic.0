Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BF5C00140
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXOfamJf708veLXU2YPU21QSQ++oR91l83sPFJECdok=; b=CTAzCH2b/ePw6j
	TOiN87ZN6SJZ8uZWuQI1Hz4Jhe0zX6Fw1R6ASGpTPvR5fdjm1C93uTbu628ERC3xgzfowy95H2A8T
	A2Pz36FiZJipsd20lkOt/F0pPv8LMOpFm3oK2WNm2x+XO5+AVVXCm238sn5zeFy6Cd0J/4pCusJ3g
	iEa8FZgDIanADPJzqi0Vqrpinq3Y2uoETfxClWmCexstzxTFaY95owjazRjbU1jnMP6/baaNk77O6
	JX9+KI31VoyP2rEGqM7crg9qbyjDoMM0uCc/BnuIwcr1l8DBxKloIIMSMqp2jpbPxctJoVik/2cvL
	ino5XS71zZ0Uhg+g6pNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtR8-00DVTs-NI; Fri, 05 Aug 2022 09:16:06 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtR5-00DVQg-1F
	for linux-amlogic@lists.infradead.org; Fri, 05 Aug 2022 09:16:05 +0000
Received: by mail-lf1-x134.google.com with SMTP id t1so2571546lft.8
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Aug 2022 02:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=dyFEWJikncIBUJyKkX0jolBEiIcSUSNj0WDThZ5+3Bg=;
        b=JcLF69Mv0lfG2mXQv9/1bOz44C/ZSw2PCUbahxeYH5l3+7CmI6YZnCHLxX6jhOBlTA
         BHf32eHA4uCAslWOeFV0FbEFBTjtXS5k4BXfbP1JC2NTQ/aoOU8zVjh2UaVLuVMFvUZV
         HixQrwLnQt21NM6GdrqggGp91cpM5XbX5qd2iNSmSDSVKX0/jh+w8/Lq8iVncfSdUjmT
         jCc/JmEdECHY+vJenOW3sue5jGgwk2AUtJrAanl+nM2ZeSIbdHvarj0W/hTurLyOyEQU
         x9Gsa2Q6Pv/HdUUHGWMwFu/SVDMZFnCaZJSLB8rdN51b/65p9x9t6AiBjhBIj+wg5WR6
         vQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dyFEWJikncIBUJyKkX0jolBEiIcSUSNj0WDThZ5+3Bg=;
        b=TFY7z5j0W8G+zlZQYZN/ZjAQEla/ckiZlrN+CARNffOKKmGYMiSvxlcUF5sQdJvhr0
         PPF3Y0GE9wuS7avnJPTkYpwq8UpYt++ueq3N5et1IXNUcxRTeG0ueI+25xeXPsbqcZTJ
         8I+Q7TbqZxgIGyBFrKhwnChw9dSv7jCCNdG+mlvKC4FS04dszU5+XeRkm9/r3Ob/XIJV
         VzWghV+p9blED3CzasVSZpqlH5RhRFtZe+plAz18bwEgFkatzSzzz/tmxM0bA22PlEwQ
         kWQ11dGvfm4pn3y296F+G4O62Ifw6E943yZ58tqMAeIxEhx6Z7D2n+1TEoE5TlOXkAei
         xGZg==
X-Gm-Message-State: ACgBeo1GPaN8vLaIX9qbC4OZOjt5fZ8mV23i2CHEeLRFKMxi7Qht/LiL
	rSageFBblA5mYyqOWLFRAHUrLw==
X-Google-Smtp-Source: AA6agR45ewObgP7I+JAAZ3xFIRQLIe9iM1Wkc+5mixLQG57foQ03YMiFezSy/cXa4p0N2TrOZfffuw==
X-Received: by 2002:a05:6512:e8c:b0:48a:f47a:63e3 with SMTP id bi12-20020a0565120e8c00b0048af47a63e3mr2200808lfb.325.1659690961562;
        Fri, 05 Aug 2022 02:16:01 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id bi24-20020a05651c231800b0025ebaef9570sm15933ljb.40.2022.08.05.02.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:15:49 -0700 (PDT)
Message-ID: <562043e1-83d4-d4ab-2c18-20b770b02955@linaro.org>
Date: Fri, 5 Aug 2022 11:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 4/6] dt-bindings: clk: meson: add S4 SoC peripheral
 clock controller bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-5-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805085716.5635-5-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_021603_107788_75F4B5CA 
X-CRM114-Status: GOOD (  16.32  )
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

On 05/08/2022 10:57, Yu Tu wrote:
> Add peripheral clock controller compatible and dt-bindings header for
> the of the S4 SoC.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,s4-clkc.yaml       |  92 ++++++++++++
>  include/dt-bindings/clock/amlogic,s4-clkc.h   | 131 ++++++++++++++++++
>  2 files changed, 223 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
> new file mode 100644
> index 000000000000..2471276afda9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml

Filename should be based on compatible, so amlogic,s4-periphs-clkc.yaml

> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,s4-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson S serials Peripheral Clock Controller Device Tree Bindings

s/Device Tree Bindings//

> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Yu Tu <yu.hu@amlogic.com>
> +
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-periphs-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: input fixed pll div2
> +      - description: input fixed pll div2p5
> +      - description: input fixed pll div3
> +      - description: input fixed pll div4
> +      - description: input fixed pll div5
> +      - description: input fixed pll div7
> +      - description: input hifi pll
> +      - description: input gp0 pll
> +      - description: input mpll0
> +      - description: input mpll1
> +      - description: input mpll2
> +      - description: input mpll3
> +      - description: input hdmi pll
> +      - description: input oscillator (usually at 24MHz)
> +
> +  clock-names:
> +    items:
> +      - const: fclk_div2
> +      - const: fclk_div2p5
> +      - const: fclk_div3
> +      - const: fclk_div4
> +      - const: fclk_div5
> +      - const: fclk_div7
> +      - const: hifi_pll
> +      - const: gp0_pll
> +      - const: mpll0
> +      - const: mpll1
> +      - const: mpll2
> +      - const: mpll3
> +      - const: hdmi_pll
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
> +    clkc_periphs: periphs-clock-controller@fe000000 {
> +      compatible = "amlogic,s4-periphs-clkc";
> +      reg = <0xfe000000 0x49c>;
> +      clocks = <&clkc_pll 3>,
> +              <&clkc_pll 13>,
> +              <&clkc_pll 5>,
> +              <&clkc_pll 7>,
> +              <&clkc_pll 9>,
> +              <&clkc_pll 11>,
> +              <&clkc_pll 17>,
> +              <&clkc_pll 15>,
> +              <&clkc_pll 25>,
> +              <&clkc_pll 27>,
> +              <&clkc_pll 29>,
> +              <&clkc_pll 31>,
> +              <&clkc_pll 20>,
> +              <&xtal>;
> +      clock-names = "fclk_div2", "fclk_div2p5", "fclk_div3", "fclk_div4",
> +                    "fclk_div5", "fclk_div7", "hifi_pll", "gp0_pll",
> +                    "mpll0", "mpll1", "mpll2", "mpll3", "hdmi_pll", "xtal";
> +      #clock-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/amlogic,s4-clkc.h b/include/dt-bindings/clock/amlogic,s4-clkc.h
> new file mode 100644
> index 000000000000..d203b9bbf29e
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,s4-clkc.h

Probably this should be then amlogic,s4-periphs-clkc.h

> @@ -0,0 +1,131 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
> + * Author: Yu Tu <yu.tu@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_CLKC_H
> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_CLKC_H

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
