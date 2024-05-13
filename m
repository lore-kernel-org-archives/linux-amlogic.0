Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C02C25B10
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 May 2024 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbB8hv07sHmPov0xs1FesdySb8qXDsHsyC9099xUE+w=; b=ig21/iNIOhWamS
	W8h9M1WAVIegXKTFodPmasnE6JxR57Hi+9JpFRnaNqpbB14Q4B5krF0J/rZNANWAbXRz//o6Ni77s
	ekQ8lSe+FfQSdHI8XTFbGk2dFbX4fD91QDqB7K5OdXgJ89sT27x5mlQ0kH54CZGdC4PqqxhYnprRb
	xm4hosDBrL/YnjI6T8SRW93jH+X7FEusuXP02aufRh/jb2ixrFtus0TSshrI5tWzEVOim6Wo9eqIV
	8B83MNM0JS5e4rywjkHz+BbPHxlpb7G5jU1bMbqz/Ftcsf4c3AVW1nIJJoALE4FAop6gdEikMxmKf
	HKD4ipY/WI8B4wlGhDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6V63-0000000CsDe-0Chr;
	Mon, 13 May 2024 12:48:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6V5y-0000000CsCk-2UUk
	for linux-amlogic@lists.infradead.org;
	Mon, 13 May 2024 12:48:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41fd5dc0439so28514865e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 May 2024 05:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715604476; x=1716209276; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=fPNX1+WwpMtldcZbMIphrzlav74hQQ8rXHdwhbhRO+4=;
        b=vHOlu98DdExAzox7oxfUQnjTVFY7vPC9b0e9ve+KDYHkREz8FThI2zzVACK7GwW5Jl
         AnV0AK2FjR4RlgUYImCly5luVE4XjzJPwZ23wfWwdqgAB2jzW7pTkpDV9P2F0Z7Zh5qa
         7Is4DJ846Ydf8yENkFdFZIZSuordY7XSfXMyrGuXE05llgUGs4RwK5vTAKi9jMYpvmCg
         b9qKeV0MPqvNZd3xpBrxCcE4YVZoEIqQsf/JZw5qBK1RE0JhDy+nrFeXyc3bVRl1a2ie
         bAeStOdczmMQ+YQsvwhHtC8Gkpxy7ODmf1u/CDXU/GEk2sJII3G2k+PzmRaPQ2PVSpY4
         ZQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715604476; x=1716209276;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPNX1+WwpMtldcZbMIphrzlav74hQQ8rXHdwhbhRO+4=;
        b=p6Et8EiSQDdbGSuXJ1Gy22ariVUV8Yx3TvwrLsqNj+sn1DskWoUjjocmWCKRXE+fZ3
         A8fsQAq9e2215QUxAC4mTy0N2ICnFMYrQxka6y805DdxiMcXQAMEUTtF1KeeXC2Hp6+H
         mc0JZCXUh2rdB8RtJZC9WArwY4pz1iIMjkgH2Sse0xe+xLugQlRHVyjUB1lXtb3cnpKe
         LJ0FEOJRqID+dNrrUXhOjH0dy+wjULoUlzaoSWi7gUdUZOpbrKWKF82fpbcmtaBaYOMn
         e493Gp7dPo5zVhylR6CZl8bNDIdnxzzH0lBad03fU36nacItGR2502jfcbSXcUPPHkHd
         z9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqZ21Eu1Xnz1o+ebW8NoMoBd2GzjGZBi1zT/QE/FMhCpkBGiviPPYir/HbPW147+WRQDHBMk4XMEwxINOvqPv3Hnaxg9ZRuxh2HGz3G0Yu0kU=
X-Gm-Message-State: AOJu0YwzqDc+TfEBHXohBqYY13ktNYILGjuQ4umhOj9FvfpqyKq+oX8q
	xlV1aEZSJkofx+4tcV0fPqJ59Vki7HN80fFiNhhWUYtbyMtoXSey3Ox2UD+r5i4=
