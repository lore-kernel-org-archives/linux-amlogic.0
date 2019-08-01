Return-Path: <SRS0=NajJ=V5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C5EC433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 14:42:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5C3020665
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Aug 2019 14:42:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LJyKg52r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z/HdMI/A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5C3020665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqpi6oNsTyw6fQ7bBBipEah4PoOH6ZOSSFHx6zlZh4w=; b=LJyKg52rXQFFBc
	TtI67jJFuy84KxNvwGCs0xB3LMBaUnubBduXhFKP6QvbvvbSFZ6iZ10l0fhKuaqibfIgjws/0XAZ4
	TUSKL79DukgNHa0ShINjV4RJ3ctDo8d2+0b9kllCnZwbvbk5avYMqNk58RqLbOyv74EO0GWupesmV
	Gt1bfmEiyt3guLF6qBB9QZi7AHiPJoXc8jjPN1y7q2Sn5uK7zEqg387UUeBCRvJKd4dC18iJ9lfCo
	enoFbVUqmfimQB/mlPnz1iQugtr+JmRVZzYE73XMY5zyr1Lvuv+6xML/T544xTob+5oQa/Cux9MHP
	TV3ikEjs4wNm+lSagxOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htCHw-0008Sf-W4; Thu, 01 Aug 2019 14:42:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htCHu-0008Rf-4O; Thu, 01 Aug 2019 14:42:39 +0000
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6A9120665;
 Thu,  1 Aug 2019 14:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564670557;
 bh=GprFswuM78S+VgBUwByzLyrYSPJVf3nxGZ4gKaEnPOI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=z/HdMI/AIy5FG1El2tcpyMP7dY2ibpvP+xRzzk8m0sK5HDQZTnayJoCJObknAGVZ4
 W1uKR5i//rhhMJjOvZkNEJrEiib7P59EoQP6Hfb72LXpKeqytILuerqVXOcJOxD2NK
 grcU3VwO0oom9Fe5WlBevZ+wHeX2T33aW2GXOYBc=
Received: by mail-qt1-f175.google.com with SMTP id h18so70475336qtm.9;
 Thu, 01 Aug 2019 07:42:37 -0700 (PDT)
X-Gm-Message-State: APjAAAWMPH2GAugCnmNKd7iD7irLo5efwvMrbrabnshS2p/aAaSSTs04
 8YWGptkln/lQZCfUlXdfIh2BzMA0KyRFEugdFQ==
X-Google-Smtp-Source: APXvYqw7U48NblAeJFrFkeTHFyKp5QLlcheCe1VY0HORPOiVyncpm84GhT+LSusKRubHI4v73Qi9L1rIYf5NYy03mFs=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr90788503qtf.110.1564670556872; 
 Thu, 01 Aug 2019 07:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190801135644.12843-1-narmstrong@baylibre.com>
 <20190801135644.12843-4-narmstrong@baylibre.com>
In-Reply-To: <20190801135644.12843-4-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 1 Aug 2019 08:42:23 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK9ODpXq_VkP4ztW7JAfPNOxpdP1W1duQwaUu0tYNh_Dw@mail.gmail.com>
Message-ID: <CAL_JsqK9ODpXq_VkP4ztW7JAfPNOxpdP1W1duQwaUu0tYNh_Dw@mail.gmail.com>
Subject: Re: [RFC 3/9] dt-bindings: spi: meson: convert to yaml
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_074238_217118_5A870019 
X-CRM114-Status: GOOD (  17.97  )
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

On Thu, Aug 1, 2019 at 7:56 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  | 74 +++++++++++++++++++
>  .../bindings/spi/amlogic,meson6-spifc.yaml    | 57 ++++++++++++++
>  .../devicetree/bindings/spi/spi-meson.txt     | 55 --------------
>  3 files changed, 131 insertions(+), 55 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
>  create mode 100644 Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/spi/spi-meson.txt
>
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> new file mode 100644
> index 000000000000..6e2c41c730b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> @@ -0,0 +1,74 @@
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
> +    oneOf:
> +     - description: SPICC controller on Amlogic GX and compatible SoCs
> +       enum:
> +       - amlogic,meson-gx-spicc
> +     - description: SPICC controller on Amlogic AXG and compatible SoCs
> +       enum:
> +       - amlogic,meson-axg-spicc

'oneOf' results in vague error messages and can be avoided here. Plus
I don't think the descriptions add much as I could pretty much
generate the desc "<block> controller on <vendor> <soc> and compatible
SoCs" from <vendor>,<soc>-<block>.

Though, if you want to keep the description, do it as a comment:

enum:
  - amlogic,meson-gx-spicc # SPICC controller on Amlogic GX and compatible SoCs
  - amlogic,meson-axg-spicc # SPICC controller on Amlogic AXG and
compatible SoCs

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    description: phandle of the internal reset line

Standard property, don't need a description unless there's something
special about this binding.

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

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

These 2 can be dropped as they are covered by spi-controller.yaml.

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

Probably should add a slave node. Once I figure out how to always
build the examples with W=12, the lack of a chlid node will throw a
dtc warning.

> +    };
> +
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> new file mode 100644
> index 000000000000..5f34aed1ad40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml

Some of the same comments apply to this one.

> @@ -0,0 +1,57 @@
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
> +    oneOf:
> +     - enum:
> +       - amlogic,meson6-spifc
> +     - enum:
> +       - amlogic,meson-gxbb-spifc

Drop the oneOf. A single enum is sufficient.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +examples:
> +  - |
> +    spi@c1108c80 {
> +          compatible = "amlogic,meson6-spifc";
> +          reg = <0xc1108c80 0x80>;
> +          clocks = <&clk81>;
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +    };
> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
