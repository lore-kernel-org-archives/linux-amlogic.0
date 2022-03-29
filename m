Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AB2C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCij64ethc92zu427vRdaOVVo5ctZcSAJN6ILbXz/70=; b=UM/ae9sAcC93Yb
	QbR+lJ+C+ErQfnBYHY9R+E3Lcni0ptcj2cPLXroAStp5ByLwP+myDz0o22PYyS/4x32tkzLbUDA6Y
	ImJ5IyS9ToS6RsyoiLn+Mq9OJT0zEhwa+Mdj9iQbDgIuQ9DUilR2FaZF1k1p/kxyTJFaXkFZtTsuT
	SZwRSWLn7pveuFXZqbuYo6+aGPsCKEOOtYlDKEcE6ln7zD1nwUPtUrmM1VyTxavpGEq6a/8Wmyro1
	kB8aKzkq0A9UQtYaDnTAPvEbwYCltaFK279H5et90Udex3vggGUs8EYRJJPAB+oZRW6iJTW+jqL8g
	v/e0js4iUJ3jTvFLFV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZDoK-00CgXn-VX; Tue, 29 Mar 2022 15:31:09 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZDme-00Cffr-8m; Tue, 29 Mar 2022 15:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567764; x=1680103764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D9rIVVydA1U6YDG/4d1Ed8j+r9S7iMMFVbYxLfWOamY=;
 b=gxEAOsFnPFvG+Kux4NjwXsaLqzrc33AJET8AN2okStv4gfe8vkfNbR2G
 8RqvnItgfzzk0wnTKUi8eejNfFlwMpfbPXZBnnOuP113Subf4uhgs7UC9
 jEz6ebSUUZYbz7QH6EmgxULNKdRUAaSyXgyBPIp8XgckzcfwJA7FsDwJP
 9sQNkK4nxtINVEXTPE1FDPiQuaclit8CTXyuzC9qESW+S+tS4csFY/xZK
 PpwgL5T4Gc60uDL0e9nFPJSyJyk1iUzKna9ruSQ/UfcpEe0FsmWa+ugp0
 OW2gBMlC+RhLxlJScEmrbUbKR2EOUvd9LVqh55OwX5M1zfcRuxDyEutZ/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239873101"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="239873101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="604843273"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2022 08:29:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 6E4873C5; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
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
Subject: [PATCH v2 08/13] pinctrl: npcm7xx: Switch to use
 for_each_gpiochip_node() helper
