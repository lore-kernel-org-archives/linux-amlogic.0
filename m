Return-Path: <SRS0=S6c6=2B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69829C43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 12:21:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC84214D8
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Dec 2019 12:21:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g8eLZb2t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC84214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Ja07yx18jIfP29GpaL8MMm1gN9wU/fLRVdDZ2Aw2dc=; b=g8eLZb2tkfbfZ1iZLPIfP6+ja
	zbS5dwt4n/xKyDnkY1Nctop4KocUHAG3QlpqTVMsBNO2oamtfMFeap/uNNkgEjf3PLlWPeqdTTtDm
	6V6PvIFVeTMGvIplR+H7I1zVO/yIx4V0yXoCr0gNm/RbOfQEC55vMWTmR60/hC92ZhP0R39J1JTgu
	v+0nCtnpmIWI++IbjHIZZvuV94NWxD9dA4d+iC1z0/3tp9gDnjLOGtAvUqdHBt4o+1mDJcg88voMo
	T2p8J1Gb1eaZrJvueOU/AlTh1Bo3zntrCqCSOT3c95Zd7VaETXDqqUm+zJXJojMrMOr2YnxN6z4uD
	blAvyMJIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if0zH-0005e4-R3; Wed, 11 Dec 2019 12:21:03 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if0z7-0005VX-Ur; Wed, 11 Dec 2019 12:20:55 +0000
Received: from [10.28.39.99] (10.28.39.99) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 11 Dec
 2019 20:21:10 +0800
Subject: Re: [PATCH v2] arm64: dts: meson-a1: add I2C nodes
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
References: <20191211032802.83309-1-jian.hu@amlogic.com>
 <1jk173kxyf.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
