Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBC4C25B08
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 10:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YJ0XAh6eqjzxtuwtgNBGg+B8CXwQO2QyOcTDr1AZzEs=; b=kBKOQbHyKYcyo4
	b/PmEONp7lxrSrl7zIaK89zLx1zArKwqbA1tlAcypdUujMfxeShVTWLTi0sgxCSQmlxnUylH+g1cI
	/81jqwJS+tjoLP+/LOVqWKEzNc3sRWu8TCg16KQoXlZzsROEQMKjpwRmP2Ix4A+ry/AxXnxNKQmAT
	ECWXb3MtyNjodMMcKZbuMVyEYMECSB0WkZE7ULKBRzhdcO0HoB8qH2yKFZuhcZJ3DzPpg8EXxP6Eu
	zeEP+R9pBKQTG4BACFj9hSEhis9WA/pQBojLesxFRX1kwjQnrZN3WXr1Wa+O0ymmYNKwSCh+JvNkx
	ywRCvlR1nqtzqbmNbHzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJu8U-00Dqhp-8k; Fri, 05 Aug 2022 10:00:54 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJu8C-00DqXf-Cd; Fri, 05 Aug 2022 10:00:38 +0000
Received: from [10.88.19.200] (10.88.19.200) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.6; Fri, 5 Aug 2022
 18:00:31 +0800
Message-ID: <880842a1-a769-f228-7c91-5402e6d9391e@amlogic.com>
Date: Fri, 5 Aug 2022 18:00:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v4 4/4] dt-binding: perf: Add Amlogic DDR PMU
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
References: <20220805071426.2598818-1-jiucheng.xu@amlogic.com>
 <20220805071426.2598818-4-jiucheng.xu@amlogic.com>
 <a3cd55ad-cec2-9570-2078-6724ab1d7300@linaro.org>
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <a3cd55ad-cec2-9570-2078-6724ab1d7300@linaro.org>
X-Originating-IP: [10.88.19.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_030036_910591_110A7E9B 
X-CRM114-Status: GOOD (  16.46  )
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


On 2022/8/5 16:21, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 05/08/2022 09:14, Jiucheng Xu wrote:
>> Add binding documentation for the Amlogic G12 series DDR
>> performance monitor unit.
>>
> Bindings go first in the series, before their implementation.
>
>> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
>> ---
>> Changes v3 -> v4:
>>    - Fix "$id: relative path/filename doesn't match actual path or
>>      filename" warning
>>
>> Changes v2 -> v3:
>>    - Remove oneOf
>>    - Add descriptions
>>    - Fix compiling warning
>>
>> Changes v1 -> v2:
>>    - Rename file, from aml_ddr_pmu.yaml to amlogic,g12_ddr_pmu.yaml
>>    - Delete "model", "dmc_nr", "chann_nr" new properties
>>    - Fix compiling error
>> ---
>>   .../bindings/perf/amlogic,g12-ddr-pmu.yaml    | 52 +++++++++++++++++++
>>   MAINTAINERS                                   |  1 +
>>   2 files changed, 53 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
>> new file mode 100644
>> index 000000000000..4d018574ffd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
>> @@ -0,0 +1,52 @@
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
>> +description: |
>> +  Amlogic G12 series SoC integrate DDR bandwidth monitor.
>> +  A timer is inside and can generate interrupt when timeout.
>> +  The bandwidth is counted in the timer ISR. Different platform
>> +  has different subset of event format attribute.
>> +
>> +properties:
>> +  compatible:
>> +    items:
> You have only one item, so remove "items".
>
>> +      - enum:
>> +          - amlogic,g12b-ddr-pmu
>> +          - amlogic,g12a-ddr-pmu
>> +          - amlogic,sm1-ddr-pmu
>> +
>> +  reg:
>> +    items:
>> +      - description: Physical address of DMC bandwidth register
>> +          and size of the configuration address space.
> Skip obvious pieces, so only:
>
> description: DMC bandwidth register space
>
>> +      - description: Physical address of DMC PLL register and
>> +          size of the configuration address space.
> description: DMC PLL bandwidth register space
>
>
>> +
>> +  interrupts:
>> +    items:
>> +      - description: The IRQ of the inside timer timeout.
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
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    ddr_pmu@ff638000 {
> No underscores in node names, generic node names, so just "pmu".
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>
>> +        compatible = "amlogic,g12a-ddr-pmu";
>> +        reg = <0xff638000 0x100
>> +               0xff638c00 0x100>;
> This is still not fixed. Binding says you have two items, but you
> declared here only one item.

Okay, I will change it as your comments.


> Best regards,
> Krzysztof
>
-- 
Thanks,
Jiucheng


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
