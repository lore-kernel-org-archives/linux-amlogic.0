Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8306C25B10
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2024 10:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XejWna4N6O4wi9oIfUN6xXwsiFuS0flAAScvit0dTmk=; b=Yaurf32njavxTf
	lDUZuG85UW6ktm0PTxTMJW4VOjCVBXCiQpiD8lcoX8tWsD/IKUBEifzgt0zpK+8YtI9+A5zr6TNTR
	5sPPM3b2an76RUHdvG5bOuhPAneAPnMczyFWART/djGCB7VmHFq46DA5gX7W6FYeTUaBYPax7/jvZ
	dwNpkLG7FNprB/+GyOTPhhqCQQN+U+JCLoflFRUtUeTpaUcb/sW7pQlHPaDgTixjVthCaYkAlc5J/
	hnJaWJBdtxk7v5KNlP+PA466YWcKqn7531f8tdf2waWCQgiqpSkaPaFF9MQDqx3y1Guik0zDb7mCa
	HfbEYHICkQj9eOFmZpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OCW-00000002FnQ-0dSj;
	Mon, 29 Apr 2024 10:25:36 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OCJ-00000002Fi5-2MT4;
	Mon, 29 Apr 2024 10:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714386323; x=1745922323;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BSxkbBdK70uPefLrVg5yOQ3KIh93f8UTGSR+QBBryx8=;
  b=PvVWq2ZtmKbucLWwJo+/g8wgj8mAgtRo7eG9Wci3P3WAPxJH9HajZ3+6
   o4z/SrH2a26wzrn5KGmYH1jB/MehRObn6BkIDKtqVwPoQFqT1yToaZLo8
   VJegWtJptFA3Ygs4rWgeOTiEpBNyWQwV+O396SojOzDDuJmM/s8TTm0bK
   UoDTaxfMBCZWtEBLU52CY4vUmsXIO4AKgA68jK/WuGuBBfyxVVLQpP26n
   BCiA/ph0VplCnj5j6IsUg8QlfTTfpNtcdV2GwxJotek+Jq3iXb5wFHTIB
   2GEt4VMCYQn+ubKwYZQoe74e2nEACYbe6jrO3hcsY1mC8rEcdlFcD5EPa
   w==;
X-CSE-ConnectionGUID: PRviIPBWSniAz+0XHqEYKQ==
X-CSE-MsgGUID: bNDRV0AaTIqNFvbQLJ/DBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13827907"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="13827907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:25:21 -0700
X-CSE-ConnectionGUID: eTitjhPcTPOhtWqwOYqo5Q==
X-CSE-MsgGUID: kiuwJZZ9SPKgOBlYns0TzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26475172"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 03:25:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 827C115B; Mon, 29 Apr 2024 13:25:11 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [PATCH v3 0/5] PCI: controller: Move to agnostic GPIO API
Date: Mon, 29 Apr 2024 13:23:17 +0300
Message-ID: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_032523_640690_BF18ECF0 
X-CRM114-Status: UNSURE (   7.71  )
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

While at it, remove of_gpio.h leftover from some of the drivers.

In v3:
- added precursor patch 1 to avoid build errors (LKP)
- used GPIOD_OUT_LOW instead of GPIOD_ASIS (Mani)
- added tags (Mani, Frank)

In v2:
- combined previously sent patches into a series (Manivannan)
- added tags (Rob, Manivannan)
- converted iMX.6 driver (Manivannan)
- dropped leftover in aadvark drivers (Manivannan)

Andy Shevchenko (5):
  PCI: dra7xx: Add missing header inclusion
  PCI: aardvark: Remove unused of_gpio.h
  PCI: dwc: Remove unused of_gpio.h
  PCI: imx6: Convert to agnostic GPIO API
  PCI: kirin: Convert to agnostic GPIO API

 drivers/pci/controller/dwc/pci-dra7xx.c    |   2 +-
 drivers/pci/controller/dwc/pci-imx6.c      |  37 +++-----
 drivers/pci/controller/dwc/pci-meson.c     |   1 -
 drivers/pci/controller/dwc/pcie-kirin.c    | 105 +++++++--------------
 drivers/pci/controller/dwc/pcie-qcom.c     |   1 -
 drivers/pci/controller/dwc/pcie-tegra194.c |   2 -
 drivers/pci/controller/pci-aardvark.c      |   1 -
 7 files changed, 50 insertions(+), 99 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
