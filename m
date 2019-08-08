Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E33EC0650F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 04:47:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FFB3217D7
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 04:47:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FJnmy5T6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="heRTJYGb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FFB3217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFg2n80jdVcXBXy2dLR122BT/9N2YMfjurr3mAp2fDY=; b=FJnmy5T65z10lu
	hm9soZBQA3wOeY46v8qPuKRovuruAgUukFFBTEHT1QF/waN4id4oXQw4NPEdct8myqm1l+Mm70dHY
	jwIwbcgpJSiCYjiZ+dRyeOMVhEJCn6ZzCbtNjIdDSCXyS6/5eDfmCZc66XdzcV4Ovj1PMor0bBbrz
	O63F/CBooKIKR+jhPL2Z5U/nx86FVVQAaMhR08p03klnIzJ0i/GWtCmYTVsImZPw2lIsIqhaS7971
	x5trw68Qj+zf40hqMNpVAPGvPzghpM2zuNLqsQrnu5vXSnLA8vxHDQrzc7tMpxwYh25lAA2AKZjoJ
	JIfrSZTvfRrWkRsvzuog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvaKy-00061E-D1; Thu, 08 Aug 2019 04:47:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvaKv-00060p-6y; Thu, 08 Aug 2019 04:47:38 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4E83217D7;
 Thu,  8 Aug 2019 04:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565239656;
 bh=y0710HmReVsBMWZ/XfSor0U2soY0toxlrShfhv6D9iA=;
 h=In-Reply-To:References:From:Cc:To:Subject:Date:From;
 b=heRTJYGb+MKnfdifsw1aaCQ5Te73E3T+adwWyB2Qh8LsxkzkNb2+gHXK1Y9y7VVdO
 ttEq4DZqadJi6JBJlRK984Me6oF7tc8yhfyHyjYw7UuSPc0c970anKM8dtH2P9Tfdl
 W/A0NQDTkGsu91OWcxft8zXa33tPBgskXOJ37lzY=
MIME-Version: 1.0
In-Reply-To: <1j36iewvdo.fsf@starbuckisacylon.baylibre.com>
References: <20190731084019.8451-1-narmstrong@baylibre.com>
 <20190731084019.8451-2-narmstrong@baylibre.com>
 <1j36iewvdo.fsf@starbuckisacylon.baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/4] clk: core: introduce clk_hw_set_parent()
User-Agent: alot/0.8.1
Date: Wed, 07 Aug 2019 21:47:35 -0700
Message-Id: <20190808044736.A4E83217D7@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190807_214737_277570_DDCFD42A 
X-CRM114-Status: GOOD (  15.75  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-08-06 01:28:19)
> On Wed 31 Jul 2019 at 10:40, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
> > Introduce the clk_hw_set_parent() provider call to change parent of
> > a clock by using the clk_hw pointers.
> >
> > This eases the clock reparenting from clock rate notifiers and
> > implementing DVFS with simpler code avoiding the boilerplates
> > functions as __clk_lookup(clk_hw_get_name()) then clk_set_parent().
> >
> > Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> > Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Looks ok to me but we will obviously need Stephen's ack to apply it

Acked-by: Stephen Boyd <sboyd@kernel.org>

> 
> > ---
> >  drivers/clk/clk.c            | 6 ++++++
> >  include/linux/clk-provider.h | 1 +
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index c0990703ce54..c11b1781d24a 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -2487,6 +2487,12 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
> >       return ret;
> >  }
> >  
> > +int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
> > +{
> > +     return clk_core_set_parent_nolock(hw->core, parent->core);

I wonder if you really want to call all those things in
clk_core_set_parent_nolock(). For example, do you want notifiers to run
again and for rates to be speculated? Maybe all you want to do is
overwrite some value for the clk's parent by calling into the ops for
the clk and generically parse the value that's passed as the "parent"
here.

I ask because it may be good to avoid doing all that work and updating
bookkeeping when we're deep in a notifier. If we can clearly understand
what the driver wants to do from the notifier then it's simpler to
change in the future to use things such as the coordinated clk rate
vaporware.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
