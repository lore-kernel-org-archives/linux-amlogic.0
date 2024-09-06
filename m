Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D5ECE7AB8
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9c1wN8cACfOC2BqZKZ0Re8mc1sHvwcuAf4dWb0Xuv7g=; b=uZqzXM/GsuQhYv
	uexCnXM7SNmIHoSL2MDfNmm7XGX0uAXVoOBXWJKltYMGQl+y+H0VvRpSTTJJm3smdmB4AyUSomCH/
	S4i7N0v0mhLzXhsUTO84jTu5WfNGG6vmwxWggzc887MEVtwsbEjZjJbw7re5LX20G3lYXueID/fBL
	nrPuRZClBDNqQz+tt4kUvfRsCERbS2g52IJDKt+4dYgUrW4Ai14eY9EWNmxfTtA+aaJzLSZe9AZNE
	eAVB3qTZCSBAgFjzfqELakExGtMqwfPWUNpMOmvfnEyYXy1tnIM3MWgRcZdrOykyHNOotwf7wVbJ5
	1Fqpqtg0jl4pKYOrVN9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smT2O-0000000B0cf-1EPP;
	Fri, 06 Sep 2024 07:05:44 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smSoR-0000000Awqc-0FOI
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 06:51:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42bbd16fcf2so13156125e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Sep 2024 23:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725605477; x=1726210277; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUwiZqd9TfqNcVUN4h6daMaGyO3lnoY2hjg6KdFRqok=;
        b=U+JHaFhxPgwoPtn7PeGOv47zmjDSzNySHTW/nUlcop24YVCIhMEDdH2EYkGbJHJ0yo
         +2XeQq+X5ETgSFCyyFX3JbbsrAylBSj27FKG/tYGYql6fwvU4spgwRzADDB+cYWy4Sjw
         B8pujyBOhSyEdIP8xEu2LJKYZ4dn04eRWYvM7xIS1DX/b8SQ6+6QaXR/EhQJnoCN1GJG
         IgAf5cuvWiTcb+s3GGMkkHr6rH+git2nOcyduw/fpgEvVZ1sjTtWZ/2rDkz9tTi7BnYw
         JyUt7/0plCblupfPTkZaSslEQ4YaryMEmNo0wlyPChQGu2C5/fEt2NYePkaWrJLR8kQE
         ORiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725605477; x=1726210277;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUwiZqd9TfqNcVUN4h6daMaGyO3lnoY2hjg6KdFRqok=;
        b=hqNNvEzK7++Q2tpOm1aJFDgFJhaPUqm++yCJl9Qp1RczY52j4aOHBNwtP4626039y3
         a+S41gP/hlbySXrlXBEjAH51QKB3AEWson0MeDw2jaIQ3WKTaPJQADkJiEqg+3O1YP+q
         1CLh5QkqB+ZgExyVvq5spAu9LfVVN6u81X3rgLxg+Fbqke1gLK9yuBBvuG4MDXla1FAT
         4olRttFGIbqzFZMFhsUvCtDliGdZ0EZYpJdfJF+q/q9CmftX0Z+TUWxAHmc3cPCl26zb
         /IX4rSq/2y+PMM/m0SShp0peTsjGNtI/TZuZbfmcnJqLhaGBKQLu0KevD715r+ZGy9mz
         nSsg==
X-Forwarded-Encrypted: i=1; AJvYcCWRPiYgEuDE4KkTSm0YhCyM+M2ArZkWn/tWXbc5IXGx0t+FWq7Vmmhq/H1fxjG1Cn3hYrDIbqAZ7SFz6tLd@lists.infradead.org
X-Gm-Message-State: AOJu0Yy50rjxMk2xHhFA7xl5ERPJ+bp/rNQ2kixkh9fBG2qc7SAajNK9
	YuEmGm1fJ9SZIxbGojtCQS3409NLNeQ8BCr7C9DytbEh4n3UNXGlL5voKn0fDKM=
