Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DB3C25B06
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46jyIBpTTnkxtheI3SqlpsQx8zparyqrDYy3Tr3KwN4=; b=yamqMi6RhAIbYIIKm8ZSFGulJ9
	5o+VUeeiUlpfA4AMsS2yfweMwP0arC6qolJg6JwB22UDik5frkgeNe58PiqkypPLUtCKBO/CcYfoe
	dfIZEiPcQ65/qFsU0ZNVaVu/NpLzh1awYV2HK+Up4g4yYkHmGgMx/d8FqZdXo/YmGw+rYOu+I7cFQ
	5kEIyN567riaG8/d1XwN5H1WBpZGoK3/zTeqGhyd0KQYWkLOaX/W6fFz98Xr0ZVr+4PCnr7Ho/giB
	K9AQYM4z9fznRQIfGllU7nmfBxtUoxE8umSNzC+hrvEYxQOGvHqyOvGfw7QoGmtylBoMDbUcVBuHc
	l1GWzHUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtho-00DdkO-Nk; Fri, 05 Aug 2022 09:33:20 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJthc-00Ddei-AH; Fri, 05 Aug 2022 09:33:09 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 5 Aug 2022
 17:33:03 +0800
Message-ID: <4d923b9e-61d4-b4cc-906f-cb186a16e1f4@amlogic.com>
Date: Fri, 5 Aug 2022 17:33:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V3 4/6] dt-bindings: clk: meson: add S4 SoC peripheral
 clock controller bindings
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
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-5-yu.tu@amlogic.com>
 <562043e1-83d4-d4ab-2c18-20b770b02955@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <562043e1-83d4-d4ab-2c18-20b770b02955@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_023308_390612_4488E3E4 
X-CRM114-Status: GOOD (  11.84  )
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

On 2022/8/5 17:15, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 05/08/2022 10:57, Yu Tu wrote:
>> Add peripheral clock controller compatible and dt-bindings header for
>> the of the S4 SoC.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   .../bindings/clock/amlogic,s4-clkc.yaml       |  92 ++++++++++++
>>   include/dt-bindings/clock/amlogic,s4-clkc.h   | 131 ++++++++++++++++++
>>   2 files changed, 223 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>>   create mode 100644 include/dt-bindings/clock/amlogic,s4-clkc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
>> new file mode 100644
>> index 000000000000..2471276afda9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-clkc.yaml
> 
> Filename should be based on compatible, so amlogic,s4-periphs-clkc.yaml
I will correct as you suggest in the next version.
> 
>> @@ -0,0 +1,92 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/amlogic,s4-clkc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson S serials Peripheral Clock Controller Device Tree Bindings
> 
> s/Device Tree Bindings//
what's mean?
> 
>> +
>> +maintainers:
>> +  - Neil Armstrong <narmstrong@baylibre.com>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Yu Tu <yu.hu@amlogic.com>
>> +
>> +
>> +properties:
>> +  compatible:
>> +    const: amlogic,s4-periphs-clkc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: input fixed pll div2
>> +      - description: input fixed pll div2p5
>> +      - description: input fixed pll div3
>> +      - description: input fixed pll div4
>> +      - description: input fixed pll div5
>> +      - description: input fixed pll div7
>> +      - description: input hifi pll
>> +      - description: input gp0 pll
>> +      - description: input mpll0
>> +      - description: input mpll1
>> +      - description: input mpll2
>> +      - description: input mpll3
>> +      - description: input hdmi pll
>> +      - description: input oscillator (usually at 24MHz)
>> +
>> +  clock-names:
>> +    items:
>> +      - const: fclk_div2
>> +      - const: fclk_div2p5
>> +      - const: fclk_div3
>> +      - const: fclk_div4
>> +      - const: fclk_div5
>> +      - const: fclk_div7
>> +      - const: hifi_pll
>> +      - const: gp0_pll
>> +      - const: mpll0
>> +      - const: mpll1
>> +      - const: mpll2
>> +      - const: mpll3
>> +      - const: hdmi_pll
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
>> +    clkc_periphs: periphs-clock-controller@fe000000 {
>> +      compatible = "amlogic,s4-periphs-clkc";
>> +      reg = <0xfe000000 0x49c>;
>> +      clocks = <&clkc_pll 3>,
>> +              <&clkc_pll 13>,
>> +              <&clkc_pll 5>,
>> +              <&clkc_pll 7>,
>> +              <&clkc_pll 9>,
>> +              <&clkc_pll 11>,
>> +              <&clkc_pll 17>,
>> +              <&clkc_pll 15>,
>> +              <&clkc_pll 25>,
>> +              <&clkc_pll 27>,
>> +              <&clkc_pll 29>,
>> +              <&clkc_pll 31>,
>> +              <&clkc_pll 20>,
>> +              <&xtal>;
>> +      clock-names = "fclk_div2", "fclk_div2p5", "fclk_div3", "fclk_div4",
>> +                    "fclk_div5", "fclk_div7", "hifi_pll", "gp0_pll",
>> +                    "mpll0", "mpll1", "mpll2", "mpll3", "hdmi_pll", "xtal";
>> +      #clock-cells = <1>;
>> +    };
>> +...
>> diff --git a/include/dt-bindings/clock/amlogic,s4-clkc.h b/include/dt-bindings/clock/amlogic,s4-clkc.h
>> new file mode 100644
>> index 000000000000..d203b9bbf29e
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,s4-clkc.h
> 
> Probably this should be then amlogic,s4-periphs-clkc.h
I will correct as you suggest in the next version.
> 
>> @@ -0,0 +1,131 @@
>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>> +/*
>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>> + * Author: Yu Tu <yu.tu@amlogic.com>
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_CLKC_H
>> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_CLKC_H
> 
> Best regards,
> Krzysztof
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
