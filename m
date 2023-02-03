Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DC0C636CC
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 08:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZYX77d3KTlVuln5uOEBIfuHsiWqQ/ncnwOD/Npwy0w=; b=gzTbM4gWF/cmip
	q+1u4++TwfPMlgXS/H1MTTLBEAlQ59HoOX3c6bMT3dIvJ5rC0GeZVAfHEyd00DeR0gEAN2HSXrZm9
	mKFzKl/2Di31y+DD/2cQJ2Hq2CPa2m5mvVTvv5wYlNnR1nkyfcePYosnSaUiC+uLu/wdNjGwfsiNC
	d2UrCPfM7Cc8Pg7SfEodXKzl1lmnpJy/FXreyPy19GDCLcBm496gDrIl2xekZiCBIjqu5v/drhwJ3
	V/V2PGwLi2QztivLnNtrYoi/LUbh6+eyqkbSkrvT29XCHAHAI809UXLisR14WRj5QSagCk4zcSwru
	IUcGf/wsbRW3JPg+Fo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr2r-000vJH-LT; Fri, 03 Feb 2023 08:03:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNr2o-000vI0-7S
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 08:03:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so1184784wms.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 00:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HO/wOlTKv2ZXyBQ/Aq4ZwUrxkA17nVhS0gL6sWJfJgU=;
        b=a9KKsDInAF1Re4LhiLxP3wdQs0pGWYrQHdmV6QmNbAWyZpX8mzHTBsD1QFyTIwx20Z
         6B+CNYeaIDaMeTDISok2fJVRBZAgxiTZArvhTbSTiD0zEVNCV6BHc6CSVMH7Gtl4GQyr
         ysPAjJGcj0tcIE+Br4FQm0ztrXBNaJ4Vx5k5ySDS0feEq8SbPnSVA8rX2zbXyZlWgCeC
         kuCNg4czlNc6buYVJkBQEOoUWGU9YauzZextYJyaw1Y/vXjG0rwN3kC7hmMgoKqCCOp4
         j8TPpa/0qF35omFlAmoehM1RCroVpAQq4QwZhuDoIhVa8cvZFFPUqq72T6UWXouXUCpA
         i4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HO/wOlTKv2ZXyBQ/Aq4ZwUrxkA17nVhS0gL6sWJfJgU=;
        b=yXKztZu5IZDhRY70OlBxqL2/i9D9L/yJqI6b2EUJmdgln9HZaW+RB86zgs5aSEcqer
         sz/FHgBJS4zPqmpxw3W2Ph0zPA7SzuCYdPTGSEpc9+lnmFUhe3Cguvtldw8YWaLzxqfV
         7v0EZMAnaA5jUQd1zGRVcvAQ60/EdAB2L3IwRs61PonBpdNqb0uSXyzwROED227YOrkX
         LoL/sC1hc7CxmwFjwCX+5CdXr/hggImh2fLWqAHPCD0UmF9Du4LfwpqK5t/NwPHrvDL5
         kvZuHQpI/vLbOFxDAmKPy+jReCP6qlIk/C0ii6zt09xLvBp3qZ6xMPmCFQ81B6pvNKhc
         Z9OQ==
X-Gm-Message-State: AO0yUKWhXo/3waZfbIUu1gaJK9e2K6wf2dl8eFCgjaRYTySwQtxVUxgW
	7ESMy2MheAtnaZVAYNqhaRfBVw==
X-Google-Smtp-Source: AK7set8u+cmZ7lz8PRUKAve3w16hS2Y87x6C560Uz3vJTv2lGOkxZM8qBpNk5O2HUja+PkE9yv2U6Q==
X-Received: by 2002:a05:600c:16c4:b0:3db:2098:17c0 with SMTP id l4-20020a05600c16c400b003db209817c0mr10351012wmn.29.1675411416947;
        Fri, 03 Feb 2023 00:03:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z4-20020a05600c0a0400b003dfdeb57027sm4215674wmp.38.2023.02.03.00.03.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:03:36 -0800 (PST)
Message-ID: <bdf35849-b1c9-224c-9d11-3fa57d224335@linaro.org>
Date: Fri, 3 Feb 2023 09:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 7/9] ASoC: dt-bindings: meson: convert axg spdif input to
 schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-8-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230202183653.486216-8-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_000338_297065_3C428FB9 
X-CRM114-Status: GOOD (  18.54  )
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

On 02/02/2023 19:36, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg spdif input to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-spdifin.txt    | 27 ------
>  .../bindings/sound/amlogic,axg-spdifin.yaml   | 90 +++++++++++++++++++
>  2 files changed, 90 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
> deleted file mode 100644
> index df92a4ecf288..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -* Amlogic Audio SPDIF Input
> -
> -Required properties:
> -- compatible: 'amlogic,axg-spdifin' or
> -	      'amlogic,g12a-spdifin' or
> -	      'amlogic,sm1-spdifin'
> -- interrupts: interrupt specifier for the spdif input.
> -- clocks: list of clock phandle, one for each entry clock-names.
> -- clock-names: should contain the following:
> -  * "pclk" : peripheral clock.
> -  * "refclk" : spdif input reference clock
> -- #sound-dai-cells: must be 0.
> -
> -Optional property:
> -- resets: phandle to the dedicated reset line of the spdif input.
> -
> -Example on the A113 SoC:
> -
> -spdifin: audio-controller@400 {
> -	compatible = "amlogic,axg-spdifin";
> -	reg = <0x0 0x400 0x0 0x30>;
> -	#sound-dai-cells = <0>;
> -	interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
> -	clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
> -		 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
> -	clock-names = "pclk", "refclk";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
> new file mode 100644
> index 000000000000..4f7e4c21acc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-spdifin.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Audio AXG SPDIF Input
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"
> +
> +  compatible:
> +    oneOf:
> +      - items:

All usual comments apply.

> +          - const:
> +              amlogic,axg-spdifin
> +      - items:
> +          - enum:
> +              - amlogic,g12a-spdifin
> +              - amlogic,sm1-spdifin
> +          - const:
> +              amlogic,axg-spdifin

All usual comments apply.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +      - description: SPDIF input reference clock
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: refclk
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-spdifin
> +          - amlogic,sm1-spdifin
> +then:
> +  properties:
> +    resets:
> +      items:
> +        - description: dedicated device reset line
> +
> +  required:
> +    - resets
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    spdifin: audio-controller@400 {
> +    	compatible = "amlogic,axg-spdifin";

Fix indentation.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
