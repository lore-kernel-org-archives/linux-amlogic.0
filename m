Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA8CC636CC
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 02:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0/Cq8nWtCMls5+GPHr4QlAFNA1SP9hFnV3bSAquxFA=; b=ewRcvmDHHigtWq
	VyGk1Fu1LSXapJWzqAGm2pXJMRowTI/EJcALvCj4AgQv8g2JMTym68O2KT03QJcfP+lgWSg0FN7lu
	wUUKFrbGgurd8h8NHHiFlWata65XQ8kjrPWsKLwtGCnp3reh7916tyzj3lffY3PMrNmxvrkHwY0WL
	uYhXMbK/1tAjuNXbwiLwlvPQj2w9GEnvbh3Y9Ccifw+iFqID2ZgEjS8PhMKD2wPp0IO7iVC8JCBhh
	39QZZ+IUEsv0snBnzip0Hw/g7lSUXfS3dwnNJYmeOyrIp9pff+9JAAjk1cC6eFIQA/tm2osUOtalq
	F5GBQosHiwAx3xXJI0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2Wa-009tUy-I3; Wed, 01 Feb 2023 02:07:00 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2WQ-009tSZ-3h; Wed, 01 Feb 2023 02:06:51 +0000
Received: by mail-ot1-f51.google.com with SMTP id e21-20020a9d5615000000b006884e5dce99so6022787oti.5;
        Tue, 31 Jan 2023 18:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0haGgSjCQMn2MiEVJmkIrDh7Syiy8FDFeByatBgAR8=;
        b=T6m6FQcDxr3lmhGCHnSjxx1nQYzDlwdEBf7+Tf65JW6CyId8YttxtjHvAs54m5PL/Z
         lJJQWXp/4+bV2saong53IEHVWqn5oUiboRqT6JYi7Q44gmmsD1MVAvFAaGuQa6syQpy1
         imEx8+sG09k404+Nf3Ov1gPo5mQKuQaM1DzvLv9ul0dFJOFfQ8A9r9JLXooMGDUQDBDO
         2pZnhOiPb5QoX/p+7wOxy5kXrDRoouUxtrtGZizBXM3O31QcNEOK/fQTluiYWiEt3k0e
         ugxf85pRl8z3BAqI3a1Z6hAF5M/MboTATGi7Cm2igJUXBYaYgDmR9GDiATnSFKYo+CeH
         nvBA==
X-Gm-Message-State: AO0yUKUsXYvhDS8+ASfwB5NnZ8GOi8wZ7RHis45jlbaGYQsqmYb7Qcov
	1jsQ8U2mXkUgpH7jMOZeOw==
X-Google-Smtp-Source: AK7set+4sb6nd6xIFd8MNV2tpKeR+7ihkEbAnwX5fpcAMz2dbi13lkSweEjyzomzaewFwqAsqRmAyg==
X-Received: by 2002:a05:6830:30a5:b0:68b:d40e:e21f with SMTP id g37-20020a05683030a500b0068bd40ee21fmr384560ots.34.1675217208900;
        Tue, 31 Jan 2023 18:06:48 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f88-20020a9d03e1000000b0068bcadcad5bsm4181956otf.57.2023.01.31.18.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 18:06:48 -0800 (PST)
Received: (nullmailer pid 2321407 invoked by uid 1000);
	Wed, 01 Feb 2023 02:06:47 -0000
Date: Tue, 31 Jan 2023 20:06:47 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Linus Walleij <linus.walleij@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
Message-ID: <20230201020647.GA2318275-robh@kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_180650_171292_7441724C 
X-CRM114-Status: GOOD (  18.66  )
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

On Mon, Jan 30, 2023 at 10:00:24PM +0100, Heiner Kallweit wrote:
> Convert Amlogic Meson pinctrl binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - consider that more than one compatible can be set
> - remove bus part from example
> v3:
> - remove minItem/maxItem properties for compatible
> ---
>  .../pinctrl/amlogic,meson-pinctrl.yaml        | 122 ++++++++++++++++++
>  .../bindings/pinctrl/meson,pinctrl.txt        |  94 --------------
>  2 files changed, 122 insertions(+), 94 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
> new file mode 100644
> index 000000000..7aaae606b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
> @@ -0,0 +1,122 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson pinmux controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,meson8-cbus-pinctrl
> +              - amlogic,meson8b-cbus-pinctrl
> +              - amlogic,meson8m2-cbus-pinctrl
> +              - amlogic,meson8-aobus-pinctrl
> +              - amlogic,meson8b-aobus-pinctrl
> +              - amlogic,meson8m2-aobus-pinctrl
> +              - amlogic,meson-gxbb-periphs-pinctrl
> +              - amlogic,meson-gxbb-aobus-pinctrl
> +              - amlogic,meson-gxl-periphs-pinctrl
> +              - amlogic,meson-gxl-aobus-pinctrl
> +              - amlogic,meson-axg-periphs-pinctrl
> +              - amlogic,meson-axg-aobus-pinctrl
> +              - amlogic,meson-g12a-periphs-pinctrl
> +              - amlogic,meson-g12a-aobus-pinctrl
> +              - amlogic,meson-a1-periphs-pinctrl
> +              - amlogic,meson-s4-periphs-pinctrl
> +      - items:
> +          - const: amlogic,meson8m2-aobus-pinctrl
> +          - const: amlogic,meson8-aobus-pinctrl
> +      - items:
> +          - const: amlogic,meson8m2-cbus-pinctrl
> +          - const: amlogic,meson8-cbus-pinctrl

Again, can't have both with and without the fallback allowed.

> +
> +  ranges: true
> +
> +  "#address-cells":
> +    enum: [1, 2]
> +
> +  "#size-cells":
> +    enum: [1, 2]
> +
> +required:
> +  - compatible
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties:
> +  anyOf:

Don't need anyOf.

> +    - type: object
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +patternProperties:
> +  "^bank@[0-9]$":

Unit addresses are hex.

> +    type: object
> +    properties:
> +      reg:
> +        minItems: 5
> +        maxItems: 5
> +
> +      reg-names:
> +        items:
> +          - const: gpio
> +          - const: pull
> +          - const: pull-enable
> +          - const: mux
> +          - const: ds
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        $ref: /schemas/types.yaml#/definitions/phandle

Wrong type and gpio-ranges already has a type.

> +
> +    required:
> +      - reg
> +      - reg-names
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +
> +examples:
> +  - |
> +    pinctrl {
> +      compatible = "amlogic,meson-g12a-periphs-pinctrl";
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      ranges;
> +
> +      bank@40 {
> +        reg = <0x0 0x40  0x0 0x4c>,
> +              <0x0 0xe8  0x0 0x18>,
> +              <0x0 0x120 0x0 0x18>,
> +              <0x0 0x2c0 0x0 0x40>,
> +              <0x0 0x340 0x0 0x1c>;
> +        reg-names = "gpio", "pull", "pull-enable", "mux", "ds";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&periphs_pinctrl 0 0 86>;
> +      };
> +
> +      cec_ao_a_h_pins: cec_ao_a_h {
> +        mux {
> +          groups = "cec_ao_a_h";
> +          function = "cec_ao_a_h";
> +          bias-disable;
> +        };
> +      };
> +    };

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
