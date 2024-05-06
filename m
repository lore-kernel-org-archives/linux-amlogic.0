Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3C9C10F16
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2024 14:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9Q7QpQwfIAgA4A3NBvwZPR8KT5yyQ0cPriff9wFf1g=; b=FNeNcKzdwOm0+L
	/R4ILjZgM+6Xfqff4d5auB+tORqeX3zqEIqUOPf5Hx/IO+W8DkVQS/eB73ZJ4zjTGV0HRI9CoFl6z
	3FrWKd+z4DwdEYj0cMs85lDh+0AVkRHkwTlwR4RHgL3mKJJaM6m8vQ6VApc/pepbo1u9EQkXRKIER
	vv1ffp0DwrFGgvECqKAprMNHZ2UqKbYDlJzSu+KCcWROv7xs1OhG9LOZVG8yPpdWzCBkznmefJf57
	sHny2qF/Bk3k+rg+ir+bz6x5zilTGkBbvBcI9OeNGn3nePku6sQPqduwJL9E3OQNemhja8RzERs9o
	0Xi2dNX72/LpOmKE6EbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zEE-00000007dki-1sAw;
	Mon, 06 May 2024 14:22:06 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zE8-00000007dfZ-0lFm;
	Mon, 06 May 2024 14:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715005320; x=1746541320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z57pGJjnjRVkYzZo0wihsvwiTkK/ndmlOsPxrIGszlo=;
  b=IlS+Z1F4d1VnKjaHRIvlStWhQHDw4f23jYIsveMcWU+HnNQdQ7QQNj+n
   TgeM+8KJLAsgCxSvggbG6ldTR67KeqSnYOgkX+tG8RfGCMxa3Uhlu7vie
   wWJvAXXB3LdOm0goCG7KcynVjIjXHqk5SQrrLnqYpCVPhfOXw2jTKBTmn
   uytAD3tHGUXk3XXwDw4TasI4bwze0mtOl3x9XdcSYTra77iSm0rRotc4L
   FFwv1au617ySM/fx8pvxxmo9FvoNwTqOylf4h4TSRepL3vw/Z5sjy054c
   6mY/mvSJX9hUJQYf+/p2CPo5lvKjydytsLW7XRuRw3Nu3CS6SEeokKfj4
   Q==;
X-CSE-ConnectionGUID: aHcJIxAKRJmZ4KrFV9EzXA==
X-CSE-MsgGUID: l2QOLdc1QpCarpsBZi9nag==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10631854"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="10631854"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 07:21:52 -0700
X-CSE-ConnectionGUID: LmUtZS9TRKi6vdTo+P+jMQ==
X-CSE-MsgGUID: SSFBTkBWSVaqnxNR9fDPHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="32652262"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 06 May 2024 07:21:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 341DB537; Mon, 06 May 2024 17:21:43 +0300 (EEST)
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
Subject: [PATCH v4 4/5] PCI: imx6: Convert to agnostic GPIO API
Date: Mon,  6 May 2024 17:20:40 +0300
Message-ID: <20240506142142.4042810-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_072200_265659_B4B8D9F6 
X-CRM114-Status: GOOD (  15.18  )
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 36 ++++++++-------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 917c69edee1d..62a4994c5501 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -11,14 +11,13 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 #include <linux/mfd/syscon/imx7-iomuxc-gpr.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_address.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
@@ -107,8 +106,7 @@ struct imx6_pcie_drvdata {
 
 struct imx6_pcie {
 	struct dw_pcie		*pci;
-	int			reset_gpio;
-	bool			gpio_active_high;
+	struct gpio_desc	*reset_gpiod;
 	bool			link_is_up;
 	struct clk_bulk_data	clks[IMX6_PCIE_MAX_CLKS];
 	struct regmap		*iomuxc_gpr;
@@ -721,9 +719,7 @@ static void imx6_pcie_assert_core_reset(struct imx6_pcie *imx6_pcie)
 	}
 
 	/* Some boards don't have PCIe reset GPIO. */
-	if (gpio_is_valid(imx6_pcie->reset_gpio))
-		gpio_set_value_cansleep(imx6_pcie->reset_gpio,
-					imx6_pcie->gpio_active_high);
+	gpiod_set_value_cansleep(imx6_pcie->reset_gpiod, 1);
 }
 
 static int imx6_pcie_deassert_core_reset(struct imx6_pcie *imx6_pcie)
@@ -771,10 +767,9 @@ static int imx6_pcie_deassert_core_reset(struct imx6_pcie *imx6_pcie)
 	}
 
 	/* Some boards don't have PCIe reset GPIO. */
-	if (gpio_is_valid(imx6_pcie->reset_gpio)) {
+	if (imx6_pcie->reset_gpiod) {
 		msleep(100);
-		gpio_set_value_cansleep(imx6_pcie->reset_gpio,
-					!imx6_pcie->gpio_active_high);
+		gpiod_set_value_cansleep(imx6_pcie->reset_gpiod, 0);
 		/* Wait for 100ms after PERST# deassertion (PCIe r5.0, 6.6.1) */
 		msleep(100);
 	}
@@ -1285,22 +1280,11 @@ static int imx6_pcie_probe(struct platform_device *pdev)
 		return PTR_ERR(pci->dbi_base);
 
 	/* Fetch GPIOs */
-	imx6_pcie->reset_gpio = of_get_named_gpio(node, "reset-gpio", 0);
-	imx6_pcie->gpio_active_high = of_property_read_bool(node,
-						"reset-gpio-active-high");
-	if (gpio_is_valid(imx6_pcie->reset_gpio)) {
-		ret = devm_gpio_request_one(dev, imx6_pcie->reset_gpio,
-				imx6_pcie->gpio_active_high ?
-					GPIOF_OUT_INIT_HIGH :
-					GPIOF_OUT_INIT_LOW,
-				"PCIe reset");
-		if (ret) {
-			dev_err(dev, "unable to get reset gpio\n");
-			return ret;
-		}
-	} else if (imx6_pcie->reset_gpio == -EPROBE_DEFER) {
-		return imx6_pcie->reset_gpio;
-	}
+	imx6_pcie->reset_gpiod = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(imx6_pcie->reset_gpiod))
+		return dev_err_probe(dev, PTR_ERR(imx6_pcie->reset_gpiod),
+				     "unable to get reset gpio\n");
+	gpiod_set_consumer_name(imx6_pcie->reset_gpiod, "PCIe reset");
 
 	if (imx6_pcie->drvdata->clks_cnt >= IMX6_PCIE_MAX_CLKS)
 		return dev_err_probe(dev, -ENOMEM, "clks_cnt is too big\n");
-- 
2.43.0.rc1.1336.g36b5255a03ac


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
