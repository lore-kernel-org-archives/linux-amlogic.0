Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2D3C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZna83GCr6vsGJ6LtU3lSp9q3ON+qdP6hJ41CrfPxvY=; b=W9HiYeGinQ5/u4
	CzSnMA8WQ9KXRNEEm+DRUYiXKmBhaHWBxsDEMV0Qdo2X5gEvtsEYDrneYhmdAbPQkZC1G2DkTYz3g
	8IAi0BNRMPkYWCrvjl4Utt+O7XvtE8K9xL5umTBbdRyn4pb1utxS6e4XwK95lmeZtDFuXOPyzCuvp
	S0YSVAcUZzqtyximNZ8iK158w+iAzW1iburt7703f10vmzf6PLaglWjxJ1gLvoxQkI9SriXG5go8n
	guI5nSW3BtmFf9L/JxTb4aIPqhKw2Mw60Zw1ZHVL1D2zOPW1/oKfnqmhKvQRxOuC+X0l05oyTdbYr
	ZlFvK8skkZQjh23aSCYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH09x-007dnR-RT; Thu, 28 Jul 2022 09:50:25 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH09l-007dIo-3x; Thu, 28 Jul 2022 09:50:14 +0000
Received: from [10.88.19.200] (10.88.19.200) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2176.2; Thu, 28 Jul 2022
 17:49:58 +0800
Message-ID: <e539af08-5eac-9bdc-9807-936172b1b1fe@amlogic.com>
Date: Thu, 28 Jul 2022 17:50:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v2 4/4] dt-binding: perf: Add Amlogic DDR PMU
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chris Healy
	<cphealy@gmail.com>
References: <20220726230329.2844101-1-jiucheng.xu@amlogic.com>
 <20220726230329.2844101-4-jiucheng.xu@amlogic.com>
 <a45957f9-bb51-8774-8f2f-675fd8314698@linaro.org>
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <a45957f9-bb51-8774-8f2f-675fd8314698@linaro.org>
X-Originating-IP: [10.88.19.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_025013_195227_38D2700B 
X-CRM114-Status: GOOD (  14.83  )
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


On 2022/7/27 15:09, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 27/07/2022 01:03, Jiucheng Xu wrote:
>> Add binding documentation for the Amlogic G12 series DDR
>> performance monitor unit.
>>
>> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
>> ---
>> Changes v1 -> v2:
>>    - Rename file, from aml_ddr_pmu.yaml to amlogic,g12_ddr_pmu.yaml
>>    - Delete "model", "dmc_nr", "chann_nr" new properties
>>    - Fix compiling error
>> ---
>>   .../bindings/perf/amlogic,g12_ddr_pmu.yaml    | 45 +++++++++++++++++++
>>   MAINTAINERS                                   |  1 +
>>   2 files changed, 46 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
> Does not look like you tested the bindings. Please run `make
> dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>
>> diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
>> new file mode 100644
>> index 000000000000..46ef52b61492
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/perf/amlogic,g12-ddr-pmu.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic G12 DDR performance monitor
>> +
>> +maintainers:
>> +  - Jiucheng Xu <jiucheng.xu@amlogic.com>
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
> That's not oneOf...
>
>> +      - items:
>> +          - enum:
>> +              - amlogic,g12b-ddr-pmu
>> +                amlogic,g12a-ddr-pmu
>> +                amlogic,sm1-ddr-pmu
>> +          - const: amlogic,g12-ddr-pmu
>> +
>> +  reg:
>> +    maxItems: 2
> You need to list and describe the items.
>
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    ddr_pmu: ddr_pmu {
>> +
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> Code looks terrible...
>
>> +
>> +        compatible = "amlogic,g12a-ddr-pmu";
>> +        reg = <0x0 0xff638000 0x0 0x100
>> +               0x0 0xff638c00 0x0 0x100>;
> That's one item. You need to separate regs.
>
>
>
> Best regards,
> Krzysztof
Thanks for your comments. Once I thought the example DTB got generated 
means the yaml file is ok. I will learn the writing-schema. rst doc and 
modify the binding doc as your comments.

-- 
Thanks,
Jiucheng


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
