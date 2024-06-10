Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E206BC27C55
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtCrCOn3JMmVjni8JJWcpCHMP/A64RqN1Hiq49RXYss=; b=FH7qYstAmecZ5w
	InyhgVjF+rv/yvSYFHSgBtgoFnXM3VOHHEEj4rMTDmLEfon2g0k8U8ew4tMIpusSf0Eu1L72lMzN/
	cjRc0mFz1jOqObjxRxoac8rrqrEYmuShGM19pqarvD6QFb0Cemvi+ZYLFoxNsZaeZBEMNYYBMmRVY
	4q/CTqclyR/B9sPFJhq0fuPDpM+ZvU6uurZBZcR9OWEPOGz+lUzwWduqIG7SMI1iR/I57wpp29Nko
	mk4RfoNixLcjkEh9BXXbRnb8BRtp6Yz3FQiMrtOBHb2GkmRXb7sOi2sbugbf1cDx2duITSegLxGUT
	p+1H8vnz1LW17NQXH2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbsv-00000004Ysf-386e;
	Mon, 10 Jun 2024 10:04:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGbsq-00000004Yr4-2CoQ
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Jun 2024 10:04:14 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-35f1cb7a40fso1203726f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Jun 2024 03:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718013850; x=1718618650; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hgW8B70Q8zX7acFGE+7FKzyC1rI3PYnZTOkuVMqMUeM=;
        b=gpetcYuBGf4vvRCVHvBuD+yLtF+U6RALu5bf77Uxl5nl0U1WhPUtMcuKm61s5Mk5p/
         ZVWQXwme60i7YvyJtvfb8NvzTZIlLfpS5g3NiTt8rFGCad1Ql/+e7ElHB6RMBZfQ4/AQ
         QbqzZ/4BatzCVMUEMio8egWOSq9gy0G5fsIg2Ow0pU3GvW3EEX2RH67xZgf4BkxSnxny
         6OFP2meoWW79cMoCVwQFThTDnxRzb8Ud73PyZLEK/ynfpIE6PxHxw0YzylGc0gRF93nD
         2MWIQ4Dn6Jkow6txlrf12T9iZdNynoVDPCQUOE15xVESN1phv/lrnDr+H1NM/IkTINGv
         Lycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718013850; x=1718618650;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hgW8B70Q8zX7acFGE+7FKzyC1rI3PYnZTOkuVMqMUeM=;
        b=hmaFXjiZSJz/qnN6XVAZCmYs/SOIq9lQZloSwLxRS9lP3XdyTXo45tNHSqscy395Sl
         dxvNUt+6mNMW/MPqymNE68uuBlDs6XKM9vqUGY+1Nyl2owUF2/tciwGsJMyt4HkKpxDs
         CP0alLV1ThTZ45mHa1TPAH+yOM5DzuELmN53kxXsDJkL+SxtFT7aYD5dnYU7DzXQG9jy
         i+HnS01wBrGNSPcXXW4iCgT6u4rBqjTB3GCEdcnn+Mcb3lI7J9GMWwKRXY6L0L072u4i
         WpQGKUtzgc83t5uZE4SavPKn33+VHtEobQ/YriY5NIfR/yR23Aek2FN00crBVilN+V2p
         IXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5QOqKMLzZqLRn8gdjbx2WB4y07W5Efw6BLZi5F0DAFvILVwgHnxiDCp5JW41AkYFxBAmjpr6WOFZ3ixIvsKBPRTh8KfUZlSc39Pj9SxxJlJM=
X-Gm-Message-State: AOJu0Yy8MWsrZzvLgx54E8eFceYL3oYvETOe+RSgz+S+idH8ulZWC7LM
	sTGopVXiGRQNmEnlfhFr/7diQKYaSdRWpDU/f0IgD/jSAvUYwH1JAjKZtVd7BhM=
