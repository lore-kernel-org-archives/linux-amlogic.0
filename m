Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F46AC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Feb 2023 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8hRj+WinVTZMSYPdPMarHL+rh4mkt2dt/l+UsRi0sxA=; b=e/YPx/FUnEOPwM
	W8hVcGfv+EaPmYp/as+6f91s8zWlonuc0lFgdw3XTDRJZQOTT5lDWy1c8UKxDMaOXG2iPUbTQ09KB
	c4FXRyoJGx6iQK1kUw+OoVo+ZLKs6klNIjs2bZ0Z7kwfW/3OW9Ib+FGvu+0HVb037h+dOZXED2nV3
	EuDgVLVG8qTTrHJ9UB6jmFE09SrasE5J6xLdYDg+lARWK3pHqywNdUzvqnGTcvHQyr33eb4h1hPZZ
	v1sVI2DZcksWO2W0XGLa0XIsCd0hXl1BCqynRHW8CWtPGCBhzKai1/ib+yXYMGJRydGRVVZ98Y1zs
	z/JzVwqA5AJfMMpGJSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8sA-00FxlV-BV; Thu, 23 Feb 2023 10:30:46 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pV8rv-00FxfS-DZ
	for linux-amlogic@lists.infradead.org; Thu, 23 Feb 2023 10:30:34 +0000
Received: by mail-wr1-x435.google.com with SMTP id i11so4113667wrp.5
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Feb 2023 02:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=3/d1V97xfn1urp1yFSAFHB4bA8otMHdcMdq0yddMNFI=;
        b=hcoIV/z8lyL+ysVNVs6Y6+yJCu00ToOB1RctbNGmzn6TVnVvxY7XobmvDx0cUkA2xQ
         xfM4zr3AWE+b2Gtowo9aLR8xr2kvlYJfKxP9Itoq39971OTw4jDjtvXuJIaW6qUeofV5
         EQWm9Hn8VbRrY4wbZjRT+ENuVYy9Veq5SwjN8cFj2tCHTSpNKWogtut2gHDMrwDsU5cZ
         ZKqDIGyOhckxOd0wsydnj2kidFvup2vNd5mqGZHNZgcLygtgv2+azbCyRnBMohLbAGHA
         LQxmw22JVxiWV5822JzZZs1rVzyf1J1uIGehZSU3KFmWDRLsvMPcd89e+agLiMmUJ+0h
         ah3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/d1V97xfn1urp1yFSAFHB4bA8otMHdcMdq0yddMNFI=;
        b=sA21AWpoB+J4IXjD+q+TmO7ZwOy0R1fjqIovpiFLo+AF0pSSNErt5ojHDK1q8bglbV
         4nMNr6s5X8F9J9YXSXx0w+TYW7Ga+K61pzKhD46n8GpoViK8EewOdKffwidJ65Na7qKL
         deIBcpB6PpSGHUwWM3BG1khP2XsE1R1evq1sZSvoRBjP3IJFJrUcMX3sBO82r/Lz1X/Q
         bRI6sF4Ymz3FluLEpwD5yeM3iXbQZ4KJxt67vzvG8QcObxK3lqTRJO7tl2p/JYk9Z9YT
         IijvwMwbtA60YxjZseg60sTTLO0Ms8rpHlNgaQ+QtVZvVxOLHSpZY2rn3OD+u1JMQgNp
         yuMQ==
X-Gm-Message-State: AO0yUKXP2iJrGNrTd1tnxCWiwQPSd/4auYV6/TxtKmBrfiIgYLbD4Uqr
	R947LDtuZk5ZDDw5fgXvfQ1Dtw==
X-Google-Smtp-Source: AK7set/AJ/sQ293L1C/QDJKZNG/kThSW0HregqvGRPQyAGhtGjSWliE7pQlcCpSYC0riIpZo4sB8jQ==
X-Received: by 2002:a5d:6190:0:b0:2c7:a0b:e8d2 with SMTP id j16-20020a5d6190000000b002c70a0be8d2mr5185559wru.19.1677148226407;
        Thu, 23 Feb 2023 02:30:26 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id t6-20020a5d4606000000b002c55306f6edsm13119455wrq.54.2023.02.23.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 02:30:25 -0800 (PST)
References: <20230223062723.4770-1-yu.tu@amlogic.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil  Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Martin
  Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
Subject: Re: [PATCH] clk: meson: vid-pll-div: added meson_vid_pll_div_ops
 support to enable vid_pll_div to meet clock setting requirements,
 especially for late chip
Date: Thu, 23 Feb 2023 11:11:29 +0100
In-reply-to: <20230223062723.4770-1-yu.tu@amlogic.com>
Message-ID: <1jv8jsoerm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_023031_666219_7CB7A2C7 
X-CRM114-Status: GOOD (  25.82  )
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


