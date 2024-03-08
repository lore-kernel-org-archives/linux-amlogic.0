Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB87C54E4A
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Mar 2024 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Zbj7qMK4HDPEjlR4k+gGoCiOCu1bFKPnRiNALyWhGI=; b=FseXMWWktwJJR6
	wDGig9cFVTeRVtPwg9AkvG31EyDow2E6Kp4MDhEPMmNNbK9kbW1I1EuqVB/N4iO17m9Z8PPNtyCEB
	w9QEgrrm2rgms7maLXSv3SeCJ3B39wVLpqMpWXC73HvUJVcxibowH5N2/rvPQTP80k0JZpRwf+Ifp
	0U0HNOqihycXfsuKt/nda8NpnsGKtyW/Vu3Iit1Q31rxSDP1R2in75wXLgdLar8OZMppBjkZNhbgz
	MTGAvrYkFpl9Vsq7POEb+VH26R45os5ooAiJeqPdvRNg1CKGGBZS8CxAF5bc6ApyIHTHebmzANqIk
	93NyCdALBFt48jmHu+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riZ2l-000000094R2-2oAR;
	Fri, 08 Mar 2024 12:09:43 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riZ2i-000000094Q8-1IBL;
	Fri, 08 Mar 2024 12:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709899780; x=1741435780;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=47pcurjwzPpbUDu63TliTFtfRuG+YF86mZd6kUPfo2M=;
  b=jEhNVMavc0roGY3VdK43lGFzo7DKjb2ByqZdI/ilOz93VskkGSOZEQOH
   q+voLdzuJMQDcWAJ4KK8OQgzHopwM3xldNUhFSWf1VUaR0DAUHaw7Usk/
   yBbN4RUGebvL1WG/j61qi6xp0WweUKDVOIcTZwJupaUfsmYNRhXqKKd0o
   tce+RfbrsyT9rePWM4fxBFdxMciBmZCyhh93bxwKJfP4n9RuGaV82J0cH
   Sm4WYB3AxYYvRqQtsKnim2diBCk6MJ3FzBvbOdgdNCkJ7/KLUaBQHuP+T
   5VK6+1Juk7tKTVfwTiyvDg1NIJWX89Wi0JPkzScbP6pNmnOXwOY1QwXOh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="30058158"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="30058158"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 04:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="914244912"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="914244912"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 04:09:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1riZ2T-0000000Apo3-2KVa;
	Fri, 08 Mar 2024 14:09:25 +0200
Date: Fri, 8 Mar 2024 14:09:25 +0200
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
Message-ID: <Zer_9VTVJqCNoOFG@smile.fi.intel.com>
References: <20240307122840.3682287-1-andriy.shevchenko@linux.intel.com>
 <20240308095547.GI3789@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240308095547.GI3789@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_040940_460187_9E0A5C49 
X-CRM114-Status: GOOD (  14.48  )
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

On Fri, Mar 08, 2024 at 03:25:47PM +0530, Manivannan Sadhasivam wrote:
> On Thu, Mar 07, 2024 at 02:28:40PM +0200, Andy Shevchenko wrote:
> > of_gpio.h is deprecated and subject to remove.
> > The driver doesn't use it, simply remove the unused header.

> What about the rest?
> 
> drivers/pci/controller/dwc/pcie-kirin.c
> drivers/pci/controller/dwc/pci-imx6.c

Have you chance to look at them?

> There is also one non-dwc driver:
> 
> drivers/pci/controller/pci-aardvark.c

Keyword: non-dwc.
This patch is for DesignWare controllers that confirmed not using the header.

> It is better to remove it from all PCI drivers in a single patch.

I disagree on this. These are different drivers and even inside DesignWare not
all of them can be converted with a simple change like this one.

That said, please consider applying this one as is.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
