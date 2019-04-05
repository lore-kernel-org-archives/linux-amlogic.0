Return-Path: <SRS0=88k6=SH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0E3C282CE
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 20:43:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04134206BA
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Apr 2019 20:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDecLWx9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wJ04X2qG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04134206BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KGBbP6lBtpDEDvoWs4iHdwy8uz0kNrycegxgm0hi0v0=; b=YDecLWx9CpMyPf
	3uY/bRUZNpQfxzU8OXwa9PfSYvWfiH06892XQe7ewhvi0z+afVc5u786HE99QyvnB8E/SEMxwNoM+
	4qa0vP8+jMxXptV0Tw7RD4Df+6pBzleFuMEcX2hMCDwlGgkonJMf214VvGdPYspAf6zTTPY6G+U/B
	ytxawXI6cwyTGCdeyJV0zLUjV7dIy+y3A1nG9lcBMg4I3OSWFhp2Emfcx0nAjcihMzRbl8Ha7AB3G
	dPObHUPyJoKIM0s+qxSr283hB4+3RlWD9KNgZO4Cq/A9G8fK0sveCcLmMp6xE3c/DwtLjI+RUA+AI
	zs7Wuq3Hn0xyrHZefdKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCVgY-0007BM-St; Fri, 05 Apr 2019 20:43:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCVgV-0007AF-0X
 for linux-amlogic@lists.infradead.org; Fri, 05 Apr 2019 20:43:36 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1922C206BA;
 Fri,  5 Apr 2019 20:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554497014;
 bh=EQcquGL/H8j873Qtr/IVEBdcoXwlt+4bAMRlTfGo12s=;
 h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
 b=wJ04X2qGwrxWuRA5ZaXcwkyxpSqJzNPOQSWve20yqQjwfyNo9+LJ/CZA25Ua+mBAM
 shl/v/8tCBD1zGHkJs/9tbu390a5iKAo+OcDVrHuvi372nF42VdGMc65jwwvIzhC4Q
 CeuJGQqlyhxmtTGXsyEG+hrUDGuQv6afz730JTYg=
MIME-Version: 1.0
In-Reply-To: <CAEG3pNCrANkLBeEA_wVU7n4U57X3sd-1EzhUZ_PHBryqPHoAaQ@mail.gmail.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
 <20190325111200.15940-2-jbrunet@baylibre.com>
 <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
 <8b6f0bc6210834af2aff2de7dc95692dd87db539.camel@baylibre.com>
 <155389767798.20095.10570017301900287354@swboyd.mtv.corp.google.com>
 <6ef984dabf626760ae606567facdc5245fbba984.camel@baylibre.com>
 <CAEG3pNCrANkLBeEA_wVU7n4U57X3sd-1EzhUZ_PHBryqPHoAaQ@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] clk: meson: mpll: add init callback and regs
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
Message-ID: <155449701325.20095.2265240732374772927@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Fri, 05 Apr 2019 13:43:33 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_134335_088188_3DCB835A 
X-CRM114-Status: GOOD (  22.56  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "Stephen Boyd <sboyd@codeaurora.org>, Emilio Lopez <emilio@elopez.com.ar>,
 Hans de Goede <hdegoede@redhat.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel" <linux-clk@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Michael Turquette (2019-04-05 08:43:40)
> Hi Jerome,
> 
> On Fri, Mar 29, 2019 at 3:58 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> > On Fri, 2019-03-29 at 15:14 -0700, Stephen Boyd wrote:
> > > > > We actively discourage using init callbacks. Can you do this some other
> > > > > way?
> > > >
> > > > Yes I'm aware of that but init it the right place to do this.
> > > > To be clear, this is not initializing the clock to some particular rate, the
> > > > rate is preserved.
> > > >
> > > > It just applies the necessary settings that needs to be done only once to make
> > > > sure the clock is in working order and that the rate calculated is actually
> > > > accurate.
> > >
> > > Ok, but can you do that in your driver's probe routine instead of
> > > attaching to the init callback? We want to get rid of "init" at some
> > > point so throwing the init sequence stuff into the driver probe around
> > > registration is a solution. Or we should think about not discouraging
> > > the init callback
> >
> > Is is callback really a problem after all ?
> 
> It is a problem, insofar as Stephen and I want to remove .init some day.
> 
> > I think we should actively prevent using it to set a particular rate.
> >
> > Here, the goal is put the clock in working order. The bootloader does not
> > always do that for us.
> 
> The above two sentences make it sound like this sequence belongs in .prepare().
> 
> I know that you're concerned with setting rate, but I guess it is safe
> to assume that you'll always complete .prepare() before you begin to
> execute .set_rate(), no? This also avoids the ugliness of putting it
> in the .probe(), which I agree doesn't feel like an accurate thing to
> do for a clock's own programming sequence.
> 
> .probe() is an OK place to put policy (turn these clocks on or set
> them to this rate, for a known-good configuration).
> 

Following along with this reasoning, maybe we need a 'prepare_once'
callback that does this the first time the clk is prepared or set_rate
is called on it. The problem I have with the init callback is that the
semantics of when it's called and what has happened before it's called
isn't clearly defined. I'm afraid to remove it and also afraid to move
around where it's called from. I've been itching to get it out of under
all the locks we're holding at registration time, but I don't know if
that's feasible, for example.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
