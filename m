Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63614C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37DC720859
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ehg25vz+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FK4ulMW7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37DC720859
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clMxjMyUTl+LYLodIX0gn3WrZnI3JuZoqnopNJAuWUk=; b=Ehg25vz+Kpwdmt
	4TaVrnALkkTljkQAxyg3dWDTR1ACliaYWE3uxHziVl37UQU9xo91P3TfkEmW4xCJ7aGYwoGjYiVeD
	T4M+++5rPHl8EYJzyMYKoXQ1Totj8bllfA2Ozi565B7Qcczt2+Ohn0acjDEM5yI92iiHYyXwbXS9W
	QZhwPGw0vBUXW19GC3gZGIanPYtS35J77+kU+c5oqaw6vZ9GxGtAO+KbbiFMnIE18+uVv5a2COINI
	XgKl5jQycF4PLEUbwVr0h9DZcizlsMmeSF8gNMXl6Xo9NdHm0x1z12GQxOuh7hmYuvvcWvwL9HwtV
	n6IJSg8Xm56bXEhpRipA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEjn-00078e-0i; Mon, 27 May 2019 12:28:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEjc-0006vD-8z
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 12:28:20 +0000
Received: by mail-wm1-x341.google.com with SMTP id e19so7112152wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 05:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+L5MlIGf1ZwbeZzPIdfj3Gv0vJVeWswnQuXYAx1Br0c=;
 b=FK4ulMW7SqSE2D9cfFBwiCY3PDstRcxOhQ8T9pCq/jZuolDIT6s4xms8ondnaYCZUR
 5UhxumLHCexaRwZ0x2jMJ3kkp5LO2R05rhGiFoqUQaXLHX7KUO/mO6GIG3eaQyTvH9pJ
 kQLPqlJJJGhdQBseRGjRRrLTYVerrgWtY04h+BrPQDDta4MZnG+LDCpEXB3jHuHcsd/E
 zPxd4mxM7talG8OYxn+PoCOzP4eaA9h3SmcziIet0ZofC3dT5yoq6m37Z0mutXmSC2HT
 bKqx5QNhrye+3R7vj0qM8QWDu/hBFb3wgaevxtaSFMWnGE1rAeyRDQOnFqXUnOh1v3Up
 lTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=+L5MlIGf1ZwbeZzPIdfj3Gv0vJVeWswnQuXYAx1Br0c=;
 b=NwCchFl1JgrwF4FN2F1saQFEJ1gCDp1nt/ktEg7OnXF91sDDZ0DNLjgmwyEjSf/4op
 c3KlbXnZ8f0TosPwe+0wWwvpPstKMTYEdL/5qG+btcqbU2+vMk3Y8Bx05rh7jM5xPjBO
 cE0NM8vaEnRNymkz1q47YQFGeHZvbHp4l/7wl0VkrlTS4f7zbnijUatHjeNWTMUOg6H1
 eInUjQoCBoEusShqDDILBlglH0ns4TfxMMlwcodMKINL9lXt8kh9iQcX1faNTvK0d43u
 OXpoRbpcrvfQ9LSGxbvJUPVB0cf607Xcr0++HfrLW2f0jksvDdChdkCm95hKWdN4hTY9
 pemA==
X-Gm-Message-State: APjAAAVBO7ZQ5tmEFp23RB+tOF5YkJ4TRwDOhRob2xd7OwGpNfZu1u/D
 0sZUZZ8xCpCx5ZMDMNFuSAee9w==
X-Google-Smtp-Source: APXvYqz1TR2WKIac1Pyptw7ixPyH90e2gWUBaS/ycI863hZFRrdFE+kAR3mZWcGlycqyNcNi1RJqhA==
X-Received: by 2002:a1c:ed16:: with SMTP id l22mr10071527wmh.96.1558960090710; 
 Mon, 27 May 2019 05:28:10 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b10sm21638133wrh.59.2019.05.27.05.28.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 05:28:10 -0700 (PDT)
Subject: Re: [PATCH 08/14] pwm: meson: add the per-channel register offsets
 and bits in a struct
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
 <20190525181133.4875-9-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <7d169605-e117-70d4-5c66-47d2f80f4d4e@baylibre.com>
