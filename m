Return-Path: <SRS0=Ohoh=3C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F60C3F68F
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 21:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CAB420CC7
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 21:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XT5q0lJJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CAB420CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0nfLoft/VjhIdx7pDF0lzM9+i60pFnWkFm1PG9rpglk=; b=XT5q0lJJvczidm
	qRnxNPi9ig1/KjE3s+dC/GevS2HIsvqhfEhtVz+VFjzFH+CZ2ASFMH/fkLN/w1ZevinzaWV2yMf8h
	dLW4e7Af2nm9bKty8ZyHEYWQFTSGLLFiPOX8uYpKD4v5xoXaQ8zRUbVuTqsi2UHqHQetI/JKA9msJ
	Z203wT2yZruQWWGvb6qV9DgSzq9zixKJ2sDrEuZRsP2nrjMX0GOWr+CUgwaS00u1NxasGNxnmn2C4
	gtwUq4z4DMSt4ZiwQOxi3Pd1G5a9JyVH1PiEb+P+q434f4HYShExK82C4NETAwvzrX8wZV1PhXLXd
	+aNcSCKx5gSXLDvt7XCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir6yg-0001hr-MF; Mon, 13 Jan 2020 21:10:26 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir6yc-0001gU-Uv
 for linux-amlogic@lists.infradead.org; Mon, 13 Jan 2020 21:10:24 +0000
Received: by mail-ot1-f65.google.com with SMTP id w21so10363758otj.7
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jan 2020 13:10:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MBFiDoGwJ4OcLk5EAnsqRbkOjyupomEYDWpcUs8IlxQ=;
 b=dRe+kcypwr2NMCHcJx1fyazyWBWSJiPTF9V8AHExM3wHdmpl+MvxkndA/YfbPH8ndQ
 n4ox/jWJe4sU4s2kudbYoCYOU67MaqeGA5p4voFDneDOA01NWK3BZpat+duVW3rdcWNd
 jyFHNhCDHlRhhOJ2d7Bt2h6ouVR1TAbCv+XMDw6pJYt3pUyi6bVUgk2ATG+A0uniwQJY
 50fr2eHuK0OxzGXRZaCsUT/tJW1k87CtUKGm6/ubIEoukSkjkdLbRoFUokZ1VJb/zer3
 rB6+0Q7qJqPPYCVokTmedZEhUB+qtXqotmY8l0AagB5mcaRHGvyk49aFXrBsNrbuSttY
 7hFw==
X-Gm-Message-State: APjAAAWCSv8nk2jDdKlO9q3rm5blaqqMtaoJhngI4R3E41pEUVnFsx8y
 +Z5VhXTB/we/++OaE36UyrcYMtw=
X-Google-Smtp-Source: APXvYqwZb0B5CwSUbe25/fAQCy/1VmPoMHYyElKGGojRIW1dTZEmg6YyFvjk3mdqCjJVjldi0Kgwfg==
X-Received: by 2002:a9d:22:: with SMTP id 31mr13584509ota.173.1578949821641;
 Mon, 13 Jan 2020 13:10:21 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s145sm3896265oie.44.2020.01.13.13.10.20
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 13:10:20 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220d32
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Mon, 13 Jan 2020 15:10:20 -0600
Date: Mon, 13 Jan 2020 15:10:20 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mmc: Document the Amlogic Meson SDHC
 MMC host controller
Message-ID: <20200113211020.GA12476@bogus>
References: <20200112002459.2124850-1-martin.blumenstingl@googlemail.com>
 <20200112002459.2124850-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200112002459.2124850-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_131022_994732_B398B2AC 
X-CRM114-Status: GOOD (  17.14  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 jianxin.pan@amlogic.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Jan 12, 2020 at 01:24:57AM +0100, Martin Blumenstingl wrote:
> This documents the devicetree bindings for the SDHC MMC host controller
> found in Meson6, Meson8, Meson8b and Meson8m2 SoCs. It can use a
> bus-width of 1/4/8-bit and it supports eMMC spec 4.4x/4.5x including
> HS200 mode (up to 100MHz clock). It embeds an internal clock controller
> which outputs four clocks (mod_clk, sd_clk, tx_clk and rx_clk) and is
> fed by four external input clocks (clkin[0-3]). "pclk" is the module
> register clock, it has to be enabled to access the registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   | 83 +++++++++++++++++++
>  .../dt-bindings/clock/meson-mx-sdhc-clkc.h    |  8 ++
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
>  create mode 100644 include/dt-bindings/clock/meson-mx-sdhc-clkc.h

Fails 'make dt_binding_check':

Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.example.dts:17:53: 
warning: extra tokens at end of #include directive
 #include <dt-bindings/clock/meson-mx-sdhc-clkc.yaml>;
                                                     ^
Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.example.dts:17:10: 
fatal error: dt-bindings/clock/meson-mx-sdhc-clkc.yaml: No such file or directory
 #include <dt-bindings/clock/meson-mx-sdhc-clkc.yaml>;
          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> 
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
> new file mode 100644
> index 000000000000..74632692ce26
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/amlogic,meson-mx-sdhc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson SDHC controller Device Tree Bindings
> +
> +allOf:
> +  - $ref: "mmc-controller.yaml"
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +description: |
> +  The SDHC MMC host controller on Amlogic SoCs provides an eMMC and MMC
> +  card interface with 1/4/8-bit bus width.
> +  It supports eMMC spec 4.4x/4.5x including HS200 (up to 100MHz clock).
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - amlogic,meson8-sdhc
> +        - amlogic,meson8b-sdhc
> +        - amlogic,meson8m2-sdhc
> +      - const: amlogic,meson-mx-sdhc
> +
> +  reg:
> +    minItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  clocks:
> +    minItems: 9
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: mod_clk
> +      - const: sd_clk
> +      - const: rx_clk
> +      - const: tx_clk
> +      - const: clkin0
> +      - const: clkin1
> +      - const: clkin2
> +      - const: clkin3

Kind of odd to put the output clocks in the middle of the list.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/meson-mx-sdhc-clkc.yaml>;
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    sdhc: mmc@8e00 {
> +      compatible = "amlogic,meson8-sdhc", "amlogic,meson-mx-sdhc";
> +      reg = <0x8e00 0x42>;
> +      interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
> +      #clock-cells = <1>;
> +      clocks = <&sdhc_pclk>,
> +               <&sdhc SDHC_CLKID_MOD_CLK>,
> +               <&sdhc SDHC_CLKID_SD_CLK>,
> +               <&sdhc SDHC_CLKID_TX_CLK>,
> +               <&sdhc SDHC_CLKID_RX_CLK>,
> +               <&xtal>,
> +               <&fclk_div4>,
> +               <&fclk_div3>,
> +               <&fclk_div5>;
> +      clock-names = "pclk", "mod_clk", "sd_clk", "tx_clk", "rx_clk",
> +                    "clkin0", "clkin1", "clkin2", "clkin3";
> +    };
> diff --git a/include/dt-bindings/clock/meson-mx-sdhc-clkc.h b/include/dt-bindings/clock/meson-mx-sdhc-clkc.h
> new file mode 100644
> index 000000000000..ad9f6e4dc426
> --- /dev/null
> +++ b/include/dt-bindings/clock/meson-mx-sdhc-clkc.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#define SDHC_CLKID_SRC_SEL	0
> +#define SDHC_CLKID_DIV		1
> +#define SDHC_CLKID_MOD_CLK	2
> +#define SDHC_CLKID_SD_CLK	3
> +#define SDHC_CLKID_TX_CLK	4
> +#define SDHC_CLKID_RX_CLK	5
> -- 
> 2.24.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
