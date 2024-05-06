Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9875EC10F16
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2024 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUgmfwwvqmzjk1ekMeU+fDkVLsgzcp+WaQqgOFyc6Co=; b=T37iw+KYS6/RFj
	C3sT7T8a4wrEXdrw2RuF1s0gJldUs9HnQzD6wJPJrmK6paS7P5NoXqb6hL+xwFtNfoqvIindSWLPV
	MgEuMD7knlqtnvFV5nOnwgO895Za3hdu6kPGa7jYLIUC+2mRC9mseh66cFIb0SUEyR+fED1k8tNsx
	XJBXB79P+zLSfFEQbzZhnC3SMCZ+v8ezzOnD1F/6n+cMjkKZOJKt3aW5TMMIsiZaqECsyRN7P79GR
	JEVGOrBgLUWQGEnciFYfx0Vr43HyS2rvAhtPFSGy8CC/TSnM1Rve74TPdUNXLz5YPzExglZoesyTM
	hEv7Gb+q71GJWyxxoNBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vtd-000000070uE-0sl1;
	Mon, 06 May 2024 10:48:37 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3vta-000000070tD-16Uj;
	Mon, 06 May 2024 10:48:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714992514; x=1746528514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Hkr65neol7moVbYcz4JhrxGkKmAFlo3QCts5BAX/JeA=;
  b=I5OYOHvCkgzIOs28MPYyJ4rL6l4+S9V6fmdgUHfxSnBTOS3ZK7F7l11g
   /GIQ90grKsz+tlDO4rCKDYSw54/fj8uA+UPheQHrzMZWiy5wcbiXxqpxx
   z4x5aZaCVoz8+TPtrtITKvlJi+kG0x71hIg/sPye8GC5fSfDawJLub6m7
   k+CgCcm5geLkKHDEQK25SKWO4w83VNc6B3d3kPcjS/jQ7a/idThVE2W9w
   Q7JDCz30JSb8Cmx9dI7t89Zb0nBi6SD1r5Y5St11xkgRIyQlc/E9Br7wF
   oRDUxWiqeD8TgOjixEWGs73VNDrnwaliLQU8357BZmwNn7xe0MfZo5IEY
   w==;
X-CSE-ConnectionGUID: DRe5LJiVT4yZs4XkTuIrBQ==
X-CSE-MsgGUID: JqXjhFtDQ7Kxpcr/8sVY+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="22141468"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="22141468"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 03:48:29 -0700
X-CSE-ConnectionGUID: gfqCPeZeTiqvdoy3cHNrAg==
X-CSE-MsgGUID: TecDTmn/SAqaUoRMU8GFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="65568146"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 03:48:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s3vtJ-00000004ehl-02rk;
	Mon, 06 May 2024 13:48:17 +0300
Date: Mon, 6 May 2024 13:48:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
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
Subject: Re: [PATCH v3 0/5] PCI: controller: Move to agnostic GPIO API
Message-ID: <Zji1cEqUMZOdk6QN@smile.fi.intel.com>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_034834_460060_994DC472 
X-CRM114-Status: UNSURE (   6.78  )
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

On Mon, Apr 29, 2024 at 01:23:17PM +0300, Andy Shevchenko wrote:
> While at it, remove of_gpio.h leftover from some of the drivers.

Can this be moved forward?
Or should I do something additionally with it?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
