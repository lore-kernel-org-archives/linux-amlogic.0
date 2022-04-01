Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2962CC433FE
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMzZoNqlVfN5jilVDwKxGe3MIgUsUUQYUECXtCuTMpI=; b=wEYyj1IFEKXI49
	42Eb5oVZphjotaHC1VhHsezpDlDv0ONjUdpN8i3uW3TcOi1QeQGypvFuzFuGEiD4jh5wRF1cGG1Hs
	s9bnyL713/DSN8mP43LCjhdJzujFQPd6z9Voex9knF8sFcY7NsMp8Pp/xxcARfTzcu5cFWiOzulmP
	oByUWNO9qIR6KpIhMn8L2jgUnynFD8LdMakgbfYdz1poUsfMBr17SHrN7OkVL+eJ6oYzb4lmBLTKf
	Uz95OM1uIHxqxwERxJjmMxU7kuff3HwIikK/j7vLdHd7YT6RuMPi6jO2YgpKBlHWmGs9GTmbNsoi2
	xxeQfjr1zHVliwH++NTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naEeS-005DPP-BH; Fri, 01 Apr 2022 10:37:08 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naEdO-005Cil-CU; Fri, 01 Apr 2022 10:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809362; x=1680345362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=quiOeAqtTm+C8H3Wl/anEY+Gx1ydJ3w0/kutBLStKno=;
 b=mIplvBp+DaB4PYS5O7yANdY+PrXnI3smiLTy/Kcfi6xKKIHUtI1NTem4
 5tCscyfdnZJmsmn1hLIKwrMP+pFQUDwyr6htGCyNXJmJtAqxhkc6VjP0k
 2/3n5JGUEzh35tZNlTYr/hWMpEtDNMSRUut0hKaiKuHkCTogXnSMXL6LM
 H9nK0KX+LaeoShZMqFHXV5r8eJD9GUHdG4umZyEmJ9qzaCZvgmx6MGT0L
 4mRBw6IUjCh0Xq9LugY8wFUYov0FjFFp624olDU9GoSe2g1pOq8jDN8S1
 C2ev31ODx3oLpOy0vXfdtbf2Fxm8ohVuVD2klXBpM6nXU19yokhl9BRki Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="257680753"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="257680753"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="640496022"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Apr 2022 03:35:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id CED55323; Fri,  1 Apr 2022 13:36:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Date: Fri,  1 Apr 2022 13:35:56 +0300
Message-Id: <20220401103604.8705-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_033602_511571_46BFF644 
X-CRM114-Status: GOOD (  22.62  )
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

Switch the code to use for_each_gpiochip_node() helper.

While at it, in order to avoid additional churn in the future,
switch to fwnode APIs where it makes sense.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/samsung/pinctrl-exynos.c  |  8 +++---
 drivers/pinctrl/samsung/pinctrl-s3c24xx.c |  2 +-
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c |  4 +--
 drivers/pinctrl/samsung/pinctrl-samsung.c | 30 +++++++++++------------
 drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
 5 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index c1c4ffbae6e2..6d7ca1758292 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -307,7 +307,7 @@ __init int exynos_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 		}
 		bank->irq_chip->chip.name = bank->name;
 
