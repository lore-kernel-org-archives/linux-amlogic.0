Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F780EB64DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DqxTch5I6+pjXdtr2Dj35IxeSt014aYNIvCb5MiEOEw=; b=KFokYnhp97frsq
	vWbH3BtQQI2lxEL3rBnO7c2M8c6hKTo/x4d//JNY6562vNt0Y+n9JBWAq5aCBhhCd/OBsRxTaixBh
	IJt0APGZYVJlFYgwa9D6KeEq6br6ZUzIpYYsz42pdBQ+sv9Ellm6KMhE776FTC7tHawLj81i+qtf8
	od3TEvx2zp/geN0ObI7Ric4/mTmG7WlZEYaCKiYm+bzzb94DpDdId3bHIDSSzDxd9I0wZsmM7trpT
	fVe0n40z947eiVneJMx3mry/WcCYxG6Npq33gnFd36V6Az24xKAywGfZpCpbSVgevkw4TFgvM0rf/
	awT5CQ8Xq4r2D5/mMQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInAk-00B01g-0o;
	Mon, 10 Jul 2023 09:27:10 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInAh-00B00Q-0l;
	Mon, 10 Jul 2023 09:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688981227; x=1720517227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I/WgV0sJEPaUA+jyYm6Sf1+ATnzrq8IVU5O5blbvl3Q=;
  b=HCK1VP675Td8FgqFxbdjG8LEYsLZJXWdQ2bydtSwhjTZyqkLnu246Xnc
   zBoqbmPsmOr44BR99GLYDHjurgIaDFRKvsbwSFLKyGtjW8wkNtxYNVBV2
   dqvP4+jLhrZECDEEcNY5NhATRHheCEeJGbGgw0PtXTID7lnYYPmoXErx0
   0IHA7+Kqvae3K/FXfKBr9c6d4islq35o/6H6iraLtripxEHM/DiK0aSqC
   xKxUnWD6mOEl7a9HMtJNu2YAdY+bvpTKBwSlpkqxogqIB6FBUSM1HIHWe
   UOAM51a2NRsRFJHlXsnCkAIBdLZXlXBRowA/wSsTb4UB/zHHMDt7+f7jD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364334370"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="364334370"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 02:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="697936671"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="697936671"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 10 Jul 2023 02:26:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qInAO-001VsZ-1g;
	Mon, 10 Jul 2023 12:26:48 +0300
Date: Mon, 10 Jul 2023 12:26:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: George Stark <gnstark@sberdevices.ru>
Cc: jic23@kernel.org, lars@metafoo.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, nuno.sa@analog.com,
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v4 2/6] iio: adc: meson: move enums declaration before
 variables declaration
Message-ID: <ZKvO2Fm2PL/Fsb+0@smile.fi.intel.com>
References: <20230707153322.114302-1-gnstark@sberdevices.ru>
 <20230707153322.114302-3-gnstark@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707153322.114302-3-gnstark@sberdevices.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_022707_289058_9D2E3AA0 
X-CRM114-Status: UNSURE (   6.25  )
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

On Fri, Jul 07, 2023 at 06:27:39PM +0300, George Stark wrote:
> Allow to use enum items for variables initialization.

"For this, move enums upper in the code."
?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
