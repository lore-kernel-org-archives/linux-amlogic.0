Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8E1CA0EDC
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Aug 2025 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgyntoQAqT4EA4IMsT5+hzZ/SHbPqOvaSij/6RDNZmA=; b=fI0IkqzHPLa+g4
	3w2KWIsr8CmR0vU3r8EuK+jWP0mp3XH6iVY5hJq58htGHLOGIjObAsnO5eWEQkNIwRFadEV8gJQzb
	E497lEpo4GlfAiaTsqNGga3ZTazU2aOBoDWVruyGawVXTyJKA03LYRreaUTc4UXNA9hNT6damwxw4
	+/L/uuhDK5rQXmL2PBwM0saZ1Gx3CfZdFO2eA64aDsSb2R2B0xycBhX+5rU5CEaB4b4LKrjvfYBVc
	NG8EGGQBofBHbsieyB1yZzshTIN4ykh6utNUzn4KNU0ZncijSOdKB+K0nX27i0QFBeBmB/qL7zIx5
	nL1Ud/97Osrxi6mIBwLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeFm-0000000CklK-0dhV;
	Wed, 20 Aug 2025 08:33:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uodsN-0000000CgJF-1waN;
	Wed, 20 Aug 2025 08:08:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 979866113B;
	Wed, 20 Aug 2025 08:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE166C113D0;
	Wed, 20 Aug 2025 08:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755677333;
	bh=czkdxE5TB5R/9a6En1K+Wcou33QtXIlLqEcTWW6eYhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l75ryk7FJcY8fynfRbmLJ0xqNdDiqe1NKSK3eyPIx3uh04Y+WiWqvnUaH+RCPQe/K
	 KrmHnYKB6GYJyaAQdz/XmwhbT9PyfYVwMqvt9J5kyTnoHn1EUcrY1DWE4TalHL2VRc
	 GLN2VdVwy93bf2IAQNJCexlrTUQIpCMXA8iFJK8NeeuzOn8VSxNejZIt/6LoOMhopk
	 dNj+Ork5Y2pVAn1RSnW7vFdVJkhZQLBF1LSCrd8Hje4F4SUaj3K9rZ6H8/RIyiCfQk
	 5IBxCNUNKqCdciHp8VC+cAVAhNY+TgUHoZ9VoeUQqh4GzyULVYUSEGjgx6ySt9k3SP
	 A9y6GW7r5Q3dg==
Date: Wed, 20 Aug 2025 10:08:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] dt-bindings: soc: amlogic: Add clk-measure related
 properties
Message-ID: <20250820-robust-didactic-panda-d374be@kuoka>
References: <20250815-add-more-socs-to-support-clk_measure-v1-0-59f04ba67457@amlogic.com>
 <20250815-add-more-socs-to-support-clk_measure-v1-1-59f04ba67457@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815-add-more-socs-to-support-clk_measure-v1-1-59f04ba67457@amlogic.com>
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

On Fri, Aug 15, 2025 at 04:37:27PM +0800, Chuan Liu wrote:
> Add three properties to clk-measure: 'clkmsr-indices', 'clkmsr-names',
> and 'clkmsr-reg-v2' for describing measurable channels and register
> offsets in DT.
> 
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  | 54 +++++++++++++++++++++-
>  1 file changed, 53 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> index 39d4637c2d08..1c9d37eef5f0 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-clk-measure.yaml
> @@ -6,7 +6,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: Amlogic Internal Clock Measurer
>  
> -description:
> +description: |

Why?

>    The Amlogic SoCs contains an IP to measure the internal clocks.
>    The precision is multiple of MHz, useful to debug the clock states.
>  
> @@ -28,15 +28,67 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clkmsr-indices:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |

Why | ?

> +      Supported channel IDs for clk-measure.
> +    minItems: 1
> +    maxItems: 256

Nothing - neither this nor commit msg - explains why you need it and
what this is.

> +
> +  clkmsr-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description: |
> +      The channel ID names supported by clk-measure correspond one-to-one with
> +      the IDs specified in 'clkmsr-indices'.
> +
> +      Therefore, the defined 'clkmsr-indices' and 'clkmsr-names' must have
> +      matching counts and maintain strict correspondence.
> +    minItems: 1
> +    maxItems: 256
> +
> +  clkmsr-reg-v2:
> +    type: boolean
> +    description: |
> +      Specify whether the register address offset for clk-measure corresponds
> +      to version V2.

No, compatible defines this.

> +
>  required:
>    - compatible
>    - reg
> +  - clkmsr-indices
> +  - clkmsr-names

That's ABI break. Again, nothing explains it.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
