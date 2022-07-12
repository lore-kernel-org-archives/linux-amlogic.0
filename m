Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B756C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jul 2022 07:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZYCN29toGN3FDKdMuihXnC5fJkTijXyG2A0r7lKzmU=; b=Ghp73k96z7GRUJ
	K/H+RidAt8FFJ+x1GtMC3m+94AwiPfsNCuYUUzclQs8OkH7OGvFNwKbFXvUr1okwxKD88IdvHHx68
	rRKIPFbmsyGbq8h14zONWx/OhNachPq/FDNxTuhqtgB8sMjkZw3TKjg41Sz9Uyk8iAu4Z0Dk7JSNH
	Q0m/lNqHaO2NlYvpvmYIi0aDrJvHUwXCNg+/5C8pM9skJbtBp1YaCTNHp6MHFYgqA5o8/KhorHHan
	FODCZ8bt62taDJfZ6XzTthFhqTDKlfW0iOyHSyC8qDOWD6j1aN2A+ZUgetEk2ksHLO7mMwqYGla9P
	CXnn8ATQjRX2lg0UrkhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBA7a-008GyL-EI; Tue, 12 Jul 2022 07:15:50 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBA7P-008GsA-Ho
	for linux-amlogic@lists.infradead.org; Tue, 12 Jul 2022 07:15:42 +0000
Received: by mail-lf1-x131.google.com with SMTP id e28so8847906lfj.4
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Jul 2022 00:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nsCsUCsLeks7gLQjyy032kLwCiyMm8kobhR40LxLfCE=;
        b=fP1az/JP9d5e2iu960Ic2C2JTKpsqA318fncQOEWI9lQMTMo+xqjwtxRR9GzAJl9T1
         waUAo5RWk2oP0WP1wxNQcNwoQoOTqyFpWexrqawczTQ88goI0jJ+pi5UkvaqFbe06xLo
         4Zpu5I/bS5dsF/jj/997rgIvJlDmKF/Dc7mEpXgMnnlpf6oNR1Ty9VGOSLn87BcCFbfZ
         3Ss5NS6m0EcKYvxggwyTvMWQIdvFJGS5SswRD0E/ErY4YjPP8gjp+H8+0q5uEa3ZSEHj
         Aiw4zbELh/Bi1yjMrdRBMOBqEDgxfWUAvDTocnRPXWW/y6ZiM6KJ/CL8NYwcZ3iCF5Rv
         JEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nsCsUCsLeks7gLQjyy032kLwCiyMm8kobhR40LxLfCE=;
        b=KHQGHnCCFZf1kqXdnNpTDZM438sMdQ54uuT8hi1i8yr7WXAfEW8aIfmH93AShbUT1f
         kUf1istpHiW8k797kKwYFxntyNQ3dipMF1IXA4GA85zAQjY16aDTbRz0ETkN4msH7PEf
         4kMAWv32J2pncmubIM569rrG/54cOoJn/6rOd6lnIZz3j1vdfHjRU7jV6lZ7Je2HTnjU
         T2ml1wLFF9FfIeZO55ksZkMKo04VYbyKjb5iz4785669Qw7Mj4HOP1KzX/6CQD1uHdN2
         yJfwdg06m3PPRmGrTB/SNsCwzWVMJZzO1UNfq7D7qmKPRJaIL0sxaMROpD4JnT4hdWqW
         3Ivg==
X-Gm-Message-State: AJIora9971Y0Qf9/RBCsKKKXW3wI4FVlveDM7ODrQEGaM8c2S8Aw86l7
	wAaUCCbpBw9hWo1hCSXQr42biA==
X-Google-Smtp-Source: AGRyM1spCUHNkLtF0Uo+VDAZEfXmPYq1704v0M4hpSxhTZ9ocQTZspqz/bbrl5COvtkZ1IRDf9Mtng==
X-Received: by 2002:a05:6512:45b:b0:489:cf49:4623 with SMTP id y27-20020a056512045b00b00489cf494623mr8890654lfk.266.1657610135495;
        Tue, 12 Jul 2022 00:15:35 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id r6-20020ac25c06000000b00483f8c40c17sm2003762lfp.240.2022.07.12.00.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 00:15:34 -0700 (PDT)
Message-ID: <1aa8e9aa-8cb3-8537-6d65-dd9441d5ee07@linaro.org>
Date: Tue, 12 Jul 2022 09:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] dt-binding:perf: Add Amlogic DDR PMU
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
References: <20220712063641.2790997-1-jiucheng.xu@amlogic.com>
 <20220712063641.2790997-4-jiucheng.xu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712063641.2790997-4-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_001539_648582_E732AC29 
X-CRM114-Status: GOOD (  17.38  )
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

On 12/07/2022 08:36, Jiucheng Xu wrote:
> Add binding documentation for the Amlogic G12 series DDR
> performance monitor unit.

You need to fix subject - use a prefix matching subsystem. Space after
each ':'.

> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
>  .../devicetree/bindings/perf/aml-ddr-pmu.yaml | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml
> new file mode 100644
> index 000000000000..c586b4ab4009
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/aml-ddr-pmu.yaml

Filename: aml,g12-ddr-pmu.yaml

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

This does not make any sense. Why do you use two compatibles
"aml,g12-ddr-pmu", "aml,g12-ddr-pmu" after each other?

> +
> +  reg:
> +    maxItems: 2

You need to describe the items.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - model
> +  - dmc_nr
> +  - chann_nr

How these ended up here?
No underscores.

> +  - reg
> +  - interrupts
> +  - interrupt-names

Also something new. No.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +          ddr_pmu: ddr_pmu {

Wrong indentation. 4 spaces for DTS example.

Generic node name, so "pmu", no underscores in node names.

> +                  compatible = "amlogic,g12-ddr-pmu";
> +                  model = "g12a";
> +                  dmc_nr = <1>;
> +                  chann_nr = <4>;

This does not pass the test. Please do not send untested bindings.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
