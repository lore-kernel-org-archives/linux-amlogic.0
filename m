Return-Path: <SRS0=gULv=G5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DCD9C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jan 2021 15:42:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1113B206A5
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jan 2021 15:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1113B206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Ylc8li7gO6ShDTrPHLoCECVUUB1lAGVM+aVxv4iANw=; b=i9IZguaXwB621Jl4L6Bs6ZWb3
	flj3bIesX3DeDdVNhpu6r2CMUTUWWomTBBxmRFGwQKaonZIaB+wj9nx2KpTU4lDOhVjBVqRTTCsP3
	c16+/G+KzZCSfKQAi9K2uivXwWTFZaMaUWfnG/D9U5cKP1AvcOyO6hpKxmcZJIzqZasOebcnE5iE4
	ROhV8qOCGW+EuE8z6aVQxLLV9A3JHgiBQV8vFW+uw6xAS/nBmCURFeg2/4ABefemkXIgyHzRnaLF7
	LQUxbd7Rk+UTuzchrHqdgakWAmD1c1QfkHoBrfwk753BRG0egsVPA3I2GTR0j+impZ13CTeyj7oCW
	hwnKwqp9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4QUS-0004tX-BD; Tue, 26 Jan 2021 15:42:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4QUP-0004sR-Cv; Tue, 26 Jan 2021 15:42:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A8A92311C;
 Tue, 26 Jan 2021 15:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611675764;
 bh=yQoMRGi5PdjwxvIyMrxoV2bK3IlRzoWkiHHKm3zY+FI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NiKDpU7btcGkRCx/S+NoBjcOvv/ZyB46/2G8nBpeBa1hKksq/5/vU+wJtImwbarXu
 5NN6snx790B3zfcKOgLukDFVnn8nF27CWGIvgN7PVdm7OeXqEfcGc/zllxvuFx/u4h
 nk9jZQ9GJ7ypS0+haIeSmsbVfcs4X6z1kgOkd1Q9eF73bOCj2ZcjUu2I3NfAQcwjUC
 z1NBgsVpTERv3taC+gKQoQQ+13HuobfYFuNQdlcmQKnP2jRB1LQtWnzLPdy588YcA4
 Ly0p445MzdSXmCIA00VCQ+6O5jmId5LNaAxG8bp+aKMFQslDubceaYFh7GBNBZkjGx
 NFR1tuum32J6g==
Received: by mail-ej1-f50.google.com with SMTP id g12so23592004ejf.8;
 Tue, 26 Jan 2021 07:42:44 -0800 (PST)
X-Gm-Message-State: AOAM533XAU/GJHY+o7ISivOvAOqYe0tGvBsWTg1beEB19vpgLeIRVMsQ
 xzZ1Ah+AwG3nqat049i7pqvFRx9Fr+NK0aMRhQ==
X-Google-Smtp-Source: ABdhPJzAO1B6HEQxoXCrUkx7cM5FMklSTeICUd2JeJwy9EL7S31MxkB/KQkUni41DZup9fORFFdpbZJkraVXHkmTi7E=
X-Received: by 2002:a17:906:ce49:: with SMTP id
 se9mr3870805ejb.341.1611675762536; 
 Tue, 26 Jan 2021 07:42:42 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611645945.git.mchehab+huawei@kernel.org>
 <55f479324098b66d7dba89c8f9c3e455731df4f7.1611645945.git.mchehab+huawei@kernel.org>
In-Reply-To: <55f479324098b66d7dba89c8f9c3e455731df4f7.1611645945.git.mchehab+huawei@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 26 Jan 2021 09:42:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLfTxqUtFxbkojaUevCgg5V-StBkhXC4Fwx0Vh9NRougw@mail.gmail.com>
Message-ID: <CAL_JsqLfTxqUtFxbkojaUevCgg5V-StBkhXC4Fwx0Vh9NRougw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] dt: pci: designware-pcie.txt: convert it to yaml
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_104245_558008_0A3EABF9 
X-CRM114-Status: GOOD (  31.80  )
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, PCI <linux-pci@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 1:35 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Convert the file into a JSON description at the yaml format.

json-schema, not JSON really. I prefer just 'DT schema' which implies
json-schema in yaml file format.

