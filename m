Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4F7C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jul 2022 05:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiJ48BamzEFWUb3tdhU1MtKbph3YKcMFPFTu8gVS5Ug=; b=YK26Q03dbXH+aSYC+R3Q0v5i7Q
	odINtl47u4epINNAMYSZV7jYqk/xUlCGWL0ip9bkKWdMB51ZI8YEtteoabLCTPaXvm8EtMg3n176o
	juHX5P0/fOPsFRdn461d9q64Gzr/vJmgqlkPedkm0KTNrXUzlbpaFYhi9VoXixxV/UWXOtBVc/weM
	0szb/R98GFEVUrBP4cUvEyfwocHqFDFhws8yxy6prq/qEd3DCcSvwChnZmTeEq93D2WoP+h9xjmHA
	1Brfl+/bXr1jMvhgiNfamouFf0VZsYXtpIWfH0PVT38mBX2miy3NNtopNp2HDvGGVUh9887fGd4vj
	9RaDtESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgDL-005YG1-Q3; Tue, 19 Jul 2022 05:56:11 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgD0-005Y8d-CX; Tue, 19 Jul 2022 05:55:51 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 19 Jul
 2022 13:55:47 +0800
Message-ID: <6daf3b5c-cdf9-d5d0-894c-774b80e866ff@amlogic.com>
Date: Tue, 19 Jul 2022 13:55:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: clk: meson: add S4 SoC clock controller
 bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
References: <20220708062757.3662-1-yu.tu@amlogic.com>
 <20220708062757.3662-2-yu.tu@amlogic.com>
 <b7a33482-9bce-7ab1-43cb-3c93a5282490@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <b7a33482-9bce-7ab1-43cb-3c93a5282490@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_225550_465759_4722CCB2 
X-CRM114-Status: GOOD (  13.35  )
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

Hi Krzysztof,
	Thank you for your advice.

On 2022/7/12 17:40, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 08/07/2022 08:27, Yu Tu wrote:
>> Add new clock controller compatible and dt-bindings header for the
>> Everything-Else domain of the S4 SoC.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,gxbb-clkc.txt      |   1 +
>>   MAINTAINERS                                   |   1 +
>>   include/dt-bindings/clock/s4-clkc.h           | 354 ++++++++++++++++++
>>   3 files changed, 356 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/s4-clkc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
>> index 7ccecd5c02c1..301b43dea912 100644
>> --- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
>> @@ -12,6 +12,7 @@ Required Properties:
>>   		"amlogic,g12a-clkc" for G12A SoC.
>>   		"amlogic,g12b-clkc" for G12B SoC.
>>   		"amlogic,sm1-clkc" for SM1 SoC.
>> +		"amlogic,s4-clkc" for S4 SoC.
>>   - clocks : list of clock phandle, one for each entry clock-names.
>>   - clock-names : should contain the following:
>>     * "xtal": the platform xtal
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c1abc53f9e91..e4ca46c5c8a1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>>   F:	drivers/clk/meson/
>>   F:	include/dt-bindings/clock/gxbb*
>>   F:	include/dt-bindings/clock/meson*
>> +F:	include/dt-bindings/clock/s*
>>   
>>   ARM/Amlogic Meson SoC Crypto Drivers
>>   M:	Corentin Labbe <clabbe@baylibre.com>
>> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
>> new file mode 100644
>> index 000000000000..8b46d54d79fe
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/s4-clkc.h
>> @@ -0,0 +1,354 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> +/*
>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>> + * Author: Yu Tu <yu.tu@amlogic.com>
>> + */
>> +
>> +#ifndef __S4_CLKC_H
>> +#define __S4_CLKC_H
> 
> Use header guards mathcing paths. See other files for examples.
I will correct it.
> 
>> +
>> +/*
>> + * CLKID index values
>> + */
>> +
>> +#define CLKID_PLL_BASE			0
>> +#define CLKID_FIXED_PLL_DCO		(CLKID_PLL_BASE + 0)
> 
> Drop CLKID_PLL_BASE
I will correct it.
> 
>> +#define CLKID_FIXED_PLL			(CLKID_PLL_BASE + 1)
> 
> ditto... and so on.
I will correct it.
> 
> 
> Best regards,
> Krzysztof
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
