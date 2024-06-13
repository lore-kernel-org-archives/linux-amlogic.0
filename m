Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED36EC27C4F
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 15:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBC4zeGFiKfvzy+OIAJQQr5j5Cl5JvhvNUWPdIwFOdM=; b=ciTcNpSJrPBjus
	MTl67wA/hYKryacVTodnVfv2bEg4XMIf58psy23i8Q98VCBGA6fZe6YfcRZYRcjEwI9y0IjyBZvPI
	2cPcpxSnD1zB0bbDUH3kZ2OjTild22Coag4CxoArXiF9Jex4s8nAY13Sm0E+sDHrFJt3Z0dAqxw4z
	3XGRRzWBX8aebrmmu2mtkREPn0MEQs+hq8CmFmJ7jowu4rE3rJa6+Z1VzKOs2l32ilu0O9GxByFQY
	Z7dKTmAl0YyDaIV1qlxzXEwkexnIZt0Qk6FuIT8NIlcSGuEZyOR4lSIc7XgQKJm+R/B3S2B923njT
	1D+kW9TYEuz6OyBj1E/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHmmd-0000000HGET-1zlr;
	Thu, 13 Jun 2024 15:54:39 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHmma-0000000HGCy-259Y
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Jun 2024 15:54:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4217d808034so11684665e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2024 08:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718294072; x=1718898872; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6tXE2AO0lPT2LpEB7LFIA9IGhDPpvidsM8ojyddTgQ=;
        b=u2XdAxqvpKgsVAMcNA691Z5Y4fzyz21pS1nTdDV6BagFJtkSGDdxfvVfJ0Qc1Ru8gs
         8YoGVV+gWJEnPdJjgMoEMDPfcfVTq0SPMutkfPW03l0bgyoYlsP82EPnCG/glpiXOQKp
         GO58ZlFFW/r2WN689UQnXonopBwS3Z7WOLYeO3Nv9t70yUk2vCOWIqXqr7SvGc6iFyCb
         NbuoUB6XcpCFhDYFIc6fUqI1SKZMn0RNv5dUdfWm5+HfSLjExxklhXKwzLAQe6+Y52k0
         bnJbxzkDVEVp5RolgZ6jp633D+I/bspv6vQ3mkmbzpIdCMFgHELceWcVUE+jYAk3kngy
         qDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718294072; x=1718898872;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d6tXE2AO0lPT2LpEB7LFIA9IGhDPpvidsM8ojyddTgQ=;
        b=WkyuNXwvOHg5JbKPZjopDEcB3R7BIRgpAu0OaJjIyisfbpbn8GfkWX51iI/XeTZMnB
         SldBFDuNGrmNj0T9eocW8E3j28ghUB7KlX6+zBYwNBXYYpcefDXbBVQzMCP49bZHuNn2
         XMmD8MTdLETE49qhZWKFl2+XH63AcQRknmw5Qd7C0oozgOSvyhCHE6IQx3SKwJtZ5l4F
         E5Zp/sz4kkGQcU42PxO+Aka5YqvkMdbc3HJ0Svo5mdaKdUDfJUSw//GxpMh0xR/pYoKt
         Ey0cFKJyWNF2QgL4AzU8cKpH4gYiSTgxnXnrkmju3jM2pTzSp6UGFpMQLXQZQHXGRnGG
         LL9g==
X-Forwarded-Encrypted: i=1; AJvYcCWDHhcExaFvg7z0d59y6N9WTtat9ZYWlYdtXnN91WLUcZo063LQ7XDUPC9Y0vGbd7B/NLUVeOl5mpJz2EqgwxzA1yerC0y7+ftjcA75STRxdPg=
X-Gm-Message-State: AOJu0YxqgBGsXlaKFjxeEcxoNuD4e/H11VriPqb320hVic19MA1QCTkW
	5m6fbqUiCST3WZGvqAGEEmR3VgzBL0Hhh0i4RLvRoo4y7Fye2W1WTQeB/3IVeGE=
