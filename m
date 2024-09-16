Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C985C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wQ7IQxVKRe6tz3POfJFNCIGZoviod8OGONp/WQCSzGU=; b=hPf45ruPqmM6JI
	XAZivfFhYCr6ZDX+ogmMb66752FcFP8xMw0V6uXN7hWqkz0yZVb87Z7CRQjFasTd5ZrbkeQ+oU+6p
	WoRD+/ehmeQYlbb3+hDXdszqZdmfvZzLO58EYN7Jk2FcVkfki4yuz0XiWuTlYtLPnXZM18tjTfKrq
	8k6VcBLDavUwHoZ+q3R41roMtyfZN4+xapej71urw1wUMethzdT2dvU5f+1DbfeR0IgmYdaNs0HQv
	tyVf6AcSHgIGgImbIfoA1ryd5BGvCyouXYNjBznWpkYM6HQuxWshGLCZaxJs45OVRiHY7LBmx+xAE
	Av4/sEJjUc1uWWGJVkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFiJ-00000004cDh-1SFf;
	Mon, 16 Sep 2024 17:40:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFiC-00000004cD6-23Hi;
	Mon, 16 Sep 2024 17:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 010C75C5CAA;
	Mon, 16 Sep 2024 17:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F01C4CEC4;
	Mon, 16 Sep 2024 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726508431;
	bh=qOgVuJKaEdKj21DVkkp/lMIeO9oIy+tidNV376TfMx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SxFxdFFrkp7w2Ip+VoLobiA5mjW/El/K+T8Cg69DeU1O/h4EqKiZATUK+bi4u3oql
	 uPjde9odYPv3iu8d0LGmJtLLhu9fqrqODW3DgzHurU+ncBIs6dX+svoDMHvL6TNydh
	 /BX59JkIb4mUsQH1j+DGNtFXP2jzWTH3loVq97lYFcI550cxvH1P+6Y/lzDOSFtnS1
	 wvh/yrvUfWUV235kuQ1ZMdVOJqeSyR8cc2VduVFRuri8chqFbyQuC2iDjfBkB6MJFP
	 GOyVzF5G1Gqebo0XF6bTDL3GVii3kLnKGqZt8vPTEGQOpCeXY1SO3fxfUcwex2BRqo
	 dTsnNWfTt0tYQ==
Date: Mon, 16 Sep 2024 12:40:30 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to
 dtschema
Message-ID: <20240916174030.GA835203-robh@kernel.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_104032_692703_5F98283B 
X-CRM114-Status: GOOD (  28.64  )
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

On Wed, Sep 11, 2024 at 05:20:47PM +0200, Neil Armstrong wrote:
> Convert the Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
> bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/mmc/amlogic,meson-mx-sdio.txt         |  54 -----------
>  .../bindings/mmc/amlogic,meson-mx-sdio.yaml        | 101 +++++++++++++++++++++
>  2 files changed, 101 insertions(+), 54 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt
> deleted file mode 100644
> index 8765c605e6bc..000000000000
> --- a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.txt
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -* Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
> -
> -The highspeed MMC host controller on Amlogic SoCs provides an interface
> -for MMC, SD, SDIO and SDHC types of memory cards.
> -
> -Supported maximum speeds are the ones of the eMMC standard 4.41 as well
> -as the speed of SD standard 2.0.
> -
> -The hardware provides an internal "mux" which allows up to three slots
> -to be controlled. Only one slot can be accessed at a time.
> -
> -Required properties:
> - - compatible : must be one of
> -	- "amlogic,meson8-sdio"
> -	- "amlogic,meson8b-sdio"
> -	along with the generic "amlogic,meson-mx-sdio"
> - - reg : mmc controller base registers
> - - interrupts : mmc controller interrupt
> - - #address-cells : must be 1
> - - size-cells : must be 0
> - - clocks : phandle to clock providers
> - - clock-names : must contain "core" and "clkin"
> -
> -Required child nodes:
> -A node for each slot provided by the MMC controller is required.
> -NOTE: due to a driver limitation currently only one slot (= child node)
> -      is supported!
> -
> -Required properties on each child node (= slot):
> - - compatible : must be "mmc-slot" (see mmc.txt within this directory)
> - - reg : the slot (or "port") ID
> -
> -Optional properties on each child node (= slot):
> - - bus-width : must be 1 or 4 (8-bit bus is not supported)
> - - for cd and all other additional generic mmc parameters
> -   please refer to mmc.txt within this directory
> -
> -Examples:
> -	mmc@c1108c20 {
> -		compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
> -		reg = <0xc1108c20 0x20>;
> -		interrupts = <0 28 1>;
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		clocks = <&clkc CLKID_SDIO>, <&clkc CLKID_CLK81>;
> -		clock-names = "core", "clkin";
> -
> -		slot@1 {
> -			compatible = "mmc-slot";
> -			reg = <1>;
> -
> -			bus-width = <4>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
> new file mode 100644
> index 000000000000..4d1142d2ff02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdio.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/amlogic,meson-mx-sdio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson6, Meson8 and Meson8b SDIO/MMC controller
> +
> +description:
> +  The highspeed MMC host controller on Amlogic SoCs provides an interface
> +  for MMC, SD, SDIO and SDHC types of memory cards.
> +  Supported maximum speeds are the ones of the eMMC standard 4.41 as well
> +  as the speed of SD standard 2.0.
> +  The hardware provides an internal "mux" which allows up to three slots
> +  to be controlled. Only one slot can be accessed at a time.

You need '|' or this is treated as 1 paragraph. If it is 1 paragraph, 
then format it that way.

But really if you want 3 paragraphs, then you should use '>' and put 2 
CR's between each paragraph.

> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - amlogic,meson8-sdio
> +          - amlogic,meson8b-sdio
> +      - const: amlogic,meson-mx-sdio
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: clkin
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +
> +patternProperties:
> +  "slot@[a-f0-9]+$":

Are you going to add 'slot' to nodename in mmc-controller.yaml?

> +    $ref: mmc-controller.yaml#
> +    description:
> +      A node for each slot provided by the MMC controller

blank line

> +    properties:
> +      compatible:
> +        const: mmc-slot

This is also used by the Cavium controller. Should be common.

> +
> +      reg:
> +        description:
> +          the slot (or "port") ID
> +        maxItems: 1

Aren't there limits in the number of slots the h/w can support?

> +
> +      bus-width:
> +        enum: [1, 4]
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mmc@c1108c20 {
> +        compatible = "amlogic,meson8-sdio", "amlogic,meson-mx-sdio";
> +        reg = <0xc1108c20 0x20>;
> +        interrupts = <GIC_SPI 28 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&clk_core>, <&clk_in>;
> +        clock-names = "core", "clkin";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        slot@1 {
> +            compatible = "mmc-slot";
> +            reg = <1>;
> +            bus-width = <4>;
> +        };
> +    };
> 
> ---
> base-commit: 47ac09b91befbb6a235ab620c32af719f8208399
> change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-6fa70546ebb8
> 
> Best regards,
> -- 
> Neil Armstrong <neil.armstrong@linaro.org>
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
