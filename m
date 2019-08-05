Return-Path: <SRS0=EYbA=WB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB0FC0650F
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 21:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1797216F4
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Aug 2019 21:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nIHqTtQB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="13tUIInK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1797216F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psv3pnhZykPrba3jHMMkHjnYCu1OQo7cwqPU9Dh49qE=; b=nIHqTtQBDw+A7S
	qmHc0VAT9ha0IfDmnbsVefJP+meeqMBBNS7/eI9eqoYypYvkv6Am2vT7YWqAxcG6HQmYhvtd5Iw+2
	H6FGJmbkgTLIDCLm3458J90jx0U2j3afLJ4LwpxadqlbqEqlzAGs/RESUZsvzBquAP3tx6WRlAPa1
	eOkxvZGgcbWHGFQsa+vDQA4IRVXlXiDI2aao8tFqWdFvdHVpYGPq06MmdyMIN/eu3QCVfaSSqPSZz
	n0itchwjk3FqJl5+rLSvSQ0LzdsyB/wVV7uFGpgydIhqtwA+ezBe6/7VHEMMNlM/u/FM4PW9CtIdt
	EmNQTiRXhMnxq3wTC6jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huknt-000564-Na; Mon, 05 Aug 2019 21:46:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huknp-00055X-SZ; Mon, 05 Aug 2019 21:46:03 +0000
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D11620C01;
 Mon,  5 Aug 2019 21:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565041561;
 bh=subSU4ANuK0qDVBd0vAG1AnkJerzP5pOi4fyuHG8xv8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=13tUIInKnE4eHNYqfY1p4vcbK2rEnqAFvan1kVXBDW5FZeUc/8i5HWU+RjTF0itMs
 +boDbn8fAivIGCUSTItUaBOwiciY4eztk4XvucyK4bMgGINLKBaIPaggQPc9KbX1nR
 7PC+lVjFWRm3eoAteReg3RaM3tm6BqPXNMJG6WrY=
Received: by mail-qt1-f170.google.com with SMTP id r6so78278454qtt.0;
 Mon, 05 Aug 2019 14:46:01 -0700 (PDT)
X-Gm-Message-State: APjAAAXvt8WQpT9xLUdZP/Q/NKozVgAiU5SWTVszlwpkMYTZEssIR89r
 +Wi6JHWypyyJ+vfrbN6wiaTvdTbEyLAGJJBivQ==
X-Google-Smtp-Source: APXvYqzBwGXmcn81biCg4KLoojhRENYm4XDLvNlQS3MkA879bNBj02ITgrBwmCGub/Tr10uEARqqTe/pjnCfytTfQ3E=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr249407qtf.110.1565041560261; 
 Mon, 05 Aug 2019 14:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190805120320.32282-1-narmstrong@baylibre.com>
 <20190805120320.32282-4-narmstrong@baylibre.com>
In-Reply-To: <20190805120320.32282-4-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Aug 2019 15:45:48 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+WQ6KAE+d2_Pu03s6cSbu4PUErUWrGj81cAivTBNWBxQ@mail.gmail.com>
Message-ID: <CAL_Jsq+WQ6KAE+d2_Pu03s6cSbu4PUErUWrGj81cAivTBNWBxQ@mail.gmail.com>
Subject: Re: [RFCv2 3/9] dt-bindings: spi: meson: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_144601_966998_47ED2307 
X-CRM114-Status: GOOD (  16.17  )
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
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Aug 5, 2019 at 6:03 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Now that we have the DT validation in place, let's convert the device tree
> bindings for the Amlogic SPI controllers over to two separate YAML schemas.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 67 +++++++++++++++++++
>  .../bindings/spi/amlogic,meson6-spifc.yaml    | 53 +++++++++++++++
>  .../devicetree/bindings/spi/spi-meson.txt     | 55 ---------------
>  3 files changed, 120 insertions(+), 55 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
>  create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-meson.txt
>
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> new file mode 100644
> index 000000000000..49b617c98ae7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/spi/amlogic,meson-gx-spicc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson SPI Communication Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +description: |
> +  The Meson SPICC is a generic SPI controller for general purpose Full-Duplex
> +  communications with dedicated 16 words RX/TX PIO FIFOs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson-gx-spicc # SPICC controller on Amlogic GX and compatible SoCs
> +      - amlogic,meson-axg-spicc # SPICC controller on Amlogic AXG and compatible SoCs
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    description: input clock for the baud rate generator
> +    items:
> +      - const: core
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    spi@c1108d80 {
> +          compatible = "amlogic,meson-gx-spicc";
> +          reg = <0xc1108d80 0x80>;
> +          interrupts = <112>;
> +          clocks = <&clk81>;
> +          clock-names = "core";
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          ethernet-switch@0 {
> +              compatible = "micrel,ks8995m";
> +              spi-max-frequency = <1000000>;
> +              reg = <0>;
> +          };
> +    };
> +
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> new file mode 100644
> index 000000000000..67dcedc81a5e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2019 BayLibre, SAS
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/spi/amlogic,meson6-spifc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson SPI Flash Controller
> +
> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +
> +allOf:
> +  - $ref: "spi-controller.yaml#"
> +
> +description: |
> +  The Meson SPIFC is a controller optimized for communication with SPI
> +  NOR memories, without DMA support and a 64-byte unified transmit /
> +  receive buffer.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - amlogic,meson6-spifc # SPI Flash Controller on Meson6 and compatible SoCs
> +      - amlogic,meson-gxbb-spifc # SPI Flash Controller on GXBB and compatible SoCs
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +examples:
> +  - |
> +    spi@c1108c80 {
> +          compatible = "amlogic,meson6-spifc";
> +          reg = <0xc1108c80 0x80>;
> +          clocks = <&clk81>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          flash: m25p80@0 {

flash@0

I need to write a schema for this or I'll never stop giving this comment...

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +              compatible = "spansion,m25p80", "jedec,spi-nor";
> +              reg = <0>;
> +              spi-max-frequency = <40000000>;
> +          };
> +    };
> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
