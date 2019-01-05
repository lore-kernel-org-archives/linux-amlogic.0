Return-Path: <SRS0=wai9=PN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEB7C43444
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jan 2019 16:41:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DF472087F
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jan 2019 16:41:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxXjH4Hk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pz2cZDP1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DF472087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6cIbn5hjQjTxfJf91ojKD0SS5iiPu9795uw1VeX9Q8=; b=YxXjH4Hk50Exzy
	yfFFlUsX2Qa05Z0zlBxoLoMb4zxA0MunjMzgrmD8je+xKmt9SmdMBzMrW0rxJYS9DvXdRJOA8QeSc
	Oj8TrOesBl6bkg5PiFKlr9YDh39oYwbkVYWxde4zdlvDsSzloB9Ueb3EADV37eCsDeOMJcYFQevdu
	AbgmQgdjC9oqt8xm/XcLg3GrvhgvsCW+OLtF/u6x1UFQMGgpyZYsfKUoRaXVG/GQuZnQWjI5es3WJ
	ZwTS6KCNPC0H8O4EYHwh1V4Rcoujxf9HGMeOG3Psj/n5dDbD+3ECFypAvz7lV80dORFyHGVZa44XV
	pbgcx8vEZTZEkENUbdeQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gfp0n-0002z7-Lv; Sat, 05 Jan 2019 16:41:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gfp0k-0002yh-FL; Sat, 05 Jan 2019 16:41:24 +0000
