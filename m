Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C369BC433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jul 2022 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gv2bykLFoyGIWnts9HgVg4ViMB15qaSFVbCaj/PELTY=; b=o+lCpemes1lrCt62sXv+XCSZJO
	UxKB7phXCWVLoR9AYfZ949gnHlFboU7GgzdqtWoV2qe4hlm/7rWPtGrnuMDNzATx9vKwvC0D4xPBz
	isOWJOkvaSc73UGjVGj7KapavNV0goBVSeSn2RR2xhYNpB+OxqTW62aZ29amPDCOKN0RxyYCx5XcF
	2uhEGQcJZP2c95Hhn3NGlWR3G8qA9OAdswJi6GwAj+Jmc2NZu6TGmtf+1WpH/me+c2MJGDOY4sTZj
	Le14FfmqNRc82bEJ8T+hSSJQ/2L3EQmoN6TZ92vHMmOxAAM0Sml+92Ml1V6t20zp5wuzNnlAzzjNR
	Hf8hkzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgF1-005Yto-KY; Tue, 19 Jul 2022 05:57:55 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgEV-005YhK-SL; Tue, 19 Jul 2022 05:57:25 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 19 Jul
 2022 13:57:21 +0800
Message-ID: <3cc2e18a-1813-9939-4808-a59858f6451e@amlogic.com>
Date: Tue, 19 Jul 2022 13:57:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] arm64: dts: meson: add S4 Soc clock controller in DT
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
 <20220708062757.3662-3-yu.tu@amlogic.com>
 <f5b3e2de-ec60-88ee-4066-6b3860b6c89a@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <f5b3e2de-ec60-88ee-4066-6b3860b6c89a@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_225723_975673_0DE61BC8 
X-CRM114-Status: GOOD (  11.83  )
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

On 2022/7/12 17:41, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 08/07/2022 08:27, Yu Tu wrote:
>> Added information about the S4 SOC Clock controller in DT.
>>
>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> index ff213618a598..ad2ec26a1f4a 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
>> @@ -86,7 +86,7 @@ gic: interrupt-controller@fff01000 {
>>   		};
>>   
>>   		apb4: apb4@fe000000 {
>> -			compatible = "simple-bus";
>> +			compatible = "simple-bus", "syscon";
> 
> This is not allowed.
> 1. syscon needs also dedicated compatible
> 2. simple-bus with syscon means it is not a simple bus anymore, so nope.
I will correct it.
> 
>>   			reg = <0x0 0xfe000000 0x0 0x480000>;
>>   			#address-cells = <2>;
>>   			#size-cells = <2>;
>> @@ -118,6 +118,13 @@ gpio_intc: interrupt-controller@4080 {
>>   					<10 11 12 13 14 15 16 17 18 19 20 21>;
>>   			};
>>   
>> +			clkc: clock-controller {
>> +				compatible = "amlogic,s4-clkc";
>> +				#clock-cells = <1>;
>> +				clocks = <&xtal>;
>> +				clock-names = "xtal";
>> +			};
>> +
>>   			uart_B: serial@7a000 {
>>   				compatible = "amlogic,meson-s4-uart",
>>   					     "amlogic,meson-ao-uart";
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
