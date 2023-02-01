Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61E3C636CC
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 02:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fsKx8Rs711T6fAVJU0LCE+tnRrKkR48xDje+HLCZZg=; b=3BOfcQwfJ5N4iA
	WLxowOQZ9KtXnuo6FmtebEMbMmQtq9HdRdseimGxm75tfv8fs2Ml9M56OLzLxQ4X6RVMD02ItG6jD
	bbGEnkR5oEmz4U8/TqRdc8gS+vfbexAu1s0FH0Gr0VA93lXaM6oZMChd7oFo30phkBlfXWPf2GIU9
	os0sblDnOC9nLOxDInd1jfRKqiEDUTVzvI/5XCrP0a61x0PxSGTl9Hp+VMNkkTet+MjezsgmkDLWB
	C61MZWJ74Ia55Kp6jfL+P99tpsWgaV7iOz6TEXEM5RXL2za7B9Oo1rcgnUj99KD+Aj46HPKllKvFo
	5hz+EaHTVd031W/j85SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2TX-009t7y-OQ; Wed, 01 Feb 2023 02:03:51 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2TM-009t42-QC; Wed, 01 Feb 2023 02:03:42 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-16332831ed0so21783161fac.10;
        Tue, 31 Jan 2023 18:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAsnXdOzo9O6Pnss4aT9V1/YXcV+q2RfeHZfKzg5jEY=;
        b=gAmvzTdeX9nOMB2pGctHe0IcCwsgt7lbNfgZv69bb4u8AY/4U3sK3qoffqYUmKdbSc
         AtqtnHcni2lsXv+geNlgjXgWVq2oNU9sP4OJJRv3PRY/MzdD+rBYSpH2drjO11lM+L/t
         IYlIO0TzIx4SVVHVR3RFQMpFr5QVCDN35eBTwkupQ/3SBV34b/5oDIycxI/LxMqKjEOB
         lCx74h/4rhHCh5XwoNfwXChpWtnYAPCDQfhWGXZeRlrTGTWfW8/ljuK4hCqZlxknfB8m
         tJ7+ivoQKFuVmypA5/uCg3HRTWeED8/2PdNiPvnu7Y6Xw7vy1I1VbAGysu6nV2Mk4FQR
         LIRg==
X-Gm-Message-State: AO0yUKW8Ajtv2FMR4G9lOUOb8e1Zxja857MMvPq/FqCFmYGm5e4tdLRd
	3ST4mCr4hUCYs06HJPDP5g==
X-Google-Smtp-Source: AK7set9kTFKJpv1bbYPNikZ/zf5BsxPk2r1BfGV/TUsPTQxxNzyDFULzyQLaA4y9klwAXtfFFilD4g==
X-Received: by 2002:a05:6870:b28e:b0:163:bcc7:4384 with SMTP id c14-20020a056870b28e00b00163bcc74384mr122385oao.35.1675217019026;
        Tue, 31 Jan 2023 18:03:39 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z12-20020a056870738c00b0016343c187dfsm7358038oam.32.2023.01.31.18.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 18:03:38 -0800 (PST)
Received: (nullmailer pid 2318078 invoked by uid 1000);
	Wed, 01 Feb 2023 02:03:37 -0000
Date: Tue, 31 Jan 2023 20:03:37 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: Convert Amlogic
 Meson GPIO interrupt controller binding
Message-ID: <20230201020337.GA2311900-robh@kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <a1dee1a5-54d4-47ad-c914-8e9a801cd4a0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1dee1a5-54d4-47ad-c914-8e9a801cd4a0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_180340_873489_505268A8 
X-CRM114-Status: GOOD (  27.80  )
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

