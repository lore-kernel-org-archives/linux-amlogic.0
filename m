Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707A4C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Sep 2021 16:52:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DDD7610A2
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Sep 2021 16:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DDD7610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03s/hRmlJM5f6tX0JqbOITCU+QUG5NcDYR5d0ce2oTk=; b=DNAojnT9SuE8lW
	1S5880mrTAU0S9neqv5mM6Wiyp8weo50llk1B6uZDBmWUV1ZJ5IdWASAPkRVWptukq6xYjOLk3pSu
	69r0YgE9uunZL9reeNZG+7VY5vZ38Y4pa8L3S/jIV+Np0jIifMyNcE4tnWtJRe6TMR1txu0OEo9v7
	7sdOhgmE8IyB1blmqzfNcM29lkTBlAL7hHX1+1oHY22ETle8TaMz4BDhNY8rAE02Qbfxn7q9Te5qI
	VKE/+x+Q/7eu8DOE+r3mcZwE8qSuratWM4iPRUGldmflePFl4lstnksfTK7rUGSZcWBaFG9GqOJ7r
	1nAhkXWVgJWwFflM+xzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVcoR-00BsPM-42; Wed, 29 Sep 2021 16:52:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVcoO-00BsOf-UR; Wed, 29 Sep 2021 16:52:06 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37C1361411;
 Wed, 29 Sep 2021 16:51:57 +0000 (UTC)
Date: Wed, 29 Sep 2021 17:55:51 +0100
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
Subject: Re: [PATCH v3 8/9] iio: adc: rockchip_saradc: Make use of the
 helper function dev_err_probe()
Message-ID: <20210929175551.7517b018@jic23-huawei>
In-Reply-To: <20210928141956.2148-8-caihuoqing@baidu.com>
References: <20210928141956.2148-1-caihuoqing@baidu.com>
 <20210928141956.2148-8-caihuoqing@baidu.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_095205_053550_9FEA99F7 
X-CRM114-Status: GOOD (  24.37  )
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

On Tue, 28 Sep 2021 22:19:54 +0800
Cai Huoqing <caihuoqing@baidu.com> wrote:

> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

In this driver, there is also a call to
devm_reset_control_get_exclusive() which I think can return
-EPROBE_DEFER

There isn't a message printed on that particular patch, but it would
be good to add something generic. Same for platform_get_irq()

There are some devm_clk_get() calls as well which likewise probably
want handling in a similar fashion as you have done in other patches.

Thanks,

Jonathan


> ---
> v1->v2: Remove the separate line of PTR_ERR().
> 
>  drivers/iio/adc/rockchip_saradc.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/adc/rockchip_saradc.c b/drivers/iio/adc/rockchip_saradc.c
> index a56a0d7337ca..57419ccb3c70 100644
> --- a/drivers/iio/adc/rockchip_saradc.c
> +++ b/drivers/iio/adc/rockchip_saradc.c
> @@ -392,11 +392,9 @@ static int rockchip_saradc_probe(struct platform_device *pdev)
>  	}
>  
>  	info->vref = devm_regulator_get(&pdev->dev, "vref");
> -	if (IS_ERR(info->vref)) {
> -		dev_err(&pdev->dev, "failed to get regulator, %ld\n",
> -			PTR_ERR(info->vref));
> -		return PTR_ERR(info->vref);
> -	}
> +	if (IS_ERR(info->vref))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(info->vref),
> +				     "failed to get regulator\n");
>  
>  	if (info->reset)
>  		rockchip_saradc_reset_controller(info->reset);


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
