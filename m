Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C5BEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 14:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGylldoUA4E6SlYGrshf+AQG7W+8dGLCbtO1O7mS0v0=; b=eo+RZyJ74Hi0IK
	ERKWV9erZCrqxZmzlgbk5O6Pck9hH5/KcFp3cXpHiGJWYvvnAEYWeQUqcBK/Ii592qDxAxRK8RfSt
	nUgfAU4bcuhcey+pAtOtxwN3jeeUZweRf9NW+UZT1PGPUJ/9Qyyhvz9P6iaft6RqcIAPAOZ5QWEHo
	9hzhtlUl5J3YJNXGMmUvcIjcoI8jHRT/nUVuXfPu3hJh+UpUiNWf0dfu8cVkGqjZryAebvCNYfPLX
	hKV9b0ZVUZO0twYYCvU5jQq7DpdghO5pwdV7L6boKeeJ6gYkRJnml/QP/mdIb41gStjYrY+VNhfR6
	XG51IHIIkwyL/J+Q6DUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qByW8-00Elw0-37;
	Wed, 21 Jun 2023 14:09:04 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qByW6-00Elsj-1k;
	Wed, 21 Jun 2023 14:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687356542; x=1718892542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rPx+5YqJGhmcle9gXLDQG0ptIvu0NgL4FLwZd8hjZ50=;
  b=M0CdMnj/ilspK1gHattcfiyxJmg6F4IiW3Xhjglw25iR8YNhtFs2kZ+0
   l666TTWWVX2/bDd30S3xgtLXw3jCTzvNwccEf51jzjZ/TNB8vSXTazQxl
   1UP31TqjC4d/Z/4addcz9WNftJdzNAK1r86P5146AGWhjQY2sGVW9jai/
   XeI/qqHCPkngh2J44ZfyATnI8bXZyh7Ac5VMuuwfILZpb3dUaV3UomcSW
   KgCjSEbTlukvKIuLfw2h2pVlgvY+lN/3GnpGqWOxrV5j52BMCLvW1V9o1
   RhM9nYI9a8fiHYeVsU0paHsh5T6UFwNb6y9JhqnCNzi8iFd/LdX4pau54
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360196831"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="360196831"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 07:08:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="961207162"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="961207162"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 21 Jun 2023 07:08:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qByVp-005VwL-2X;
	Wed, 21 Jun 2023 17:08:45 +0300
Date: Wed, 21 Jun 2023 17:08:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v1 1/3] meson saradc: code refactoring
Message-ID: <ZJMEbbVaUoxSay5i@smile.fi.intel.com>
References: <20230621062715.455652-1-gnstark@sberdevices.ru>
 <20230621062715.455652-2-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621062715.455652-2-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_070902_596697_EDA87B01 
X-CRM114-Status: UNSURE (   7.97  )
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

On Wed, Jun 21, 2023 at 09:26:08AM +0300, George Stark wrote:
> - remove channel array double definition
> - add channel index enum
> - move enums declaration before variables declaration
> - move meson_sar_adc_set_chan7_mux routine upper

4 patches then?

...

> +	// last item is temp channel

Is C++ comment style is used in the entire file?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
