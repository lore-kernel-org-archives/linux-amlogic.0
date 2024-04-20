Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75921C4345F
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2024 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iP+xHsHxcOUulBjd+6iC6J9TzpMy7eeLZobB4vVBjYA=; b=y6vNBtnNJC0LQ0
	j8rSUzSmpKFD93sRpVAFKF7dgwboUjhDTNojNKrrC4A3vqdJMHn8WWi/tz/B0wn3J47vLTwsnImsW
	RISMSARF7awkwA36dDLX3PqeDNVbhATMePbduEhgXOh1+wDF5d0YaGTmhuWae5AHbbnV4Zy+TpGgd
	wxUV+LnBRTLk1Y5Eh24SL0Wx17aq6w3RHL8pjFmqMibHwJkEfqQHN4xWCjxjKjkL9SREgP4f43R28
	q+WU7DG4Y116W1q4alJwESfP6fjHvA9LHaG62XlkvRpicrZBeByNVhJg+eon8q/wwJ8lheRyn+B/E
	ncFvZXBpP0LXDM8KdAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryC3O-00000008fLt-44CJ;
	Sat, 20 Apr 2024 14:50:58 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryC3K-00000008fL2-2ftb;
	Sat, 20 Apr 2024 14:50:57 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id AF974100002;
	Sat, 20 Apr 2024 17:50:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru AF974100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1713624646;
	bh=ZXGJIRVvBTmEkVVYJcaTIl3MxgwitUGOGyPLvfPsyoI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=CXsuT0tq+0eaRAGbaL9hFblKmqWVuBNGw52g0xeB+tDZ8VTsVLDZfLCn1/32Mxkt8
	 GXGoJazrm9IdGBrHc+tV5SGprSLPn/hiZYNCtpV5/vhY5jjZytBuXLC7W3gAv2Mih0
	 1B1JhdmLrKggN05pnCAHLDAzeQl/i0jqjIe1UFd1ySkglc+7oHcM+0m56wRRgxdgOe
	 X94PRCZC6L5hy7ciLx/Ygibh/GFwUCbZAV5RJb0njjgpqFE4F2fyzPKUlulO/Bp/oI
	 pAO+y9FHv25r3bGtsOhF1Wj2a2mH5k8ErXmQ9a8JMwJ8xtH3GvRZDAJmvV6+dIzyDw
	 BfpLxViMmKpLg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 20 Apr 2024 17:50:46 +0300 (MSK)
Received: from [10.8.0.14] (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 20 Apr
 2024 17:50:43 +0300
Message-ID: <0194ddb8-6e93-4a77-9fdd-93fc79a4e03e@salutedevices.com>
Date: Sat, 20 Apr 2024 17:48:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 4/6] dt-bindings: clock: meson: document A1 SoC
 audio clock controller driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Jiucheng Xu <jiucheng.xu@amlogic.com>,
	<linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <20240419125812.983409-1-jan.dakinevich@salutedevices.com>
 <20240419125812.983409-5-jan.dakinevich@salutedevices.com>
 <07b1ca57-49a0-4151-99bf-caac053eaa01@kernel.org>
From: Jan Dakinevich <jan.dakinevich@salutedevices.com>
In-Reply-To: <07b1ca57-49a0-4151-99bf-caac053eaa01@kernel.org>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184817 [Apr 19 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: YVDakinevich@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 18 0.3.18 b9d6ada76958f07c6a68617a7ac8df800bc4166c, {Tracking_smtp_not_equal_from}, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;salutedevices.com:7.1.1;100.64.160.123:7.1.2, FromAlignment: n, {Tracking_smtp_domain_mismatch}, {Tracking_smtp_domain_2level_mismatch}, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/20 10:48:00 #24889969
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_075055_240845_27DE18DC 
X-CRM114-Status: GOOD (  20.42  )
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



On 4/19/24 17:06, Krzysztof Kozlowski wrote:
> On 19/04/2024 14:58, Jan Dakinevich wrote:
>> Add device tree bindings for A1 SoC audio clock and reset controllers.
>>
>> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> 
> This is still RFC, so not ready.
> 
> Limited, incomplete review follows. Full review will be provided when
> the work is ready.
> 
> Drop "driver" references, e.g. from subject. Bindings are about hardware.
> 
> 
> ....
> 
>> +
>> +  clocks:
>> +    maxItems: 26
>> +    items:
>> +      - description: input main peripheral bus clock
>> +      - description: input dds_in
>> +      - description: input fixed pll div2
>> +      - description: input fixed pll div3
>> +      - description: input hifi_pll
>> +      - description: input oscillator (usually at 24MHz)
>> +    additionalItems:
>> +      oneOf:
>> +        - description: slv_sclk[0-9] - slave bit clocks provided by external components
>> +        - description: slv_lrclk[0-9]- slave sample clocks provided by external components
> 
> What does it mean the clocks are optional? Pins could be not routed?

Yes exactly. Pins could be routed in any combination or could be not
routed at all. It is determined by schematics and that how external
codecs are configured.

> It's really rare case that clocks within the SoC are optional, so every
> such case is questionable.
> 
> 
>> +
>> +  clock-names:
>> +    maxItems: 26
>> +    items:
>> +      - const: pclk
>> +      - const: dds_in
>> +      - const: fclk_div2
>> +      - const: fclk_div3
>> +      - const: hifi_pll
>> +      - const: xtal
>> +    additionalItems:
>> +      oneOf:
>> +        - pattern: "^slv_sclk[0-9]$"
>> +        - pattern: "^slv_lrclk[0-9]$"
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
>> +            const: amlogic,a1-audio-clkc
>> +    then:
>> +      required:
>> +        - '#reset-cells'
>> +    else:
>> +      properties:
>> +        '#reset-cells': false
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
>> +    #include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
>> +    #include <dt-bindings/clock/amlogic,a1-audio-clkc.h>
>> +    audio {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        clkc_audio: clock-controller@fe050000 {
>> +                compatible = "amlogic,a1-audio-clkc";
>> +                reg = <0x0 0xfe050000 0x0 0xb0>;
>> +                #clock-cells = <1>;
>> +                #reset-cells = <1>;
>> +                clocks = <&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>,
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
> 
> Make it complete - list all clocks.
> 

You mean, all optional clocks should be mentioned here. Right?

>> +        };
>> +
>> +        clkc_audio_vad: clock-controller@fe054800 {
> 
> Just keep one example. It's basically almost the same.
> 

The worth of this duplication is to show how a clock from second
controller (<&clkc_audio_vad AUD_CLKID_VAD_AUDIOTOP>) is used by first
one. May be it would be better to keep it... What do you think?

> 
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
