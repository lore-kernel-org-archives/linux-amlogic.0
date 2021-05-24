Return-Path: <SRS0=MQG/=KT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBB8C04FF3
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 19:39:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B300A6109F
	for <linux-amlogic@archiver.kernel.org>; Mon, 24 May 2021 19:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B300A6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:
	In-reply-to:Subject:Cc:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WYvYTsZIhZYrO0HugQoyoXu4QoZLPhLBUUiMuJEJk5Y=; b=W0YGPi5vT4mN3z3e8Ls95mJe3S
	oiIDGdFBfz+ZcaB5mLH5fvqaAQR0zR6yI2wgwgwE5jcmNhKy4YlalaS85x/nrdzoBF+d/AnL6D0RA
	+swN/bSP0Cu/ruIesSXMwdhz9ebsek0mF/S0dJDijlqMMoloVxpWTuzUcV0grsSCmVjdP465DFB/q
	zh3vm3iajuiZf+jokmf6GA8JvPNHpCM0qNsWjFpkLSWFRzbfVuX5bi8nf59x//EO9JhG85zzhGAka
	hG1b3ZlVgTa367fjIGHzpynnwJ1Q3KbsCmc1u5VVbv1M8rx7HE/DYavblsPMuoJgGT67NVvd0vxx4
	FT+YTuvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llGQX-001i8p-Fu; Mon, 24 May 2021 19:39:49 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llBbL-000zih-RC
 for linux-amlogic@lists.infradead.org; Mon, 24 May 2021 14:30:41 +0000
Received: by mail-wr1-x429.google.com with SMTP id d11so28744670wrw.8
 for <linux-amlogic@lists.infradead.org>; Mon, 24 May 2021 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=orAplirkWFknLWPMzVptcilNsNkdO+txSDeVHlyUIIY=;
 b=V1WeL0MdBuCjmtFOYJ/om7yQj6y8yOrb//GjPqdgtk11rQZN/7yPBrAKAd/KfOCJ0I
 2WYh2Nt60DVeJBFIWJnwC3DNvXM4xds6aIHEnePxhR11BvHfE21Etz6M5wwejVyGKDSS
 CWS38FMFysxoXrQ5oJ1JLluJahFCeX0r7+HhPxQOEyPfLSwB47xlTmPIRZN55VXAGHWJ
 5kUEYuoGeYdZz1VmRv6UMlCO7pLVftxou+XWpXXc1a+TyhXpJ9vpLff/WQYh5Kllqrcv
 kLwBHK9JWAA5r8czTK/6eteUnG0qFjxxMoVGz1JNQQ4C1qSOFR4hoNkrBAYgVyW5aXR9
 Xi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=orAplirkWFknLWPMzVptcilNsNkdO+txSDeVHlyUIIY=;
 b=VL67S6+CGrC59UQ5pnH3HLqLeTyPHaEcjZu4OYwe06upy6U9nh2P/PYu3ShPq37Av8
 r1DlccDYDb4kQLDqehzxSIEwRxQZWAOeddp8jl3iWRPahB7T7MV8KZRqCnNH9NOVbUOq
 8M5JyYbpSJhfP3pGZZn7g+Edapne0y0sCh7wneGa3A2oXMo8Mo4jCXz2sREd2aUFiBah
 aBavkGXkHu3RMTrlasDduaSZRHjNF6bhJEJIVZC+7JP+DVxi5dpYT4RiqdRDLHj+1o3B
 DepVjOwqCftIUZcw2Zmh+9o+rvjqsyzREiDrzXuRux715kL1uCywY+smWrNTLreBTs8+
 6GIw==
X-Gm-Message-State: AOAM533RLBGcExRid3dsUVk3pkvGGvm1OMiJLtZYq+riKP6XxZ4ivUNc
 CWK1XESoReAXdur1GqTMGyUmuQ==
X-Google-Smtp-Source: ABdhPJzzflD8S1xyzfWbn0VxC6DWx5C3QgvKTnnhg286AVQN/zJPEz8HFWusZWy6bjUPluSQDZc3Jg==
X-Received: by 2002:a5d:6e03:: with SMTP id h3mr10890801wrz.138.1621866638160; 
 Mon, 24 May 2021 07:30:38 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id c194sm8192606wme.46.2021.05.24.07.30.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 07:30:37 -0700 (PDT)
References: <20210524134517.687089-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: narmstrong@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 khilman@baylibre.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: meson: meson8b: Use CLK_SET_RATE_NO_REPARENT
 for vclk{,2}_in_sel
In-reply-to: <20210524134517.687089-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jmtskb3w2.fsf@starbuckisacylon.baylibre.com>
Date: Mon, 24 May 2021 16:30:37 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_073039_931995_158330F9 
X-CRM114-Status: GOOD (  17.87  )
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


On Mon 24 May 2021 at 15:45, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Use CLK_SET_RATE_NO_REPARENT for the vclk{,2}_in_sel clocks. The only
> parent which is actually used is vid_pll_final_div. This should be set
> using assigned-clock-parents in the .dts rather than removing some
> "unwanted" clock parents from the clock driver.
>
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> After a hint from Jerome (thanks) this is the improved version of
> "clk: meson: meson8b: Don't use MPLL1 as parent of vclk_in_sel" from [0]
>
>
> [0] https://patchwork.kernel.org/project/linux-clk/patch/20210524104533.555953-1-martin.blumenstingl@googlemail.com/
>
>
>  drivers/clk/meson/meson8b.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index a844d35b553a..0f8bd707217a 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1175,7 +1175,7 @@ static struct clk_regmap meson8b_vclk_in_sel = {
>  		.ops = &clk_regmap_mux_ro_ops,

I just noticed that these muxes are read-only ATM.
It does not make this change (or the previous one) wrong but it does not
make much sense as the mux won't ever change.

I suppose you make this mutable with another patch later on ?


>  		.parent_hws = meson8b_vclk_mux_parent_hws,
>  		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>  	},
>  };
>  
> @@ -1358,7 +1358,7 @@ static struct clk_regmap meson8b_vclk2_in_sel = {
>  		.ops = &clk_regmap_mux_ro_ops,
>  		.parent_hws = meson8b_vclk_mux_parent_hws,
>  		.num_parents = ARRAY_SIZE(meson8b_vclk_mux_parent_hws),
> -		.flags = CLK_SET_RATE_PARENT,
> +		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
>  	},
>  };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
