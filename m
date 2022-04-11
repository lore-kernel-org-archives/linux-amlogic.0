Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55ACC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Apr 2022 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=58ltMtqbLAqDmlJiKQxOHPMM5+h3/IYGQtwnRcn0ecc=; b=jAAaIQQh/gPAdT
	ad0iYmlmeikcczWuxL1mlGbyAkeP6LLN62psOTgBn53hu3G+HHt9rN2pwnFfhA9aEAoktPdmUuNIa
	8BwBFqb4Nt1GgcaRMoARr9coL5/ySPVJdX4sr+RRgEAEytzHuna8Muvqe8ts8nGDjd6Cmw6+sj0mm
	lNCBEC6Mh/BzIgpWfNhYgLpLvDvAGVY5EAJpNOS4U/9CjiCYeEuH6csx2Qg6GdHnegv8KoSvZ1crW
	HoIR979XraBojrs1EeiyRdk2s70m6q3i3RDUpmLM3nAElMnXcDX8AZ+fEaF1Q81ybG1+4ZZLRTOxQ
	bmj78F90Uu0vFBsd2I7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndoUx-007F7x-9Z; Mon, 11 Apr 2022 07:30:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndoU2-007EdJ-ET
 for linux-amlogic@lists.infradead.org; Mon, 11 Apr 2022 07:29:16 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 o20-20020a05600c511400b0038ebbbb2ad8so1134969wms.0
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Apr 2022 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BjIUIVHFRbARmdqJRe7JFcL0nh+4wGOuv41+r40fWdI=;
 b=MuLfQOFk/KAOARiT/isjKEZQH3RO9g/f2PwC4L1MEy1HX5VN2i+1JchNxj/7//NHDI
 5FZjHGf5bAGnHqpBIlpYlxF0Tsaa6xrD7BqcpF+WLnes4Mwjioohb2J+nbj2r5221gHi
 CnLYsVA3qKZz+Rl5IprSZPYiygSlElE8OWzgBcrOJubleRMgITm2vtSthqHwoXc0PWIJ
 dxbxUQlRplARqIyVNT8nnNtzPTNRdhR2eS6pE3N/xa8exOwcKl4rQ+mZ/rhFx2zA8yrT
 NNSINcsWrnVYOp2du2V2SVaPCKoKzgTnZpgvuJBZGFfmYNWMyEdwx7Ra8dFl1z1X3tWX
 Ts6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BjIUIVHFRbARmdqJRe7JFcL0nh+4wGOuv41+r40fWdI=;
 b=J+bTZuouUujS9kdPw+dOczIJgldTUmj4ZZfDa55mwIkJoEjsWxkHf5P9uM5fSzmRGt
 uczjlbFoZAknt5WsHXCgHe4yDj0SlUPBkxLJzxnShL2VXlrgTeUxn55webN3ICIRbFZG
 cF9ZLMaMWCtAaUjNWEhY24mFJBiKHm+FXQFEx4ZME9NaNbCVeV0E57SKVzhhf+KPgLlB
 C3lme9Pu/S50phAnyl3Utp0yh2YFRfSU3nBdg13R0DcGOA9bbIUqX1pT/cqtvmweY9I3
 vFHXDS2ghaTvVtScb25f9wa2y4EDO6coYGd3GB7Sr4ioouIr/B+i8sTlqBiYuPH0S3Rb
 FXVw==
X-Gm-Message-State: AOAM5321R5CA/SFDIRPwAi0r/WBFBtASHbHgV8DTlTBacf/Hh5ZyQSlc
 bIOgeNQItasth9TmHfpWpRlnoA==
X-Google-Smtp-Source: ABdhPJzmfll2qXYcZqhlizr+zOKwVsn5I9nhVKuGkB89gKjHT4X7JIp8cZT8MNzxRKbCeRL3pocFww==
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id
 s2-20020a7bc382000000b003882e7649edmr27994701wmj.195.1649662147772; 
 Mon, 11 Apr 2022 00:29:07 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5?
 ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
 by smtp.gmail.com with ESMTPSA id
 v5-20020adfe4c5000000b001edc1e5053esm25261851wrm.82.2022.04.11.00.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 00:29:07 -0700 (PDT)
Message-ID: <d6fabb26-8a29-fd5a-c03e-c059b28c9407@baylibre.com>
Date: Mon, 11 Apr 2022 09:29:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] i2c: meson: Use 50% duty cycle for I2C clock
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220409164334.157664-1-tanure@linux.com>
 <20220409164334.157664-3-tanure@linux.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220409164334.157664-3-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_002910_563543_10F5BF34 
