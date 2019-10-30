Return-Path: <SRS0=ndxv=YX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC77C47E49
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Oct 2019 10:39:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82682204FD
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Oct 2019 10:39:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NUP/ZN0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82682204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0gg44JiDA/A5ChpcxsMhIuUQ90C0MUYIypG80Gjze00=; b=NUP/ZN0cQ6eyLFgQfFz+5qvZ7
	NGiqC9QoTBK8jYmsC4z/x3r8FabCvYrJTQvfY8fDzNL7QukY4jJnOYep+Xgl2qpNHKmcK/r7FjeUP
	YWeKUdCyk+WH3kqM2GD9GrzaCqYHcNfSSImDP55i0yMdwMioJsd+5KtaHhMh5FDhlI8Xvn3+S3Hnl
	01vcySkmv3ET2s8/NKug6cCSLMHI7RRvZz5/MYnZD6RzPcfk9z2d5SGHbiR5TdRH+xW96Y+OfRlqn
	jnGrTpuA8LECiGcGqslSnUJ2iNFztR0Y002Ux97YAGDcEZaawhDLlVOfOjF2Oh28T08ZcyxE28i/y
	lK+6mx4DA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPlNe-0004X9-1E; Wed, 30 Oct 2019 10:39:10 +0000
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPlNa-0004Vw-5R; Wed, 30 Oct 2019 10:39:08 +0000
Received: from [172.20.50.122] ([91.217.168.176])
 by smtp-cloud9.xs4all.net with ESMTPA
 id PlNMiZEaKsBskPlNPiLsG2; Wed, 30 Oct 2019 11:38:57 +0100
Subject: Re: [PATCH] dt-bindings: media: meson-ao-cec: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>, robh+dt@kernel.org
References: <20191021121131.25017-1-narmstrong@baylibre.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d8733cd1-fca8-3aa7-8a48-8e79d0249e82@xs4all.nl>
Date: Wed, 30 Oct 2019 11:38:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021121131.25017-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfIQ2VdeGwB3P6PAcICDG9mQkN2WKp13Tk7/oBtUpSOf67QH/VGP9pPxvt49Oopz6Qm4vSECPrgX7ZQVLgpKlLNgISmpxyQBwJFLd9BAdOQ/cv1vaA4TN
 YYzuB+p3f3BPchXc6x3xOmgODI6mEhcMDhNoAdVUYRc9jAHCeDEA+JzcJKFEAWzOm29SFD48uSQHaKuz6hfvRXx0SwwazEcFDflnaRUPOcdVaqV/pzoXtT3M
 8ypLdzK972vSyI1Zck283wFUvDjvGllc8x4oSDjx9TQQS2qWDHr0E0E9IcPaarP43bs2Pj6VfwAqBV9c5uXOAr6Zl+NY/ptrW7WMUnMHA/vAsRSHqwiIQPPV
 L/QHyEYjc91sYgyCK18FtGJGNStxGU91lJcWyI9T57H/nKhLqe9gtpTMPtnLdfEAskMCRHXz4fQyEMv7BtaL/9nbR4hPEg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_033906_370179_726E8DDE 
X-CRM114-Status: GOOD (  18.42  )
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
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

Can you post a new patch that updates the MAINTAINERS file?

Thanks!

	Hans

On 10/21/19 2:11 PM, Neil Armstrong wrote:
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic AO-CEC controller over to a YAML schemas.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   .../media/amlogic,meson-gx-ao-cec.yaml        | 91 +++++++++++++++++++
>   .../bindings/media/meson-ao-cec.txt           | 37 --------
>   2 files changed, 91 insertions(+), 37 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
>   delete mode 100644 Documentation/devicetree/bindings/media/meson-ao-cec.txt
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
> new file mode 100644
> index 000000000000..41197578f19a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson AO-CEC Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +description: |
> +  The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
> +  to handle communication between HDMI connected devices over the CEC bus.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gx-ao-cec # GXBB, GXL, GXM, G12A and SM1 AO_CEC_A module
> +      - amlogic,meson-g12a-ao-cec # G12A AO_CEC_B module
> +      - amlogic,meson-sm1-ao-cec # SM1 AO_CEC_B module
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  hdmi-phandle:
> +    description: phandle to the HDMI controller
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson-gx-ao-cec
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: AO-CEC clock
> +
> +        clock-names:
> +          maxItems: 1
> +          items:
> +            - const: core
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson-g12a-ao-cec
> +              - amlogic,meson-sm1-ao-cec
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: AO-CEC clock generator source
> +
> +        clock-names:
> +          maxItems: 1
> +          items:
> +            - const: oscin
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - hdmi-phandle
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    cec_AO: cec@100 {
> +        compatible = "amlogic,meson-gx-ao-cec";
> +        reg = <0x0 0x00100 0x0 0x14>;
> +        interrupts = <199>;
> +        clocks = <&clkc_cec>;
> +        clock-names = "core";
> +        hdmi-phandle = <&hdmi_tx>;
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
> deleted file mode 100644
> index ad92ee41c0dd..000000000000
> --- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -* Amlogic Meson AO-CEC driver
> -
> -The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
> -to handle communication between HDMI connected devices over the CEC bus.
> -
> -Required properties:
> -  - compatible : value should be following depending on the SoC :
> -	For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
> -	"amlogic,meson-gx-ao-cec"
> -	For G12A (AO_CEC_B module) :
> -	"amlogic,meson-g12a-ao-cec"
> -	For SM1 (AO_CEC_B module) :
> -	"amlogic,meson-sm1-ao-cec"
> -
> -  - reg : Physical base address of the IP registers and length of memory
> -	  mapped region.
> -
> -  - interrupts : AO-CEC interrupt number to the CPU.
> -  - clocks : from common clock binding: handle to AO-CEC clock.
> -  - clock-names : from common clock binding, must contain :
> -		For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
> -		- "core"
> -		For G12A, SM1 (AO_CEC_B module) :
> -		- "oscin"
> -		corresponding to entry in the clocks property.
> -  - hdmi-phandle: phandle to the HDMI controller
> -
> -Example:
> -
> -cec_AO: cec@100 {
> -	compatible = "amlogic,meson-gx-ao-cec";
> -	reg = <0x0 0x00100 0x0 0x14>;
> -	interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
> -	clocks = <&clkc_AO CLKID_AO_CEC_32K>;
> -	clock-names = "core";
> -	hdmi-phandle = <&hdmi_tx>;
> -};
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
