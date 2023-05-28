Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5560C77B7E
	for <linux-amlogic@archiver.kernel.org>; Sun, 28 May 2023 11:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNKeNOaIL89pAq9JG3umecI0JeqjvLph8Qdt0xOjgj4=; b=D35h4027eY/4PB
	/2h7LnJM9WAcmbpzBWQ/Lzu2gkpnHUuswVuVOzGaI2PvvypLXSi7JGI9ExwrQbcNQy+SODi5rRw2Z
	6rV0AmiiQSE+9jdaO4paVCC7c7CrKU8kODw/+r8JWw6giOcwDvE/6tspp7Cwa7kHx8qLjQkTdjQCE
	I4pZCkmzFDv8VJhqakmVErP5KQ7rMmogJa0gsVECzmc7JQdaTqMlebFQDeR3kD9fZwu8OP2r5NWQe
	TsLFFGrK4iqOoubGv4DYxFHUqCHkLim34wLG80vx3uKTo7ts5VtLoMSOoixMIQyRKpFBbOypH6zrl
	vwoP5ZZMOXxiMXVQbcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3E8O-007UmK-23;
	Sun, 28 May 2023 11:00:24 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3E8L-007Ulj-0d;
	Sun, 28 May 2023 11:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685271621; x=1716807621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g6CoUCTMZtyvKD2xXLW4r5j8Ly+rx8jj6t/ryWbIQPc=;
  b=Txn7sH3AA1NdqCXwd9xCanrHxLla6MXswlKQ1mgCjtr3Pkj/LzrE7u9/
   FDh1qCkZq8qZDIpjanNr3mGSrYm1zkAYL27k3ZAdA4rvUOA8EicmxUOZQ
   ltonAKzZO9cM0fbH5XuiZpcgUs2je3YvDoZ5UIHZ8r8MhiCwL/Vk2m2zu
   0YO8BYn41KyvsB7dThaLnCKNA87yejpsx8xYD5DdZJ6NP72q8rrdRZVCw
   oasvyl8Q5pqJv4H+IVy1pGrDrf/KfjsIYR0cmeAsuEBa9qeX1VUS/CQY7
   nx2WmeKkR76671f78ut77oxH5vDHeW4832Amb5EmCiCFp4Gp84n/Mws2I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="334128584"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="334128584"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 04:00:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="952402178"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="952402178"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 28 May 2023 04:00:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q3E8E-000JkD-2R;
	Sun, 28 May 2023 14:00:14 +0300
Date: Sun, 28 May 2023 14:00:14 +0300
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
Message-ID: <ZHM0Pheg047fYJXw@smile.fi.intel.com>
References: <20230527214854.126517-1-gnstark@sberdevices.ru>
 <ZHMxDHPBWQOJSuaZ@smile.fi.intel.com>
 <ZHMzGHsGEylDdgg7@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHMzGHsGEylDdgg7@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_040021_308685_29E5A489 
X-CRM114-Status: GOOD (  11.01  )
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

On Sun, May 28, 2023 at 01:55:20PM +0300, Andy Shevchenko wrote:
> On Sun, May 28, 2023 at 01:46:37PM +0300, Andy Shevchenko wrote:
> > On Sun, May 28, 2023 at 12:48:54AM +0300, George Stark wrote:

...

And last but not least (I just noticed how Cc and To is formed in your email),
you may utilize my "smart" script [1] or ideas from it for sending patches to
the Linux kernel related mailing lists. It will automatically provide Cc and
To with a good approximation.

For v3 the command line can be (assuming your patch is on the top of the
current branch and the script is in the one of the $PATH folders):

	ge2maintainer.sh -c 1 -v3 HEAD~0 --annotate

this will call for editor, so you would be able to add Changelog after cutter
'---' line.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
