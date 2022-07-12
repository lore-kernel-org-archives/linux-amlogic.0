Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3CBC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jul 2022 12:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXecJoJn2l1/camBVfGzJ+LvUcoNrFW6LyeFUyJfAK0=; b=Zy4BKwQAXsZQD6
	C3F9qqxS17e6nSgYzQCgWlekRs4GEFH5dEMaYZ1MJR9OEcEGwaCwAuu1HL2YKFvF6FvwK7ukeFUNt
	f3Poiw4YITX56JsmPJOtECa7K0rjNa9ckSg2LIUBVH5mOpukZL/3ei22TYm1Uggrz+qmaKbc6FIHf
	a7QS0KNi0SIc+YZQCCmIj77PePu++OaDBCGbo3q/dM6LB5NVFvzsO2dg6k9u9yhg2Q9tvek1luzjM
	N4/xdaF6m+piz20mXwOxP5waI7sMb0xS6j79QsiG9zadLNTmh9/TEN0iKS7Wf0/Xz92y89HvM4Sqa
	Wh5UXRijrmPa2OZNU6PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBFPb-00B9fR-KD; Tue, 12 Jul 2022 12:54:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBFPW-00B9bM-Ps; Tue, 12 Jul 2022 12:54:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1A1D1596;
	Tue, 12 Jul 2022 05:54:41 -0700 (PDT)
Received: from [10.57.85.194] (unknown [10.57.85.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D11B3F70D;
	Tue, 12 Jul 2022 05:54:39 -0700 (PDT)
Message-ID: <94ab770b-8a8a-4299-a54e-2ff77afb9e04@arm.com>
Date: Tue, 12 Jul 2022 13:54:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] dt-binding:perf: Add Amlogic DDR PMU
Content-Language: en-GB
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>
References: <20220712063641.2790997-1-jiucheng.xu@amlogic.com>
 <20220712063641.2790997-4-jiucheng.xu@amlogic.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220712063641.2790997-4-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_055443_001611_08E64C2D 
X-CRM114-Status: GOOD (  18.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2022-07-12 07:36, Jiucheng Xu wrote:
> Add binding documentation for the Amlogic G12 series DDR
> performance monitor unit.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
>   .../devicetree/bindings/perf/aml-ddr-pmu.yaml | 51 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   2 files changed, 52 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
> new file mode 100644
> index 000000000000..c586b4ab4009
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/aml-ddr-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic G12 DDR performance monitor
> +
> +maintainers:
> +  - Jiucheng Xu <jiucheng.xu@amlogic.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - aml,g12-ddr-pmu
> +      - items:
> +          - enum:
> +              - aml,g12-ddr-pmu
> +          - const: aml,g12-ddr-pmu

Judging by what the driver actually implements, this should probably be:

   compatible:
     items:
       - enum:
         - amlogic,g12a-ddr-pmu
         - amlogic,g12b-ddr-pmu
         - amlogic,sm1-ddr-pmu
       - const: amlogic,g12-ddr-pmu

There doesn't seem much point in allowing only the common compatible 
without a SoC-specific identifier. Note also that "aml," is not the 
documented vendor prefix.

> +
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - model

Remove this, and use the compatible strings properly as above.

> +  - dmc_nr
> +  - chann_nr

I suspect those could probably be inferred from the correct compatible 
string, but if not (i.e. within one SoC you have multiple PMUs 
supporting the same events but with different numbers of usable 
channels), then document what exactly they mean.

> +  - reg
> +  - interrupts
> +  - interrupt-names

As mentioned in the driver review, if you really want to use a named 
interrupt (which should usually be unnecessary when there's only one), 
it has to be a defined name. DT is not a mechanism for overriding what 
Linux shows in /proc/interrupts.

Thanks,
Robin.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +          ddr_pmu: ddr_pmu {
> +                  compatible = "amlogic,g12-ddr-pmu";
> +                  model = "g12a";
> +                  dmc_nr = <1>;
> +                  chann_nr = <4>;
> +                  reg = <0x0 0xff638000 0x0 0x100
> +                         0x0 0xff638c00 0x0 0x100>;
> +                  interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
> +                  interrupt-names = "ddr_pmu";
> +          };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd2a56a339b4..ac0a1df4622d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1055,6 +1055,7 @@ M:	Jiucheng Xu <jiucheng.xu@amlogic.com>
>   S:	Supported
>   W:	http://www.amlogic.com
>   F:	Documentation/admin-guide/perf/aml-ddr-pmu.rst
> +F:	Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
>   F:	drivers/perf/amlogic/
>   F:	include/soc/amlogic/
>   

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
