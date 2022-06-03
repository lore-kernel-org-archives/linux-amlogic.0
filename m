Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8084C43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOl2J2zUaABLnGgnol3a+yrfbqRFBZMAlHfX8sQYjSI=; b=yr2RWOiPFBhvKq
	P3nqxlcbV8DAsfdECIPPOMWc2lNp+9s82TlK/AJ0aiKKDdFf63B6VmshgKYpMZLbyUSXw6JmU/zvM
	bbdsJF0BL4t3yKA0I3YAX2rF7PDPgkGCvfdfl+cac5EVQG8kgSu66FGtGkbOdxowI3jdaev2rIAui
	4lUkYcTJTC20EumXVuMf4UWTcE7DrPFSQ3vn96xoN9/SoXoWeQzktZlQFsNqxyMdYBtmu1xv98JjZ
	+ijwHJsh7VN3f7nLQoq/v5DNLBids8+OAHGIaD23/OriookhmSYpNKB6qcRWNzDgn8VxW/RmTcjut
	/PtGiYXyw9wAHtOqVHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9fr-0085nJ-8L; Fri, 03 Jun 2022 15:57:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9fm-0085lw-Fp; Fri, 03 Jun 2022 15:57:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 831C661904;
	Fri,  3 Jun 2022 15:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E519C385A9;
	Fri,  3 Jun 2022 15:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654271832;
	bh=HoAH8VUSJkTU91dOsuHMUpmGc42O1/PdsZRIM1Rg2LM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ibh+E3eXNswhfW0vlgaHdmD7Hj1o8MVbv/7ztFjLNsWTxRqu4l6DCdN7+DdxN7EOf
	 k4inn4zBbmxDKeTDVZfk7Pm0PXNaLlqphv474X53BPZhzQfpr6+busQS9A/0ECkdcB
	 cDfLLUUIeF6GlLDqCWWsAEsg+S9TJCG/4lp+ar+c3j+z/0XU9ktWHrixwMzrNykUZi
	 9xEB5Oc79xZ0w/6wxyPa4sIiH/ULTUKSmgdKgUGrTE5obhbERL91UvzdQ/s9x6mPbM
	 ePqVVc0lMwqvEKUlNnQbuTO9+CxmybY1UDoSUiEM0v/auy9UPzNlbCYPJNRVg72J1l
	 Yf3jVEapZk8EA==
Date: Fri, 3 Jun 2022 17:06:12 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/6] iio: adc: meson_saradc: Don't attach managed
 resource to IIO device object
Message-ID: <20220603170612.561edfbf@jic23-huawei>
In-Reply-To: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_085714_679632_E83CDF30 
X-CRM114-Status: GOOD (  25.72  )
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

On Fri,  3 Jun 2022 12:59:59 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> It feels wrong and actually inconsistent to attach managed resources
> to the IIO device object, which is child of the physical device object.
> The rest of the ->probe() calls do that against physical device.
> 
> Resolve this by reassigning managed resources to the physical device object.
> 
> Fixes: 3adbf3427330 ("iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs")
> Suggested-by: Lars-Peter Clausen <lars@metafoo.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Hi Andy,

This has come up a few times in the past (and we elected to not clean it up
at the time, though it wasn't a decision to never do so!)

It would definitely be wrong if we had another driver binding against
the resulting created device (funnily enough I reported a bug on a driver
doing just that earlier this week), but in this case it's harmless because the
the tear down will occur with a put_device() ultimately calling device_release()
and devres_release_all()

https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L2211

Has a comment that covers this case (more or less).
"
	 * Some platform devices are driven without driver attached
	 * and managed resources may have been acquired.  Make sure
	 * all resources are released.
"

Now, I definitely agree with your statement that it's a bit inconsistent to
do this, just not the fixes tag.

One other suggestion below.


> ---
> v3: new fix-patch
>  drivers/iio/adc/meson_saradc.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 62cc6fb0ef85..4fe6b997cd03 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -650,11 +650,11 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
>  				  void __iomem *base)
>  {
>  	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
> +	struct device *dev = indio_dev->dev.parent;

I'd slightly prefer the device was passed in explicitly to this function rather
than using the parent assignment which feels a little fragile. 


>  	struct clk_init_data init;
>  	const char *clk_parents[1];
>  
> -	init.name = devm_kasprintf(&indio_dev->dev, GFP_KERNEL, "%s#adc_div",
> -				   dev_name(indio_dev->dev.parent));
> +	init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#adc_div", dev_name(dev));
>  	if (!init.name)
>  		return -ENOMEM;
>  
> @@ -670,13 +670,11 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
>  	priv->clk_div.hw.init = &init;
>  	priv->clk_div.flags = 0;
>  
> -	priv->adc_div_clk = devm_clk_register(&indio_dev->dev,
> -					      &priv->clk_div.hw);
> +	priv->adc_div_clk = devm_clk_register(dev, &priv->clk_div.hw);
>  	if (WARN_ON(IS_ERR(priv->adc_div_clk)))
>  		return PTR_ERR(priv->adc_div_clk);
>  
> -	init.name = devm_kasprintf(&indio_dev->dev, GFP_KERNEL, "%s#adc_en",
> -				   dev_name(indio_dev->dev.parent));
> +	init.name = devm_kasprintf(dev, GFP_KERNEL, "%s#adc_en", dev_name(dev));
>  	if (!init.name)
>  		return -ENOMEM;
>  
> @@ -690,7 +688,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
>  	priv->clk_gate.bit_idx = __ffs(MESON_SAR_ADC_REG3_CLK_EN);
>  	priv->clk_gate.hw.init = &init;
>  
> -	priv->adc_clk = devm_clk_register(&indio_dev->dev, &priv->clk_gate.hw);
> +	priv->adc_clk = devm_clk_register(dev, &priv->clk_gate.hw);
>  	if (WARN_ON(IS_ERR(priv->adc_clk)))
>  		return PTR_ERR(priv->adc_clk);
>  


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
