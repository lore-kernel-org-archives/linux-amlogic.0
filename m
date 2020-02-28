Return-Path: <SRS0=AcXA=4Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD207C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 18:01:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B766D2469F
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Feb 2020 18:01:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S+yb2iZk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B766D2469F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQCBsXiH0gNTrJ60VySc5XRxc6I5DKhD/X483qyeQrM=; b=S+yb2iZkKeo6nb
	nuvFuv4T61rYYGJCEelED1hWfdpG2pGA+vYemmEDyU62IgbbjHwhDAvanObGydTSnvGESqIl/tBU+
	tRUBGmRNdfJjn5KvOtYnmFYwfToXDQV37sahRS3CGnCeBX09zmWOco6gN2oYe84YcSBI3pNr1wnXX
	n60Lnb7lNm+ELLWa10K/TxfYAMI9RcCA3VxFh40P6axj9/J8DFEhsihnXlzFJt5Vk9iyR6oHuYbX7
	1dEaS/8WxJ002FGcxoW4c7J7i4VZZL+a8w82WvdQsIOhazJcNN+kucqdQPsVezMCcFPixAVpEmm36
	LiK9vbAXgVZM62Lj9Abw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7jww-0004AA-6H; Fri, 28 Feb 2020 18:01:22 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7jwt-00049M-Lq
 for linux-amlogic@lists.infradead.org; Fri, 28 Feb 2020 18:01:21 +0000
Received: by mail-ot1-f66.google.com with SMTP id b3so3407362otp.4
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Feb 2020 10:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6pAsECt7PiBK62q88D+kfvQxUuJNH4AnYnLku6Y2cN8=;
 b=s2zQiFUyrS8drK6CtmpidjeV1b+nHfuPLUUhWSONDHYYGULI6BOtyMb/KmquH/CIsY
 cWd0q9xvo/Iy3tRdbt42Lkn9szKZM2qEmkuIGMPKxUVDYlQd5qrThLB35RQxs5xsLfxw
 NawrjEJf7Pin5+IfcbdSOmwb6CEq5czNvLLDCxQb793Lwqce1ockhCtvQwcRbinFF45W
 6AEv0tga+QTmk+8vOaYllYvkcNWO5KMEP3k1lqvV/7MgZHZjT8o/sLBkV9ZyKECCrvw5
 UajcU+uG/wc8k6daDyDE/uawbtptE8nd1FHx0/4eJ0QbwZcUHzytUYMw3ZtEn9Umd3Oh
 sAMA==
X-Gm-Message-State: APjAAAXB/83eOgh8rsn4qDL7OTwUjJ445KnqcDSAZXiizcTgTgVurFFk
 MvJ+Sbw0ereNQKjOKOYIqg==
X-Google-Smtp-Source: APXvYqyc028jTANUn0xgkw/a9kxcmZKUdVZYKQUcXfDjL8GahTISwR9AkN8XD+xx3EePlmjq7gsFvg==
X-Received: by 2002:a9d:518b:: with SMTP id y11mr4099645otg.349.1582912877111; 
 Fri, 28 Feb 2020 10:01:17 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m185sm3318360oia.26.2020.02.28.10.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 10:01:16 -0800 (PST)
Received: (nullmailer pid 21022 invoked by uid 1000);
 Fri, 28 Feb 2020 18:01:15 -0000
Date: Fri, 28 Feb 2020 12:01:15 -0600
From: Rob Herring <robh@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 5/9] ASoC: meson: convert axg fifo to schema
Message-ID: <20200228180115.GA14079@bogus>
References: <20200224145821.262873-1-jbrunet@baylibre.com>
 <20200224145821.262873-6-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224145821.262873-6-jbrunet@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_100119_715271_B2E7A923 
