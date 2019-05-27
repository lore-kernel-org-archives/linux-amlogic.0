Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C6BC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:34:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DEC22075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VmqcP1iU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NMlGmDIu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DEC22075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOn0h6HefTYHf4JrCwDJNZens0m0GIW/DnCpEuyuDBw=; b=VmqcP1iUAeWg8b
	RGj8J4HDU5Ipu4jJfpcodqp81mpUvWLMcrp1oC74tbyJgC25I77qIehL6RQE02+JUPrAuEazFyKJX
	bt+DivZFx2kgP3ELBlVG+lbCpES9vGx/WhYSKHAuEdkgltJtfsUeohLVEGR4LS7hoibdVqUVGKvHK
	Q7M0m9uryzQhT+Hn2IE/yaL2oDjBp2MbPFQ7BwDlx65WX6OLNEi84XRO4yqulxySRk8XoRHXNy2jm
	qubl9f5gFABLM7ZkHDAbqP3hKep7KDJy7K9WBkfXkWbUtplLuvMzLwTq29NZUA6+w3owXdKsVn9fv
	xQk9XUGej+keqZXUOakA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEpA-0004Gn-Ph; Mon, 27 May 2019 12:33:56 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEp8-0004Fc-5J
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 12:33:55 +0000
Received: by mail-wr1-x443.google.com with SMTP id b18so16749500wrq.12
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 05:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Lu584p0HvbXxFHDjm3E5Bv6klwwi/JMTJfgsCrnryS4=;
 b=NMlGmDIui5A0tgyFH/7k/K9bwSvhSaMoTcKlOFVWMZYtSnUfiE6aY6euPvWFHlo7E5
 bNW+mNjDAMKNNHQe6TMH+qiFqDFtYXM36A0aSur/kEca6WDIYg8rwQCwFBXEMqawm4ww
 T4mAlF+plB9qlxlc9HTASzDoc3RTgWoKpbJPmUjYRTsnkKJE4ws79xzs55juQglL+Wb3
 5OqfJJDzeT4ly4v5q7nI3VokTBGkHm3W8i2vgm1vvuB84uYcykyeCs9qZ3E4F1841ZQb
 GZFVJWEhgjQh/KH7Uts5wN0oneGXh8TINJH3zRA0Soq9DqmOdruWD0IRuZqfg2ZaazuG
 sh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Lu584p0HvbXxFHDjm3E5Bv6klwwi/JMTJfgsCrnryS4=;
 b=bNBXyh/mnrM4XJ0oNd0d/wCoOmU5kXOeSXbr5k4Uc/7Uh/aD7LMiBbFCc6Kf6I7604
 17Y7EdWXkYDe245MrdS5g4Bb7+gCUKgmNcWefQ2qenbKjmZbfveLfvJX/OsAhgBhmnXW
 EnI004cxICHiZYZtBO9C9xPWDqobDH/0Ja4fUvo5hcEMtSV1YpFdI9KygFoWlMNsQyq3
 fsBO8fS9JPKtTuz+EDjNpayBSdojGh/z4SM4yUjkSxg7KgKJtRW5Tg6paZZjyk/TAWjr
 K/JR72XTwCOL29ZiiiBqKOS9wuhwi6Be3PMExjB8FGgCb4AZCMWWK/zg5tYdb++w5d3Y
 kW/g==
X-Gm-Message-State: APjAAAVav7Y0mPTa+lZ3on/Y9p+GSGYYIebhqpxiUY8TenB+hiGznUiW
 FPC1Ta6L0vPYNAi13A5KKtTPww==
X-Google-Smtp-Source: APXvYqxHJkwqnZ7CnTcUcxNEIT+3UK8ggiXkqGWeGENh3miaj9PGFisyYZjc3RJG4UEKLA7IcefNaQ==
X-Received: by 2002:a05:6000:1285:: with SMTP id
 f5mr4275036wrx.112.1558960432650; 
 Mon, 27 May 2019 05:33:52 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c24sm894144wmb.21.2019.05.27.05.33.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 05:33:52 -0700 (PDT)
Subject: Re: [PATCH 13/14] pwm: meson: add support PWM_POLARITY_INVERSED when
 disabling
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-pwm@vger.kernel.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de
References: <20190525181133.4875-1-martin.blumenstingl@googlemail.com>
 <20190525181133.4875-14-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <4de7d436-32b7-e4ed-39b2-e85f75a17c16@baylibre.com>
Date: Mon, 27 May 2019 14:33:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525181133.4875-14-martin.blumenstingl@googlemail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_053354_274105_9E3A9DC3 
X-CRM114-Status: GOOD (  26.45  )
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
> meson_pwm_apply() has to consider the PWM polarity when disabling the
> output.
> With enabled=false and polarity=PWM_POLARITY_NORMAL the output needs to
> be LOW. The driver already supports this.
> With enabled=false and polarity=PWM_POLARITY_INVERSED the output needs
> to be HIGH. Implement this in the driver by internally enabling the
> output with the same settings that we already use for "period == duty".
> 
> This fixes a PWM API violation which expects that the driver honors the
> polarity also for enabled=false. Due to the IP block not supporting this
> natively we only get "an as close as possible" to 100% HIGH signal (in
> my test setup with input clock of 24MHz and measuring the output with a
> logic analyzer at 24MHz sampling rate I got a duty cycle of 99.998475%
> on a Khadas VIM).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/pwm/pwm-meson.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index 900d362ec3c9..bb48ba85f756 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -245,6 +245,7 @@ static void meson_pwm_disable(struct meson_pwm *meson, struct pwm_device *pwm)
>  static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  			   struct pwm_state *state)
>  {
> +	struct meson_pwm_channel *channel = pwm_get_chip_data(pwm);
>  	struct meson_pwm *meson = to_meson_pwm(chip);
>  	int err = 0;
>  
> @@ -252,7 +253,27 @@ static int meson_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  		return -EINVAL;
>  
>  	if (!state->enabled) {
> -		meson_pwm_disable(meson, pwm);
> +		if (state->polarity == PWM_POLARITY_INVERSED) {
> +			/*
> +			 * This IP block revision doesn't have an "always high"
> +			 * setting which we can use for "inverted disabled".
> +			 * Instead we achieve this using the same settings
> +			 * that we use a pre_div of 0 (to get the shortest
> +			 * possible duration for one "count") and
> +			 * "period == duty_cycle". This results in a signal
> +			 * which is LOW for one "count", while being HIGH for
> +			 * the rest of the (so the signal is HIGH for slightly
> +			 * less than 100% of the period, but this is the best
> +			 * we can achieve).
> +			 */
> +			channel->pre_div = 0;
> +			channel->hi = ~0;
> +			channel->lo = 0;
> +
> +			meson_pwm_enable(meson, pwm);
> +		} else {
> +			meson_pwm_disable(meson, pwm);
> +		}
>  	} else {
>  		err = meson_pwm_calc(meson, pwm, state);
>  		if (err < 0)
> 

While not perfect, it almost fills the gap.
Another way would be to use a specific pinctrl state setting the pin
in GPIO output in high level, but this implementation could stay
if the pinctrl state isn't available.

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
