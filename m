Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBDDC43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Jul 2022 07:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TemSdOe8C0MRTG2jjlFIYpz7EXzcvOIiFN5XLsPevE0=; b=4LLGAC9TQiLXZSDsA2vshAEEHa
	QcT0/8OtfBuJDwDuUWDURo/FRb2srum27z1Iul846tfQ0eKHcrhafAXdd0Z7c+NLujjXmyg1sb+Zw
	EHSkMR0vU1+AS6VhQ7TSZ0/lvXl9Ru3eH2EemNbeiJQ0HtWZu/fHDSBs1gMomMccxLWqElurzcY0P
	ygUyViDt3nkMRiAtjIvLppx1CjApe7J3bKiywL+pgXWvYoORLNkmOCBbBtbuf9CzALkocdXkCnMaE
	Is2/NZ8p0A88wASkKpi1hiGgqG4zlSNdiGfMUdNs+pvWwpH07Z9k8IUpLaHzVAC+ldVNpn6spf4gG
	w/PHS53Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhjR-005wyf-7M; Tue, 19 Jul 2022 07:33:25 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhjF-005wuE-Vh; Tue, 19 Jul 2022 07:33:15 +0000
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 19 Jul
 2022 15:33:10 +0800
Message-ID: <654da860-3cf4-fd14-f7b2-09b9f8e83550@amlogic.com>
Date: Tue, 19 Jul 2022 15:33:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] clk: meson: s4: add s4 SoC clock controller driver
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
 <20220708062757.3662-4-yu.tu@amlogic.com>
 <7fe9aab5-73a2-6209-ae65-d955c426f745@linaro.org>
 <f5bf2abd-4d60-523a-3f84-879da2f1c78a@amlogic.com>
 <152cee25-9a36-a948-98e7-847d9ee36c1f@linaro.org>
 <50078eed-3c24-a4b5-1e21-3187daa9867a@amlogic.com>
 <12a2487c-6d49-af99-aa5c-edd7a2eff071@linaro.org>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <12a2487c-6d49-af99-aa5c-edd7a2eff071@linaro.org>
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_003314_051423_0CC668EB 
X-CRM114-Status: UNSURE (   8.35  )
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



On 2022/7/19 15:29, Krzysztof Kozlowski wrote:
> [ EXTERNAL EMAIL ]
> 
> On 19/07/2022 08:58, Yu Tu wrote:
>>>>>> @@ -1772,7 +1772,7 @@ M:	Jerome Brunet <jbrunet@baylibre.com>
>>>>>>     L:	linux-amlogic@lists.infradead.org
>>>>>>     S:	Maintained
>>>>>>     F:	Documentation/devicetree/bindings/clock/amlogic*
>>>>>> -F:	drivers/clk/meson/
>>>>>> +F:	drivers/clk/meson/*
>>>>>
>>>>> Why?
>>>> Warning is displayed when using checkpatch. I will correct it.
>>>
>>> What warning?
>>    ./scripts/checkpatch.pl --strict
>> 0001-clk-meson-s4-add-s4-SoC-clock-controller-driver.patch
>> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>> If I add that strange change, I won't have this WARNING.
>> Should I ignore this warning?
> 
> Yes, it's not related to the patch and the change you made looks not
> correct.
Thank you very much for your suggestion and I will correct it in the 
next patch.
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
