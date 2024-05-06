Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124BAC10F16
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2024 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FjFHj6Bruskv956Wp38i9sDhMfUMOALesL7uGJkxqzs=; b=d5Yl5wJXCLqv7C
	eCXstqn+FYfdIdheFxY0f+egbnmhN76gxmUEbDZiPZzpKoTtxRdfgVhdwa9Tzhtdj+d73WLefXu1E
	e+EHT2BDf0J3IRvG7BeiK0r5nQY9vWVhP3UfCGcaq+awcingTGO0u/Mqdy32LgtC+b+jkejWWaxxT
	FaapqQ6oHWVC6gXkPsCy2kYqDsSTNXCXqPFYQ5Sj1WICPbiAmDhGTECMKxqeFCHpEsDyQQW8QbZnv
	4bttpYavx9eJNUiCrO1j4TTkQEm+63pXyEcDd+Z5Gg190TNscF7Em9HkobeC7yn5rzJHLWHfoffAQ
	9xnDAm+hESUqZ/ZIncGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zEK-00000007dpy-0CJy;
	Mon, 06 May 2024 14:22:12 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zE8-00000007ddz-2Z5K;
	Mon, 06 May 2024 14:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715005321; x=1746541321;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q6wvxPR0ih++7Mokt01obdSM7aO9GEPlMf6UMIVpETA=;
  b=IJKUDEw9P3txDMHvxdMKsBMpmeZt/4KhXFII4U2tXVdinVHS59Wr+39t
   /L91ZY2xGbvOkulltWGIab2PC1thzPEavU5krtw1E9tAeIe1IT6VAIXTe
   G16yb2CpnF1s7CmN+YhUSTiH+7qYLx19MtlI5DzIg4xv38c/o8TPOIyz0
   4AEXAY2JAstBmXXhSsqQormlro5ADhI7+XG1J33ApD2lopY031H6wMHD+
   Xo+nrM0XWgUXpz9VkN9kpMStJV6tnswo1ON4hdOIXYgfFhn8YtTolQqxY
   9vLq1a/36g4ej2HuqVHyN6J66bSYhzSoWgev2YrrDFyRpyTiCsKbM4Yq3
   w==;
X-CSE-ConnectionGUID: m5Pma8CZS3GTRl/6aqNuqw==
X-CSE-MsgGUID: tAOvYB4eRh6+KQGnBbVovg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22155558"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="22155558"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:21:53 -0700
X-CSE-ConnectionGUID: qvt0cQ2DQUCIlIa75LChlA==
X-CSE-MsgGUID: 6EhTFntRRUmP7O47GmpzcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="32988757"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa005.jf.intel.com with ESMTP; 06 May 2024 07:21:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 00749161; Mon, 06 May 2024 17:21:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
Date: Mon,  6 May 2024 17:20:36 +0300
Message-ID: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_072200_749881_386222E7 
X-CRM114-Status: UNSURE (   8.11  )
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

In v4:
- added tag (Mani)
- fixed a polarity bug in iMX.6 driver (Linus)

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
 drivers/pci/controller/dwc/pci-imx6.c      |  36 ++-----
 drivers/pci/controller/dwc/pci-meson.c     |   1 -
 drivers/pci/controller/dwc/pcie-kirin.c    | 105 +++++++--------------
 drivers/pci/controller/dwc/pcie-qcom.c     |   1 -
 drivers/pci/controller/dwc/pcie-tegra194.c |   2 -
 drivers/pci/controller/pci-aardvark.c      |   1 -
 7 files changed, 46 insertions(+), 102 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
