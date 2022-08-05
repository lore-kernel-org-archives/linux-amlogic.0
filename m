Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB859C25B08
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1en+L5pO5akzCPnoiEMmeLD/RXEsXusx8cC1u/SVzo=; b=32TE3R5GRzzLd9
	FPyzy60jV/j07wjlC7JI8lBR8dr5tqhBfntcuzrogSjXoHnBuWInJBMek1dcTcgB9dLdwrJn36vVH
	uvVTZ8JUxhk+h1OgTHdV6lZzvnZx6+ekTJM93wRuUz2dyiFDGNSV9vTpqUAQSMjxVeAa3zGXhQ1ew
	e7/w5uh6iqAeHk20J3gPL1ZGjjiWwjHydolVfhPUb8BB8OkaK3pU3izRkeCkbQ9JORRI/+5F4f9Ch
	hbW8vi2jg1vk9FYMCAPYmfNa4dUND5zgWg7Ovp15MxkjzqT0YsgHyZJ6Xb0EU7WjxE16DmuIRIeH+
	JuEZ5XJrVWB9rgVYqIZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJsaZ-00D7xT-Jl; Fri, 05 Aug 2022 08:21:47 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJsaV-00D7vU-W1
	for linux-amlogic@lists.infradead.org; Fri, 05 Aug 2022 08:21:45 +0000
Received: by mail-lf1-x133.google.com with SMTP id u1so2427534lfq.4
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Aug 2022 01:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SBUuFiz/VDWMI2OJalxtSfG/SXidOC9PQ998o7vzahU=;
        b=Nb6sBy9TLlxKcxgL0XerQ6xLCQKP8U2euxXhT7Uu8LrpSwyRU3Hp/7+LTAn2EcPH9n
         zdVc1OZzG21bCg3JXuaGY3N2vx2gWeoQndeYh2NKPnrxXAEJ60Wo3MogTGswwQvxS7rD
         aJ9h7bkl+DiiRgqG3lwLFbh2pMxEJ4IRTWbKEhRVzmnKhrIM84WimPhwnlA7zkanCCr8
         4QqTY2z1hpZxbnGnODJVR0pq4NZNmUGl8xCi0rkJmZrRcYDog7XSvy+IbiYKS7LGf0LG
         6Oih3+kshSZ2nrJZS+aeQR4lO7PvUGoQNewdNM115HlvWXxBK1kJir8lXLmVrjK9zHMv
         nOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SBUuFiz/VDWMI2OJalxtSfG/SXidOC9PQ998o7vzahU=;
        b=HD5rFqFw6WF5/JZKb7i7tSenQJDPA1sdQDILugnCEuBG5VJXaHzTtiiz2fmypRjYVF
         WFxUBcn1t4eQtchEO0+6aq0q39kWJyDOlemGQ3s9WwlIt6UTLD0J7n5DT4aGp9zPkCtA
         uQmlHWjRPQJ2XAAxSquMcO1bAemoKNlUc0q16P9Ff20dvzbgYOV9oTSFAIKHrHhXHCK5
         qW0OTqXmopSQ3s3LRrMZjCdb0CAY6A/JjGQwOvMGcE6z4OGmeVLnJIGY2SSZgbrCJnF9
         C74f8aiDU++X8UMAogI2hAZBshxwe12srBXG8LVY8oEa33TlprhphJ4pqNajFdfVfhkJ
         TYsA==
X-Gm-Message-State: ACgBeo29mDBtPtvXCVDgJQ1ILdqB8FEA0/R32fKQNBI8sR/5KIhCXi+M
	TS9+/Tk1ND6+XPXECPjRfJu2Tg==
X-Google-Smtp-Source: AA6agR4Sz+5EXQ1U2l6iQKUZo4mMFmM29ugOmMqyrB6IqERZVbLuRtXk27pb4Dk2YrqAQI9Ne5OWIw==
X-Received: by 2002:a05:6512:3d9f:b0:48b:965:71be with SMTP id k31-20020a0565123d9f00b0048b096571bemr1899268lfv.461.1659687699326;
        Fri, 05 Aug 2022 01:21:39 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id x12-20020a056512078c00b0048b4690c78esm125510lfr.288.2022.08.05.01.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 01:21:38 -0700 (PDT)
Message-ID: <a3cd55ad-cec2-9570-2078-6724ab1d7300@linaro.org>
Date: Fri, 5 Aug 2022 10:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 4/4] dt-binding: perf: Add Amlogic DDR PMU
Content-Language: en-US
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
References: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
 <20220805071426.2598818-4-jiucheng.xu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805071426.2598818-4-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_012144_099798_AC5113DB 
X-CRM114-Status: GOOD (  19.24  )
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

On 05/08/2022 09:14, Jiucheng Xu wrote:
> Add binding documentation for the Amlogic G12 series DDR
> performance monitor unit.
> 

Bindings go first in the series, before their implementation.

> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
> Changes v3 -> v4:
>   - Fix "$id: relative path/filename doesn't match actual path or
>     filename" warning
> 
> Changes v2 -> v3:
>   - Remove oneOf
>   - Add descriptions
>   - Fix compiling warning
> 
> Changes v1 -> v2:
>   - Rename file, from aml_ddr_pmu.yaml to amlogic,g12_ddr_pmu.yaml
>   - Delete "model", "dmc_nr", "chann_nr" new properties
>   - Fix compiling error
> ---
>  .../bindings/perf/amlogic,g12-ddr-pmu.yaml    | 52 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
> new file mode 100644
> index 000000000000..4d018574ffd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/amlogic,g12-ddr-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic G12 DDR performance monitor
> +
> +maintainers:
> +  - Jiucheng Xu <jiucheng.xu@amlogic.com>
> +
> +description: |
> +  Amlogic G12 series SoC integrate DDR bandwidth monitor.
> +  A timer is inside and can generate interrupt when timeout.
> +  The bandwidth is counted in the timer ISR. Different platform
> +  has different subset of event format attribute.
> +
> +properties:
> +  compatible:
> +    items:

You have only one item, so remove "items".

> +      - enum:
> +          - amlogic,g12b-ddr-pmu
> +          - amlogic,g12a-ddr-pmu
> +          - amlogic,sm1-ddr-pmu
> +
> +  reg:
> +    items:
> +      - description: Physical address of DMC bandwidth register
> +          and size of the configuration address space.

Skip obvious pieces, so only:

description: DMC bandwidth register space

> +      - description: Physical address of DMC PLL register and
> +          size of the configuration address space.

description: DMC PLL bandwidth register space


> +
> +  interrupts:
> +    items:
> +      - description: The IRQ of the inside timer timeout.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    ddr_pmu@ff638000 {

No underscores in node names, generic node names, so just "pmu".
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "amlogic,g12a-ddr-pmu";
> +        reg = <0xff638000 0x100
> +               0xff638c00 0x100>;

This is still not fixed. Binding says you have two items, but you
declared here only one item.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
