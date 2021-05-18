Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F807C433ED
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:50:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B7C66124C
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B7C66124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yRN5EZmPZKHH2dp6+HyFVZnKORIRC2ef54VdXbVgRhk=; b=jRrCKacxquxbRdVBZqvhNI8tg
	TzaNJ5bGvxR6+ukJI7dVtGdV8aPVIXdXKN79xGVpbYwKY7FZw7+HVSQdYUTWTO8vals+HMUlw7DNz
	yDKkGOZ6mXker76+NbqlP8buCcvBMFZRqeZv7Wq9Nj+gumXTTcUzXwDI3Uw1o7PIymx9+rJHYo5lo
	S6SB3weXYzKYh3gd37zcSutsKk+FmGjnFo1CEdyhJbw9Les1oaRc4PK5zfI1fNTw98IUNikBvAwTa
	NkwLBY5Jf5sXARKpR91q7sZiSJoQ7eAgx4XEi0k/jQ/tcnkgYkvq1eOTSpZq6aSM4AQpENT+3wIuQ
	9yr6GHS/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liuV2-00HS7s-3r; Tue, 18 May 2021 07:50:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liuV0-00HS7H-5U
 for linux-amlogic@desiato.infradead.org; Tue, 18 May 2021 07:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mA1mK0+fQE9/tWWJ52jiHZ2px5uCbZhPu9foxVoORVE=; b=j5eoT5BGdnbWsmo1W6PG7xlVPu
 aynn0kB07wVgaI7g0+OrwNk2wXg7JpTn6+kPaWgt3E8XlrZyA2EHWv5mL+7QcRL/2FtRqzalN8mwM
 OLXKTfnF+dLSCimQ0Vc25Ud2q0mPWnjv92KzacJR8ft9NOH9Oc/FGEfpOUzIm+FVTfUCJTTqBCe8V
 wPmGKfN0Qtgup6PrSAVxXfUmvf8y0lChHM+jo7J/IWy7a/j/etbiHZzjjVaMsUmb8opleC9R49w6n
 5SK3YsmNmcFdYzVSam1MUDZyCb2LLrKGGQjtmInIQ6yGxoz42GJJrlkduJhGVMbxk4Pk4wSUCy4TY
 ySC/k3Eg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liuUx-00EQjR-7d
 for linux-amlogic@lists.infradead.org; Tue, 18 May 2021 07:50:40 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so913133wmf.1
 for <linux-amlogic@lists.infradead.org>; Tue, 18 May 2021 00:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=mA1mK0+fQE9/tWWJ52jiHZ2px5uCbZhPu9foxVoORVE=;
 b=BMRVYMGPoqUoIM1+3P/qV2PqvGuHGfAWEFkAdkHQadEkf0+TYNk16srPsG6IlYh7lK
 BSKcVVTiGPpzP3frfC/ujxdSsTc4065WO8mxdZqkhVM2NF7U55g/CZeVj+wgn42mWr/1
 aZY3oMqLUvhBQlqST3R2cjF/FfSk6Hr8sXjmBZt/75K3eB49XCLb2OhaPueya+h6rCvL
 laoCmhisKRAQngbhCFq+l8kV7zoP8FAR0mxtDQGW0P61kH1waPNAZdJav4RqOKI61NG/
 QxlG3ADKmavBlvYzwgznXTu/PAh1NY+yM/wQllfkdlD8OZV0eHNF+38Y1MLsbHwoNIpn
 KCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=mA1mK0+fQE9/tWWJ52jiHZ2px5uCbZhPu9foxVoORVE=;
 b=JCmnkVJZpivboIpVuCym1ZylvypLdPDmwyRZbJVqMoRd0zhytYQLpK4ptsUhzsunyq
 1yzqUn8YdAfG71nSfCfeWmMbqb+zVvU5yJxer6OCgowRksB/o3b1KayibnBJfO0lF1Cm
 iUwia+DlZIBAM+9NZp3xzfkJJOXRVTCw3RnRHPO/mujrs9OHzWscsnCvMVtq2cCKCJGP
 Q6Q0kIKhtT6hj+IXiZF2EEVqRxVLHFYhctCLEdjwzw3W1tlAdB4HR9CA1k6djO+xYf12
 Zz6EHoIFbyRHMfm008ldpoVtcxbvuGf4iv1ihyV530RB+flxyrXE9TCGYEGoiq/okHNR
 tSMw==
X-Gm-Message-State: AOAM531pSkxK/94fyoJif+IG4ghb1oxluPxJM3yB9jkI8sd+NrGT2PnT
 3djcO17RX1c3PIarAMHBHLwFTw==
