Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287BDC7EE23
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryZVV2JdZQ/df05fFlfQQIB/Gws6N/+6nxoHOZC/Eyw=; b=b6k6FH701mnNcS
	vmsqnzo+erC1L8EEXl8Umc06at8qDPkVwYgnWAQQk3tFNaCFwBrLyhgbRdIfRsnli/2HV95IghvxF
	m4LOcgvzFx/IXZPsclaiA9s0FMu1BfmkUMKdVlnYI3KKR7fgLERdRzQd1lde3QMmTNxRzrEYzFJrE
	GjFrgOgzV8gFWeUIbI/7QUZHTvBMX7Q/DQtoeMJjEGT8UzaCUCxWFnRD3FE84ydPB5+YY2VoRzVGO
	daDCT1c3MfwWF4VfuEzmzH10mzoHm6WiIttXkAcmP/nu4RErFuKzz9Oh+NejR5+EhefocVKiVnfdZ
	82qwGrIJ9zgY6rCgiObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Hnb-007rTd-0H;
	Sun, 28 May 2023 14:55:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3HnX-007rQP-2P;
	Sun, 28 May 2023 14:55:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E0B660BA0;
	Sun, 28 May 2023 14:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE87C433D2;
	Sun, 28 May 2023 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685285698;
	bh=uq9f6ruV2vZOvPBQvuKdz6houa9WJBhDMoGSJknIqsU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AuPsfr6wO0V8bOVWHaZyLevoouOQZWMyk8bQncHpj3a3IivBdMXTl9rcCApr0Ivoq
	 psmmejaAVLhKlRCpJwryTsO2oDcvJxyKdY181XmxrPLwgwvxlreG3txSbqMCV9xspL
	 uG0NJo0bLOlGc9HI9GV7eyXqBCmPVW9pwta8acDqYNOvjYtvb54Y/599TWi4VkWzYY
	 46f5jWVs06HM04bXyriBMEDEr5Js7/5GOEL3BA/hKNRe3Ye948t0CSwrJ+VZ0PVJd5
	 oRHM+VkQwWSiwgLo7jJbVlbaL14ghpxG1WwiH8FYe0O4EhBpYALrhssWAEYK95BgMM
	 cy/t56sgYZKnw==
Date: Sun, 28 May 2023 16:11:17 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: George Stark <gnstark@sberdevices.ru>
Cc: <lars@metafoo.de>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
 <jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
 <andriy.shevchenko@linux.intel.com>, <nuno.sa@analog.com>,
 <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <kernel@sberdevices.ru>
Subject: Re: [PATCH v2] meson saradc: add iio device attrib to switch
 channel 7 mux
Message-ID: <20230528161117.197f7e61@jic23-huawei>
In-Reply-To: <20230527214854.126517-1-gnstark@sberdevices.ru>
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_075507_884294_6377F911 
X-CRM114-Status: GOOD (  27.23  )
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

On Sun, 28 May 2023 00:48:54 +0300
George Stark <gnstark@sberdevices.ru> wrote:

> Patch adds two sysfs nodes: chan7_mux to set mux state
> and chan7_mux_available to show available mux states.
> Mux can be used to debug and calibrate adc by
> switching and measuring well-known inputs like GND, Vdd etc.
> 
> Signed-off-by: George Stark <GNStark@sberdevices.ru>

A few key things here.
1) ABI docs missing (Documentation/ABI/testing/sysfs-bus-iio-*
   Without that it's hard to review new ABI.2
2) We are very conservative when it comes to adopting new ABI as the
   reality is that userspace has no idea what to do with it.
   Designing interfaces that work for a wide range of devices is hard
   but necessary to enable general purpose software.

Based on the limited description we have here, I'm not understanding why
you don't just express this as a set of channels. One channel per mux
setting, with the in_voltageX_label providing the information on what the
channel is connected to.

This is an interesting facility, so good to enable for high precision calibration
but we still want to map it to standards signals.  Userspace doesn't
care that these are all being measured via the same input 7 - which
is itself probably an input to a MUX.

Jonathan

> ---
>  drivers/iio/adc/meson_saradc.c | 65 ++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index e05e51900c35..6959a0064551 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/nvmem-consumer.h>
> @@ -320,6 +321,7 @@ struct meson_sar_adc_priv {
>  	bool					temperature_sensor_calibrated;
>  	u8					temperature_sensor_coefficient;
>  	u16					temperature_sensor_adc_val;
> +	u8					chan7_mux_sel;
>  };
>  
>  static const struct regmap_config meson_sar_adc_regmap_config_gxbb = {
> @@ -483,6 +485,7 @@ static void meson_sar_adc_set_chan7_mux(struct iio_dev *indio_dev,
>  	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
>  			   MESON_SAR_ADC_REG3_CTRL_CHAN7_MUX_SEL_MASK, regval);
>  
> +	priv->chan7_mux_sel = sel;
>  	usleep_range(10, 20);
>  }
>  
> @@ -1130,8 +1133,70 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
>  	return ret;
>  }
>  
> +static const char * const chan7_vol[] = {
> +	"gnd",
> +	"vdd/4",
> +	"vdd/2",
> +	"vdd*3/4",
> +	"vdd",
> +	"ch7_input",
> +};
> +
> +static ssize_t chan7_mux_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
> +	unsigned int index = priv->chan7_mux_sel;
> +
> +	if (index >= ARRAY_SIZE(chan7_vol))
> +		index = ARRAY_SIZE(chan7_vol) - 1;
> +
> +	return sysfs_emit(buf, "%s\n", chan7_vol[index]);
> +}
> +
> +static ssize_t chan7_mux_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	int i;
> +
> +	i = sysfs_match_string(chan7_vol, buf);
> +	if (i < 0)
> +		return -EINVAL;
> +	meson_sar_adc_set_chan7_mux(indio_dev, i);
> +	return count;
> +}
> +
> +static IIO_DEVICE_ATTR_RW(chan7_mux, -1);
> +
> +static ssize_t chan7_mux_available_show(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	int i, len = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(chan7_vol); i++)
> +		len += sysfs_emit_at(buf, len, "%s ", chan7_vol[i]);
> +
> +	return len;
> +}
> +
> +static IIO_DEVICE_ATTR_RO(chan7_mux_available, -1);
> +
> +static struct attribute *meson_sar_adc_attrs[] = {
> +	&iio_dev_attr_chan7_mux_available.dev_attr.attr,
> +	&iio_dev_attr_chan7_mux.dev_attr.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group meson_sar_adc_attr_group = {
> +	.attrs = meson_sar_adc_attrs,
> +};
> +
>  static const struct iio_info meson_sar_adc_iio_info = {
>  	.read_raw = meson_sar_adc_iio_info_read_raw,
> +	.attrs = &meson_sar_adc_attr_group,
>  };
>  
>  static const struct meson_sar_adc_param meson_sar_adc_meson8_param = {


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
