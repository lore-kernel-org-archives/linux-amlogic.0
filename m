Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120B1C433FE
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Nov 2022 08:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0Ibs76JNYtD8kBU3n7zKMsnudOWfsBGcCtLYa7FPfg=; b=rmjWqmg/mmjiHE1+CW2j41SMIh
	V0x9nam/wBZ+gDEE4nC93Bkg2+KM4zHKPWpe8sxAGTlHiojMYK+dAB7OoHdOjbzsU3MlJe1mbxdU6
	YrOZcv4opETHwzLSxloLd+hw7ewecUvTsy9ioA0cx+bmIjDeEPseNSZLt/Zt7rDD54Hn/z8iynrCk
	lM4gVCWdtvV3O/CQfprYLVxFGEOs4unhbSSCaSDeoGF+ouGuT26D7onHq/xFnmGYNiVYp37AlxlaU
	yjWqIfoaq4SdNJ1TVFb37ASYgSHr9dhkhvC4JCSJrACGhqFN5gIEIAdmsza9G8PmOqVrTTx6mg7f4
	j8kr9Jtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovafa-00Bsm5-1Z; Thu, 17 Nov 2022 08:54:50 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovafX-00BsgD-M6
	for linux-amlogic@lists.infradead.org; Thu, 17 Nov 2022 08:54:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso1279600wms.4
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Nov 2022 00:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9hYrAT2BNVskU/iDANhKEsz2VyGmJLN/rJvwow2j2xk=;
        b=GejQpumCcaJEwAMF9vs5N6MTa4HzjPwDmJEUeAvSGwmdPfgcFftqfp718ZY//Kwd/6
         NiRLKvzHWmOEB2glIPDCQqS20M5AbpWcheJWEe0v9HSameNpXDzd3tnXIkr21M/fO/+B
         pMxqk3YwUh68R3+JoME0RkA8m5KvnhhhS5BEJpn7PLYav1RuSPombssgPei++tn1Lbhg
         FKRcEUteXeQMMH39vFxOtoAEEqhtSHQu3b9aIGoVVR1/ibfYRas58aI9oEtbYLOM1yiM
         SRgaK8m7sSzvY+2xBJIHjAcY9v4AZ62NV5llYbm9KOpaVbb/wgsOyny44CZrK2w4rHgZ
         96pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hYrAT2BNVskU/iDANhKEsz2VyGmJLN/rJvwow2j2xk=;
        b=H+o/GfQSVA2lo3+YILsoLkWQfJpK0ImgT9M0ScG7mDDUqRKpErIWFXF0/eq73JQ2xl
         uju6htakIS1GcBVWDKHXMYmlc9OLaEwlTxG8uo9bia/t8VaL76vAPoYXeadtIC3MjX5f
         dRd63FiONJRWLVZce1Ac3kwv95ML8Uv8mBmFMAMbYSOvDFLltDajnF3JpXfoMb3V8M0B
         eHkDTuZ8xAd4c1H3Kz5dVzypjMpHMI7SGhEWO3qobRV2Bwo6Cs5xiJUawG+6nb04Ppie
         Lha4hNIG862eiLZczW5CaV0BqGlUggRmjBRBxnFEWK+fAFKR/7qQJFHVMRvQZf86VrIo
         TbQg==
X-Gm-Message-State: ANoB5pnfj30vbsZQguS7/2fZvjpeooxCJw9Xch2u5jqzihgjipKte50g
	4zaeVfySZpDWlYNN1Vx4Mz3M1Q==
X-Google-Smtp-Source: AA0mqf7R5pytyH9/lNfPVQJWtwPbmJ8SiI7lVBKrIVlZzrwL5/u2Uq88NSqEZmONRgEmdbXer9wwaw==
X-Received: by 2002:a7b:cd85:0:b0:3cf:931c:3cfa with SMTP id y5-20020a7bcd85000000b003cf931c3cfamr940137wmj.203.1668675281746;
        Thu, 17 Nov 2022 00:54:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b? ([2a01:e0a:982:cbb0:aad5:8d14:a22f:2e8b])
        by smtp.gmail.com with ESMTPSA id d16-20020a5d6dd0000000b0022584c82c80sm386384wrz.19.2022.11.17.00.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 00:54:41 -0800 (PST)
Message-ID: <098b923b-ff46-5ef5-9c21-19c974c9274f@linaro.org>
Date: Thu, 17 Nov 2022 09:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] spi: meson-spicc: Lower CS between bursts
Content-Language: en-US
To: Carlo Caione <ccaione@baylibre.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 David Airlie <airlied@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
Organization: Linaro Developer Services
In-Reply-To: <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_005447_770434_9C606DB9 
X-CRM114-Status: GOOD (  19.52  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 17/11/2022 09:47, Carlo Caione wrote:
> On some hardware (reproduced on S905X) when a large payload is
> transmitted over SPI in bursts at the end of each burst, the clock line
> briefly fluctuates creating spurious clock transitions that are being
> recognised by the connected device as a genuine pulses, creating an
> offset in the data being transmitted.
> 
> Lower the GPIO CS between bursts to avoid the clock being interpreted as
> valid.

I'm afraid this will actually break SPI NORs for example where CS actually splits
transactions.

Isn't Amjad change enough ? The CLK pull-up should avoid this.

If it's not the case, then it's an HW issue and the CLK line pull-up is too weak and an
external pull should then be added.

> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   drivers/spi/spi-meson-spicc.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index d47f2623a60f..af8d74b53519 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -291,6 +291,10 @@ static inline void meson_spicc_setup_burst(struct meson_spicc_device *spicc)
>   static irqreturn_t meson_spicc_irq(int irq, void *data)
>   {
>   	struct meson_spicc_device *spicc = (void *) data;
> +	struct spi_device *spi_dev;
> +
> +	spi_dev = spicc->message->spi;
> +	gpiod_set_value(spi_dev->cs_gpiod, 0);
>   
>   	writel_bits_relaxed(SPICC_TC, SPICC_TC, spicc->base + SPICC_STATREG);
>   
> @@ -309,6 +313,8 @@ static irqreturn_t meson_spicc_irq(int irq, void *data)
>   	/* Setup burst */
>   	meson_spicc_setup_burst(spicc);
>   
> +	gpiod_set_value(spi_dev->cs_gpiod, 1);
> +
>   	/* Start burst */
>   	writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPICC_CONREG);
>   
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
