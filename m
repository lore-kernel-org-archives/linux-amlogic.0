Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D280C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 Apr 2022 11:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZahvzjHlp2CvLr3zOqEQHAj/b1o7EI1bDL9Bf+H36HE=; b=K84fmKG046bYG8
	/SSDY31ugvTMyFFHMPwN++ryXZeqVo+ksezrArWzwXXN3X22Ef7d8VkKcK/RCru1oC52HSfJa0lbk
	ivyWWzNZ9/PJkA5n2EuUKR1o+J8iqED2gz1twOnkspycThZWjlqFtQHHiHHW/3p2AbMDuGO7UyDis
	6I3FcS+3yyu+zLiTckcQ3AObetsuojEn54t5P2T5E01iyjPuFU9nAkNjMKzrGvqtuyunOX88EhCnm
	qdMVDkRi2Sicg+R//BcnCMG1YovAqzQ6f4NMKnbrA2RjsSxMRWidaO9A1MPWVfMUFCY9KEkpDQu3f
	cnuQqhLmO2/+wAyE/0Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc3sz-005mvc-A1; Wed, 06 Apr 2022 11:31:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc3sl-005mqB-No
 for linux-amlogic@lists.infradead.org; Wed, 06 Apr 2022 11:31:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 r11-20020a1c440b000000b0038ccb70e239so3424379wma.3
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Apr 2022 04:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5XbRU+VxgtJAsYJu2rQYo8tuqHFMuZ1T/xaK9fUrdH0=;
 b=eR5rUlVSnTFQlvGrccqjvN39M+LeViWxotz7T8MGCPbprNA8KYhbn/yw6G+dwvbAyK
 mxXLeQggdQLJvCfjEdJz1V45cbfp1g3qf2mP6hTjQ0jauNDwJw/0skDi7X4qzk70kShg
 xTWeyaXzLpEhIappmAnDK8gVxdrAaQxznxoLwhp1xkZM/wCBTQE+2EW1jX+i85riQPyl
 WxogHEwc5ZehS7LFL8tJMaR7hBZmSxT9d7+2y+6IIE5Gg/Hh11kb01LTUTO5FUVUUzu0
 zZEXGR5B7R/AO+i1J3O7BWkkqCV0AY00roN3cmRkjgq1laaz+jiP+NkI21eF0pWV6/fm
 A20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5XbRU+VxgtJAsYJu2rQYo8tuqHFMuZ1T/xaK9fUrdH0=;
 b=tphJGeKMx265ZrDcoSzvuQYqZqt2ZCO+9ZDZZt0uXYnuA6ZUeMgqS1KjuBGuP97nlz
 J7zW3eUC18cafcK/eqUk4DthDub24fUHdT3Sl5rhEXJhCfJrEA1Jwwby+u2rk1A8tMRl
 xSHtR62Bgd2k2XLjM7ULFgV2cKH/CkR4FgzLnLCWXXwXr3mAko8eDQG9xlh9vOFTGpQ6
 vVNU3kQxZVWAwSASHXxVbWqA6lTyqz9Ti+bAVoYrQzDjf2qRRBqcJ91fkhSNtn1VsWFG
 //qmdIu7UvwZHtyj8tQpXEBIdHH+0UEoeK1m2rJEf0pMA9om9O0DKzf//opYSgcjbxH/
 u9XA==
X-Gm-Message-State: AOAM533hVr6zIOUWjA9Y6RPtm5CITGdmzwor+TrEGNvEWnYrxgcxSFFW
 rX7t90ty6N8GEc7dWCRw2YXeLA==
X-Google-Smtp-Source: ABdhPJz5ePGx/VXESvKKA0BSxhKgDc52BTcCoXDqPlrAPdNxYzxZyJaRj9rQ1myoM+kbqb4a3CQTqQ==
X-Received: by 2002:a05:600c:2652:b0:38e:72da:7992 with SMTP id
 18-20020a05600c265200b0038e72da7992mr7034652wmy.111.1649244683953; 
 Wed, 06 Apr 2022 04:31:23 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d960:ec5e:e421:9c9e?
 ([2001:861:44c0:66c0:d960:ec5e:e421:9c9e])
 by smtp.gmail.com with ESMTPSA id
 a2-20020a5d53c2000000b0020604b2667asm16014136wrw.81.2022.04.06.04.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 04:31:23 -0700 (PDT)
