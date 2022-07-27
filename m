Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA97AC19F21
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jul 2022 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnY54lOTJYk730tWS1QeOVMz1Wk8rmKXQHyL26iqlGM=; b=VlEdiFILhvHnz7
	O0g4rmOVKKKU8wqL0OehOGGPRNJxxUzF8/5QtZaGb+yDA1QGcVkJ9Nt66sUjY+araVkK3u9raN/5s
	/QECPud7v0uvtdZ0a6F7txB5UmESmSd3Mu63Nc3Nn/dgY2VTVmuuYWYEt+fvJ61o0mn/0fOX8pVGH
	04ZCzawB2APJD9ervaLulDQlj29vLJ7rClnlin9lbwY2P/6MR8tofV7qj96kt63w1QPVbCXVQEvgt
	foDVpHs/ATSZcPh+bzMHL3Iyytv2oRQjXy5gsP7GYBW3tso5YEHZJdUaBfsZw9SUyeGT4Rw+LS3Ri
	vRpR8e9SvWXqkkFNS6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbB1-00AMIE-BB; Wed, 27 Jul 2022 07:09:51 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGbAq-00AM9n-5K
	for linux-amlogic@lists.infradead.org; Wed, 27 Jul 2022 07:09:41 +0000
Received: by mail-lf1-x12e.google.com with SMTP id m12so24732866lfj.4
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Jul 2022 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=sf552mPgsYsMMY77D6I22t6pOm3pYqj+viQ1dNWKK5Y=;
        b=EfnhCF1HreZcHUhmcuTEdf5fbkyhxucRe3fJfSFtwTZWrOY13nsmnZ+wNMgulF9/Yg
         ZvAGrjaDWwAroarDr488fTcmkBt9bhxbVdDi4oXgdx/brzjoYGoXFXlzCFyQzm44FVwt
         FaMhloIL+26SxhgumPbvBuklERDDB3C087quGwBo9fQ+YiXR5XdPgazPeacSV/GORF32
         4eCNIukD7o3XxCX0j24tll/lsG+h7ZMiJ+jBIYPHvUqf5/jDj6jGF82JPPDpGuigjK4a
         XN88b60O6GaKttciEsllHHhmPDsCd2Yg1Va+uZpx9jLMD6UDv8cflOkrZtyKMK3Ql4Gj
         XC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sf552mPgsYsMMY77D6I22t6pOm3pYqj+viQ1dNWKK5Y=;
        b=U+PjvCFW27cHefpBBMQY8I6uyOUpiX/pIqMi7AWRm0BSkpY4fCJMQ5jwTfI814KXQe
         mnyYFvJXVYNq7FD+e18ChkBOf/e/qbIiBCEKx5B9/jivRDFWWEE4vZNRb8DA6z5WR0y4
         MYXnPku/4OTG9P8iXoJ+UVivfdfYRTdOhO97v4S0qlc6KrhiPV8wROQsgWLKIJWUv2eS
         h2GYg2pcTS3awtLzVzWqDMTAyiTm/ytfNfA+bqGe5+qiSZDHG28q5Xu9pQIe+MvoaICX
         oRBY87CZ1+DzGsPOTAFte8W/u2Tsfpk5o1u6K725CkpsBXTSYKk7dvdE+nIefLhatmCQ
         p77g==
X-Gm-Message-State: AJIora8hVtyk5XsaANh078Fyv5zr0RKmU2FcvZJVnbbwgk0QTKTcK2Pl
	HcXC92vtVzltqyledhkevpFVqg==
X-Google-Smtp-Source: AGRyM1uK9oExglPVaieaOMc4kk1/xZEEBcnjm26EnaG/q9CwC/wwPOx6aSi4/p5zLo9Ml3qvDo2oww==
X-Received: by 2002:a05:6512:3045:b0:48a:7635:ff22 with SMTP id b5-20020a056512304500b0048a7635ff22mr8141679lfb.314.1658905776265;
        Wed, 27 Jul 2022 00:09:36 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id e14-20020a2e930e000000b0025e0ca6f6b8sm674048ljh.77.2022.07.27.00.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:09:35 -0700 (PDT)
Message-ID: <a45957f9-bb51-8774-8f2f-675fd8314698@linaro.org>
Date: Wed, 27 Jul 2022 09:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 4/4] dt-binding: perf: Add Amlogic DDR PMU
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
References: <20220726230329.2844101-1-jiucheng.xu@amlogic.com>
 <20220726230329.2844101-4-jiucheng.xu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726230329.2844101-4-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_000940_211011_1BAE407F 
X-CRM114-Status: GOOD (  15.73  )
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

On 27/07/2022 01:03, Jiucheng Xu wrote:
> Add binding documentation for the Amlogic G12 series DDR
> performance monitor unit.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
> Changes v1 -> v2:
>   - Rename file, from aml_ddr_pmu.yaml to amlogic,g12_ddr_pmu.yaml
>   - Delete "model", "dmc_nr", "chann_nr" new properties
>   - Fix compiling error
> ---
>  .../bindings/perf/amlogic,g12_ddr_pmu.yaml    | 45 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> 
> diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
> new file mode 100644
> index 000000000000..46ef52b61492
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
> @@ -0,0 +1,45 @@
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
> +properties:
> +  compatible:
> +    oneOf:

That's not oneOf...

> +      - items:
> +          - enum:
> +              - amlogic,g12b-ddr-pmu
> +                amlogic,g12a-ddr-pmu
> +                amlogic,sm1-ddr-pmu
> +          - const: amlogic,g12-ddr-pmu
> +
> +  reg:
> +    maxItems: 2

You need to list and describe the items.

> +
> +  interrupts:
> +    maxItems: 1
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
> +    ddr_pmu: ddr_pmu {
> +
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>

Code looks terrible...

> +
> +        compatible = "amlogic,g12a-ddr-pmu";
> +        reg = <0x0 0xff638000 0x0 0x100
> +               0x0 0xff638c00 0x0 0x100>;

That's one item. You need to separate regs.



Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
