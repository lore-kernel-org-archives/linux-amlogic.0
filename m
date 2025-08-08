Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69E5C87FD3
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Aug 2025 08:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMZv0xcXkFffs6eE/WvZjpqnCT1YiCqG1S6xHzi16y8=; b=tsyj7yreAc7avK
	plx03XZxVdRXnBIdff0n74xIe+kaUjGXCDugnHkefqEwupZe42aFqfFG4SAlTL0/u0DC56HL4q7JJ
	ymoCUc0yeIjCjQdV2j+5+e3ZywOP6egd5S0i15gkyM3UrF/rjJUBRCt5cceUYPNwHAj3kjC8CEha/
	uetaDVbx4ijIAqvav2XzxcDVKeuorgk8wII743Avpsp5QcAwuNaXI2jSVKMJDxVD9QpR+k+x5BFJS
	X+sozX0pfe4PMN+yOgBEQSGrDoZ7KUnbJbaSWItmptaGFaFbaqRNyksasbBvHQg61z5s5uikHsLbq
	CULB65F82LAUzHibtsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukI6D-00000002Hf7-2zhw;
	Fri, 08 Aug 2025 08:05:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukI51-00000002HQr-34Ig
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Aug 2025 08:04:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 457C65C5D96;
	Fri,  8 Aug 2025 08:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FC8C4CEED;
	Fri,  8 Aug 2025 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754640238;
	bh=ql/cRZYDLhA7jP9iJrRhFEoYs9X2U+gQifZ0qjY7Ur0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1+G4C0Bb1s5IIBz4hMmY7bLy5UPqfEjDxSNVrmkak5juoah9iMdWFSNY/PszOCbi
	 hRTxS0iDXb+ppUFTDSAhyjD64YmgzizpvzI9s7lh00FMtM7xiNWy7wv8ecTbm1HyJK
	 PLpUxn/ZC/HQQCFxDQ4E/I/da+USOE6O3KZVw4ke+eT72Gzui3kC0hW5Ti1QWOVryv
	 LbynCAYBTqweN6WiMV6tQxV1rWZfuma8ouCzUpmq0/4HYlvNnZeU23sjpdcYM3ZtVv
	 758dy7z+KHq4m+WwQaH0irkFr20Z9SUUGLJdYGx99UDZJZk1sp9mrgkxfodYHd0ikd
	 Dz5s9q4HAM2nA==
Date: Fri, 8 Aug 2025 10:03:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liang Yang <liang.yang@amlogic.com>, Feng Chen <feng.chen@amlogic.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/3] spi: dt-bindings: add doc for Amlogic A113L2 SFC
Message-ID: <20250808-adamant-fat-raven-38c8b3@kuoka>
References: <20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com>
 <20250808-spifc-v1-1-ff4e30e26a6b@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250808-spifc-v1-1-ff4e30e26a6b@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_010359_846554_C57677D8 
X-CRM114-Status: GOOD (  22.28  )
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

On Fri, Aug 08, 2025 at 10:00:34AM +0800, Xianwei Zhao wrote:
> From: Feng Chen <feng.chen@amlogic.com>
> 
> The Flash Controller is derived by adding an SPI path to the original
> raw NAND controller. This controller supports two modes: raw mode and
> SPI mode. The raw mode has already been implemented in the community,
> and the SPI mode is described here.
> 

Subject: drop doc, so just "Add Amlogic foo ..."

> Add bindings for Amlogic A113L2 SPI Flash Controller.
> 
> Signed-off-by: Feng Chen <feng.chen@amlogic.com>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/spi/amlogic,a4-spifc.yaml  | 104 +++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
> new file mode 100644
> index 000000000000..712a17a4b117
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/spi/amlogic,a4-spifc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SPI flash controller for Amlogic ARM SoCs
> +
> +maintainers:
> +  - Liang Yang <liang.yang@amlogic.com>
> +  - Feng Chen <feng.chen@amlogic.com>
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +description:
> +  The Amlogic SPI flash controller is an extended version
> +  of the Amlogic NAND flash controller. It supports SPI Nor
> +  Flash and SPI NAND Flash(where the Host ECC HW engine could
> +  be enabled).

Wrap at coding style, 80.

> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: amlogic,a4-spifc
> +
> +  reg:
> +    items:
> +      - description: core registers
> +      - description: parent clk control registers

Why are you poking to parent node or to clock registers? This looks like
mixing up device address spaces.

> +
> +  reg-names:
> +    items:
> +      - const: core
> +      - const: pclk
> +
> +  clocks:
> +    items:
> +      - description: clock gate

Are you sure this is separate clock input to this device?

> +      - description: clock used for the controller
> +      - description: clock used for the SPI bus
> +
> +  clock-names:
> +    items:
> +      - const: gate
> +      - const: core
> +      - const: device
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  amlogic,sfc-enable-random:
> +    description: Enable data scrambling

Why would this be a property of the board?

> +    type: boolean
> +
> +  amlogic,sfc-no-hwecc:
> +    description: Disable ECC HW engine

Same question, why not having ECC always?

> +    type: boolean
> +
> +  amlogic,rx-adj:
> +    description:
> +      Adjust sample timing for RX, Sampling time
> +      move later by 1 bus clock.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sfc0: spi@fe08d000 {
> +      compatible = "amlogic,a4-spifc";
> +      reg = <0xfe08d000 0x800>, <0xfe08c000 0x4>;

One register for the parent clock? This really does not look like part
of this device.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
