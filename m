Return-Path: <SRS0=Ikdi=X3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F9EC35280
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6538F21D80
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tDYJFzyK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6538F21D80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGO7Hmn4QyjZopEkQRaVtpXP5gtDAn3RDeIGOYYXcQs=; b=tDYJFzyKNAHujO
	mm3aoMClyHgRtqlYd8DLjHSEENleEObatTz4DouiOCqMZ0yQTNs6+GY2STtNTgedxkCwq6dmmuVFJ
	ersPvBt4lWJi4ldCtl9Go8lQmyh4B4V7WBfDqUgMv9lgqJDqtnunagR6FMI4gjznR/L4CHu38JeBx
	xZJ+LUgfBYgV2V+B+ZnUhhoH8PKre0Hx1X1sdb0mhpnmqVH7RzRSwQtun/qlNcmNJxG06eQcANbsL
	CYEuDRKNOOwBrCKqHIjfmvMXwW3vtRvXbGqp9zPejJAfcEKLQWGlmBYUsqKY0Lz+xWYi1Si4LVcHQ
	91oED8gGG+KeQQdeS8YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFfTT-0002R7-7W; Wed, 02 Oct 2019 14:19:27 +0000
Received: from mail-qt1-f195.google.com ([209.85.160.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFfTI-0002Ez-Fr; Wed, 02 Oct 2019 14:19:18 +0000
Received: by mail-qt1-f195.google.com with SMTP id m15so26576336qtq.2;
 Wed, 02 Oct 2019 07:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/4BkNlRVIojwkaNlJiwgslAKNSOU+8zzG4UZka4qDBU=;
 b=tovEdX89D8ysCgpJEzw3NolTfw9FL+KhENmZ43JKQOzhF7jc0H7msV6yRqG0lL34yS
 TLVBzgjYULDGEwKRJJ9ug94JabTfCLAB03KigvThBlxgwTZPK6opVtwTUG/l/65MsIQF
 Vc9UNopC3V7B6gl9y1w1ktUMWh9sBmzgs6odWVPVa9oRFdQPCEMptVJDPxoOa0uxWQH4
 LT9IaOi/l+wrsKH4GTAnvnHtnpf+NavTpErgnxMZzmBb+odd3zePwf3/Q2TaftV5Np8I
 8uZGLkfA8/boLlr9jVB0hzKyVTWFxrjTb3sMqHA8MU4QnbTh0OwGWnCtn4Twg1AvejNw
 bwdw==
X-Gm-Message-State: APjAAAVl/RZ0km7rFOeUUd2GlIUXIedri04AX1sPhUVmaEj37dD98xXH
 PK4Fa2OpK9nI8j3fnSy9RA==
X-Google-Smtp-Source: APXvYqyiCJ1kbtSTzcBUjuOuqu8ar7W4uCqJ/bf5oUMfYFYLi0a4ONnP7ChHGR3HF15IPGyvftP9iw==
X-Received: by 2002:ac8:2c86:: with SMTP id 6mr4217724qtw.113.1570025954662;
 Wed, 02 Oct 2019 07:19:14 -0700 (PDT)
Received: from localhost ([132.205.230.8])
 by smtp.gmail.com with ESMTPSA id e7sm13698395qtb.94.2019.10.02.07.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2019 07:19:14 -0700 (PDT)
Date: Wed, 02 Oct 2019 09:19:11 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/6] dt-bindings: clock: add the Amlogic Meson8 DDR clock
 controller binding
Message-ID: <20191001235650.GA11980@bogus>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
 <20190921151835.770263-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190921151835.770263-2-martin.blumenstingl@googlemail.com>
X-Mutt-References: <20190921151835.770263-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_071916_532769_9B0AE872 
X-CRM114-Status: GOOD (  16.55  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, narmstrong@baylibre.com,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Sep 21, 2019 at 05:18:30PM +0200, Martin Blumenstingl wrote:
> Amlogic Meson8, Meson8b and Meson8m2 SoCs have a DDR clock controller in
> the MMCBUS registers. There is no public documentation on this, but the
> GPL u-boot sources from the Amlogic BSP show that:
> - it uses the same XTAL input as the main clock controller
> - it contains a PLL which seems to be implemented just like the other
>   PLLs in this SoC
> - there is a power-of-two PLL post-divider
> 
> Add the documentation and header file for this DDR clock controller.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../clock/amlogic,meson8-ddr-clkc.yaml        | 50 +++++++++++++++++++
>  include/dt-bindings/clock/meson8-ddr-clkc.h   |  4 ++
>  2 files changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
> new file mode 100644
> index 000000000000..bf3ca5888485
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0

(GPL-2.0-only OR BSD-2-Clause) for new bindings please.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,meson8-ddr-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic DDR Clock Controller Device Tree Bindings
> +
> +maintainers:
> +  - Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson8-ddr-clkc
> +      - amlogic,meson8b-ddr-clkc
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: xtal
> +
> +  "#clock-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    ddr_clkc: clock-controller@400 {
> +      compatible = "amlogic,meson8-ddr-clkc";
> +      reg = <0x400 0x20>;
> +      clocks = <&xtal>;
> +      clock-names = "xtal";
> +      #clock-cells = <1>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/meson8-ddr-clkc.h b/include/dt-bindings/clock/meson8-ddr-clkc.h
> new file mode 100644
> index 000000000000..a8e0fa2987ab
> --- /dev/null
> +++ b/include/dt-bindings/clock/meson8-ddr-clkc.h
> @@ -0,0 +1,4 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#define DDR_CLKID_DDR_PLL_DCO			0
> +#define DDR_CLKID_DDR_PLL			1
> -- 
> 2.23.0
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
