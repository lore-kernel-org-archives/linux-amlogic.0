Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DDCC004D4
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jan 2023 02:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlVpPAdcYct8CxDmArSqteDSFYMljy0VPnPxtw8UgoA=; b=2/3c64Hbn3kT02
	yG0RxQWNJ5g8QegkjNENA0RkuzAm2vs6jWWSC4BrnwIuq2nFQzGh6VrqP1tX3E5YvFsplW7Bw23SN
	RpcSmoep+m1IME7ogJRTSqmrT8iQm5fwypYOCW7+hQ3jdvDyd0BFOKKPWCZMMCQaA98qO00lActBb
	LsDccgl/YFAgnKci/9vCuZFK2wZYj+0hTu13I7KAynd6y3c6m1U6gpIdL7QEKlOwhhN6ZeLd2WdD7
	tUQBlU078O942P5UFlmjSKx0eGrQJ/g+e1vNm7hWjKgFEFRX4dp+wTQ0nSp/8TciTR8yyPUmCabee
	LB1NKFGzHzv7OkoSj1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIh6W-0083XY-AQ; Fri, 20 Jan 2023 02:26:08 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIh6H-0083UM-Fx; Fri, 20 Jan 2023 02:25:54 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 20 Jan
 2023 10:25:42 +0800
Message-ID: <9c34a8fc-de76-4beb-8841-9bcfd1a55cd1@amlogic.com>
Date: Fri, 20 Jan 2023 10:25:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V6 1/3] dt-bindings: clock: document Amlogic S4 SoC PLL &
 peripheral clock controller
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
Content-Language: en-US
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <7hwn5jqrxf.fsf@baylibre.com>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_182553_581595_4E9129C0 
X-CRM114-Status: GOOD (  10.77  )
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


Hi Kevin,

On 2023/1/19 8:38, Kevin Hilman wrote:
> [ EXTERNAL EMAIL ]
> 
> Yu Tu <yu.tu@amlogic.com> writes:
> 
>> On 2023/1/16 16:29, Krzysztof Kozlowski wrote:
> 
> [...]
> 
>>>> diff --git a/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>>> new file mode 100644
>>>> index 000000000000..bbec5094d5c3
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
>>>> @@ -0,0 +1,131 @@
>>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>>>
>>> Unusual license... are you sure to license the bindings under GPLv4 or
>>> GPLv5? Fine by me.
>>>
>>
>> Yes.
> 
> The rest of the bindings for Amlogic SoCs are GPL-2.0 (without the '+').
> Adding the dual-license for MIT seems fine, but adding the '+' is
> curious.
> 
> It would be helpful if you could please explain why you'd like these
> bindings to be licensed differently than the rest of the SoC family.
> 

I actually refer to the previous g12a Soc.
https://elixir.bootlin.com/linux/v6.2-rc4/source/include/dt-bindings/clock/g12a-clkc.h
https://elixir.bootlin.com/linux/v6.2-rc4/source/include/dt-bindings/clock/axg-clkc.h
[...]

So if you think it is not necessary, I will delete the '+' as you 
suggested. Don't know what you choose?

> Kevin
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
