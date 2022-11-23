Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E018C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=642djdIH0QdZD67rnesiFT3f42iB3dgAz3PebHljEAY=; b=B5aZmBU1/2mGTI
	ii7GGClx23LymPbGsPVXU6zxJcM18lqIQ4GsR5ExioOkjKzXTdTjku7RNv1CFzO8kgsu3kZ1Lin7z
	52qFvL7OWzymefek434EZkqJ3e4E1Pjtxa8cfWFWFhcxxA7U71bpV2mhsQZlK7Qu5xCRN/ZtTQBYS
	Jsy9gB4ZgUCFNk88tOJLEfIrbyC1ac3/uY2AfpcAUAyoVcR0c0js25u47DOhVQnauCq0URtgP7sXI
	qhV0AtCSQ05nc9qPyN/Z4o0Rs2pWKTS0ZNNs73l2brm43GnSJf2RYPUD2tg/UpRONt/RU2Y8TBiMu
	l0ASv66tT7aQWBKZ4h+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxppQ-00HFT2-Aj; Wed, 23 Nov 2022 13:30:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpoe-00HEmk-Ev; Wed, 23 Nov 2022 13:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SanE6GbjFRytJ52mez8Mzqe3U/4JKhSSR9K9O2zh3jw=; b=CZ3vxG89RnkFQRibBdorPr/otU
	1a+1eaEjVE2ceDSCIG1fkE3Azsd4ON6dt4ByQoiAkodXdtkJWSok8L+WDbm9CR6Mo4r4GPEkU/vph
	e9Ym6xRbqEf/YokJyOsbWqPR1DKFeIMk7agxrw5SKdiEtgJrIru3cMWPfTkJZNO+cgviZNZMyskdA
	70742T440wbwu18R2IlfQNYzlgPXCF5zeK6OF17ATE9ymX0XbWoYR6rEbJF7p5VezxVC2zxwQDSfi
	4tdrSlztX9wiM29C/THDaIbGoPAAxGytDaDdtn+ncaxBjPTkqURfnLvu7q9bUKErKUeR9XfAjQ26o
	8/x2S/tw==;
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpiX-003nEX-3l; Wed, 23 Nov 2022 13:23:10 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 21:23:00 +0800
Message-ID: <3bdaa648-c607-a79c-f6bb-c75baa1e8509@amlogic.com>
Date: Wed, 23 Nov 2022 21:23:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH V5 4/4] arm64: dts: meson: add S4 Soc Peripheral clock
 controller in DT
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
 <20221123021346.18136-5-yu.tu@amlogic.com>
 <ae43fadf-9255-7db7-8b5e-01200e02a2c6@linaro.org>
 <9858039f-e635-2749-80a2-75072d6e9cea@amlogic.com>
 <8dbb3ce2-c8d9-70be-d1de-ed875de0ea1b@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <8dbb3ce2-c8d9-70be-d1de-ed875de0ea1b@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_132309_296384_B444A822 
X-CRM114-Status: UNSURE (   8.82  )
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



On 2022/11/23 21:02, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 23/11/2022 12:27, Yu Tu wrote:
>> Hi Krzysztof,
>> 	
>> On 2022/11/23 18:10, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 23/11/2022 03:13, Yu Tu wrote:
>>>> Added information about the S4 SOC Peripheral Clock controller in DT.
>>>>
>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>> ---
>>>>    arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 26 +++++++++++++++++++++++
>>>>    1 file changed, 26 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> index bd9c2ef83314..e7fab6e400be 100644
>>>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>>>> @@ -6,6 +6,8 @@
>>>>    #include <dt-bindings/interrupt-controller/irq.h>
>>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>    #include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/clock/amlogic,s4-pll-clkc.h>
>>>> +#include <dt-bindings/clock/amlogic,s4-peripherals-clkc.h>
>>>>    
>>>>    / {
>>>>    	cpus {
>>>> @@ -100,6 +102,30 @@ clkc_pll: clock-controller@8000 {
>>>>    				#clock-cells = <1>;
>>>>    			};
>>>>    
>>>> +			clkc_periphs: clock-controller {
>>>> +				compatible = "amlogic,s4-peripherals-clkc";
>>>> +				reg = <0x0 0x0 0x0 0x49c>;
>>>
>>> This is broken... did you check for warnings?
>> Yes, i do.
>> You can have a look at the results of my test, as follows.
>>
>> total: 0 errors, 0 warnings, 0 checks, 38 lines checked
>>
>> ../patch_clk_v5_1122/0004-arm64-dts-meson-add-S4-Soc-Peripheral-clock-controll.patch
>> has no obvious style problems and is ready for submission.
>>
> 
> This is a checkpatch output. I am talking about DTS broken. dtc should
> warn you.

Do you mean I will have wraning in compiling?
I actually compiled without warning.
ccf$ make ARCH=arm64 dtbs -j12
   DTC     arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb

> 
> Best regards,
> Krzysztof
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
