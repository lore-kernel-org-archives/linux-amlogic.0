Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A96C04FFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2024 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjG4RsATvAurB55ZmTrlftcH5+I/oViZ2HGb39Xsv44=; b=3SCpjjjDUkV6hc
	iZWMMQi0wSbJLDUirUcFukc31ZNqxUBFsopplfhdpJUDmsenVU2etx6nak6qfCPZEPpchhNkLO/E+
	J3suVc2NFFEHq0J2MlkdVhUXfBEd/2u726ru6s+NFD5P/Fzg7RqTogGEYs2O8Jsl0Vsp7Z5qA3sO/
	TqvM0iV7vqfySI5KLRWgVm8f2Ez1VsZec2+kWbMTHxMDldk3NwF9VebG7GUJ5VXMTjrDWnzF3oqrw
	QNZsMv9s9t/Q4T8UPm9BBEyRrWVaT5ABgor/PAbON+5IOHDIZZc88rKEUMd2w+SYlsYLz/YN4IL1D
	9IziDhVuVoNBJU5k0JIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1MgH-000000020DQ-3C9t;
	Mon, 29 Apr 2024 08:48:13 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1MgE-000000020C0-3BdP;
	Mon, 29 Apr 2024 08:48:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714380491; x=1745916491;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z8WLMcuvoc4LDhYSNGhPtCPz11xVNOa8e2sBdMQx030=;
  b=EnEBed95oZIwghbsVlfceAECs5pwD9efz1XZOK81ff/BztJKSShBOtYW
   IFjdW+HxWZU8Q0mav+QBriP6Dq18Kkjptuu2ymS8obNEUOkHQ52erp8m/
   52wQlgdwsn45jPN6FjqrCW3kWeK6kLf0oD4c1rfnA4NPGuXNoE7IhTgjF
   rlz0nF0CYXiL+f7Mb49wsxP4LCrCBdoa362+ruwWEaNmgjENWmaMAv7wT
   BJxNtfmuUsWdD1oY8q5NLmcosxHDwMw+Tnp9aO6XYyaZ3r4xAqds4I+u6
   E+tUArw5DQIiSchVobVexo8ag32S4GAol5by6sHlgdDRXEFDnDwXP8cPt
   w==;
X-CSE-ConnectionGUID: vo3j3ynWQWK5j+wA55nabw==
X-CSE-MsgGUID: 5nlLHu+aQKa47YvA4Rd3Pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10143313"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="10143313"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:48:09 -0700
X-CSE-ConnectionGUID: 6In1FgQkScO0LRKeS9iqeA==
X-CSE-MsgGUID: HTM8jSzOS9CfPGqWX67RQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="57235629"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 01:48:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s1Mg1-00000002GCn-2sLU;
	Mon, 29 Apr 2024 11:47:57 +0300
Date: Mon, 29 Apr 2024 11:47:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v2 4/4] PCI: kirin: Convert to agnostic GPIO API
Message-ID: <Zi9eve2brQvKwAKm@smile.fi.intel.com>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-5-andriy.shevchenko@linux.intel.com>
 <20240427072335.GC1981@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240427072335.GC1981@thinkpad>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_014810_859580_BB153AC4 
X-CRM114-Status: GOOD (  14.81  )
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

On Sat, Apr 27, 2024 at 12:53:35PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Apr 23, 2024 at 08:19:07PM +0300, Andy Shevchenko wrote:
> > The of_gpio.h is going to be removed. In preparation of that convert
> > the driver to the agnostic API.

...

> > +		pcie->id_clkreq_gpio[i] = devm_gpiod_get_index(dev,
> > +							"hisilicon,clken", i,
> > +							GPIOD_ASIS);
> 
> Please don't use GPIOD_ASIS even if the old code was using it.
> 
> For all 3 GPIOs in this driver, GPIOD_OUT_LOW flag should be used as the default
> state is assert (considering the fact that the DT uses GPIO_ACTIVE_HIGH).

And if not? I believe we may not assume that all of DTBs around the globe put
the flags correctly. But I think you know much more about them than me, hence
I am okay to update this.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