Received: from archlinux (cpc91196-cmbg18-2-0-cust659.5-4.cable.virginm.net
 [81.96.234.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F4A52085A;
 Sat,  5 Jan 2019 16:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1546706482;
 bh=MEygMgqeG8M0f2Aor83TanJM1pYbahZ3kO+b7rece5M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pz2cZDP1FJw1+o/Tllm71StwEgLCHDLj6WEqMqa+SfzNibCgqB6D1+qGFWOwDS8DX
 fOV2tK+UZEUHUkd6k1ct9Lqlu8zk+G993GLU4rAg31nsDVI1OdbfL7zPr6NjMnlsJa
 VHZwH4EZ/xyeLOfwYoytFfT95ZbGnzhE6j/9YX40=
Date: Sat, 5 Jan 2019 16:41:17 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] iio: adc: meson-saradc: enable the temperature
 sensor two more SoCs
Message-ID: <20190105164117.125fbba8@archlinux>
In-Reply-To: <20181227215020.9803-3-martin.blumenstingl@googlemail.com>
References: <20181227215020.9803-1-martin.blumenstingl@googlemail.com>
 <20181227215020.9803-3-martin.blumenstingl@googlemail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190105_084122_549853_9D75F3B3 
X-CRM114-Status: GOOD (  22.37  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, balbes-150@yandex.ru,
 robh+dt@kernel.org, pmeerw@pmeerw.net, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 27 Dec 2018 22:50:20 +0100
Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Meson8b and Meson8m2 use the same logic to convert the ADC register
> value to celsius, which is different from Meson8:
> - Meson8 has different multiplier and divider values
> - Meson8 uses a 4-bit TSC (temperature sensor coefficient) which fits
>   into the 4-bit field in the MESON_SAR_ADC_DELTA_10 register:
>   MESON_SAR_ADC_DELTA_10_TS_C_MASK. Meson8b and Meson8m2 have a 5-bit
>   TSC which requires writing the upper-most bit into the
>   MESON_HHI_DPLL_TOP_0[9] register from the HHI register area.
> 
> This adds support for the temperature sensor on the Meson8b and Meson8m2
> SoCs by implementing the logic to write the upper-most TSC bit into the
> HHI register area. The SoC-specific values (temperature_trimming_bits,
> temperature_multiplier, temperature_divider) are added - these simply
> integrate into the existing infrastructure (which was implemented for
> Meson8) and thus require no further changes to the existing temperature
> calculation logic.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Applied to the togreg branch of iio.git and pushed out as testing for the
autobuilders to play with it.

Thanks,

Jonathan

> ---
>  drivers/iio/adc/meson_saradc.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 729becb2d3d9..f8600fbcdfe3 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -26,6 +26,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/mfd/syscon.h>
>  
>  #define MESON_SAR_ADC_REG0					0x00
>  	#define MESON_SAR_ADC_REG0_PANEL_DETECT			BIT(31)
> @@ -174,6 +175,9 @@
>  #define MESON_SAR_ADC_EFUSE_BYTE3_UPPER_ADC_VAL			GENMASK(6, 0)
>  #define MESON_SAR_ADC_EFUSE_BYTE3_IS_CALIBRATED			BIT(7)
>  
> +#define MESON_HHI_DPLL_TOP_0					0x318
> +#define MESON_HHI_DPLL_TOP_0_TSC_BIT4				BIT(9)
> +
>  /* for use with IIO_VAL_INT_PLUS_MICRO */
>  #define MILLION							1000000
>  
> @@ -280,6 +284,7 @@ struct meson_sar_adc_priv {
>  	struct completion			done;
>  	int					calibbias;
>  	int					calibscale;
> +	struct regmap				*tsc_regmap;
>  	bool					temperature_sensor_calibrated;
>  	u8					temperature_sensor_coefficient;
>  	u16					temperature_sensor_adc_val;
> @@ -727,6 +732,15 @@ static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>  		return ret;
>  	}
>  
> +	priv->tsc_regmap =
> +		syscon_regmap_lookup_by_phandle(indio_dev->dev.parent->of_node,
> +						"amlogic,hhi-sysctrl");
> +	if (IS_ERR(priv->tsc_regmap)) {
> +		dev_err(indio_dev->dev.parent,
> +			"failed to get amlogic,hhi-sysctrl regmap\n");
> +		return PTR_ERR(priv->tsc_regmap);
> +	}
> +
>  	read_len = MESON_SAR_ADC_EFUSE_BYTES;
>  	buf = nvmem_cell_read(temperature_calib, &read_len);
>  	if (IS_ERR(buf)) {
> @@ -861,6 +875,22 @@ static int meson_sar_adc_init(struct iio_dev *indio_dev)
>  				    priv->temperature_sensor_coefficient);
>  		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELTA_10,
>  				   MESON_SAR_ADC_DELTA_10_TS_C_MASK, regval);
> +
> +		if (priv->param->temperature_trimming_bits == 5) {
> +			if (priv->temperature_sensor_coefficient & BIT(4))
> +				regval = MESON_HHI_DPLL_TOP_0_TSC_BIT4;
> +			else
> +				regval = 0;
> +
> +			/*
> +			 * bit [4] (the 5th bit when starting to count at 1)
> +			 * of the TSC is located in the HHI register area.
> +			 */
> +			regmap_update_bits(priv->tsc_regmap,
> +					   MESON_HHI_DPLL_TOP_0,
> +					   MESON_HHI_DPLL_TOP_0_TSC_BIT4,
> +					   regval);
> +		}
>  	} else {
>  		regmap_update_bits(priv->regmap, MESON_SAR_ADC_DELTA_10,
>  				   MESON_SAR_ADC_DELTA_10_TS_REVE1, 0);
> @@ -1064,6 +1094,9 @@ static const struct meson_sar_adc_param meson_sar_adc_meson8b_param = {
>  	.bandgap_reg = MESON_SAR_ADC_DELTA_10,
>  	.regmap_config = &meson_sar_adc_regmap_config_meson8,
>  	.resolution = 10,
> +	.temperature_trimming_bits = 5,
> +	.temperature_multiplier = 10,
> +	.temperature_divider = 32,
>  };
>  
>  static const struct meson_sar_adc_param meson_sar_adc_gxbb_param = {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
