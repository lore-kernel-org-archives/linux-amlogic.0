Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E40AC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:10:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE4D2146F
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 17:10:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TfmHqSx0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+d7Vbyu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE4D2146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVFPLFWb53ToFirnyZKdzGhDqlQJa9q0F2Er4sC4j9k=; b=TfmHqSx0Hpp9vg
	Zd4heGYU0LBptLSV9D9ILVZMwZ7/sFgtHoCRiUeWkVtb32O6bj9I4a5dy7i3xxOFopQ190t/5pDER
	s5TaFSedQYR5nNero2uDmYiugica1k3ma9jJogUqJqfCK7LTX8jEp+XmdP0qfRhHGrz+2M4nZgdk0
	gHNkNvVApZhZ5QYWNKnMgXlam+cuhfd/OY9xehs5uLROKLJtrDVF6SQuRjnUrNV18uohr34HX3t4M
	gJJ+ov88GAh0X21EwpM1yX6/ZvWH3rEnzaQMxEbtJIRsiGUF0c6eE/wzE+9/byXfUMSnyRgOQq2Pn
	eIAEo+U7L2ZKaYOV0NsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8T7B-00032p-4J; Mon, 25 Mar 2019 17:10:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8T76-00031c-AV
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 17:10:23 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F3F3207DD;
 Mon, 25 Mar 2019 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553533819;
 bh=mjxygTOz0VfXyEdP437l5ZjPaHMvCuH2ypZNPL35xTk=;
 h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
 b=X+d7VbyuaMdwdPzusjaMKEp7d/Z9+OKyt6GTmtaX3hLJQBpw/+bkF+lEpfazRgZlI
 ihs4fTc6CjUy3/JITKtxz42md16cfO+/WXiG1bJnwCsZ5B/10yo9T7WkZRI9EGUecQ
 bpMLRyNBxwLBLmgi7wTV45/9Z4oAH1n96p/6UoaE=
MIME-Version: 1.0
In-Reply-To: <20190325111200.15940-2-jbrunet@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
 <20190325111200.15940-2-jbrunet@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/4] clk: meson: mpll: add init callback and regs
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <155353381842.20095.17915880223118004926@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Mon, 25 Mar 2019 10:10:18 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_101020_614718_255ACEA4 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-03-25 04:11:57)
> @@ -138,6 +129,27 @@ static int mpll_set_rate(struct clk_hw *hw,
>         return 0;
>  }
>  
> +static void mpll_init(struct clk_hw *hw)
> +{
> +       struct clk_regmap *clk = to_clk_regmap(hw);
> +       struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
> +
> +       if (mpll->init_count)
> +               regmap_multi_reg_write(clk->map, mpll->init_regs,
> +                                      mpll->init_count);
> +
> +       /* Enable the fractional part */
> +       meson_parm_write(clk->map, &mpll->sdm_en, 1);
> +
> +       /* Set additional fractional part enable if required */
> +       if (MESON_PARM_APPLICABLE(&mpll->ssen))
> +               meson_parm_write(clk->map, &mpll->ssen, 1);
> +
> +       /* Set the magic misc bit if required */
> +       if (MESON_PARM_APPLICABLE(&mpll->misc))
> +               meson_parm_write(clk->map, &mpll->misc, 1);
> +}
> +
>  const struct clk_ops meson_clk_mpll_ro_ops = {
>         .recalc_rate    = mpll_recalc_rate,
>         .round_rate     = mpll_round_rate,
> @@ -148,6 +160,7 @@ const struct clk_ops meson_clk_mpll_ops = {
>         .recalc_rate    = mpll_recalc_rate,
>         .round_rate     = mpll_round_rate,
>         .set_rate       = mpll_set_rate,
> +       .init           = mpll_init,

We actively discourage using init callbacks. Can you do this some other
way?

>  };
>  EXPORT_SYMBOL_GPL(meson_clk_mpll_ops);
>  

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
