Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9BDC43461
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 18:36:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C032D2080C
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 18:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gfshwlxf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="knGyXOGF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C032D2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NF2dU+QnJ+LzJ3L7mVI/xC2K+S17K4MVwzByBX7ex2Y=; b=gfshwlxfR1wmlRJFhf1ISfuzj
	GQlhEOd82yH2/w2RlkvtbHb8JQmDcVH4bS6vRzSyR2p0tN+URUCtiy7P4Plf7O5fxORjBIfdCGexg
	3BJO65yTUPu8uXWXkOqa0PoSlqvPw9NoiC/SxU7lzGrl1lvaW0uMBCXahyEl3o0wf9Ggn9VMLyLu+
	ahf9eBK4gXRC0otFV+z+FPIk/oWa1LBeTJl77A3MxA2FQdQTJtkT5MIyacxpNMJHjoj+R5ojI7Y4d
	Fvz7ajR0qef+zUKzzwr86CWlAtN4S+xeGvU6fbUqQajdWHQhtL06qJDuJbwsq+WbLYLKjUvswBM1A
	AUMVvDBlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG4x1-00015l-JT; Wed, 09 Sep 2020 18:36:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG4wy-00015D-QD; Wed, 09 Sep 2020 18:36:09 +0000
Received: from archlinux (cpc149474-cmbg20-2-0-cust94.5-4.cable.virginm.net
 [82.4.196.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B328120C09;
 Wed,  9 Sep 2020 18:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599676567;
 bh=ia9hTJyZgEKfRDINp42R4WNkVvq9pCYrEhY2mO62t5E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=knGyXOGF7f7i/Ki2r7Ku7Scb0TISK5qGEPUfKpe9uiNoehhN5k559yVdz5F+H4eHA
 8xWDS0vile5v7kmyfpeZEJb92c6JNYqo1/kMaas25tZDZym8w0B4ccwCXITaydSann
 1bhIeZEsp06NKSEgL7v2PSAZOv+r3qOgET7c/hFk=
Date: Wed, 9 Sep 2020 19:36:00 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 08/18] iio: adc: stm32: Simplify with dev_err_probe()
Message-ID: <20200909193600.41970d8c@archlinux>
In-Reply-To: <20200829064726.26268-8-krzk@kernel.org>
References: <20200829064726.26268-1-krzk@kernel.org>
 <20200829064726.26268-8-krzk@kernel.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_143609_050673_80F76811 
X-CRM114-Status: GOOD (  26.78  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Marek Vasut <marek.vasut@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 linux-amlogic@lists.infradead.org, Peter Rosin <peda@axentia.se>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 29 Aug 2020 08:47:16 +0200
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
I don't have the thread to hand, but this tripped a warning next
and the patch was dropped as a result. See below.

Jonathan
> ---
> 
> Changes since v2:
> 1. Wrap dev_err_probe() lines at 80 character
> 
> Changes since v1:
> 1. Convert to devm_clk_get_optional
> 2. Update also stm32-dfsdm-core and stm32-dac-core.
> 3. Wrap around 100 characters (accepted by checkpatch).
> ---
>  drivers/iio/adc/stm32-adc-core.c   | 75 ++++++++++--------------------
>  drivers/iio/adc/stm32-adc.c        | 10 ++--
>  drivers/iio/adc/stm32-dfsdm-adc.c  | 10 ++--
>  drivers/iio/adc/stm32-dfsdm-core.c |  9 ++--
>  drivers/iio/dac/stm32-dac-core.c   |  5 +-
>  5 files changed, 35 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
> index 0e2068ec068b..3f27b4817a42 100644
> --- a/drivers/iio/adc/stm32-adc-core.c
> +++ b/drivers/iio/adc/stm32-adc-core.c
> @@ -582,11 +582,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  	priv->syscfg = syscon_regmap_lookup_by_phandle(np, "st,syscfg");
>  	if (IS_ERR(priv->syscfg)) {
>  		ret = PTR_ERR(priv->syscfg);
> -		if (ret != -ENODEV) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "Can't probe syscfg: %d\n", ret);
> -			return ret;
> -		}
> +		if (ret != -ENODEV)
> +			return dev_err_probe(dev, ret, "Can't probe syscfg\n");
> +
>  		priv->syscfg = NULL;
>  	}
>  
> @@ -596,12 +594,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  		priv->booster = devm_regulator_get_optional(dev, "booster");
>  		if (IS_ERR(priv->booster)) {
>  			ret = PTR_ERR(priv->booster);
> -			if (ret != -ENODEV) {
> -				if (ret != -EPROBE_DEFER)
> -					dev_err(dev, "can't get booster %d\n",
> -						ret);
> -				return ret;
> -			}
> +			if (ret != -ENODEV)
> +				dev_err_probe(dev, ret, "can't get booster\n");

This tripped a warning and got the patch dropped because we no longer
return on error.

> +
>  			priv->booster = NULL;
>  		}
>  	}
> @@ -612,11 +607,9 @@ static int stm32_adc_core_switches_probe(struct device *dev,
>  		priv->vdd = devm_regulator_get_optional(dev, "vdd");
>  		if (IS_ERR(priv->vdd)) {
>  			ret = PTR_ERR(priv->vdd);
> -			if (ret != -ENODEV) {
> -				if (ret != -EPROBE_DEFER)
> -					dev_err(dev, "can't get vdd %d\n", ret);
> -				return ret;
> -			}
> +			if (ret != -ENODEV)
> +				return dev_err_probe(dev, ret, "can't get vdd\n");
> +
>  			priv->vdd = NULL;
>  		}
>  	}
> @@ -669,42 +662,24 @@ static int stm32_adc_probe(struct platform_device *pdev)
>  	priv->common.phys_base = res->start;
>  
>  	priv->vdda = devm_regulator_get(&pdev->dev, "vdda");
> -	if (IS_ERR(priv->vdda)) {
> -		ret = PTR_ERR(priv->vdda);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "vdda get failed, %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(priv->vdda))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->vdda),
> +				     "vdda get failed\n");
>  
>  	priv->vref = devm_regulator_get(&pdev->dev, "vref");
> -	if (IS_ERR(priv->vref)) {
> -		ret = PTR_ERR(priv->vref);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "vref get failed, %d\n", ret);
> -		return ret;
> -	}
> -
> -	priv->aclk = devm_clk_get(&pdev->dev, "adc");
> -	if (IS_ERR(priv->aclk)) {
> -		ret = PTR_ERR(priv->aclk);
> -		if (ret != -ENOENT) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(&pdev->dev, "Can't get 'adc' clock\n");
> -			return ret;
> -		}
> -		priv->aclk = NULL;
> -	}
> -
> -	priv->bclk = devm_clk_get(&pdev->dev, "bus");
> -	if (IS_ERR(priv->bclk)) {
> -		ret = PTR_ERR(priv->bclk);
> -		if (ret != -ENOENT) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(&pdev->dev, "Can't get 'bus' clock\n");
> -			return ret;
> -		}
> -		priv->bclk = NULL;
> -	}
> +	if (IS_ERR(priv->vref))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->vref),
> +				     "vref get failed\n");
> +
> +	priv->aclk = devm_clk_get_optional(&pdev->dev, "adc");
> +	if (IS_ERR(priv->aclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->aclk),
> +				     "Can't get 'adc' clock\n");
> +
> +	priv->bclk = devm_clk_get_optional(&pdev->dev, "bus");
> +	if (IS_ERR(priv->bclk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->bclk),
> +				     "Can't get 'bus' clock\n");
>  
>  	ret = stm32_adc_core_switches_probe(dev, priv);
>  	if (ret)
> diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
> index 3eb9ebe8372f..b3f31f147347 100644
> --- a/drivers/iio/adc/stm32-adc.c
> +++ b/drivers/iio/adc/stm32-adc.c
> @@ -1805,13 +1805,9 @@ static int stm32_adc_dma_request(struct device *dev, struct iio_dev *indio_dev)
>  	adc->dma_chan = dma_request_chan(dev, "rx");
>  	if (IS_ERR(adc->dma_chan)) {
>  		ret = PTR_ERR(adc->dma_chan);
> -		if (ret != -ENODEV) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev,
> -					"DMA channel request failed with %d\n",
> -					ret);
> -			return ret;
> -		}
> +		if (ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "DMA channel request failed with\n");
>  
>  		/* DMA is optional: fall back to IRQ mode */
>  		adc->dma_chan = NULL;
> diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
> index 5e10fb4f3704..c7e0109315f8 100644
> --- a/drivers/iio/adc/stm32-dfsdm-adc.c
> +++ b/drivers/iio/adc/stm32-dfsdm-adc.c
> @@ -1473,13 +1473,9 @@ static int stm32_dfsdm_adc_init(struct device *dev, struct iio_dev *indio_dev)
>  	/* Optionally request DMA */
>  	ret = stm32_dfsdm_dma_request(dev, indio_dev);
>  	if (ret) {
> -		if (ret != -ENODEV) {
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev,
> -					"DMA channel request failed with %d\n",
> -					ret);
> -			return ret;
> -		}
> +		if (ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "DMA channel request failed with\n");
>  
>  		dev_dbg(dev, "No DMA support\n");
>  		return 0;
> diff --git a/drivers/iio/adc/stm32-dfsdm-core.c b/drivers/iio/adc/stm32-dfsdm-core.c
> index 26e2011c5868..0b8bea88b011 100644
> --- a/drivers/iio/adc/stm32-dfsdm-core.c
> +++ b/drivers/iio/adc/stm32-dfsdm-core.c
> @@ -243,12 +243,9 @@ static int stm32_dfsdm_parse_of(struct platform_device *pdev,
>  	 * on use case.
>  	 */
>  	priv->clk = devm_clk_get(&pdev->dev, "dfsdm");
> -	if (IS_ERR(priv->clk)) {
> -		ret = PTR_ERR(priv->clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Failed to get clock (%d)\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(priv->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(priv->clk),
> +				     "Failed to get clock\n");
>  
>  	priv->aclk = devm_clk_get(&pdev->dev, "audio");
>  	if (IS_ERR(priv->aclk))
> diff --git a/drivers/iio/dac/stm32-dac-core.c b/drivers/iio/dac/stm32-dac-core.c
> index 7e5809ba0dee..906436780347 100644
> --- a/drivers/iio/dac/stm32-dac-core.c
> +++ b/drivers/iio/dac/stm32-dac-core.c
> @@ -150,10 +150,7 @@ static int stm32_dac_probe(struct platform_device *pdev)
>  	rst = devm_reset_control_get_optional_exclusive(dev, NULL);
>  	if (rst) {
>  		if (IS_ERR(rst)) {
> -			ret = PTR_ERR(rst);
> -			if (ret != -EPROBE_DEFER)
> -				dev_err(dev, "reset get failed, %d\n", ret);
> -
> +			ret = dev_err_probe(dev, PTR_ERR(rst), "reset get failed\n");
>  			goto err_hw_stop;
>  		}
>  


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
