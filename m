Return-Path: <SRS0=sGw/=2Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19E4C2D0DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 09:06:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A48D42071E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Dec 2019 09:06:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TfgWrjiD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nvAkBpcL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A48D42071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=u4+2vGDwjL8nI7Ilj+XJPSn2/H3ULfK4uOqiQy+LOyQ=; b=TfgWrjiD0GAgVc7ZLPj8/UWfMS
	ti+Jf5Nll63YZyBw1pSyjxpIQ9QeND/4xIXr8sLHEBEjeaJkAeXi2JpkgMCjttH3F+8GxFc2Aciva
	r+FXFjeXSnHkHkgIcT6LsP+jFglQvl1lAtJIW38xVIilSRlEbcp+xiVJLQVSj9jI8C54UcoKxAQwQ
	3ggSYAT6ynawASAwwbrfm6j6T/ahm/vPI/vSgXNszcJe2wZ48JQg5oI+hgc3FP3+5dRUDZhBasGn3
	nVB4Zy0hyihi/mrDdhDk3WKe0/Po6JHqBXqtuZohmYG3c4OndpBk2CzwFsgS9cvaqECHHkry2KmVH
	JEsWr/Zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikP6J-0005nQ-78; Thu, 26 Dec 2019 09:06:35 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikP6F-0005ma-EY
 for linux-amlogic@lists.infradead.org; Thu, 26 Dec 2019 09:06:33 +0000
Received: by mail-wr1-x443.google.com with SMTP id q6so23126500wro.9
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Dec 2019 01:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=j+rJoTy0dYbhBsarNtahr7o1qTLApLBfvxcpqlInHlY=;
 b=nvAkBpcLAc37eLjbd+5F1xgcQDzAXQtQeP4B1sH1ZFgFzUItSmCkmKqNGtzXfN6OiW
 6+vCt2bOh/Hvi2EA/v4KzokKHx+eVD4kEpiNrlXY8ahXLo9/mpbjT6liE/YTg9SRSaMm
 utHNu39DVrnNl2QpY6UbC5IN1LV/lnGJIMA92dnSMco8Rift6OtpnErNPXe0Vm/bBVMl
 bRiMpveqWcfgP9B6rlr+oH8hSVUPPVeGMhQwJgQpUBfSc9tHshI32bAeQOEqImwsdvXr
 mmKgunF6XiojdV+75+DvbqIS1xA1MRlzhj2Og/lD9EHpAOWa/zZ36YGNhFuW/Y0gqvmd
 yrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=j+rJoTy0dYbhBsarNtahr7o1qTLApLBfvxcpqlInHlY=;
 b=IB28RnwFXc33C6Tp9PhN4y3EL/UiWPGYbQXfdHuPMpfBfKKigXoOhtZDV4/zPNNqaR
 FQTuNZp/sAEHdqP0qAsKfz8I1Tq/gv/P1qeby8Dw03zWW6FrwDY2hE86SWXnkwut0e4h
 oU+Ob0NnOjK3m0uDfFKFe1qcx2TtO0YWN+irYPfkzbJqBe+QNcmBfKyqSkEporxoKVth
 abMxIvVHJ1yhLEkZu834HhCH1pcHtgPwgugIFRUziYtGDUTcOc7bqimGXEr5jdBBGCUB
 h9vmPEGLCHYgXkBY3HXetQvGhYt2kvNOjVozjFaGoO0FjIMd//IbQKfktrgRSkT9/2s5
 bsdA==
X-Gm-Message-State: APjAAAW4P0Jh1nIyLvY+S/v2q7GO5+Ddchc2e4be6c+yaRuS393i8B1M
 qrgxMQzXghJC8sLI5eCM6VwsRQ==
X-Google-Smtp-Source: APXvYqzOwW1G2WbL2PBTGbpeF0gLW3p6XrRVMRXhqGRlF15j/j5EuqDwuC2Ds5c/xELL0O/J7Q24CA==
X-Received: by 2002:adf:b60f:: with SMTP id f15mr41821186wre.372.1577351186530; 
 Thu, 26 Dec 2019 01:06:26 -0800 (PST)
Received: from localhost ([2a01:e0a:1a5:7ee0:1e09:f4bb:719a:3028])
 by smtp.gmail.com with ESMTPSA id g7sm30361342wrq.21.2019.12.26.01.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 01:06:25 -0800 (PST)
