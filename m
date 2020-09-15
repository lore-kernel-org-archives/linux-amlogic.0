Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854FFC433E2
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:41:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0164220872
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 15:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/xDsk+V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0164220872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=49zHvGXtIAqdhTiM0yuSmVAIEX5ucG2Gpv7EAGVG3JQ=; b=P/xDsk+VvjECDYSssRUMIjD0R
	sx1F/yZiP3vX5qBZ/zvnCYeQQstTuXBiI7ly9VnSkF1wTQ5eDZCBbNrQLOzvWVipDxFe/XcEztLze
	5F3aqSZdk6uUTDY5Uxfp+2LC1Iyeo+v7A0F26gmjgcthKSRw+f1/yyo+k01k+SvglZTz8FnBoVu/n
	E3TWrbki2Ok6zsFCI8hdmkYW8za8cxxyVwj8OQHyn0zktFayNZtH9y1YwSDUo6xc4r1sClIlQ+dcj
	KvfxzoqWLpZkIoI4b4TInmGEJVCK50lu1g/mYjjXQg7XmgADSCofLE+Kd+p1MkdMKza8Vy2bkW77W
	Exyj6kpiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kID5A-0004XS-SR; Tue, 15 Sep 2020 15:41:24 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kID57-0004Vv-6I
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 15:41:22 +0000
Received: by mail-io1-f65.google.com with SMTP id j2so4556748ioj.7
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 08:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9td3CHrhD2ePyY61tWqpgj5SUv0on2Qa1ge62urpHGs=;
 b=knTrEMRELJnEThyxCNovVbIoxacGPwweL+dXE8tTcO+q6FCdSV78P7rOXsBvB5rcIr
 6Ojj07s4U7lLi3OAXkdV6hUDLq4JFqcz+wI3m7A5VNZtNPArXV1NoCXujbn3HfINsE56
 Hmc7mNzh23sM5RY7YBIWmav7K1iyOK9WoPSpVSPn+A8lvu5xcUuusZIrmVHzSRfTrlDB
 qb8VcAyvZlxvgRcIvBjNJmlMsUIPkWULAnFKS0unrdD/F305loXt/XyoEJiZf/x9Yur5
 PHataHtMo+u0JI+7JGwdevAsDvEeMxm1U977G2Wj8znp+RVV/FHnyY55YvBjCJYFGINt
 VXUA==
X-Gm-Message-State: AOAM530cSBlBF1dhO56pPyfDMoRRaEVMvkpXHymJKU43+Yqzmif4KvJo
 VRxDoLBlBEftXQ3C8X/ZQQ==
X-Google-Smtp-Source: ABdhPJwNFt8xtG/jVr9dFKGqM4jI/u+N27xrn10aCxWh4fQsBFtbNUAm75Pkj7j/t6t5kOZ/mWI69Q==
X-Received: by 2002:a6b:c997:: with SMTP id
 z145mr15671026iof.136.1600184480497; 
 Tue, 15 Sep 2020 08:41:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id s2sm9369515ili.49.2020.09.15.08.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:41:19 -0700 (PDT)
Received: (nullmailer pid 1999129 invoked by uid 1000);
 Tue, 15 Sep 2020 15:41:19 -0000
Date: Tue, 15 Sep 2020 09:41:19 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/6] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Message-ID: <20200915154118.GA1988840@bogus>
References: <20200907081825.1654-1-narmstrong@baylibre.com>
 <20200907081825.1654-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907081825.1654-3-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_114121_245606_2E8EA6E9 
X-CRM114-Status: GOOD (  15.96  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 10:18:21AM +0200, Neil Armstrong wrote:
> The Amlogic AXg SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a), with a custom
> glue managing the IP resets, clock and data input similar to the DW-HDMI Glue on other
> Amlogic SoCs.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/amlogic,meson-dw-mipi-dsi.yaml    | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> new file mode 100644
> index 000000000000..6177f45ea1a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/amlogic,meson-dw-mipi-dsi.yaml
> @@ -0,0 +1,115 @@
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
> +      - amlogic,meson-axg-dw-mipi-dsi
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
> +    type: object
> +
> +    properties:
> +      port@0:
> +        type: object
> +        description: Input node to receive pixel data.
> +      port@1:
> +        type: object
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
> +additionalProperties: false

Presumably you may have panel/bridge child nodes, so this needs to be 
'unevaluatedProperties: false'.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