Date: Tue, 29 Mar 2022 18:29:21 +0300
Message-Id: <20220329152926.50958-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_082924_375487_68695C8F 
X-CRM114-Status: GOOD (  17.49  )
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
do the following:
- use a temporary variable for struct device pointer to shorten a few lines
- get rid of a temporary variable for vIRQ number, assign it directly
- switch to fwnode APIs where it makes sense

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 141 ++++++++++------------
 1 file changed, 61 insertions(+), 80 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 221c33300d60..e73732e79585 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -1862,88 +1862,69 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 {
 	int ret = -ENXIO;
 	struct resource res;
-	int id = 0, irq;
-	struct device_node *np;
-	struct of_phandle_args pinspec;
-
-	for_each_available_child_of_node(pctrl->dev->of_node, np)
-		if (of_find_property(np, "gpio-controller", NULL)) {
-			ret = of_address_to_resource(np, 0, &res);
-			if (ret < 0) {
-				dev_err(pctrl->dev,
-					"Resource fail for GPIO bank %u\n", id);
-				return ret;
-			}
-
-			pctrl->gpio_bank[id].base =
-				ioremap(res.start, resource_size(&res));
-
-			irq = irq_of_parse_and_map(np, 0);
-			if (irq < 0) {
-				dev_err(pctrl->dev,
-					"No IRQ for GPIO bank %u\n", id);
-				ret = irq;
-				return ret;
-			}
-
-			ret = bgpio_init(&pctrl->gpio_bank[id].gc,
-					 pctrl->dev, 4,
-					 pctrl->gpio_bank[id].base +
-					 NPCM7XX_GP_N_DIN,
-					 pctrl->gpio_bank[id].base +
-					 NPCM7XX_GP_N_DOUT,
-					 NULL,
-					 NULL,
-					 pctrl->gpio_bank[id].base +
-					 NPCM7XX_GP_N_IEM,
-					 BGPIOF_READ_OUTPUT_REG_SET);
-			if (ret) {
-				dev_err(pctrl->dev, "bgpio_init() failed\n");
-				return ret;
-			}
-
-			ret = of_parse_phandle_with_fixed_args(np,
-							       "gpio-ranges", 3,
-							       0, &pinspec);
-			if (ret < 0) {
-				dev_err(pctrl->dev,
-					"gpio-ranges fail for GPIO bank %u\n",
-					id);
-				return ret;
-			}
-
-			pctrl->gpio_bank[id].irq = irq;
-			pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
-			pctrl->gpio_bank[id].gc.parent = pctrl->dev;
-			pctrl->gpio_bank[id].irqbase =
-				id * NPCM7XX_GPIO_PER_BANK;
-			pctrl->gpio_bank[id].pinctrl_id = pinspec.args[0];
-			pctrl->gpio_bank[id].gc.base = pinspec.args[1];
-			pctrl->gpio_bank[id].gc.ngpio = pinspec.args[2];
-			pctrl->gpio_bank[id].gc.owner = THIS_MODULE;
-			pctrl->gpio_bank[id].gc.label =
-				devm_kasprintf(pctrl->dev, GFP_KERNEL, "%pOF",
-					       np);
-			if (pctrl->gpio_bank[id].gc.label == NULL)
-				return -ENOMEM;
-
-			pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
-			pctrl->gpio_bank[id].direction_input =
-				pctrl->gpio_bank[id].gc.direction_input;
-			pctrl->gpio_bank[id].gc.direction_input =
-				npcmgpio_direction_input;
-			pctrl->gpio_bank[id].direction_output =
-				pctrl->gpio_bank[id].gc.direction_output;
-			pctrl->gpio_bank[id].gc.direction_output =
-				npcmgpio_direction_output;
-			pctrl->gpio_bank[id].request =
-				pctrl->gpio_bank[id].gc.request;
-			pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
-			pctrl->gpio_bank[id].gc.free = npcmgpio_gpio_free;
-			pctrl->gpio_bank[id].gc.of_node = np;
-			id++;
+	struct device *dev = pctrl->dev;
+	struct fwnode_reference_args pinspec;
+	struct fwnode_handle *child;
+	int id = 0;
+
+	for_each_gpiochip_node(dev, child) {
+		struct device_node *np = to_of_node(child);
+
+		ret = of_address_to_resource(np, 0, &res);
+		if (ret < 0) {
+			dev_err(dev, "Resource fail for GPIO bank %u\n", id);
+			return ret;
+		}
+
+		pctrl->gpio_bank[id].base = ioremap(res.start, resource_size(&res));
+
+		ret = bgpio_init(&pctrl->gpio_bank[id].gc, dev, 4,
+				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DIN,
+				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_DOUT,
+				 NULL,
+				 NULL,
+				 pctrl->gpio_bank[id].base + NPCM7XX_GP_N_IEM,
+				 BGPIOF_READ_OUTPUT_REG_SET);
+		if (ret) {
+			dev_err(dev, "bgpio_init() failed\n");
+			return ret;
 		}
 
+		ret = fwnode_property_get_reference_args(child, "gpio-ranges", NULL, 3, 0, &pinspec);
+		if (ret < 0) {
+			dev_err(dev, "gpio-ranges fail for GPIO bank %u\n", id);
+			return ret;
+		}
+
+		ret = irq_of_parse_and_map(np, 0);
+		if (ret < 0) {
+			dev_err(dev, "No IRQ for GPIO bank %u\n", id);
+			return ret;
+		}
+		pctrl->gpio_bank[id].irq = ret;
+		pctrl->gpio_bank[id].irq_chip = npcmgpio_irqchip;
+		pctrl->gpio_bank[id].irqbase = id * NPCM7XX_GPIO_PER_BANK;
+		pctrl->gpio_bank[id].pinctrl_id = pinspec.args[0];
+		pctrl->gpio_bank[id].gc.base = pinspec.args[1];
+		pctrl->gpio_bank[id].gc.ngpio = pinspec.args[2];
+		pctrl->gpio_bank[id].gc.owner = THIS_MODULE;
+		pctrl->gpio_bank[id].gc.parent = dev;
+		pctrl->gpio_bank[id].gc.label = devm_kasprintf(dev, GFP_KERNEL, "%pfw", child);
+		if (pctrl->gpio_bank[id].gc.label == NULL)
+			return -ENOMEM;
+
+		pctrl->gpio_bank[id].gc.dbg_show = npcmgpio_dbg_show;
+		pctrl->gpio_bank[id].direction_input = pctrl->gpio_bank[id].gc.direction_input;
+		pctrl->gpio_bank[id].gc.direction_input = npcmgpio_direction_input;
+		pctrl->gpio_bank[id].direction_output = pctrl->gpio_bank[id].gc.direction_output;
+		pctrl->gpio_bank[id].gc.direction_output = npcmgpio_direction_output;
+		pctrl->gpio_bank[id].request = pctrl->gpio_bank[id].gc.request;
+		pctrl->gpio_bank[id].gc.request = npcmgpio_gpio_request;
+		pctrl->gpio_bank[id].gc.free = npcmgpio_gpio_free;
+		pctrl->gpio_bank[id].gc.fwnode = child;
+		id++;
+	}
+
 	pctrl->bank_num = id;
 	return ret;
 }
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
