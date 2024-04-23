Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56800C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 16:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTO5ZEqELcw8SvMfV7TYOT382F+o3Dd/fxFNs1wCkRU=; b=Z7zlMVBHVDrkeh
	wBD/VYCPsptLoCjpMdcKznsbnbs5jJptS9BTKSzRpYXliYixrUE308nBSs8D0JsdxJE9h8xmUxTbv
	ZnZBUrMVvFnALhfdjpYZBwI+i962cc0vLKrftYrgAvWW/73jF2RMFwOqDPBbQl3qlrtG9CyzVxYZQ
	Sny3NCycppaP0K/rRWDr+wbqT/VUQfrSbFyKLhfc6ITK4fAQ31OFdThCAbol7Bb8ksbUB+lYiFcBq
	4CuvH9iGaJx8vzMKnm8uLe/2/VpZFOXhCxyRGA3Xne47LLGYyxQmVZ/8/gSkjBXNA/9CEnJviHk17
	3osL0PxyIJNUCDQdUnyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJBe-00000000mcn-1lf8;
	Tue, 23 Apr 2024 16:40:06 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJBX-00000000maS-1XdB;
	Tue, 23 Apr 2024 16:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713890399; x=1745426399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UZSu4Bcaj41tuZdLznVgg+wmyuxc9D7LdkUtpGpC5uk=;
  b=IuaknStN+PJTN+p6rf2cVouE9vKxsi6c1aUCtoLb+933wuJFSK16alM5
   b3xv1QkWx08xBhf36Kmm3UulUcW84YppNHDp1zYEhN7qjURaQstxQK9QX
   fkEUabmpvHnQR0yRNsK1ocuC6Ze00RDsV2Kk0UWXeiOR4u6mcvIlL5pLQ
   qHt3QANurPij5D2SJk4GCsSpQMlVhLpwKcWj+N/+iLCqC8T/lqHvOcY+1
   37m9ANzlZwO2BYQgwcVLWVby6mRh7f5JShM+YyohkqaHOZt5Td06yaBVM
   NXryFy8kNu7a1UBqiJbkffXltTvU/1zVzJ2S/NvoMCrOxM+MZvVEZXvzO
   Q==;
X-CSE-ConnectionGUID: bPVrIOIXSVmF3XgrqJ0e9g==
X-CSE-MsgGUID: EOxu+RjjQm2V6BcJ47GpSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20182275"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20182275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:39:58 -0700
X-CSE-ConnectionGUID: i4kDePn9TVuD6B1wLCiCiA==
X-CSE-MsgGUID: ce04Eyj5Q5WWfqulzqJizA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55624711"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 09:39:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzJBN-00000000Ojk-2cFZ;
	Tue, 23 Apr 2024 19:39:49 +0300
Date: Tue, 23 Apr 2024 19:39:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 1/1] PCI: dwc: Remove unused of_gpio.h
Message-ID: <ZifkVRL5Uvoso2O4@smile.fi.intel.com>
References: <20240307122840.3682287-1-andriy.shevchenko@linux.intel.com>
 <20240308095547.GI3789@thinkpad>
 <Zer_9VTVJqCNoOFG@smile.fi.intel.com>
 <20240308171029.GB53064@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240308171029.GB53064@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_093959_455939_C71AB0C8 
X-CRM114-Status: GOOD (  25.37  )
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

On Fri, Mar 08, 2024 at 10:40:29PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Mar 08, 2024 at 02:09:25PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 08, 2024 at 03:25:47PM +0530, Manivannan Sadhasivam wrote:
> > > On Thu, Mar 07, 2024 at 02:28:40PM +0200, Andy Shevchenko wrote:
> > > > of_gpio.h is deprecated and subject to remove.
> > > > The driver doesn't use it, simply remove the unused header.
> > 
> > > What about the rest?
> > > 
> > > drivers/pci/controller/dwc/pcie-kirin.c
> > > drivers/pci/controller/dwc/pci-imx6.c
> > 
> > Have you chance to look at them?
> 
> Ok. I failed to spot the usage of of_get_named_gpio() in both drivers. But you
> already submitted a patch to convert kirin last year [1], and that didn't get
> any love from the maintainers. Could you please respin?

Sure.

> Perhaps convert imx6 also?

I'll look at it, if it's easy enough, why not, otherwise let it rotten for a while.

> [1] https://lore.kernel.org/all/20230213180735.42117-1-andriy.shevchenko@linux.intel.com/
> 
> > > There is also one non-dwc driver:
> > > 
> > > drivers/pci/controller/pci-aardvark.c
> > 
> > Keyword: non-dwc.
> > This patch is for DesignWare controllers that confirmed not using the header.
> > 
> > > It is better to remove it from all PCI drivers in a single patch.
> > 
> > I disagree on this. These are different drivers and even inside DesignWare not
> > all of them can be converted with a simple change like this one.
> > 
> 
> Since this is just a header removal I thought you can just send a single patch
> for these drivers since there is nothing special that warrants a separate patch
> for aardvark (both are inside the drivers/pci/ hierarchy).

I'll look at aadvark as well, I dunno if it's simple removal enough there.

> But anyway, I wouldn't press for it.
> 
> > That said, please consider applying this one as is.
> 
> I can give my R-o-b tag, but Lorenzo or Krzysztof will apply this.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thank you!

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