On Mon, Jan 30, 2023 at 09:53:21PM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson GPIO interrupt controller binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - consider that more than one compatible may be set
> - remove bus part from example
> v3:
> - remove minItem/maxItem properties for compatible
> ---
>  .../amlogic,meson-gpio-intc.txt               | 38 ---------
>  .../amlogic,meson-gpio-intc.yaml              | 84 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> deleted file mode 100644
> index bde63f8f0..000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -Amlogic meson GPIO interrupt controller
> -
> -Meson SoCs contains an interrupt controller which is able to watch the SoC
> -pads and generate an interrupt on edge or level. The controller is essentially
> -a 256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
> -or level and polarity. It does not expose all 256 mux inputs because the
> -documentation shows that the upper part is not mapped to any pad. The actual
> -number of interrupt exposed depends on the SoC.
> -
> -Required properties:
> -
> -- compatible : must have "amlogic,meson8-gpio-intc" and either
> -    "amlogic,meson8-gpio-intc" for meson8 SoCs (S802) or
> -    "amlogic,meson8b-gpio-intc" for meson8b SoCs (S805) or
> -    "amlogic,meson-gxbb-gpio-intc" for GXBB SoCs (S905) or
> -    "amlogic,meson-gxl-gpio-intc" for GXL SoCs (S905X, S912)
> -    "amlogic,meson-axg-gpio-intc" for AXG SoCs (A113D, A113X)
> -    "amlogic,meson-g12a-gpio-intc" for G12A SoCs (S905D2, S905X2, S905Y2)
> -    "amlogic,meson-sm1-gpio-intc" for SM1 SoCs (S905D3, S905X3, S905Y3)
> -    "amlogic,meson-a1-gpio-intc" for A1 SoCs (A113L)
> -    "amlogic,meson-s4-gpio-intc" for S4 SoCs (S802X2, S905Y4, S805X2G, S905W2)
> -- reg : Specifies base physical address and size of the registers.
> -- interrupt-controller : Identifies the node as an interrupt controller.
> -- #interrupt-cells : Specifies the number of cells needed to encode an
> -   interrupt source. The value must be 2.
> -- meson,channel-interrupts: Array with the 8 upstream hwirq numbers. These
> -   are the hwirqs used on the parent interrupt controller.
> -
> -Example:
> -
> -gpio_interrupt: interrupt-controller@9880 {
> -	compatible = "amlogic,meson-gxbb-gpio-intc",
> -		     "amlogic,meson-gpio-intc";
> -	reg = <0x0 0x9880 0x0 0x10>;
> -	interrupt-controller;
> -	#interrupt-cells = <2>;
> -	meson,channel-interrupts = <64 65 66 67 68 69 70 71>;
> -};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> new file mode 100644
> index 000000000..da55a2d25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/amlogic,meson-gpio-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson GPIO interrupt controller
> +
> +maintainers:
> +  - Heiner Kallweit <hkallweit1@gmail.com>
> +
> +description: |
> +  Meson SoCs contains an interrupt controller which is able to watch the SoC
> +  pads and generate an interrupt on edge or level. The controller is essentially
> +  a 256 pads to 8 GIC interrupt multiplexer, with a filter block to select edge
> +  or level and polarity. It does not expose all 256 mux inputs because the
> +  documentation shows that the upper part is not mapped to any pad. The actual
> +  number of interrupt exposed depends on the SoC.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,meson-gpio-intc
> +              - amlogic,meson8-gpio-intc
> +              - amlogic,meson8b-gpio-intc
> +              - amlogic,meson-gxbb-gpio-intc
> +              - amlogic,meson-gxl-gpio-intc
> +              - amlogic,meson-axg-gpio-intc
> +              - amlogic,meson-g12a-gpio-intc
> +              - amlogic,meson-sm1-gpio-intc
> +              - amlogic,meson-a1-gpio-intc
> +              - amlogic,meson-s4-gpio-intc
> +      - items:
> +          - enum:
> +              - amlogic,meson8-gpio-intc

We allow this with or without a fallback? Again, that should not be 
allowed and any dts files fixed.

> +              - amlogic,meson-axg-gpio-intc
> +              - amlogic,meson-g12a-gpio-intc
> +              - amlogic,meson-sm1-gpio-intc
> +              - amlogic,meson-s4-gpio-intc
> +          - const: amlogic,meson-gpio-intc
> +      - items:
> +          - const: amlogic,meson-gpio-intc
> +          - enum:
> +              - amlogic,meson8b-gpio-intc
> +              - amlogic,meson-gxbb-gpio-intc
> +              - amlogic,meson-gxl-gpio-intc

This looks wrong. The order is most specific to least specific 
compatible. amlogic,meson-gpio-intc is more specific (or a superset of) 
than amlogic,meson8b-gpio-intc? 

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  amlogic,channel-interrupts:

This was 'meson', not 'amlogic'. You can't just change things.

Really, 'interrupts' should have been used here, but oh well.

> +    description: Array with the upstream hwirq numbers
> +    minItems: 8
> +    maxItems: 12
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - amlogic,channel-interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@9880 {
> +      compatible = "amlogic,meson-gxbb-gpio-intc";
> +      reg = <0x9880 0x10>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
> +    };
> -- 
> 2.39.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