-		bank->irq_domain = irq_domain_add_linear(bank->of_node,
+		bank->irq_domain = irq_domain_create_linear(bank->fwnode,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
 			dev_err(dev, "gpio irq domain add failed\n");
@@ -565,7 +565,7 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		}
 		bank->irq_chip->chip.name = bank->name;
 
-		bank->irq_domain = irq_domain_add_linear(bank->of_node,
+		bank->irq_domain = irq_domain_create_linear(bank->fwnode,
 				bank->nr_pins, &exynos_eint_irqd_ops, bank);
 		if (!bank->irq_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
@@ -573,7 +573,7 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 			return -ENXIO;
 		}
 
-		if (!of_find_property(bank->of_node, "interrupts", NULL)) {
+		if (!fwnode_property_present(bank->fwnode, "interrupts")) {
 			bank->eint_type = EINT_TYPE_WKUP_MUX;
 			++muxed_banks;
 			continue;
@@ -588,7 +588,7 @@ __init int exynos_eint_wkup_init(struct samsung_pinctrl_drv_data *d)
 		}
 
 		for (idx = 0; idx < bank->nr_pins; ++idx) {
-			irq = irq_of_parse_and_map(bank->of_node, idx);
+			irq = irq_of_parse_and_map(to_of_node(bank->fwnode), idx);
 			if (!irq) {
 				dev_err(dev, "irq number for eint-%s-%d not found\n",
 							bank->name, idx);
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
index ac1eba30cf40..625cb1065eaf 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c24xx.c
@@ -525,7 +525,7 @@ static int s3c24xx_eint_init(struct samsung_pinctrl_drv_data *d)
 		ops = (bank->eint_offset == 0) ? &s3c24xx_gpf_irq_ops
 					       : &s3c24xx_gpg_irq_ops;
 
-		bank->irq_domain = irq_domain_add_linear(bank->of_node,
+		bank->irq_domain = irq_domain_create_linear(bank->fwnode,
 				bank->nr_pins, ops, ddata);
 		if (!bank->irq_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index c5f95a1071ae..c5d92db4fdb1 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -471,7 +471,7 @@ static int s3c64xx_eint_gpio_init(struct samsung_pinctrl_drv_data *d)
 		mask = bank->eint_mask;
 		nr_eints = fls(mask);
 
-		bank->irq_domain = irq_domain_add_linear(bank->of_node,
+		bank->irq_domain = irq_domain_create_linear(bank->fwnode,
 					nr_eints, &s3c64xx_gpio_irqd_ops, bank);
 		if (!bank->irq_domain) {
 			dev_err(dev, "gpio irq domain add failed\n");
@@ -743,7 +743,7 @@ static int s3c64xx_eint_eint0_init(struct samsung_pinctrl_drv_data *d)
 			return -ENOMEM;
 		ddata->bank = bank;
 
-		bank->irq_domain = irq_domain_add_linear(bank->of_node,
+		bank->irq_domain = irq_domain_create_linear(bank->fwnode,
 				nr_eints, &s3c64xx_eint0_irqd_ops, ddata);
 		if (!bank->irq_domain) {
 			dev_err(dev, "wkup irq domain add failed\n");
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index f610beab23a0..26d309d2516d 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
@@ -966,7 +967,7 @@ static int samsung_gpiolib_register(struct platform_device *pdev,
 		gc->base = bank->grange.base;
 		gc->ngpio = bank->nr_pins;
 		gc->parent = &pdev->dev;
-		gc->of_node = bank->of_node;
+		gc->fwnode = bank->fwnode;
 		gc->label = bank->name;
 
 		ret = devm_gpiochip_add_data(&pdev->dev, gc, bank);
@@ -1002,27 +1003,25 @@ samsung_pinctrl_get_soc_data_for_of_alias(struct platform_device *pdev)
 	return &(of_data->ctrl[id]);
 }
 
-static void samsung_banks_of_node_put(struct samsung_pinctrl_drv_data *d)
+static void samsung_banks_node_put(struct samsung_pinctrl_drv_data *d)
 {
 	struct samsung_pin_bank *bank;
 	unsigned int i;
 
 	bank = d->pin_banks;
 	for (i = 0; i < d->nr_banks; ++i, ++bank)
-		of_node_put(bank->of_node);
+		fwnode_handle_put(bank->fwnode);
 }
 
 /*
  * Iterate over all driver pin banks to find one matching the name of node,
  * skipping optional "-gpio" node suffix. When found, assign node to the bank.
  */
-static void samsung_banks_of_node_get(struct device *dev,
-				      struct samsung_pinctrl_drv_data *d,
-				      struct device_node *node)
+static void samsung_banks_node_get(struct device *dev, struct samsung_pinctrl_drv_data *d)
 {
 	const char *suffix = "-gpio-bank";
 	struct samsung_pin_bank *bank;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	/* Pin bank names are up to 4 characters */
 	char node_name[20];
 	unsigned int i;
@@ -1038,17 +1037,17 @@ static void samsung_banks_of_node_get(struct device *dev,
 			continue;
 		}
 
-		for_each_child_of_node(node, child) {
-			if (!of_find_property(child, "gpio-controller", NULL))
-				continue;
-			if (of_node_name_eq(child, node_name))
+		for_each_gpiochip_node(dev, child) {
+			struct device_node *np = to_of_node(child);
+
+			if (of_node_name_eq(np, node_name))
 				break;
-			else if (of_node_name_eq(child, bank->name))
+			if (of_node_name_eq(np, bank->name))
 				break;
 		}
 
 		if (child)
-			bank->of_node = child;
+			bank->fwnode = child;
 		else
 			dev_warn(dev, "Missing node for bank %s - invalid DTB\n",
 				 bank->name);
@@ -1061,7 +1060,6 @@ static const struct samsung_pin_ctrl *
 samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 			     struct platform_device *pdev)
 {
-	struct device_node *node = pdev->dev.of_node;
 	const struct samsung_pin_bank_data *bdata;
 	const struct samsung_pin_ctrl *ctrl;
 	struct samsung_pin_bank *bank;
@@ -1125,7 +1123,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 	 */
 	d->virt_base = virt_base[0];
 
-	samsung_banks_of_node_get(&pdev->dev, d, node);
+	samsung_banks_node_get(&pdev->dev, d);
 
 	d->pin_base = pin_base;
 	pin_base += d->nr_pins;
@@ -1186,7 +1184,7 @@ static int samsung_pinctrl_probe(struct platform_device *pdev)
 err_unregister:
 	samsung_pinctrl_unregister(pdev, drvdata);
 err_put_banks:
-	samsung_banks_of_node_put(drvdata);
+	samsung_banks_node_put(drvdata);
 	return ret;
 }
 
diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.h b/drivers/pinctrl/samsung/pinctrl-samsung.h
index 5b32d3f30fcd..fc6f5199c548 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.h
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.h
@@ -165,7 +165,7 @@ struct samsung_pin_bank {
 
 	u32		pin_base;
 	void		*soc_priv;
-	struct device_node *of_node;
+	struct fwnode_handle *fwnode;
 	struct samsung_pinctrl_drv_data *drvdata;
 	struct irq_domain *irq_domain;
 	struct gpio_chip gpio_chip;
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
