Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79780C4361A
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 08:05:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 356E522D58
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 08:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 356E522D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nr3++/+KzmeeV/3znxqv49EYkfjEaxw8RKDc3AwbA6k=; b=CaqJWpz4bsoo2DK/rc7m7nOXM
	Bw+OGI0oKqaAWCYseqnmy3+fzNXRE43or/N+n6GGcQkU91ddZqMG9ohBGykJZAEcHjmjyBDIRgV68
	2yuPs8QwHE28XhTQuIVZkneThFdI3efNZWlBq8wPgJE8FwV/9OEJB9mgX4BxnJGNf3nyrZo7+b0I3
	eS/iuToyrMGYXwlxh2aP8h5BDanuapPqfy6grxJSkj6F+AGfEAtAcJ90X/5S+XWulnSaL02D+lCL0
	oYvShCIBdtCxqcHXIroROmXWgnk9FhvsWM3Lmg11Kns7UYGrpDDEq4f5s4F6tiOEQU5aey7jg8Jl/
	73h45vQNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klSYx-0005Ou-90; Sat, 05 Dec 2020 08:05:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klSYu-0005Nq-K0; Sat, 05 Dec 2020 08:05:01 +0000
Date: Sat, 5 Dec 2020 13:34:55 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607155499;
 bh=9PjLV9MsP9K+cGD91+0hW5yFXhRvKI8seWclNH3MucU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=n6vE5mDrnq4WYbg4/sZKPP8eA3yukG74/1auvCgaBU7AurwAeMJ3fS4nvLidOCnSL
 hZ/iOvwPqJnidcZLoOGY+XsqXuHBsQ70yBuOClCLfy9ZOPw5ZZNS6OqJWrfI+ZiGm3
 p4RosQXdKba7Awf2CdrWHorKdcAH8G8F9QX+w9AQ+9sQFkLfp1LlwanaUeNkxIggIg
 fal8I4zn722n0HiamAqIxuMF33Hk92YzHDtTyZD+4tetW8DSOW0VgTmzcUmXItFid5
 4Zi3WuDT4Pu4/2ueCcCHkUtBJ89FflYQDwPCnz5tDwYsodSW055ucgwMHAsOqerRhu
 q3wdjzKYfUHNg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: phy: add Amlogic G12A Analog MIPI D-PHY
 bindings
Message-ID: <20201205080455.GU8403@vkoul-mobl>
References: <20201123145157.300456-1-narmstrong@baylibre.com>
 <20201123145157.300456-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201123145157.300456-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_030500_713717_84DCEC36 
X-CRM114-Status: GOOD (  16.11  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kishon@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 23-11-20, 15:51, Neil Armstrong wrote:
> The Amlogic G12A SoCs embeds an Analog MIPI D-PHY to communicate with DSI
> panels, this adds the bindings.
> 
> This Analog D-PHY works with a separate Digital MIPI D-PHY.

Pls cc Rob on dt binding patches (hint get_maintainer.pl would tell you
do so)

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

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
