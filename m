Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B0CC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 22:47:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C03239E4
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 22:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6C03239E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7IfqzGIYwsLWLA8qmTOhYPyIOTr2cUxgyR4HswlzSjI=; b=vD+yFkWZG5OCweFWOdSfI5ozq
	eaJJFSyX1AW+7iz+XH9Kr3vLU2dp5hZI5LPO/mkdYGLG7QodWROfyorDu44niSYmuwH/ZrZKwl658
	JlFkEH5hDtlOsqL/LO4VKbgp1m7oYjZ+leKl13IxZARYdwfWTeR3m3HhqZuJoESUH0SSd/vkaONar
	oS0OwKU4Zrsz4rT8LLUTZSCM61R/kXBp02Ox9vReG45u2XSbGteMukcsYXvl1lZM9qJl0KCFU83F6
	JPvTHl98LiKByqbdrmQ4MT9rjyCfPoHvU3UzfCJUoPljlTJ3QRdtn3Sqm/kUkeIERA/YaGr4Hp4vS
	HcF/ZqR9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPID-0005jO-HP; Mon, 07 Dec 2020 22:47:41 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPIA-0005iA-Qy; Mon, 07 Dec 2020 22:47:40 +0000
Received: by mail-oi1-f196.google.com with SMTP id o25so17346903oie.5;
 Mon, 07 Dec 2020 14:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0M8AV5f8oKzpVORQVLnD+CzneVSOa0nggX6FBEQvHak=;
 b=rNyi5R5i09mEb3izASynZg30GdVGnZd3e2fs50q3Pka9SdkBmRo5t82sFRiTsG6V1T
 c7zwvekNflDbbt7skm/UZwjvWWr63OWwiuD/g6VLeQ9cmwIc5SHBHKsgYqyQmFZw1yTX
 DnWb6cLQy01eP1i14Hfjkm2pGG0l1mR77I6hE4v1dHkxc83l+eHGSyWhOoEAoeV0lywF
 2MKw+wREXOm2dEi7q/o6npQM3Qash0s62Tf0aI+Gsv2pD7U8w64Ikn6d8eUrsviC34Rx
 WVAA0Fxv8LNkodHiQ0javqchtnmJrYCh18s60IxpHF4ftsQdXIxsFifMupD8RTiaN9WT
 OrZQ==
X-Gm-Message-State: AOAM533wY2i3vXZC0NAdkHvbzuoWKswelrkf4SK/8LNgxoCXpfMJwH0D
 abg8SFaTlNzmulzvtZsxEJlD+K56DA==
X-Google-Smtp-Source: ABdhPJzSi91QxN3R7XzrUK/0dXpeafD5EM57ynBOGctiHVV7avNW2TpfssDO34fTRuTPBN2KUDPnHQ==
X-Received: by 2002:aca:de85:: with SMTP id v127mr799245oig.36.1607381258314; 
 Mon, 07 Dec 2020 14:47:38 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n3sm3243022oif.42.2020.12.07.14.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:47:37 -0800 (PST)
Received: (nullmailer pid 985883 invoked by uid 1000);
 Mon, 07 Dec 2020 22:47:36 -0000
Date: Mon, 7 Dec 2020 16:47:36 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY
 bindings
Message-ID: <20201207224736.GB978231@robh.at.kernel.org>
References: <20201123145157.300456-1-narmstrong@baylibre.com>
 <20201123145157.300456-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123145157.300456-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_174738_902061_EB9C82F3 
X-CRM114-Status: GOOD (  20.23  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 vkoul@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Nov 23, 2020 at 03:51:56PM +0100, Neil Armstrong wrote:
> The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
> panels, this adds the bindings.
> 
> This Analog D-PHY works with a separate Digital MIPI D-PHY.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../phy/amlogic,g12a-mipi-dphy-analog.yaml    | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
> new file mode 100644
> index 000000000000..28663552f05b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/amlogic,g12a-mipi-dphy-analog.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic G12A MIPI analog PHY
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |+
> +  The Everything-Else Power Domains node should be the child of a syscon
> +  node with the required property:
> +
> +  - compatible: Should be the following:
> +                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
> +
> +  Refer to the the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.yaml

This schema should be referenced from the parent schema and if you have 
child nodes, you shouldn't be using syscon.yaml.

> +
> +properties:
> +  compatible:
> +    const: amlogic,g12a-mipi-dphy-analog
> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mpphy: phy {
> +          compatible = "amlogic,g12a-mipi-dphy-analog";
> +          #phy-cells = <0>;

Looks like a dedicated subset of registers, add 'reg' even if Linux 
doesn't use it (currently).

> +    };
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
