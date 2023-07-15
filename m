Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2A4C001B0
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 17:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqsIKEnqpyeZYqGVZ6UX/l1aiisQ3XSe+7Xu31GgScc=; b=Wql5TUNr4ZhDbG
	wl2GROCMKgyO0O8TrA5vFvKrd6w2lr0jOKWycfVRa67hkZI8C8vrY1CJutqUUSzhO92ak3wJjiC8i
	RXcnyGN3Y+s6+///mAaPF1/u+RcOx1T6rrcM3Np8Xp6KxKdTFsWaqstpdyTPC/T83yhGkWpLmpRcL
	rCjERbx+X6Dvi+d+BOOvSwGvlo+2i9O7LYsuDVjPjvzPKUUBjuggNtE7yrr1NyJQEMfksT5AkZsxI
	M8hwIVCVLRf4a8H6C9ZwgQLHRpLcUbrTn2JfVPFXuAWfTy4umdWg8UY5EW9u9L92h4PHeFm6ohKap
	CotTfS9KzYUWyOx02AUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKixb-009DNc-2j;
	Sat, 15 Jul 2023 17:21:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKixZ-009DN4-0o;
	Sat, 15 Jul 2023 17:21:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9BFBD60AB3;
	Sat, 15 Jul 2023 17:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C307DC433C7;
	Sat, 15 Jul 2023 17:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689441691;
	bh=RUrOWlzcFGjuRtgyyAy08XzYxnbzO7uWRniteLSWT24=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qA2RPO5t4Anir7zc9CRpjfaehTA55SBhXjsSQvouR8hOpdjmsUisdGIm5yl6f5w4b
	 PVUbhtuLLy5GGNkh4xAVRR4Mo3ZPj+R9K2YgSxJbHOw9ci8dfBj5EtCUU+gybdtD6G
	 OztM2Z5/KbY+006R7Bv9MbuvZ/h/Tuj7kolnnjc1bPpZCbTaSjyjJeT9RpLHIpvJxt
	 me/5Cs6JmuUHsC4xg8pZb5rgTf1wDRxvhpMVGDDzQrpjaBpZQQkvGaTaOoUwgkNKph
	 bApkVVGSuk1TK6+QymFDYkM1OmiYH9fQmrvqzEsYHSrHJiuYiipKBypgs1GnFrDx8E
	 sKcLE+JTBAlaQ==
Date: Sat, 15 Jul 2023 18:21:21 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: George Stark <gnstark@sberdevices.ru>
Cc: <lars@metafoo.de>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <andriy.shevchenko@linux.intel.com>, <nuno.sa@analog.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 1/1] iio: adc: meson: fix core clock enable/disable
 moment
Message-ID: <20230715182121.29f83d76@jic23-huawei>
In-Reply-To: <20230714190320.308320-2-gnstark@sberdevices.ru>
References: <20230714190320.308320-1-gnstark@sberdevices.ru>
	<20230714190320.308320-2-gnstark@sberdevices.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_102133_392588_3DE74DD1 
X-CRM114-Status: GOOD (  24.52  )
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

On Fri, 14 Jul 2023 22:03:15 +0300
George Stark <gnstark@sberdevices.ru> wrote:

> Enable core clock at probe stage and disable it at remove stage.
> Core clock is responsible for turning on/off the entire SoC module so
> it should be on before the first module register is touched and be off
> at very last moment.
> 
> Signed-off-by: George Stark <gnstark@sberdevices.ru>

This sounds to me like this should perhaps have a fixes tag?

Given where it is in the new sequence you can also use
devm_clk_get_enabled() though that makes a potential backport of
the fix trickier...

I'd go with it anyway as it will make this change quite a bit simpler.

More comments inline

Jonathan

> ---
>  drivers/iio/adc/meson_saradc.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index fe066c9fab83..5a5bb5cc1320 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -1055,12 +1055,6 @@ static int meson_sar_adc_hw_enable(struct iio_dev *indio_dev)
>  		goto err_vref;
>  	}
>  
> -	ret = clk_prepare_enable(priv->core_clk);
> -	if (ret) {
> -		dev_err(dev, "failed to enable core clk\n");
> -		goto err_core_clk;
> -	}
> -
>  	regval = FIELD_PREP(MESON_SAR_ADC_REG0_FIFO_CNT_IRQ_MASK, 1);
>  	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG0,
>  			   MESON_SAR_ADC_REG0_FIFO_CNT_IRQ_MASK, regval);
> @@ -1087,8 +1081,6 @@ static int meson_sar_adc_hw_enable(struct iio_dev *indio_dev)
>  	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
>  			   MESON_SAR_ADC_REG3_ADC_EN, 0);
>  	meson_sar_adc_set_bandgap(indio_dev, false);
> -	clk_disable_unprepare(priv->core_clk);
> -err_core_clk:
>  	regulator_disable(priv->vref);
>  err_vref:
>  	meson_sar_adc_unlock(indio_dev);
> @@ -1116,8 +1108,6 @@ static void meson_sar_adc_hw_disable(struct iio_dev *indio_dev)
>  
>  	meson_sar_adc_set_bandgap(indio_dev, false);
>  
> -	clk_disable_unprepare(priv->core_clk);
> -
>  	regulator_disable(priv->vref);
>  
>  	if (!ret)
> @@ -1420,6 +1410,12 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
>  			ARRAY_SIZE(meson_sar_adc_iio_channels);
>  	}
>  
> +	ret = clk_prepare_enable(priv->core_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable core clk\n");
> +		goto err;

If clk_prepare_enable() failed, then you shoudl not call clk_disable_unprepare()

> +	}
> +
>  	ret = meson_sar_adc_init(indio_dev);
>  	if (ret)
>  		goto err;
> @@ -1445,17 +1441,21 @@ static int meson_sar_adc_probe(struct platform_device *pdev)
>  err_hw:
>  	meson_sar_adc_hw_disable(indio_dev);
>  err:
> +	clk_disable_unprepare(priv->core_clk);

Nothing to do with your patch, but this driver previously did some odd mixing
of direct returns and going to an empty label which definitely doesn't help
make this clear to follow.

>  	return ret;
>  }
>  
>  static int meson_sar_adc_remove(struct platform_device *pdev)
>  {
>  	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
> +	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
>  
>  	iio_device_unregister(indio_dev);
>  
>  	meson_sar_adc_hw_disable(indio_dev);
>  
> +	clk_disable_unprepare(priv->core_clk);
> +
>  	return 0;
>  }
>  


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
