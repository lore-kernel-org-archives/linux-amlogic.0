Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFA5C197BF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Feb 2025 22:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C+Q3WT3Lflfk1z+e/rrcX5bvwBcunEN3SyPOMfN9Esw=; b=YDVpTcMdS9iwHX
	XRWr/rM68TXPFdR04wiMfDWedcSIo6eB3B0XbHtS5SD8pcjeZugJEcWIg9FUo7ml2FzUhfG8eCj2x
	g4VUm/0GuMoYOYeRXJd1Dvrb+AumhrRWADKN//d1vy6Hr+ZO8Z59USHsXM7hNFmwWLJRfk9SDXrne
	++BYNNfASdXBjDaNO1v8DRXYaEudbm8NZ8RB6QrCMoD+8b8BatrWqii2PEy407v1iqjSrRRzpeROb
	NpHYXBUNmPDSJ3qs2+al1cb24lFWAk5eyRZC+s7KwiDrsIaITJ/wuLiQ6eVxoklqZQVgkeqmeAa2Q
	Bh3HxQ5hfu152C0zcWnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmnz-000000095oV-26YM;
	Thu, 27 Feb 2025 22:56:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmmV-000000095f8-325M;
	Thu, 27 Feb 2025 22:55:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 452F65C4609;
	Thu, 27 Feb 2025 22:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2C7C4CEE5;
	Thu, 27 Feb 2025 22:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740696902;
	bh=9M9wgjf5Eku3KGzfU/Spz3evA/7ijTJ6zhkFNKmluts=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iGTUEjAdoa+AEcKSIz7YTUkqwuibJdq7HdrpnSPAot2i4LDqimrqFLjnOY3uop015
	 OBNS6/3/hyivaNYzAl+skCbD+IFjwVOQ9YaN0sn21wKiCJhlpGv3LDjpSYRqto+zSi
	 R1kjqxgi5Ho1UoJyB9KJqBCvUdC3QsCmo9LHGD8SD5GXABdTWl/wOk/aITHLlX7KvH
	 sKHoltNlmYJaGqhGMV8PRFwb+k1DlBY/orWCp7ERwPK5DJTAXLPRvpqmBqvaNo7vY4
	 95lDTV84TZ6ggRUWc7y6ESsHgacRmawXtXfC50WyUo6326L5mH6lAqjfLnn1ReIf7k
	 1CNGnQiJvj16w==
Message-ID: <5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1j4j205ark.fsf@starbuckisacylon.baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com> <20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com> <9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org> <1ja5cp8f87.fsf@starbuckisacylon.baylibre.com> <88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org> <1jfrlwb69r.fsf@starbuckisacylon.baylibre.com> <ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org> <1jmsg2adgu.fsf@starbuckisacylon.baylibre.com> <697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org> <1j4j205ark.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 27 Feb 2025 14:55:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_145503_849863_D20DE2C4 
X-CRM114-Status: GOOD (  22.77  )
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

Quoting Jerome Brunet (2025-01-15 07:58:55)
> 
> I'd like to register controller init hook to apply on all the clocks of
> a particular type. The reason to do that is to drop the big clk_regmap
> table that are a pain to maintain (in addition to be ugly). I hoped it
> would also save a bit of memory.
> 
> The solutions we've been discussing so far feels like we are moving
> around the problem, recreating the memory saved somewhere else,
> perhaps in a more complicated way. I'd like to find something more
> convinient to use, which does not scale the memory used with the number
> of clock registered. The point is not a different hook for clk_hw after
> all.

What are the goals?

 1. Drop clk_regmap table
 2. Reduce memory
 3. ??

> 
> Here is an idea, how about list of hook identified by ops and controller ?
> 
> The node would look like this
> 
> struct clk_type_init_node {
>        struct list_head         entry;
>        
>        struct device_node       *of_node;
>        struct device            *dev;
>        const struct clk_ops     *ops;
> 
>        int (*init_hook)(struct clk_hw *hw);
> };
> 
> The change would be minimal in core CCF, just searching the list for a
> match in clk_register. On most platform the list would be empty so there
> is virtually no penalty when it is not used.
> 
> From the controller, the usage would be very simple, just calling a
> function before registering the clocks, something like:
> 
> int clk_type_register_dev_hook(struct device *dev,
>                                const struct clk_ops *ops,
>                                int (*init_hook)(struct clk_hw *hw))
> 
> or the 'of_node' equivalent.

Why can't we register the clk at the same time? I don't understand why
we want to search a list to match something up to what could be another
argument to the clk registration API. Isn't this the same as 

 clk_hw_register_data(struct device *dev, struct clk_hw *hw, const struct clk_register_data *data)

Why is that hard to maintain? Is that because the clk driver is
registering various different types of clks and it wants to do different
stuff depending on the type of clk? Why wouldn't wrapping the clk_ops
in another struct and then using container_of to find the custom clk_ops
not work there?

> 
> I admit this is heavily inspired by how devres works :) but it does solve
> the early clock controller problem and does not scale with the number of
> clock registered.
> 

I don't know if devres is a good model. It's about tracking allocations
and things to undo later, not really to track things to do when called
initially.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
