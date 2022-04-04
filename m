Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C58C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 18:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AxW+/MmSzuclEa4jxwpTh3KHRd5oJNil99MEovk66DM=; b=EZRZ0TZqxH4mLH
	F8dDRczDvOT/kjexTBzS7Pe+CmYv75a22lJk5DpvrhIspHbn8p2NtAjb438CTsmimfbYPx5imrppD
	ctajGO+63PfXYI3mPrTQb45WbgpGfxe6t9MLmM8+gcwPE5fxfO6WAKXic1uUUwbjCc1IFV2qGQgoI
	E57OM7PtNXKvEEHC1U3w2xcEyXn4KXy9L6UbIZzVY/nZ/skVGMiy+42Rw0oHMcQSh7k/z+GMH5gVH
	4B9iMyodITQnwc0GzVYO1jyzrRf9N6lOxawotuoMwRCWaEZlMDXWhEe9Fgf8ARUejdlzenNtnfGlR
	qVOLmnZBpfINdViC7+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbR0C-00G5PA-6t; Mon, 04 Apr 2022 18:00:32 +0000
Received: from mx.msync.work ([51.91.38.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbR09-00G5Mo-9D; Mon, 04 Apr 2022 18:00:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CC3A73B01F; Mon,  4 Apr 2022 18:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
 t=1649095223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=e4rEEW1CHNAO9Rw05pMKLdvrOaRjn2nB0lWvqsJB/YE=;
 b=AGxfBeyUsX2CJvgiIWm9xFYwWlrarsTY0GIWhYZj3CYvlEOgR/Gnws76052KycThOR4h14
 wuwBMur/eJ80gpveFSKQ7w1BktIOziBXSN3lkTYY1RiqxaSubjGpKDzcTL9bWxxGne/dZ5
 N0J4K+Zrf/lJzIQqlmNDohShl1c6I2+EveF4ikgLmfWrAUpJ4ktvniMl9PJwY30VEqI/zf
 lUEJctuhA3h2WDs3q2rJ+nyu5x/Iaz9KjCxUg+G0YW5/8uc3I099BtVMke8n5hKlRloAtk
 Rd0cThQGLCujPT7NYNy0lcv+3Hz7Rt+ZE/W2C5hFk5wb9rDU5BTH8+9ooAIlwA==
Message-ID: <d4ebfe84-2948-8270-32f4-6cfc55047600@lexina.in>
Date: Mon, 4 Apr 2022 21:00:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
Content-Language: ru
To: Neil Armstrong <narmstrong@baylibre.com>, tanure@linux.com,
 Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220326102229.421718-1-tanure@linux.com>
 <7hee2lu82n.fsf@baylibre.com>
 <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
 <8986ec34-616b-d497-29d1-6f7896c26e37@baylibre.com>
From: Vyacheslav <adeep@lexina.in>
In-Reply-To: <8986ec34-616b-d497-29d1-6f7896c26e37@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_110029_827756_0C56A567 
X-CRM114-Status: GOOD (  13.94  )
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



04.04.2022 11:01, Neil Armstrong wrote:
> Hi,
> 
> On 29/03/2022 00:31, Lucas Tanure wrote:
>> On Mon, 28 Mar 2022, 21:37 Kevin Hilman, <khilman@baylibre.com> wrote:
>>>
>>> Hi Lucas,
>>>
>>> Lucas Tanure <tanure@linux.com> writes:
>>>
>>>> The default duty cycle of 33% is less than the required
>>>> by the I2C specs for the LOW period of the SCL clock.
>>>>
>>>> So, for 100Khz or less, use 50%H/50%L duty cycle, and
>>>> for the clock above 100Khz, use 40%H/60%L duty cycle.
>>>> That ensures the low period of SCL is always more than
>>>> the minimum required by the specs at any given frequency.
>>>
>>> Thanks for the fixes!
>>>
>>> This is going to affect all SoCs, so ould you please summarize how your
>>> changes were tested, and on which SoCs & boards?
>>>
>>> Thanks,
>>>
>>> Kevin
>>
>> Hi,
>>
>> I only tested against the vim3 board, measured the bus with a Saleae
>> logic pro 16.
>> The measurements were with 100k, 400k, and a few in-between frequencies.
> 
> Thanks, it's a great addition to have !
> 
>>
>> Is that enough?
> 
> A test on GXL/GXM (VIM1 or VIM2) & GXBB (Odroid-C2) devices is lacking 
> before we
> can merge this.
> 
> If I find some time, I'll have a try, but everyone is welcome testing 
> this serie
> and report if it still works fine for them.
> 
> Vyacheslav, do you think you can test on your JetHub devices ? it would 
> validate GXL & AXG.

It builds ok on 5.17. JetHub H1/D1 has only rtc clock (pcf8563) and 
1-wire controller (ds2482) on i2c bus. I did't see any difference with 
or without patches. all works at first look.

Vyacheslav


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