X-Google-Smtp-Source: AGHT+IEk+Met1qf2o3dGT4F3YeppkeI/2Ixdh7UZ2ZMou78Xn6gzYNBNsB2yR/oj9LHHrEyEco7psg==
X-Received: by 2002:adf:f48a:0:b0:34c:6b36:33e5 with SMTP id ffacd0b85a97d-3504aa6a22emr6914680f8f.71.1715604475948;
        Mon, 13 May 2024 05:47:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5b77:3e5a:a808:339a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b896ab0sm11140161f8f.41.2024.05.13.05.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:47:55 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-2-ddrokosov@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: neil.armstrong@linaro.org, jbrunet@baylibre.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/7] clk: meson: introduce 'INIT_ONCE' flag to
 eliminate init for enabled PLL
Date: Mon, 13 May 2024 14:44:06 +0200
In-reply-to: <20240510090933.19464-2-ddrokosov@salutedevices.com>
Message-ID: <1jfrulzxms.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_054758_657264_C48B988E 
X-CRM114-Status: GOOD (  26.03  )
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


On Fri 10 May 2024 at 12:08, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

> When dealing with certain PLLs, it is necessary to avoid modifying them
> if they have already been initialized by lower levels. For instance, in
> the A1 SoC Family, the sys_pll is enabled as the parent for the cpuclk,
> and it cannot be disabled during the initialization sequence. Therefore,
> initialization phase must be skipped.
>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  drivers/clk/meson/clk-pll.c | 37 +++++++++++++++++++++----------------
>  drivers/clk/meson/clk-pll.h |  1 +
>  2 files changed, 22 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 78d17b2415af..47b22a6be2e4 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -289,11 +289,32 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
>  	return -ETIMEDOUT;
>  }
>  
> +static int meson_clk_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> +
> +	if (MESON_PARM_APPLICABLE(&pll->rst) &&
> +	    meson_parm_read(clk->map, &pll->rst))
> +		return 0;
> +
> +	if (!meson_parm_read(clk->map, &pll->en) ||
> +	    !meson_parm_read(clk->map, &pll->l))
> +		return 0;
> +
> +	return 1;
> +}
> +
>  static int meson_clk_pll_init(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>  
> +	/* Do not init already enabled PLL which marked with 'init_once'
> */

That is decribing the code, which we can read. So not really helpful
Saying why you do it, like "Keep the clock running from the bootloader
stage and avoid glitching it ..." gives more context about what you are
trying to do.

> +	if ((pll->flags & CLK_MESON_PLL_INIT_ONCE) &&

I don't like INIT_ONCE. It gives the false impression that

* The PLL is going to be initialized once in Linux if it has the flag
* Is initialised multiple times otherwise 

I agree that currently that carefully reading the code clears that up
but it is misleading

CLK_MESON_PLL_EN_NOINIT ?

> +	    meson_clk_pll_is_enabled(hw))
> +		return 0;
> +
>  	if (pll->init_count) {
>  		if (MESON_PARM_APPLICABLE(&pll->rst))
>  			meson_parm_write(clk->map, &pll->rst, 1);
> @@ -308,22 +329,6 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  	return 0;
>  }
>  
> -static int meson_clk_pll_is_enabled(struct clk_hw *hw)
> -{
> -	struct clk_regmap *clk = to_clk_regmap(hw);
> -	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> -
> -	if (MESON_PARM_APPLICABLE(&pll->rst) &&
> -	    meson_parm_read(clk->map, &pll->rst))
> -		return 0;
> -
> -	if (!meson_parm_read(clk->map, &pll->en) ||
> -	    !meson_parm_read(clk->map, &pll->l))
> -		return 0;
> -
> -	return 1;
> -}
> -
>  static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>  {
>  	int retries = 10;
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index a2228c0fdce5..23195ea4eae1 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -28,6 +28,7 @@ struct pll_mult_range {
>  	}
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
> +#define CLK_MESON_PLL_INIT_ONCE		BIT(1)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
