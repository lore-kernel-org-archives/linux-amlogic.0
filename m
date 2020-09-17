Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A5FC43461
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:51:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4FE2204FD
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 10:51:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PYBJrZ2A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4FE2204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5Z/pp36vy5GWBEcT+YfRr4lqmNHqBRhZSntQNtzUjoA=; b=PYBJrZ2AqqtSMh74uBAByxBoi
	S2wP6X9IZSWF3/+agSrhTL9SJgF8boU5J0AYfieF0MKFYByfIy5J1Lv4+QMZ+bNHxIVApiUvXbUKH
	J2FJNdV5mEhhTHeQCScGea7omQxoHtcoCbLV0UCuqLamq/YwU6wmmlYWxRcVywYfLPAn+fdfGd3XJ
	5oRHSYRK3J8nj0SYyJ3QgNBE2gqpm0a3ArlnTLQxAOJzAsCCIx8NvvqV3Cg53IgqyROEBpoI0qyRa
	WXuDFNk0G/OhLMlW4dxs8n4gZJJYheLuvNNVR2yLug3+xI5w5LCF3YIxb2uH9m2I64YG/PJEqvn9r
	Pi2jBj2Dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIrVT-00023L-4N; Thu, 17 Sep 2020 10:51:15 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIrVP-00021L-T6; Thu, 17 Sep 2020 10:51:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 9287529BF49
Subject: Re: [PATCH 0/3] drm: panfrost: Coherency support
To: Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d109e9da-feb3-c09f-2b7f-98c92ce39593@baylibre.com>
 <20200916170409.GA2543@kevin>
 <CAL_JsqLGO4YYPjQsjnzZCW5iT6n+keZw9G9mFALJip0nDo42Hw@mail.gmail.com>
 <d135f546-41aa-a6e2-52fe-7707d379c793@arm.com>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <0518e067-3b9a-8fe3-619f-8fce4c6c9677@collabora.com>
Date: Thu, 17 Sep 2020 12:51:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d135f546-41aa-a6e2-52fe-7707d379c793@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_065112_080155_AA8937E6 
X-CRM114-Status: GOOD (  17.45  )
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

On 9/17/20 12:38 PM, Steven Price wrote:
> On 16/09/2020 18:46, Rob Herring wrote:
>> On Wed, Sep 16, 2020 at 11:04 AM Alyssa Rosenzweig
>> <alyssa.rosenzweig@collabora.com> wrote:
>>>
>>>> So I get a performance regression with the dma-coherent approach, 
>>>> even if it's
>>>> clearly the cleaner.
>>>
>>> That's bizarre -- this should really be the faster of the two.
>>
>> Coherency may not be free. CortexA9 had something like 4x slower
>> memcpy if SMP was enabled as an example. I don't know if there's
>> anything going on like that specifically here. If there's never any
>> CPU accesses mixed in with kmscube, then there would be no benefit to
>> coherency.
> 
> The DDK blob has the ability to mark only certain areas of memory as 
> coherent for performance reasons. For simple things like kmscube I would 
> expect that it's basically write-only from the CPU and almost all memory 
> the GPU touches isn't touched by the CPU. I.e. coherency isn't helping 
> and the coherency traffic is probably expensive. Whether the complexity 
> is worth it for "real" content I don't know - it may just be silly 
> benchmarks that benefit.

Or maybe it's only a problem for applications that do silly things? I 
don't think kmscube was ever optimized for performance.

Regards,

Tomeu

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
