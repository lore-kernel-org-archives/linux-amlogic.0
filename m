Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A66FE77188
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 21:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhKgU2RQ7nwTdzoA9nDhlNy9ukxkJpLa1FKN8dRUuu8=; b=FerL67i0T/ZxIB
	joS5KRCwBXEXVF44NhKRNF+ekY77gLj2n8vBibNri7uigIK5FWSV2++NsMCGN5vszhpTLkJ2sucsL
	stSWSU/dcI0kipIjfjFCj9X6eANuKTPpE7vKtydEEu1siualznoG46BO0fIRTtp0kvdihv2ZGixgX
	39eqhzzk9GrLpslmlmNk/ao48jCU71Lv3IhAvh+pgE6uAKwpqR8IaL63yZX4YaP6enTtMgpQnAmxw
	8z7wu0XagYiHMlMWVpae2zZoNgqZQaF8HqoqsgIVVzIZy3flcOTVcKea9kGdI8n7hvl/pE/jUVT+8
	A7AeJJYlADqHolWeVkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuMD-00000002hMY-3YZv;
	Mon, 06 Jan 2025 21:09:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUuLW-00000002hFT-0Hmt;
	Mon, 06 Jan 2025 21:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B23645C5E77;
	Mon,  6 Jan 2025 21:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F62C4CED2;
	Mon,  6 Jan 2025 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736197748;
	bh=d1lmIkFGT2wN5FlmMfsKR7+J04liC6MhrcnlDGlR1cs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qG+EVTQ1EzEZrWxgJZTuUZTyxf80bfaH5aOPwR5X36MK4fcqLobeWv71FAMsgyjj2
	 ahvGMkJFOsWaRszDn5eyDDmcutreJajnKH/9hzlj2msnPUkaRV/PC/HLlzCNf0ZeHi
	 zmR3Bu5vdHsrUNBcUZRHaViH+op1QJ0bEh2bZsJfXRV0uak/24quKi2qkg0O5vq6rY
	 p4wMev+CUEijy1mIZCX1i1el4/030xY3DRhzcvu6sgi/AeapUxHJ2hnAPYloiIlxvp
	 Twjv5b/92Ej3Xoe/HTgP6JKrDLnsOfsdslIh9XSXKJ7/1RSHluL3duF9RjzCtqMggu
	 tM4MpuGoIkxsg==
Message-ID: <ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com> <20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com> <9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org> <1ja5cp8f87.fsf@starbuckisacylon.baylibre.com> <88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org> <1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jan 2025 13:09:06 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_130910_199496_FE8C79FB 
X-CRM114-Status: GOOD (  65.47  )
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

Quoting Jerome Brunet (2025-01-06 02:12:16)
> On Mon 30 Dec 2024 at 17:08, Stephen Boyd <sboyd@kernel.org> wrote:
> 
> > Quoting Jerome Brunet (2024-12-21 03:09:28)
> >> On Fri 20 Dec 2024 at 16:12, Stephen Boyd <sboyd@kernel.org> wrote:
> >> 
> >> > Quoting Jerome Brunet (2024-12-20 09:17:43)
> >> >> Remove the big clk_regmap tables that are used to populate the regmap
> >> >> field of clk_regmap clocks at runtime. Instead of using tables, use devres
> >> >> to allow the clocks to get the necessary regmap.
> >> >> 
> >> >> A simpler solution would have been to use dev_get_regmap() but this would
> >> >> not work with syscon based controllers.
> >> >
> >> > Why not have two init functions, one that uses the syscon approach from
> >> > the parent device?
> >> 
> >> That would duplicate all the ops and would not scale if anything else
> >> comes along. It would also tie the controller quirks with
> >> clock ops. I would like to keep to clock ops and controllers decoupled as
> >> much as possible
> >
> > Hmm... Maybe the init function should be moved out of the clk_ops and
> > into the clk_init_data structure. It isn't used beyond registration time
> > anyway, so it may make sense to do that and decouple the clk_ops from
> > the controllers completely. Or we can have two init routines, one for
> > the software side and one for the hardware side, but that's probably
> > confusing. If anything, a clk hardware init function can be exported and
> > called from the clk software init function if needed.
> 
> The .init() is really for the clock itself, so it makes sense for it to
> in the ops. Removing the init from the ops would just be another layer of
> controller init, something we can deal with in the probe() function.
> 
> What I'm trying to do here is properly decouple what belongs in each.

Got it.

