Return-Path: <SRS0=a8bK=FL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87028C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 22:44:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A5042336D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Dec 2020 22:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A5042336D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FtsJoswIqV40iCtxzonVFC087LFubcAJy0UKkKJ9coE=; b=VOwJDzjCJrM+L4l+t+tangpYK
	sEi7CFhBmsDR5/LWk2fmwfQzyVpDs1AfgIDOJWpI9yZSX+YSf3JcMcWAGn4YFeVIzQZEaaWwOyYfI
	rkCeYAayuIjEgAZkJaE+wGRy7aGEev74wcePmS7u5RHoicZpyJlQIRh7qLFXr9M0cItSjxIpWoddr
	pLrwdI80qY0V7wRmjmIsLzXnKWvv//LvpmOaMoaRwGsD0hsjP1ONSizbIAWIvWf9YlYetv9JBy1a1
	nwbjHsz/PWS8GjOrvaLXzQlTa12UMZYiiv30kWpXN46O5LTRAP+7w68lwtCZp/aRA98j2C3uyBlQi
	U/ZOOAO0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPFS-0005FC-JD; Mon, 07 Dec 2020 22:44:50 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPFQ-0005Ea-Ji; Mon, 07 Dec 2020 22:44:49 +0000
Received: by mail-ot1-f65.google.com with SMTP id o11so11452208ote.4;
 Mon, 07 Dec 2020 14:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MZJn2pgTt1kUD8to1t5Dt8cuRrsBFqiHtGixw10QU3M=;
 b=dlxM6IGMiuETARRTK9sEcbP3fCqzdPU7gQYRE7LLLqMXrjT37zub4xBKDdO5tstLr5
 srhHTAXzYhdTP5vo0mWU63ofvtyVjtlGFGSV0ZBJfFOb261hXET18JANBmc+VsU9qgx2
 eRHt5ZAqcAFxKCw/PXKQ3bmxP/7WUxib+bvSxBUT/l3O0iS2VnWEpG8YadFnzEnfFq1+
 GFAkKIvGRGCScfm8qJK7uWuQMKPq6WYqNVZBK1vfT1nsPAdOErgPwJ81VyUgZSJ9htME
 yfTmQcJDuDin7XUKPv7/0mJf8otuDUXgaAIoK5iUhLDlEcyTUjXXcJXg0NOZ5k5y4Gi5
 WY3Q==
X-Gm-Message-State: AOAM531RMbwC6Au0cmv4cfFpR97xWmBZggZsmt2w8UbmIIpv2N7bBfB1
 sUb7hr8KxGHo6juzPd0+SA==
X-Google-Smtp-Source: ABdhPJzRshPJNj+/0MGBhONump6skmEbNXhtOQcFjYdv8QT/xYUy2jDOLoIYu8rYALbDzGcCowO47g==
X-Received: by 2002:a9d:1d64:: with SMTP id m91mr5592660otm.290.1607381088018; 
 Mon, 07 Dec 2020 14:44:48 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t19sm1041039otp.36.2020.12.07.14.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 14:44:47 -0800 (PST)
Received: (nullmailer pid 981516 invoked by uid 1000);
 Mon, 07 Dec 2020 22:44:46 -0000
Date: Mon, 7 Dec 2020 16:44:46 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY
 bindings
Message-ID: <20201207224446.GA978231@robh.at.kernel.org>
References: <20201123145157.300456-1-narmstrong@baylibre.com>
 <20201123145157.300456-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123145157.300456-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_174448_674680_9FDC8EC8 
X-CRM114-Status: GOOD (  18.61  )
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

Everything-Else Power Domains node??

> +  node with the required property:
> +
> +  - compatible: Should be the following:
> +                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
> +
> +  Refer to the the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.yaml
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
> +    };
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
