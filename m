Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE235C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 10:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0fSlvM4WUracQBzTl3bQRYjqYXa4+7S8oct2/9d6+w=; b=o0dVRe/CM3mFO/
	41qTmyCnKiGykPnbLszzEkRcLFcOvkI/+iM0b0n4pQBKQBbvP40gWKTiIJTYUF5miI+8wn992rEdu
	pNL4ONlYP+B/zE0NIlCLIBrbvve/vBAA3CneHQvnMtHBFpWL240kY1SZmnMD5wQ02/ICm6zb7ceyY
	UmqCDPjhGQoRG0+T6So6QTC1e10wlsH6pK9CnEAFbsPRMVvAbzPr40Oag8OT8KIi9HFzA2JAWGEpR
	tQhMWS//KDR1RWrrq1rIDfADpRaBggRjLMyYV30B/ZyrHCEuII956DTvFySG8AgfD3VTgY+NYp+37
	6ikqhn7gnEppoV/48fHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZyP-00000003iib-3Qwm;
	Wed, 24 Apr 2024 10:35:33 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzZyL-00000003ihE-3B4A
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Apr 2024 10:35:31 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-347c197a464so5056313f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Apr 2024 03:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713954928; x=1714559728; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=hYv5alBH1R2EJ4Kww5tLPW6KC2Ui3xFKYOGhL+ALJqk=;
        b=beBRToCMEjOM/x3hqhpj5IqTEGshLQ9KNQMX2E9uKprEMlJhX/BQgot518EFK644oE
         NAv/r1QjW/Fh+6m/BjYNwtC8X7M++4BWCiZ7K8+2G6w/zvXxAmoIdcYLAObeAs9XnnI5
         A20h1M6NgqJKV2LwVTAp3qqdOeqW6sSJfU9+Y68dq9ISXzC733nA2EDGr7Guodj3lXvW
         YRNQQ8UypRjcFZA0xVf8Getq0Mt7yUeOTMCvlFNVOUYjty39VjtrV+e6SiiyIDzutcsO
         djXIequ9y7gU6LuDzshbUZl19qvEhSRqo5wC419EnmuPrZJ0DslfV3pbdk+YECHEXpd+
         AVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713954928; x=1714559728;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYv5alBH1R2EJ4Kww5tLPW6KC2Ui3xFKYOGhL+ALJqk=;
        b=pz2acUE/aKMh9PYwZH8X+itzrt3YyXB+5seG1P7JIP/muyX5xVDqOS9ZT5IczDqHR3
         +HXYHHFZB6gPOWVsF0J20hRAu1LM6KpJqlxIJvW2VnH49Jx5sHDhmacLlU1vSkQlATW+
         QRS8szNfKLI27/8dlq4BOEn7aOr2P5H1flu99gDvPD2bsLLFJQLCDwHW3ohe86hqNE6i
         RLkm5+tEG72pVIGbSXzvbaU1x1M2O/osIvoO9uM+dgaMNKGV6EQRS/8bdGhZUXc3+FOo
         D/4ImGLAQ3t49TatWn9WM7HyXv0RGimlRM1RJCA/S1ont4EOQcu9dBaBW3ryDHHDnJy3
         5XYA==
X-Forwarded-Encrypted: i=1; AJvYcCXwEocNzyhakdPapadXUw8o71W4WokbqJ0540wXVyXCOqEZzojJxDp9ppBijs7YViNJ7+pxGiu+HytMjx272ZNsf3ze/pEzbELbnNLY5XahEsk=
X-Gm-Message-State: AOJu0YzhnZZpDGPiioCHl++qQ4Mitqjn6qnH6n6xi3+4VBbW5yuN0fuW
	vAQ/ubmGwBS+2Tq2mKKMhaaLQdDrKMR/NhyecjBpCJ4pbjHVQZuMo/agtV9F94U=
X-Google-Smtp-Source: AGHT+IHdW9sTwML+/nRGcnzYahxfLampmfipzvmhxqRnukXjxtxh3gJ9jq8o7pdG5bnvWX2B5JMwEg==
X-Received: by 2002:a5d:60c1:0:b0:34b:5afb:f10d with SMTP id x1-20020a5d60c1000000b0034b5afbf10dmr1250688wrt.38.1713954928040;
        Wed, 24 Apr 2024 03:35:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ab48:1b7:631c:952a])
        by smtp.gmail.com with ESMTPSA id q12-20020adfcd8c000000b00343cad2a4d3sm16709990wrj.18.2024.04.24.03.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 03:35:27 -0700 (PDT)
References: <20240424-s4-pwm-v4-0-ee22effd40d0@amlogic.com>
 <20240424-s4-pwm-v4-1-ee22effd40d0@amlogic.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: kelvin.zhang@amlogic.com, George Stark <gnstark@salutedevices.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Neil
 Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Junyi Zhao
 <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v4 1/2] pwm: meson: Add support for Amlogic S4 PWM
Date: Wed, 24 Apr 2024 12:32:36 +0200
In-reply-to: <20240424-s4-pwm-v4-1-ee22effd40d0@amlogic.com>
Message-ID: <1jil07f3ps.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_033529_993087_24FB9CA2 
X-CRM114-Status: GOOD (  19.83  )
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


On Wed 24 Apr 2024 at 18:28, Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org> wrote:

> From: Junyi Zhao <junyi.zhao@amlogic.com>
>
> This patch adds support for Amlogic S4 PWM.
>
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>  drivers/pwm/pwm-meson.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index ea96c5973488..6abc823745e4 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -462,6 +462,35 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>  	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>  }
>  
> +static int meson_pwm_init_channels_meson_s4(struct pwm_chip *chip)
> +{
> +	int i, ret;
> +	struct device *dev = pwmchip_parent(chip);
> +	struct device_node *np = dev->of_node;
> +	struct meson_pwm *meson = to_meson_pwm(chip);
> +	struct meson_pwm_channel *channel;
> +
> +	for (i = 0; i < MESON_NUM_PWMS; i++) {
> +		channel = &meson->channels[i];
> +		channel->clk = of_clk_get(np, i);
> +		if (IS_ERR(channel->clk)) {
> +			ret = PTR_ERR(channel->clk);
> +			dev_err_probe(dev, ret, "Failed to get clk\n");
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	while (--i >= 0) {
> +		channel = &meson->channels[i];
> +		clk_put(channel->clk);

Fine on error but leaks on module unload.

Same as George,

Add the devm variant of of_clk_get() if you must.
Use devm_add_action_or_reset() otherwise

Could please synchronize this series with George and deal with all the
supported SoCs ? a1, s4, t7, c3 ...

> +	}
> +
> +	return ret;
> +}
> +
>  static const struct meson_pwm_data pwm_meson8b_data = {
>  	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>  	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> @@ -500,6 +529,10 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
>  	.channels_init = meson_pwm_init_channels_meson8b_v2,
>  };
>  
> +static const struct meson_pwm_data pwm_meson_s4_data = {
> +	.channels_init = meson_pwm_init_channels_meson_s4,
> +};
> +
>  static const struct of_device_id meson_pwm_matches[] = {
>  	{
>  		.compatible = "amlogic,meson8-pwm-v2",
> @@ -538,6 +571,10 @@ static const struct of_device_id meson_pwm_matches[] = {
>  		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
>  		.data = &pwm_g12a_ao_cd_data
>  	},
> +	{
> +		.compatible = "amlogic,meson-s4-pwm",
> +		.data = &pwm_meson_s4_data
> +	},
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, meson_pwm_matches);


-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