X-CRM114-Status: GOOD (  24.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 09/04/2022 18:43, Lucas Tanure wrote:
> The duty cycle of 33% is less than the required
> by the I2C specs for the LOW period of the SCL
> clock.
> 
> Move the duty cyle to 50% for 100Khz or lower
> clocks, and (40% High SCL / 60% Low SCL) duty
> cycle for clocks above 100Khz.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/i2c/busses/i2c-meson.c | 70 +++++++++++++++++++++++++++++-----
>   1 file changed, 60 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 4b4a5b2d77ab..50dab123380a 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -65,10 +65,6 @@ enum {
>   	STATE_WRITE,
>   };
>   
> -struct meson_i2c_data {
> -	unsigned char div_factor;
> -};
> -
>   /**
>    * struct meson_i2c - Meson I2C device private data
>    *
> @@ -109,6 +105,10 @@ struct meson_i2c {
>   	const struct meson_i2c_data *data;
>   };
>   
> +struct meson_i2c_data {
> +	void (*set_clk_div)(struct meson_i2c *i2c, unsigned int freq);
> +};
> +
>   static void meson_i2c_set_mask(struct meson_i2c *i2c, int reg, u32 mask,
>   			       u32 val)
>   {
> @@ -137,14 +137,62 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
>   	i2c->num_tokens++;
>   }
>   
> -static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
> +static void meson_gxbb_axg_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
> +{
> +	unsigned long clk_rate = clk_get_rate(i2c->clk);
> +	unsigned int div_h, div_l;
> +
> +	/* According to I2C-BUS Spec 2.1, in FAST-MODE, the minimum LOW period is 1.3uS, and
> +	 * minimum HIGH is least 0.6us.
> +	 * For 400000 freq, the period is 2.5us. To keep within the specs, give 40% of period to
> +	 * HIGH and 60% to LOW. This means HIGH at 1.0us and LOW 1.5us.
> +	 * The same applies for Fast-mode plus, where LOW is 0.5us and HIGH is 0.26us.
> +	 * Duty = H/(H + L) = 2/5
> +	 */
> +	if (freq <= I2C_MAX_STANDARD_MODE_FREQ) {
> +		div_h = DIV_ROUND_UP(clk_rate, freq);
> +		div_l = DIV_ROUND_UP(div_h, 4);
> +		div_h = DIV_ROUND_UP(div_h, 2) - FILTER_DELAY;
> +	} else {
> +		div_h = DIV_ROUND_UP(clk_rate * 2, freq * 5) - FILTER_DELAY;
> +		div_l = DIV_ROUND_UP(clk_rate * 3, freq * 5 * 2);
> +	}
> +
> +	/* clock divider has 12 bits */
> +	if (div_h > GENMASK(11, 0)) {
> +		dev_err(i2c->dev, "requested bus frequency too low\n");
> +		div_h = GENMASK(11, 0);
> +	}
> +	if (div_l > GENMASK(11, 0)) {
> +		dev_err(i2c->dev, "requested bus frequency too low\n");
> +		div_l = GENMASK(11, 0);
> +	}
> +
> +	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
> +			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div_h & GENMASK(9, 0)));
> +
> +	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
> +			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div_h >> 10));
> +
> +	/* set SCL low delay */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_MASK,
> +			   FIELD_PREP(REG_SLV_SCL_LOW_MASK, div_l));
> +
> +	/* Enable HIGH/LOW mode */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);
> +
> +	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
> +		clk_rate, freq, div_h, div_l);
> +}
> +
> +static void meson6_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
>   {
>   	unsigned long clk_rate = clk_get_rate(i2c->clk);
>   	unsigned int div;
>   
>   	div = DIV_ROUND_UP(clk_rate, freq);
>   	div -= FILTER_DELAY;
> -	div = DIV_ROUND_UP(div, i2c->data->div_factor);
> +	div = DIV_ROUND_UP(div, 4);
>   
>   	/* clock divider has 12 bits */
>   	if (div > GENMASK(11, 0)) {
> @@ -472,7 +520,9 @@ static int meson_i2c_probe(struct platform_device *pdev)
>   	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
>   			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
>   
> -	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
> +	if (!i2c->data->set_clk_div)
> +		return -EINVAL;
> +	i2c->data->set_clk_div(i2c, timings.bus_freq_hz);
>   
>   	ret = i2c_add_adapter(&i2c->adap);
>   	if (ret < 0) {
> @@ -494,15 +544,15 @@ static int meson_i2c_remove(struct platform_device *pdev)
>   }
>   
>   static const struct meson_i2c_data i2c_meson6_data = {
> -	.div_factor = 4,
> +	.set_clk_div = meson6_i2c_set_clk_div,
>   };
>   
>   static const struct meson_i2c_data i2c_gxbb_data = {
> -	.div_factor = 4,
> +	.set_clk_div = meson_gxbb_axg_i2c_set_clk_div,
>   };
>   
>   static const struct meson_i2c_data i2c_axg_data = {
> -	.div_factor = 3,
> +	.set_clk_div = meson_gxbb_axg_i2c_set_clk_div,
>   };
>   
>   static const struct of_device_id meson_i2c_match[] = {

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
