Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4588C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWqthS/yAjB2vTbLh++gd4yfHzydU/YYfqiFlJra/BI=; b=vRDiC/vbay+5FF
	t+NhqvnkV8D5ALfzrDm74Bxv8+T78tjdbfkhe1Uv2Mk4KVn9J0pPlAvdrNiZfl2Se6B45zA2q/npR
	UgTefiMali7Vd+MoKbq9yMzHCOFiKytVs+iHJMb4se7fLFK/k525nAbp1cuIfaiiEXacDyNC2VYWn
	z2dEtYii4eV9Zi6Zw2hUvxLqRR5E+2cg58kJABP+UqYRA8BXd7uO1oLjsuMxPNO/qrK2Gm0GnJPbo
	LXUlRz2kWVbB21OMmmNAtzmD1mZWXAbMkdNuCNOmultX3qLg3U1/OKiOLbbjGw9NpNwrsWkOZasAt
	rM+7b0KL8YxpgwdZMpZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzKBH-000000011Bt-3D9w;
	Tue, 23 Apr 2024 17:43:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzKBE-0000000119i-0ZFi
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Apr 2024 17:43:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-41a5b68ed85so543925e9.1
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2024 10:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713894221; x=1714499021; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=xP/dSnA767BtvZjFr+UbEirp9Ik35vqXQ9msNy380rM=;
        b=pEBl2v3It7ULVhMp7MXEIPQzvdQopiShRdsvw4HWauMcVKMSjrt0ulV6X5oPMl+Hhu
         H8igNjUF0NyMkfp2Fc9xpzezdK9PaAZpDnNc7Jpd9ZmScMcbeAxZnlKYo1i5rrWuXnA6
         G2gOvpFmTEGxVtxLjPeM5Y89vzxPkBRgPnCSJy5cjbboYLsum04g8uJf1o1CvkF7kZX2
         6tC/tMWDUVLFcMjhkG5Gwdxnz9hO7mP+0xtuTFU9PUguSvDr2s6AZ5SgYlIDCR6r/aqt
         GJckcx1XOK63s2aBmLssTcVDSlQ7gtyXI1jHWl4CQ5n2fnQd2GGiwzdILIueENETbTBV
         WmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713894221; x=1714499021;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xP/dSnA767BtvZjFr+UbEirp9Ik35vqXQ9msNy380rM=;
        b=lO1c7Y5U9enAWQJurTKASnc70n0YhGjZCJcuj3rXz7D/kygoVgq1UwUFGfK7mEAYQr
         hrLhxnLwgo05d/SncbsY8ye08nDDgSP3gEoWOVxV0epZpfwCC3/Y7KTuBV8eYxAvPX9V
         KLs4msMetPahtNIVQC7MqbnnHjNBFPwOzmEKM7z/vx9yhD2TsXTdD36460/jI9M1VfSb
         WoxMPG+8STOE7iR4qT3CqZ8CgzPjCmhJOLX07x14ikeXFOaL9S45znaiJnkvizBJa80K
         9eVZq1NymL0tPIeOQNv7lpYyfympmm4nDmbFVSKbVLUwv7koH0Oirm7WBZUicF2Jyylf
         Yh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4cHVBsI60sKM0LypY/nRhwaNYDyltrW2mHghubrMlPIu+MbDci28JSWHX79Wly7TpELAP913n6nip9L/Ftc4eGV6XWCAIaNu+Hnpk1Kbzucg=
X-Gm-Message-State: AOJu0YxaL5FEpMv+qpEw6Hl6/wfarYmwhpZXlJoQ+65/Gh2v+MTU6GvJ
	zcIlASaVVBh/4dDTyGEquZol9AUQo5e15hzPVcmZqo86hKZqAmeQ/GHl53qjwh0=
