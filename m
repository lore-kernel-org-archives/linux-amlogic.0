Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3908CD4F25
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 May 2026 15:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bqc6/ihFnyu/92Qvdkgxl6opdIaMagMK2zNWzeL8jGo=; b=IDlRkZ1TE9fMvv
	uqFSaxEUwyZiiRqhEUAkxyi0coshzmoPqW7+5qmY+FT3Fq0QDbHgwqCRFDt+XsMV+b1W35/BtJvEn
	XYO7h7vXvDRY3fgG80HjpSptj9GNyBO6jV38P2Y94JAak4JnuLEvMWlZqnZDLPXRGzgWPKhgPN2Ww
	1mLtAXSKbKYbDXatkEBIA+pVzGB+K7YXfonNtt/sH3SlxNNdBY7RZ8ujrU6EjB7FDVVaHifx7lyaC
	eeSG1RcQZvKGUKSSZWhtZwK26coXsXomGqOTX2EFtGim8ldrayL8dFVzm4FAyKVHbzDksELd91lPv
	rC39K7KZzjwBaFCexBaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXkW-00000005rrw-2bcC;
	Thu, 14 May 2026 15:13:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXkU-00000005rqp-0HFK
	for linux-amlogic@lists.infradead.org;
	Thu, 14 May 2026 15:13:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48fde648a71so5359565e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 14 May 2026 08:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778771596; x=1779376396; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GMG+MYf2mIEZOo4k7BKQu+vHso1LCBH/45mKDm5C2Qg=;
        b=f67SFhDppc/yHyBbYHgVjAK4WqgtpFnWajtMShyZnonKedFTuQSrRDroSt5IcTAOf8
         un3cLyr87S6Kgtgxyvj/6XbQ8uAacIJ1wb9pr2wt0PcOQFd8D/R4HtLdznZhiyZH6Kmy
         W7geZjAI+0Jcw81QBAy6HEtvAp62CCrL4hRTGoHhWNg11KAkgU94kpV3sfwG8FEFt6kF
         tccLtr6bcnL5HohJFgsnoEScEjcojOqVvwH/Hian7C92jCJ13RhkCjLTwqUSi46F0MzX
         75+DAcaW3mnL9ZYEf5R55qv9YRGBGAute3UeYlU3li3mqzK+EXSY9b9kj37nKD2rJyja
         gp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771596; x=1779376396;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GMG+MYf2mIEZOo4k7BKQu+vHso1LCBH/45mKDm5C2Qg=;
        b=W47C7OSsvF09UMDNajUeuXwu1N7S1N7Hpbacq3TaAVDEwqdsyIWwE88dAeBi+t6Pfu
         3neEuAIYDcKc/nE4vR0rEXmZlvnmKFZDtJVt7jO7sBA1gIpq7yTPg+7kc5GaBaR4koGH
         NCwge7mf5Ys7Rkn6gkmgqOWYQo4KhdM7c+R3yiwQmuKF3NiNSwIBpyBligf4i9jI9hx4
         /oy9LIqHsDy8iH+pBZW9MGlTg0hVZsotYfe7uxlZT8X+G9hJNCzUByLZCMIb29TocBWX
         Y+6pgx93ESWob0FkJy6NRZm9XRJsJAnikpV5AconjB5P9XRDUaDi+tmr1gwN+1cgx3th
         LtlQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tmffmnU4Y4Qu3VIyQXuubxWTpJJxdLWa1vIU/XCY/YiyQ6F4udqZbBPZ2o6i+7VxE47KmPqkaiEtpjt1S@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7UrcD/gj7p72ZZlkpftmpWobDQ3p56HHTGfLspc7XjAnXGtFe
	kNQ7iE+x/JTDEGnM6HgUc9RKGq3v/1oRUUharVDbwEz/foak3LoGyaKK9Q1nV+1kVYs=
X-Gm-Gg: Acq92OHrlfQE9fr4MJgzagochRWUoR8wVCwRxgCPOcIi/8l/f+1rP/L7Gf+0DaRk+KE
	KGGZ7Mldl49JDR2eFvqFzaV/0o2qBPgWi0B2bVZcJhEx4d3Ofww/brK2WonlURERQR4eCIPfIzw
	Dhg5WT58C6ZSkulH6ILxKHxMfgwsOGaKmR3HQcVFVTJxw6Fy6WUkLxslUs8MhlUZ1xIOVk1BdCJ
	tN5CGoIheVM2/62T5ObdeZp/DDCUw9HUD4EXmK0lC4wxbilAFh5cGdsSVF2oJOGOr/lOgtpThvE
	uEIT0yEuwU4Ku7/heGonCt5lfht5YffATqm7RfqfAN9wlJsgxorAQoqKWOkMDkFf2HnRqZ8/4YM
	r3wJGIMN4rUQaL1j9nGPwHP6BXitCXBvmxVrO9bCNZPnyZ+2J+XkjqrGSzzX2YYHZ/Blns8qyki
	0ZOsTBURciQ8PEU9/0TX4=
X-Received: by 2002:a05:600c:8906:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-48fe486cca4mr514625e9.0.1778771595855;
        Thu, 14 May 2026 08:13:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f63:bf1e:b5:28d8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe46f4647sm3184745e9.14.2026.05.14.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 08:13:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  jian.hu@amlogic.com,
  linux-kernel@vger.kernel.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/10] clk: amlogic: PLL l_detect signal supports
 active-high configuration
In-Reply-To: <20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com> (Jian Hu via's
	message of "Mon, 11 May 2026 20:47:27 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-5-41cb4071b7c9@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 14 May 2026 17:13:13 +0200
Message-ID: <1jse7u6n3q.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_081318_112840_218DD9D6 
X-CRM114-Status: GOOD (  16.39  )
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

On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org> wrote:

> From: Jian Hu <jian.hu@amlogic.com>
>
> l_detect controls the enable/disable of the PLL lock-detect module.
>
> For A9, the l_detect signal is active-high:
> 0 -> Disable lock-detect module;
> 1 -> Enable lock-detect module.
>
> Here, a flag CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH is added to handle cases
> like A9, where the signal is active-high.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 9 +++++++--
>  drivers/clk/meson/clk-pll.h | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 1ea6579a760f..5a0bd75f85a9 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -388,8 +388,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	}
>  
>  	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> -		meson_parm_write(clk->map, &pll->l_detect, 1);
> -		meson_parm_write(clk->map, &pll->l_detect, 0);
> +		if (pll->flags & CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH) {
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +		} else {
> +			meson_parm_write(clk->map, &pll->l_detect, 1);
> +			meson_parm_write(clk->map, &pll->l_detect, 0);
> +		}

I'm not a fan of this code duplication.
Use the introduced CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH to compute the
first value, then flip the bit.

>  	}
>  
>  	if (meson_clk_pll_wait_lock(hw))
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 949157fb7bf5..97b7c70376a3 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -29,6 +29,8 @@ struct pll_mult_range {
>  
>  #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
> +/* l_detect signal is active-high */
> +#define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
