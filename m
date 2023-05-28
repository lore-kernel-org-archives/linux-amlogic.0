Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569E3C77B7E
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 10:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w5Mw8UDFVfUaBYHZE/no98SWSqA0NBC18PEy31x8No8=; b=SdNGwdg0TuQofb
	4V4WOcUsuHrDdzuKo0mu0jlpUdsP+rAdgvyL4HaHhjGNF5qS8x32j1kMOIwZrFBfbeh4zCVHthvSk
	wuiMLCNrK1/KESOYmzbSgg3rtATgIlVMyh2OlzAiwEF4UWsG2teCWcEJY/X69ODmYwitkdvG486MQ
	RuirlEVL2aNcfkabkoZAVNwwr/8Iyp2f4eUkTC8cW1VSEGmVOHN/I3HN3r4wkYBf5uxU0mlWaF1yg
	MEOtlz7Fy77cfUyJ+YeFjQwdybs8k8R3uZp9HlohSdq4j3qB1l6dVlv7LNL/ltDpvocIfgQi9On+a
	AL2y0KCJ64q1z+OGilkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3DvC-007TXZ-0N;
	Sun, 28 May 2023 10:46:46 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Dv9-007TWy-1E;
	Sun, 28 May 2023 10:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685270803; x=1716806803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=12XnZdCMLf2ECdKc7jgZMRFCTIoyk3JXcdiX3xQZb+Q=;
  b=Rtc2vmzLffNGzYDcw+k2nXd9SdPoZjrThSLQs+i/js0knK61tQ3pw1Gc
   e0SzxpF8+HEKyZg20dzMQdvJN4MbC4aMwRZ0rbGzvDyMgvLD9gT+3yO/D
   TCovgJKM1igxy1rqBqr1OTyLoMHdofYdGNvc4rswXIBt4Vj7vgh1mzZvv
   xblwsLK2P17NpZDHtizYNe/HJinKDtuwPHmEsvHdtZDwW61906ps94DJS
   On07nU9jsfqoAhCfuHYNDG8gpF2sYtz8d1tHt2LzYzDUu/WTa88mMVwRh
   hJilvkaThBRtH+PMSQXORBBcfvDMxZtv3cj6rFePqBZ/WFIjafs6ofJJg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="344006204"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="344006204"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 03:46:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="850056935"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="850056935"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 28 May 2023 03:46:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q3Dv3-000Jjg-0a;
	Sun, 28 May 2023 13:46:37 +0300
Date: Sun, 28 May 2023 13:46:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v2] meson saradc: add iio device attrib to switch channel
 7 mux
Message-ID: <ZHMxDHPBWQOJSuaZ@smile.fi.intel.com>
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230527214854.126517-1-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_034643_508094_BA1CF1A0 
X-CRM114-Status: GOOD (  21.45  )
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

On Sun, May 28, 2023 at 12:48:54AM +0300, George Stark wrote:
> Patch adds two sysfs nodes: chan7_mux to set mux state
> and chan7_mux_available to show available mux states.
> Mux can be used to debug and calibrate adc by
> switching and measuring well-known inputs like GND, Vdd etc.

Thank you for an update, my comments below.

...

> ---

Missing changelog, what has been done in v2, how it's different to v1.

>  drivers/iio/adc/meson_saradc.c | 65 ++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)

...

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

I think this is incorrect and prone to error in the future in case this array
will be extended. What I would expect is to return something like "unknown".

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

Do not shadow the error code if it's not justified.

		return i;

> +	meson_sar_adc_set_chan7_mux(indio_dev, i);
> +	return count;
> +}

> +

Redundant blank line.

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

Ditto.

> +static IIO_DEVICE_ATTR_RO(chan7_mux_available, -1);

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