Date: Mon, 27 May 2019 14:28:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525181133.4875-9-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_052812_648075_D742C69F 
X-CRM114-Status: GOOD (  21.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 25/05/2019 20:11, Martin Blumenstingl wrote:
> Introduce struct meson_pwm_channel_data which contains the per-channel
> offsets for the PWM register and REG_MISC_AB bits. Replace the existing
> switch (pwm->hwpwm) statements with an access to the new struct.
> 
> This simplifies the code and will make it easier to implement
> pwm_ops.get_state() because the switch-case which all per-channel
> registers and offsets (as previously implemented in meson_pwm_enable())
> doesn't have to be duplicated.
> 
> No functional changes intended.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/pwm/pwm-meson.c | 92 ++++++++++++++++-------------------------
>  1 file changed, 35 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index d1718f54ecec..ac7e188155fd 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -39,9 +39,27 @@
>  
>  #define MESON_NUM_PWMS		2
>  
> -static const unsigned int mux_reg_shifts[] = {
> -	MISC_A_CLK_SEL_SHIFT,
> -	MISC_B_CLK_SEL_SHIFT
> +static struct meson_pwm_channel_data {
> +	u8		reg_offset;
> +	u8		clk_sel_shift;
> +	u8		clk_div_shift;
> +	u32		clk_en_mask;
> +	u32		pwm_en_mask;
> +} meson_pwm_per_channel_data[MESON_NUM_PWMS] = {
> +	{
> +		.reg_offset	= REG_PWM_A,
> +		.clk_sel_shift	= MISC_A_CLK_SEL_SHIFT,
> +		.clk_div_shift	= MISC_A_CLK_DIV_SHIFT,
> +		.clk_en_mask	= MISC_A_CLK_EN,
> +		.pwm_en_mask	= MISC_A_EN,
> +	},
> +	{
> +		.reg_offset	= REG_PWM_B,
> +		.clk_sel_shift	= MISC_B_CLK_SEL_SHIFT,
> +		.clk_div_shift	= MISC_B_CLK_DIV_SHIFT,
> +		.clk_en_mask	= MISC_B_CLK_EN,
> +		.pwm_en_mask	= MISC_B_EN,
> +	}
>  };
>  
>  struct meson_pwm_channel {
> @@ -194,43 +212,26 @@ static int meson_pwm_calc(struct meson_pwm *meson, struct pwm_device *pwm,
>  static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
>  {
>  	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
> -	u32 value, clk_shift, clk_enable, enable;
> -	unsigned int offset;
> +	struct meson_pwm_channel_data *channel_data;
>  	unsigned long flags;
> +	u32 value;
>  
> -	switch (pwm->hwpwm) {
> -	case 0:
> -		clk_shift = MISC_A_CLK_DIV_SHIFT;
> -		clk_enable = MISC_A_CLK_EN;
> -		enable = MISC_A_EN;
> -		offset = REG_PWM_A;
> -		break;
> -
> -	case 1:
> -		clk_shift = MISC_B_CLK_DIV_SHIFT;
> -		clk_enable = MISC_B_CLK_EN;
> -		enable = MISC_B_EN;
> -		offset = REG_PWM_B;
> -		break;
> -
> -	default:
> -		return;
> -	}
> +	channel_data = &meson_pwm_per_channel_data[pwm->hwpwm];
>  
>  	spin_lock_irqsave(&meson->lock, flags);
>  
>  	value = readl(meson->base + REG_MISC_AB);
> -	value &= ~(MISC_CLK_DIV_MASK << clk_shift);
> -	value |= channel->pre_div << clk_shift;
> -	value |= clk_enable;
> +	value &= ~(MISC_CLK_DIV_MASK << channel_data->clk_div_shift);
> +	value |= channel->pre_div << channel_data->clk_div_shift;
> +	value |= channel_data->clk_en_mask;
>  	writel(value, meson->base + REG_MISC_AB);
>  
>  	value = FIELD_PREP(PWM_HIGH_MASK, channel->hi) |
>  		FIELD_PREP(PWM_LOW_MASK, channel->lo);
> -	writel(value, meson->base + offset);
> +	writel(value, meson->base + channel_data->reg_offset);
>  
>  	value = readl(meson->base + REG_MISC_AB);
> -	value |= enable;
> +	value |= channel_data->pwm_en_mask;
>  	writel(value, meson->base + REG_MISC_AB);
>  
>  	spin_unlock_irqrestore(&meson->lock, flags);
> @@ -238,26 +239,13 @@ static void meson_pwm_enable(struct meson_pwm *meson, struct pwm_device *pwm)
>  
>  static void meson_pwm_disable(struct meson_pwm *meson, struct pwm_device *pwm)
>  {
> -	u32 value, enable;
>  	unsigned long flags;
> -
> -	switch (pwm->hwpwm) {
> -	case 0:
> -		enable = MISC_A_EN;
> -		break;
> -
> -	case 1:
> -		enable = MISC_B_EN;
> -		break;
> -
> -	default:
> -		return;
> -	}
> +	u32 value;
>  
>  	spin_lock_irqsave(&meson->lock, flags);
>  
>  	value = readl(meson->base + REG_MISC_AB);
> -	value &= ~enable;
> +	value &= ~meson_pwm_per_channel_data[pwm->hwpwm].pwm_en_mask;
>  	writel(value, meson->base + REG_MISC_AB);
>  
>  	spin_unlock_irqrestore(&meson->lock, flags);
> @@ -309,18 +297,7 @@ static void meson_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  	if (!state)
>  		return;
>  
> -	switch (pwm->hwpwm) {
> -	case 0:
> -		mask = MISC_A_EN;
> -		break;
> -
> -	case 1:
> -		mask = MISC_B_EN;
> -		break;
> -
> -	default:
> -		return;
> -	}
> +	mask = meson_pwm_per_channel_data[pwm->hwpwm].pwm_en_mask;
>  
>  	value = readl(meson->base + REG_MISC_AB);
>  	state->enabled = (value & mask) != 0;
> @@ -458,7 +435,8 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
>  		init.num_parents = meson->data->num_parents;
>  
>  		channel->mux.reg = meson->base + REG_MISC_AB;
> -		channel->mux.shift = mux_reg_shifts[i];
> +		channel->mux.shift =
> +				meson_pwm_per_channel_data[i].clk_sel_shift;
>  		channel->mux.mask = MISC_CLK_SEL_MASK;
>  		channel->mux.flags = 0;
>  		channel->mux.lock = &meson->lock;
> @@ -509,7 +487,7 @@ static int meson_pwm_probe(struct platform_device *pdev)
>  	meson->chip.dev = &pdev->dev;
>  	meson->chip.ops = &meson_pwm_ops;
>  	meson->chip.base = -1;
> -	meson->chip.npwm = MESON_NUM_PWM;
> +	meson->chip.npwm = MESON_NUM_PWMS;
>  	meson->chip.of_xlate = of_pwm_xlate_with_flags;
>  	meson->chip.of_pwm_n_cells = 3;
>  
> 

This looks a little over-engineered, but it's correct :
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
