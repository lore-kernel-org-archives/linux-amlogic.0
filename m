Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF96CC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 11:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ChqIujwTmlZ73Gkd7QMEFzlxptxxc2ceNbazFrGdA0=; b=JijD80NEiJiNcT
	7lPZMNjKZLn27QMlXDJ1dzmLzN9SmEcCR4Vnr+G0qd8ZaFIIgJVX2evnhk5+c2EyqSFyTIfuDI9if
	NFGZyaKiqLnB50aRNfo6c+gDsav7jjvTEj8FJUcoPGuZz/mSFEDe3Xtb++dsHrBt2sIn3bha793kM
	+dD/Zw2E7LTgKrKIzL9svJugbScftJBEL7cybwUYnNeUMqkPvZaZl8Zo163SaiEj6YLHdlUnnCmX2
	/zCmCKXKMjFKnsoSH/r34ZG9MJn18wtpNf6MUM9DXT9vpYORx/QWjtbvxUn+2wGfaR64DuFSuHT78
	u8YcXI6VkM3ngH92JDMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnkG-00GbVQ-J8; Wed, 23 Nov 2022 11:16:48 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxnjn-00GbE4-0H; Wed, 23 Nov 2022 11:16:21 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 19:16:06 +0800
Message-ID: <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
Date: Wed, 23 Nov 2022 19:16:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <kelvin.zhang@amlogic.com>
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
 <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_031619_592086_19499ECC 
X-CRM114-Status: GOOD (  15.56  )
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
	Thank you for your reply.

On 2022/11/23 18:08, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 23/11/2022 03:13, Yu Tu wrote:
>> Add the S4 PLL clock controller found and bindings in the s4 SoC family.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,s4-pll-clkc.yaml   |  51 +
> 
> This is v5 and still bindings are here? Bindings are always separate
> patches. Use subject prefixes matching the subsystem (git log --oneline
> -- ...).
> 
> And this was split, wasn't it? What happened here?!?

Put bindings and clock driver patch together from Jerome. Maybe you can 
read this chat history.
https://lore.kernel.or/all/1jy1v6z14n.fsf@starbuckisacylon.baylibre.com/

> 
> 
>>   MAINTAINERS                                   |   1 +
>>   drivers/clk/meson/Kconfig                     |  13 +
>>   drivers/clk/meson/Makefile                    |   1 +
>>   drivers/clk/meson/s4-pll.c                    | 875 ++++++++++++++++++
>>   drivers/clk/meson/s4-pll.h                    |  88 ++
>>   .../dt-bindings/clock/amlogic,s4-pll-clkc.h   |  30 +
>>   7 files changed, 1059 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>>   create mode 100644 drivers/clk/meson/s4-pll.c
>>   create mode 100644 drivers/clk/meson/s4-pll.h
>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>> new file mode 100644
>> index 000000000000..fd517e8ef14f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson S serials PLL Clock Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <narmstrong@baylibre.com>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Yu Tu <yu.hu@amlogic.com>
>> +
> One blank line.

  I will delete this, on next version patch.

> 
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,s4-pll-clkc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xtal
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - "#clock-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    clkc_pll: clock-controller@fe008000 {
>> +      compatible = "amlogic,s4-pll-clkc";
>> +      reg = <0xfe008000 0x1e8>;
>> +      clocks = <&xtal>;
>> +      clock-names = "xtal";
>> +      #clock-cells = <1>;
>> +    };
> 
> 
>> +#endif /* __MESON_S4_PLL_H__ */
>> diff --git a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>> new file mode 100644
>> index 000000000000..345f87023886
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 
> This belongs to bindings patch, not driver.
> 
>> @@ -0,0 +1,30 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> +/*
>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>> + * Author: Yu Tu <yu.tu@amlogic.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
>> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
>> +
>> +/*
>> + * CLKID index values
>> + */
>> +
>> +#define CLKID_FIXED_PLL			1
>> +#define CLKID_FCLK_DIV2			3
> 
> Indexes start from 0 and are incremented by 1. Not by 2.
> 
> NAK.

I remember Jerome discussing this with you.You can look at this 
submission history.
https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/

> 
> Best regards,
> Krzysztof
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
