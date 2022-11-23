Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3677FC433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Nov 2022 14:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sqhD6Rd3+PsWRW4alMOFulkTqMMYg9WEB32t/NuuFtQ=; b=u2uX66sQaRgXqL
	Jrm+xCYl0695s5ULc9EHDzBaGyTxpJXVjxP44mxByu6pTRQ6uL4/M7kC3JM1QafCXt6rN79l2GP+U
	gN9/Qf3Arb99gN/c5dToRopfUWh04dzb0Xy2ijGDal/dJAsg/FdG4f0sEkL4jS7NmJkRyku83UOig
	ZktrQ7j/vXIUMAEqfueKN384tjy901zohvcmKg+ueNiq3oz6JyZKyfZw5dSCVg/5xC14KaOPuU98Z
	/cze+/Ojxrt2sq9+oHd1rsNeq9rrMvVvHtOYOxUsIL5RPAZI+H85fUFZKIIsloSqnuXqoE9MVDnsv
	/ck7ujtsXT3/AmZD0FSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqQq-00HVP2-1X; Wed, 23 Nov 2022 14:08:56 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqQa-00HVGz-Ko; Wed, 23 Nov 2022 14:08:41 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 22:08:38 +0800
Message-ID: <69008e98-2dad-9999-9ebc-e5fc0d384808@amlogic.com>
Date: Wed, 23 Nov 2022 22:08:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH V5 3/4] clk: meson: s4: add s4 SoC peripheral clock
 controller driver and bindings
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
 <20221123021346.18136-4-yu.tu@amlogic.com>
 <09a443b3-4e27-a751-ba2c-057d69363a13@linaro.org>
 <cf7295c7-3ec6-3017-0c21-167da06e3214@amlogic.com>
 <2418f79c-ae56-9e4e-46e2-f1ca757642ee@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <2418f79c-ae56-9e4e-46e2-f1ca757642ee@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_060840_726927_C88E2BCA 
X-CRM114-Status: GOOD (  12.24  )
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

On 2022/11/23 21:06, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 23/11/2022 12:22, Yu Tu wrote:
>>
>>
>> On 2022/11/23 18:09, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On 23/11/2022 03:13, Yu Tu wrote:
>>>> Add the peripherals clock controller found and bindings in the s4 SoC family.
>>>>
>>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>>> ---
>>>>    .../clock/amlogic,s4-peripherals-clkc.yaml    |  105 +
>>>
>>> No, this is total mess now.
>>>
>>> Additionally, you received a lot of feedback but your changelog says only:
>>> "V3 -> V4: change format and clock flags."
>>> so you ignored entire feedback?
>>>
>>> That's not the way to work with patches.
>>
>> Hi Krzysztof,
>> 	You can check the previous email reply. Now I don't know who to follow
>> your advice or Jerome's. I'm confused. Maybe you need to come to a
>> conclusion. So I can change it in the next patch.
> 
> I don't understand your comment. You received a lot of things to change
> for your v3. You said here "change format and clock flagS", so all other
> feedbacks from me were ignored? They were not contradicting to Jerome's
> comments, so either you implement them and mention this in changelog, or
> you keep discussing.
> 

I'm sorry I didn't write that clearly. The reality is that V4 I have 
changed some of the suggestions from Jerome. But there was a part that 
didn't agree before I sent V4, which Jerome chose to skip. Let's 
continue with V3, and then prepare this V5.

> Best regards,
> Krzysztof
> 
> .

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
