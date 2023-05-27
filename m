Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E73C77B73
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 May 2023 21:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HA04WSbFHuqyrdhYeTyBxj25hRgqzeC5P2CsicgbUfU=; b=AKfymz9J25zGID
	EjnHmtjISThDQwEVgfMi94KBNCVOJxe4vKBUuRfWiiYrgWE1SG8X24DxOAAHIILkegNr0gDiUU5ni
	RAf+I16xJ2uAU6Cu32iCGUpiqVuffGgbn8LEQ0bz0SoioheNSR6E4XMQ1jst1rq+zYLDYBiaJU7FI
	RWJgEH0ko9HGQZ/C/4852/vMd6z9KcO1OGSgsN+qmXtzjvmhW+7vpdj1Qw2bZYNd/jbvCaUQnjpUE
	MybmpIBErV5JyERQPu/k3dDHnbWOV5CrKTEiHig9hC0olDB4jT+a8NI7KC/mnukmv7X0ax9BV0Ewt
	cmFor5S/6hkWLNOebMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q31g2-006PjT-24;
	Sat, 27 May 2023 21:42:18 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q31fy-006PiO-0E;
	Sat, 27 May 2023 21:42:16 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 2924C5FD05;
	Sun, 28 May 2023 00:42:05 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1685223725;
	bh=zmU0QPWcuI+QjTo74SKplYsoabitGqIxBH6oJBP+2UI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=ii5NBgjz5NCk3QYnd2XdVMDVL6kZ53KILjsmPugDyLRoprEttMOv6gmr2LseMaeAY
	 eCuu8egj1AcY0RveOi6Rs9rJilsZSJ5i0btJLya7qM4h2yfdgywrfY3K5xG4dIHyVE
	 8x2OOxuNv6DO/0yStBGO3LznGm5HwuTX1Qa5pdU9l8XGCQnE79ykhmxj+4FqR4ZO2W
	 7uTFgRuWSPR7DFboyr0vse+vpj6/XMZnlIeyUXncQmt3L6ipQ9hfFrN8Nn0uGpwRdR
	 sa6Mmmh92412MAUgNWclaYxpDroq4gPobK9W8axF+W6wecsJkN3w8uAKvPBpUNlTjC
	 cDRpkZvFbeduA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Sun, 28 May 2023 00:42:00 +0300 (MSK)
Message-ID: <7485514e-4c10-361a-6468-050a5897f0d5@sberdevices.ru>
Date: Sun, 28 May 2023 00:37:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1] meson saradc: add iio device attrib to switch channel
 7 mux
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "jic23@kernel.org" <jic23@kernel.org>, "lars@metafoo.de"
	<lars@metafoo.de>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "martin.blumenstingl@googlemail.com"
	<martin.blumenstingl@googlemail.com>, "nuno.sa@analog.com"
	<nuno.sa@analog.com>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, kernel <kernel@sberdevices.ru>
References: <20230524000111.14370-1-gnstark@sberdevices.ru>
 <ZHG9bYO1PNuPJhWn@smile.fi.intel.com>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <ZHG9bYO1PNuPJhWn@smile.fi.intel.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/27 20:13:00 #21359908
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230527_144214_643411_E274EDD6 
X-CRM114-Status: GOOD (  14.88  )
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

Hi Andy

Thanks for review. I fixed it in patch v2

Best regards
George


On 5/27/23 11:21, Andy Shevchenko wrote:
> On Wed, May 24, 2023 at 03:01:11AM +0300, George Stark wrote:
>> Patch adds two sysfs nodes: chan7_mux to set mux state
>> and chan7_mux_available to show available mux states.
>> Mux can be used to debug and calibrate adc by
>> switching and measuring well-known inputs like gnd, vdd etc.
> GND
> Vdd
>
> ...
>
>> +static ssize_t chan7_mux_store(struct device *dev,
>> +			       struct device_attribute *attr,
>> +			       const char *buf, size_t count)
>> +{
>> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
>> +	int i;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(chan7_vol); i++)
>> +		if (!strcmp(chan7_vol[i], buf)) {
>> +			meson_sar_adc_set_chan7_mux(indio_dev, i);
>> +			return count;
>> +		}
>> +
>> +	return -EINVAL;
> NIH sysfs_match_string().
>
>> +}
> ...
>
>> +static IIO_DEVICE_ATTR_RW(chan7_mux, -1);
>> +static IIO_DEVICE_ATTR_RO(chan7_mux_available, -1);
> Place each of them near to the respective callback(s),
>
> ...
>
>> +static struct attribute *meson_sar_adc_attrs[] = {
>> +	&iio_dev_attr_chan7_mux_available.dev_attr.attr,
>> +	&iio_dev_attr_chan7_mux.dev_attr.attr,
>> +	NULL,
> No comma for the terminator entry.
>
>> +};



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