X-Google-Smtp-Source: AGHT+IGSgkd3LqLIyxqDoIX0DW/WYOv65XykZ7jmOpZ9kbZonCQsXNHJT+NKtkJEDBC3j4DrawCjIw==
X-Received: by 2002:adf:f6c4:0:b0:35f:16a4:6b99 with SMTP id ffacd0b85a97d-35f16a46c11mr2450784f8f.4.1718013850018;
        Mon, 10 Jun 2024 03:04:10 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:afd3:66ee:5486:4249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0e49e898sm6844132f8f.22.2024.06.10.03.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 03:04:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: <neil.armstrong@linaro.org>,  <mturquette@baylibre.com>,
  <sboyd@kernel.org>,  <robh+dt@kernel.org>,
  <krzysztof.kozlowski+dt@linaro.org>,  <khilman@baylibre.com>,
  <martin.blumenstingl@googlemail.com>,  <jian.hu@amlogic.com>,
  <kernel@sberdevices.ru>,  <rockosov@gmail.com>,
  <linux-amlogic@lists.infradead.org>,  <linux-clk@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-arm-kernel@lists.infradead.org>,  Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: clock: meson: add A1 CPU clock
 controller bindings
In-Reply-To: <20240515185103.20256-7-ddrokosov@salutedevices.com> (Dmitry
	Rokosov's message of "Wed, 15 May 2024 21:47:29 +0300")
References: <20240515185103.20256-1-ddrokosov@salutedevices.com>
	<20240515185103.20256-7-ddrokosov@salutedevices.com>
Date: Mon, 10 Jun 2024 12:04:09 +0200
Message-ID: <1jtti1p10m.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_030412_926061_CA8F9967 
X-CRM114-Status: GOOD (  19.40  )
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

On Wed 15 May 2024 at 21:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> Add the documentation and dt bindings for Amlogic A1 CPU clock
> controller.
>
> This controller consists of the general 'cpu_clk' and two main parents:
> 'cpu fixed clock' and 'syspll'. The 'cpu fixed clock' is an internal
> fixed clock, while the 'syspll' serves as an external input from the A1
> PLL clock controller.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/clock/amlogic,a1-cpu-clkc.yaml   | 64 +++++++++++++++++++
>  .../dt-bindings/clock/amlogic,a1-cpu-clkc.h   | 19 ++++++
>  2 files changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
>
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
> new file mode 100644
> index 000000000000..f4958b315ed4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-cpu-clkc.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a1-cpu-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic A1 CPU Clock Control Unit
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Dmitry Rokosov <ddrokosov@salutedevices.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a1-cpu-clkc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: input fixed pll div2
> +      - description: input fixed pll div3
> +      - description: input sys pll
> +      - description: input oscillator (usually at 24MHz)

According to the documentation, fdiv5 is also an input of the CPU clock
tree.

That is typically the kind of things we'd prefer to get right from the
beginning to avoid modifying the bindings later.

> +
> +  clock-names:
> +    items:
> +      - const: fclk_div2
> +      - const: fclk_div3
> +      - const: sys_pll
> +      - const: xtal
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@fd000000 {
> +            compatible = "amlogic,a1-cpu-clkc";
> +            reg = <0 0xfd000080 0 0x8>;

If reg is <0 0xfd000080 0 0x8> then node name should be clock-controller@fd000080

> +            #clock-cells = <1>;
> +            clocks = <&clkc_pll CLKID_FCLK_DIV2>,
> +                     <&clkc_pll CLKID_FCLK_DIV3>,
> +                     <&clkc_pll CLKID_SYS_PLL>,
> +                     <&xtal>;
> +            clock-names = "fclk_div2", "fclk_div3", "sys_pll", "xtal";
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/amlogic,a1-cpu-clkc.h b/include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
> new file mode 100644
> index 000000000000..1d321c6eddb7
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,a1-cpu-clkc.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
> + * Author: Dmitry Rokosov <ddrokosov@salutedevices.com>
> + */
> +
> +#ifndef __A1_CPU_CLKC_H
> +#define __A1_CPU_CLKC_H
> +
> +#define CLKID_CPU_FSOURCE_SEL0	0
> +#define CLKID_CPU_FSOURCE_DIV0	1
> +#define CLKID_CPU_FSEL0		2
> +#define CLKID_CPU_FSOURCE_SEL1	3
> +#define CLKID_CPU_FSOURCE_DIV1	4
> +#define CLKID_CPU_FSEL1		5
> +#define CLKID_CPU_FCLK		6
> +#define CLKID_CPU_CLK		7
> +
> +#endif /* __A1_CPU_CLKC_H */

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
