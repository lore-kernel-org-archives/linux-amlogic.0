Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1486C4321E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 08:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6bEOc92HHa75GkWZtQRzxXWnllGBquUfcj0kbBBAVk=; b=LP8zuo3NB32F62
	892z6KzoWCpeocgu+vx4ACqGaemUnvf3UAKt9o+Sj739jNc/fwLDZUwgISNxfPdoeIM36vWIrVktQ
	/oDulf87fJ5sUb4mmLATpyAX0lvvMIRtlySWlzk/IFO0Pd2KkJZSCneI3kKlxgwBT+frjncroRE28
	GK/ubB/pFsvqvBATq51JEYPF3+kfdtifAyyuo2Jeau30lOXd7eaf5cUhgNbQ3ksKdhYGLV57TUexq
	+Bwfb42tgDpoZI60s8J9vXRakjiwOI/xqrOMxHmVrnF2YuMUCgzm6mO3NWh+dLKNAI32mKoRMsGYR
	GMo/1jNu/5T5m4EjZ7OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26YT-00G0In-Vh; Mon, 05 Dec 2022 08:10:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26YN-00G0DE-J4; Mon, 05 Dec 2022 08:10:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08A3C60FA1;
	Mon,  5 Dec 2022 08:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E59C433C1;
	Mon,  5 Dec 2022 08:10:13 +0000 (UTC)
Message-ID: <a5155443-8ec7-c2ad-2f07-716db6787aef@xs4all.nl>
Date: Mon, 5 Dec 2022 09:10:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 8/9] media: dt-bindings: nvidia,tegra-cec: convert to DT
 schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Joe Tessler
 <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
 <20221204182908.138910-8-krzysztof.kozlowski@linaro.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221204182908.138910-8-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_001021_662720_5C85570D 
X-CRM114-Status: GOOD (  21.20  )
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

On 04/12/2022 19:29, Krzysztof Kozlowski wrote:
> Convert Nvidia Tegra HDMI CEC bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Thanks!

	Hans

> ---
>  .../bindings/media/cec/nvidia,tegra-cec.yaml  | 58 +++++++++++++++++++
>  .../devicetree/bindings/media/tegra-cec.txt   | 27 ---------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 59 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/tegra-cec.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
> new file mode 100644
> index 000000000000..9a4025ff7fad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/cec/nvidia,tegra-cec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nvidia Tegra HDMI CEC
> +
> +maintainers:
> +  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
> +
> +allOf:
> +  - $ref: cec-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nvidia,tegra114-cec
> +      - nvidia,tegra124-cec
> +      - nvidia,tegra210-cec
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: cec
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - hdmi-phandle
> +  - interrupts
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/tegra124-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    cec@70015000 {
> +        compatible = "nvidia,tegra124-cec";
> +        reg = <0x70015000 0x00001000>;
> +        interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&tegra_car TEGRA124_CLK_CEC>;
> +        clock-names = "cec";
> +        status = "disabled";
> +        hdmi-phandle = <&hdmi>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/tegra-cec.txt b/Documentation/devicetree/bindings/media/tegra-cec.txt
> deleted file mode 100644
> index c503f06f3b84..000000000000
> --- a/Documentation/devicetree/bindings/media/tegra-cec.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -* Tegra HDMI CEC hardware
> -
> -The HDMI CEC module is present in Tegra SoCs and its purpose is to
> -handle communication between HDMI connected devices over the CEC bus.
> -
> -Required properties:
> -  - compatible : value should be one of the following:
> -	"nvidia,tegra114-cec"
> -	"nvidia,tegra124-cec"
> -	"nvidia,tegra210-cec"
> -  - reg : Physical base address of the IP registers and length of memory
> -	  mapped region.
> -  - interrupts : HDMI CEC interrupt number to the CPU.
> -  - clocks : from common clock binding: handle to HDMI CEC clock.
> -  - clock-names : from common clock binding: must contain "cec",
> -		  corresponding to the entry in the clocks property.
> -  - hdmi-phandle : phandle to the HDMI controller, see also cec.txt.
> -
> -Example:
> -
> -cec@70015000 {
> -	compatible = "nvidia,tegra124-cec";
> -	reg = <0x0 0x70015000 0x0 0x00001000>;
> -	interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> -	clocks = <&tegra_car TEGRA124_CLK_CEC>;
> -	clock-names = "cec";
> -};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 197351d3bb57..dee3f776be32 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2999,7 +2999,7 @@ M:	Hans Verkuil <hverkuil-cisco@xs4all.nl>
>  L:	linux-tegra@vger.kernel.org
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> -F:	Documentation/devicetree/bindings/media/tegra-cec.txt
> +F:	Documentation/devicetree/bindings/media/cec/nvidia,tegra-cec.yaml
>  F:	drivers/media/cec/platform/tegra/
>  
>  ARM/TESLA FSD SoC SUPPORT


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
