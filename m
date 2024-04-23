Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9C6C4345F
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2024 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGW7PTU9DMKMUq3Uq0FVUKotZaHBxwTc6/rjAFzaK0Q=; b=bIpDrVJRr2wXn2
	t4ZzROA49wf5s7Z8u8fCdZjKd+F7VaaJQmBrOTUXoEaNNqmpqwFa8mLC15tr+kgHSkxwmv8G6ldvf
	LnwBFIZhdjReo/6j4ep5nL1i9vgPz9Af3hKbwjNtMBps7ucc0yVOqJ3NuJnzWC2fTt15yUyabt3Sh
	w6+NyQqAmfU5oQoziq63xBy/UPtRvrLaDqUEhvMNVsUGeWXvAtKlBmx+/UN9aybfq+gPDoYhgwdN0
	mvIFjL/f9WBYJD89l4yBny4/SzDFwHy7gPiIA+PdvNUdgDkR1RGGGNN6Z4Jzxie5FDDJjbcyxQZWL
	rV4BR98yqX/rEWzzfAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJqe-00000000wvX-2IIk;
	Tue, 23 Apr 2024 17:22:28 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzJqW-00000000wqz-305W;
	Tue, 23 Apr 2024 17:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713892941; x=1745428941;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HQ0CAMpENoxRAc45GVnSnQeccFUmQ6Kcw6VpvHptE3E=;
  b=iWrZmXnTviH+eqeVcHbm3SXXCYJMvGxaDp+yheh0pR5P6YpqPx7lVySD
   UFICk8ATnEggssx8c1yFJdiD1SCLwMcdLNTEy+sUhS9B+l73pa8znjx3M
   5N9EWzqdyCZBtuWLmnH+s6TKJtyHuyK3ZL9oYSTtww4PfuNXQnOT6Dgb1
   nHuEcd0AcF9vN8SUtxHdRhhBR0Go/s4xT1c7XOLr30aFNLg/xHrSgUcoX
   7yEPCRbrDovQwCu0i0wodvy/XKsulmNG4rwCcadDemsX30Ryr8aPv+rjZ
   lSs39Om2+KII/nhoPk0Seq0/4/7zQRaf2JizR2wYQV4fLfHXm53O3CGIz
   w==;
X-CSE-ConnectionGUID: hwlYQcSGQaq1bMZFauCHow==
X-CSE-MsgGUID: mpiUm0zpSf64yKhXYYGlTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="20911808"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="20911808"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 10:22:20 -0700
X-CSE-ConnectionGUID: D2LsbMA/T0SHx+Ukn/Iubg==
X-CSE-MsgGUID: 3YywkTJMRTOlXe+oPfquJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="25051426"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 23 Apr 2024 10:22:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A611D51E; Tue, 23 Apr 2024 20:22:10 +0300 (EEST)
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
Subject: [PATCH v2 4/4] PCI: kirin: Convert to agnostic GPIO API
Date: Tue, 23 Apr 2024 20:19:07 +0300
Message-ID: <20240423172208.2723892-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
References: <20240423172208.2723892-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_102220_883898_4DC7E6BF 
X-CRM114-Status: GOOD (  18.22  )
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

The of_gpio.h is going to be removed. In preparation of that convert
the driver to the agnostic API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pcie-kirin.c | 105 ++++++++----------------
 1 file changed, 35 insertions(+), 70 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index d5523f302102..1753ab63a541 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -12,12 +12,10 @@
 #include <linux/compiler.h>
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_pci.h>
 #include <linux/phy/phy.h>
 #include <linux/pci.h>
@@ -78,16 +76,16 @@ struct kirin_pcie {
 	void		*phy_priv;	/* only for PCIE_KIRIN_INTERNAL_PHY */
 
 	/* DWC PERST# */
-	int		gpio_id_dwc_perst;
+	struct gpio_desc *id_dwc_perst_gpio;
 
 	/* Per-slot PERST# */
 	int		num_slots;
-	int		gpio_id_reset[MAX_PCI_SLOTS];
+	struct gpio_desc *id_reset_gpio[MAX_PCI_SLOTS];
 	const char	*reset_names[MAX_PCI_SLOTS];
 
 	/* Per-slot clkreq */
 	int		n_gpio_clkreq;
-	int		gpio_id_clkreq[MAX_PCI_SLOTS];
+	struct gpio_desc *id_clkreq_gpio[MAX_PCI_SLOTS];
 	const char	*clkreq_names[MAX_PCI_SLOTS];
 };
 
