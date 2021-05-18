Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5128AC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:48:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F3C60FE7
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F3C60FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vtiLiGSxF+i+mekB2jAQCJiMuU6JlTcLi+TTsriI+Yw=; b=RVLyFCOLpo7Ue8k4PZlqrXMLk
	Sc4EEoEaXnz8CHhME6C/48+VLexVbrHdQYYEGWRkD5ZIUoaRz74f0a85XCo9mtcQWciOk110qyUrn
	T5vsAusXucySxJN1J5WIpJLThB85fNs1nX1/CPD4oB57wskJPRNeSuLMmkdk90urztsglR8ljcWkT
	bwo5bI6QaSS21Du16rDDj6Oj8iDYcPDOl1SzzFOw9tGpNpm9xl/vYIoyDopbF5mGWd445miR6tPje
	eaSQcfQtRnPe0ikyB3OyVqp5hBWHM0bwqTETLxPQz1uM3M4vlNuTzVt/8xqEteVF+8NhkHQWM3yhH
	y+l3bohAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liuSX-00HRCI-Jj; Tue, 18 May 2021 07:48:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liuSN-00HRA4-E2
 for linux-amlogic@desiato.infradead.org; Tue, 18 May 2021 07:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qbYhZ0j3U7IXcdLANW6Ri1lM6U26+3AlkXH54c6o33U=; b=Eb40vX+N8C2P83U09G7ujxEm91
 V1CiL99po0mlm7Ex6JXcFoTTuazqzY79MSZXzdb3uzDMNgRLzgZoMoMec/u/0Op8LRsDSY7AbjN/k
 +Yt+mU17ijiqsxOFhbcxBGt8caEemBW9CXilbz2F5rMlUnFj6dEC6uKHM1Hmp3ckpp7jdB6GLHWW7
 HPcqg3c/OlZn275wxkOWCaKLtSnhEDgR/YxMqMZF/x251zsAELdZFHaBHdiuDdXpC022oYnVlN7Da
 R+tHpImIgH50DbeRNKmHpRAO6H3HjyOQP11J/qkO0YFbZNE/gtT7Yj9issvjiaJbE9wyZx7fwfliQ
 K+chWzJg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liuSK-00EQac-Rw
 for linux-amlogic@lists.infradead.org; Tue, 18 May 2021 07:47:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 y184-20020a1ce1c10000b02901769b409001so905760wmg.3
 for <linux-amlogic@lists.infradead.org>; Tue, 18 May 2021 00:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=qbYhZ0j3U7IXcdLANW6Ri1lM6U26+3AlkXH54c6o33U=;
 b=UNsPc7NxgufwBvAxSN+WYxjkS2wP7YKuiSTAO7fTBlrx/MXk+8EAEXbijP/ncLJppV
 YKZwrNuPv7BHS+5JF9a2f2mrChqUm8Wm30714fyBi5RGDFFT/3u28/M6Dq/ytavc4/Cm
 YFGoYw75AF05UHj8+dO72HXzxU4ztfGlP4CRpZLvb2z+qX7eTsPdDUQD4X3T2Td/8P5M
 OTX6yFpjac7arJZg1O5HVRCtB9e4Yf+Pk2wDTqBTiywkFhLH/kdYr7ycSm0EYpgGFJGm
 6dQ7lY47+udLjko7x7r0B3k6MLh04dYisbni7GEtbw4B+04zstbs5XCaAwH5k9Sowuzh
 Tf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=qbYhZ0j3U7IXcdLANW6Ri1lM6U26+3AlkXH54c6o33U=;
 b=YsVlBFN5JCRjD/b6vOi4w4mnTgKo63kCLWZhI5sJzoZgSF14tKa2YN1blD7Rp2nhIU
 TpautJ8L5kU5hZR1t17U/BUI57JNC+KwEI99etIJFkDAKSFZSzVlFuATaNZDOOdzQKQ8
 xCRwm3oYKaVLCfehCJbLCkojg9f0lD6q3NrcuVfO22Qt7WghQ0XXO254zHSM8pLpR4ym
 xiTxIjahnb9X5ltP1yj4eKf2c/X5NlUSK61LapLcCpohzfNLERSJGSHiJDMZLKZUOUFx
 otiL+ZQMQqCMMeRGlQvn+U9KZlkf6YcHBHhNagPRWQkL4BrZgaHi6FmjWoWbU6nsLqrZ
 0EEA==
X-Gm-Message-State: AOAM532SwrFuP47eFHPnQ/2gVpfpFGeLFcK4+IWlQM/2lfCfAScTYiFp
 Efw6FG8hjtkiSCM4sbKpm0MV2w==
X-Google-Smtp-Source: ABdhPJynC+inihhIFx014wY+OTem05Sqe/Rnseyfe0Fwn2uGEqzQBo+xrnoV58p3lDVwgvyj1pRh0w==
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr3404815wmb.15.1621324071556; 
 Tue, 18 May 2021 00:47:51 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id x11sm20088700wrl.13.2021.05.18.00.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:47:51 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
 <20210517203724.1006254-3-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 2/3] clk: meson: regmap: switch to determine_rate
 for the dividers
In-reply-to: <20210517203724.1006254-3-martin.blumenstingl@googlemail.com>
Message-ID: <1jr1i41o0p.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 18 May 2021 09:47:50 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_004756_914513_EDE2234A 
X-CRM114-Status: GOOD (  17.69  )
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

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/clk/meson/clk-regmap.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
> index dcd1757cc5df..8ad8977cf1c2 100644
> --- a/drivers/clk/meson/clk-regmap.c
> +++ b/drivers/clk/meson/clk-regmap.c
> @@ -75,8 +75,8 @@ static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
>  				   div->width);
>  }
>  
> -static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -				      unsigned long *prate)
> +static int clk_regmap_div_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
> @@ -87,18 +87,17 @@ static long clk_regmap_div_round_rate(struct clk_hw *hw, unsigned long rate,
>  	if (div->flags & CLK_DIVIDER_READ_ONLY) {
>  		ret = regmap_read(clk->map, div->offset, &val);
>  		if (ret)
> -			/* Gives a hint that something is wrong */
> -			return 0;
> +			return ret;
>  
>  		val >>= div->shift;
>  		val &= clk_div_mask(div->width);
>  
> -		return divider_ro_round_rate(hw, rate, prate, div->table,
> -					     div->width, div->flags, val);
> +		return divider_ro_determine_rate(hw, req, div->table,
> +						 div->width, div->flags, val);
>  	}
>  
> -	return divider_round_rate(hw, rate, prate, div->table, div->width,
> -				  div->flags);
> +	return divider_determine_rate(hw, req, div->table, div->width,
> +				      div->flags);
>  }
>  
>  static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -123,14 +122,14 @@ static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  const struct clk_ops clk_regmap_divider_ops = {
>  	.recalc_rate = clk_regmap_div_recalc_rate,
> -	.round_rate = clk_regmap_div_round_rate,
> +	.determine_rate = clk_regmap_div_determine_rate,
>  	.set_rate = clk_regmap_div_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_regmap_divider_ops);
>  
>  const struct clk_ops clk_regmap_divider_ro_ops = {
>  	.recalc_rate = clk_regmap_div_recalc_rate,
> -	.round_rate = clk_regmap_div_round_rate,
> +	.determine_rate = clk_regmap_div_determine_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_regmap_divider_ro_ops);

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
