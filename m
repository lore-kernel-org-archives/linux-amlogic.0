Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18278C04A68
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Jul 2022 10:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHpW/Ktv4+UQOHWCIC3TxlkYUdFwwvFFdUpY7VPde1Q=; b=AlV9cHqfZtDUngdnEzG40Bqudu
	qUPfaD+A9nBsjnscZVsiN5b4D3J+BI7jc18Lev2+JAVQevnzyd5W1+3S6pQJZTAhl5DmaqTVDrsUV
	ktBkZH3C+YJ9nYSNmXEWeVKfkhBT/YslaAZfCki+DadYajzhi2TXRQNVXHR1EfDpE2YnRRT05c+Eb
	ukw25mskISlaoXs+eAiwLwT599LGz2C/zyua32rO7GjpxH8132wQR/BuHFM/q2ogiIbucrQAorAgw
	A0mKqrQrf9tXAsvT6IWRsSe6FoW7fpaI1gqn6js3516tx2Xu3bY6u7xQh4QD+RPjAWyaRSkLuN1kW
	7teB6qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH0P1-008C2I-L3; Thu, 28 Jul 2022 10:05:59 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH0Op-008Bqv-B7; Thu, 28 Jul 2022 10:05:48 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 28 Jul
 2022 18:05:44 +0800
Message-ID: <74cd833a-4773-eeb0-80aa-75ea1cdc093e@amlogic.com>
Date: Thu, 28 Jul 2022 18:05:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 1/3] dt-bindings: clk: meson: add S4 SoC clock
 controller bindings
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
References: <20220728054202.6981-1-yu.tu@amlogic.com>
 <20220728054202.6981-2-yu.tu@amlogic.com>
 <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <82e3fd36-df96-a555-4cea-47fabd26502b@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_030547_428707_C0F2769A 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi Krzysztof,
	Thanks for your reply.

On 2022/7/28 16:41, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 28/07/2022 07:42, Yu Tu wrote:
>> Add new clock controller compatible and dt-bindings header for the
>> Everything-Else domain of the S4 SoC.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> 
> 
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index c1abc53f9e91..f872d0c0c253 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1775,6 +1775,7 @@ F:	Documentation/devicetree/bindings/clock/amlogic*
>>   F:	drivers/clk/meson/
>>   F:	include/dt-bindings/clock/gxbb*
>>   F:	include/dt-bindings/clock/meson*
>> +F:	include/dt-bindings/clock/s4-clkc.h
>>   
>>   ARM/Amlogic Meson SoC Crypto Drivers
>>   M:	Corentin Labbe <clabbe@baylibre.com>
>> diff --git a/include/dt-bindings/clock/s4-clkc.h b/include/dt-bindings/clock/s4-clkc.h
>> new file mode 100644
>> index 000000000000..b686c8877419
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/s4-clkc.h
> 
> Filename with vendor prefix, so:
> amlogic,s4-clkc.h
It's fine with me. It's mainly Jerome's opinion.

> 
>> @@ -0,0 +1,146 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> +/*
>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>> + * Author: Yu Tu <yu.tu@amlogic.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLOCK_S4_CLKC_H
>> +#define _DT_BINDINGS_CLOCK_S4_CLKC_H
>> +
>> +/*
>> + * CLKID index values
>> + */
>> +
>> +#define CLKID_FIXED_PLL			1
>> +#define CLKID_FCLK_DIV2			3
>> +#define CLKID_FCLK_DIV3			5
>> +#define CLKID_FCLK_DIV4			7
>> +#define CLKID_FCLK_DIV5			9
>> +#define CLKID_FCLK_DIV7			11
> 
> Why these aren't continuous? IDs are expected to be incremented by 1.
> 
>> +
>> +#endif /* _DT_BINDINGS_CLOCK_S4_CLKC_H */
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
