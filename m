Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC19CD11DD
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2024 19:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hM9rc0zl8VyV5OaBklVgw1n5W3KOaottoDE7dj9M3nk=; b=pVcbUctOJATJwZ
	LT9bGPg+BGUmGiGSEMaIWbfH1Cq9t5TeS8kEzBotpdbo5OBs+U/huf35n+uqfrlBoao/3MhKrbunx
	0q9gZBq9FeX2YAL3EP9ccDDmZJ3EG4SCfpHMllpipTt3JECuahUj7qcRXFAoYq5RtgOhjjlZE7LsT
	QJ+XsLwSY6ZJ+eoNR9VqzLXVD55LwcwokNn7Lp2Wj2ylj6oRrgFe3V3fMLX+zy0kwnZIAY/Wwf6qq
	zfx8I1xkCYhzrl1qJvYAuYqFTzBFBEuj62dcnub9MuDWtpON8fiB5VXQoSXyx9t3QPEanrUoI4b/4
	hmNp7ROYsU4qIrbyJ9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvgM-0000000FRQk-1rJc;
	Thu, 28 Mar 2024 19:45:02 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvgG-0000000FRNA-408c;
	Thu, 28 Mar 2024 19:45:00 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id ACE01100011;
	Thu, 28 Mar 2024 22:44:53 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru ACE01100011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1711655093;
	bh=m0xMJsrom0saG660a9og6h3GiS585KUQVZD10EtLm4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=SQroCiKF+YF/1tcLgcnxlC7Ala04oJF47du+bYXjDFdlVON8UQboEWtBtpOGLq4NH
	 xPMa2qMrIkroGs7P4Pz8tIROHODoXy5ZU+8MJrXKKq+DEnBeOjFxS52d5PyZ6d5d6K
	 LvJWJXbiz44mVE3sHqiIe2Cji8a6KNA1ofPGs85TkWx0qzte8srHpTu1iSiPhqqdLj
	 Ktbi8vOE+uwCDxnXBeRp+daR8V9fwpbt55jm3mL7OpIS0S2GVEuQ26TD/Hnu17WgXk
	 uWS0DnndO2t0bjqnzTHZPjK6csWynWM8nRiuWoY4EBv242+nIeDah19rUBg/eE4moz
	 4Zi69xr29EhaA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu, 28 Mar 2024 22:44:53 +0300 (MSK)
Received: from [172.28.160.49] (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 22:44:53 +0300
Message-ID: <9ce24f8d-5800-4604-abb4-5586d6c385e0@salutedevices.com>
Date: Thu, 28 Mar 2024 22:43:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 3/5] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
 <20240328010831.884487-4-jan.dakinevich@salutedevices.com>
 <cff5e036-7f7c-4270-be0c-f49b196a502b@linaro.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <cff5e036-7f7c-4270-be0c-f49b196a502b@linaro.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184478 [Mar 28 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Tracking_smtp_not_equal_from}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;devicetree-specification.readthedocs.io:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;salutedevices.com:7.1.1, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/03/28 18:21:00
X-KSMG-LinksScanning: Clean, bases: 2024/03/28 18:21:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/03/28 18:13:00 #24496606
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_124457_452275_80619045 
X-CRM114-Status: GOOD (  19.92  )
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



On 3/28/24 12:01, Krzysztof Kozlowski wrote:
> On 28/03/2024 02:08, Jan Dakinevich wrote:
>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> ---
> 
>> +title: Amlogic A1 Audio Clock Control Unit and Reset Controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +  - Jerome Brunet <jbrunet@baylibre.com>
>> +  - Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,a1-audio-clkc
>> +      - amlogic,a1-audio2-clkc
> 
> What is "2"?
> 

This is the second clock controller. I couldn't think of a better name.

> If there is going to be any new version/resend:

Definitely, this is not the final version. Thank you for comments!


