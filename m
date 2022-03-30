Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C39AC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 14:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovUSeNBh2aubo1yyMkUP9aZzNCNTzCa99PZK1EgQyMo=; b=CgBBB5crjOZwrq
	kKrQbshFyH9Ykj/ypX4ZqjELt1F2Wibf818XBN/aXZyZWZC1daxxnHd+RIebmRQpiKmCa/yzRwD9L
	QVfIbhom3dUPyCSDd+gQ0vRZYE1V3C7IP8pp7cTRyRm7DQHCvcboEjRXm5C2qgYK82yLfOn7UpHlm
	v/IH1lWA6UOTJa6q0Zcc23W08+JXCFaGQBuW+6TchrMkLTvpVHOF4GgZJGft8ZPEbfAqJW17VQGKJ
	GcgQziGn8WayR4s+LfRPbPRIoyvQvCWUwFq70yLVQk1jFBrUvnNCJYTS2e+SdAWEhIhm1QS02U9fJ
	dlx0wqdPk8tdiEn0b7nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZZgx-00GJuN-KR; Wed, 30 Mar 2022 14:52:59 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZZeY-00GIcv-4i; Wed, 30 Mar 2022 14:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648651830; x=1680187830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4I02wLs2fQ6LFKrv5lHQYVLXyBFhgeaw2PkLsNE7Tko=;
 b=SI1pRCWfbGweRgKJXVw0wfMQig9WJk+9lFeVJ7b7CoTa6Cp+Yb+TypoQ
 S6l+xE0INrkQ4nMSlixro8N+GXEmc6325WQTgsVUyq6mQyzhVUFt0RYPh
 rtNt7cD4yMpYRWna6kPsYrSLGjbBYM6symBYosuKM2eUL+kO/3E935dj9
 9saLyDkEpDtqAWWl1bqBRi8qra+qY5yjWqa9STpeBxZkZkukiwgLbyony
 99K0FZBDSwMtg4nJM5kaiUwhIIvSTfKj+ZsZskjzeAE2KwFJccVZbXw3n
 6FjOoYDBumyZe6aGe5Ma8nVRtDqZ41JBXk6ORQLko4tug7Wh6Qw6XbjM1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="247061446"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="247061446"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 07:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="503338711"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 30 Mar 2022 07:50:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 5E85B323; Wed, 30 Mar 2022 17:50:33 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Qianggui Song <qianggui.song@amlogic.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk@kernel.org>,
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
Subject: [PATCH v3 05/13] pinctrl: samsung: Switch to use
 for_each_gpiochip_node() helper
Date: Wed, 30 Mar 2022 17:50:22 +0300
Message-Id: <20220330145030.1562-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
References: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_075030_301882_19144B23 
X-CRM114-Status: GOOD (  21.36  )
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
