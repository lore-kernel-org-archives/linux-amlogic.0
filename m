Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2F8EB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Jun 2023 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1eK8imKsnn2xyDeGzEd560xjKsscJCwL75BBGeiRVM=; b=zNXY4Y5j9DClSE
	i4A1vHarJKP+MuHESGA7h9wov32mDSvwIb+SkJ74i8GeDFxbKvgUGnLRLOzb1CiebwXvGAwOFjXBm
	3nVnWGmJPodC255OMmvHTj4+AbZyD72HrVEDJmWbYQXccE9ZIAKcXtsXQYnnuG0anDZIbHBSRxewI
	d3wGiTjLmHZe5tEWits0/YG/r8QUiXTtU85WJfKKOZ5lEQljLyM67llNqQyjlIs9dmIp0gyZ89UDU
	b+Sg6/av3QMehNzewNgm9J/QQADYbMmNejmHXe+qb+546ZAtWR2f+ZZzohIe6eZGJIXaDqjxuUAWS
	M1BjXjo4TczjtWB7uYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qES3y-00FJfx-0e;
	Wed, 28 Jun 2023 10:06:14 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qES3t-00FJeM-0j;
	Wed, 28 Jun 2023 10:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687946769; x=1719482769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D9/HaLrYlCtEllZMLsE+qnE2OoNhKXG87x9IvttFtFM=;
  b=YB5aklVcMuUVRDy6qfajf31yNjitFKkkJbejvL3BgwWc45hZt2/LZzZi
   SGNimYnkXglNAHJaOOCqB5vF7DIlG1f3q8uLcxbjXfTe2Zn/EF7AJMp3N
   VAKpIHO9fSfQyLkVyLbVxReswiy8lF93KdURpmGbVP5EUSgKX3qs2Y1JU
   YA98b8igucxPeVZQh73at3+GOJnCLJs1XPU0V3Qvd8rDhaW71EpaQqBnM
   H0rs608EuoayqZPzdjJvA1vhJ68kVioQqBU+6wcPYV43/wYBHsp5mlVm9
   AqtY8mjff1uC+r5TPwSxuvGq0AMvw+HvfNFZA1Cfsltm4ZP43inXXN7cm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425476481"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="425476481"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2023 03:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="963538182"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="963538182"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jun 2023 03:06:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qES3k-000YPx-1a;
	Wed, 28 Jun 2023 13:06:00 +0300
Date: Wed, 28 Jun 2023 13:06:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v3 5/5] meson saradc: support reading from channel 7 mux
 inputs
Message-ID: <ZJwGCNA+ZURri24i@smile.fi.intel.com>
References: <20230627224017.1724097-1-gnstark@sberdevices.ru>
 <20230627224017.1724097-6-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230627224017.1724097-6-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_030609_320933_53660F3A 
X-CRM114-Status: GOOD (  11.98  )
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

On Wed, Jun 28, 2023 at 01:37:18AM +0300, George Stark wrote:
> Add iio channel for every channel 7 mux input.
> Meson saradc channel 7 is connected to a mux that can switch channel
> input to well-known sources like Vdd, GND and several Vdd dividers.

...

> +static enum meson_sar_adc_chan7_mux_sel chan7_mux_values[] = {
> +	CHAN7_MUX_VSS,
> +	CHAN7_MUX_VDD_DIV4,
> +	CHAN7_MUX_VDD_DIV2,
> +	CHAN7_MUX_VDD_MUL3_DIV4,
> +	CHAN7_MUX_VDD,
> +};
> +
> +static const char * const chan7_mux_names[] = {
> +	"gnd",
> +	"0.25vdd",
> +	"0.5vdd",
> +	"0.75vdd",
> +	"vdd",

For the sake of robustness you can assign like this

	[CHAN7_MUX_VDD_DIV2] = "0.5vdd",

>  };

...

> -	if (chan->type == IIO_VOLTAGE)
> -		return sprintf(label, "channel-%d\n", chan->channel);
> +	if (chan->type == IIO_VOLTAGE) {

> +		if (chan->channel <= NUM_CHAN_7)

I believe you can get rid of this conditional and make diff less ping-pong-ish,
  see below.

> +			return sprintf(label, "channel-%d\n", chan->channel);
> +		if (chan->channel >= NUM_MUX_0_VSS)
> +			return sprintf(label, "%s\n",
> +				chan7_mux_names[chan->channel - NUM_MUX_0_VSS]);
> +	}


	if (chan->type == IIO_VOLTAGE && chan->channel >= NUM_MUX_0_VSS)
		return sprintf(label, "%s\n", chan7_mux_names[chan->channel - NUM_MUX_0_VSS]);

	if (chan->type == IIO_VOLTAGE)
		return sprintf(label, "channel-%d\n", chan->channel);


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
