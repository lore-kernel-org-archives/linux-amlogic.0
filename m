Return-Path: <SRS0=08rP=XX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 051A5C4360C
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Sep 2019 06:47:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C88E820815
	for <linux-amlogic@archiver.kernel.org>; Sat, 28 Sep 2019 06:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ayhN3BCe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C88E820815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hofr.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rr51czSOb3Rr1fry3EN2wAf2yUA1oZ/rmgZ/697Sdg=; b=ayhN3BCe63aJu3
	MTmwj65zFt2tX2uw/FI3b/wQsCRQCpVbn5Ya70DaR3+0BLGvQ/EpLAJQE/yafQ5E19JjehfR/liuu
	XPxrjQqnH3vSflx3yFdnLTW0KlEyHs6yvgXbI9L6jWkjq3P9vCOMj7AZJxVY+vQZYQAn+pFWsOGsf
	MrPJfKBMGTv5Gd6rrliubegebI4mKb6V51X0DAdv1ks7Jiv+jIqe8ZMbt05w/gztNGk0K3IHqRACm
	/STMgRZhQh0BdxPuUFfMGqsEX8MlFEZ9+860fyevHgfEkVjne6/ptbfWY2+rrylC1sT5rdXSPK2sg
	nwKYO1H2MBjKtVUvH+XQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iE6W8-0002TS-Iy; Sat, 28 Sep 2019 06:47:44 +0000
Received: from 178.115.242.59.static.drei.at ([178.115.242.59]
 helo=mail.osadl.at)
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iE6W3-0002Rx-06; Sat, 28 Sep 2019 06:47:41 +0000
Received: by mail.osadl.at (Postfix, from userid 1001)
 id 98F565C0864; Sat, 28 Sep 2019 08:47:20 +0200 (CEST)
Date: Sat, 28 Sep 2019 08:47:20 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Yizhuo <yzhai003@ucr.edu>
Subject: Re: [PATCH] iio: adc: meson-saradc: Variables could be uninitalized
 if regmap_read() fails
Message-ID: <20190928064720.GA24515@osadl.at>
References: <20190928004642.28932-1-yzhai003@ucr.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190928004642.28932-1-yzhai003@ucr.edu>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_234739_403827_9E91FEDA 
X-CRM114-Status: GOOD (  18.73  )
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
Cc: csong@cs.ucr.edu, Lars-Peter Clausen <lars@metafoo.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Nicholas Mc Guire <hofrat@osadl.org>,
 zhiyunq@cs.ucr.edu, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Hartmut Knaack <knaack.h@gmx.de>,
 linux-amlogic@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Sep 27, 2019 at 05:46:41PM -0700, Yizhuo wrote:
> Several functions in this file are trying to use regmap_read() to
> initialize the specific variable, however, if regmap_read() fails,
> the variable could be uninitialized but used directly, which is
> potentially unsafe. The return value of regmap_read() should be
> checked and handled.
> 
> Signed-off-by: Yizhuo <yzhai003@ucr.edu>

Just a few minor style issues - contentwise it look correct to me.
Reviewed-by: Nicholas Mc Guire <hofrat@osadl.org>

> ---
>  drivers/iio/adc/meson_saradc.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 7b28d045d271..c032a64108b4 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -323,6 +323,7 @@ static int meson_sar_adc_wait_busy_clear(struct iio_dev *indio_dev)
>  {
>  	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
>  	int regval, timeout = 10000;
> +	int ret;
>  
>  	/*
>  	 * NOTE: we need a small delay before reading the status, otherwise
> @@ -331,7 +332,9 @@ static int meson_sar_adc_wait_busy_clear(struct iio_dev *indio_dev)
>  	 */
>  	do {
>  		udelay(1);
> -		regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
> +		ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
> +		if (ret)
> +			return ret;
>  	} while (FIELD_GET(MESON_SAR_ADC_REG0_BUSY_MASK, regval) && timeout--);
>  
>  	if (timeout < 0)
> @@ -358,7 +361,11 @@ static int meson_sar_adc_read_raw_sample(struct iio_dev *indio_dev,

any reason not to declear ret in the declaration block ?
so just for consistency with coding style within meson_saradc.c
this might be:

	int regval, fifo_chan, fifo_val, count;
+	int ret;

>  		return -EINVAL;
>  	}
>  
> -	regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);
> +	int ret = regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);

+	ret = regmap_read(priv->regmap, MESON_SAR_ADC_FIFO_RD, &regval);

> +
> +	if (ret)
> +		return ret;
> +
>  	fifo_chan = FIELD_GET(MESON_SAR_ADC_FIFO_RD_CHAN_ID_MASK, regval);
>  	if (fifo_chan != chan->address) {
>  		dev_err(&indio_dev->dev,
> @@ -491,6 +498,7 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
>  {
>  	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
>  	int val, timeout = 10000;
> +	int ret;
>  
>  	mutex_lock(&indio_dev->mlock);
>  
> @@ -506,7 +514,10 @@ static int meson_sar_adc_lock(struct iio_dev *indio_dev)
>  		 */
>  		do {
>  			udelay(1);
> -			regmap_read(priv->regmap, MESON_SAR_ADC_DELAY, &val);
> +			ret = regmap_read(priv->regmap,
> +					MESON_SAR_ADC_DELAY, &val);

checkpatch does not fuss here but the continuation should be alligned
witht the ( here

> +			if (ret)
> +				return ret;
>  		} while (val & MESON_SAR_ADC_DELAY_BL30_BUSY && timeout--);
>  
>  		if (timeout < 0) {
> @@ -784,7 +795,10 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
>  		 * BL30 to make sure BL30 gets the values it expects when
>  		 * reading the temperature sensor.
>  		 */
> -		regmap_read(priv->regmap, MESON_SAR_ADC_REG3, &regval);
> +		ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG3, &regval);
> +		if (ret)
> +			return ret;
> +
>  		if (regval & MESON_SAR_ADC_REG3_BL30_INITIALIZED)
>  			return 0;
>  	}
> @@ -1014,7 +1028,11 @@ static irqreturn_t meson_sar_adc_irq(int irq, void *data)
>  	unsigned int cnt, threshold;
>  	u32 regval;

same as above

+       int ret;

>  
> -	regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);
> +	int ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);

+	ret = regmap_read(priv->regmap, MESON_SAR_ADC_REG0, &regval);

> +
> +	if (ret)
> +		return ret;
> +
>  	cnt = FIELD_GET(MESON_SAR_ADC_REG0_FIFO_COUNT_MASK, regval);
>  	threshold = FIELD_GET(MESON_SAR_ADC_REG0_FIFO_CNT_IRQ_MASK, regval);
>  
> -- 
> 2.17.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
