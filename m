Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7A4C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 14:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2rYA5xaK+o+UYih6xpRCBfoy9rGYItETvlizMg9kvY=; b=EohwIjUaR6l6nE
	FL3+iAzL4up1K9sRrArMOT8PTW5fHPyiqe2vyxrE9epclesCJ3dbDNY2tIez1DlUCbKwd58RKR0KR
	nWDdYU0gnahiD+fCa7RfNhEp7lUr5EUtZVnfCNUqE0F6LT1ag3n2X3tcWZjtJIB79V0Q4rT9KIEJJ
	58Ie8IxxXFUldYfG5SXZEB21ZhvHl6R54MKSjidakqI5o0PaRVSU8OVhGYOjx43p7N7QvMDAd8aAK
	NPHzv8aUqme67ydAt+lTmEqFt3HxBd0NY7aaHn7MxW2MJHrsK8/0hy2/BH5nBeJvPwD2g6nZJBZ5y
	jKSUuukO5TkqC/Z4Bw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZZf5-00GItO-KB; Wed, 30 Mar 2022 14:51:03 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZZeO-00GIXo-PG; Wed, 30 Mar 2022 14:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648651820; x=1680187820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jQJeoHDjZLYzGmOrK+oBTqEppFS7ObLysie7MCABhco=;
 b=XVqnzcRpRh75CN7NjnGhhxN+9gLyqHafh5yRGLmy14velxDnTGpgPQBk
 rJcFexYLH0/FeHeqlLpFDLL8OEgNkDbeJ8viLHB4DpAxIaOAtOC1QZuwX
 xCVfujsmDLspl9iUGMWzhF3S9GG/jnKlpRqwSOiLTAudQvnHDKcRJfN21
 Nh3DfjypV4KKi+fodgonmznrDF8Z0bfRnQpHBq/ieebeoh1Cr1VGls6Ix
 ycOhDZGPQyzNumxG9z7fIMDgs3jSZFkkjRf3zmhdWqkTHjHTcflYYZz6E
 dhAt2sqD+QLNqcqRMBlmIm9by6vL6kv0fZPy4CzOiYGT2HOWds1meuMal g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239490488"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="239490488"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 07:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="788030765"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2022 07:50:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 4FB5620B; Wed, 30 Mar 2022 17:50:33 +0300 (EEST)
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
Subject: [PATCH v3 04/13] pinctrl: stm32: Switch to use
 for_each_gpiochip_node() helper
Date: Wed, 30 Mar 2022 17:50:21 +0300
Message-Id: <20220330145030.1562-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
References: <20220330145030.1562-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_075020_908408_24ABE529 
X-CRM114-Status: GOOD (  17.88  )
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
Reviewed-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 72 ++++++++++++---------------
 1 file changed, 33 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 91b9a64b649e..09952c463f67 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -24,6 +24,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -1215,13 +1216,12 @@ static const struct pinconf_ops stm32_pconf_ops = {
 	.pin_config_dbg_show	= stm32_pconf_dbg_show,
 };
 
-static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
-	struct device_node *np)
+static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl, struct fwnode_handle *fwnode)
 {
 	struct stm32_gpio_bank *bank = &pctl->banks[pctl->nbanks];
 	int bank_ioport_nr;
 	struct pinctrl_gpio_range *range = &bank->range;
-	struct of_phandle_args args;
+	struct fwnode_reference_args args;
 	struct device *dev = pctl->dev;
 	struct resource res;
 	int npins = STM32_GPIO_PINS_PER_BANK;
@@ -1230,7 +1230,7 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 	if (!IS_ERR(bank->rstc))
 		reset_control_deassert(bank->rstc);
 
-	if (of_address_to_resource(np, 0, &res))
+	if (of_address_to_resource(to_of_node(fwnode), 0, &res))
 		return -ENODEV;
 
 	bank->base = devm_ioremap_resource(dev, &res);
@@ -1245,15 +1245,15 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 
 	bank->gpio_chip = stm32_gpio_template;
 
-	of_property_read_string(np, "st,bank-name", &bank->gpio_chip.label);
+	fwnode_property_read_string(fwnode, "st,bank-name", &bank->gpio_chip.label);
 
-	if (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, i, &args)) {
+	if (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, i, &args)) {
 		bank_nr = args.args[1] / STM32_GPIO_PINS_PER_BANK;
 		bank->gpio_chip.base = args.args[1];
 
 		/* get the last defined gpio line (offset + nb of pins) */
 		npins = args.args[0] + args.args[2];
-		while (!of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, ++i, &args))
+		while (!fwnode_property_get_reference_args(fwnode, "gpio-ranges", NULL, 3, ++i, &args))
 			npins = max(npins, (int)(args.args[0] + args.args[2]));
 	} else {
 		bank_nr = pctl->nbanks;
@@ -1268,20 +1268,20 @@ static int stm32_gpiolib_register_bank(struct stm32_pinctrl *pctl,
 				       &pctl->banks[bank_nr].range);
 	}
 
