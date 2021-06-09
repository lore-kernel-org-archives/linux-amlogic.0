Return-Path: <SRS0=+B/b=LD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48C3C48BD1
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 16:18:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 997EC6139A
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Jun 2021 16:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 997EC6139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MpJQfLNyToW13W3biTZNudsDKHf5L4WEmaoJrdxX7as=; b=ItFb18L9VPX3nCMe1d0N6oBWuO
	OU7/Dn6c9/CvIMm2oq4qLg3nv0RKr/yCYMPJ2wUjuFzRinp3tIcndBE3nsxIM92sNWm97Mm/QtIl6
	JSgxu87jxuiBvwkhTux7oCbArR27BWqxsvhtWa6UaOXC/ZWkUkntGbHvBo4FG/4R+Wn+ik42NUldr
	8lXbd7chIHPSZFVnSV6n1H4MdFWn62l1zXWg6AWoN33oZIjL27Z4nUUJxmNlaIRTanoVJdSZ9slFL
	ve9wHoEkhxtllwknAi8maxA6oefyhWoShTpkS6Sl0X2ofbDJPskFK/LS/Vrz4ZBj9qQENuQ9czaL0
	ABhkaFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr0uU-00ErXL-UW; Wed, 09 Jun 2021 16:18:30 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqzhm-00ETBH-5W; Wed, 09 Jun 2021 15:01:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50636D6E;
 Wed,  9 Jun 2021 08:01:16 -0700 (PDT)
Received: from [10.57.6.115] (unknown [10.57.6.115])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C3DE3F73D;
 Wed,  9 Jun 2021 08:01:14 -0700 (PDT)
Subject: Re: [RFC] mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk
To: Neil Armstrong <narmstrong@baylibre.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, ulf.hansson@linaro.org
Cc: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20210608153357eucas1p24cbc7a2ddb00beada8cdd51ae2337c53@eucas1p2.samsung.com>
 <20210608153344.3813661-1-narmstrong@baylibre.com>
 <e9f057f6-324e-0637-b57a-cc2f87e0d108@samsung.com>
 <ebb1421c-e55c-eee3-ea42-09ae051659d4@baylibre.com>
 <92024ca5-c6fa-0e6a-b6ba-f35f92222e76@arm.com>
 <a59a4dd3-9a09-a9b4-71f2-7e37c92cf40e@baylibre.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <f1dbc6e2-e956-e582-4368-fcad95d596bf@arm.com>
Date: Wed, 9 Jun 2021 16:01:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <a59a4dd3-9a09-a9b4-71f2-7e37c92cf40e@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_080118_394321_5E08CEA7 
X-CRM114-Status: GOOD (  14.07  )
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

On 2021-06-09 15:55, Neil Armstrong wrote:
> Hi Robin,
> 
> On 09/06/2021 16:45, Robin Murphy wrote:
>> On 2021-06-09 14:07, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 08/06/2021 17:50, Marek Szyprowski wrote:
>>>> Hi
>>>>
>>>> On 08.06.2021 17:33, Neil Armstrong wrote:
>>>>> It has been reported that usage of memcpy() to/from an iomem mapping is invalid,
>>>>> and and recent arm64 memcpy update [1] triggers a memory abort when dram-access-quirk
>>>>> is used on the G12A/G12B platforms.
>>>>>
>>>>> This adds a local sg_copy_to_buffer which makes usage of io versions of memcpy
>>>>> when dram-access-quirk is enabled.
>>>>>
>>>>> Fixes: acdc8e71d9bb ("mmc: meson-gx: add dram-access-quirk")
>>>>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>>
>>>>> [1] 285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")
>>>>>
>>>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>>>> ---
>>>>> Hi Ulf, Marek, Mark,
>>>>>
>>>>> I haven't tested the patch yet, but should fix issue reported at [2].
>>>>
>>>> Works fine here and fixed the issue.
>>>>
>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> Thanks, I'll need to rework to pass an __iomem pointer to memcpy_to/fromio so sparse doesn't scream anymore.
>>
>> Hmm, might it be worth factoring out general sg_copy_{to,from}_iomem() helpers? From a quick grep I found at least mv_cesa_sg_copy() already doing essentially the same thing as meson_mmc_copy_buffer().
> 
> It's definitely worth it, but since we need a quick fix, we should have meson_mmc_copy_buffer() as a fix then we should definitely move to sg_copy_{to,from}_iomem() helpers

Oh, that makes sense for sure - I was just doing some general thinking 
out loud before I forget about the whole thing :)

Cheers,
Robin.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