References: <20191215210153.1449067-1-martin.blumenstingl@googlemail.com>
 <1jr214bpl0.fsf@starbuckisacylon.baylibre.com>
 <20191216175015.2A642206EC@mail.kernel.org>
 <1jlfrcaxmm.fsf@starbuckisacylon.baylibre.com>
 <20191224033636.1BB3F206B7@mail.kernel.org>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Subject: Re: [PATCH 0/1] clk: Meson8/8b/8m2: fix the mali clock flags
In-reply-to: <20191224033636.1BB3F206B7@mail.kernel.org>
Date: Thu, 26 Dec 2019 10:06:25 +0100
Message-ID: <1jimm3pib2.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_010631_634253_1F873143 
X-CRM114-Status: GOOD (  28.25  )
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
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 24 Dec 2019 at 04:36, Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Jerome Brunet (2019-12-16 11:17:21)
>> 
>> On Mon 16 Dec 2019 at 18:50, Stephen Boyd <sboyd@kernel.org> wrote:
>> 
>> > Quoting Jerome Brunet (2019-12-16 01:13:31)
>> >> 
>> >> *updated last* which crucial to your use case.
>> >> 
>> >> I just wonder if this crucial part something CCF guarantee and you can
>> >> rely on it ... or if it might break in the future.
>> >> 
>> >> Stephen, any thoughts on this ?
>> >
>> > We have problems with the order in which we call the set_rate clk_op.
>> > Sometimes clk providers want us to call from leaf to root but instead we
>> > call from root to leaf because of implementation reasons. Controlling
>> > the order in which clk operations are done is an unsolved problem. But
>> > yes, in the future I'd like to see us introduce the vaporware that is
>> > coordinated clk rates that would allow clk providers to decide what this
>> > order should be, instead of having to do this "root-to-leaf" update.
>> > Doing so would help us with the clk dividers that have some parent
>> > changing rate that causes the downstream device to be overclocked while
>> > we change the parent before the divider.
>> >
>> > If there are more assumptions like this about how the CCF is implemented
>> > then we'll have to be extra careful to not disturb the "normal" order of
>> > operations when introducing something that allows clk providers to
>> > modify it.
>> 
>> I understand that CCR would, in theory, allow to define that sort of
>> details. Still defining (and documenting) the default behavior would be
>> nice.
>> 
>> So the question is:
>>  * Can we rely set_rate() doing a root-to-leaf update until CCR comes
>>    around ?
>>  * If not, for use cases like the one described by Martin, I guess we
>>    are stuck with the notifier ? Or would you have something else to
>>    propose ?
>
> I suppose we should just state that clk_set_rate() should do a
> root-to-leaf update. It's not like anyone is interested in changing
> this behavior. The notifier is not ideal. I've wanted to add a new
> clk_op that would cover some amount of the notifier users by having a
> 'pre_set_rate' clk op that can mux the clk over to something safe or
> setup a divider to something that is known to be safe and work. Then we
> can avoid having to register for a notifier just to do something right
> before the root-to-leaf update happens.
>

Martin,

It looks like a green light to me ;) Just add a detailed comment on the
mali top clock explaining things and it should be alright.

>>    
>> >
>> > Also, isn't CLK_SET_RATE_GATE broken in the case that clk_set_rate()
>> > isn't called on that particular clk? I seem to recall that the flag only
>> > matters when it's applied to the "leaf" or entry point into the CCF from
>> > a consumer API.
>> 
>> It did but not anymore
>> 
>> > I've wanted to fix that but never gotten around to it.
>> 
>> I fixed that already :P
>> CLK_SET_RATE_GATE is a special case of clock protect. The clock is
>> protecting itself so it is going down through the tree.
>> 
>
> Ahaha ok. As you can see I'm trying to forget clock protect ;-)
>
>
>> 
>> > The whole flag sort of irks me because I don't understand what consumers
>> > are supposed to do when this flag is set on a clk. How do they discover
>> > it?
>> 
>> Actually (ATM) the consumer is not even aware of it. If a clock with
>> CLK_SET_RATE_GATE is enabled, it will return the current rate to
>> .round_rate() and .set_rate() ... as if it was fixed.
>
> And then when the clk is disabled it will magically "unstick" and start
> to accept the same rate request again?
>

Exactly

>> 
>> > They're supposed to "just know" and turn off the clk first and then
>> > call clk_set_rate()?
>> 
>> ATM, yes ... if CCF cannot switch to another "unlocked" subtree (the
>> case here)
>> 
>> > Why can't the framework do this all in the clk_set_rate() call?
>> 
>> When there is multiple consumers the behavior would become a bit
>> difficult to predict and drivers may have troubles anticipating that,
>> maybe, the clock is locked.
>
> Fun times!


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
