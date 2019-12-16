Return-Path: <SRS0=UcGz=2G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637DBC3F68F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 17:50:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B1F620700
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 17:50:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZfOjUSCs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyJriL7F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B1F620700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:To:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jtlUown5H0LMlteSkz9gmhu+gw7ulqBfbKvVpGWKxc=; b=ZfOjUSCsYLb/ho
	a1a3V1V0H5xIcqViOWPVs2UxUd1nLwnShUnrqGnP/3XyxSIk7tkW3vVwDiFPP9g3+Jd4t7srSvaaw
	KfFJ0738BdXM9iZa+GUXSVo9LJq21yx9KY1TOWksvMfAyuft45HDTEteU8WvfNiW2N8LNiUXBrPYQ
	JVvz4h/mWaYWoZzSvMLZC8EzhUaOI8HizvaIjpTrubuhTzUb2hvxp4CvjglWhYRhY1HczUAsXEcMQ
	rYOy5N59SXENH6aPwKqEA4krgUdPyp4ds15p3J4yS2mIwVVt7sXZ01C1d3UnLh3gcnGpkpPVdjwFr
	rKvWpA/pGFPbqAD9a2tg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iguVe-0006UB-Lu; Mon, 16 Dec 2019 17:50:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iguVc-0006TX-4I; Mon, 16 Dec 2019 17:50:17 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2A642206EC;
 Mon, 16 Dec 2019 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576518615;
 bh=g8/rjNCZq7LbHvZLvTNNpjZ1plcZnKZdtSsnrwvnKXs=;
 h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
 b=hyJriL7F96LxiYiCXXD6CLjvtW73yKVQDMHGaYpoy1QPMrmgRBbgjZQ2CFT5CAg+W
 +KrAVw6jQMk7TdXrDODjsWdn7uaXccTJfRVXit4cex32jK7jAeY7lAXuMDrm0lEvfi
 xm/9xn40U82jAhw/4ZBRdSf9wMSNHaoWdmQdIbhE=
MIME-Version: 1.0
In-Reply-To: <1jr214bpl0.fsf@starbuckisacylon.baylibre.com>
References: <20191215210153.1449067-1-martin.blumenstingl@googlemail.com>
 <1jr214bpl0.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH 0/1] clk: Meson8/8b/8m2: fix the mali clock flags
To: Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Mon, 16 Dec 2019 09:50:14 -0800
Message-Id: <20191216175015.2A642206EC@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_095016_216766_59536802 
X-CRM114-Status: GOOD (  31.45  )
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

Quoting Jerome Brunet (2019-12-16 01:13:31)
> 
> On Sun 15 Dec 2019 at 22:01, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
> 
> > While playing with devfreq support for the lima driver I experienced
> > sporadic (random) system lockups. It turned out that this was in
> > certain cases when changing the mali clock.
> >
> > The Amlogic vendor GPU platform driver (which is responsible for
> > changing the clock frequency) uses the following pattern when updating
> > the mali clock rate:
> > - at initialization: initialize the two mali_0 and mali_1 clock trees
> >   with a default setting and enable both clocks
> > - when changing the clock frequency:
> > -- set HHI_MALI_CLK_CNTL[31] to temporarily use the mali_1 clock output
> > -- update the mali_0 clock tree (set the mux, divider, etc.)
> > -- clear HHI_MALI_CLK_CNTL[31] to temporarily use the mali_0 clock
>                                       ^ no final setting then ? :P
> >    output again
> >
> > With the common clock framework we can even do better:
> > by setting CLK_SET_RATE_PARENT for the mali_0 and mali_1 output gates
>                 ^
> From your patch, I guess you mean CLK_SET_RATE_GATE ?
> 
> > we can force the common clock framework to update the "inactive" clock
> > and then switch to it's output.
> >
> > I only tested this patch for a limited time only (approx. 2 hours).
> > So far I couldn't reproduce the sporadic system lockups with it.
> > However, broader testing would be great so I would like this to be
> > applied for -next.
> 
> CLK_SET_RATE_GATE guarantees that a clock cannot be updated while in
> use. While it works at your advantage here, I'm not sure CCF guarantees
> the assumption this implementation is based on. Some explanation below:
> 
> In your case, if it works as you expect when calling set_rate() on the
> top clock, it goes as this:
> 
> - mali0 is use with rate X:
> - => set_rate(mali_top, Y)
> - mali0 is in use, cannot change, will round rate Y to X
> - mali1 is not in use, can provide Y
> - mali1 is determined to be the new best parent for mali top
> 
> So far so good.
> 
> - CCF pick the mali1 subtree
>   *start updating the clock from the root to the leaf*
> 
> So the mali top mux, which choose between mali0 and mali1, will be
> *updated last* which crucial to your use case.
> 
> I just wonder if this crucial part something CCF guarantee and you can
> rely on it ... or if it might break in the future.
> 
> Stephen, any thoughts on this ?

We have problems with the order in which we call the set_rate clk_op.
Sometimes clk providers want us to call from leaf to root but instead we
call from root to leaf because of implementation reasons. Controlling
the order in which clk operations are done is an unsolved problem. But
yes, in the future I'd like to see us introduce the vaporware that is
coordinated clk rates that would allow clk providers to decide what this
order should be, instead of having to do this "root-to-leaf" update.
Doing so would help us with the clk dividers that have some parent
changing rate that causes the downstream device to be overclocked while
we change the parent before the divider.

If there are more assumptions like this about how the CCF is implemented
then we'll have to be extra careful to not disturb the "normal" order of
operations when introducing something that allows clk providers to
modify it.

Also, isn't CLK_SET_RATE_GATE broken in the case that clk_set_rate()
isn't called on that particular clk? I seem to recall that the flag only
matters when it's applied to the "leaf" or entry point into the CCF from
a consumer API. I've wanted to fix that but never gotten around to it.
The whole flag sort of irks me because I don't understand what consumers
are supposed to do when this flag is set on a clk. How do they discover
it? They're supposed to "just know" and turn off the clk first and then
call clk_set_rate()? Why can't the framework do this all in the
clk_set_rate() call?

> 
> PS: If CCF does guarantee "root-to-leaf" updates, I think this
> implementation is a clever trick to solve this usual glitch free clock
> update issue ... much more elegant that the notifier solution we have
> been using so far.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
