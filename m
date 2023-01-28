Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0347C38142
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Jan 2023 08:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zI5mHLUn5MDzBp/weYCovoegAgRGXVU0Vr0ZwHAxfbQ=; b=0K+2akvTxsn2kf
	DrSTS8thfdYkB99fjmTW6dpbQEmcZ332lTwVMzdM5WX0rhyH5WKv//9W+VHuuo1irrFLtfLqt6Z73
	myB7wFbEQiVpyywbTCmRFZcjTN2hFTHSmDTfq5o+1xtX/ZMlGmmwFrDx95YGkBBWZ2h6bzW7wwnZa
	DSQymb6dYikUOtXJ5JKh0kSq1AncJXBGjGGoSXFCodr5ORZ4JAbCav/q1VfobRMBho7/QCUPv4D0C
	18CD5QZzHMbw04cN/u8BTAU39XFNdWspghPvlW/csp1dsGy9oDnTzkRHKwrqUH4wHGVmLmGbH2+YD
	421odSDHf+SdaNe0Gx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLgRV-00HSIg-2x; Sat, 28 Jan 2023 08:20:09 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLgRI-00HSFH-Ge; Sat, 28 Jan 2023 08:19:57 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Sat, 28 Jan
 2023 16:19:38 +0800
Message-ID: <709ea82e-1835-01be-1376-0899c2ba5655@amlogic.com>
Date: Sat, 28 Jan 2023 16:19:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V6 1/3] dt-bindings: clock: document Amlogic S4 SoC PLL &
 peripheral clock controller
Content-Language: en-US
To: Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome
 Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: "kelvin . zhang" <Kelvin.Zhang@amlogic.com>, "qi . duan"
	<qi.duan@amlogic.com>
References: <20230116074214.2326-1-yu.tu@amlogic.com>
 <20230116074214.2326-2-yu.tu@amlogic.com>
 <02b6b3a6-e2ad-8cbc-fa15-fbd2db6ada64@linaro.org>
 <7c0133a2-ea4d-645e-3df2-2bb832bbd498@amlogic.com>
 <7hwn5jqrxf.fsf@baylibre.com>
 <9c34a8fc-de76-4beb-8841-9bcfd1a55cd1@amlogic.com>
 <7ho7qnh33v.fsf@baylibre.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <7ho7qnh33v.fsf@baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_001956_599323_0F60B3E8 
X-CRM114-Status: UNSURE (   8.56  )
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



On 2023/1/25 8:25, Kevin Hilman wrote:
> [ EXTERNAL EMAIL ]
> 
> Yu Tu <yu.tu@amlogic.com> writes:
> 
>> Hi Kevin,
>>
>> On 2023/1/19 8:38, Kevin Hilman wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> Yu Tu <yu.tu@amlogic.com> writes:
>>>
>>>> On 2023/1/16 16:29, Krzysztof Kozlowski wrote:
>>>
>>> [...]
>>>
>>>>>> diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>>>>> new file mode 100644
>>>>>> index 000000000000..bbec5094d5c3
>>>>>> --- /dev/null
>>>>>> +++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>>>>> @@ -0,0 +1,131 @@
>>>>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>>>>>
>>>>> Unusual license... are you sure to license the bindings under GPLv4 or
>>>>> GPLv5? Fine by me.
>>>>>
>>>>
>>>> Yes.
>>>
>>> The rest of the bindings for Amlogic SoCs are GPL-2.0 (without the '+').
>>> Adding the dual-license for MIT seems fine, but adding the '+' is
>>> curious.
>>>
>>> It would be helpful if you could please explain why you'd like these
>>> bindings to be licensed differently than the rest of the SoC family.
>>>
>>
>> I actually refer to the previous g12a Soc.
>> https://elixir.bootlin.com/linux/v6.2-rc4/source/include/dt-bindings/clock/g12a-clkc.h
>> https://elixir.bootlin.com/linux/v6.2-rc4/source/include/dt-bindings/clock/axg-clkc.h
>> [...]
>>
>> So if you think it is not necessary, I will delete the '+' as you
>> suggested. Don't know what you choose?
> 
> Drop the `+`

Okay.

> 
> Kevin
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
