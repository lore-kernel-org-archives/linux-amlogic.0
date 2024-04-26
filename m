Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5E6C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=go20xzTuG3IPZ9QxJtaJoaSAWWByThkDGLOLPAhgUUs=; b=iSOgNbV2ntKGUH
	DDsD15wRrvEkYzArpLI5yl8qtvpsovqtWRSCUlnmAl4WP2Gkj6c6zLLKcEluO433yMoqaqhW6Qomk
	L9OM9ZhnRttY97K/cWvcOJCXupQihzpTnR0AXvIg/+hyG1PGDWTrvbSmhL4OSbxOiKEPjg1ieomqh
	kRE7jddOkn24OcdZ4XCdldWw1EiIvlP5Tq213Z0DRwHf2PGY0Vor/XoWINTZuIFo1+o908ofHwskw
	GK1DAjvOeLz92DkHeILuHvbbQbVwnJX23qYkZAAgtw2a2OqO3Fvpah7nfgpdV8SQqc+Q1iuBLIHg1
	UerKNCWhlwnoUdco4JUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MXc-0000000Cq3o-1Elx;
	Fri, 26 Apr 2024 14:27:08 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0MXX-0000000Cq12-1ZHs;
	Fri, 26 Apr 2024 14:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714141623; x=1745677623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RJXu2LkQVK1cV7mKmI83/hFP8kY8ALJVxwCc+HYZvWc=;
  b=c/SJ68nyEYHElKhNs0zKiCaz5e51k8IJFIMucYKSjs7VxXm2Kf+OYh6R
   PetXbimdBQZGz/2JNstvkKAwQTf2zdKBrZrLuyoGjL6uUz6Uuf9ee4qVy
   HLV1uM6dx1oQK7tPDMNnVKwVwFW+I+DGYRqOl0VKJUktOQ8IWvAOOQoUd
   +jzxBabYmt96G3THpKk1Wyq9MJabroM4Q+bUWzY+VAc9ErXJJ97xXZ62a
   rguX9e8N94ncY8lTbG3QNoxw+PBjJZaBsQCircA4vQzrSZLb9WQQ5HnwX
   LqxZF61JxJaHkQuanpT1JMG83jfS8hw/nrDEkuJZEh3GVpz+OLEo8XYLk
   Q==;
X-CSE-ConnectionGUID: G0A0whbZSEexmPykR1/1fw==
X-CSE-MsgGUID: 9jZO+C1kSCCxHP77Fjlakg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="9748627"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9748627"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:27:01 -0700
X-CSE-ConnectionGUID: Z9MPD8bKRLWZvyNzP7TRqA==
X-CSE-MsgGUID: UCa/xp75QjicJtuXgCc+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="56607339"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 07:26:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s0MXJ-00000001LQV-3ha8;
	Fri, 26 Apr 2024 17:26:49 +0300
Date: Fri, 26 Apr 2024 17:26:49 +0300
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
Subject: Re: [PATCH v2 0/4] PCI: controller: Move to agnostic GPIO API
Message-ID: <Ziu5qSjWLPoM9mbg@smile.fi.intel.com>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_072703_449423_0353B218 
X-CRM114-Status: UNSURE (   6.45  )
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

On Tue, Apr 23, 2024 at 08:19:03PM +0300, Andy Shevchenko wrote:
> Convert the PCI controller drivers to use GPIO agnostic API.
> While at it, remove of_gpio.h leftover from some of the drivers.

So, can we move forward with this series and its prerequisite?

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
