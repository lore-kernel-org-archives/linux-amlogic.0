Return-Path: <SRS0=zLcP=25=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8659C282DD
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2020 14:20:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55A82070E
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jan 2020 14:20:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AbIc57gk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55A82070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KDkMM5lT5M+GDQUDkePp+xfnO7NWAVA1LDRnuL7nSzs=; b=AbIc57gkBEbQDd6L+GK+WRrsh
	burOrL1AxveXCJGK1TveKZfU9Eok9QJPqlINxgcAy2HHso3Dk91uqok61LNNDZtvXSwykBQjfBVRQ
	bWM4YxxhXZXg7PWCzd6F8iT93eggEs/o9B/eEExeibkD8I/7ax2/C0UxgY3uOKuN1Da0GGs62GIKc
	wAHdo6H2VksjI7WNsbWcGvvkwiiTpxMX4Aa6LcFUJ0RtbA/vxBgn/4z4l6o6eYD/XHMOfzAhaXtmN
	I7opajjo1DDVjt57w+TTIud6+5p32pAFvtzFXaKa7n0GZgcUxolVXi2Jf+JgbboD9kuLpmx0J6GVh
	rPQ5qt79Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipCCD-0006B7-1i; Wed, 08 Jan 2020 14:20:29 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipCC9-0006AI-7D; Wed, 08 Jan 2020 14:20:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F23B31B;
 Wed,  8 Jan 2020 06:20:24 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E4533F703;
 Wed,  8 Jan 2020 06:20:22 -0800 (PST)
Subject: Re: [PATCH RFT v1 1/3] drm/panfrost: enable devfreq based the
 "operating-points-v2" property
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20200107230626.885451-1-martin.blumenstingl@googlemail.com>
 <20200107230626.885451-2-martin.blumenstingl@googlemail.com>
 <a85f2063-f412-9762-58d1-47fdffb24af9@arm.com>
 <CAFBinCBYrNC+ULV6Y=77qogowkDZwM+H0bxOqPN4sT6q3krGfw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <be59a20b-af08-5b55-fa69-f87d5aa9f277@arm.com>
Date: Wed, 8 Jan 2020 14:20:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBYrNC+ULV6Y=77qogowkDZwM+H0bxOqPN4sT6q3krGfw@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_062027_081206_9CA037C1 
X-CRM114-Status: GOOD (  15.05  )
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
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, daniel@ffwll.ch,
 Sudeep Holla <sudeep.holla@arm.com>, linux-amlogic@lists.infradead.org,
 alyssa@rosenzweig.io
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

[ +Sudeep ]

On 08/01/2020 12:38 pm, Martin Blumenstingl wrote:
> Hi Robin,
> 
> On Wed, Jan 8, 2020 at 12:18 PM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 07/01/2020 11:06 pm, Martin Blumenstingl wrote:
>>> Decouple the check to see whether we want to enable devfreq for the GPU
>>> from dev_pm_opp_set_regulators(). This is preparation work for adding
>>> back support for regulator control (which means we need to call
>>> dev_pm_opp_set_regulators() before dev_pm_opp_of_add_table(), which
>>> means having a check for "is devfreq enabled" that is not tied to
>>> dev_pm_opp_of_add_table() makes things easier).
>>
>> Hmm, what about cases like the SCMI DVFS protocol where the OPPs are
>> dynamically discovered rather than statically defined in DT?
> where can I find such an example (Amlogic SoCs use SCPI instead of
> SCMI, so I don't think that I have any board with SCMI support) or
> some documentation?
> (I could only find SCPI clock and CPU DVFS implementations, but no
> generic "OPPs for any device" implementation)

On closer inspection I think this applies to the SCPI DVFS protocol 
too[1]. AIUI the fact that neither is wired up to a devfreq driver yet 
is merely due to lack of demand and suitable systems to develop/test on 
so far - the panfrost devfreq code is only now looking like the first 
viable upstream use-case ;)

Robin.

[1] http://infocenter.arm.com/help/topic/com.arm.doc.dui0922g/BABFEBCD.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
