Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B82CC77B7C
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 May 2023 08:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTiYhxc17lipmHjbWXeBVPVb4WTE1dTgd38b4Vp6Ces=; b=qbOTiNNJVeNkMW
	tyoLzvJ4lK286a/U10LE+adq2BaOIBzqFShrZGC7JSauLea4A1edwwb6v4nPtkVvwCQf3bySC2YLx
	WaWbkZb1a6Wvzm90NyCVGVYXj7YkPcFLu8sRm4guzVwnXNWp9sC5EPxc5R/hk2EaJ5W5qcBWL/7te
	8qQQuFuB3BdNmXoroq2sP19l6YyggsDuIRLkpaMuUw4lcIMTErA5On4xUcB8ocWUQJKK0J+9uhJR5
	555CE1sU9Vp51PHlAWqpRkxBmOVu+y0gDlV/w81LU4wFjl+pPoX2JkV5lIZLDcWojN3VMJR1rJy27
	laMoQZvDsUXHT7o0f6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2pAt-005Djb-1m;
	Sat, 27 May 2023 08:21:19 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2pAq-005Dhf-0U;
	Sat, 27 May 2023 08:21:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685175676; x=1716711676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gaq5upMCYm0n+93a3GQTD3/I551zJxCC6KXvfyxQV+0=;
  b=FZ6XidBFxexW4Dsj6w1JY3ntgMXZsgyLmxo/oS1dStzJbJ8zT5GmfoXJ
   dWZKBrCqO/oL7G+PIKWVMUAQdDYgChwaxWgFhSH2q1Ai0hwgc2wGlfLzG
   wdpXJ+XbwPQoRlIl/XAr/75cJueIBRz33KYNR/1C+6bmPS0yGEVuYKpdS
   2DrQVuefLbJYvRKHVmj8yfX6stFvfNZ3PitGSGVS82/WF+KlXjcBp0bS+
   DhJomC3tmr5jXDXqpEugen2BA7ZganZZcD9DCxvq8mUemBfbLEEi+r+WI
   0e7hJ9S9cANuVlFodeL/Gt7vapcHqT+xKGx4bvWK7cuRQXlMHQ/LySzW8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="334000948"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="334000948"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 01:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="1035600798"
X-IronPort-AV: E=Sophos;i="6.00,196,1681196400"; 
   d="scan'208";a="1035600798"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 27 May 2023 01:21:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q2pAb-000IpE-2O;
	Sat, 27 May 2023 11:21:01 +0300
Date: Sat, 27 May 2023 11:21:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v1] meson saradc: add iio device attrib to switch channel
 7 mux
Message-ID: <ZHG9bYO1PNuPJhWn@smile.fi.intel.com>
References: <20230524000111.14370-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230524000111.14370-1-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230527_012116_210452_3558291F 
X-CRM114-Status: GOOD (  13.09  )
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

On Wed, May 24, 2023 at 03:01:11AM +0300, George Stark wrote:
> Patch adds two sysfs nodes: chan7_mux to set mux state
> and chan7_mux_available to show available mux states.
> Mux can be used to debug and calibrate adc by
> switching and measuring well-known inputs like gnd, vdd etc.

GND
Vdd

...

> +static ssize_t chan7_mux_store(struct device *dev,
> +			       struct device_attribute *attr,
> +			       const char *buf, size_t count)
> +{
> +	struct iio_dev *indio_dev = dev_to_iio_dev(dev);
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(chan7_vol); i++)
> +		if (!strcmp(chan7_vol[i], buf)) {
> +			meson_sar_adc_set_chan7_mux(indio_dev, i);
> +			return count;
> +		}
> +
> +	return -EINVAL;

NIH sysfs_match_string().

> +}

...

> +static IIO_DEVICE_ATTR_RW(chan7_mux, -1);
> +static IIO_DEVICE_ATTR_RO(chan7_mux_available, -1);

Place each of them near to the respective callback(s),

...

> +static struct attribute *meson_sar_adc_attrs[] = {
> +	&iio_dev_attr_chan7_mux_available.dev_attr.attr,
> +	&iio_dev_attr_chan7_mux.dev_attr.attr,
> +	NULL,

No comma for the terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