X-CRM114-Status: GOOD (  18.78  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Feb 24, 2020 at 03:58:17PM +0100, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg audio FIFOs to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-fifo.txt       |  34 ------
>  .../bindings/sound/amlogic,axg-fifo.yaml      | 111 ++++++++++++++++++
>  2 files changed, 111 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
> deleted file mode 100644
> index fa4545ed81ca..000000000000
> --- a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -* Amlogic Audio FIFO controllers
> -
> -Required properties:
> -- compatible: 'amlogic,axg-toddr' or
> -	      'amlogic,axg-toddr' or
> -	      'amlogic,g12a-frddr' or
> -	      'amlogic,g12a-toddr' or
> -	      'amlogic,sm1-frddr' or
> -	      'amlogic,sm1-toddr'
> -- reg: physical base address of the controller and length of memory
> -       mapped region.
> -- interrupts: interrupt specifier for the fifo.
> -- clocks: phandle to the fifo peripheral clock provided by the audio
> -	  clock controller.
> -- resets: list of reset phandle, one for each entry reset-names.
> -- reset-names: should contain the following:
> -  * "arb" : memory ARB line (required)
> -  * "rst" : dedicated device reset line (optional)
> -- #sound-dai-cells: must be 0.
> -- amlogic,fifo-depth: The size of the controller's fifo in bytes. This
> -  		      is useful for determining certain configuration such
> -		      as the flush threshold of the fifo
> -
> -Example of FRDDR A on the A113 SoC:
> -
> -frddr_a: audio-controller@1c0 {
> -	compatible = "amlogic,axg-frddr";
> -	reg = <0x0 0x1c0 0x0 0x1c>;
> -	#sound-dai-cells = <0>;
> -	interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
> -	clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
> -	resets = <&arb AXG_ARB_FRDDR_A>;
> -	fifo-depth = <512>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> new file mode 100644
> index 000000000000..d9fe4f624784
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-fifo.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic AXG Audio FIFO controllers
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^audio-controller@.*"
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    oneOf:
> +      - items:
> +        - const:
> +            amlogic,axg-toddr
> +      - items:
> +        - const:
> +            amlogic,axg-frddr
> +      - items:
> +        - enum:
> +          - amlogic,g12a-toddr
> +          - amlogic,sm1-toddr
> +        - const:
> +            amlogic,axg-toddr
> +      - items:
> +        - enum:
> +          - amlogic,g12a-frddr
> +          - amlogic,sm1-frddr
> +        - const:
> +            amlogic,axg-frddr
> +
> +  clocks:
> +    items:
> +      - description: Peripheral clock
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    minItems: 1
> +    items:
> +      - description: Memory ARB line
> +      - description: Dedicated device reset line
> +
> +  reset-names:
> +    minItems: 1
> +    items:
> +      - const: arb
> +      - const: rst
> +
> +  amlogic,fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Size of the controller's fifo in bytes

Aren't there some constraints on possible values? I'm sure it's more 
than 0 and less than 2^32.

> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - interrupts
> +  - reg
> +  - clocks
> +  - resets
> +  - amlogic,fifo-depth
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - amlogic,g12a-toddr
> +          - amlogic,sm1-toddr
> +          - amlogic,g12a-frddr
> +          - amlogic,sm1-frddr
> +then:
> +  properties:
> +    resets:
> +      minItems: 2
> +    reset-names:
> +      minItems: 2
> +  required:
> +    - reset-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/axg-audio-clkc.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/amlogic,meson-axg-audio-arb.h>
> +    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
> +
> +    frddr_a: audio-controller@1c0 {
> +        compatible = "amlogic,g12a-frddr", "amlogic,axg-frddr";
> +        reg = <0x0 0x1c0 0x0 0x1c>;
> +        #sound-dai-cells = <0>;
> +        interrupts = <GIC_SPI 88 IRQ_TYPE_EDGE_RISING>;
> +        clocks = <&clkc_audio AUD_CLKID_FRDDR_A>;
> +        resets = <&arb AXG_ARB_FRDDR_A>, <&clkc_audio AUD_RESET_FRDDR_A>;
> +        reset-names = "arb", "rst";
> +        amlogic,fifo-depth = <512>;
> +    };
> +
> -- 
> 2.24.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
