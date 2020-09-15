Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 317A1C2D0E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:27:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADF0F20731
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:27:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j6jBkwrO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADF0F20731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9oCFbdsRoQaamI+qd7Dnf9SMi5MtZSzeQ2fZUxdmcI0=; b=j6jBkwrOedC1I7H2HAnAdTjdm
	1/KsiZ73vxqDHdyCNku58J4Kvz7Xk0vkzKEZvwL5jnqmnUU61syk5X4CD4X3DHrwDb9N+T5vv2CcD
	U1jP5PwtiLTSaNxCr4eKyTmGjgqHA+DL3NZcUh5uQMRV1xW1v9Zg+qdtyXlQ6Uh+9O5EzUJAlVWkq
	MjFubvZ/OFMqbxLfKHWDJ22R1kLE4CWZXsd9Ov54/HwmWoRkNcz7vVaSSFGf0einNeWgf9wWrcC86
	Oc+gL/goolMl8JBkCfLg3vYRfAEDfE9GwHeuS7vBlD/oor8hEnrdmtxEcfaMAiyOi5ZoA6fnh5Ehx
	K7FMr/o2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kICre-0000gn-Sv; Tue, 15 Sep 2020 15:27:27 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kICrb-0000fr-Nn; Tue, 15 Sep 2020 15:27:25 +0000
Received: by mail-io1-f66.google.com with SMTP id u6so4496313iow.9;
 Tue, 15 Sep 2020 08:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dPYwHeQQ7IP3X54VVPhQeqc8s7HY2r7mj5Uv/WrGFAY=;
 b=copwjLbbvaWJZVZqPluibmzdJxmMWdvgecDo/6ob3tNCLa5TfFxCRkb0QVHBZqJw/w
 YmGm7n1uwYgVwmohs4PcDSiwxn7viIfjsIBr6XEZmi1X2YbYOliwUJJgqTY2SqY6O112
 RDdUh05cKl50SThrSyCLy9UIsEYv823HUUMjMBfaChgnaWOwFyQK4oO2IvIBH/diVDAu
 qcaHgnUycYRZx6Z7GO0Q3goFiwxIGvyCpPOlVosH6GBEe+eAjyvnGG6SirLJ2Q/noIJ3
 fteQ+9mJnAtz9NBR+KTQQvIlR0w/nqYKfZEkEUCoiOyqh/gz+YdY5vfEDxcvbcX+wAF4
 B6gw==
X-Gm-Message-State: AOAM531orRRt5A9gfPz3SCiAZ4+C6PgolHUQedkth8Ai49Zhqe7QR8ej
 Qx/vlKvN7ThZLNYL4Sg8+dOvOiKZ43hd7IA=
X-Google-Smtp-Source: ABdhPJxDjUOE6+zDP2a0Ae0W9UtEpGt1+7MYgRW/yuvD1nijynqc1rDIB9fdJf9BCdcuWC3RKcVucA==
X-Received: by 2002:a05:6602:22cf:: with SMTP id
 e15mr15463385ioe.114.1600183642802; 
 Tue, 15 Sep 2020 08:27:22 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id c85sm9033041ilg.10.2020.09.15.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:27:22 -0700 (PDT)
Received: (nullmailer pid 1978036 invoked by uid 1000);
 Tue, 15 Sep 2020 15:27:20 -0000
Date: Tue, 15 Sep 2020 09:27:20 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: add Amlogic AXG MIPI D-PHY bindings
Message-ID: <20200915152720.GA1975674@bogus>
References: <20200907072708.26043-1-narmstrong@baylibre.com>
 <20200907072708.26043-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907072708.26043-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_112723_885267_19EB2552 
X-CRM114-Status: GOOD (  16.73  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kishon@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 09:27:07AM +0200, Neil Armstrong wrote:
> The Amlogic AXg SoCs embeds a MIPI D-PHY to communicate with DSI
> panels, this adds the bindings.
> 
> This D-PHY depends on a separate analog PHY.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/phy/amlogic,axg-mipi-dphy.yaml   | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
> new file mode 100644
> index 000000000000..f7ae1135288b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,axg-mipi-dphy.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2020 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/amlogic,axg-mipi-dphy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic AXG MIPI D-PHY
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,axg-mipi-dphy
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: phy
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: analog
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
> +  - "#phy-cells"

additionalProperties: false

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