X-Google-Smtp-Source: AGHT+IG1zc8YWNE0EHvhNYi1n4wvzpml1bFEuKoi2CO1pl70ncYnu86I0E00hbaTdU/6tEtLjLTn0g==
X-Received: by 2002:a05:600c:4689:b0:423:366:ad3d with SMTP id 5b1f17b1804b1-42304827295mr2065555e9.13.1718294072242;
        Thu, 13 Jun 2024 08:54:32 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:ec82:cd82:409a:270b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f641a633sm29738235e9.43.2024.06.13.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:54:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  kelvin.zhang@amlogic.com,
  linux-pwm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org,  Junyi Zhao <junyi.zhao@amlogic.com>
Subject: Re: [PATCH v8 1/2] pwm: meson: Add support for Amlogic S4 PWM
In-Reply-To: <20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com> (Kelvin Zhang
	via's message of "Thu, 13 Jun 2024 19:46:35 +0800")
References: <20240613-s4-pwm-v8-0-b5bd0a768282@amlogic.com>
	<20240613-s4-pwm-v8-1-b5bd0a768282@amlogic.com>
Date: Thu, 13 Jun 2024 17:54:31 +0200
Message-ID: <1jfrtgj0so.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_085436_889907_9A0FB4CD 
X-CRM114-Status: GOOD (  18.55  )
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

On Thu 13 Jun 2024 at 19:46, Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org> wrote:

> From: Junyi Zhao <junyi.zhao@amlogic.com>
>
> Add support for Amlogic S4 PWM.
>
> Signed-off-by: Junyi Zhao <junyi.zhao@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>  drivers/pwm/pwm-meson.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
> index b2f97dfb01bb..98e6c1533312 100644
> --- a/drivers/pwm/pwm-meson.c
> +++ b/drivers/pwm/pwm-meson.c
> @@ -460,6 +460,37 @@ static int meson_pwm_init_channels_meson8b_v2(struct pwm_chip *chip)
>  	return meson_pwm_init_clocks_meson8b(chip, mux_parent_data);
>  }
>  
> +static void meson_pwm_s4_put_clk(void *data)
> +{
> +	struct clk *clk = data;
> +
> +	clk_put(clk);
> +}
> +
> +static int meson_pwm_init_channels_s4(struct pwm_chip *chip)
> +{
> +	struct device *dev = pwmchip_parent(chip);
> +	struct device_node *np = dev->of_node;
> +	struct meson_pwm *meson = to_meson_pwm(chip);
> +	int i, ret;
> +
> +	for (i = 0; i < MESON_NUM_PWMS; i++) {
> +		meson->channels[i].clk = of_clk_get(np, i);
> +		if (IS_ERR(meson->channels[i].clk))
> +			return dev_err_probe(dev,
> +					     PTR_ERR(meson->channels[i].clk),
> +					     "Failed to get clk\n");

here it is ok but ..

> +
> +		ret = devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
> +					       meson->channels[i].clk);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to add clk_put action\n");

... here, devm_add_action_or_reset cannot defer, so dev_err_probe is not useful.
dev_err() if you must print something. Just "return ret;" would be fine
by me

> +	}
> +
> +	return 0;
> +}
> +
>  static const struct meson_pwm_data pwm_meson8b_data = {
>  	.parent_names = { "xtal", NULL, "fclk_div4", "fclk_div3" },
>  	.channels_init = meson_pwm_init_channels_meson8b_legacy,
> @@ -498,6 +529,10 @@ static const struct meson_pwm_data pwm_meson8_v2_data = {
>  	.channels_init = meson_pwm_init_channels_meson8b_v2,
>  };
>  
> +static const struct meson_pwm_data pwm_s4_data = {
> +	.channels_init = meson_pwm_init_channels_s4,
> +};
> +
>  static const struct of_device_id meson_pwm_matches[] = {
>  	{
>  		.compatible = "amlogic,meson8-pwm-v2",
> @@ -536,6 +571,10 @@ static const struct of_device_id meson_pwm_matches[] = {
>  		.compatible = "amlogic,meson-g12a-ao-pwm-cd",
>  		.data = &pwm_g12a_ao_cd_data
>  	},
> +	{
> +		.compatible = "amlogic,meson-s4-pwm",
> +		.data = &pwm_s4_data
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