Message-ID: <96ba0480-3cac-4a5e-482c-01491563c820@amlogic.com>
Date: Wed, 11 Dec 2019 20:21:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1jk173kxyf.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.99]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_042053_997904_49B56D76 
X-CRM114-Status: GOOD (  19.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Wolfram Sang <wsa@the-dreams.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 2019/12/11 17:34, Jerome Brunet wrote:
> 
> On Wed 11 Dec 2019 at 04:28, Jian Hu <jian.hu@amlogic.com> wrote:
> 
>> There are four I2C controllers in A1 series,
>> Share the same comptible with AXG. Compared to AXG,
>> Drive strength feature is newly added in A1.
> 
> Until here, OK
> 
>> This patch depends on A1 clock driver.
> 
> This last sentence is a valuable piece of information for the maintainer
> but should not appear is the commit description as it is something we
> want is the history
> 
OK, I will remove the last sentence.
> Please move this bellow the '---' *AND*
> Add a link like " https://lkml.kernel.org/r/..." to help the maintainer
> locate the related series
> 
OK, I have added the dependent patch link below.
> 
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>
>> ---
>> This patch depends on A1 clock patchset at[0]
>>
>> Changes since v1 at [1]:
>> -change reg length to 0x20
>> -assign i2c bus alias in dts file
>> -add new feature note compared to AXG in changelog
>>
>> [0] https://lkml.kernel.org/r/20191206074052.15557-1-jian.hu@amlogic.com
>> [1] https://lkml.kernel.org/r/20191202111253.94872-1-jian.hu@amlogic.com
>> ---
>> ---
>>   .../arm64/boot/dts/amlogic/meson-a1-ad401.dts |   4 +
>>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi     | 142 ++++++++++++++++++
>>   2 files changed, 146 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts
>> index 69c25c68c358..2d0457976233 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts
>> @@ -13,6 +13,10 @@
>>   
>>   	aliases {
>>   		serial0 = &uart_AO_B;
>> +		i2c0 = &i2c0;
>> +		i2c1 = &i2c1;
>> +		i2c2 = &i2c2;
>> +		i2c3 = &i2c3;
> 
> It is not necessary to define alias for all the possible buses,
> especially it some won't be used on the platform.
> 
> Will this platform use all 4 busses ?
> 
it will not use all 4 busses.
> In any case, the aliases can added later, as needed when the related i2c
> bus is enabled on the board
OK, I will remove the i2c bus alias first. It will be added when used.
> 
>>   	};
>>   
>>   	chosen {
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> index eab2ecd36aa8..66d5206a57de 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
>> @@ -117,6 +117,46 @@
>>   				};
>>   			};
>>   
>> +			i2c0: i2c@1400 {
>> +				compatible = "amlogic,meson-axg-i2c";
>> +				reg = <0x0 0x1400 0x0 0x20>;
>> +				interrupts = <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&clkc_periphs CLKID_I2C_M_A>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c1: i2c@5c00 {
> 
> Please order nodes by address when then have one.
> The 3 following i2c busses should appear after the uarts
OK, I will order them by address.
> 
>> +				compatible = "amlogic,meson-axg-i2c";
>> +				reg = <0x0 0x5c00 0x0 0x20>;
>> +				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&clkc_periphs CLKID_I2C_M_B>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c2: i2c@6800 {
>> +				compatible = "amlogic,meson-axg-i2c";
>> +				reg = <0x0 0x6800 0x0 0x20>;
>> +				interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&clkc_periphs CLKID_I2C_M_C>;
>> +				status = "disabled";
>> +			};
>> +
>> +			i2c3: i2c@6c00 {
>> +				compatible = "amlogic,meson-axg-i2c";
>> +				reg = <0x0 0x6c00 0x0 0x20>;
>> +				interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&clkc_periphs CLKID_I2C_M_D>;
>> +				status = "disabled";
>> +			};
>> +
>>   			uart_AO: serial@1c00 {
>>   				compatible = "amlogic,meson-gx-uart",
>>   					     "amlogic,meson-ao-uart";
>> @@ -171,3 +211,105 @@
>>   		#clock-cells = <0>;
>>   	};
>>   };
>> +
>> +&periphs_pinctrl {
>> +	i2c0_f11_pins:i2c0-f11 {
>> +		mux {
>> +			groups = "i2c0_sck_f11",
>> +				"i2c0_sda_f12";
>> +			function = "i2c0";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +
>> +	i2c0_f9_pins:i2c0-f9 {
> 
> When the nodes don't have an address, please order them
> alpha-numerically by node name.
Ok, I will order the node alpha-numerically.
> 
>> +		mux {
>> +			groups = "i2c0_sck_f9",
>> +				"i2c0_sda_f10";
>> +			function = "i2c0";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +
>> +	i2c1_x_pins:i2c1-x {
>> +		mux {
>> +			groups = "i2c1_sck_x",
>> +				"i2c1_sda_x";
>> +			function = "i2c1";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +
>> +	i2c1_a_pins:i2c1-a {
>> +		mux {
>> +			groups = "i2c1_sck_a",
>> +				"i2c1_sda_a";
>> +			function = "i2c1";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +
>> +	i2c2_x0_pins:i2c2-x0 {
>> +		mux {
>> +			groups = "i2c2_sck_x0",
>> +				"i2c2_sda_x1";
>> +			function = "i2c2";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +
>> +	i2c2_x15_pins:i2c2-x15 {
>> +		mux {
>> +			groups = "i2c2_sck_x15",
>> +				"i2c2_sda_x16";
>> +			function = "i2c2";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +
>> +	i2c2_a4_pins:i2c2-a4 {
>> +		mux {
>> +			groups = "i2c2_sck_a4",
>> +				"i2c2_sda_a5";
>> +			function = "i2c2";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +
>> +	i2c2_a8_pins:i2c2-a8 {
>> +		mux {
>> +			groups = "i2c2_sck_a8",
>> +				"i2c2_sda_a9";
>> +			function = "i2c2";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +
>> +	i2c3_x_pins:i2c3-x {
>> +		mux {
>> +			groups = "i2c3_sck_x",
>> +				"i2c3_sda_x";
>> +			function = "i2c3";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +
>> +	i2c3_f_pins:i2c3-f {
>> +		mux {
>> +			groups = "i2c3_sck_f",
>> +				"i2c3_sda_f";
>> +			function = "i2c3";
>> +			bias-pull-up;
>> +			drive-strength-microamp = <3000>;
>> +		};
>> +	};
>> +};
> 
> .
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
