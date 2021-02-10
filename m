Return-Path: <SRS0=lUps=HM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAC5C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 16:51:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342AA64DD6
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Feb 2021 16:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342AA64DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5NBCJbPJMhDFtmQA3uz2GMbI5ruVBAwoOZWS2/m4reU=; b=GGvJe+kfwGkTyU5g3IdxI0AW9
	FYMKC1qSp7DQfZTC5AFPGvvmP/y500X12p71ZvdSy1ZxoCHydvwou2qjdgPAcYuMQMfzMy2xryGUN
	ZCp/Of2Clkkpz+ByZ3cAAMvtHj3Gbl7Na9WGlppivqkfjO7i1oTE2neoN8ZEkwez2BCqw5N5AIMIf
	DDrZAjKNZlVFuGazF0aMD1nJKBe7kcU+0nJ3t0gQ1AH/dbguMbSjy7pSeyUeqE/MNVS4874QCwn1+
	5W7gh6rMdT0D8Sf17j554/zVtHLsabJ6jqxM8JQqFIoP1wCcT21F+LM9ZV0Pjk0aCO1rz0iC0Blmo
	MwhNpwFLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9si6-0003ra-Jl; Wed, 10 Feb 2021 16:51:26 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9si2-0003qp-MM; Wed, 10 Feb 2021 16:51:24 +0000
Received: by mail-ot1-f46.google.com with SMTP id r21so2368045otk.13;
 Wed, 10 Feb 2021 08:51:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HYDCWW0ri9ABwNvakmVNrOr5CXzUYGndo7RaL5QLnsY=;
 b=tM4DmCKSs8UxY2ksZQArybXXn0N7qVdLooPIT1qPsyic5TVkcvNZJJXlbkLSRt/1gU
 IoNAyu4NKj9sl/BEyB6bHHwZD3u8Pdu7mELBfiHslEZCPIRs4/gb1qYneFBU2E5GDbq3
 JORaVlyi2iby2BaEAGT/nsfxidHKvuEF6dzul2Pm9MrbCHeK1aESFwlhxWTgZIYEDbrc
 7G5adLBJjSTuEctU2T4of2FMT22q9bdeuHReGlKfUHicG0YFVCNQk+Kety6REqA5zAOc
 1zPRnDMvcfdfqBNR1k+kdw9u0rVEPS5b8YlBk/8hH3e9p7G1sC6UcJJIuxstctaygRtZ
 KOzw==
X-Gm-Message-State: AOAM533o9kdxC6L/e2A599kYVHhPQfSTpIIcV9KCjRtslGkA0tMnCJxD
 tK6PxFWk6LG2Iy4usMyE4wZkhCGc3A==
X-Google-Smtp-Source: ABdhPJytCx3NdyTubREuzpwniM9aZ3So4jziTwM7WzUcVNObDeXC7uO//8RwWqawI+Itzag/Jn/R0g==
X-Received: by 2002:a05:6830:120c:: with SMTP id
 r12mr2830409otp.72.1612975881492; 
 Wed, 10 Feb 2021 08:51:21 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t3sm476211otb.36.2021.02.10.08.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:51:19 -0800 (PST)
Received: (nullmailer pid 2315145 invoked by uid 1000);
 Wed, 10 Feb 2021 16:51:18 -0000
Date: Wed, 10 Feb 2021 10:51:18 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI
 D-PHY bindings
Message-ID: <20210210165118.GA2311581@robh.at.kernel.org>
References: <20210210080736.771803-1-narmstrong@baylibre.com>
 <20210210080736.771803-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210080736.771803-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_115122_753839_54A4C57B 
X-CRM114-Status: GOOD (  17.32  )
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

On Wed, Feb 10, 2021 at 09:07:35AM +0100, Neil Armstrong wrote:
> The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
> panels, this adds the bindings.
> 
> This Analog D-PHY works with a separate Digital MIPI D-PHY.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../phy/amlogic,g12a-mipi-dphy-analog.yaml    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
> new file mode 100644
> index 000000000000..14bb8d78a860
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/amlogic,g12a-mipi-dphy-analog.yaml
> @@ -0,0 +1,35 @@
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
> +properties:
> +  compatible:
> +    const: amlogic,g12a-mipi-dphy-analog
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    phy@0 {
> +          compatible = "amlogic,g12a-mipi-dphy-analog";
> +          #phy-cells = <0>;
> +          reg = <0>;

If this is a child of something else, then put a $ref to this schema and 
the example in the parent schema.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
