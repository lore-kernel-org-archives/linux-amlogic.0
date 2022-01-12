Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8BEC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 01:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXiNuPRHpVZiM3xn0fJeMdOpX1k/anT8QWDJx8bt0Kw=; b=3saKChXZCunTh/
	OvTVRx0YC+4IZTU+MJ7C31mXHGKRDDN39hyELWVIkgfj8bA7Betpo1/GEEgkqoO/8vGMx6mdbTOUd
	gx6fGpoHVnuoXANwFyJ11NNEp/2bpPEahyrrltNLwe8qFBUMXC3EHiS2awslpm0rLPXATVIpCsCMa
	s6122aWEiHdKIfUJ5IQKLAU2v5GCCgq/HWdpQF78PPbuHK2HSL0vihEnSlY9BS6PmHDOstnAkcaYa
	sSsk57UtBO4pI/7t0FXiLu4PQ3Sr/kEKbeLzyd8AZQsKENA4WRLtXjRiW9vo7FZOyYFMf8RqdZtsc
	ocX9tFVNdn4O2spdg/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7SqK-000jhI-Mo; Wed, 12 Jan 2022 01:54:28 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7SqI-000jg4-Cy; Wed, 12 Jan 2022 01:54:28 +0000
Received: by mail-oi1-f180.google.com with SMTP id s127so1566418oig.2;
 Tue, 11 Jan 2022 17:54:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jyyKKvrn92emBwTYl6ojD1y8WmP58/pIYIpRrruJx/w=;
 b=nwrkS/A4l/68rvrMEyeCo4lHs3kCw9kwHSwrZ7+eAJzkGgZjTtP1jPMExq7owOugcB
 KhSdxkNC+9XP8yh7cdRnpEJTd+1hDsCWcLFQUM2C50SPCXAZoJDAybBtxcLlcgoUYytW
 azs8f3NZCWPUIZTiBo1BKKQAXFKO/9H2FMVC7j1nfLoK/izlGSOoToKgsykvWo49jsr9
 d01oAokx7UTp9ASvBL24mihXuIOw8WwXfKVtLLGdBxgg2bneN3C2FkmObIcL0teUm3wQ
 EnoykIu4WR2ZZ3tCGskf2pJmODZjYHuK0locYpShaRe7YLqjGWOHWs0BSuwQwwx9vV81
 kZoQ==
X-Gm-Message-State: AOAM533Dmm8RJ3+bz1exQMbeFRaqVSoL2ZpckK+OTrXmiNtBi3ONbw1x
 LLNyDzwfLiBbCD+wzqydcA==
X-Google-Smtp-Source: ABdhPJyai3eviqa56Rw1cwTXbmGC71Vr+kY41i8iUDYQQFe2H8+v8hh3AGbUdGoLrzSfIGQXsyaa3Q==
X-Received: by 2002:a05:6808:254:: with SMTP id
 m20mr2737989oie.55.1641952465766; 
 Tue, 11 Jan 2022 17:54:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v4sm2255328oot.36.2022.01.11.17.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:54:25 -0800 (PST)
Received: (nullmailer pid 3904441 invoked by uid 1000);
 Wed, 12 Jan 2022 01:54:24 -0000
Date: Tue, 11 Jan 2022 19:54:24 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Message-ID: <Yd400IApAqHeSW4B@robh.at.kernel.org>
References: <20220107145515.613009-1-narmstrong@baylibre.com>
 <20220107145515.613009-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220107145515.613009-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_175426_466281_BE84153D 
X-CRM114-Status: GOOD (  19.20  )
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

On Fri, Jan 07, 2022 at 03:55:10PM +0100, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI Glue
> on the same Amlogic SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/amlogic,meson-dw-mipi-dsi.yaml    | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> new file mode 100644
> index 000000000000..f3070783d606
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2020 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/display/amlogic,meson-dw-mipi-dsi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic specific extensions to the Synopsys Designware MIPI DSI Host Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic Meson Synopsys Designware Integration is composed of
> +  - A Synopsys DesignWare MIPI DSI Host Controller IP
> +  - A TOP control block controlling the Clocks & Resets of the IP
> +
> +allOf:
> +  - $ref: dsi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-g12a-dw-mipi-dsi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: pclk
> +      - const: px_clk
> +      - const: meas_clk
> +
> +  resets:
> +    minItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: top
> +
> +  phys:
> +    minItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: dphy
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

/schemas/graph.yaml#/properties/port

> +        unevaluatedProperties: false

And this can be dropped.

> +        description: Input node to receive pixel data.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false

Same here.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +        description: DSI output node to panel.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    dsi@7000 {
> +          compatible = "amlogic,meson-g12a-dw-mipi-dsi";
> +          reg = <0x6000 0x400>;
> +          resets = <&reset_top>;
> +          reset-names = "top";
> +          clocks = <&clk_pclk>, <&clk_px>;
> +          clock-names = "pclk", "px_clk";
> +          phys = <&mipi_dphy>;
> +          phy-names = "dphy";
> +
> +          ports {
> +              #address-cells = <1>;
> +              #size-cells = <0>;
> +
> +              /* VPU VENC Input */
> +              mipi_dsi_venc_port: port@0 {
> +                  reg = <0>;
> +
> +                  mipi_dsi_in: endpoint {
> +                       remote-endpoint = <&dpi_out>;
> +                  };
> +              };
> +
> +              /* DSI Output */
> +              mipi_dsi_panel_port: port@1 {
> +                  reg = <1>;
> +
> +                  mipi_out_panel: endpoint {
> +                      remote-endpoint = <&mipi_in_panel>;
> +                  };
> +              };
> +          };
> +    };
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
