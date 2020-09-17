Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D551BC43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 12:38:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76595208E4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 12:38:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PoWWbAuV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76595208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s54AG4ShUU7l0dJCkf0A4zDNbbV7F/2QZhcydZiQ1aY=; b=PoWWbAuVtdIunRjaoLnF5yUUL
	uavjOwq920u5P8g8u6XGSHyTwrb/sZ4f1bOoDyeE3fIjqQmwAvcsEzgfCOAhznSTN3lJpn2rR9Y57
	hU4lvLSwHWlAY3Zv5CG84KlNEhMXwzbi4TQ/TPSYSrG7DnYTkoqw9FOULxSb6A7P4P0BbvVQNKWHj
	5ssfZkAZ54mf9X0ylKUjI5vhRqGcVPGVM2lBfwUhSziuuvvi1mLFasmPA+ckPzqeU1oDvi4HNMZ/q
	gmkBFoDI0HWRAnqAQOdzD+goEFQ+mgzIqV5g8bATGuvIsd01iT8jGo7CFpVNib9pNQtRX3sj5L4P7
	Q00FXM8tg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kItBJ-0005A6-Dp; Thu, 17 Sep 2020 12:38:33 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kItBG-00057h-Lt; Thu, 17 Sep 2020 12:38:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D639B30E;
 Thu, 17 Sep 2020 05:38:27 -0700 (PDT)
Received: from [10.57.47.84] (unknown [10.57.47.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 388B63F68F;
 Thu, 17 Sep 2020 05:38:25 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
To: Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
 <20200916170409.GA2543@kevin>
 <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <88bc6b29-9206-477f-4c45-a1e55efb66af@arm.com>
Date: Thu, 17 Sep 2020 13:38:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_083830_771739_40DAA5F1 
X-CRM114-Status: GOOD (  20.49  )
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-09-16 18:46, Rob Herring wrote:
> On Wed, Sep 16, 2020 at 11:04 AM Alyssa Rosenzweig
> <alyssa.rosenzweig@collabora.com> wrote:
>>
>>> So I get a performance regression with the dma-coherent approach, even if it's
>>> clearly the cleaner.
>>
>> That's bizarre -- this should really be the faster of the two.
> 
> Coherency may not be free. CortexA9 had something like 4x slower
> memcpy if SMP was enabled as an example. I don't know if there's
> anything going on like that specifically here. If there's never any
> CPU accesses mixed in with kmscube, then there would be no benefit to
> coherency.

There will still be CPU benefits in terms of not having to spend time 
cache-cleaning every BO upon allocation, and less overhead on writing 
out descriptors in the first place (due to cacheable vs. non-cacheable).

I haven't tried the NSh hack on Juno, but I don't see any notable 
performance issue as-is - kmscube hits a solid 60FPS from the off (now 
that it works without spewing faults). Given that the hardware on Juno 
can be generously described as "less good", it would certainly be 
interesting to figure out what difference is at play here...

The usual argument against I/O coherency is that it adds latency to 
every access, but if you already have a coherent interconnect anyway 
then the sensible answer to that is implementing decent snoop filters, 
rather than making software more complicated.

Robin.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
