Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9657AEB64DC
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 00:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=422kRUPMmwE4shN1QzrKa8I3UCnqtZY5YjiMhE79tTc=; b=c8v6Yin8xHCxQX
	kS53f/wJZa9ro3PN5xxtlyOZ1r25tdHvHuahTxwYKOJVKssxYtIypdxsSJLsR8FEJpMUC4G0sXP71
	HLFixnu+ArG71bKmEqg0JPRadsG/255BkzW/5VYeWbF3or9d/EDO3SySkkQtvKbqRJoU3Tn4TVPBI
	TCKF3pdGqc8iCbYriYDUW7dro784nxxAjLuIEt5y7CXZb3Fm3xbfqVD3irJPNE894pf6DyHk6ANfW
	kmZo3oXo/T9Rx26HR1DF6W1G1r68ftWEBgku3zj9LJ4g/s2BJ43hHHucgyLgzu3BP/w9sLf7GNHI5
	bhCZdiM0PyFi+5w7816A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGU95-00BldU-0E;
	Tue, 04 Jul 2023 00:43:55 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGU90-00BlcC-1B;
	Tue, 04 Jul 2023 00:43:53 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D57DB120029;
	Tue,  4 Jul 2023 03:43:41 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D57DB120029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688431421;
	bh=zmd/y+4sYUjQ7RxU3hWIwpYfpIcP+p2El5X96AiHQzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=XJpLLbwy05/cHpRwF0bVJroxy9+v9/r9cIhJUeGDwiwIHMffnqyuYKiJZuaayBzeA
	 o1mMPIDwzSA6fFLZW/LJvTKzPJe232XS7Vm3wBtRS484YSY6oShBxSqgInsFDQhmeZ
	 EDlbmJSknETSz8qFb4328niYqjx+29YlbuvN1Z9ZLfCfPsWaCXLYGGVZtkYSmU9+8l
	 J5TaPdtImk1Ffac2lnNJ5VnwxSRCB/6cs6SvrooZpuiGZtedoRRsUU6yWikcgnahkG
	 7ei8se6fSu+DuKzTgQrVeuksIXFyfjm5deRgyjUgNs2lbZg8CX+si2cO6AhDphanqj
	 rPLKU8VJKkCvA==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 03:43:41 +0300 (MSK)
Received: from [192.168.1.127] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 4 Jul 2023 03:43:35 +0300
Message-ID: <98908451-b110-c2a0-4434-ea0997712384@sberdevices.ru>
Date: Tue, 4 Jul 2023 03:39:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/5] meson saradc: move enums declaration before
 variables declaration
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <kernel@sberdevices.ru>
References: <20230627224017.1724097-1-gnstark@sberdevices.ru>
 <20230627224017.1724097-2-gnstark@sberdevices.ru>
 <20230702171410.00007827@Huawei.com>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <20230702171410.00007827@Huawei.com>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178409 [Jul 03 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, lists.infradead.org:7.1.1;sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/07/03 22:49:00
X-KSMG-LinksScanning: Clean, bases: 2023/07/03 22:49:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/03 21:28:00 #21559073
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_174351_108766_3A0429E1 
X-CRM114-Status: GOOD (  19.81  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Jonathan

On 7/2/23 12:14, Jonathan Cameron wrote:
> On Wed, 28 Jun 2023 01:37:14 +0300
> George Stark <gnstark@sberdevices.ru> wrote:
>
>> Move enums declaration before variables declaration.
>>
> This is fairly harmless, but would be nice to say 'why'.
> Is this just for consistency with the rest of the driver or will
> it be required after changes later in the patch set?
Both refactoring patches 1/5 and 2/5 are required for the latter changes 
in this patch-set.
Ack for extending the commit message.

>
>> Signed-off-by: George Stark <GNStark@sberdevices.ru>
>> ---
>>   drivers/iio/adc/meson_saradc.c | 44 +++++++++++++++++-----------------
>>   1 file changed, 22 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
>> index 18937a262af6..af38d95bd504 100644
>> --- a/drivers/iio/adc/meson_saradc.c
>> +++ b/drivers/iio/adc/meson_saradc.c
>> @@ -202,6 +202,28 @@
>>   	.datasheet_name = "TEMP_SENSOR",				\
>>   }
>>   
>> +enum meson_sar_adc_avg_mode {
>> +	NO_AVERAGING = 0x0,
>> +	MEAN_AVERAGING = 0x1,
>> +	MEDIAN_AVERAGING = 0x2,
>> +};
>> +
>> +enum meson_sar_adc_num_samples {
>> +	ONE_SAMPLE = 0x0,
>> +	TWO_SAMPLES = 0x1,
>> +	FOUR_SAMPLES = 0x2,
>> +	EIGHT_SAMPLES = 0x3,
>> +};
>> +
>> +enum meson_sar_adc_chan7_mux_sel {
>> +	CHAN7_MUX_VSS = 0x0,
>> +	CHAN7_MUX_VDD_DIV4 = 0x1,
>> +	CHAN7_MUX_VDD_DIV2 = 0x2,
>> +	CHAN7_MUX_VDD_MUL3_DIV4 = 0x3,
>> +	CHAN7_MUX_VDD = 0x4,
>> +	CHAN7_MUX_CH7_INPUT = 0x7,
>> +};
>> +
>>   static const struct iio_chan_spec meson_sar_adc_iio_channels[] = {
>>   	MESON_SAR_ADC_CHAN(0),
>>   	MESON_SAR_ADC_CHAN(1),
>> @@ -227,28 +249,6 @@ static const struct iio_chan_spec meson_sar_adc_and_temp_iio_channels[] = {
>>   	IIO_CHAN_SOFT_TIMESTAMP(9),
>>   };
>>   
>> -enum meson_sar_adc_avg_mode {
>> -	NO_AVERAGING = 0x0,
>> -	MEAN_AVERAGING = 0x1,
>> -	MEDIAN_AVERAGING = 0x2,
>> -};
>> -
>> -enum meson_sar_adc_num_samples {
>> -	ONE_SAMPLE = 0x0,
>> -	TWO_SAMPLES = 0x1,
>> -	FOUR_SAMPLES = 0x2,
>> -	EIGHT_SAMPLES = 0x3,
>> -};
>> -
>> -enum meson_sar_adc_chan7_mux_sel {
>> -	CHAN7_MUX_VSS = 0x0,
>> -	CHAN7_MUX_VDD_DIV4 = 0x1,
>> -	CHAN7_MUX_VDD_DIV2 = 0x2,
>> -	CHAN7_MUX_VDD_MUL3_DIV4 = 0x3,
>> -	CHAN7_MUX_VDD = 0x4,
>> -	CHAN7_MUX_CH7_INPUT = 0x7,
>> -};
>> -
>>   struct meson_sar_adc_param {
>>   	bool					has_bl30_integration;
>>   	unsigned long				clock_rate;
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Best regards
George


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
