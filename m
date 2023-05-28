Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFA9C7EE23
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 21:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hexHJMvNDo7sP97xnpFVVvyR1YsOEuGnU46sqSYgaBw=; b=07foCkVEj62HcN
	KYh0lE2+D4Xf2U972ia6j77ts4AiL7jR/Kvd4jBCbIyncc9wk/eDuJRSKITvxMNAh692R4DehvcEH
	oXqsnMo80zLwuApqoQU13KrBSANd33TGOyrcVRGmu3hWaInsvP8sS4/W+xtrYAEwMQGSN30BF5lbe
	G4AcO4U8hvNwtVWKyKy00NiOmqfhjctbs4p9NR8mMseUzPvflcAxPvW3EP6YQ+n00ONv5cNI5uwcI
	k4HHPiyndjBo4cCZfuvfDYYSt3BVQHlUqNWU5QJZVvMq+C/e5+3BDzDuInmdt53xOzab0ECISAO4b
	N8sABuBj9XzleRkUCOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3OJG-008SEF-1B;
	Sun, 28 May 2023 21:52:18 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3OJC-008SDY-2N;
	Sun, 28 May 2023 21:52:17 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 9810D5FD05;
	Mon, 29 May 2023 00:52:08 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685310728;
	bh=Nghv6m8D7/4zP2PXOsESsldyieGQgyXv09d5y46DBk8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=BKKa1QVQudsYb4AHa7wiar01zuXsdWCwJtipGAdaqqwHldenhGJdmZXjWDaASQy/s
	 KJqjxsmW0Wv7GzOnffju2UnHjiWznfogJQRkf+EmSnmwrZCOHXzJDCHjHWjT0iHpsA
	 i659nXdWC6QmX9RaT3znfu2wWtAZ6QmyM6sWPCk94yGVt/ZClp+vBlUY1LB9gfnhUI
	 4KJ6ERzgDgy3FAbRRXdso3sJs7rQXgNVtestL+5OqvRApK/pcDEw5M4Eq84TcnOCVq
	 bysdfdjhCgtCvxKIOT/pbK0XwcKylDSDNHOoAsQqxeMKZ/LG0k5yMU6Q+kSDT8WpLw
	 d/+7L2/MyRwlg==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 29 May 2023 00:52:05 +0300 (MSK)
From: George Stark <GNStark@sberdevices.ru>
To: Jonathan Cameron <jic23@kernel.org>
CC: "lars@metafoo.de" <lars@metafoo.de>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	"nuno.sa@analog.com" <nuno.sa@analog.com>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v2] meson saradc: add iio device attrib to switch channel
 7 mux
Thread-Topic: [PATCH v2] meson saradc: add iio device attrib to switch channel
 7 mux
Thread-Index: AQHZkOUaOx1SJmc/HEOeHScMc8VAp69vmTiAgABuz4A=
Date: Sun, 28 May 2023 21:52:05 +0000
Message-ID: <4d5a7691-68ac-6626-5502-383fad3a9436@sberdevices.ru>
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
 <20230528161117.197f7e61@jic23-huawei>
In-Reply-To: <20230528161117.197f7e61@jic23-huawei>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.1.13]
Content-ID: <A12E2CA0EA8F9449AF67FDB6431CE8D8@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/28 19:12:00 #21364717
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_145215_490884_AF9D6D82 
X-CRM114-Status: GOOD (  26.98  )
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

On 5/28/23 17:55, Jonathan Cameron wrote:
> On Sun, 28 May 2023 00:48:54 +0300
> George Stark <gnstark@sberdevices.ru> wrote:
>
>> Patch adds two sysfs nodes: chan7_mux to set mux state
>> and chan7_mux_available to show available mux states.
>> Mux can be used to debug and calibrate adc by
>> switching and measuring well-known inputs like GND, Vdd etc.
>>
>> Signed-off-by: George Stark <GNStark@sberdevices.ru>
> A few key things here.
> 1) ABI docs missing (Documentation/ABI/testing/sysfs-bus-iio-*
>     Without that it's hard to review new ABI.2
> 2) We are very conservative when it comes to adopting new ABI as the
>     reality is that userspace has no idea what to do with it.
>     Designing interfaces that work for a wide range of devices is hard
>     but necessary to enable general purpose software.
>
> Based on the limited description we have here, I'm not understanding why
> you don't just express this as a set of channels. One channel per mux
> setting, with the in_voltageX_label providing the information on what the
> channel is connected to.
>
> This is an interesting facility, so good to enable for high precision calibration
> but we still want to map it to standards signals.  Userspace doesn't
> care that these are all being measured via the same input 7 - which
> is itself probably an input to a MUX.
>
> Jonathan

