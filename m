Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BBDC4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 20:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLFNtAlRMspxaMOoJqn5DcLaQLgeHMgHergikEuxa6A=; b=wlXsJ0mhBCT7Nc
	4700ry8gzEUkWy39YJbq3jsqKARNiY80z86vREyD4qEdBvXqcLPhquK7ismZ22SHmDjK6LvGFIkZF
	cthd7WomWslp1px0aV7teCTibbZ9yHYqSn8VqeAS6DG9oXK7cGsLA7OKSitQqOkY1QcCdKC0l/Pxc
	tRAqkTP7hLcsM+HyvCD9k6gaLnqEDQXsHMaNOelXetvutP1FB3Ndo+zr6mYsR6VUSq+HNYDJdFNhS
	C+h+8a2hTNCqJ8g3gaJSbifelDMdij4lZ7B6b/Gvx2mvVcT8DapSTSCqGIStZKL/UxFGAO1BolpOO
	WEu7h0d/ffpY2YcWwvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzMNI-00000001Mhu-2BDR;
	Tue, 23 Apr 2024 20:04:20 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzMNE-00000001MhD-3ClG;
	Tue, 23 Apr 2024 20:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713902657; x=1745438657;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EUJ5LGU/8rzeyG4lTaZK13osGBD9kQIZNmjQSYrpH2Y=;
  b=ZzblwhtErAfvcENrIWxUp+cbZ/Qy5FFCRDZAjFXF1x0CzAgDmiH3fMOW
   j60xt4WULRMOrOegnzGJT1Gj/pejFrS60A3AadFOEZ0zpm2+Gij1LlPXk
   0Hf42fZNyurhNE0jdFTJ04nh672ofTwFsc53sClAz6G1YNBIjRaJcQraq
   jXZYuiMftJBW4JBNH/gq4L07vZBrpVZTqcyFdRE/oI+t1uCB85Q4q6FDf
   Mb+iOZetIgYsZsA7FozkrUgNHUNk3yMIDdJtjf81ZsRZ8lCwaeoKOTPf6
   uBmYuPjPmK/+U52noV4NO9ssX1lp19t7ntrlhhZYBzAByhyaOevms5ylw
   w==;
X-CSE-ConnectionGUID: uMCIXqCrS0aRk7u+oRFQ1Q==
X-CSE-MsgGUID: e2LcHKVSQ3m8vzyosgEv9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20121412"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20121412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 13:04:11 -0700
X-CSE-ConnectionGUID: jm0sMGbqTauuhA2EjqiNlA==
X-CSE-MsgGUID: 4AudXI+ZSV+tSzYw/JyrDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="29124283"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 13:04:04 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzMMy-00000000SbY-00GQ;
	Tue, 23 Apr 2024 23:04:00 +0300
Date: Tue, 23 Apr 2024 23:03:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
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
Subject: Re: [PATCH v2 3/4] PCI: imx6: Convert to agnostic GPIO API
Message-ID: <ZigUL7exXBSbWDIR@smile.fi.intel.com>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
 <20240423172208.2723892-4-andriy.shevchenko@linux.intel.com>
 <ZigSiCBIwoEIPYoG@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZigSiCBIwoEIPYoG@lizhi-Precision-Tower-5810>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_130416_841403_561E3ECA 
X-CRM114-Status: GOOD (  11.06  )
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

On Tue, Apr 23, 2024 at 03:56:56PM -0400, Frank Li wrote:
> On Tue, Apr 23, 2024 at 08:19:06PM +0300, Andy Shevchenko wrote:

...

> > +	imx6_pcie->reset_gpiod =
> > +		devm_gpiod_get_optional(dev, "reset",
> > +			imx6_pcie->gpio_active_high ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
> > +	if (IS_ERR(imx6_pcie->reset_gpiod))
> > +		return dev_err_probe(dev, PTR_ERR(imx6_pcie->reset_gpiod),
> > +				     "unable to get reset gpio\n");
> 
> Small problem here. err message "unable to get reset gpio\n" will print
> when -EPROBE_DEFER happen. EPROBE_DEFER is quite common when use i2c
> expand gpio chip.

I'm not sure how you come to this conclusion. Can you elaborate, please?
P.S> I do not see a problem as described.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
