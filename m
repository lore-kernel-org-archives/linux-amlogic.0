Return-Path: <SRS0=mpVK=L2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB30FC11F67
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 01:04:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71D71613DA
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Jul 2021 01:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71D71613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrqvqcNgHriqN8CYxwOzgW67YuEjYGfvqi5g08e1+pg=; b=Jd9JNbrtrW1hRu
	DZoYyA/yC91DHyawFmJdhUQDE2jaTcnBi5VS1ZtvyP8ATmoy8cRZXUZdCalYCOjd7o1X5tP9TG/G+
	31UAp8mKuRGvap5OVq+9mOSRUs+rKoLPjlpcW3yI+tMDJPE6oguYxBaxJTld5pIoS6M5Zdmfwhs2g
	z2QnN0dxemhnti5JW4JKczNVeSVjlhHfOHVsQqd1nwqVTH3nRvCN/GRiIAhH0PTNxY0+Mci2RPqt3
	c280WhR992lEwQtBpC5TVymYslUW/bKQhgQE5CYSzRcGEywcXLiqxi8VJmIiepzbXYM9lGCTZ3a94
	IiCZfN5oi5g0fpbgmiUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz7bU-001i6n-7D; Fri, 02 Jul 2021 01:04:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz7bQ-001i61-G3; Fri, 02 Jul 2021 01:04:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC320613DA;
 Fri,  2 Jul 2021 01:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625187860;
 bh=6lTjGlBo1chEWk8zH/z2MaOn2rpR7j/WephiT1Q6uDE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=IP+Y2SZXVQQb5iXv1/hQ7YV6dfKIcp5Ti5vkvU+HiW7ojIKVho+h2BN0WKEDeruDu
 /TZP3qDxT8uOpuhgT1ojJ7+GjalDMrFj4y2cMKgUY1kZ2qMmqw6iZnV2W56h5Zn9BS
 c+VAndazUNxxr4jFisx0dOOLi/ONSdyTrU9/OONI2NEwLu0C65voJUelDnKFVd5QlH
 6vZjqaBWXVrIq+3xstRPlP0hkCrAxiAz/PlIQVe5eG3kFQXtNw8gmF5JkPhlwsp/HM
 zmV2uVqtseKHDIMRjHxfxBgvwot4lx5tLaz5uD9THlQ+4Mekw1D5BRIA5ChFScRGfv
 749U3EfjsiCYQ==
MIME-Version: 1.0
In-Reply-To: <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
References: <20210627223959.188139-1-martin.blumenstingl@googlemail.com>
 <20210627223959.188139-3-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/3] clk: divider: Switch from .round_rate to
 .determine_rate by default
From: Stephen Boyd <sboyd@kernel.org>
Cc: narmstrong@baylibre.com, jbrunet@baylibre.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Thu, 01 Jul 2021 18:04:18 -0700
Message-ID: <162518785878.3570193.8070459883237401552@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_180420_612119_54343BA0 
X-CRM114-Status: GOOD (  17.27  )
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

Quoting Martin Blumenstingl (2021-06-27 15:39:58)
> .determine_rate is meant to replace .round_rate. The former comes with a
> benefit which is especially relevant on 32-bit systems: since
> .determine_rate uses an "unsigned long" (compared to a "signed long"
> which is used by .round_rate) the maximum value on 32-bit systems
> increases from 2^31 (or approx. 2.14GHz) to 2^32 (or approx. 4.29GHz).
> Switch to a .determine_rate implementation by default so 32-bit systems
> can benefit from the increased maximum value as well as so we have one
> fewer user of .round_rate.
> 
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/clk-divider.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 87ba4966b0e8..9e05e81116af 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -425,8 +425,8 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
>  }
>  EXPORT_SYMBOL_GPL(divider_ro_round_rate_parent);
>  
> -static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *prate)
> +static int clk_divider_determine_rate(struct clk_hw *hw,
> +                                     struct clk_rate_request *req)
>  {
>         struct clk_divider *divider = to_clk_divider(hw);
>  
> @@ -437,13 +437,13 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
>                 val = clk_div_readl(divider) >> divider->shift;
>                 val &= clk_div_mask(divider->width);
>  
> -               return divider_ro_round_rate(hw, rate, prate, divider->table,
> -                                            divider->width, divider->flags,
> -                                            val);
> +               return divider_ro_determine_rate(hw, req, divider->table,
> +                                                divider->width,
> +                                                divider->flags, val);
>         }
>  
> -       return divider_round_rate(hw, rate, prate, divider->table,
> -                                 divider->width, divider->flags);
> +       return divider_determine_rate(hw, req, divider->table, divider->width,
> +                                     divider->flags);
>  }
>  
>  int divider_get_val(unsigned long rate, unsigned long parent_rate,
> @@ -500,14 +500,14 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  const struct clk_ops clk_divider_ops = {
>         .recalc_rate = clk_divider_recalc_rate,
> -       .round_rate = clk_divider_round_rate,
> +       .determine_rate = clk_divider_determine_rate,

Guess was right.

 $ git grep clk_divider_ops -- drivers/clk/imx/
 drivers/clk/imx/clk-divider-gate.c:     return clk_divider_ops.round_rate(hw, rate, prate);

>         .set_rate = clk_divider_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_divider_ops);
>  
>  const struct clk_ops clk_divider_ro_ops = {
>         .recalc_rate = clk_divider_recalc_rate,
> -       .round_rate = clk_divider_round_rate,
> +       .determine_rate = clk_divider_determine_rate,

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
