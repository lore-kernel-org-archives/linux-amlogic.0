Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96CBC4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Mar 2022 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lT8ibC2jukB9D1iRUaVJmC1Aq9MhWvfFYovnrsNZe0c=; b=LKthQOfYvD1qtm
	JoGnzqAfCGtmFLFuXkiN7jtk44l6b3QLS6dIgDZc5GwGdGYpyqzomcuWrjDXTxmEwJkXTk6ObbSAA
	CGurBel/dE33zsuf37WUYKP+wMoS8qz/lCUcuHJZBQxIxh5KxesQYTTgzbQ/ssSesrD11dLZjQaOw
	fnfXmsMhFU71htdnQcXW/7BZSra3y9mA9uWeTEDC0lprjMXnVUZMZnhoY77EAdOn6V/8JPDdePJxU
	o0KlQZRD9nT8UJ83ON2c6APGOpb/50RpXAyGU8eHDt8XyWhtk7Y6273nxK6pz2dJ00fiXoOz9GDtX
	u4rDeEpPns3emHZl033g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na2oB-003nbI-Lf; Thu, 31 Mar 2022 21:58:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na2o8-003naG-KS; Thu, 31 Mar 2022 21:58:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C0A260B61;
 Thu, 31 Mar 2022 21:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11BEC340F0;
 Thu, 31 Mar 2022 21:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648763899;
 bh=EdyYRv/RjH6voZpfK9AsnGWVtEgWXeOuukdtRC5UEKg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=lnycOEjlNdrSNQz4HWAciAAwYkiads1HaoBhzmckHhiGEx2FVc8VApvNG/U9fZnlr
 7/clOK8vr/mk4bbIw/imRUg8mKlFLGoy3cP6lF6pfy8pQFAN9CSbTGH1aF7rXWFAwC
 5eUCCuB8MPWi+ft9NaYXhMPh7WIgoijxWXzG3EvDuKREPSLVRmVUmawgEWVWzGnPN6
 jdqsO4KjIYszy0jIQDN2bn/8Iq5wsP06a7Dx2wzyA5cDIyvc9MJaYk0dnifJpTE+yM
 7DMl4xqMVdY5x0jyrH5A50uRGYv52Ykkt6t2QK5+3Hwm5mVrzYernar930y/vMNyzw
 Uhg6D24iOoTWQ==
MIME-Version: 1.0
In-Reply-To: <YkXeGS5zaovOaEzp@atomide.com>
References: <20220325161144.1901695-1-maxime@cerno.tech>
 <20220325161144.1901695-4-maxime@cerno.tech>
 <CGME20220330080612eucas1p195caaf35d900412de762a27ae02b7b9e@eucas1p1.samsung.com>
 <366a0232-bb4a-c357-6aa8-636e398e05eb@samsung.com>
 <20220330084710.3r6b5pjspz5hdmy6@houat> <YkV3ch7R7YxlATW+@atomide.com>
 <20220331095456.dyyxsiu2b3yw2vvs@houat> <YkXCGlrok0niwlyg@atomide.com>
 <20220331153134.h3alp24hzquajkly@houat> <YkXeGS5zaovOaEzp@atomide.com>
Subject: Re: [PATCH v2 3/3] clk: Drop the rate range on clk_put
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
To: Maxime Ripard <maxime@cerno.tech>, Tony Lindgren <tony@atomide.com>
Date: Thu, 31 Mar 2022 14:58:17 -0700
User-Agent: alot/0.10
Message-Id: <20220331215818.F11BEC340F0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_145820_748247_B51D5BD4 
X-CRM114-Status: GOOD (  22.50  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Tony Lindgren (2022-03-31 10:00:09)
> * Maxime Ripard <maxime@cerno.tech> [220331 15:29]:
> > On Thu, Mar 31, 2022 at 06:00:42PM +0300, Tony Lindgren wrote:
> > > * Maxime Ripard <maxime@cerno.tech> [220331 09:52]:
> > > > On Thu, Mar 31, 2022 at 12:42:10PM +0300, Tony Lindgren wrote:
> > > > > It seems the dts assigned-clock-parents no longer works now?
> > > > 
> > > > That would make some kind of sense, __set_clk_parents calls clk_put on
> > > > both the assigned clock and its parent.
> > > > 
> > > > Could you see what parent (and why?) it tries to enforce then?
> > > 
> > > It picks the other option available for the mux clock that only has
> > > two options. No idea why, but if you have some debug patch in mind I
> > > can give it a try.
> > > 
> > > > It looks like the gpt1_fck driver might favor another parent for that
> > > > rate, which, if it's an invalid configuration, shouldn't really happen?
> > > 
> > > Hmm there's a gate clock and a mux clock, there's not really a rate
> > > selection available here for the sources.
> > 
> > If I followed the OMAP driver properly, clk_mux_determine_rate_flags is
> > doing the heavy lifting, could you run your test with
> 
> Thanks that produces some interesting output. In the working case with
> the $subject patch reverted we have:

I don't think clk_put() dropping a range request is very important right
now. If this isn't fixed tomorrow then we should revert out this patch
so systems can boot -rc1 and try to fix it in parallel.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
