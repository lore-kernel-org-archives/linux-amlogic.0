Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7E0C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 11:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rw4xu8BSnJyivjlFX9rxznClWXxoJmoIF7OsfDuBg10=; b=Lnq4aznVnBGSCw
	3L6KMglIGWygSHnCh/2DsFAyMsiYfZyGv2QjY74vyejMthcP4zHcomwFNLdo/Z2hvEYtYaO2IcRH2
	PmIjSLGpw4x1tFPeAtBG8ByH+cmciVX/Y0M0LNPMth4ZGj2tCQjkA2Qk/PhYWGvpHbU48fRLqH0y+
	RLdZ14rAvUS+zYPoDv6LSHFrd1ZyeiQUgq5b0W9ejPjBt9MacrOcGWHEWtnzO/z7k8I56VFYpeymZ
	1EhDpYPu+qYjeXaaAzL54AX60Pjq/0StbgBsGRGBxAl0FRHoZbwQrwVPxT3aFF7z9TVsEfGMUQdDa
	LUZcHrcS1fX0oosN6KWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ8oS-00CS01-P5; Mon, 06 Mar 2023 11:15:28 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ8oO-00CRxV-E5
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 11:15:27 +0000
Received: by mail-wr1-x42a.google.com with SMTP id q16so8400487wrw.2
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 03:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678101321;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=PyTn9tJm20fW8pZYDIuyfcLC54XHP85ntZPqOJKtjIk=;
        b=4BUdLMw4Bzkp0FX7tdK0VT+WAV4PbmaJREU+/qlrti7Mm9ppJ4BNW4rhhx5ekAwLmK
         MlaafUzNslF3E0996vg4leNMf/vFLgEi1ZJKUffZzUWka5kYu5Svj7a+SCFFmrjH+T6z
         ID0Pa8KfL6GmK+N+j7j3GRTuZut+IOq2s9J7QgNILbuIWteZ7j26tWHoYTTzJLJkG9dN
         m/tWaqOrZHTOOfJZXU6pzK9AQBe03s/qgrbci/hB1wXnYD9im54wLGtg8yTewYU8f5WR
         G9avbdlB4QskIIns4vg5MU6e2tP+Sb9iSoEls2JXF4+jPDTPugLESC08gzn4Sbf2dIIZ
         K6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678101321;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PyTn9tJm20fW8pZYDIuyfcLC54XHP85ntZPqOJKtjIk=;
        b=CNdNbKBqgHBYyG44BYmKP81EOwAuF9A3bQHQOLvz3r8H8rSGEDmlOy25Gg/EO+vdIj
         KCpsX+Yb3wx24or6Wlgi4uCKs+kbUb6yrId8F9JHVXN5tn9rHlc6kLpug/F8ojAaso4J
         KhWizbPzGGYoL+YWQT2/q7133kK161Xz4Qzv89WD3A28pjwuir9EjixDdXPcPGJhxB9r
         4UZkrq4v6nUncuj+GpzFRh9QXduU5ZB3dqgdLGIRexUqG9vNSz1lnDgR5DU6SsHDRokc
         wOBdp4fa1lMVg/iOScLU18N59uz/PMDhGCn6I9brcfS8uesoiC33MJs00V6muQo7P//b
         C16A==
X-Gm-Message-State: AO0yUKUAxSARIm4PaXoHXNF9yx6nPd4ulwGTAdUtI/PgX6omwsEcZ4u6
	AVL43zkRr1OBP9vh6goAHYHdTQ==
X-Google-Smtp-Source: AK7set/9jsOhwv0D69Mil0vNvlkr+TK2jem1ThlpPjH+LdY5wwwBq/ex5iKyHi1KYshz4sZacWcocw==
X-Received: by 2002:a5d:4b41:0:b0:2c5:58fb:fa92 with SMTP id w1-20020a5d4b41000000b002c558fbfa92mr6235081wrs.7.1678101321400;
        Mon, 06 Mar 2023 03:15:21 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f2-20020adfdb42000000b002c54fb024b2sm9456658wrj.61.2023.03.06.03.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:15:20 -0800 (PST)
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-2-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 1/5] clk: meson: add support for A1 PLL clock ops
Date: Mon, 06 Mar 2023 12:09:35 +0100
In-reply-to: <20230301183759.16163-2-ddrokosov@sberdevices.ru>
Message-ID: <1jy1oab06v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_031524_712688_39A15173 
X-CRM114-Status: GOOD (  27.41  )
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