On Thu 23 Feb 2023 at 14:27, Yu Tu <yu.tu@amlogic.com> wrote:

Title is way too long, 75 char max

> The previous chip only provides "ro_ops" for the vid_pll_div clock,

The driver does. Other chip could use RW ops I suppose.

> which is not satisfied with the operation requirements of the later
> chip for this clock, so the ops that can be set for the clock is added.
>

What requirements ? What "late" chip ? all this is quite vague.

> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  drivers/clk/meson/vid-pll-div.c | 59 +++++++++++++++++++++++++++++++++
>  drivers/clk/meson/vid-pll-div.h |  1 +
>  2 files changed, 60 insertions(+)
>
> diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
> index daff235bc763..e75fa6f75efe 100644
> --- a/drivers/clk/meson/vid-pll-div.c
> +++ b/drivers/clk/meson/vid-pll-div.c
> @@ -89,6 +89,65 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
>  	return DIV_ROUND_UP_ULL(parent_rate * div->multiplier, div->divider);
>  }
>  
> +static int meson_vid_pll_div_determine_rate(struct clk_hw *hw,
> +					    struct clk_rate_request *req)
> +{
> +	unsigned long best = 0, now = 0;
> +	unsigned int i, best_i = 0;
> +
> +	for (i = 0 ; i < ARRAY_SIZE(vid_pll_div_table) ; ++i) {

It would be nice to actually describe how this vid pll work so we can
stop using precompute "magic" values and actually use the IP to its full
capacity.

> +		now = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate *

This effectively stops rate propagation. That's not how determine_rate()
call back should work. Have a look a clk-divider.c and how it calls
clk_hw_round_rate().

> +					    vid_pll_div_table[i].multiplier,
> +					    vid_pll_div_table[i].divider);
> +		if (req->rate == now) {
> +			return 0;
> +		} else if (abs(now - req->rate) < abs(best - req->rate)) {
> +			best = now;
> +			best_i = i;
> +		}
> +	}
> +
> +	if (best_i < ARRAY_SIZE(vid_pll_div_table))
> +		req->rate = DIV_ROUND_CLOSEST_ULL(req->best_parent_rate *
> +						  vid_pll_div_table[best_i].multiplier,
> +						  vid_pll_div_table[best_i].divider);
> +	else

What is the point of this 'if' clause ?
It looks like the 'else' part is dead code. 

> +		req->rate = meson_vid_pll_div_recalc_rate(hw, req->best_parent_rate);
> +
> +	return 0;
> +}
> +
> +static int meson_vid_pll_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +				      unsigned long parent_rate)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_vid_pll_div_data *pll_div = meson_vid_pll_div_data(clk);
> +	int i;
> +
> +	for (i = 0 ; i < ARRAY_SIZE(vid_pll_div_table) ; ++i) {
> +		if (DIV_ROUND_CLOSEST_ULL(parent_rate * vid_pll_div_table[i].multiplier,
> +					  vid_pll_div_table[i].divider) == rate) {

This assumes the set_rate() is going to have a perfect match and
otherwise fail. You should not assume that. Have a look at clk-divider.c
for examples.

> +			meson_parm_write(clk->map, &pll_div->val, vid_pll_div_table[i].shift_val);
> +			meson_parm_write(clk->map, &pll_div->sel, vid_pll_div_table[i].shift_sel);
> +			break;
> +		}
> +	}
> +
> +	if (i >= ARRAY_SIZE(vid_pll_div_table)) {
> +		pr_debug("%s: Invalid rate value for vid_pll_div\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +const struct clk_ops meson_vid_pll_div_ops = {
> +	.recalc_rate	= meson_vid_pll_div_recalc_rate,
> +	.determine_rate	= meson_vid_pll_div_determine_rate,
> +	.set_rate	= meson_vid_pll_div_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(meson_vid_pll_div_ops);
> +
>  const struct clk_ops meson_vid_pll_div_ro_ops = {
>  	.recalc_rate	= meson_vid_pll_div_recalc_rate,
>  };
> diff --git a/drivers/clk/meson/vid-pll-div.h b/drivers/clk/meson/vid-pll-div.h
> index c0128e33ccf9..3ab729b85fde 100644
> --- a/drivers/clk/meson/vid-pll-div.h
> +++ b/drivers/clk/meson/vid-pll-div.h
> @@ -16,5 +16,6 @@ struct meson_vid_pll_div_data {
>  };
>  
>  extern const struct clk_ops meson_vid_pll_div_ro_ops;
> +extern const struct clk_ops meson_vid_pll_div_ops;
>  
>  #endif /* __MESON_VID_PLL_DIV_H */
>
> base-commit: 8a9fbf00acfeeeaac8efab8091bb464bd71b70ea


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
