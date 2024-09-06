Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC964CD5BDD
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W3szzTy2ZQlzodoT4+M6ot1EaN2CmfMviKz/UwGocuI=; b=wcU+yOaEoYnTq1
	OORDBAbYnZCNuI9uA6RcNNfUkmMK3PrapsyuGgzlBiOUjlQhx8uGSi1e8qxtkYFWYsRcX5HX4yNKz
	i0AFMmSi0MD5f7UpnheS7Ax+1GqxGsdcmUQoiQ69KIRlxsaOXkISErEvGl3wbLduMmZDvGEITSAu8
	MviUCIMcWRaI8Gj99AEcQenSzkTqrl0NxOaZBkptf/f9+ouxP4A8oKgw10j5cTsqfA+KA3v7c16Ys
	oaNaPM1qGPCJuA+8+y1Q0iJjKlvGRajo/+WMvSJelgrH65aLC7ZE8ZUhqPQK5YWZRRh16LyBFswGe
	Z9MnfgL01rIDSSs8bvtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smXFK-0000000C0HO-3dZP;
	Fri, 06 Sep 2024 11:35:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smX3N-0000000BxR8-0UHJ
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 11:23:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-42bbe908380so15198305e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 04:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725621779; x=1726226579; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=92+67uwDsO1hQyzhgte48I/CNhtegYeJx45/P0oF94Y=;
        b=tPZYzh3do9VVLHatgkV7r65bLrvOo6ek4Z/BSPVIDsPlPBv5ZrNnWC6Sxe7Z19UwXI
         Mwn1BgtDStz2dC94JI/aK8o0ZfB2XZ/ss1UxlDP6G+QCml2MigEttTiM5YiuDI4vH+Ka
         IMue7124IF33q2o5AuH+tOo0rwfxUn9oKXfvSmTQu6tqQ2hutKUHaE1/tfQQeQ9QsAwn
         A42nKhkeoFA5My35xlMNHyHJJP+Frtd7OQ9JyWCM3kmbxlgvI+pLCdg2w0Vd1ijWp6a8
         Zsb8aJyxO2Alq1A36tBOnthTzncE7Rn4BdqkZZUlhXUkotebOpQeJdQxKxM3Ee6bMjOH
         YmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725621779; x=1726226579;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92+67uwDsO1hQyzhgte48I/CNhtegYeJx45/P0oF94Y=;
        b=lelE5qTywXUNlJMyrl5gYevuOCGZDCYAVzBeWMgelNn47jEIvZJNOxy9jc7yMAe3DK
         womcCziL6U1wZ7EGLwzfb51XGFf3Gx9HqU7Dr4Ta7deROB9ZyNLMTeNYbmnr5Q3WCQCf
         J9P6rWSrTm2vpTaw/zYoQOV3sD4xHP6YWRZaV8op5jnetUL9E0CCiZHuzXx7jFS7QUhT
         47wNrzIyCkr6lofZW9iG3rp6CEZQIEskCD2Wa4LjCD8+ixfxsaC4G0O7v1uBHxm5EVAi
         DSAEZVi2hRkB0vyU14FbI1fi/2XLgCsxqtKQAnCZBITQbbvu4j5Fhs930TIBUE3WKiW2
         bmAw==
X-Forwarded-Encrypted: i=1; AJvYcCVAUBWJ3NW23z2BoDk3RUEJwsMJ2+kPFRHPMaKTKIfslEcm7cg++DRthm2NqlLGRJVtUh+nOTsq2dBlQCZM@lists.infradead.org
X-Gm-Message-State: AOJu0YzwOwfXINlqIDr5pyRV53kpXyocmIiMVJ484eNZnmCWzazKzMXL
	dGCqLLrk1yajxr2o2Dx1cquEWOu2Mw2Wzc9cBOipArX95t+UzEWcU9XqF8xYqTs=
X-Google-Smtp-Source: AGHT+IFj6cn2VhPIBLzycX7f8yDdpZxCP0fnyLUp+RAmxAnbmLYkKHqCh+9DjZxSWH8mgvyVVR5CDA==
X-Received: by 2002:adf:cd0d:0:b0:371:93eb:78a4 with SMTP id ffacd0b85a97d-378895c5b22mr1505513f8f.9.1725621778667;
        Fri, 06 Sep 2024 04:22:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b34725desm18835563f8f.81.2024.09.06.04.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 04:22:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: meson: Support PLL with fixed fractional
 denominators
In-Reply-To: <20240906-fix_clk-v2-1-7a3941eb2cdf@amlogic.com> (Chuan Liu via's
	message of "Fri, 06 Sep 2024 18:34:40 +0800")
References: <20240906-fix_clk-v2-0-7a3941eb2cdf@amlogic.com>
	<20240906-fix_clk-v2-1-7a3941eb2cdf@amlogic.com>
Date: Fri, 06 Sep 2024 13:22:57 +0200
Message-ID: <1jjzfpqb5a.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_042301_262988_3E9A1D89 
X-CRM114-Status: GOOD (  19.29  )
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

On Fri 06 Sep 2024 at 18:34, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Some PLLS with fractional multipliers have fractional denominators with
> fixed values, instead of the previous "(1 << pll-> frc.width)".
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 8 +++++---
>  drivers/clk/meson/clk-pll.h | 1 +
>  2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index bc570a2ff3a3..a141ab450009 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -57,12 +57,13 @@ static unsigned long __pll_params_to_rate(unsigned long parent_rate,
>  					  struct meson_clk_pll_data *pll)
>  {
>  	u64 rate = (u64)parent_rate * m;
> +	unsigned int frac_max = unlikely(pll->frac_max) ? pll->frac_max
> :
                                 ^ Please don't play with this unless
                                 you've got justification a for it.

By justification, I mean actual numbers showing the difference it makes
and not just for the platforms listed in this series, but all the
platforms supported by this driver.

> +							  (1 << pll->frac.width);
>  
>  	if (frac && MESON_PARM_APPLICABLE(&pll->frac)) {
>  		u64 frac_rate = (u64)parent_rate * frac;
>  
> -		rate += DIV_ROUND_UP_ULL(frac_rate,
> -					 (1 << pll->frac.width));
> +		rate += DIV_ROUND_UP_ULL(frac_rate, frac_max);
>  	}
>  
>  	return DIV_ROUND_UP_ULL(rate, n);
> @@ -100,7 +101,8 @@ static unsigned int __pll_params_with_frac(unsigned long rate,
>  					   unsigned int n,
>  					   struct meson_clk_pll_data *pll)
>  {
> -	unsigned int frac_max = (1 << pll->frac.width);
> +	unsigned int frac_max = unlikely(pll->frac_max) ? pll->frac_max :
> +							  (1 << pll->frac.width);
>  	u64 val = (u64)rate * n;
>  
>  	/* Bail out if we are already over the requested rate */
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 7b6b87274073..949157fb7bf5 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -43,6 +43,7 @@ struct meson_clk_pll_data {
>  	unsigned int init_count;
>  	const struct pll_params_table *table;
>  	const struct pll_mult_range *range;
> +	unsigned int frac_max;
>  	u8 flags;
>  };

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
