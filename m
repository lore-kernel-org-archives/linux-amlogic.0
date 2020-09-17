Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580C1C43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 11:01:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E46A12074B
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 11:01:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHAcx8Wx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E46A12074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Op7xdZq5XKYXhZzl+jHyIY+iSp2bxclXd+YiUjsX7k8=; b=oHAcx8WxBJS5cSoLxPuHj9nRa
	LG1fuu4Behj5WSmrxC6h948CG9M2SViZoyXU8P6vU07cSfRvyDOAQVw03Q/8dRfyXKcs025PJ0MeN
	Sfsnfxthw4j4voVympxc1sRhO28Jw/Lk45BWrDdN9P0Rl4yuunS/s+DW4Tz19dFDJ4WPKXC0717ZW
	odA1/nV67uTPT+NCq3e222v8AqpRLYfCDrrDjclvQXw2OWdTB6L8kCxDprgFLvcfbvIS2pQ9K7h1r
	zYU0w9ByFAisT+cs07MZ3+FZyazWFqYR2qYGprEJ3p9Cglica66b964R49wPdBS70CFLoshOpTHPq
	jahg2AxFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIrf0-0002of-IZ; Thu, 17 Sep 2020 11:01:06 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIrex-0002o2-HN; Thu, 17 Sep 2020 11:01:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E5E130E;
 Thu, 17 Sep 2020 04:01:02 -0700 (PDT)
Received: from [192.168.1.79] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E8523F68F;
 Thu, 17 Sep 2020 04:01:00 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Rob Herring <robh@kernel.org>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
 <20200916170409.GA2543@kevin>
 <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
 <d135f546-41aa-a6e2-52fe-7707d379c793@arm.com>
 <0518e067-3b9a-8fe3-619f-8fce4c6c9677@collabora.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <51a06e78-7b80-c65d-67c4-e026e729e505@arm.com>
Date: Thu, 17 Sep 2020 12:00:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0518e067-3b9a-8fe3-619f-8fce4c6c9677@collabora.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_070103_645279_C1F7447B 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 17/09/2020 11:51, Tomeu Vizoso wrote:
> On 9/17/20 12:38 PM, Steven Price wrote:
>> On 16/09/2020 18:46, Rob Herring wrote:
>>> On Wed, Sep 16, 2020 at 11:04 AM Alyssa Rosenzweig
>>> <alyssa.rosenzweig@collabora.com> wrote:
>>>>
>>>>> So I get a performance regression with the dma-coherent approach, 
>>>>> even if it's
>>>>> clearly the cleaner.
>>>>
>>>> That's bizarre -- this should really be the faster of the two.
>>>
>>> Coherency may not be free. CortexA9 had something like 4x slower
>>> memcpy if SMP was enabled as an example. I don't know if there's
>>> anything going on like that specifically here. If there's never any
>>> CPU accesses mixed in with kmscube, then there would be no benefit to
>>> coherency.
>>
>> The DDK blob has the ability to mark only certain areas of memory as 
>> coherent for performance reasons. For simple things like kmscube I 
>> would expect that it's basically write-only from the CPU and almost 
>> all memory the GPU touches isn't touched by the CPU. I.e. coherency 
>> isn't helping and the coherency traffic is probably expensive. Whether 
>> the complexity is worth it for "real" content I don't know - it may 
>> just be silly benchmarks that benefit.
> 
> Or maybe it's only a problem for applications that do silly things? I 
> don't think kmscube was ever optimized for performance.

Well doing silly things is almost the definition of a benchmark ;) A lot 
of the mobile graphics benchmarks suffer from not being very intelligent 
in how they render (e.g. many have meshes that are far too detailed so 
the triangles are smaller than the pixels).

Of course there are also applications that get things wrong too.

Steve

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
