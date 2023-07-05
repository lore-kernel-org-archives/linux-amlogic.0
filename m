Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C72EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Jul 2023 19:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLJjXMGWgypkvhW9eFwG88XzLjkSorE1ZeuzkB7skDs=; b=32Vr4182aLix7O
	GEGaZx1viC5YjTtvBZvps7lcPpF5xp9lJX/ZvxI4bdLec63v12aC516uwYVUhmUEtm12cO/ewhX/C
	P1p+NvwvI4iLbDGPjH83rrG4FGVM6HgcopRiItiH/F7VMxLZoEL9qlW7VUzk76uuw7o9ymDcTFcKf
	2flOTd0eOYAr6pwx4TqknTQMaC8SiinFdjAR+dSBi69U0xvlpNXsSrPtrZGwhnozNp7qMWRaMXvTZ
	I7lNYh+TYgbRcuEtDuoevnaKAEcBkUiJ9GNrxCHm6bIp1wVXaiaaQCGlktcoh4+E9ctCwDAEChvkF
	oU/PXLHlVlYwt9HdB26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8cB-00Gxvu-1J;
	Wed, 05 Jul 2023 19:56:39 +0000
Received: from mail-io1-f51.google.com ([209.85.166.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH8c8-00Gxv8-1P;
	Wed, 05 Jul 2023 19:56:38 +0000
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-77acb04309dso354218339f.2;
        Wed, 05 Jul 2023 12:56:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688586995; x=1691178995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPt3Am55EIPQwjaZUFo2OjC5UfPdXakQamq9kZV1DYQ=;
        b=ePliJ4BS/2SWV6YI+w8dzDqB/+T6+/pwwO7yfOafBfSEB/IZ92pkMUD3anWdjeyxYc
         rqu+gzs9jmXHz0Fsi8FMaZgbkFTexxNnwWLCLQNvoaOhzcCyDmEyoNITMNfMoapSCDPc
         zLU7alySW9yMdYszgjdkwovi9VBP4WDEbMgcJ5g0sMP09Nehw6VHuBo0VxFYwvmHg7AN
         dk7yxuQIoPddmIB7n3wMeKHHVyUbTGB6fAmpSYV9ona1iDASgj1KCVDo5XtSnpOxp90G
         f/3RdysJJm7A0aY1Et2iF5U22X/mR51KHLtsvuaXGDQvnygQXfWA6Sf0DbQGUKcqgDoY
         Nojw==
X-Gm-Message-State: ABy/qLYTO4wkLBel26FASYqOKulTZVeIAf64x06EhsXZ+1rA4g9yK0fM
	PNWH6jer4/TQQVbOwaksdA==
X-Google-Smtp-Source: APBJJlHnNkXGWBvky8XFChw7oHy0bgp6ROaCctZYW1YAOfFB4F4irzCZhnVtBvrPuCl5xHlrMAHEkg==
X-Received: by 2002:a05:6602:2285:b0:786:7f3a:fb06 with SMTP id d5-20020a056602228500b007867f3afb06mr183361iod.3.1688586994825;
        Wed, 05 Jul 2023 12:56:34 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o4-20020a02c6a4000000b0042b426e353dsm2458216jan.127.2023.07.05.12.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:56:34 -0700 (PDT)
Received: (nullmailer pid 1737132 invoked by uid 1000);
	Wed, 05 Jul 2023 19:56:31 -0000
Date: Wed, 5 Jul 2023 13:56:31 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: amlogic: convert
 amlogic,gxbb-aoclkc.txt to dt-schema
Message-ID: <20230705195631.GA1732680-robh@kernel.org>
References: <20230705-b4-amlogic-bindings-convert-take2-v2-0-22be915ddc3b@linaro.org>
 <20230705-b4-amlogic-bindings-convert-take2-v2-2-22be915ddc3b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230705-b4-amlogic-bindings-convert-take2-v2-2-22be915ddc3b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_125636_497561_2BDFD938 
X-CRM114-Status: GOOD (  24.33  )
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

On Wed, Jul 05, 2023 at 01:41:52PM +0200, Neil Armstrong wrote:
> Convert the Amlogic Always-On Clock Controller bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/clock/amlogic,gxbb-aoclkc.txt         |  64 -------------
>  .../bindings/clock/amlogic,gxbb-aoclkc.yaml        | 101 +++++++++++++++++++++
>  2 files changed, 101 insertions(+), 64 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
> deleted file mode 100644
> index c41f0be5d438..000000000000
> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -* Amlogic GXBB AO Clock and Reset Unit
> -
> -The Amlogic GXBB AO clock controller generates and supplies clock to various
> -controllers within the Always-On part of the SoC.
> -
> -Required Properties:
> -
> -- compatible: value should be different for each SoC family as :
> -	- GXBB (S905) : "amlogic,meson-gxbb-aoclkc"
> -	- GXL (S905X, S905D) : "amlogic,meson-gxl-aoclkc"
> -	- GXM (S912) : "amlogic,meson-gxm-aoclkc"
> -	- AXG (A113D, A113X) : "amlogic,meson-axg-aoclkc"
> -	- G12A (S905X2, S905D2, S905Y2) : "amlogic,meson-g12a-aoclkc"
> -	followed by the common "amlogic,meson-gx-aoclkc"
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "xtal"     : the platform xtal
> -  * "mpeg-clk" : the main clock controller mother clock (aka clk81)
> -  * "ext-32k-0"  : external 32kHz reference #0 if any (optional)
> -  * "ext-32k-1"  : external 32kHz reference #1 if any (optional - gx only)
> -  * "ext-32k-2"  : external 32kHz reference #2 if any (optional - gx only)
> -
> -- #clock-cells: should be 1.
> -
> -Each clock is assigned an identifier and client nodes can use this identifier
> -to specify the clock which they consume. All available clocks are defined as
> -preprocessor macros in the dt-bindings/clock/gxbb-aoclkc.h header and can be
> -used in device tree sources.
> -
> -- #reset-cells: should be 1.
> -
> -Each reset is assigned an identifier and client nodes can use this identifier
> -to specify the reset which they consume. All available resets are defined as
> -preprocessor macros in the dt-bindings/reset/gxbb-aoclkc.h header and can be
> -used in device tree sources.
> -
> -Parent node should have the following properties :
> -- compatible: "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd"
> -- reg: base address and size of the AO system control register space.
> -
> -Example: AO Clock controller node:
> -
> -ao_sysctrl: sys-ctrl@0 {
> -	compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
> -	reg =  <0x0 0x0 0x0 0x100>;
> -
> -	clkc_AO: clock-controller {
> -		compatible = "amlogic,meson-gxbb-aoclkc", "amlogic,meson-gx-aoclkc";
> -		#clock-cells = <1>;
> -		#reset-cells = <1>;
> -		clocks = <&xtal>, <&clkc CLKID_CLK81>;
> -		clock-names = "xtal", "mpeg-clk";
> -	};
> -
> -Example: UART controller node that consumes the clock and reset generated
> -  by the clock controller:
> -
> -	uart_AO: serial@4c0 {
> -		compatible = "amlogic,meson-uart";
> -		reg = <0x4c0 0x14>;
> -		interrupts = <0 90 1>;
> -		clocks = <&clkc_AO CLKID_AO_UART1>;
> -		resets = <&clkc_AO RESET_AO_UART1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.yaml
> new file mode 100644
> index 000000000000..0adcfbcf5c85
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,gxbb-aoclkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Always-On Clock Controller
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - amlogic,meson-gxbb-aoclkc
> +              - amlogic,meson-gxl-aoclkc
> +              - amlogic,meson-gxm-aoclkc
> +              - amlogic,meson-axg-aoclkc
> +          - const: amlogic,meson-gx-aoclkc
> +      - enum:
> +          - amlogic,meson-axg-aoclkc
> +          - amlogic,meson-g12a-aoclkc
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 5
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-gxbb-aoclkc
> +
> +    then:
> +      properties:
> +        clock-names:
> +          minItems: 2
> +          items:
> +            - const: xtal 
> +            - const: mpeg-clk
> +            - const: ext-32k-0
> +            - const: ext-32k-1
> +            - const: ext-32k-2

As the names are always the same, move this to top-level and just set 
the length here (except the constraints are the same as top-level, so 
you can just drop this if/then).

> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-g12a-aoclkc
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 3
> +
> +        clock-names:
> +          minItems: 2
> +          items:
> +            - const: xtal 
> +            - const: mpeg-clk
> +            - const: ext-32k-0

Just 'maxItems: 3'

> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - amlogic,meson-gxl-aoclkc
> +            - amlogic,meson-gxm-aoclkc
> +            - amlogic,meson-axg-aoclkc
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +
> +        clock-names:
> +          items:
> +            - const: xtal 
> +            - const: mpeg-clk

maxItems: 2

> +
> +additionalProperties: false
> 
> -- 
> 2.34.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
