Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE85C00140
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJ9Qxn0a45xaaTZXl19gdFD6DdvRaOmexEGmK3cJTkQ=; b=3GPRIgJPc/7qNR
	XDfGrjXhOpv+sbt56lgplNZvH0r7B5zNIvtrbx3J1No84/bDWsMh9UmKbhK7qM/3mVIO+R+RPVqbc
	pAcSpE4mzHn8k3jQPJQ0TqgAIP8tqO6bdOsN2BE1yiXFSJoteVH6izGOnWTQGnQK9gyOWwSvvH3KD
	z46jf0pQ+1zNIrY8DIKaGYdF2r7WnDGW3vx9il6p2uZV7ad1q712apSob1ddOH790WtZ4hpq01oQD
	vkv3+MhHalJxvZMdLV8KbHBbYgWXzverQ2TTJnVO2aMPGvMs9Qlzr45Tq9vhk4iNH4JWrTvovEurz
	gGFqjrqzxbGeU++Q/o9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJu5Z-00Dotg-1E; Fri, 05 Aug 2022 09:57:53 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJu5M-00DonK-Ex; Fri, 05 Aug 2022 09:57:41 +0000
Received: from [10.88.19.200] (10.88.19.200) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server id 15.1.2507.6; Fri, 5 Aug 2022
 17:57:37 +0800
Message-ID: <0fac4541-0d05-1076-487b-86a7b92da71e@amlogic.com>
Date: Fri, 5 Aug 2022 17:57:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v4 3/4] arm64: dts: meson: Add DDR PMU node
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
 <20220805071426.2598818-3-jiucheng.xu@amlogic.com>
 <e963157e-5ff0-f0c1-2299-50528cf291c3@linaro.org>
From: Jiucheng Xu <jiucheng.xu@amlogic.com>
In-Reply-To: <e963157e-5ff0-f0c1-2299-50528cf291c3@linaro.org>
X-Originating-IP: [10.88.19.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_025740_536663_0D87B9E6 
X-CRM114-Status: GOOD (  11.93  )
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


On 2022/8/5 16:22, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
>
> On 05/08/2022 09:14, Jiucheng Xu wrote:
>> Add DDR PMU device node for G12 series SoC
>>
>> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
>> ---
>> Changes v3 -> v4:
>>    - No change
>>
>> Changes v2 -> v3:
>>    - No change
>>
>> Changes v1 -> v2:
>>    - Remove model, dmc_nr, chann_nr properties
>>    - Add g12a-ddr-pmu, g12b-ddr-pmu, sm1-ddr-pmu compatibles as
>>      identifier
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 7 +++++++
>>   arch/arm64/boot/dts/amlogic/meson-g12a.dtsi       | 4 ++++
>>   arch/arm64/boot/dts/amlogic/meson-g12b.dtsi       | 4 ++++
>>   arch/arm64/boot/dts/amlogic/meson-sm1.dtsi        | 4 ++++
>>   4 files changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> index 45947c1031c4..7e556fe575be 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
>> @@ -2146,6 +2146,13 @@ hdmi_tx_out: endpoint {
>>   			};
>>   		};
>>   
>> +		ddr_pmu: ddr_pmu@ff638000 {
> No underscores in node names.
>
> Node names should be generic, so pmu.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
Okay, I will modify it.
>
>> +			compatible = "amlogic,g12-ddr-pmu";
>> +			reg = <0x0 0xff638000 0x0 0x100
>> +			       0x0 0xff638c00 0x0 0x100>;
>> +			interrupts = <GIC_SPI 52 IRQ_TYPE_EDGE_RISING>;
>> +		};
>> +
>>   		gic: interrupt-controller@ffc01000 {
>>   			compatible = "arm,gic-400";
>>   			reg = <0x0 0xffc01000 0 0x1000>,
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> index fb0ab27d1f64..4a32e081e70e 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
>> @@ -133,3 +133,7 @@ map1 {
>>   		};
>>   	};
>>   };
>> +
>> +&ddr_pmu {
>> +	compatible = "amlogic,g12a-ddr-pmu";
>> +};
> Adding nodes at the end causes conflicts. They should be added in some
> order...
Is alphabetical order okay?
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
