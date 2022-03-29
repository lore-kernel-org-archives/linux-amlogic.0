Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49EEC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lB/4gJVUiAL0OWpvr1oqf/jPzR/GDSzMPy9DpScOnKw=; b=egQpWayyEHHDWS
	jdlGu42Dwm6l14W0skqEhzruZ9cLuR0oWOnO2GlOIVVUkoSDCSh7UPHJe5vFn+OIvD/4LGQFXumIp
	43xW69q1RahMstjOELwMpUHMPmjjQbgFtrtDU97YW3qnpgCKTpJuiSUUwzoyYgS2g4BAgzKx1DfKv
	0nzrBvXGjwM4uDjyo87Ryul0djczntEuD1akUdXa0NeZ22KodQVGveQyRV8nUv+Er89utNcMtAVBr
	uH9I0jlYFRZB4uRQfExcAgi7xhrhmQfZJPH4Jq4ENGc67ecJupCRlv6gIKGmnlN+pR5UKT3IzNAoc
	t8tfitGSViI5waujQbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZDoJ-00CgXT-NR; Tue, 29 Mar 2022 15:31:07 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZDmb-00Cffq-DD; Tue, 29 Mar 2022 15:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567761; x=1680103761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mYAeAs1ohVyDPBCU0QuHZm0N5SN3KFllVFgiqjii/FI=;
 b=g1JE4cLqeOEocl7cAgUvh2KqycPpEK3H2KdUbTIKeWL2Q29jhgvnmTvx
 FtF2uy/jawn4GPTKXobc9rHksahhcpKQaDCT9WUCxXm3K8xbNtgNGvzyh
 Z8vkK21Ma5bpJ8O7xYjbmWBtVtgXB4/ROqTzgIvdl18d86gzM6Aoy7LSO
 HD+E5reaOZ5F5zO+O4DPpcNh48FJayvw/td9Bvn6NBluEiGirQz0AGjYG
 M+DA7qS1UwfV22QjT3gckk20IrEkl4f0yvwILqBBsS4lhXzndE7d5TR9p
 tEOtPbNT5s3CtpngaZcYdZekM81mtJBL79YnUs2GPVKUvug7sprKtgak2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="319974191"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="319974191"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="604843157"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2022 08:29:08 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 33983228; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
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
Subject: [PATCH v2 04/13] pinctrl: stm32: Switch to use
 for_each_gpiochip_node() helper
Date: Tue, 29 Mar 2022 18:29:17 +0300
Message-Id: <20220329152926.50958-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_082921_550853_5CDD093A 
X-CRM114-Status: GOOD (  18.17  )
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
 drivers/pinctrl/stm32/pinctrl-stm32.c | 72 ++++++++++++---------------
 1 file changed, 33 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 4043a44211f0..3e2f1e3a84be 100644
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
