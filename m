Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CF2EB64D9
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Jul 2023 09:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o3qAUDvRPYzcllSbBSlE4S9lxcetwjDjXgAxIWpH3KQ=; b=Q0tUOs5izigQND
	79zESTVcUkfkqP2Feo4h4pQITx6v8LMyxY4Lp0DeCOLovEWTpGeNsV6p++YsZNYBcLHL3rIQ60iaN
	SqBh4EwP0yeT7CgIeBd3YqT2UELXYNxG7W+MKFWfBhBu+x/IoW1zg47RiQxdUgfSx3AD6AXh7BubV
	Q2Ce4VCZnxQmVEgkBoZsr+S83NEp6C9AIz8QoozxPJDcjFhhX5n1K4DuEMfMbX8vyHg+rsAb+JS1L
	zxv6n7Ovg7iPja3UdQOrOl5IQTnT+CP9opbGIFNaDAQUw3n+2rOn3rgvrToXbpAfROxAdFJx2YbR3
	2r1RqnIDBNQ0t64XFVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtC0-007Sxr-0L;
	Sun, 02 Jul 2023 09:16:28 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtBw-007SxK-2i;
	Sun, 02 Jul 2023 09:16:26 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Qv3Hn5sfCz6D8fQ;
	Sun,  2 Jul 2023 17:13:09 +0800 (CST)
Received: from localhost (10.48.51.211) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 2 Jul
 2023 10:16:19 +0100
Date: Sun, 2 Jul 2023 17:16:14 +0800
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: George Stark <gnstark@sberdevices.ru>
CC: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v3 4/5] meson saradc: add channel labels
Message-ID: <20230702171614.00000480@Huawei.com>
In-Reply-To: <20230627224017.1724097-5-gnstark@sberdevices.ru>
References: <20230627224017.1724097-1-gnstark@sberdevices.ru>
	<20230627224017.1724097-5-gnstark@sberdevices.ru>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.48.51.211]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_021625_176014_37018051 
X-CRM114-Status: GOOD (  12.54  )
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

On Wed, 28 Jun 2023 01:37:17 +0300
George Stark <gnstark@sberdevices.ru> wrote:

> Add attribute 'label' to all iio channels.

Why?  Reasoning is more useful here than a simple statement of 'what'.

> 
> Signed-off-by: George Stark <GNStark@sberdevices.ru>
> ---
>  drivers/iio/adc/meson_saradc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index b87f05dfb322..85970fe852af 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -1058,8 +1058,20 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
>  	return ret;
>  }
>  
> +static int read_label(struct iio_dev *indio_dev,
> +		      struct iio_chan_spec const *chan,
> +		      char *label)
> +{
> +	if (chan->type == IIO_TEMP)
> +		return sprintf(label, "%s\n", "temp-sensor");
> +	if (chan->type == IIO_VOLTAGE)
> +		return sprintf(label, "channel-%d\n", chan->channel);
> +	return 0;
> +}
> +
>  static const struct iio_info meson_sar_adc_iio_info = {
>  	.read_raw = meson_sar_adc_iio_info_read_raw,
> +	.read_label = read_label,
>  };
>  
>  static const struct meson_sar_adc_param meson_sar_adc_meson8_param = {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
