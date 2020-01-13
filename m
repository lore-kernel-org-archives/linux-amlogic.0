Return-Path: <SRS0=Ohoh=3C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B487C33CA9
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 17:12:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 158B12075B
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2020 17:12:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Unt9L6hw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 158B12075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zfF3pCMdRfvlJRQ1PNbaqrVK1sFo+GRVYSI5fOw1CnA=; b=Unt9L6hwU3Yw/q
	v1OUEbyiXPU8pBadWPKht6BQ2G4t08y5Dp079apoTik56Tnr1oqZSYAbSyEonxmJNhbrLRX01lULv
	gVcM4a+Fut/NzHxXD3dXxUrSQS5Tlad32sKY5nc1wNwR3Fy8OpGZ2CY5WjqaHbWfsDV26/xNaoFxg
	f92p+wvHOlf/KxijEvN6nPhpVKYc7Uf+HjgUDXTkqd59FROp5ntt5z5PqqxzaElJO47vqVJuKrlWp
	RvbA9n0e//ENSGzAtVgztmczQc1q816XOpYinbHYLnlkzm1UOk5bLJZt04KYudipkInumpliYhzXW
	SsmWPyQoxhyaA0PklMVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir3G8-0006z0-Ml; Mon, 13 Jan 2020 17:12:12 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir3EQ-000554-T0; Mon, 13 Jan 2020 17:10:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98A4C11B3;
 Mon, 13 Jan 2020 09:10:25 -0800 (PST)
Received: from [10.1.194.52] (e112269-lin.cambridge.arm.com [10.1.194.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48CE13F534;
 Mon, 13 Jan 2020 09:10:24 -0800 (PST)
Subject: Re: [PATCH RFT v1 3/3] drm/panfrost: Use the mali-supply regulator
 for control again
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-4-martin.blumenstingl@googlemail.com>
 <2ceffe46-57a8-79a8-2c41-d04b227d3792@arm.com>
 <CAFBinCD7o-q-i66zZhOro1DanKAfG-8obQtzxxD==xOwsy_d6A@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <21d0730b-8299-8bfd-4321-746ccb3772d0@arm.com>
Date: Mon, 13 Jan 2020 17:10:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCD7o-q-i66zZhOro1DanKAfG-8obQtzxxD==xOwsy_d6A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_091027_075740_F2C88A22 
X-CRM114-Status: GOOD (  18.95  )
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, robin.murphy@arm.com, alyssa@rosenzweig.io
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/01/2020 17:27, Martin Blumenstingl wrote:
> On Thu, Jan 9, 2020 at 12:31 PM Steven Price <steven.price@arm.com> wrote:
>>
>> On 07/01/2020 23:06, Martin Blumenstingl wrote:
>>> dev_pm_opp_set_rate() needs a reference to the regulator which should be
>>> updated when updating the GPU frequency. The name of the regulator has
>>> to be passed at initialization-time using dev_pm_opp_set_regulators().
>>> Add the call to dev_pm_opp_set_regulators() so dev_pm_opp_set_rate()
>>> will update the GPU regulator when updating the frequency (just like
>>> we did this manually before when we open-coded dev_pm_opp_set_rate()).
>>
>> This patch causes a warning from debugfs on my firefly (RK3288) board:
>>
>> debugfs: Directory 'ffa30000.gpu-mali' with parent 'vdd_gpu' already
>> present!
>>
>> So it looks like the regulator is being added twice - but I haven't
>> investigated further.
> I *think* it's because the regulator is already fetched by the
> panfrost driver itself to enable it
> (the devfreq code currently does not support enabling the regulator,
> it can only control the voltage)
> 
> I'm not sure what to do about this though

Having a little play around with this, I think you can simply remove the
panfrost_regulator_init() call. This at least works for me - the call to
dev_pm_opp_set_regulators() seems to set everything up. However I
suspect you need to do this unconditionally even if there are no
operating points defined.

> [...]
>>>       ret = dev_pm_opp_of_add_table(dev);
>>> -     if (ret)
>>> +     if (ret) {
>>> +             dev_pm_opp_put_regulators(pfdev->devfreq.regulators_opp_table);
>>
>> If we don't have a regulator then regulators_opp_table will be NULL and
>> sadly dev_pm_opp_put_regulators() doesn't handle a NULL argument. The
>> same applies to the two below calls obviously.
> good catch, thank you!
> are you happy with the general approach here or do you think that
> dev_pm_opp_set_regulators is the wrong way to go (for whatever
> reason)?

To be honest this is an area I still don't fully understand. There's a
lot of magic helper functions and very little in the way of helpful
documentation to work out which are the right ones to call. It seems
reasonable to me, hopefully someone more in the know will chime in it
there's something fundamentally wrong!

Thanks,

Steve

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
