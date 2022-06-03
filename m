Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3101C43334
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jun 2022 16:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DuIS0myzw8+90m791TPLPEKQohlUg9p2bcDlJkj92Pw=; b=hFosrHwrc6Ayob
	9l1V82aFo43NvtPuaKIhrmckvbFM1v6XdABr10iPsybiIAleIwRKQR8Qbs0FFHadz1WoNg2B2a7NN
	Y6INsIQUewrpj+fWr4zQYsJzgDCONaxxOe47ylsWMYAjrQmIxOXAQ/MseUJ5TkPHtccgOOAh0YYR5
	GkUYRf6xVNZMMwGruAIln7UIpbgV994HgdzokT9CF69pIubIICcMnCzHNothhRRrUpE2r3+o6kqUg
	njy4nGyZY5+7alG+7kE4FhsSK/c/eRx+NIi65xAlb9MzCF3vdcgEXPrXmT84sGlNQAsF34o/Yz+tk
	AJJ5jEw6bAJSyr31mCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxAVg-008DZF-NO; Fri, 03 Jun 2022 16:50:52 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxAVW-008DY7-04; Fri, 03 Jun 2022 16:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654275041; x=1685811041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NzC/yKGfgbXpUiptMc8VzWfAMs4deWz+1hiZ7ehs/Ys=;
  b=CDo8yHzlNijU1KWVqTWTFM7LT34J4imQMEVd0kse5/TOA/0tqS/y/nBA
   eJ58nHXI8cwh4A+0M/R3+XpTicKk/MoffdQOMbvScZ8Ehl1alHtNZ09B+
   nXyggqpTeKbfpyf2poTCJiI1ueuB7CPWzxDcBoVf8mGPskJCJcOJjCTW/
   xsMh/m0eHv489wwYnpo6nIe/iWul5l/acA6p4aZ8DR7vwt13kqd8Ru6Ay
   IVKluee4ftwr4d6mZ+TFayAdx3ZabWD2hYc0fhgoCgVqNRpS3/CmRrOzD
   RbCY5fi6jh/LgHt4H/8ay+N0t9O61xFsyLvFOO2P8YfTAiUFkMjMwVZRT
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="362664951"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; 
   d="scan'208";a="362664951"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 09:50:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; 
   d="scan'208";a="553410112"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 09:50:37 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1nxAVO-000Sbi-9J;
	Fri, 03 Jun 2022 19:50:34 +0300
Date: Fri, 3 Jun 2022 19:50:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/6] iio: adc: meson_saradc: Align messages to be with
 physical device prefix
Message-ID: <Ypo72X1X3aCtBBGd@smile.fi.intel.com>
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
 <20220603100004.70336-2-andriy.shevchenko@linux.intel.com>
 <20220603172117.792ce869@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603172117.792ce869@jic23-huawei>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_095042_090348_6CB52862 
X-CRM114-Status: GOOD (  12.48  )
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

On Fri, Jun 03, 2022 at 05:21:17PM +0100, Jonathan Cameron wrote:
> On Fri,  3 Jun 2022 13:00:00 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Align messages to be printed with the physical device prefix as it's done
> > everywhere else in this driver.

> Here I'm fine with the use of the parent as can only happen after all
> the setup is done, so it's obvious the parent will be assigned
> (some might argue it is obvious in the previous patch, but I had to check
> as I couldn't remember when we set it :)
> 
> Anyhow, LGTM. 

Thanks!

> > v3: new patch (inspired by previous change)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
