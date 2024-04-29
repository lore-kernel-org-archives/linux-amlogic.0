Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78BC5C04FFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2024 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boguBL952jGPWJrSvOEUPNmD39r0pEKQtGOAuKxHN4c=; b=ccSKAL/MIH6mxF
	rsCIt28dKAT/ff0DcjWwbqFRuePHI+PZRtoFecNmLAdMKoOHm1bWsUOQLuly1St40lt3jwfk+GtmZ
	EjQDYTVlTQ7IEfI091xa05zHVHwHJVmpeZLKmN31/XVA9jsXVntKN0dJNLHS2+kFVU/wreOAw722m
	65emVLD9pe60APmORkNVtaflmhFntB0l0aFwl7jNW5FFjt8VJ6iQd9LZAYWEHH9OeA3RzBUfaXcev
	JEKA6jMjWcZtQ0F24N3Kmb9W7RqWv/pcWOUdtPrDod22OT3Im9kx1h9DnrVelYpip3zXvEFW9Lh6l
	F0prz4laaf8bFWFiYLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OCW-00000002Fne-2MOq;
	Mon, 29 Apr 2024 10:25:36 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1OCJ-00000002FiT-2aj9;
	Mon, 29 Apr 2024 10:25:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714386324; x=1745922324;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/87+Jpunp1P/a+YS0O7wEX1PysDjoquFgBulttW7SNk=;
  b=eERAZ6OLzqKopbk1kS5/PUcZ9vO2xtz7iTqJPpPXaFrliBK2zJd2CJ+F
   uiarTuahHkcvxA1bq9Wf5jSSei0FcsB6V2rwF2kG63eVpTVdBh2TKAdv2
   VmpK2KL3fd7aX+BFJfE/90fn1KrTyrUpxaYXRdPQhHT0nBxBHF1EA2T7c
   CancEy12tWJ8+1rMLf53S0SqBhxo4GKDktbY8llFW3JgZGSECQbptG4lu
   AqC2QcMSAgkDgky+BY+bvir6PJKsYJLtQcV4QmQY+tqZTPQTHc9cMQv+H
   mV7C2FTXGs7G11hG5/JZhvSI6FlXq1OqbxCN2B8mI82CdQBMKCyrJ9wgM
   Q==;
X-CSE-ConnectionGUID: hutyCb4zSsCCbxgerqDVLw==
X-CSE-MsgGUID: gUphBVPkTAO0UE2tqXGGOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13827941"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="13827941"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 03:25:22 -0700
X-CSE-ConnectionGUID: aWnvLQKuQtOqZY6wYM1MvA==
X-CSE-MsgGUID: bPFGkKK8S6CWF7cZGoE+BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="26475174"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2024 03:25:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9324BCB; Mon, 29 Apr 2024 13:25:11 +0300 (EEST)
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
Subject: [PATCH v3 1/5] PCI: dra7xx: Add missing header inclusion
Date: Mon, 29 Apr 2024 13:23:18 +0300
Message-ID: <20240429102510.2665280-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
References: <20240429102510.2665280-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_032523_692505_ABBF518D 
X-CRM114-Status: UNSURE (   8.26  )
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

Driver is using chained_irq_*() APIs, add the respective inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/controller/dwc/pci-dra7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d2d17d37d3e0..b67071a63f8a 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