-	if (of_property_read_u32(np, "st,bank-ioport", &bank_ioport_nr))
+	if (fwnode_property_read_u32(fwnode, "st,bank-ioport", &bank_ioport_nr))
 		bank_ioport_nr = bank_nr;
 
 	bank->gpio_chip.base = bank_nr * STM32_GPIO_PINS_PER_BANK;
 
 	bank->gpio_chip.ngpio = npins;
-	bank->gpio_chip.of_node = np;
+	bank->gpio_chip.fwnode = fwnode;
 	bank->gpio_chip.parent = dev;
 	bank->bank_nr = bank_nr;
 	bank->bank_ioport_nr = bank_ioport_nr;
 	spin_lock_init(&bank->lock);
 
 	/* create irq hierarchical domain */
-	bank->fwnode = of_node_to_fwnode(np);
+	bank->fwnode = fwnode;
 
 	bank->domain = irq_domain_create_hierarchy(pctl->domain, 0,
 					STM32_GPIO_IRQ_LINE, bank->fwnode,
@@ -1418,7 +1418,7 @@ static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
 int stm32_pctl_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct stm32_pinctrl *pctl;
@@ -1525,40 +1525,34 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	i = 0;
-	for_each_available_child_of_node(np, child) {
+	for_each_gpiochip_node(dev, child) {
 		struct stm32_gpio_bank *bank = &pctl->banks[i];
+		struct device_node *np = to_of_node(child);
 
-		if (of_property_read_bool(child, "gpio-controller")) {
-			bank->rstc = of_reset_control_get_exclusive(child,
-								    NULL);
-			if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
-				of_node_put(child);
-				return -EPROBE_DEFER;
-			}
-
-			bank->clk = of_clk_get_by_name(child, NULL);
-			if (IS_ERR(bank->clk)) {
-				if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
-					dev_err(dev,
-						"failed to get clk (%ld)\n",
-						PTR_ERR(bank->clk));
-				of_node_put(child);
-				return PTR_ERR(bank->clk);
-			}
-			i++;
+		bank->rstc = of_reset_control_get_exclusive(np, NULL);
+		if (PTR_ERR(bank->rstc) == -EPROBE_DEFER) {
+			fwnode_handle_put(child);
+			return -EPROBE_DEFER;
 		}
-	}
 
-	for_each_available_child_of_node(np, child) {
-		if (of_property_read_bool(child, "gpio-controller")) {
-			ret = stm32_gpiolib_register_bank(pctl, child);
-			if (ret) {
-				of_node_put(child);
-				return ret;
-			}
+		bank->clk = of_clk_get_by_name(np, NULL);
+		if (IS_ERR(bank->clk)) {
+			if (PTR_ERR(bank->clk) != -EPROBE_DEFER)
+				dev_err(dev, "failed to get clk (%ld)\n", PTR_ERR(bank->clk));
+			fwnode_handle_put(child);
+			return PTR_ERR(bank->clk);
+		}
+		i++;
+	}
 
-			pctl->nbanks++;
+	for_each_gpiochip_node(dev, child) {
+		ret = stm32_gpiolib_register_bank(pctl, child);
+		if (ret) {
+			fwnode_handle_put(child);
+			return ret;
 		}
+
+		pctl->nbanks++;
 	}
 
 	dev_info(dev, "Pinctrl STM32 initialized\n");
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
