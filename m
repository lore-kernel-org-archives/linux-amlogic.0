Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F146CCA9EAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 11:31:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C42DD2089C
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 11:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mmB/f5vs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PvVi5E3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C42DD2089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yLYsogBWfEwPVYoFd+DcHDmKMvZh5LbRl6MyXsxlXVo=; b=mmB/f5vsXBN9vKVs43i0/LMIsl
	H9a4wGb40VTLsgtUd5LcsKkVcOQW44CqYr+6oFmtoMuGpLQEvgIGSJUu1KRqJzaLkMesTHU4p7ip/
	zrImR6do+KU0rAEKBd4SOMWsWfZUvreQT7D94tFqTvblzZYvz77dtZ0ZyJOaV5TgiRdHRr0wk1GH9
	mJk7sSXK4gNCRpa2QjxFOKR7nu5zdOI0WhO38jMQRcqprVyWnuz/cdbMTWy41xreylrmyFYl7tx7v
	IkIRAo3+BM+IyH5ehNeSXAAHrx+p/6ueYVC577rk7mQQiT9m5ay2nP1XArKZWN54jKabs7hj7m2Va
	Hyw+fwcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMVue-0001dT-3p; Mon, 21 Oct 2019 11:31:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMVuR-0001SD-Qv
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 11:31:37 +0000
Received: by mail-wm1-x342.google.com with SMTP id r141so2817454wme.4
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 04:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=HROsPL2ByDXym6i/NHIHjJkM5kNiw9jG1m8a8LCeIIQ=;
 b=PvVi5E3b/QEtjs/7GPTJkHEgTng108xrwCrEq3OeVnQI/O2sSx9Y5Hr8Q8GGsQ0k2c
 OwivZCXGkcoAyDW3o+/DoYU75IjkTvv2Qpi4X94sUOe+LMSI0rFp0pwmRduwBWfM6qDj
 KK+spBf+D/bMw2wS+NIGSJTt+0iIVP+gqX5uEuC7cI1X+n1WypYrGryTFXxeI6FTVmEb
 qlwTGE5oFYvkYi4YEZXNFQ3kq8Aehp1No+gJ9JrI2dYSj+R+rWT7o2z/M8UQSU7wRn2F
 TsO2LqfKosoQW6t9QnXaMW9J3LCu4QPbJisQNIA/eQ79jMD+g8nih6SrmAFJsQV5H20r
 aY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=HROsPL2ByDXym6i/NHIHjJkM5kNiw9jG1m8a8LCeIIQ=;
 b=iv7+dyMSRtyQ55LvM+l4n6Q7mVbEtlz1nQfADLLFZ4KaolEUyArW1aSikxLnn3IJX7
 CK8BE8eTvpxydB3iPIIyQzp+4QRIkXxe2llxJRDVrh0durLFIDzA2vHIY4cJnGSjMB6B
 BGFJdaLZshrDEdiLWr4i2j/FgFRYQYaE5x6w3V1saYUqi6FcvCHniXDQy2gIaSUqb31i
 chDpquXkSCpiVMSypD+d13xh3CiqnPFg/H/ZfghaKU6vAcpjO6S7j2wLR+xdhaHN2LcS
 /0tlgTUUx6E3EexZkAI74eMYAH9KScNX0k5QqDFic56YQ2XgRNStNo7NyMo25Zsh+erA
 NdSw==
X-Gm-Message-State: APjAAAUyneo6Ejmzk3TGt9rdi9prWYWZsgVSqthJbLIoEPbaViXVKsU+
 V1TrBqWZYrQK8rOv/BMTuHkttg==
X-Google-Smtp-Source: APXvYqz1au/AUOhj6ismuX2RR7PZXMJCNaAO/iedIYnZZsH6iJy5FEzKuwxsm7YEMvrMJQEsfA7hCQ==
X-Received: by 2002:a05:600c:1107:: with SMTP id
 b7mr20230104wma.151.1571657494379; 
 Mon, 21 Oct 2019 04:31:34 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e3sm13450131wme.39.2019.10.21.04.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 04:31:33 -0700 (PDT)
References: <1571382865-41978-1-git-send-email-jian.hu@amlogic.com>
 <1571382865-41978-3-git-send-email-jian.hu@amlogic.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/3] clk: meson: add support for A1 PLL clock ops
