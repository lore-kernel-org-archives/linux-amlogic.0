Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6243EB64DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRtdjcxj52BVLn4uFvKO+KnmEOMHjInWI28TUViPNtU=; b=kxJE3BjWm4Mycj
	WX+9LqAy/46GidIfoy1AzFHbcr3lSKECueuw2A6mq+e6MsyfIWqTWCL5j6zDLlKtrUQBSP1w9Uatq
	lveBRbKwWYWzX6KssWYd/WcRYGaRMTInuKjsVeBIuuBCdUia6Bo93LSYDIuEiChp0wX/RKz8Khjmy
	JKef+L3CcA3Ri/Dj9VS2RcjOZvFF/xK+wfE2nz1EMczePYoi2TUJBvb3ylHgCpdvU4L3I3WgRpR2+
	XnuwKA0fEyLReYnabvnTecRCU3dqWO8tFJAvhZM4D85Slog3uv0AfiKnPW2PZB4PPFH7VW93jKy4l
	ZqR2vrxoIyXvCBRA+BQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qByXe-00EmKB-1G;
	Wed, 21 Jun 2023 14:10:38 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qByXb-00EmHo-2O;
	Wed, 21 Jun 2023 14:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687356635; x=1718892635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LjdGendaOChspmczDqlVv2lUaqfNdB1QDN1y/lEkBQs=;
  b=Gu5JmJ+sthDtFlqpfDVZIt3F91SwmMLSJCi0ofP652evLkHiaqBawcJ4
   gWEM5CIBZytfioJwvJ94QFe04fcBxssQcEHX4/309n20mNCRlJi4bdKAI
   gw1cWxoHXjMKGf+i/zGypo7SbSmOsOoZ2CT9UuXRVrNwgjVfG2K+gNw7f
   NQXaJRka9hBng5W9G4u2m0g3NVBWAPd8wtUCh2LzZwNBcEraFc52SHHMp
   +TDtTjEdlga+0zwwTQchc+SXBKH7D/KJJGsSogAhHOrxhn0tDia6cPKuc
   AzAFYu+2vPJHKtQYN1o8H3Oe/qZB6xsz3vRT/P9PcdcPiB6JyG4NvSLHq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="344917973"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="344917973"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 07:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="858984265"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="858984265"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 21 Jun 2023 07:10:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qByX6-005VxA-2j;
	Wed, 21 Jun 2023 17:10:04 +0300
Date: Wed, 21 Jun 2023 17:10:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v1 3/3] meson saradc: support reading from channel7 mux
 inputs
Message-ID: <ZJMEvDeSRaUOInc9@smile.fi.intel.com>
References: <20230621062715.455652-1-gnstark@sberdevices.ru>
 <20230621062715.455652-4-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621062715.455652-4-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_071035_819367_8E609AB6 
X-CRM114-Status: GOOD (  12.21  )
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

On Wed, Jun 21, 2023 at 09:26:10AM +0300, George Stark wrote:
> meson saradc channel 7 is connected to muxer that can switch channel
> input to well-known sources like Vdd, GND and several Vdd dividers.
> This patch adds iio channel for every mux input.

Same comments as per patch 2.

...

> +static const char * const chan7_mux_names[] = {
> +	"gnd",
> +	"0.25vdd",
> +	"0.5vdd",
> +	"0.75vdd",
> +	"vdd",
>  };

Looks good to me now, thank you for fixing this.


-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