This one is a bit tricky and suspect it needs a few others converted
to get right. Not asking for that yet, just keep that in mind.

>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../bindings/pci/amlogic,meson-pcie.txt       |   4 +-
>  .../bindings/pci/axis,artpec6-pcie.txt        |   2 +-
>  .../bindings/pci/designware,pcie.yaml         | 194 ++++++++++++++++++

snps,dw-pcie.yaml

>  .../bindings/pci/designware-pcie.txt          |  77 -------
>  .../bindings/pci/fsl,imx6q-pcie.txt           |   2 +-
>  .../bindings/pci/hisilicon-histb-pcie.txt     |   2 +-
>  .../bindings/pci/hisilicon-pcie.txt           |   2 +-
>  .../devicetree/bindings/pci/kirin-pcie.txt    |   2 +-
>  .../bindings/pci/layerscape-pci.txt           |   2 +-
>  .../bindings/pci/nvidia,tegra194-pcie.txt     |   4 +-
>  .../devicetree/bindings/pci/pci-armada8k.txt  |   2 +-
>  .../devicetree/bindings/pci/pci-keystone.txt  |  10 +-
>  .../devicetree/bindings/pci/pcie-al.txt       |   2 +-
>  .../devicetree/bindings/pci/qcom,pcie.txt     |  14 +-
>  .../bindings/pci/samsung,exynos5440-pcie.txt  |   4 +-
>  .../pci/socionext,uniphier-pcie-ep.yaml       |   2 +-
>  .../devicetree/bindings/pci/ti-pci.txt        |   4 +-
>  .../devicetree/bindings/pci/uniphier-pcie.txt |   2 +-
>  MAINTAINERS                                   |   2 +-
>  19 files changed, 225 insertions(+), 108 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/designware,pcie.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pci/designware-pcie.txt


> diff --git a/Documentation/devicetree/bindings/pci/designware,pcie.yaml b/Documentation/devicetree/bindings/pci/designware,pcie.yaml
> new file mode 100644
> index 000000000000..e610ed073789
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/designware,pcie.yaml
> @@ -0,0 +1,194 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/designware,pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare PCIe interface
> +
> +maintainers:
> +  - Jingoo Han <jingoohan1@gmail.com>
> +  - Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> +
> +description: |
> +  Synopsys DesignWare PCIe host controller
> +
> +properties:
> +  compatible:
> +    description: |
> +      The compatible can be either:
> +      - snps,dw-pcie       # for RC mode
> +      - snps,dw-pcie-ep    # For EP mode
> +      or some other value, when there's a host-specific driver

Needs to be a schema. This is complicated because sometimes it's used
and sometimes not. So we need something like this:

anyOf:
  - {}
  - items:
      contains:
        enum:
          - snps,dw-pcie
          - snps,dw-pcie-ep

This will always be true, but at least documents the strings in a
parseable form.

> +
> +  reg:
> +    description: |
> +      For designware cores version < 4.80 contains the configuration
> +      address space. For designware core version >= 4.80, contains
> +      the configuration and ATU address space

And DBI for all versions.


> +    maxItems: 4

minItems: 2

(dbi and config must always be there)

> +
> +  reg-names:
> +    description: |
> +      Must be "config" for the PCIe configuration space and "atu" for
> +      the ATU address space.
> +      (The old way of getting the configuration address space from
> +      "ranges" is deprecated and should be avoided.)

This is getting dropped from the driver and can be dropped here. This
only existed for a few months back in 2013.

> +    maxItems: 4

minItems: 2
items:
  contains:
    enum: [ dbi, dbi2, config, atu ]

> +
> +  num-lanes:
> +    description: |
> +      number of lanes to use (this property should be specified unless
> +      the link is brought already up in BIOS)
> +    maxItems: 1

Not an array. IIRC, pci-bus.yaml covers this. If not, needs a type ref
and min/max (1-16).

> +
> +  reset-gpio:
> +    description: GPIO pin number of power good signal

Isn't this the PERST# signal?

> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      Must contain an entry for each entry in clock-names.
> +      See Documentation/devicetree/bindings/clock/clock-bindings.txt for
> +      details.

This is every 'clocks', drop.

