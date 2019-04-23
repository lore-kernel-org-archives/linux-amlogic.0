Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA48DC10F03
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 23:19:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77120218D2
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 23:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VgKQRFso";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKi916tb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77120218D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLTAzh+1cNnHLrYZDWKN4mhpJb40nAQOLJeUh8S55F8=; b=VgKQRFsovbQUvB
	UdCzauYCAdGsRJegAqZ/KISRyS5EMsbRvYb2dxhWN9YPC6uG6AGZdqF46iNLtgKXLeImozHcCEDeI
	mYMe8lILIeCprMxFqI/A1EZFpFEwAnXtLtgtQKwTGQm4fwokzYyrZrhr70UNUXnZr1F9ZbyudEWHE
	/RVMS7c7ZmNU8Z28AwmgePdEIrHckTsFIpV1rQ0DrY6YB96+l5nQzj1ZW2q7pVyukV/4oqbZ01IdK
	bg55sZFSkzr0zW518LjFACRN/XG097pJQi5Hq7jQUzAXZ73fKlS1mZ1gpxVM3mKO6aLVsDgbSYEVc
	CjRNpnUK/7Q8EtdP3O5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJ4hN-0002kP-BJ; Tue, 23 Apr 2019 23:19:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJ4hJ-0002jL-SM
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 23:19:35 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E03B9218D2;
 Tue, 23 Apr 2019 23:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556061572;
 bh=7uAIycoYHirFeTIwCI/9YmG4XY3/OWp/IWt9t09frXk=;
 h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
 b=AKi916tbdMICRBrcHhs6oQXyemFVFkBWYywTr2Yhi4nKff0N/bf2HyJFUkP1JDaL3
 nROvgQjZB6BN9T2atN7oXhlilOWlsdLLQd7BO8bVrxcoAcykAyx365OA2pfo0NPoOW
 kbrRE4U0zsu/mgL5/fshh6WBCwtmuF53XFg50TiQ=
MIME-Version: 1.0
In-Reply-To: <CAEG3pNB-143Pr_xCTPj=tURhpiTiJqi61xfDGDVdU7zG5H-2tA@mail.gmail.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
 <20190325111200.15940-2-jbrunet@baylibre.com>
 <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
 <8b6f0bc6210834af2aff2de7dc95692dd87db539.camel@baylibre.com>
 <155389767798.20095.10570017301900287354@swboyd.mtv.corp.google.com>
 <6ef984dabf626760ae606567facdc5245fbba984.camel@baylibre.com>
 <CAEG3pNCrANkLBeEA_wVU7n4U57X3sd-1EzhUZ_PHBryqPHoAaQ@mail.gmail.com>
 <155449701325.20095.2265240732374772927@swboyd.mtv.corp.google.com>
 <7bd9dd9123779165cc172853ae7ee6d3d63c329f.camel@baylibre.com>
 <CAEG3pNB-143Pr_xCTPj=tURhpiTiJqi61xfDGDVdU7zG5H-2tA@mail.gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] clk: meson: mpll: add init callback and regs
To: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>
Message-ID: <155606157109.15276.17674168789529018388@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Tue, 23 Apr 2019 16:19:31 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_161933_956669_0EB6F58E 
X-CRM114-Status: GOOD (  28.86  )
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
Cc: Emilio Lopez <emilio@elopez.com.ar>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Michael Turquette (2019-04-23 10:34:13)
> On Mon, Apr 8, 2019 at 9:38 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> > If removing .init() is important for you, I would prefer to help guys. That
> > being said, we need a decent solution to some use case if this is going to
> > work.
> >
> > I'll illustrate with examples from the meson code but I think they represent
> > fairly common cases:
> >
> > 1) clk-pll: Without the work done init(), the pll just won't lock ...
> >
> > I agree that we would see the problem when the clock is finally enabled, so we
> > could do "init" sequence in .prepare() each time it is called. The sequence
> > might be "long" (with a couple of delays in it) so doing it on each call to
> > .prepare() is wasting time but it could work.
> >
> > Something like .prepare_once would help for this.
> >
> > 2) clk-mpll: Without the work done in .init(), the fractional part of the
> > divider will not work, only the integer part works => the rate calculated is
> > off by a significant margin. IOW, until the initial setup is done, the result
> > of .recalc_rate() is off and cannot be trusted.
> >
> > .prepare() (and .prepare_once() if called a the same stage) is too late. We
> > would need something that runs before any call to .recalc_rate() is made.
> >
> > We could also think about clocks with the ability to observe and feedback
> > (read-only) on the actual output signal. Such thing might need an initial()
> > setup as well.
> >
> > 3) sclk: This is a kind of divider which gates when the value is zero. We need
> > to save the divider value on .disable() to restore it on .enable(). In
> > .init(), if divider value is 0 (gated) we init cached value to the maximum
> > divider value. This done so a call to .enable() works, even without prior
> > calls to .set_rate().
> >
> > Here, again, I think .prepare() is a too late.
> >
> > Maybe it is a bit extreme but we could also think about weird muxes not
> > reporting the parent accurately until some prior setting is done. For those
> > you need something that runs before all the orphan mechanism in the clock
> > register.

Well I wonder if it would work to do something on clk_get() path. At
that point, we've decided that a consumer is going to be able to use the
clk and so we can clearly define that this is the last moment to do any
final setup/configuration before handing out a pointer to a consumer.
There are still the other cases you talk about though where
.recalc_rate() wouldn't work, and we would need to do this configuration
before we calculate the rate of this clk when registering it. Seems to
be an argument for .init or the rename of it sticking around.

> >
> > Whatever the name we give it, It think it would help if we had a (not
> > discouraged) callback that is guaranteed to run before anything else is called
> > on the clock. This is what I tried to do with 541debae0adf ("clk: call the
> > clock init() callback before any other ops callback").
> >
> > Having the counterpart callback, guaranteed to run last, would allow a clock
> > to allocate (and de-allocate) stuff. It would be an interesting addition IMO.
> > For clocks which needs to store things (such as sclk), it would allow to take
> > the runtime data out of the init data.
> >
> > What about .register() and .deregister() ? It would map nicely to the CCF API
> > ?
> 
> I like .register & .deregister.
> 
> I propose that we merge your .init to keep things moving BUT ONLY if
> you pinky swear to follow up with .register & .deregister conversion
> and convert all existing .init users over to .register. Deal?
> 
> Stephen, thoughts?
> 

Ok. I'd like to see the semantics of .register and .deregister
(.unregister?) be well defined, especially around what locks are held
when the op is called (do both prepare and enable locks need to be
held?) and what state the clk is in (can it be an orphan?).
Alternatively, we can retroactively do that for the .init op and then
introduce the other ops if drivers don't need this. Then we're just
making .init more official and not shunned, which is also fine.

This crude grep only finds a few clks that use the init op.

$ git grep -W 'struct clk_ops .*=' | grep "\.init ="
drivers/clk/mmp/clk-frac.c-     .init = clk_factor_init,
drivers/clk/mmp/clk-mix.c-      .init = mmp_clk_mix_init,
drivers/clk/qcom/clk-hfpll.c-   .init = clk_hfpll_init,
drivers/clk/rockchip/clk-pll.c- .init = rockchip_rk3036_pll_init,
drivers/clk/rockchip/clk-pll.c- .init = rockchip_rk3066_pll_init,
drivers/clk/rockchip/clk-pll.c- .init = rockchip_rk3399_pll_init,
drivers/clk/rockchip/clk.c-             frac_mux->hw.init = &init;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
