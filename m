Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF65C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AcRn/iuX8ySyrmdmJcCE4Wzy6kAi0spacGqhzyzEPKI=; b=hIACgJZb4uyGVx
	qUNhsXQ2IdPptVCkr87mS28SyKq2KfuJq9qtVkJMNV6QOKtrax37hAYVNQ8cl4E3LaCfuemf/vjsQ
	TMiXGqQOIJHqSY5Ct0biELyVxdV4jPvry1uXOe17lfbIaOc85+SkKmrQ6my2/RTD/KwiqzzZeBkOn
	IKvJ7gGjQ5gDFZOSFHwDAZQvqW/wlq5pyeA0oZxkym8zR5LdqcmJA6Mq07pHGaDKeNle+gC+xQLia
	qEkAcjGunJBo+AddFqxfoH+5b2WiMI/4w6vIfNqUtuZOFsZhdseAgsv/u8AGui2LRmGflTY6QCf9J
	AWc25P97tuDUXndigaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naEjL-005G43-DS; Fri, 01 Apr 2022 10:42:11 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naEdk-005CtX-Cd; Fri, 01 Apr 2022 10:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809384; x=1680345384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z1Wwebtp9mgYOoY8j5lm8osB9jE0USQeFWSvh/mZP9o=;
 b=OpdUifFz28/itTXkekpV+ayDvsNX0jHqnyhh+GXDPVK8WgReTAd3oM2O
 fUlzrli0FMZzZ8sUc7xdUgwQzWKK59Djp0Ges7FLbtBcc59sE8kp3RoRy
 oxOz4+CajmadNgqT28JcZPLpWM10+C/yGROKHiQTYzrHLdXDYh67DZEBh
 Zin2+wZ1dzE79lkwskVlg4bAtB0HOxkE52qkxWcE8BSJZvO4VPr0XEPfw
 pLNsxq/vA2TfKoNpmjHWMWeNCMlO65nMxe9LPou4EIz2gJHdcDtsrzOV9
 lG4MtiZLb6vZqBPi8ugukcTDNLR+QCd2Taf5r09jmztq/dUZYzaXuEqt0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="240692294"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="240692294"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="522726529"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 01 Apr 2022 03:35:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id E69485F8; Fri,  1 Apr 2022 13:36:05 +0300 (EEST)
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
Subject: [PATCH v4 07/13] pinctrl: renesas: rza1: Switch to use
 for_each_gpiochip_node() helper
Date: Fri,  1 Apr 2022 13:35:58 +0300
Message-Id: <20220401103604.8705-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_033624_556204_A22CF207 
X-CRM114-Status: GOOD (  16.83  )
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 30 +++++++++++---------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index acc00b1a955d..529c0fc4ec06 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -24,6 +24,7 @@
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include "../core.h"
@@ -1161,22 +1162,22 @@ static const struct pinmux_ops rza1_pinmux_ops = {
  * defined by gpio device tree binding documentation.
  *
  * @rza1_pctl: RZ/A1 pin controller device
- * @np: of gpio-controller node
+ * @fwnode: gpio-controller firmware node
  * @chip: gpio chip to register to gpiolib
  * @range: pin range to register to pinctrl core
  */
 static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
-			       struct device_node *np,
+			       struct fwnode_handle *fwnode,
 			       struct gpio_chip *chip,
 			       struct pinctrl_gpio_range *range)
 {
 	const char *list_name = "gpio-ranges";
-	struct of_phandle_args of_args;
+	struct fwnode_reference_args args;
 	unsigned int gpioport;
 	u32 pinctrl_base;
 	int ret;
 
-	ret = of_parse_phandle_with_fixed_args(np, list_name, 3, 0, &of_args);
+	ret = fwnode_property_get_reference_args(fwnode, list_name, NULL, 3, 0, &args);
 	if (ret) {
 		dev_err(rza1_pctl->dev, "Unable to parse %s list property\n",
 			list_name);
@@ -1187,7 +1188,7 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
 	 * Find out on which port this gpio-chip maps to by inspecting the
 	 * second argument of the "gpio-ranges" property.
 	 */
-	pinctrl_base = of_args.args[1];
+	pinctrl_base = args.args[1];
 	gpioport = RZA1_PIN_ID_TO_PORT(pinctrl_base);
 	if (gpioport >= RZA1_NPORTS) {
 		dev_err(rza1_pctl->dev,
@@ -1197,19 +1198,18 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
 
 	*chip		= rza1_gpiochip_template;
 	chip->base	= -1;
-	chip->label	= devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
-					 np);
+	chip->ngpio	= args.args[2];
+	chip->label	= devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pfwP", fwnode);
 	if (!chip->label)
 		return -ENOMEM;
 
-	chip->ngpio	= of_args.args[2];
-	chip->of_node	= np;
+	chip->fwnode	= fwnode;
 	chip->parent	= rza1_pctl->dev;
 
 	range->id	= gpioport;
 	range->name	= chip->label;
 	range->pin_base	= range->base = pinctrl_base;
-	range->npins	= of_args.args[2];
+	range->npins	= args.args[2];
 	range->gc	= chip;
 
 	ret = devm_gpiochip_add_data(rza1_pctl->dev, chip,
@@ -1232,10 +1232,9 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
  */
 static int rza1_gpio_register(struct rza1_pinctrl *rza1_pctl)
 {
-	struct device_node *np = rza1_pctl->dev->of_node;
 	struct pinctrl_gpio_range *gpio_ranges;
 	struct gpio_chip *gpio_chips;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	unsigned int ngpiochips;
 	unsigned int i;
 	int ret;
@@ -1254,14 +1253,11 @@ static int rza1_gpio_register(struct rza1_pinctrl *rza1_pctl)
 		return -ENOMEM;
 
 	i = 0;
-	for_each_child_of_node(np, child) {
-		if (!of_property_read_bool(child, "gpio-controller"))
-			continue;
-
+	for_each_gpiochip_node(rza1_pctl->dev, child) {
 		ret = rza1_parse_gpiochip(rza1_pctl, child, &gpio_chips[i],
 					  &gpio_ranges[i]);
 		if (ret) {
-			of_node_put(child);
+			fwnode_handle_put(child);
 			return ret;
 		}
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