X-Google-Smtp-Source: AGHT+IEAQ8+ZbApQ3oMw8V0g6qInfVZypTuRChEdnmRNkaOEzMCP4G/akqQASSKuY+whN0GPsSSR7g==
X-Received: by 2002:adf:ea09:0:b0:374:c1be:bf2e with SMTP id ffacd0b85a97d-374c1bec8ecmr12950003f8f.62.1725605476525;
        Thu, 05 Sep 2024 23:51:16 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4e33:801c:cee0:ee57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05c6facsm10144635e9.9.2024.09.05.23.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 23:51:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: meson: Support PLL with fixed fractional
 denominators
In-Reply-To: <20240906-fix_clk-v1-1-2977ef0d72e7@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 13:52:33 +0800")
References: <20240906-fix_clk-v1-0-2977ef0d72e7@amlogic.com>
	<20240906-fix_clk-v1-1-2977ef0d72e7@amlogic.com>
Date: Fri, 06 Sep 2024 08:51:15 +0200
Message-ID: <1j34mds2ak.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_235119_392631_4F0BE9C4 
X-CRM114-Status: GOOD (  20.98  )
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

On Fri 06 Sep 2024 at 13:52, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Some PLLs with fractional multipliers have fractional denominators that
> are fixed to "100000" instead of the previous "(1 << pll->frac.width)".
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 22 +++++++++++++++++++---
>  drivers/clk/meson/clk-pll.h |  1 +
>  2 files changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index bc570a2ff3a3..f0009c174564 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -36,6 +36,12 @@
>  #include "clk-regmap.h"
>  #include "clk-pll.h"
>  
> +/*
> + * Some PLLs with fractional multipliers have fractional denominators that
> + * are fixed to "100000" instead of the previous "(1 << pll->frac.width)".
> + */
> +#define FIXED_FRAC_MAX			100000

When the next arbitrary limit comes around, this will get very ugly.
Instead, please add frac_max to the pll parameter

> +
>  static inline struct meson_clk_pll_data *
>  meson_clk_pll_data(struct clk_regmap *clk)
>  {
> @@ -57,12 +63,17 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
>  					  struct meson_clk_pll_data *pll)
>  {
>  	u64 rate = (u64)parent_rate * m;
> +	unsigned int frac_max;
>  
>  	if (frac && MESON_PARM_APPLICABLE(&pll->frac)) {
>  		u64 frac_rate = (u64)parent_rate * frac;
>  
> -		rate += DIV_ROUND_UP_ULL(frac_rate,
> -					 (1 << pll->frac.width));
> +		if (pll->flags & CLK_MESON_PLL_FIXED_FRAC_MAX)
> +			frac_max = FIXED_FRAC_MAX;
> +		else
> +			frac_max = (1 << pll->frac.width);
> +
> +		rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
>  	}
>  
>  	return DIV_ROUND_UP_ULL(rate, n);
> @@ -100,13 +111,18 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
>  					   unsigned int n,
>  					   struct meson_clk_pll_data *pll)
>  {
> -	unsigned int frac_max = (1 << pll->frac.width);
> +	unsigned int frac_max;
>  	u64 val = (u64)rate * n;
>  
>  	/* Bail out if we are already over the requested rate */
>  	if (rate < parent_rate * m / n)
>  		return 0;
>  
> +	if (pll->flags & CLK_MESON_PLL_FIXED_FRAC_MAX)

Certainly don't need a flag for that. Use a parameter and default to (1
<< pll->frac.width) if unset.

> +		frac_max = FIXED_FRAC_MAX;
> +	else
> +		frac_max = (1 << pll->frac.width);
> +
>  	if (pll->flags & CLK_MESON_PLL_ROUND_CLOSEST)
>  		val = DIV_ROUND_CLOSEST_ULL(val * frac_max, parent_rate);
>  	else
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 7b6b87274073..e996d3727eb1 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -29,6 +29,7 @@ struct pll_mult_range {
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
> +#define CLK_MESON_PLL_FIXED_FRAC_MAX	BIT(2)

Remove this.

>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