Hello Jonathan

Thanks for the review.

Your idea of exposing the mux setting as iio channels is very
interesting and at least worth trying.
The sysfs approach was chosen because of the code changes are simple and
neat (compare to channels approach).
Also calibration by using those mux inputs are already supported in the
driver (performed at probe stage) so I expect very special usecases for
those mux settings like debug or device production stage tests. In those
usescases hardware specific knowledge is required anyway.

Best regards
George

>> ---
>>   drivers/iio/adc/meson_saradc.c | 65 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 65 insertions(+)
>>
>> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
>> index e05e51900c35..6959a0064551 100644
>> --- a/drivers/iio/adc/meson_saradc.c
>> +++ b/drivers/iio/adc/meson_saradc.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/io.h>
>>   #include <linux/iio/iio.h>
>> +#include <linux/iio/sysfs.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/nvmem-consumer.h>
>> @@ -320,6 +321,7 @@ struct meson_sar_adc_priv {
>>   	bool					temperature_sensor_calibrated;
>>   	u8					temperature_sensor_coefficient;
>>   	u16					temperature_sensor_adc_val;
>> +	u8					chan7_mux_sel;
>>   };
>>   
>>   static const struct regmap_config meson_sar_adc_regmap_config_gxbb = {
>> @@ -483,6 +485,7 @@ static void meson_sar_adc_set_chan7_mux(struct iio_dev *indio_dev,
>>   	regmap_update_bits(priv->regmap, MESON_SAR_ADC_REG3,
>>   			   MESON_SAR_ADC_REG3_CTRL_CHAN7_MUX_SEL_MASK, regval);
>>   
>> +	priv->chan7_mux_sel = sel;
>>   	usleep_range(10, 20);
>>   }
>>   
>> @@ -1130,8 +1133,70 @@ static int meson_sar_adc_calib(struct iio_dev *indio_dev)
>>   	return ret;
>>   }
>>   
>> +static const char * const chan7_vol[] = {
>> +	"gnd",
>> +	"vdd/4",
>> +	"vdd/2",
>> +	"vdd*3/4",
>> +	"vdd",
>> +	"ch7_input",
>> +};
>> +
>> +static ssize_t chan7_mux_show(struct device *dev, struct device_attribute *attr,
>> +			      char *buf)
>> +{
>> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>> +	struct meson_sar_adc_priv *priv = iio_priv(indio_dev);
>> +	unsigned int index = priv->chan7_mux_sel;
>> +
>> +	if (index >= ARRAY_SIZE(chan7_vol))
>> +		index = ARRAY_SIZE(chan7_vol) - 1;
>> +
>> +	return sysfs_emit(buf, "%s\n", chan7_vol[index]);
>> +}
>> +
>> +static ssize_t chan7_mux_store(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       const char *buf, size_t count)
>> +{
>> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>> +	int i;
>> +
>> +	i = sysfs_match_string(chan7_vol, buf);
>> +	if (i < 0)
>> +		return -EINVAL;
>> +	meson_sar_adc_set_chan7_mux(indio_dev, i);
>> +	return count;
>> +}
>> +
>> +static IIO_DEVICE_ATTR_RW(chan7_mux, -1);
>> +
>> +static ssize_t chan7_mux_available_show(struct device *dev, struct device_attribute *attr,
>> +			      char *buf)
>> +{
>> +	int i, len = 0;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(chan7_vol); i++)
>> +		len += sysfs_emit_at(buf, len, "%s ", chan7_vol[i]);
>> +
>> +	return len;
>> +}
>> +
>> +static IIO_DEVICE_ATTR_RO(chan7_mux_available, -1);
>> +
>> +static struct attribute *meson_sar_adc_attrs[] = {
>> +	&iio_dev_attr_chan7_mux_available.dev_attr.attr,
>> +	&iio_dev_attr_chan7_mux.dev_attr.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group meson_sar_adc_attr_group = {
>> +	.attrs = meson_sar_adc_attrs,
>> +};
>> +
>>   static const struct iio_info meson_sar_adc_iio_info = {
>>   	.read_raw = meson_sar_adc_iio_info_read_raw,
>> +	.attrs = &meson_sar_adc_attr_group,
>>   };
>>   
>>   static const struct meson_sar_adc_param meson_sar_adc_meson8_param = {
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
