Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3E0C32771
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Aug 2022 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIFNfeH93k1WHTLjEYV0n5L9H9K+g7OqK2g625Lu6i4=; b=S0xf6ItbFd3AWt
	CpmeuwKSN6r9D8GqNnV3HNaqnXbvJyoia/37wjc9gQo1LMvoF3UepatipmdmUdN6RFg5RiLY9mw66
	ojfXqhiC7Ks1cLrIYJ0xhsvuRK4bt9/s8yI0HDVhQyFgytYiCmoNG3gi3Fv6EX9Oze5/DZU0Jq6qF
	818AwvCBBx0O48D5D1RXFsR5QgCtHCAfo9E0tZBtxCzv++eCvkad2EbjHepA3NOm2s6MReETXYaBn
	t04Tb4hhX3IUwQokrypY7ys0LisZfbftaniTHjt0OSUE00/gJO55vImVsUWY4nnGXOe2jHV5ZkQQL
	KkVbICQGQDRvFsCwfwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2Ix-0097Pm-Qg; Fri, 19 Aug 2022 13:44:55 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2Im-0097D6-Qu; Fri, 19 Aug 2022 13:44:46 +0000
Received: from [10.18.93.143] (10.18.93.143) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.6; Fri, 19 Aug 2022
 21:44:33 +0800
Message-ID: <81452c8a-623c-3668-2411-fd7c39dc4280@amlogic.com>
Date: Fri, 19 Aug 2022 21:44:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v5 3/4] dt-binding: perf: Add Amlogic DDR PMU
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
References: <20220817113423.2088581-1-jiucheng.xu@amlogic.com>
 <20220817113423.2088581-3-jiucheng.xu@amlogic.com>
 <0a10f55c-1e91-de8d-74c1-e2778841b7fc@linaro.org>
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <0a10f55c-1e91-de8d-74c1-e2778841b7fc@linaro.org>
X-Originating-IP: [10.18.93.143]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_064444_940954_AA042146 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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


On 2022/8/18 16:25, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 17/08/2022 14:34, Jiucheng Xu wrote:
>> Add binding documentation for the Amlogic G12 series DDR
>> performance monitor unit.
>>
>> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> (...)
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
>> +    pmu {
>> +        #address-cells=<2>;
>> +        #size-cells=<2>;
>> +
>> +        pmu@ff638000 {
>> +
> No need for blank line.
>
>> +            compatible = "amlogic,g12a-ddr-pmu";
>> +            reg = <0x0 0xff638000 0x0 0x100>,
>> +                  <0x0 0xff638c00 0x0 0x100>;
>> +            interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
>> +        };
>> +    };
> With above fixed:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your valuable comments and I learn a lot from them.

One more question, do you mean after modify the above two places

I could resubmit V6 as the final patch which include your reviewed tag?

>
>
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
