Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF97EB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 09:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NwWs09gAKUWiezhPJhNkmGFnMb3ZN0OvFX+YRn7SBI=; b=J10/jUGU4yc2+q
	0TEfn3/gX4VU2WQK1XxFOudyIDwYSwtvBnYGNXOd0b/oZrWSJOtyx+OSFDwRuBJiwW7NcU3/QpKTT
	CeAw5MhKvBUhaud/2+Ym/u57FM63eo0K6uPj6TKtBGeDxKQg14YETFKVBG2XT4NzAjrsISDPASJQV
	CYgx5jkvtCxDH0jZmC3lofyIdXmg0AyzwSr4Wd38PXjwfIuanICCiXk//Bp8rfDrUnTit9qSTKiQr
	b06dOcPG/i0l/WeaZtJTbe83nG84/HjYVBzo9hdMneCPvOAnNeOuaoK9j6zIZTWVXKArprt+CBKk2
	KpNInkwIBBQHan3FAz7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInC0-00B0GE-31;
	Mon, 10 Jul 2023 09:28:28 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInBy-00B0FS-14;
	Mon, 10 Jul 2023 09:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688981306; x=1720517306;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VhTJq09wWAcaEWErmqx7lEChTys+wW+JV/HO+/NxcT0=;
  b=ibrENw1Ojrfbh3k4BOhijlv8+bsE9hDheq/JVIksxPIcwZNu0/OW32NP
   3chBESU1Cxa6GS+pzkm5cBaEzedjCO1alBec5vaG46+XQq+SYQe3NPrf2
   76pX8CA7S/dasFq56iHcPX6X692q9gETuC9a9AfW40LHcXqPdJGGT7a6F
   d+8aAEbHXFzo5pUrLgy+T3OUrNKEVHNCXahv7rJiZyCiy8hvociwf1pEn
   XFBy/Szsx9iNGvu+cBuh4wXrEMqSJ3AiFz3Ojz0PeDQOtsxjK+pQWW16G
   g2vrHxCcU/19S7udkkQc4A3YanVtGfres17V0/LHyRw+INghGsH2g/4ye
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="395078927"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="395078927"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 02:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755936091"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="755936091"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 02:28:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qInBp-001Vto-2Z;
	Mon, 10 Jul 2023 12:28:17 +0300
Date: Mon, 10 Jul 2023 12:28:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v4 3/6] iio: adc: meson: move meson_sar_adc_set_chan7_mux
 routine upper
Message-ID: <ZKvPMXu3Q8U18FG8@smile.fi.intel.com>
References: <20230707153322.114302-1-gnstark@sberdevices.ru>
 <20230707153322.114302-4-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707153322.114302-4-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_022826_374637_8C6FEB57 
X-CRM114-Status: GOOD (  10.21  )
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

On Fri, Jul 07, 2023 at 06:27:40PM +0300, George Stark wrote:
> meson_sar_adc_set_chan7_mux is a basic routine writing single register,

We refer to the functions as func().
Mind the parentheses.

"for writing a"

> and defined as static. It moved up so it could be used in more places.

"Move it up, so"

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
