Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565F7C00140
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Aug 2022 09:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HorSu4n2AZZWSySoY6zoi/84TPHpen/PMFIPPawWUPc=; b=lGFrvvZTzt0JMH
	xcDch9iCW9kZjGIFbLpdOi9qIMecedK5aVroeI5jVZFBNC3RItyPngroPrSHVCOCGoL8kvJs2qNlV
	wXCL9gQDCXMYM4+iZM55fNx5Xj5z5KAtdOhBsEPr6Ijy/zMAlWU6sh0nlhuZQEIqiY2AU3N/98bj9
	JloPN7ZYA/bUcr26R8PMFrKhoX2hALgv2OpgiUROYx5R+1haPNe1ixBI3gocMuxU7iCpGrTfoAgA8
	mrPhq2LGSZ2i0ABtQUzgtN+XZ7XdUentleyIBvWfJvEPE2UetmC1UQj+hmA0PRS2aWGIDYslhHk5v
	i4kV9bHSXBidSnTpG+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIoA8-00CMap-CN; Tue, 02 Aug 2022 09:26:04 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIo9j-00CMDA-4i; Tue, 02 Aug 2022 09:25:41 +0000
Received: from [10.88.19.200] (10.88.19.200) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.6; Tue, 2 Aug 2022
 17:25:28 +0800
Message-ID: <bafb824a-d450-b4d3-20a9-026dccaca2cd@amlogic.com>
Date: Tue, 2 Aug 2022 17:25:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v3 4/4] dt-binding: perf: Add Amlogic DDR PMU
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
References: <20220801060049.1655177-1-jiucheng.xu@amlogic.com>
 <20220801060049.1655177-4-jiucheng.xu@amlogic.com>
 <0893fab6-a7e1-bfa7-2497-239e044cc7ed@linaro.org>
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <0893fab6-a7e1-bfa7-2497-239e044cc7ed@linaro.org>
X-Originating-IP: [10.88.19.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_022539_430527_B077D575 
X-CRM114-Status: GOOD (  20.27  )
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


On 2022/8/2 16:04, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 01/08/2022 08:00, Jiucheng Xu wrote:
>> Add binding documentation for the Amlogic G12 series DDR
>> performance monitor unit.
>>
>> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
>> ---
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
>>   .../bindings/perf/amlogic,g12_ddr_pmu.yaml    | 51 +++++++++++++++++++
>>   MAINTAINERS                                   |  1 +
>>   2 files changed, 52 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
>> new file mode 100644
>> index 000000000000..961656d4db6e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/perf/amlogic,g12-ddr-pmu.yaml#
> You still did not test the bindings...
>
> You received such comment (with instructions how to do it) and still
> decided to send untested bindings.
>
> That's not how submission procces should look like.
>
> NAK, till you send something which you actually test.
>
>
> Best regards,
> Krzysztof

Hi Krzysztof,


Thanks for your time. I think I got a wrong understanding.

As the binding doc says, I run the following command to check:

# make dt_binding_check DT_SCHEMA_FILES=amlogic,g12_ddr_pmu.yaml ARCH=arm64

I saw the warning/errors in v2 patch, and thanks to your comments let 
them gone.

But I didn't see any warning/errors keywords printing in v3 except the 
message as below:

"$id: relative path/filename doesn't match actual path or filename".


I admit I didn't understand this prompt. I found the doc in example says 
that:

# $id is a unique identifier based on the filename. There may or may not 
be a
# file present at the URL.

So I thought that was not warning/errors prompt.

Today, I find the root cause of the warning/errors prompt.

I think I have fixed it and the building log is so quiet.


This is my first upstream patch, TBH I even didn't know what is binding 
before.

In order to upstream my driver, I try to learn how to write binding scheme.

It looks like I still did terribly.

I think my stupid misunderstanding get you angry. I'm sorry for wasting 
your time and comments.

I will re-submit v4 to fix it.

-- 
Thanks,
Jiucheng


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
