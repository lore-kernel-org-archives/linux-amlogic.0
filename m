Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CD0C4167D
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 14:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ox6c5d/SsQajh8rYrZ25l/JqJxPb+m9zqYjrT/Ff2fw=; b=eIIXx5yYD3d+GQ
	ol38jiBFjdL/ugdA1J0hw+z+hyt2nha6IvZ8YQ+EKeOS1PDV9t4+h4NxmzRRC6HnjgyEHIW+DSsaC
	GDQh56oneTXld+JPbB/jIV9Z2mTzXMMEnL90YijNeEahGADS4gv8us8Q/C5qnT1IrUMCFMUsJkmEh
	GC4slbZ0eIgYmHB9LI3efAa0QRI4h8pFD6gqxjGfn1W4bwiIhOp9gRnwmfqPy9ZQJNEDDifBjfGvJ
	wo4ZOBrlCetEAAIj+pRT6wLNyLvMlrUxrTxS1gUN0S0s7NoiJCFJ3qgpzVMTtNjm0KQB48KKHmovU
	TgTo/vSqXR6MbG7o/O3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqf4-0000Al-A7; Wed, 23 Nov 2022 14:23:38 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqen-00Hb4I-Po; Wed, 23 Nov 2022 14:23:23 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 22:23:17 +0800
Message-ID: <c3a1a0ce-94eb-6cce-34b2-d639b8116deb@amlogic.com>
Date: Wed, 23 Nov 2022 22:23:17 +0800
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
 <3bdaa648-c607-a79c-f6bb-c75baa1e8509@amlogic.com>
 <663d8e29-b47f-8135-8b4e-c95b68559367@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <663d8e29-b47f-8135-8b4e-c95b68559367@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_062321_879588_92CC1B96 
X-CRM114-Status: UNSURE (   5.39  )
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



On 2022/11/23 22:12, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 23/11/2022 14:23, Yu Tu wrote:
>>>> ../patch_clk_v5_1122/0004-arm64-dts-meson-add-S4-Soc-Peripheral-clock-controll.patch
>>>> has no obvious style problems and is ready for submission.
>>>>
>>>
>>> This is a checkpatch output. I am talking about DTS broken. dtc should
>>> warn you.
>>
>> Do you mean I will have wraning in compiling?
>> I actually compiled without warning.
>> ccf$ make ARCH=arm64 dtbs -j12
>>     DTC     arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb
>>
> 
> Nope:
> 
> ../arch/arm64/boot/dts/amlogic/meson-s4.dtsi:105.35-127.6: Warning
> (unit_address_vs_reg): /soc/apb4@fe000000/clock-controller: node has a
> reg or ranges property, but no unit name
> 
> Test your patches better before using reviewers time for trivial
> compile-time fixes. The same rules for C code apply for DTS.
> 

Like this:
	clkc_periphs: clock-controller@0 { 

                     compatible = "amlogic,s4-peripherals-clkc"; 

                     reg = <0x0 0x0 0x0 0x49c>;
You mean it should be, right?

> Best regards,
> Krzysztof
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