X-Google-Smtp-Source: AGHT+IFN3sKGf0QLUl/rmcrF/MIEa7ILZ5sxMGe+vffDzMV1NNJqknbDpN+wCiQiguhfqPPiAmgxhg==
X-Received: by 2002:a05:600c:1988:b0:418:f219:6f64 with SMTP id t8-20020a05600c198800b00418f2196f64mr2738580wmq.4.1713894221268;
        Tue, 23 Apr 2024 10:43:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:aa38:830e:cbbf:591])
        by smtp.gmail.com with ESMTPSA id d5-20020a5d6445000000b0034659d971a6sm15078195wrw.26.2024.04.23.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 10:43:40 -0700 (PDT)
References: <20240423161006.2522351-1-gnstark@salutedevices.com>
 <20240423161006.2522351-3-gnstark@salutedevices.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: George Stark <gnstark@salutedevices.com>
Cc: u.kleine-koenig@pengutronix.de, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, thierry.reding@gmail.com,
 hkallweit1@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@salutedevices.com, George Stark
 <gnstark@sberdevices.ru>, Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH 2/2] pwm: meson: support meson A1 SoC family
Date: Tue, 23 Apr 2024 19:35:15 +0200
In-reply-to: <20240423161006.2522351-3-gnstark@salutedevices.com>
Message-ID: <1jv848ezzo.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_104344_225570_DAB52B38 
X-CRM114-Status: GOOD (  23.37  )
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


On Tue 23 Apr 2024 at 19:10, George Stark <gnstark@salutedevices.com> wrote:

> From: George Stark <gnstark@sberdevices.ru>
>
> Add a compatible string and configuration for the meson A1 SoC family
> PWM. Additionally, provide an external clock initialization helper
> specifically designed for these PWM IPs.
>
> Signed-off-by: George Stark <gnstark@sberdevices.ru>
> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> ---
>  drivers/pwm/pwm-meson.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index ea96c5973488..529a541ba7b6 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -462,6 +462,33 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>  	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>  }
>  
> +static int meson_pwm_init_channels_ext_clock(struct pwm_chip *chip)

That kind on naming (ext) is almost sure to clash with whatever comes next.
Just use the name of the first SoC using the method, a1 for instance.

> +{
> +	struct device *dev = pwmchip_parent(chip);
> +	struct meson_pwm *meson = to_meson_pwm(chip);
> +	struct meson_pwm_channel *channels = meson->channels;
> +	struct clk_bulk_data *clks = NULL;
> +	unsigned int i;
> +	int res;
> +
> +	res = devm_clk_bulk_get_all(dev, &clks);
> +	if (res < 0) {
> +		dev_err(dev, "can't get device clocks\n");
> +		return res;
> +	}

I don't think allocating the 'clk_bulk_data *clks' is necessary or safe.
We know exactly how many clocks we expect, there is no need for a get all.

> +
> +	if (res != MESON_NUM_PWMS) {
> +		dev_err(dev, "clock count must be %d, got %d\n",
> +			MESON_NUM_PWMS, res);
> +		return -EINVAL;
> +	}

... and this only catches the problem after the fact.

It is probably convinient but not necessary.

> +
> +	for (i = 0; i < MESON_NUM_PWMS; i++)
> +		channels[i].clk = clks[i].clk;

channels[i].clk could be assigned directly of_clk_get() using clock
indexes. No extra allocation needed.

> +
> +	return 0;
> +}
> +
>  static const struct meson_pwm_data pwm_meson8b_data = {
>  	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>  	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> @@ -500,11 +527,19 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
>  	.channels_init = meson_pwm_init_channels_meson8b_v2,
>  };
>  
> +static const struct meson_pwm_data pwm_meson_ext_clock_data = {
> +	.channels_init = meson_pwm_init_channels_ext_clock,
> +};
> +
>  static const struct of_device_id meson_pwm_matches[] = {
>  	{
>  		.compatible = "amlogic,meson8-pwm-v2",
>  		.data = &pwm_meson8_v2_data
>  	},
> +	{
> +		.compatible = "amlogic,meson-a1-pwm",
> +		.data = &pwm_meson_ext_clock_data
> +	},
>  	/* The following compatibles are obsolete */
>  	{
>  		.compatible = "amlogic,meson8b-pwm",


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
