Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A710C04FFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bb6Ac6ht/Jlcb9Zc/IwM29alwMSMW97X1xsqyKZNDKw=; b=rBAdsOBg3HPZUQ
	IbhWi23U96Ri0MpWSBFSNerczRk16DRj/nvPKfczNnsIgyntycgQ4PP10WJu1bZ0yLEbiqWEDOnub
	BQIlIZZkcThHRwq7o5GDOpzJpn9PfZKUnOnJizHi5j7vvxyScwEPVqcQQB8Z+cuE5Bl39PEB3T8Vi
	aHsrZTOOogBhcy0AGNdX2elJAoKauf/KSjXamZiVv4qbZAOw5EHIYHIWjqsmVeLXk0xAKCo30vUfw
	qhg0SqEqRYO0LBtpQdHssDc9nLAzMLi/NR9CPwoQspkaMZ3DyIb3ZmquIjo4jat3rCSKPQt2yx3rG
	ayMByZNOeQvqu0ga3T1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJqy-00000000x9e-1JZe;
	Tue, 23 Apr 2024 17:22:48 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJqb-00000000wrc-0n3B;
	Tue, 23 Apr 2024 17:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713892945; x=1745428945;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wS6mLiwTSrStK6wq/zzMd+gLFuAwWxuYlHIG5FjkkyY=;
  b=XU+VCsorashs+Eitdwz19vTnCa3bgp8wrTmsvoaX7jQfhBtgyNueK4pa
   gfBK3Y1uACr2HnILykA6Zc3Osk5ZjngOz/ix1jthxEKHakRniUtPKGQ1/
   b6fgP/3rTkPvyHpOs6muMjnsbPSYb8eMumRfSk62B18K5jQ5NOZNAUwSS
   Bh+Uope6r7U5qMGbTL2DH1Nffa+eqjkaHoYEMXgn4dOQdrHGcwICdNMli
   63xGfSCgcytE8B+A/e5S0BBJzKDIgNt06bBj5S+9fizIQKnTfpRKmOFTc
   K8U8Mr6X6On7MPp0Jr7HTu6w8NbN7rWcrifgVzJsE/WGXTwBEHzlu8ypv
   g==;
X-CSE-ConnectionGUID: MNvPH0AXTxy43y2AEO/byA==
X-CSE-MsgGUID: OR0DG/gtR2qTDQdGU+Rm6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20898288"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20898288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:22:20 -0700
X-CSE-ConnectionGUID: Dr85zdv8Ry67lMcR78sHfg==
X-CSE-MsgGUID: T1Zw1WYoQVO/2Au0vKgZZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="55410233"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 23 Apr 2024 10:22:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6E4F8192; Tue, 23 Apr 2024 20:22:10 +0300 (EEST)
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
Subject: [PATCH v2 0/4] PCI: controller: Move to agnostic GPIO API
Date: Tue, 23 Apr 2024 20:19:03 +0300
Message-ID: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_102225_285359_749777B3 
X-CRM114-Status: UNSURE (   6.08  )
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

Convert the PCI controller drivers to use GPIO agnostic API.
While at it, remove of_gpio.h leftover from some of the drivers.

In v2:
- combined previously sent patches into a series (Manivannan)
- added tags (Rob, Manivannan)
- converted iMX.6 driver (Manivannan)
- dropped leftover in aadvark drivers (Manivannan)

Andy Shevchenko (4):
  PCI: aardvark: Remove unused of_gpio.h
  PCI: dwc: Remove unused of_gpio.h
  PCI: imx6: Convert to agnostic GPIO API
  PCI: kirin: Convert to agnostic GPIO API

 drivers/pci/controller/dwc/pci-dra7xx.c    |   1 -
 drivers/pci/controller/dwc/pci-imx6.c      |  37 +++-----
 drivers/pci/controller/dwc/pci-meson.c     |   1 -
 drivers/pci/controller/dwc/pcie-kirin.c    | 105 +++++++--------------
 drivers/pci/controller/dwc/pcie-qcom.c     |   1 -
 drivers/pci/controller/dwc/pcie-tegra194.c |   2 -
 drivers/pci/controller/pci-aardvark.c      |   1 -
 7 files changed, 49 insertions(+), 99 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