> +    minItems: 2
> +    maxItems: 8
> +
> +  clock-names:
> +    description: |
> +      Must include the following entries:
> +      - "pcie"
> +      - "pcie_bus"

Need to be in a schema.

> +    minItems: 2
> +    maxItems: 8
> +
> +  "snps,enable-cdm-check":
> +    $ref: /schemas/types.yaml#definitions/flag
> +    description: |
> +      This is a boolean property and if present enables
> +      automatic checking of CDM (Configuration Dependent Module) registers
> +      for data corruption. CDM registers include standard PCIe configuration
> +      space registers, Port Logic registers, DMA and iATU (internal Address
> +      Translation Unit) registers.
> +

> +  # The following are mandatory properties for RC Mode
> +
> +  "#address-cells":
> +    const: 3
> +
> +  "#size-cells":
> +    const: 2
> +
> +  device_type:
> +    const: pci
> +
> +  ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      ranges for the PCI memory and I/O regions
> +    minItems: 1
> +    maxItems: 8
> +
> +  "#interrupt-cells":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 1
> +
> +  interrupt-map-mask:
> +    description: |
> +      Standard PCI properties to define the mapping of the PCIe
> +      interface to interrupt numbers.
> +
> +  interrupt-map:
> +    description: |
> +      Standard PCI properties to define the mapping of the PCIe
> +      interface to interrupt numbers.

pci-bus.yaml already covers these. Drop and reference pci-bus.yaml

> +
> +  # The following are optional properties for RC mode
> +
> +  num-viewport:
> +    description: |
> +      number of view ports configured in hardware. If a platform
> +      does not specify it, the driver assumes 2.

This is detected now and can be marked 'deprecated'.

> +
> +  bus-range:
> +    description: |
> +      PCI bus numbers covered (it is recommended for new devicetrees
> +      to specify this property, to keep backwards compatibility a range of
> +      0x00-0xff is assumed if not present)

Covered by pci-bus.yaml.

> +
> +  # The following are mandatory properties for EP Mode
> +
> +  num-ib-windows:
> +    description: number of inbound address translation windows
> +    maxItems: 1
> +
> +  num-ob-windows:
> +    description: number of outbound address translation windows
> +    maxItems: 1

These 2 are detected now and can be marked 'deprecated'.

> +
> +  # The following are optional properties for EP mode
> +
> +  max-functions:
> +    description: maximum number of functions that can be configured
> +    maxItems: 1

Not an array.

> +
> +required:
> +  - reg
> +  - reg-names
> +  - compatible
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: snps,dw-pcie
> +    then:
> +      required:
> +        - compatible
> +        - "#address-cells"
> +        - "#size-cells"
> +        - device_type
> +        - ranges
> +        - "#interrupt-cells"
> +        - interrupt-map-mask
> +        - interrupt-map

All these are required for all pci hosts.


> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: snps,dw-pcie-ep
> +    then:
> +      required:
> +        - compatible
> +        - num-ib-windows
> +        - num-ob-windows
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pcie: pcie@dfc00000 {
> +      compatible = "snps,dw-pcie";
> +      reg = <0xdfc00000 0x0001000>, /* IP registers */
> +            <0xd0000000 0x0002000>; /* Configuration space */
> +      reg-names = "dbi", "config";
> +      #address-cells = <3>;
> +      #size-cells = <2>;
> +      device_type = "pci";
> +      ranges = <0x81000000 0 0x00000000 0xde000000 0 0x00010000
> +          0x82000000 0 0xd0400000 0xd0400000 0 0x0d000000>;
> +      interrupts = <25>, <24>;
> +      #interrupt-cells = <1>;
> +      num-lanes = <1>;
> +    };
> +    pcie_ep: pcie_ep@dfd00000 {
> +      compatible = "snps,dw-pcie-ep";
> +      reg = <0xdfc00000 0x0001000>, /* IP registers 1 */
> +            <0xdfc01000 0x0001000>, /* IP registers 2 */
> +            <0xd0000000 0x2000000>; /* Configuration space */
> +      reg-names = "dbi", "dbi2", "addr_space";
> +      num-ib-windows = <6>;
> +      num-ob-windows = <2>;
> +      num-lanes = <1>;
> +    };

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