> 
> >
> >> 
> >> > Is the typical path to not use a syscon anyway?
> >> >
> >> 
> >> I sure hope there will be no new syscon based controller but, ATM, around
> >> 50% are syscon based in drivers/clk/meson. Those are here to stay and I
> >> doubt we can do anything about it.
> >
> > Ok.
> >
> >> 
> >> >> 
> >> >> This rework save a bit memory and the result is less of a maintenance
> >> >> burden.
> >> >> 
> >> >> Unfortunately meson8b is left out for now since it is an early clock
> >> >> driver that does not have proper device support for now.
> >> >
> >> > We should add a clk_hw_get_of_node() function that returns
> >> > hw->core->of_node. Then there can be a similar function that looks at
> >> > the of_node of a clk registered with of_clk_hw_register() and tries to
> >> > find the regmap either with
> >> > syscon_node_to_regmap(clk_hw_get_of_node(hw)) or on the parent of the
> >> > node for the clk.
> >> 
> >> That's the thing. It means encoding the controller quirk of how to get
> >> regmap in the clock ops. I would be prefer to avoid that.
> >
> > So if we moved the init function out of struct clk_ops it would work?
> 
> That's already what I'm doing actually. I have the controller part which
> position regmap so the clock part may get it regardless of where it
> comes from (syscon, io or something else)
> 
> > We could have helpers for the common paths, i.e. the device has the
> > regmap, or the syscon has the regmap, etc.
> 
> I think this is what I'm doing actually.

Great!

> >
> >> 
> >> >
> >> > TL;DR: Don't use devres.
> >> 
> >> Using it makes thing nice and tidy. clk_regmap does not care were regmap
> >> comes from. It just picks it up where it has been prepared
> >
> > It doesn't work for early clocks that don't have a device.
> 
> This is why I left the possibility for regmap to be "pre-populated" so it
> continues to work the way it previously did.

I missed that part. If the old way stills works then we stay in the
halfway state which is undesirable. It's better to just finish a
transition.

> 
> I admit early clocks is a low priority for me since I only have one
> controller like this and I do not expect more.
> 
> If cleaning up this particular case is important, then I could add
> another level of init:
> * A callback passed along the init data of the clock to get the regmap.
>   That callback would be called by the .init() ops, if set.
>   That can encode any quirks without polluting the ops.
> * It will grow the init data so the change won't save memory anymore.
>   This was more a bonus so I don't really mind. Maintainability is more
>   important.

The struct clk_init_data _can_ be thrown away or reused, but it isn't
always done that way.

> * If the callback is not set, then it goes through the default, as
>   proposed here. This would avoid patching all the clk_regmap clock of
>   every controller.
> 
> 
> > Furthermore, the name of the regmap is
> > also usually device/clk controller specific.
> 
> The name registered in regmap_config itself is device specific, not
> controller specific, since it can come from something else in the
> platform (syscon or even aux devs), that why I think an independent
> namespace is desirable -- Same goes the generic solution Conor is
> working on I think.

Alright.

> 
> > The regmap assignment
> > doesn't really fit with the clk_ops because it's not operating on the
> > clk hardware like the other clk_ops all do.
> 
> I see what you mean and I agree. It does not operate on the hardware but
> it does collect the resources it needs to operate the HW, and ideally
> it should do just that - without controller quirks popping up there.
> 
> Anyway a callback passed in init data takes care of 'io vs syscon'
> controller too, same as devres. I can go that route if this is what you
> prefer. I thought devres was a more elegant solution but it is indeed
> restricted to 'device enabled' controllers. 
> 
> The change will be a bit ugly in the syscon ones but I don't mind.
> Is that fine for v2 ?
> 

Sure. I wonder if we should make it a 'const void *data' member of
struct clk_init_data so it can be anything and then either take a flag
day to pass that to the struct clk_ops::init() function or set the
struct clk_hw::init member to NULL after the init function is called. If
we're concerned about bloating clk_init_data then we could introduce
another two registration APIs that take a data argument and then pass
that to the init function.

 int clk_hw_register_data(struct device *dev, struct clk_hw *hw, const void *data)
 int of_clk_hw_register_data(struct device *dev, struct clk_hw *hw, const void *data)

or we could wrap the init data in a container struct in the drivers and
move the setting of struct clk_hw::init to NULL after calling the init
function.

	struct clk_driver_init_data {
		void *data;
		int (*driver_init_function)(struct clk_hw *hw);
		int (*regmap_driver_init_function)(struct clk_regmap *rclk);
		etc...

		struct clk_init_data init;
	};

Then the clk provider can use container_of(). If we did this we could
even copy the contents of struct clk_hw::init into the driver specific
wrapper that lives on the stack, repoint the struct clk_hw::init pointer
to the stack copy, and then all the logic can live in the clk provider
driver that registers the clk.

This last option may be the best because it saves memory by not
increasing the size of 'struct clk_init_data' and doesn't require a flag
day to change the function signature of struct clk_ops::init(), even if
there's only a handful of those right now. What do you think?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
