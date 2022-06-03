Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599E6C43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 16:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2YZz6YmckJ4cIeP1KehVs5zgLa/qZKic/xV5kDZEdk=; b=IiutAAyvp62jgP
	L7b8g7ZN5z/cxoNpOqjSzlkrLx686ol3L/YaYyYfuDxXqE3qtxi9WeyS/PsMrmsV8BMgc6CtNWP5D
	rcTMT8SP2xcoDzdsPbCID+ctJwm7DESoFHL+u0moe6yklNgwYeOs5UAF+gGMrrRvGShZ0iVDeifoy
	7WX5JYK9+yMf7qothmDCdgW01PCKRogPSha6Cu+XZqW5mhPBmlkEbHLzvTEmZb6MfaVML2fkvm8nN
	exdN8Kvren3zxnjc/a46SWKRs1vN/YWr3rlnAXWW7A8lCyKv9ni841bZXDm/YT3avybOjD72Ed9nX
	jWsCDXCS3EhrA+BaeQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9uR-0087fC-Ej; Fri, 03 Jun 2022 16:12:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9uO-0087eD-3w; Fri, 03 Jun 2022 16:12:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D087AB82371;
	Fri,  3 Jun 2022 16:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3980C385A9;
	Fri,  3 Jun 2022 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654272737;
	bh=O9M5jqdylfIYfPPpysrTSvpb5Slsp0Ov8SEYrUNJiRs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KQVT60gjcauzcYjwva9tzOpQ2w+i89jrkPNenFv4Y74edbsCMOv5m50Ec+jofIe6c
	 C+EqPf6Wd3vnsieZ/Pj72WbHbtO8ihiv/EcpJaRbpkB0gwr2vdde1wEzgaSkkO7kWI
	 U1ZXQjPAAzB3ZfvBZp3sdsRAf+PUn9shAuYbCmnvdPzmWIZu8nO/z8+jRdxvnLqHXS
	 0l9fy9HXF4CPmfmAPCluDMT7BySyzznnWyM3jXzsNjHORYgGJ2P6vjq3ZRY+rU0lqk
	 xfiWFz79f+EI8EyMMyihqFD0APlz6dfM/abhxLHRhYVy4w+6P01L1/3Ew+ftJQjmKe
	 wiOfUL8KR8bLA==
Date: Fri, 3 Jun 2022 17:21:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Lars-Peter
 Clausen <lars@metafoo.de>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/6] iio: adc: meson_saradc: Align messages to be
 with physical device prefix
Message-ID: <20220603172117.792ce869@jic23-huawei>
In-Reply-To: <20220603100004.70336-2-andriy.shevchenko@linux.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
	<20220603100004.70336-2-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_091220_346883_11B501F5 
X-CRM114-Status: GOOD (  20.55  )
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

On Fri,  3 Jun 2022 13:00:00 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> Align messages to be printed with the physical device prefix as it's done
> everywhere else in this driver.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Here I'm fine with the use of the parent as can only happen after all
the setup is done, so it's obvious the parent will be assigned
(some might argue it is obvious in the previous patch, but I had to check
as I couldn't remember when we set it :)

Anyhow, LGTM. 
> ---
> v3: new patch (inspired by previous change)
>  drivers/iio/adc/meson_saradc.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 4fe6b997cd03..658047370db0 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -345,6 +345,7 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
>  					 int *val)
>  {
>  	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
> +	struct device *dev = indio_dev->dev.parent;
>  	int regval, fifo_chan, fifo_val, count;
>  
>  	if (!wait_for_completion_timeout(&priv->done,
> @@ -353,16 +354,14 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,
>  
>  	count = meson_sar_adc_get_fifo_count(indio_dev);
>  	if (count != 1) {
> -		dev_err(&indio_dev->dev,
> -			"ADC FIFO has %d element(s) instead of one\n", count);
> +		dev_err(dev, "ADC FIFO has %d element(s) instead of one\n", count);
>  		return -EINVAL;
>  	}
>  
>  	regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
>  	fifo_chan = FIELD_GET(MESON_SAR_ADC_FIFO_RD_CHAN_ID_MASK, regval);
>  	if (fifo_chan != chan->address) {
> -		dev_err(&indio_dev->dev,
> -			"ADC FIFO entry belongs to channel %d instead of %lu\n",
> +		dev_err(dev, "ADC FIFO entry belongs to channel %d instead of %lu\n",
>  			fifo_chan, chan->address);
>  		return -EINVAL;
>  	}


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
