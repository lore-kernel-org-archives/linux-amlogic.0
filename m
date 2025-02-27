Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19501C197BF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Feb 2025 20:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrqZzk6AyZr4GIaJdIW3vInNiuM540q9UrlLICoGKlg=; b=Yss7QzFLQTOX9u
	ZjIZOqnctAXjDFwIs7MZRWIeLX+XOt0d9h9dkpxJQmFrEJYLrAFt9DQMrzcJKKHerp9YzWZb7eh65
	BuoH8VbZkBeGPcTwy7AKlPxJJCwkMT77FFrJvnqnigGgdpG4EECnXQ0B2wvPieiaoAqXRbAZv6Nzr
	NfvYJcrU6A9zWrdzC1SSq+EyW8zSUfODPlI1sME0lHsqEulzibUz0yXt3D1zS60BwUEY69xAlVBuy
	8lYRWGl8T8FNbIFCouXI9RnzIk/1LSurw4n0lQ6rFCmPEqs5nZo1HQP0Wu9qXjcfNKbW3rDgT+WaH
	FrpWAhGv6tctOO+W5LSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkAs-00000008jL1-2qW8;
	Thu, 27 Feb 2025 20:08:02 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkAr-00000008jKq-2xtm;
	Thu, 27 Feb 2025 20:08:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6371161F45;
	Thu, 27 Feb 2025 20:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6027BC4CEE4;
	Thu, 27 Feb 2025 20:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740686880;
	bh=qzrV7ojG37Gb87LwnmyFT03tAi+5cM0gi1gFMUwOnSg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Wm+jiQVETdhzpdKjuXSx8EyQpLWsIwCCInB8UTvsDaXula4vn5SYpUL5wwmhljKYr
	 C0rHLXmqRLLjwjKbOREYhyU5K9Fz9lXhwAa7/LrK3OwAqH+j8xfOCpWfqRzehfqBc1
	 sVpKg2zTHC/fLVyF074bYCUrKyFhvvqYV/aTn3JDEz/Ihj5+LpVSfkRzPxphdgKQyh
	 nbUTymGW+3kWJBqEkg5qhIBxenfGpCrI4E5JjQ+R6tSh3bM8XoXfc4se4uqdPU1sEJ
	 KnS93UaP8pCdIeJKQYXl5pGBLEHVTc/dVA+Kq2YOw7DrsnQesOyaEiUf1JeG6NAX3s
	 tgNrI/NMjC+tQ==
Message-ID: <250d7040fac61c408d648996e275aedc.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1jjz9bg0pg.fsf@starbuckisacylon.baylibre.com>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com> <20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com> <508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org> <1jjz9bg0pg.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock device or device_node
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 27 Feb 2025 12:07:57 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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

Quoting Jerome Brunet (2025-02-27 02:07:39)
> On Wed 26 Feb 2025 at 17:01, Stephen Boyd <sboyd@kernel.org> wrote:
> 
> > Quoting Jerome Brunet (2025-01-20 09:15:30)
> >> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> >> index 9b45fa005030f56e1478b9742715ebcde898133f..9818f87c1c56ab9a3782c2fd55d3f602041769c3 100644
> >> --- a/drivers/clk/clk.c
> >> +++ b/drivers/clk/clk.c
> >> @@ -365,6 +365,39 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
[...]
> >> + * Return: the struct device associated with the clock, or NULL if there
> >> + * is none.
> >> + */
> >> +struct device *clk_hw_get_dev(const struct clk_hw *hw)
> >> +{
> >> +       return hw->core->dev;
> >
> > Maybe we should increment the device refcount and require callers to
> > put_device(). Now's our chance to make the change!
> 
> I'm afraid this would lead to a lot of boilerplate code and mis-management,
> especially in the clock ops.

Don't we have __release() helpers? Not sure what boilerplate you're
talking about.

> 
> Would it be better if clock core took care of that, at least for the ops
> part ? I mean incrementing and decrementing the ref count based on the
> clk_hw registration. That would make things a lot easier for clock
> users.

Meh, I don't know. We've been assuming that the device is present
because the driver will be unbound and the clks unregistered before the
device can disappear. Nothing enforces that though so things could go
wrong if we have a bug somewhere vs. knowing for sure that the refcount
is incremented here. What you're suggesting is a bigger change, pushing
down the reference counting so that as long as the clk is registered the
device is known to be valid.

Looking into the crystal ball of the future shows me that this will get
wrapped in rust and at that point we'll be sharing the reference (likely
not mutable) with the caller. If we do proper reference counting at the
start that will make it easier to convert code, but it probably doesn't
matter much because any rust clk provider would use the rust wrapper
where we could handle the refcount logic.

> 
> If the consumer of the API uses it for something that may outlive the
> clk_hw, then it is up to it to properly increment the ref count since it
> is clearly not clock stuff.

Sure. I'm fine to not change anything. Mostly thinking out loud.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
