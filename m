Return-Path: <SRS0=A5vq=MH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B383CC12002
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 00:23:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79582613C2
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jul 2021 00:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79582613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSEs/uSecugLSlgwjtKTtIjrXCNqRQqszqIj4Ay0GaY=; b=zf/2Mf9PBIMBAi
	4/kXaoty0rcsK/zKteoU/m1pMPH/6/6VuLw0XRoyqIQ9+XiO42BvQj/9Xug+i3Q9VGEO+Foo3zWGS
	XxyEQaqMg8VmtQgP8qvgemgBucI8AQcESFpuwWIG9WJleVEO+7FRPPdnBQaN/jGvUQimLVsyIeOs9
	mnQMr8OikAhudMwCqSN8rxGaxcskfuv5TPajFyieOuaNC51/Y3WlsKLjIQ2a99sO6PPMp+9qVizNn
	sMAk5IxfXdiQfdukqJJ34Max5L19Kft1jPi35M/azfB1wscAc3qgcPWHMenDpL5fitVYDPmfJ9Asg
	dO9BEGl5x2NEQbiUd++g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3p9b-00GeBf-0j; Thu, 15 Jul 2021 00:23:03 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3oDc-00GFYh-15; Wed, 14 Jul 2021 23:23:10 +0000
Received: by mail-io1-f42.google.com with SMTP id h6so4235678iok.6;
 Wed, 14 Jul 2021 16:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ToZ6NY20pj8+1z2HLFxJgFpOq59/gnhKty7JQKi5xcg=;
 b=ApQNAMZ83AsHLnvZ8BCchwNp/5kSRIUsp8jIQcA5aB0uzgWdT1/cIBY3VT5TUFENRA
 B6Sn5wp/msLTbZrnxiKHtjcCio/QooRiLbfPfXrfUlakI+jCMjq0ykz3EMfrypiSsr//
 O+q1cGrEnFz2//GZPcHxflSLWWIBLvneIUpvUSJtyrfwl14qiR6Ovg89Vsu40ZQZ3ovt
 gd4+H+TL+lnbfTrLkHwm6DaoZnv1iiV/5+KmQSnXdMOn/a9Uk2PKnMFMwXsH+gLeE34E
 L8PMi9qlEP1yCTY+xDbMB5SFHRlUqNjxTZASDFIlcZoeah6/vW0KPPYyNsuZnVzyn+Sa
 StQg==
X-Gm-Message-State: AOAM533bSoWzOPxO93FWii+i/GV7YJmlODQpKtVHQEi4OiDcmlpQbpeS
 XxnBVXQjdfrz+6WlHwpXrc/50MUUx1lk
X-Google-Smtp-Source: ABdhPJxfw9SHxbrbwickx7w/F5na0i6rWNyFm1PDKfzfrJ/f/+TLM8pzZ5E1dknUASd44A4KH9STUw==
X-Received: by 2002:a05:6602:134f:: with SMTP id
 i15mr421616iov.143.1626304986652; 
 Wed, 14 Jul 2021 16:23:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id f7sm2125738ilk.64.2021.07.14.16.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 16:23:05 -0700 (PDT)
Received: (nullmailer pid 3734548 invoked by uid 1000);
 Wed, 14 Jul 2021 23:23:03 -0000
Date: Wed, 14 Jul 2021 17:23:03 -0600
From: Rob Herring <robh@kernel.org>
To: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: sean@mess.org, mchehab@kernel.org, khilman@baylibre.com,
 narmstrong@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 rockosov@gmail.com
Subject: Re: [PATCH v3 1/2] media: rc: meson-irblaster: document device tree
 bindings
Message-ID: <20210714232303.GA3730974@robh.at.kernel.org>
References: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
 <20210709165753.29353-2-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210709165753.29353-2-viktor.prutyanov@phystech.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_162308_192497_B3EC92CC 
X-CRM114-Status: GOOD (  17.66  )
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

On Fri, Jul 09, 2021 at 07:57:52PM +0300, Viktor Prutyanov wrote:
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
> 
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  changes in v2:
>    - compatible = "amlogic,meson-g12a-irblaster" added
>    - clocks, clock-names and mod-clock updated
>  changes in v3:
>    - mod-clock removed
>    - max-fifo-level added
> 
>  .../media/amlogic,meson-irblaster.yaml        | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
> new file mode 100644
> index 000000000000..1e10aa0d3a94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/amlogic,meson-irblaster.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson IR blaster
> +
> +maintainers:
> +  - Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> +
> +description: |
> +  Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
> +  (blaster) controller onboard. It is capable of sending IR signals
> +  with arbitrary carrier frequency and duty cycle.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: amlogic,meson-irblaster
> +      - items:
> +          - const: amlogic,meson-g12a-irblaster
> +          - const: amlogic,meson-irblaster
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
> +      - const: sysclk
> +      - const: xtal
> +
> +  max-fifo-level:
> +    maxItems: 1

An array?

Needs a vendor prefix, type reference and constraints on allowed values.

> +    description:
> +      Maximum IR blaster FIFO fill level
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/g12a-clkc.h>
> +
> +    irblaster@ff80014c {
> +      compatible = "amlogic,meson-g12a-irblaster", "amlogic,meson-irblaster";
> +      reg = <0xff80014c 0x10>;
> +      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
> +      clocks = <&clkc CLKID_CLK81>, <&xtal>;
> +      clock-names = "sysclk", "xtal";
> +    };
> -- 
> 2.21.0
> 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