Message-ID: <c789adcd-d072-bec2-a823-5f5993704365@baylibre.com>
Date: Wed, 6 Apr 2022 13:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] i2c: meson: Use 50% duty cycle for I2C clock
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220326102229.421718-1-tanure@linux.com>
 <20220326102229.421718-3-tanure@linux.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220326102229.421718-3-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_043127_932494_FC322D25 
X-CRM114-Status: GOOD (  21.71  )
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

Hi,

On 26/03/2022 11:22, Lucas Tanure wrote:
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
>   drivers/i2c/busses/i2c-meson.c | 45 +++++++++++++++++++++++++---------
>   1 file changed, 33 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index 4b4a5b2d77ab..b913ba20f06e 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -140,29 +140,50 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
>   static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
>   {
>   	unsigned long clk_rate = clk_get_rate(i2c->clk);
> -	unsigned int div;
> +	unsigned int div_h, div_l;
>   
> -	div = DIV_ROUND_UP(clk_rate, freq);
> -	div -= FILTER_DELAY;
> -	div = DIV_ROUND_UP(div, i2c->data->div_factor);
> +	if (freq <= 100000) {

You should use I2C_MAX_STANDARD_MODE_FREQ instead here

> +		div_h = DIV_ROUND_UP(clk_rate, freq);
> +		div_l = DIV_ROUND_UP(div_h, 4);
> +		div_h = DIV_ROUND_UP(div_h, 2) - FILTER_DELAY;
> +	} else {
> +	/* According to I2C-BUS Spec 2.1, in FAST-MODE, the minimum LOW period is 1.3uS, and
> +	 * minimum HIGH is least 0.6us.
> +	 * For 400000 freq, the period is 2.5us. To keep within the specs, give 40% of period to
> +	 * HIGH and 60% to LOW. This means HIGH at 1.0us and LOW 1.5us.
> +	 * The same applies for Fast-mode plus, where LOW is 0.5us and HIGH is 0.26us.
> +	 * Duty = H/(H + L) = 2/5
> +	 */

Please move the comment before the if()

> +		div_h = DIV_ROUND_UP(clk_rate * 2, freq * 5) - FILTER_DELAY;
> +		div_l = DIV_ROUND_UP(clk_rate * 3, freq * 5 * 2);
> +	}
>   
>   	/* clock divider has 12 bits */
> -	if (div > GENMASK(11, 0)) {
> +	if (div_h > GENMASK(11, 0)) {
>   		dev_err(i2c->dev, "requested bus frequency too low\n");
> -		div = GENMASK(11, 0);
> +		div_h = GENMASK(11, 0);
> +	}
> +	if (div_l > GENMASK(11, 0)) {
> +		dev_err(i2c->dev, "requested bus frequency too low\n");
> +		div_l = GENMASK(11, 0);
>   	}
>   
>   	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
> -			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
> +			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div_h & GENMASK(9, 0)));
>   
>   	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
> -			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
> +			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div_h >> 10));
> +
> +
> +	/* set SCL low delay */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_MASK,
> +			   (div_l << REG_SLV_SCL_LOW_SHIFT) & REG_SLV_SCL_LOW_MASK);

You could use FIELD_PREP() here

>   
> -	/* Disable HIGH/LOW mode */
> -	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
> +	/* Enable HIGH/LOW mode */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);
>   
> -	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
> -		clk_rate, freq, div);
> +	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
> +		clk_rate, freq, div_h, div_l);
>   }
>   
>   static void meson_i2c_get_data(struct meson_i2c *i2c, char *buf, int len)

I looked at different amlogic downstream sources, and those match the recommended
calculations.

So with the legacy back for Meson6, it will be OK.

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