@@ -381,15 +379,20 @@ static int kirin_pcie_get_gpio_enable(struct kirin_pcie *pcie,
 	pcie->n_gpio_clkreq = ret;
 
 	for (i = 0; i < pcie->n_gpio_clkreq; i++) {
-		pcie->gpio_id_clkreq[i] = of_get_named_gpio(dev->of_node,
-						    "hisilicon,clken-gpios", i);
-		if (pcie->gpio_id_clkreq[i] < 0)
-			return pcie->gpio_id_clkreq[i];
+		pcie->id_clkreq_gpio[i] = devm_gpiod_get_index(dev,
+							"hisilicon,clken", i,
+							GPIOD_ASIS);
+		if (IS_ERR(pcie->id_clkreq_gpio[i]))
+			return dev_err_probe(dev, PTR_ERR(pcie->id_clkreq_gpio[i]),
+					     "unable to get a valid clken gpio\n");
 
 		pcie->clkreq_names[i] = devm_kasprintf(dev, GFP_KERNEL,
 						       "pcie_clkreq_%d", i);
 		if (!pcie->clkreq_names[i])
 			return -ENOMEM;
+
+		gpiod_set_consumer_name(pcie->id_clkreq_gpio[i],
+					pcie->clkreq_names[i]);
 	}
 
 	return 0;
@@ -407,10 +410,16 @@ static int kirin_pcie_parse_port(struct kirin_pcie *pcie,
 		for_each_available_child_of_node(parent, child) {
 			i = pcie->num_slots;
 
-			pcie->gpio_id_reset[i] = of_get_named_gpio(child,
-							"reset-gpios", 0);
-			if (pcie->gpio_id_reset[i] < 0)
-				continue;
+			pcie->id_reset_gpio[i] = devm_fwnode_gpiod_get_index(dev,
+							 of_fwnode_handle(child),
+							 "reset", 0, GPIOD_ASIS,
+							 NULL);
+			if (IS_ERR(pcie->id_reset_gpio[i])) {
+				if (PTR_ERR(pcie->id_reset_gpio[i]) == -ENOENT)
+					continue;
+				return dev_err_probe(dev, PTR_ERR(pcie->id_reset_gpio[i]),
+						     "unable to get a valid reset gpio\n");
+			}
 
 			pcie->num_slots++;
 			if (pcie->num_slots > MAX_PCI_SLOTS) {
@@ -434,6 +443,9 @@ static int kirin_pcie_parse_port(struct kirin_pcie *pcie,
 				ret = -ENOMEM;
 				goto put_node;
 			}
+
+			gpiod_set_consumer_name(pcie->id_reset_gpio[i],
+						pcie->reset_names[i]);
 		}
 	}
 
@@ -463,14 +475,11 @@ static long kirin_pcie_get_resource(struct kirin_pcie *kirin_pcie,
 		return PTR_ERR(kirin_pcie->apb);
 
 	/* pcie internal PERST# gpio */
-	kirin_pcie->gpio_id_dwc_perst = of_get_named_gpio(dev->of_node,
-							  "reset-gpios", 0);
-	if (kirin_pcie->gpio_id_dwc_perst == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (!gpio_is_valid(kirin_pcie->gpio_id_dwc_perst)) {
-		dev_err(dev, "unable to get a valid gpio pin\n");
-		return -ENODEV;
-	}
+	kirin_pcie->id_dwc_perst_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	if (IS_ERR(kirin_pcie->id_dwc_perst_gpio))
+		return dev_err_probe(dev, PTR_ERR(kirin_pcie->id_dwc_perst_gpio),
+				     "unable to get a valid gpio pin\n");
+	gpiod_set_consumer_name(kirin_pcie->id_dwc_perst_gpio, "pcie_perst_bridge");
 
 	ret = kirin_pcie_get_gpio_enable(kirin_pcie, pdev);
 	if (ret)
@@ -553,7 +562,7 @@ static int kirin_pcie_add_bus(struct pci_bus *bus)
 
 	/* Send PERST# to each slot */
 	for (i = 0; i < kirin_pcie->num_slots; i++) {
-		ret = gpio_direction_output(kirin_pcie->gpio_id_reset[i], 1);
+		ret = gpiod_direction_output_raw(kirin_pcie->id_reset_gpio[i], 1);
 		if (ret) {
 			dev_err(pci->dev, "PERST# %s error: %d\n",
 				kirin_pcie->reset_names[i], ret);
@@ -623,44 +632,6 @@ static int kirin_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
-static int kirin_pcie_gpio_request(struct kirin_pcie *kirin_pcie,
-				   struct device *dev)
-{
-	int ret, i;
-
-	for (i = 0; i < kirin_pcie->num_slots; i++) {
-		if (!gpio_is_valid(kirin_pcie->gpio_id_reset[i])) {
-			dev_err(dev, "unable to get a valid %s gpio\n",
-				kirin_pcie->reset_names[i]);
-			return -ENODEV;
-		}
-
-		ret = devm_gpio_request(dev, kirin_pcie->gpio_id_reset[i],
-					kirin_pcie->reset_names[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < kirin_pcie->n_gpio_clkreq; i++) {
-		if (!gpio_is_valid(kirin_pcie->gpio_id_clkreq[i])) {
-			dev_err(dev, "unable to get a valid %s gpio\n",
-				kirin_pcie->clkreq_names[i]);
-			return -ENODEV;
-		}
-
-		ret = devm_gpio_request(dev, kirin_pcie->gpio_id_clkreq[i],
-					kirin_pcie->clkreq_names[i]);
-		if (ret)
-			return ret;
-
-		ret = gpio_direction_output(kirin_pcie->gpio_id_clkreq[i], 0);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static const struct dw_pcie_ops kirin_dw_pcie_ops = {
 	.read_dbi = kirin_pcie_read_dbi,
 	.write_dbi = kirin_pcie_write_dbi,
@@ -680,7 +651,7 @@ static int kirin_pcie_power_off(struct kirin_pcie *kirin_pcie)
 		return hi3660_pcie_phy_power_off(kirin_pcie);
 
 	for (i = 0; i < kirin_pcie->n_gpio_clkreq; i++)
-		gpio_direction_output(kirin_pcie->gpio_id_clkreq[i], 1);
+		gpiod_direction_output_raw(kirin_pcie->id_clkreq_gpio[i], 1);
 
 	phy_power_off(kirin_pcie->phy);
 	phy_exit(kirin_pcie->phy);
@@ -707,10 +678,6 @@ static int kirin_pcie_power_on(struct platform_device *pdev,
 		if (IS_ERR(kirin_pcie->phy))
 			return PTR_ERR(kirin_pcie->phy);
 
-		ret = kirin_pcie_gpio_request(kirin_pcie, dev);
-		if (ret)
-			return ret;
-
 		ret = phy_init(kirin_pcie->phy);
 		if (ret)
 			goto err;
@@ -723,11 +690,9 @@ static int kirin_pcie_power_on(struct platform_device *pdev,
 	/* perst assert Endpoint */
 	usleep_range(REF_2_PERST_MIN, REF_2_PERST_MAX);
 
-	if (!gpio_request(kirin_pcie->gpio_id_dwc_perst, "pcie_perst_bridge")) {
-		ret = gpio_direction_output(kirin_pcie->gpio_id_dwc_perst, 1);
-		if (ret)
-			goto err;
-	}
+	ret = gpiod_direction_output_raw(kirin_pcie->id_dwc_perst_gpio, 1);
+	if (ret)
+		goto err;
 
 	usleep_range(PERST_2_ACCESS_MIN, PERST_2_ACCESS_MAX);
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
