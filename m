Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE88EB64D9
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 09:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huEJ0sFmsm1ztkadn08RvCyWpAFtwN6r9Un7f0vY1R4=; b=r9VWgeUu/3T9aX
	+hSt1P+sWLLMI0YRUWDCgUMJ6aHqsrmCZt73BkuOzwCQfE95yQ1070s5N1Zz8OkgpYaXBouHYYhXi
	+sRSLSFrkhoaQPVoBd9rkMK6SjlVK5cuJ/fKEnL5OYfY0RyjfZ4AeVBmgMxUmTcBvskN9bQhMWT97
	8HWf8wlrGTx8Z/rnBWKOUmR6QyLKRAcNsNxKDBB9td4Qaf8Z0HfqS0zf4wkPAKf6aMGPbNfd8q2RA
	zFKJ0gRVZGT8AORFac2Savb7+nI7qtCaW4NmC+lnK4x9bqB1+7qNog50gHz4iezBYtoNOBfCcsB9M
	iUzoBNkP9ov38hHUvZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInDR-00B0ar-2W;
	Mon, 10 Jul 2023 09:29:57 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInDP-00B0Z4-0V;
	Mon, 10 Jul 2023 09:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688981395; x=1720517395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y0chWFAK1q4a4KdS5bU1/aspWN7zc+1TNroqjrdVK0M=;
  b=nr50gfbghLoG+RWcyHiWpAXUQORblZeGqLkQOFzT6L3Vz3MmdQIb0X2D
   oLHXFvNO6oRWv+gDeaM4xiHOs6ML0n9ot3qZ5Gl1It/Fd+rtXVnKWdErh
   BVAUWvQlOs8tVXM3ods1hIg2ZBIfMtd+WS48nazrIaHmx/cD9Pt9H4VJP
   HhRaMNEkMyOaIPQl7F3ZlCL65Ku7Qa7FmXZz4lMgoabeTpAegNZJqptla
   gEw39SevkfAVbu/w8zv7ZIx+5g4GntnuFos+KgxaTvdU96c9bSEVh+Dw2
   gdDq4j4bdOTI+hmtEsnwm5DCkXkticiFWNxjTPH6gT6h7XlLcGR84e9cj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="427990982"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="427990982"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 02:29:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="810751721"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="810751721"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2023 02:29:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qInDG-001Vug-2G;
	Mon, 10 Jul 2023 12:29:46 +0300
Date: Mon, 10 Jul 2023 12:29:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v4 5/6] iio: adc: meson: add channel labels
Message-ID: <ZKvPihNXVWHTuYxS@smile.fi.intel.com>
References: <20230707153322.114302-1-gnstark@sberdevices.ru>
 <20230707153322.114302-6-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707153322.114302-6-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_022955_239332_47F5980A 
X-CRM114-Status: UNSURE (   6.38  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jul 07, 2023 at 06:27:42PM +0300, George Stark wrote:
> Add channel labels to provide human-readable names for the channles.

Either drop first "channel" or "for the channels" to avoid tautology.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