X-Google-Smtp-Source: ABdhPJzVVjWOzZjstMGH6oqwvQ9v8NQT386nZ8AwtHPb0QX7ljoBUK7xowqnIVc15vkLz9dBpk+gkw==
X-Received: by 2002:a05:600c:2301:: with SMTP id
 1mr3477659wmo.180.1621324237237; 
 Tue, 18 May 2021 00:50:37 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id h9sm16657780wmb.35.2021.05.18.00.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:50:36 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-4-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 3/3] clk: meson: pll: switch to determine_rate
 for the PLL ops
In-reply-to: <20210517203724.1006254-4-martin.blumenstingl@googlemail.com>
Message-ID: <1jo8d81nw3.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 18 May 2021 09:50:36 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_005039_302600_D90E072A 
X-CRM114-Status: GOOD (  21.38  )
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


On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> This increases the maxmium supported frequency on 32-bit systems from
> 2^31 (signed long as used by clk_ops.round_rate, maximum value:
> approx. 2.14GHz) to 2^32 (unsigned long as used by
> clk_ops.determine_rate, maximum value: approx. 4.29GHz).
> On Meson8/8b/8m2 the HDMI PLL and it's OD (post-dividers) are
> capable of running at up to 2.97GHz. So switch the divider
> implementation in clk-regmap to clk_ops.determine_rate to support these
> higher frequencies on 32-bit systems.
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Looks good. I see no reason to keep this one as RFC.
I can take it directly if this is OK with you ?

> ---
>  drivers/clk/meson/clk-pll.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 49f27fe53213..9e55617bc3b4 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -242,8 +242,8 @@ static int meson_clk_get_pll_settings(unsigned long rate,
>  	return best ? 0 : -EINVAL;
>  }
>  
> -static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -				     unsigned long *parent_rate)
> +static int meson_clk_pll_determine_rate(struct clk_hw *hw,
> +					struct clk_rate_request *req)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> @@ -251,22 +251,26 @@ static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>  	unsigned long round;
>  	int ret;
>  
> -	ret = meson_clk_get_pll_settings(rate, *parent_rate, &m, &n, pll);
> +	ret = meson_clk_get_pll_settings(req->rate, req->best_parent_rate,
> +					 &m, &n, pll);
>  	if (ret)
> -		return meson_clk_pll_recalc_rate(hw, *parent_rate);
> +		return ret;
>  
> -	round = __pll_params_to_rate(*parent_rate, m, n, 0, pll);
> +	round = __pll_params_to_rate(req->best_parent_rate, m, n, 0, pll);
>  
> -	if (!MESON_PARM_APPLICABLE(&pll->frac) || rate == round)
> -		return round;
> +	if (!MESON_PARM_APPLICABLE(&pll->frac) || req->rate == round) {
> +		req->rate = round;
> +		return 0;
> +	}
>  
>  	/*
>  	 * The rate provided by the setting is not an exact match, let's
>  	 * try to improve the result using the fractional parameter
>  	 */
> -	frac = __pll_params_with_frac(rate, *parent_rate, m, n, pll);
> +	frac = __pll_params_with_frac(req->rate, req->best_parent_rate, m, n, pll);
> +	req->rate = __pll_params_to_rate(req->best_parent_rate, m, n, frac, pll);
>  
> -	return __pll_params_to_rate(*parent_rate, m, n, frac, pll);
> +	return 0;
>  }
>  
>  static int meson_clk_pll_wait_lock(struct clk_hw *hw)
> @@ -419,7 +423,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>   */
>  const struct clk_ops meson_clk_pcie_pll_ops = {
>  	.recalc_rate	= meson_clk_pll_recalc_rate,
> -	.round_rate	= meson_clk_pll_round_rate,
> +	.determine_rate	= meson_clk_pll_determine_rate,
>  	.is_enabled	= meson_clk_pll_is_enabled,
>  	.enable		= meson_clk_pcie_pll_enable,
>  	.disable	= meson_clk_pll_disable
> @@ -429,7 +433,7 @@ EXPORT_SYMBOL_GPL(meson_clk_pcie_pll_ops);
>  const struct clk_ops meson_clk_pll_ops = {
>  	.init		= meson_clk_pll_init,
>  	.recalc_rate	= meson_clk_pll_recalc_rate,
> -	.round_rate	= meson_clk_pll_round_rate,
> +	.determine_rate	= meson_clk_pll_determine_rate,
>  	.set_rate	= meson_clk_pll_set_rate,
>  	.is_enabled	= meson_clk_pll_is_enabled,
>  	.enable		= meson_clk_pll_enable,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
