Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099B8C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YLWMaVLQ3YXmZ1ZoWzyf0wgvxqvkAztDpHkZ2Umcd8=; b=D1hqCEbCkAsUV6
	qaaOpIjseha9sD1Lpr+5v58LomWQWaLx+hKoL4goXgUx5JqGlGe6zzh9YY7JCE1UDKJX4PBXsMkd2
	mYQzTA2xf+jgUddCrJloMvgG4x1VedpxjGrayZeHSoVl5JBQcf+wjMPlB3kMVJc1bjU+8+g6prnEI
	fJ1XC0k82SzF34uKPuZUsdZwDZe68n0PkiUR2j0xOUqvICMsD7Djqob4Ze213vNznlxQ9bph5Q8Kl
	+hjtrMK5zOiK6qxgtIxwtDozFDNaorGr30X+s8+/IcRwcFt9QkIGP6pd8bqI01r7/SGVPnaHxRJdw
	rObjt0PAOwPzaOmCo2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZDpV-00ChBE-Hn; Tue, 29 Mar 2022 15:32:21 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZDmf-00Cfjv-0q; Tue, 29 Mar 2022 15:29:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567765; x=1680103765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W+IP0ugtBZoN9WwC/3gHuhgkJJpzkCJxYwfn4NdIErE=;
 b=IvpDQENkbbPB9wXNDipGf6t5RCJUnI3y5RSpQfCU58DVWqgRFDI6LMvC
 IVJVOaNpOZ2KQ0p7SdPF29TYzJOogLvZvlgBGm6vFnHmF90QBHUBVIq3A
 p4AJI03qVJCAP7sfdzR/f/yxClOOHH7eTM/y6DKsr3ST33HfeiyTHYfwA
 M6tvp2B5PvCZ0eFQlSdiZ3Ej8bv7hFYL0/Vwg5rEZyqEeBZ88BawGO3Zf
 cTWsMlWQTzyxPauKyuvEOTrmqWQX+kyGsCExf5lXkvszx5cMtKDU1OPLK
 3d1Bax425glmgnUAT+TbGRkbkXejL/aL+AEY1Tmr3PSZY/SqBAjg1F2H5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246767243"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="246767243"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="554297181"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2022 08:29:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 427B5239; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Date: Tue, 29 Mar 2022 18:29:18 +0300
Message-Id: <20220329152926.50958-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_082925_233694_D1B90FFB 
X-CRM114-Status: GOOD (  20.38  )
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
 drivers/pinctrl/samsung/pinctrl-samsung.c | 30 +++++++++++------------
 drivers/pinctrl/samsung/pinctrl-samsung.h |  2 +-
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 8eb423193680..8eb0aa1de595 100644
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