In-reply-to: <1571382865-41978-3-git-send-email-jian.hu@amlogic.com>
Date: Mon, 21 Oct 2019 13:31:32 +0200
Message-ID: <1jtv82bai3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_043135_876648_6412D1C4 
X-CRM114-Status: GOOD (  23.68  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Qiufang Dai <qiufang.dai@amlogic.com>,
 Chandle Zou <chandle.zou@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 18 Oct 2019 at 09:14, Jian Hu <jian.hu@amlogic.com> wrote:

> The A1 PLL design is different with previous SoCs. The PLL
> internal analog modules Power-on sequence is different
> with previous, and thus requires a strict register sequence to
> enable the PLL. Unlike the previous series, the maximum frequency
> is 6G in G12A, for A1 the maximum is 1536M.
>
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 66 ++++++++++++++++++++++++++++++++++++++++-----
>  drivers/clk/meson/clk-pll.h |  1 +
>  2 files changed, 61 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index ddb1e56..b440e62 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -349,6 +349,56 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
>  	meson_parm_write(clk->map, &pll->en, 0);
>  }
>  
> +/*
> + * The A1 design is different with previous SoCs.The PLL
> + * internal analog modules Power-on sequence is different with
> + * previous, different PLL has the different sequence, and
> + * thus requires a strict register sequence to enable the PLL.
> + * When set a new target frequency, the sequence should keep
> + * the same with the initial sequence. Unlike the previous series,
> + * the maximum frequency is 6G in G12A, for A1 the maximum
> + * is 1536M.

The comment about the max frequency belongs in your a1 driver, not in
the PLL driver

> + */
> +static void meson_params_update_with_init_seq(struct clk_regmap *clk,
> +				       struct meson_clk_pll_data *pll,
> +				       unsigned int m, unsigned int n,
> +				       unsigned int frac)
> +{
> +	struct parm *pm = &pll->m;
> +	struct parm *pn = &pll->n;
> +	struct parm *pfrac = &pll->frac;
> +	const struct reg_sequence *init_regs = pll->init_regs;
> +	unsigned int i, val;
> +
> +	for (i = 0; i < pll->init_count; i++) {
> +		if (pn->reg_off == init_regs[i].reg) {
> +			/* Clear M N bits and Update M N value */
> +			val = init_regs[i].def;
> +			val &= CLRPMASK(pn->width, pn->shift);
> +			val &= CLRPMASK(pm->width, pm->shift);
> +			val |= n << pn->shift;
> +			val |= m << pm->shift;
> +			regmap_write(clk->map, pn->reg_off, val);
> +		} else if (MESON_PARM_APPLICABLE(&pll->frac) &&
> +			   (pfrac->reg_off == init_regs[i].reg)) {
> +			/* Clear Frac bits and Update Frac value */
> +			val = init_regs[i].def;
> +			val &= CLRPMASK(pfrac->width, pfrac->shift);
> +			val |= frac << pfrac->shift;
> +			regmap_write(clk->map, pfrac->reg_off, val);
> +		} else {
> +			/*
> +			 * According to the PLL hardware constraint,
> +			 * the left registers should be setted again.
> +			 */
> +			val = init_regs[i].def;
> +			regmap_write(clk->map, init_regs[i].reg, val);
> +		}
> +		if (init_regs[i].delay_us)
> +			udelay(init_regs[i].delay_us);
> +	}

So:

1) All the code above this there make the PLL lock, IOW enable the
PLL. It does not belong in the set_rate() callback but in enable() or
prepare() maybe.

2) All the above is works but it is a bit over complicated for what it
does. From the a1_hifi_init_regs I see, all you really need to do is
  * toggle BIT(6) in CTRL2
  * toggle BIT(28) in CTRL0 (enable PARM)
  * toggle BIT(26) in CTRL0

You could use PARM 'rst' for one them and introduce another parm for the
other one. You would not need to repoke the whole sequence this way.

> +}
> +
>  static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  				  unsigned long parent_rate)
>  {
> @@ -366,16 +416,20 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  	if (ret)
>  		return ret;
>  
> +	if (MESON_PARM_APPLICABLE(&pll->frac))
> +		frac = __pll_params_with_frac(rate, parent_rate, m, n, pll);
> +
>  	enabled = meson_parm_read(clk->map, &pll->en);
>  	if (enabled)
>  		meson_clk_pll_disable(hw);
>  
> -	meson_parm_write(clk->map, &pll->n, n);
> -	meson_parm_write(clk->map, &pll->m, m);
> -
> -	if (MESON_PARM_APPLICABLE(&pll->frac)) {
> -		frac = __pll_params_with_frac(rate, parent_rate, m, n, pll);
> -		meson_parm_write(clk->map, &pll->frac, frac);
> +	if (pll->strict_sequence)
> +		meson_params_update_with_init_seq(clk, pll, m, n, frac);
> +	else {
> +		meson_parm_write(clk->map, &pll->n, n);
> +		meson_parm_write(clk->map, &pll->m, m);
> +		if (MESON_PARM_APPLICABLE(&pll->frac))
> +			meson_parm_write(clk->map, &pll->frac, frac);
>  	}
>  
>  	/* If the pll is stopped, bail out now */
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 367efd0..d5789cef 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -41,6 +41,7 @@ struct meson_clk_pll_data {
>  	const struct pll_params_table *table;
>  	const struct pll_mult_range *range;
>  	u8 flags;
> +	bool strict_sequence;

Don't introduce parameter for this We have ops to tune the behavior of
the clock driver. Properly refactor the code if some of it is common.

>  };
>  
>  extern const struct clk_ops meson_clk_pll_ro_ops;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
