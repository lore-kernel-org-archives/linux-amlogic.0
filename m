Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A78CC77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jun 2023 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFir29RqYxWmngjYy0yfpjfeaMrA3zrJCRJmCbF3zWY=; b=VfuvE/2IHZ0XpQ
	kqn49DtWfamZ9Wn8dFX4xYvKceND80VPW6VjBlNDO2QW2R7grren1J0Lxk9DbV7cE3GY3gYotNsUU
	4DTj9PCi/wC8lmMHBUCtncve/cK6S8Gnskt6CJhCEVMB4qiURLDvfmw+sl1HW7lrAbGiLtvKR/Mgo
	zfgDNdd0BfL0QbIA6nE2lA1xawtSHCAM8qCxJZ/EJACyyBiu1v/b1ZGkdalkG4uKLwMxm/o3lqv4j
	ECoiRyXB86ob3rs3KDKUbvzPCLkOhHEKTiYN4LWyVw3DRsGAWjElLmdlpRYvZxna2a9IVCqYSonQT
	50BeveH8H95ZeUqEpXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Y7X-0027o9-1P;
	Tue, 06 Jun 2023 14:57:15 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Y7T-0027jT-0j;
	Tue, 06 Jun 2023 14:57:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686063431; x=1717599431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MQEsBJHaYbXDRD+nEVDnWSxOpbHnEjtxUPCk18s4my8=;
  b=cK4T5qCi9H60DlT1zkx353V+gKgSQzX8duPBBmia6CVHfArGMGARTuMh
   OUEORa1tB27b2q299Wje6JNRc3LrLD40YQgfyF8IcCuvUNBBIcuHy9S+f
   cfdKIBmyCTkPFqgVp+gKeiNvemrpTTrczzr2V7kFgyDB/TSdZ9mp3yF6Y
   1ZnHcBL/T3cRt1/bDPqGm3Lqz0MbIRAGoWBPnipghTw3wNKjpno+AEAwK
   RjArHfrtak5sWD/kriWaSR+0p6sTVS0gcJM6wrwJIhnnzG/GG7RJzoz1/
   TB7DuVLYPNViRc2uiJ3Dd60mplfOcr+17CaYgx50Pfx2D2DU8mvtpZKjF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336323091"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="336323091"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 07:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="774156290"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="774156290"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 06 Jun 2023 07:56:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q6Y74-001gNE-2K;
	Tue, 06 Jun 2023 17:56:46 +0300
Date: Tue, 6 Jun 2023 17:56:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v2] meson saradc: fix clock divider mask length
Message-ID: <ZH9JLtnlvEbgh+wD@smile.fi.intel.com>
References: <20230606135017.4141617-1-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230606135017.4141617-1-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_075711_308495_5077006D 
X-CRM114-Status: UNSURE (   8.66  )
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

On Tue, Jun 06, 2023 at 04:50:17PM +0300, George Stark wrote:
> According to datasheets of supported meson SOCs
> length of ADC_CLK_DIV field is 6 bits long.
> Although all supported SOCs have the register with the
> field ADC_CLK_DIV documented later SOCs use external clock
> rather than ADC internal clock so
> this patch affects only meson8 family (S8* SOCs)

The longest line above has 60 characters, isn't it too wasteful?
Can you make it ~72?

Code wise looks good to me.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
