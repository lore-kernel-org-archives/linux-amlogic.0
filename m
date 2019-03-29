Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C29C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 22:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24D4D218A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 22:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GSX/629Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQuQ68VR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24D4D218A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BANeYm1jKZmKrr3JosqNW4or38LloCodH+6wNLkr41g=; b=GSX/629Y8CckbT
	JO1hiGr5I53V6ExQadks2NRq4sKfnTx7gX8wiec+GWkZjM8zDz4FSnrybNnqUMlxMR+Zy6c70Z1TX
	2iMmVqm8jTzV1JAmgVvzoGmSw3rW0DuKMiKH4OBQOODop2yosV65pFJiHn7uDz/rl4j1p3zZIBi3G
	r2SI1rkWEQ/Wx3sM0rcrj44F1G6diF5R9k6e2P9mzMT8LGzAZxGZLzGejjg8DnVZekW6UemiuMHh0
	76tvie/XoFR69MKqZeqpwrqrmSGWIhwfNTNazkWRbW5ywipiYQFeOFH645jWEx3C1toPvIcH4QJWg
	x1/WFslOepun7o3UZYvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9zlq-0006UX-0k; Fri, 29 Mar 2019 22:14:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9zln-0006Tq-NI
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 22:14:40 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC5B5218A2;
 Fri, 29 Mar 2019 22:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553897678;
 bh=OTehbauQ08ahn/ZeqU6byAs8bHQqgTQZkfksTL07/k8=;
 h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
 b=HQuQ68VReNeDXM9JzyFwxJ2G4qiblnGkk3Ay3WGAOBxGzwvYKdsDJOkxcvILJv/dT
 1UfdPf7nmXFmBIyyndHqKZrYizTJKsIOKroL/hmlPEXzX/2VQmJ8+CPfqBb/cU0Nq+
 EH6yoU8NCbeXfi8XZa1lRFwgq2+6znBQr/gvolUk=
MIME-Version: 1.0
In-Reply-To: <8b6f0bc6210834af2aff2de7dc95692dd87db539.camel@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
 <20190325111200.15940-2-jbrunet@baylibre.com>
 <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
 <8b6f0bc6210834af2aff2de7dc95692dd87db539.camel@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] clk: meson: mpll: add init callback and regs
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <155389767798.20095.10570017301900287354@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Fri, 29 Mar 2019 15:14:37 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_151439_778145_6929B847 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-03-26 00:53:15)
> On Mon, 2019-03-25 at 10:10 -0700, Stephen Boyd wrote:
> > Quoting Jerome Brunet (2019-03-25 04:11:57)
> > > @@ -138,6 +129,27 @@ static int mpll_set_rate(struct clk_hw *hw,
> > >         return 0;
> > >  }
> > >  
> > > +static void mpll_init(struct clk_hw *hw)
> > > +{
> > > +       struct clk_regmap *clk = to_clk_regmap(hw);
> > > +       struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
> > > +
> > > +       if (mpll->init_count)
> > > +               regmap_multi_reg_write(clk->map, mpll->init_regs,
> > > +                                      mpll->init_count);
> > > +
> > > +       /* Enable the fractional part */
> > > +       meson_parm_write(clk->map, &mpll->sdm_en, 1);
> > > +
> > > +       /* Set additional fractional part enable if required */
> > > +       if (MESON_PARM_APPLICABLE(&mpll->ssen))
> > > +               meson_parm_write(clk->map, &mpll->ssen, 1);
> > > +
> > > +       /* Set the magic misc bit if required */
> > > +       if (MESON_PARM_APPLICABLE(&mpll->misc))
> > > +               meson_parm_write(clk->map, &mpll->misc, 1);
> > > +}
> > > +
> > >  const struct clk_ops meson_clk_mpll_ro_ops = {
> > >         .recalc_rate    = mpll_recalc_rate,
> > >         .round_rate     = mpll_round_rate,
> > > @@ -148,6 +160,7 @@ const struct clk_ops meson_clk_mpll_ops = {
> > >         .recalc_rate    = mpll_recalc_rate,
> > >         .round_rate     = mpll_round_rate,
> > >         .set_rate       = mpll_set_rate,
> > > +       .init           = mpll_init,
> > 
> > We actively discourage using init callbacks. Can you do this some other
> > way?
> 
> Yes I'm aware of that but init it the right place to do this.
> To be clear, this is not initializing the clock to some particular rate, the
> rate is preserved.
> 
> It just applies the necessary settings that needs to be done only once to make
> sure the clock is in working order and that the rate calculated is actually
> accurate. 

Ok, but can you do that in your driver's probe routine instead of
attaching to the init callback? We want to get rid of "init" at some
point so throwing the init sequence stuff into the driver probe around
registration is a solution. Or we should think about not discouraging
the init callback.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
