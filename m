Return-Path: <SRS0=kiAd=2O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAECDC2D0C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 03:36:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9DEB206B7
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 03:36:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nw41pYfq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHtreC+y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9DEB206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EC0JeKAGZF7Pf42FxQul/UsckKZG7XeJCgM7S76PLxQ=; b=nw41pYfq/03m6B
	uoaI2Z2amsY64ZautbpsdeNwd0eKCDfXIVgoe5JFqidC+VdyJmyNF5V3EsaEbZHND57zPD/0hVjxP
	C5FaJPUG0tzF2lk+dzCyLawg/tStAWZGrezeup5kdu39dt3riDPlzrHijK4SUhaB+A4mpz0YLX/za
	lKilFtClbK777WxpCFna6C+SifpS+tdJN+mF1GuJ7Ozn1GMe7GhhUyUhfxOF5NGBwMEy7alAyfezI
	uxg4Kc817qQS3qxNc8n09ZFDiCIu9ZuhsUIDp3SsKGMaStSbnM+70NuVtN/3yy5CLtXdRd57msMwQ
	h1LboCUCiYCDs9FhO+pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijazv-0006i6-BV; Tue, 24 Dec 2019 03:36:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijazs-0006hk-OK; Tue, 24 Dec 2019 03:36:38 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1BB3F206B7;
 Tue, 24 Dec 2019 03:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577158596;
 bh=hKOk/K7hTl+yIynX4qaqBR8jYeq8G7LYQWQa8oBkIlg=;
 h=In-Reply-To:References:Cc:From:To:Subject:Date:From;
 b=hHtreC+yvNjl49/8yHJTSGyyOzkmVhJrs1i0vH3I48Q//kO9OhuqlsYbFZGZS7UD9
 qF0SxC4zVszjRT+VAwWZk0iEidiQxCbragcL3l+teGxjSjc766HzB2K4bdsAaELmKj
 qbAK1MUf9hu4AjzTbfwKLPgpXxAodx8v5psEzWvs=
MIME-Version: 1.0
In-Reply-To: <1jlfrcaxmm.fsf@starbuckisacylon.baylibre.com>
References: <20191215210153.1449067-1-martin.blumenstingl@googlemail.com>
 <1jr214bpl0.fsf@starbuckisacylon.baylibre.com>
 <20191216175015.2A642206EC@mail.kernel.org>
 <1jlfrcaxmm.fsf@starbuckisacylon.baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Subject: Re: [PATCH 0/1] clk: Meson8/8b/8m2: fix the mali clock flags
User-Agent: alot/0.8.1
Date: Mon, 23 Dec 2019 19:36:35 -0800
Message-Id: <20191224033636.1BB3F206B7@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_193636_834019_AC021A4E 
X-CRM114-Status: GOOD (  30.36  )
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

Quoting Jerome Brunet (2019-12-16 11:17:21)
> 
> On Mon 16 Dec 2019 at 18:50, Stephen Boyd <sboyd@kernel.org> wrote:
> 
> > Quoting Jerome Brunet (2019-12-16 01:13:31)
> >> 
> >> *updated last* which crucial to your use case.
> >> 
> >> I just wonder if this crucial part something CCF guarantee and you can
> >> rely on it ... or if it might break in the future.
> >> 
> >> Stephen, any thoughts on this ?
> >
> > We have problems with the order in which we call the set_rate clk_op.
> > Sometimes clk providers want us to call from leaf to root but instead we
> > call from root to leaf because of implementation reasons. Controlling
> > the order in which clk operations are done is an unsolved problem. But
> > yes, in the future I'd like to see us introduce the vaporware that is
> > coordinated clk rates that would allow clk providers to decide what this
> > order should be, instead of having to do this "root-to-leaf" update.
> > Doing so would help us with the clk dividers that have some parent
> > changing rate that causes the downstream device to be overclocked while
> > we change the parent before the divider.
> >
> > If there are more assumptions like this about how the CCF is implemented
> > then we'll have to be extra careful to not disturb the "normal" order of
> > operations when introducing something that allows clk providers to
> > modify it.
> 
> I understand that CCR would, in theory, allow to define that sort of
> details. Still defining (and documenting) the default behavior would be
> nice.
> 
> So the question is:
>  * Can we rely set_rate() doing a root-to-leaf update until CCR comes
>    around ?
>  * If not, for use cases like the one described by Martin, I guess we
>    are stuck with the notifier ? Or would you have something else to
>    propose ?

I suppose we should just state that clk_set_rate() should do a
root-to-leaf update. It's not like anyone is interested in changing
this behavior. The notifier is not ideal. I've wanted to add a new
clk_op that would cover some amount of the notifier users by having a
'pre_set_rate' clk op that can mux the clk over to something safe or
setup a divider to something that is known to be safe and work. Then we
can avoid having to register for a notifier just to do something right
before the root-to-leaf update happens.

>    
> >
> > Also, isn't CLK_SET_RATE_GATE broken in the case that clk_set_rate()
> > isn't called on that particular clk? I seem to recall that the flag only
> > matters when it's applied to the "leaf" or entry point into the CCF from
> > a consumer API.
> 
> It did but not anymore
> 
> > I've wanted to fix that but never gotten around to it.
> 
> I fixed that already :P
> CLK_SET_RATE_GATE is a special case of clock protect. The clock is
> protecting itself so it is going down through the tree.
> 

Ahaha ok. As you can see I'm trying to forget clock protect ;-)


> 
> > The whole flag sort of irks me because I don't understand what consumers
> > are supposed to do when this flag is set on a clk. How do they discover
> > it?
> 
> Actually (ATM) the consumer is not even aware of it. If a clock with
> CLK_SET_RATE_GATE is enabled, it will return the current rate to
> .round_rate() and .set_rate() ... as if it was fixed.

And then when the clk is disabled it will magically "unstick" and start
to accept the same rate request again?

> 
> > They're supposed to "just know" and turn off the clk first and then
> > call clk_set_rate()?
> 
> ATM, yes ... if CCF cannot switch to another "unlocked" subtree (the
> case here)
> 
> > Why can't the framework do this all in the clk_set_rate() call?
> 
> When there is multiple consumers the behavior would become a bit
> difficult to predict and drivers may have troubles anticipating that,
> maybe, the clock is locked.

Fun times!


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
