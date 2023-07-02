Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CCDEB64D9
	for <linux-amlogic@archiver.kernel.org>; Sun,  2 Jul 2023 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJqIAYK5QtE5MsUSsG4OBqdb+lsIp2q8elWYcJI9E/U=; b=lahmbptUE/kgX7
	f4JoSRnhJBxCPsWaGLzecwNaiNRcxHsaI2tg7mEAQ+HgGh7+GYRE9s4gsvfqM7u43DW8E5SQAksCK
	MzjAxgz7Tkbx0PBmvkjco6iFa20zMzXNwnxnq46dTowZbEXW8y/52GVFJbqLelpzLEoeOSnm3cxrq
	A0w1gaOiUhnIfiWSM8dsFq9voYGpIusyZ2iw5/F814KMulNcTp7/BVk3N/SP6mm0e5qZCSp3DaLtx
	BEnAdm8pjO6z7Iho0mNMpdp7xCZy0hX55B1CflDA1OGEZ9R+USGz9duaRhsut8+JhVARwmPsBKEPV
	0gyGjFHAdf77vLcV5WsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFtA1-007SfL-0N;
	Sun, 02 Jul 2023 09:14:25 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFt9y-007Sej-0H;
	Sun, 02 Jul 2023 09:14:23 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Qv3FP6ld2z67pnp;
	Sun,  2 Jul 2023 17:11:05 +0800 (CST)
Received: from localhost (10.48.51.211) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sun, 2 Jul
 2023 10:14:15 +0100
Date: Sun, 2 Jul 2023 17:14:10 +0800
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: George Stark <gnstark@sberdevices.ru>
CC: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v3 1/5] meson saradc: move enums declaration before
 variables declaration
Message-ID: <20230702171410.00007827@Huawei.com>
In-Reply-To: <20230627224017.1724097-2-gnstark@sberdevices.ru>
References: <20230627224017.1724097-1-gnstark@sberdevices.ru>
	<20230627224017.1724097-2-gnstark@sberdevices.ru>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.48.51.211]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_021422_563146_AD1B15F3 
X-CRM114-Status: GOOD (  13.94  )
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

On Wed, 28 Jun 2023 01:37:14 +0300
George Stark <gnstark@sberdevices.ru> wrote:

> Move enums declaration before variables declaration.
> 
This is fairly harmless, but would be nice to say 'why'.
Is this just for consistency with the rest of the driver or will
it be required after changes later in the patch set?

> Signed-off-by: George Stark <GNStark@sberdevices.ru>
> ---
>  drivers/iio/adc/meson_saradc.c | 44 +++++++++++++++++-----------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 18937a262af6..af38d95bd504 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -202,6 +202,28 @@
>  	.datasheet_name = "TEMP_SENSOR",				\
>  }
>  
> +enum meson_sar_adc_avg_mode {
> +	NO_AVERAGING = 0x0,
> +	MEAN_AVERAGING = 0x1,
> +	MEDIAN_AVERAGING = 0x2,
> +};
> +
> +enum meson_sar_adc_num_samples {
> +	ONE_SAMPLE = 0x0,
> +	TWO_SAMPLES = 0x1,
> +	FOUR_SAMPLES = 0x2,
> +	EIGHT_SAMPLES = 0x3,
> +};
> +
> +enum meson_sar_adc_chan7_mux_sel {
> +	CHAN7_MUX_VSS = 0x0,
> +	CHAN7_MUX_VDD_DIV4 = 0x1,
> +	CHAN7_MUX_VDD_DIV2 = 0x2,
> +	CHAN7_MUX_VDD_MUL3_DIV4 = 0x3,
> +	CHAN7_MUX_VDD = 0x4,
> +	CHAN7_MUX_CH7_INPUT = 0x7,
> +};
> +
>  static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
>  	MESON_SAR_ADC_CHAN(0),
>  	MESON_SAR_ADC_CHAN(1),
> @@ -227,28 +249,6 @@ static const struct iio_chan_spec meson_sar_adc_and_temp_iio_channels[] = {
>  	IIO_CHAN_SOFT_TIMESTAMP(9),
>  };
>  
> -enum meson_sar_adc_avg_mode {
> -	NO_AVERAGING = 0x0,
> -	MEAN_AVERAGING = 0x1,
> -	MEDIAN_AVERAGING = 0x2,
> -};
> -
> -enum meson_sar_adc_num_samples {
> -	ONE_SAMPLE = 0x0,
> -	TWO_SAMPLES = 0x1,
> -	FOUR_SAMPLES = 0x2,
> -	EIGHT_SAMPLES = 0x3,
> -};
> -
> -enum meson_sar_adc_chan7_mux_sel {
> -	CHAN7_MUX_VSS = 0x0,
> -	CHAN7_MUX_VDD_DIV4 = 0x1,
> -	CHAN7_MUX_VDD_DIV2 = 0x2,
> -	CHAN7_MUX_VDD_MUL3_DIV4 = 0x3,
> -	CHAN7_MUX_VDD = 0x4,
> -	CHAN7_MUX_CH7_INPUT = 0x7,
> -};
> -
>  struct meson_sar_adc_param {
>  	bool					has_bl30_integration;
>  	unsigned long				clock_rate;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
