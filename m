Return-Path: <SRS0=KMNI=XP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62305C49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 16:52:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35E82207FC
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 16:52:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C+BWGwyR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0JoVOOxQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35E82207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:From:To:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVNgZm5116gnQZUvEHfHJ5SrWKFcjeRC1td9aYcFw+o=; b=C+BWGwyRdo6Gjl
	NAtJAqgDVsD9eFCt/r1ljBou4jXcLnJtbdduHJLkLq+DzordAMD9+Csm3uQlNNkGitKs+UzhJOeo9
	NCkivMOVZJ2ep+krMXPSHK8bbh6qadXvBmD0+vj18tvcT7hT3YnlSKsjODaCOAx2ZePfRCmKxfZtM
	NA3a6+1/U32x23sG77hosvTDu5QYgCFDU+e06tn+233kfa6+TvUuSvgS70ZPn3C9qdv0uxw38pd2H
	MwkuNn+bHEP8+cnf3J3ax8wYQaYfG7c8RGZtH0WbnRlBpCKFkIybxwhc8/OZggc7pLHEFbkNlqKaW
	YnHXPIbfR6B4BaeLxhqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBM9F-0001Im-Ml; Fri, 20 Sep 2019 16:52:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBM9D-0001IP-Nc; Fri, 20 Sep 2019 16:52:45 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C8BB207FC;
 Fri, 20 Sep 2019 16:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568998363;
 bh=TYstjFpPpmJlXXPM8BgcwsN3SWwWCF707s2P3uizfwk=;
 h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
 b=0JoVOOxQBmIIvROvdiQqjgNG0IVfCMPOzHRIqpFM4J+X8aI3tOc6/GqDoGvuAD7b+
 W1N1tvawHZdnGOKDoCELxkcxaAbcB5W7P2pDeIVG0L0cx9EZm934l+NS0DiT84+T48
 yTDO8/XrcVZmt9fc2wBxlbAaT1M2AOWZq2xDww8g=
MIME-Version: 1.0
In-Reply-To: <2551a729-5379-e039-4d5a-a83fa877fb14@baylibre.com>
References: <20190919093627.21245-1-narmstrong@baylibre.com>
 <20190919093809.21364-1-narmstrong@baylibre.com>
 <1j1rwce8yf.fsf@starbuckisacylon.baylibre.com>
 <20190919170610.541D620644@mail.kernel.org>
 <2551a729-5379-e039-4d5a-a83fa877fb14@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/3] clk: meson: clk-pll: always enable a critical PLL
 when setting the rate
User-Agent: alot/0.8.1
Date: Fri, 20 Sep 2019 09:52:42 -0700
Message-Id: <20190920165243.2C8BB207FC@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_095243_817255_5A1C06F2 
X-CRM114-Status: GOOD (  30.99  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2019-09-20 01:06:58)
> Hi Stephen,
> 
> On 19/09/2019 19:06, Stephen Boyd wrote:
> > Quoting Jerome Brunet (2019-09-19 06:01:28)
> >> On Thu 19 Sep 2019 at 11:38, Neil Armstrong <narmstrong@baylibre.com> wrote:
> >>
> >>> Make sure we always enable a PLL on a set_rate() when the PLL is
> >>> flagged as critical.
> >>>
> >>> This fixes the case when the Amlogic G12A SYS_PLL gets disabled by the
> >>> PSCI firmware when resuming from suspend-to-memory, in the case
> >>> where the CPU was not clocked by the SYS_PLL, but by the fixed PLL
> >>> fixed divisors.
> >>> In this particular case, when changing the PLL rate, CCF doesn't handle
> >>> the fact the PLL could have been disabled in the meantime and set_rate()
> >>> only changes the rate and never enables it again.
> >>>
> >>> Fixes: d6e81845b7d9 ("clk: meson: clk-pll: check if the clock is already enabled')
> >>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> >>> ---
> >>>  drivers/clk/meson/clk-pll.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> >>> index ddb1e5634739..8c5adccb7959 100644
> >>> --- a/drivers/clk/meson/clk-pll.c
> >>> +++ b/drivers/clk/meson/clk-pll.c
> >>> @@ -379,7 +379,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> >>>       }
> >>>  
> >>>       /* If the pll is stopped, bail out now */
> >>> -     if (!enabled)
> >>> +     if (!(hw->init->flags & CLK_IS_CRITICAL) && !enabled)
> >>
> >> This is surely a work around to the issue at hand but:
> >>
> >> * Enabling the clock, critical or not, should not be done but the
> >> set_rate() callback. This is not the purpose of this callback.
> >>
> >> * Enabling the clock in such way does not walk the tree. So, if there is
> >> ever another PSCI Fw which disable we would get into the same issue
> >> again. IOW, This is not specific to the PLL driver so it should not have
> >> to deal with this.
> > 
> > Exactly.
> > 
> >>
> >> Since this clock can change out of CCF maybe it should be marked with
> >> CLK_GET_RATE_NOCACHE ?
> > 
> > Yes, or figure out a way to make the clk state match what PSCI leaves it
> > in on resume from suspend.
> > 
> > 
> >>
> >> When CCF hits a clock with CLK_GET_RATE_NOCACHE while walking the tree,
> >> in addition to to calling get_rate(), CCF could also call is_enabled()
> >> if the clock has CLK_IS_CRITICAL and possibly .enable() ?
> > 
> > This logic should go under a new flag. The CLK_GET_RATE_NOCACHE flag
> > specifically means get rate shouldn't be a cached operation. It doesn't
> > relate to the enable state. I hope that you can implement some sort of
> > resume hook that synchronizes the state though so that you don't need to
> > rely on clk_set_rate() or clk_get_rate() to trigger a sync.
> > 
> 
> It's exactly the goal of [1] where I resync a clock tree after a resume.

Ok. I haven't looked at that series yet. We can move this discussion
there if you like.

> 
> But I don't check the enable state, would you mean that:
> if core->ops->enable && core->enable_count > 0 && !clk_core_is_enabled(core)
>     core->ops->enable(core->hw)
> 
> along the parent/rate resync ?
> 
> Isn't that dangerous ?
> 

Why is it dangerous? If the clk state is lost across suspend/resume we
need to restore the state of the clk somehow. One way would be to have
the clk driver tell the framework that this clk is now off and to drop
the enable counts for any consumers. Then consumers will need to call
clk_enable() again to turn the clk back on in the consumer resume
callback. Or we can try to be smarter/nicer and restore the clk state to
what the consumer is expecting across suspend/resume. I haven't thought
about what is better or worse.

On the one hand, device drivers already handle some things not being
saved/restored during system low power modes. But on the other hand I
don't know what the policy is for external resources that a device uses,
such as clks or regulators or pinctrl muxing, etc.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
