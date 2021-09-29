Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29E4C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Sep 2021 16:22:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6D6613DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Sep 2021 16:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE6D6613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHwMqU4tFQBq5aekdaoFaeEUekGpg5oA9m/Dz9UutRM=; b=KiBvmNmlO384jq
	w3K4U21lnDhA3CLMSrzIRIxeIRngRLn2rvCg4BqNwTtkhP7d+E8L4R/w8LIFbtXo4kQ05UhHAigy2
	zEbLAx226coC8KRU/1YBhVYL5v6U7zieMazEm+MU09p4Ga5/ACQvT0r1yLqlz7uavnbqoluAF/jEl
	Rv9ODqoWKlBEV4TiE9Wlkn7j8EyW12BkRjEByEs1xCv82qK4NB1C6nGWBojIp1O+imvQ++9HfsLD2
	YDMkUMPci+xq56rAGqTgv97M2Y3ooS8UnKPqzE4dojVUd7N9EVMBfVk9GgSvaouGf/65MMtC+H31a
	YvRDb8xfmfdGHM+NGZ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVcLy-00BnAP-8f; Wed, 29 Sep 2021 16:22:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVcLv-00Bn8q-Ec; Wed, 29 Sep 2021 16:22:40 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 275C461246;
 Wed, 29 Sep 2021 16:22:32 +0000 (UTC)
Date: Wed, 29 Sep 2021 17:26:27 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "NXP Linux
 Team" <linux-imx@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, "Neil
 Armstrong" <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Andy Gross <agross@kernel.org>,
 "Bjorn Andersson" <bjorn.andersson@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, <linux-arm-kernel@lists.infradead.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v3 2/9] iio: adc: imx7d_adc: Make use of the helper
 function dev_err_probe()
Message-ID: <20210929172627.1dfd4f17@jic23-huawei>
In-Reply-To: <20210928141956.2148-2-caihuoqing@baidu.com>
References: <20210928141956.2148-1-caihuoqing@baidu.com>
 <20210928141956.2148-2-caihuoqing@baidu.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_092239_548116_17816E3D 
X-CRM114-Status: GOOD (  20.65  )
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

On Tue, 28 Sep 2021 22:19:48 +0800
Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
Hi Cai,

It is currently not printing a message, but should we handle the same
for platform_get_irq?

One other minor comment inline.  Actual change here is fine.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/imx7d_adc.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/adc/imx7d_adc.c b/drivers/iio/adc/imx7d_adc.c
> index 4969a5f941e3..f47360cbff3b 100644
> --- a/drivers/iio/adc/imx7d_adc.c
> +++ b/drivers/iio/adc/imx7d_adc.c
> @@ -496,19 +496,13 @@ static int imx7d_adc_probe(struct platform_device *pdev)
>  		return irq;
>  
>  	info->clk = devm_clk_get(dev, "adc");
> -	if (IS_ERR(info->clk)) {
> -		ret = PTR_ERR(info->clk);
> -		dev_err(dev, "Failed getting clock, err = %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(info->clk))
> +		return dev_err_probe(dev, PTR_ERR(info->clk), "Failed getting clock\n");

Where it doesn't hurt readabilty preferred to keep below 80 chars.

>  
>  	info->vref = devm_regulator_get(dev, "vref");
> -	if (IS_ERR(info->vref)) {
> -		ret = PTR_ERR(info->vref);
> -		dev_err(dev,
> -			"Failed getting reference voltage, err = %d\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(info->vref))
> +		return dev_err_probe(dev, PTR_ERR(info->vref),
> +				     "Failed getting reference voltage\n");
>  
>  	platform_set_drvdata(pdev, indio_dev);
>  


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