On Wed 01 Mar 2023 at 21:37, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> Modern meson PLL IPs are a little bit different from early known PLLs.
> The main difference is located in the init/enable/disable sequences; the
> rate logic is the same.

For the record, I find very odd that PLLs used to have an 'rst' bit in
CTRL0:29 (see g12 for example), this bit goes un-documented in the a1
datasheet, and following SoCs like s4 still have a rst bit, still in
CTRL0:29

I would not be surpized if the rst is actually still there in the a1.
It is just my guess ...

> Compared with the previous SoCs, self-adaption current module
> is newly added for A1, and there is no reset parameter except the
> fixed pll. In A1 PLL, the PLL enable sequence is different, using
> the new power-on sequence to enable the PLL.

Please split this patch:
#1 make the rst optional (if you must)
#2 add the self current adapt param.

Apart from this, it looks good

>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  drivers/clk/meson/clk-pll.c | 47 +++++++++++++++++++++++++++++++------
>  drivers/clk/meson/clk-pll.h |  2 ++
>  2 files changed, 42 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index afefeba6e458..56ec2210f1ad 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -295,10 +295,14 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>  
>  	if (pll->init_count) {
> -		meson_parm_write(clk->map, &pll->rst, 1);
> +		if (MESON_PARM_APPLICABLE(&pll->rst))
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +
>  		regmap_multi_reg_write(clk->map, pll->init_regs,
>  				       pll->init_count);
> -		meson_parm_write(clk->map, &pll->rst, 0);
> +
> +		if (MESON_PARM_APPLICABLE(&pll->rst))
> +			meson_parm_write(clk->map, &pll->rst, 0);
>  	}
>  
>  	return 0;
> @@ -309,8 +313,11 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>  
> -	if (meson_parm_read(clk->map, &pll->rst) ||
> -	    !meson_parm_read(clk->map, &pll->en) ||
> +	if (MESON_PARM_APPLICABLE(&pll->rst) &&
> +	    meson_parm_read(clk->map, &pll->rst))
> +		return 0;
> +
> +	if (!meson_parm_read(clk->map, &pll->en) ||
>  	    !meson_parm_read(clk->map, &pll->l))
>  		return 0;
>  
> @@ -341,13 +348,34 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		return 0;
>  
>  	/* Make sure the pll is in reset */
> -	meson_parm_write(clk->map, &pll->rst, 1);
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 1);
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
>  
>  	/* Take the pll out reset */
> -	meson_parm_write(clk->map, &pll->rst, 0);
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 0);
> +
> +	/*
> +	 * Compared with the previous SoCs, self-adaption current module
> +	 * is newly added for A1, keep the new power-on sequence to enable the
> +	 * PLL. The sequence is:
> +	 * 1. enable the pll, delay for 10us
> +	 * 2. enable the pll self-adaption current module, delay for 40us
> +	 * 3. enable the lock detect module
> +	 */
> +	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> +		usleep_range(10, 20);
> +		meson_parm_write(clk->map, &pll->current_en, 1);
> +		usleep_range(40, 50);
> +	};
> +
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> +		meson_parm_write(clk->map, &pll->l_detect, 1);
> +		meson_parm_write(clk->map, &pll->l_detect, 0);
> +	}
>  
>  	if (meson_clk_pll_wait_lock(hw))
>  		return -EIO;
> @@ -361,10 +389,15 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
>  
>  	/* Put the pll is in reset */
> -	meson_parm_write(clk->map, &pll->rst, 1);
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 1);
>  
>  	/* Disable the pll */
>  	meson_parm_write(clk->map, &pll->en, 0);
> +
> +	/* Disable PLL internal self-adaption current module */
> +	if (MESON_PARM_APPLICABLE(&pll->current_en))
> +		meson_parm_write(clk->map, &pll->current_en, 0);
>  }
>  
>  static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 367efd0f6410..a2228c0fdce5 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -36,6 +36,8 @@ struct meson_clk_pll_data {
>  	struct parm frac;
>  	struct parm l;
>  	struct parm rst;
> +	struct parm current_en;
> +	struct parm l_detect;
>  	const struct reg_sequence *init_regs;
>  	unsigned int init_count;
>  	const struct pll_params_table *table;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
