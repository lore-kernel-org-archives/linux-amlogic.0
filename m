Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D60C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Sep 2021 16:36:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37274613DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Sep 2021 16:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37274613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQxS8ZVrJCeD3VWwqR+lKRDkiZNLEU7KAZBdpHJpbw0=; b=KjsIf5Fik5CcDN
	cnqx2L1pQA8QRhtn5w6t8/K3EBpmMatP7gAYrjtekE5fLy+YAtYfJ40zpGEXF7xCiU08d/NLaCQXL
	7vc+/xIfFvPK3aufOtXNk4gbFgpFxay8iCDLNkXwTm6WU82zQGJylQo4v6wi0f5/bcpfK+MGxnKWA
	QAJbALMcYzFugAnzIe7TpZuabBaIX88hu+AXf0gn19bJkLY0U+fY2vhhv5FOURaHiiEcsn0ERO6SK
	41VeKQHf1/GOa4bao2VPciN7A4nTbK/dqtDG9TAC07yo+va3zM0cDoxf2Kfv6q8QxyyRI0NEqgX56
	QZ+mZlJ0wsZtGlXVmmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVcZO-00Bpym-Gw; Wed, 29 Sep 2021 16:36:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVcZL-00Bpy9-Mb; Wed, 29 Sep 2021 16:36:32 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFC20613D0;
 Wed, 29 Sep 2021 16:36:25 +0000 (UTC)
Date: Wed, 29 Sep 2021 17:40:19 +0100
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
Subject: Re: [PATCH v3 5/9] iio: adc: max1241: Make use of the helper
 function dev_err_probe()
Message-ID: <20210929174019.3f93dfde@jic23-huawei>
In-Reply-To: <20210928141956.2148-5-caihuoqing@baidu.com>
References: <20210928141956.2148-1-caihuoqing@baidu.com>
 <20210928141956.2148-5-caihuoqing@baidu.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_093631_790794_215E39A0 
X-CRM114-Status: GOOD (  20.33  )
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

On Tue, 28 Sep 2021 22:19:51 +0800
Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
Hi Cai,

Please also add a message to the
devm_gpiod_get_optional() and similar handling so that we
maintain information on that as well.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/max1241.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iio/adc/max1241.c b/drivers/iio/adc/max1241.c
> index b60f8448f21a..130ca8dc6fa0 100644
> --- a/drivers/iio/adc/max1241.c
> +++ b/drivers/iio/adc/max1241.c
> @@ -148,10 +148,9 @@ static int max1241_probe(struct spi_device *spi)
>  	mutex_init(&adc->lock);
>  
>  	adc->vdd = devm_regulator_get(dev, "vdd");
> -	if (IS_ERR(adc->vdd)) {
> -		dev_err(dev, "failed to get vdd regulator\n");
> -		return PTR_ERR(adc->vdd);
> -	}
> +	if (IS_ERR(adc->vdd))
> +		return dev_err_probe(dev, PTR_ERR(adc->vdd),
> +				     "failed to get vdd regulator\n");
>  
>  	ret = regulator_enable(adc->vdd);
>  	if (ret)
> @@ -164,10 +163,9 @@ static int max1241_probe(struct spi_device *spi)
>  	}
>  
>  	adc->vref = devm_regulator_get(dev, "vref");
> -	if (IS_ERR(adc->vref)) {
> -		dev_err(dev, "failed to get vref regulator\n");
> -		return PTR_ERR(adc->vref);
> -	}
> +	if (IS_ERR(adc->vref))
> +		return dev_err_probe(dev, PTR_ERR(adc->vref),
> +				     "failed to get vref regulator\n");
>  
>  	ret = regulator_enable(adc->vref);
>  	if (ret)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
