Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFAAC4321E
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=op22pZU04Zc0wmUMVZ/Xj7BZc2FoNe3DoMQpvxJ+F5I=; b=s2YNYu/ItP+7fp
	pwKTzFG7yE6peFoPPctiHX3AS8Ls1qEYW7GjxPgh6+gq4Nx1AFCmhK0rRuz+iU52V8TmUv11DBGQZ
	Em4wtpvMSq6jMTJUxrU1lRsCVZS81uUyrNeTtl1WlarEHjB3hYQ5sL/uaj3uro30ufkCW1gWblZt9
	RAZQpbv6JM2UOdqXakEQKdr+vYn/syNhC+BR1GWhY48x6pAI26E6xsWrdWBqtpfD1UHa6oMaPyESJ
	6BsmQHnMyNHKSO/7DBMXsBCifTsNzicztEs2/+V6eREQKjY1Lw1Z/LAS0MbFq2XkKxti0qqsoF7tv
	WQSZlEPCVfmUUKjLFr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13yD-00FtTA-Tr; Fri, 02 Dec 2022 11:12:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13yA-00FtR4-Tc
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 11:12:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id m14so7280765wrh.7
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 03:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=DRk7iSUgBPOPq0AnYz+tjk1PeV5gzHd+xhAJ8/gUP6I=;
        b=TsWacH5QPgrxqfhbR8F1bFy3sSwGlGVZ5GlEd3pYRy30X/fuS0w9YEAUW/xuD9OLyZ
         n83q3x/1pwNijGE3VkYnVWDtTHUC3rZlZmil1h5bDE2ARIREovGTJzOcEXV8IHn7HJ+G
         PAGVU67QBv91GrI5QnsMWlP9j3q1ZixbZrfki0WCEi6ybl7pQXzcXf+bJtZBlVRsRXLU
         wwvXHWROSczmvMgx6Tn1fKWvELlPfP2asuKieruoqUgfszrPEunPCrfrMtDlYl8Anydy
         hLjiWPCjve6u7bCvAcdKZqkbvcpMlE8EqBlDSCuxDX1VgDCsll0I3XjI0ep3cclT5F7/
         6lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRk7iSUgBPOPq0AnYz+tjk1PeV5gzHd+xhAJ8/gUP6I=;
        b=w62d7nbfQGvBfh3olae4TmMsm6QyYLwUgNnTCC2F0l6iMd4STNnWmclfQqVCLaVdMT
         mCMXberYL6Rxz1YMmhnJ5FhpHw7FGE5eK6ITJMK2y+MVcO2Ng4SPDGs9CRbO2yz1JIkq
         9I+AUKM0JAO0GV2WtMZienzNRan5SQU6L+DIKoxjSXTzsBObD1LinEE8DZYY+m5fr3rW
         LvSBJU1vLIFLHAlaPjSNyJv5VLOYH1WJmJoh0sZ2iLJEPruUz7lri3aiK5S3ZQ12K2SB
         FyPqhAXt39oR+00001/ApVbPjhj+LudbN7AL6aUPPqviMJhlcMebDBAV0o+KxzQ6dtbt
         JwWQ==
X-Gm-Message-State: ANoB5pmfgiw+samKAN5YLyivXOkmYoa5t+BMJWLd/dMYnLMgMiA1DCHO
	2I2SsUfeoKyCCm8szuNNA6xJcQ==
X-Google-Smtp-Source: AA0mqf6CJ0Nq4WNROawcXMo7bkkqOnn9O6L0g9XsexL0OqiIeoS3ax8GhKvs5bLlSV0xilyT/wZc5w==
X-Received: by 2002:adf:d228:0:b0:242:fa5:ce81 with SMTP id k8-20020adfd228000000b002420fa5ce81mr18777470wrh.50.1669979556815;
        Fri, 02 Dec 2022 03:12:36 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003cfd4cf0761sm13012454wmq.1.2022.12.02.03.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 03:12:36 -0800 (PST)
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-2-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 01/11] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Date: Fri, 02 Dec 2022 12:11:53 +0100
In-reply-to: <20221201225703.6507-2-ddrokosov@sberdevices.ru>
Message-ID: <1jbkom83fg.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_031238_979732_E4AD36BB 
X-CRM114-Status: GOOD (  16.55  )
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


On Fri 02 Dec 2022 at 01:56, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> Add the documentation to support Amlogic A1 PLL clock driver,
> and add A1 PLL clock controller bindings.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 52 +++++++++++++++++++
>  include/dt-bindings/clock/a1-pll-clkc.h       | 16 ++++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> new file mode 100644
> index 000000000000..d67250fbeece
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/amlogic,a1-pll-clkc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson A/C serials PLL Clock Control Unit Device Tree Bindings
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@jian.hu.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a1-pll-clkc
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +     - description: input xtal_fixpll
> +     - description: input xtal_hifipll
> +
> +  clock-names:
> +    items:
> +      - const: xtal_fixpll
> +      - const: xtal_hifipll

Do we really need the "xtal_" prefix ?

Seems like the clock is the PLL, not the xtal

> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clkc_pll: pll-clock-controller@7c80 {
> +                compatible = "amlogic,a1-pll-clkc";
> +                reg = <0 0x7c80 0 0x18c>;
> +                #clock-cells = <1>;
> +                clocks = <&clkc_periphs 1>,
> +                         <&clkc_periphs 4>;
> +                clock-names = "xtal_fixpll", "xtal_hifipll";
> +    };
> diff --git a/include/dt-bindings/clock/a1-pll-clkc.h b/include/dt-bindings/clock/a1-pll-clkc.h
> new file mode 100644
> index 000000000000..58eae237e503
> --- /dev/null
> +++ b/include/dt-bindings/clock/a1-pll-clkc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> + */
> +
> +#ifndef __A1_PLL_CLKC_H
> +#define __A1_PLL_CLKC_H
> +
> +#define CLKID_FIXED_PLL				1
> +#define CLKID_FCLK_DIV2				6
> +#define CLKID_FCLK_DIV3				7
> +#define CLKID_FCLK_DIV5				8
> +#define CLKID_FCLK_DIV7				9
> +#define CLKID_HIFI_PLL				10
> +
> +#endif /* __A1_PLL_CLKC_H */


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
