Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C662BC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Apr 2022 09:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V46FycrMtU1yr/jkd6ZT22Kp5FdXN4IZAbBiUqq03g8=; b=NbjolnVpkSFbfW
	yOLSc5F8/R7W6hz0WJ5cBLsYPLGa+UVKpvfbl/2qP9XGu/p1SlmECZkuxLm5WYQKg0fWrM2opAi5n
	LHcRspUf9obZCy75BQklxvJFzZCMUwqK8Oc6jlVf6cC3nRltATq4/VuIwccW/osP74SBjjSpjsvNM
	NlnJphJIfB1JvD8XKVTGE3hG/hJnoPxXzgEj6q3Ucrja6QG8Uv2igCFfYqa8Uuky3YiC4pUEBIqlw
	oooUxHiM7oErGXtw/kYc6eFckEJym042Kj4x88yRxvkehDlohLIsbxYYzrs/hsiD3gU3z0fuvEW21
	cwmS8JriKq1frxFQ+mng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbfW1-000PRn-6A; Tue, 05 Apr 2022 09:30:21 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbfVu-000PL1-Rg
 for linux-amlogic@lists.infradead.org; Tue, 05 Apr 2022 09:30:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id q19so11429193wrc.6
 for <linux-amlogic@lists.infradead.org>; Tue, 05 Apr 2022 02:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8lDLVrPOsnw4Mz9TQAfirGfK7fTb+NPu+8OdJjj0wJw=;
 b=D/fsFEMj3S1FwbkgaUGI9wGYM8PgxuWJnZ9/rvLsnwppX42bfgnlEmILL5uEyrb1Dx
 TDVq3xjNDRJFTeu1j6W3yPiFKrnjH7tJmNNXbo9FS2bGC5cAf7ApBrM2BS3D++hK6RZs
 YNjS3TC3lzp85hnBWn7yFlJykUSRgjrEXpzcdVoJcKyYVGifGEBZUoPZ9N8q28grjk35
 ZArcz7KbC9iCeY0Q3Er/pxq1lwUxyenW+Pu/ybiH0ZBZ5vU15SgAt3LdZmGHovo7WiY7
 H7VMXvwnfUWWS1R4d6zDG+aE5yzSwu0NrwUc3doSMxJ2nygQ5aK3WmWgNbsHwGIxltJR
 mmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8lDLVrPOsnw4Mz9TQAfirGfK7fTb+NPu+8OdJjj0wJw=;
 b=fIvRUJ7CXaLM9llCONEdxhB10y2NvOhC0x+vPFifNgH90aW7TQN3ppWi5VTqAkn+N3
 p4t64IhQqXqVdRpmx9uD/NXRhYqKdNwTkBtq4Cf8fBF1wh7CU0AoOUaQDFmrSB8J8PZS
 wwxiJgREcZmqDgaUu5BIER3CuetJM1hJiZDvtW3Y4Og/ypFy8OHXlkmqzNEA3QrKRaBn
 PNOZ+pmegSRhxd7prUFJIH+igzlzwlSE0G/FcsWkwr7kdGJW6GWNiY0XfoGrc8uKMuX4
 GREQs8mc6sndc7biW7ZdLS2/1X1ReLslZYnla65C/46OfgusJ5ViWwVBIe/IaVAOqmf1
 ScAA==
X-Gm-Message-State: AOAM533w57HP2pWwMIjX4uGMABsNViaHQQE2CUsJlHE2rI1l5NJeNmaB
 LWpI+6unqFflrGetxu0yEB32cgQrh6+gntKa
X-Google-Smtp-Source: ABdhPJxWxh23GMVPd0s31x6hl+V46TL89GpDJ9HP9Iw71kYriB2IoNBqOfQ1QwndSJF4td2CBI0L3w==
X-Received: by 2002:a05:6000:137c:b0:206:17dd:d67d with SMTP id
 q28-20020a056000137c00b0020617ddd67dmr1854632wrz.288.1649151008526; 
 Tue, 05 Apr 2022 02:30:08 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5cd5:d9c8:ef4:b0ed?
 ([2001:861:44c0:66c0:5cd5:d9c8:ef4:b0ed])
 by smtp.gmail.com with ESMTPSA id
 bg20-20020a05600c3c9400b0037fa5c422c8sm1716169wmb.48.2022.04.05.02.30.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 02:30:07 -0700 (PDT)
Message-ID: <29b899b0-5c3e-b1af-c8a7-361419673cfd@baylibre.com>
Date: Tue, 5 Apr 2022 11:30:06 +0200
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
X-CRM114-CacheID: sfid-20220405_023015_220050_D76B22B2 
X-CRM114-Status: GOOD (  22.36  )
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
>   
> -	/* Disable HIGH/LOW mode */
> -	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
> +	/* Enable HIGH/LOW mode */
> +	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);


While reading registers documentation, it's written:
```
SCL Low delay. This is a new feature in M8baby. In the previous M8baby design, the SCL low time was controlled
by bits[21:12] of the register above. In this design, the SCL delay is controlled independently by these bits.
```

Could you keep the previous calculation for Meson6, with DIV_FACTOR fixed to 4, and use the new calculation only for GXBB & AXG ?

To ease this, replace the div_factor with a clock calculation function pointer in meson_i2c_data, and pass the old
one for Meson6 and the new one for GXBB & AXG.
This only slightly changes patch 2 and changes patch 3 from a removal to a variable replace.

>   
> -	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
> -		clk_rate, freq, div);
> +	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
> +		clk_rate, freq, div_h, div_l);
>   }
>   
>   static void meson_i2c_get_data(struct meson_i2c *i2c, char *buf, int len)


Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
