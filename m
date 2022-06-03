Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA29C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 16:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aG1cpxXZNM6t8Pv2E3eUZihEiZnFgUe5Ta2HKy2BcP4=; b=pHAm2C/FkVybmh
	KJ6/ghRhxMIfo/VMafiY3qYA82Tb1HgpC0+LdVX3QKCentUWkj7KHqTpiSc7nfVsPFnGsa5k90xSV
	cq6VIPDuEwNe4+5sHK5vKylbGGskhYToIFthCIqKEuvVHzKGwG6bVNvInneLTr2gVJDVtSVGSGrBD
	+bYTndUXCbmXVtaOEZUH3tz3qMhRdG3rFIGAn7K0A2LoKq9mYi9yXwfr7PiTgHKdQeS88quEoLyJj
	LBzVFiaHFfjyw9abDjAzJnduXFl54Ja403JOZDsU8i2rfPZbBFFgRwUQ/4yVYR85N3P/9K0S2fgVn
	Xk9uWsDV+7j7RHR+cnqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxAZj-008Dtq-KD; Fri, 03 Jun 2022 16:55:03 +0000
Received: from mga18.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxAZY-008Ds8-UR; Fri, 03 Jun 2022 16:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654275292; x=1685811292;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b+9kqzkRua+/duStmsCCB0EK7KhyEmKZ5kB1ESim+XA=;
  b=n55MFoy3q34r+EAyMwyqWwGEx3ggMTSml/XhqVysdqXLLBvfyBMaYJHh
   goWpGN20+7U7J6UU/JbFlPpaeIbGJueBPNgQbVg8bsag9NcLYqVo3f9k3
   ANUZCtpJ9B/zpXplfegoYyNDZ2YISt4pAK7rbhGPF88JrYa3MCSxldXih
   fmXMAR9NCwRu9STFsJqyhqu9ryFUgiW/4aMTxq/QumiSkieYx8BE3Y5p6
   vpjsOjO4fhxgPYxTc/4Bt5EinqbqfcNkds3P2CDElcOVdqRbOVh8IW7XQ
   YsuIehfkzMCtK5swf/Vd7RZluohJ7l7NyISp3icvZ4Tw5f4IRpWvkNW0S
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="258380426"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; 
   d="scan'208";a="258380426"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 09:54:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; 
   d="scan'208";a="563867301"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 09:54:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nxAZP-000Sbs-He;
	Fri, 03 Jun 2022 19:54:43 +0300
Date: Fri, 3 Jun 2022 19:54:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/6] iio: adc: meson_saradc: Don't attach managed
 resource to IIO device object
Message-ID: <Ypo80/NpWLLP43jm@smile.fi.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
 <20220603170612.561edfbf@jic23-huawei>
 <20220603172307.5d2f3c52@jic23-huawei>
 <20220603172920.3239bbd6@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603172920.3239bbd6@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_095453_062341_4DD11523 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, Jun 03, 2022 at 05:29:20PM +0100, Jonathan Cameron wrote:
> On Fri, 3 Jun 2022 17:23:07 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:

...

> Andy, put a cover letter on these larger series - if nothing else it gives
> somewhere convenient for people to give tags for the whole series, or 
> maintainer to say what they are doing with it.

I'll try to remember this. The series was started from only a couple of patches
and grew to this big, and I forgot to add a cover letter when it seems not
anymore obvious what has been done.

> Anyhow, I'm fine with the series, but will leave it on list for a while
> longer, particularly to get patch 6 some eyes + testing.
> 
> Currently I plan to drop the fixes tag from this first patch, but I'm prepared
> to be convinced it's a bug fix rather than a consistency cleanup.

Fine with me, thanks!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