>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    minItems: 6
>> +    maxItems: 7
>> +
>> +  clock-names:
>> +    minItems: 6
>> +    maxItems: 7
>> +
>> +required:
>> +  - compatible
>> +  - '#clock-cells'
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - amlogic,a1-audio-clkc
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: input core clock
>> +            - description: input main peripheral bus clock
>> +            - description: input dds_in
>> +            - description: input fixed pll div2
>> +            - description: input fixed pll div3
>> +            - description: input hifi_pll
>> +            - description: input oscillator (usually at 24MHz)
>> +        clocks-names:
>> +          items:
>> +            - const: core
>> +            - const: pclk
>> +            - const: dds_in
>> +            - const: fclk_div2
>> +            - const: fclk_div3
>> +            - const: hifi_pll
>> +            - const: xtal
>> +      required:
>> +        - '#reset-cells'
>> +    else:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: input main peripheral bus clock
>> +            - description: input dds_in
>> +            - description: input fixed pll div2
>> +            - description: input fixed pll div3
>> +            - description: input hifi_pll
>> +            - description: input oscillator (usually at 24MHz)
>> +        clock-names:
>> +          items:
>> +            - const: pclk
>> +            - const: dds_in
>> +            - const: fclk_div2
>> +            - const: fclk_div3
>> +            - const: hifi_pll
>> +            - const: xtal
> 
> #reset-cells: false
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
>> +    #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
>> +    #include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
>> +    audio {
> 
> If there is going to be any new version/resend:
> soc {
> 
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clkc_audio: audio-clock-controller@fe050000 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> So: clock-controller
> 
>> +                compatible = "amlogic,a1-audio-clkc";
>> +                reg = <0x0 0xfe050000 0x0 0xb0>;
>> +                #clock-cells = <1>;
>> +                #reset-cells = <1>;
>> +                clocks = <&clkc_audio2 AUD2_CLKID_AUDIOTOP>,
>> +                         <&clkc_periphs CLKID_AUDIO>,
>> +                         <&clkc_periphs CLKID_DDS_IN>,
>> +                         <&clkc_pll CLKID_FCLK_DIV2>,
>> +                         <&clkc_pll CLKID_FCLK_DIV3>,
>> +                         <&clkc_pll CLKID_HIFI_PLL>,
>> +                         <&xtal>;
>> +                clock-names = "core",
>> +                              "pclk",
>> +                              "dds_in",
>> +                              "fclk_div2",
>> +                              "fclk_div3",
>> +                              "hifi_pll",
>> +                              "xtal";
>> +        };
>> +
>> +        clkc_audio2: audio-clock-controller@fe054800 {
> 
> clock-controller
> (so I expect resend)
> 
>> +                compatible = "amlogic,a1-audio2-clkc";
>> +                reg = <0x0 0xfe054800 0x0 0x20>;
>> +                #clock-cells = <1>;
>> +                clocks = <&clkc_periphs CLKID_AUDIO>,
>> +                         <&clkc_periphs CLKID_DDS_IN>,
>> +                         <&clkc_pll CLKID_FCLK_DIV2>,
>> +                         <&clkc_pll CLKID_FCLK_DIV3>,
>> +                         <&clkc_pll CLKID_HIFI_PLL>,
>> +                         <&xtal>;
>> +                clock-names = "pclk",
>> +                              "dds_in",
>> +                              "fclk_div2",
>> +                              "fclk_div3",
>> +                              "hifi_pll",
>> +                              "xtal";
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/clock/amlogic,a1-audio-clkc.h b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>> new file mode 100644
>> index 000000000000..b30df3b1ae08
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/amlogic,a1-audio-clkc.h
>> @@ -0,0 +1,122 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
>> +/*
>> + * Copyright (c) 2024, SaluteDevices. All Rights Reserved.
>> + *
>> + * Author: Jan Dakinevich <jan.dakinevich@salutedevices.com>
>> + */
>> +
>> +#ifndef __A1_AUDIO_CLKC_BINDINGS_H
>> +#define __A1_AUDIO_CLKC_BINDINGS_H
>> +
>> +#define AUD_CLKID_DDR_ARB		1
>> +#define AUD_CLKID_TDMIN_A		2
>> +#define AUD_CLKID_TDMIN_B		3
>> +#define AUD_CLKID_TDMIN_LB		4
> 
> Why both clock controllers have the same clocks? This is confusing. It
> seems you split same block into two!
> 
> Best regards,
> Krzysztof
> 

-- 
Best regards
Jan Dakinevich

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
