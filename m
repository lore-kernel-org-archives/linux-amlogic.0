Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF14C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 10:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5y3goDYYYlTzT+ljXAsAz5xGmtuJbVKgoBbWS0lFGYg=; b=lK924SXfF93G/h
	JZnedSr29FHQKfdQ7qV+bgr/N3+HVT+wFaDLi1x1KbTf8SHtaRdGmJSoeIMCcIJL05oljv2f6EXYF
	Vi/wjZ86SqAHQ3f1VG+WeeERNu3wMlYdVZs4+24tXJqCHgbSG1r8Xg8u/JJegWvQ1EBjikNSgRaRD
	uVWeg45UQ3hRCvvo7r6pi7MtGpAnx57Xn1w9ts6eeLuDogS+f12JvGW+VzmL1iS8ST2UmRprTwAIB
	qMh+ilbt0amxpnbqPEuAG/VMEspAVb4Kd8Egd8jy7VwGjDxtHNxi26EcI7/S2mKo9p8TJ5NHo3+79
	36Y1GdS08fBfNqKvNBLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naEe6-005D9v-H8; Fri, 01 Apr 2022 10:36:46 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naEdO-005Cig-1Y; Fri, 01 Apr 2022 10:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809362; x=1680345362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y3O4Dv2hy5JtpWu8VIfFu+PAFZBpau0bJ9ys20UBmDc=;
 b=Sgv8poZvFsmNz9w0IQurUwvfB0f9fWIFPmsRzGSDz8ZGDxDu/UgTY7uA
 aL3KdGQrx5NJlFFP58YKehcs0w4xiQ7QPCLcQfLkCWhF1Nj0hst9nT1BA
 LERduNLZUTB3/J2wYrXNU6ZqBzCQMIMUxkLEQvfwAkvfh4JOLdOIJXQHr
 vFvs0asrpdmcl2PS7+5AoBahlm56tSLAnmizjCAZfj9ONT43BweN5fIGr
 arDcUNdfMvgy9fcXTNLDEiAxwupcR8L/1d5laMiiAyEP8xtrrhpix0BiM
 hm1yuBOEVkxxzVG2C74V3dYvP9086zQ25rjk5D3sn0Oj63XUIDbvitFH5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="247609920"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="247609920"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:36:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="567376773"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 01 Apr 2022 03:35:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 2E0A46A9; Fri,  1 Apr 2022 13:36:06 +0300 (EEST)
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
Subject: [PATCH v4 12/13] pinctrl: armada-37xx: Switch to use fwnode instead
 of of_node
Date: Fri,  1 Apr 2022 13:36:03 +0300
Message-Id: <20220401103604.8705-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_033602_199148_6DBE5399 
X-CRM114-Status: GOOD (  16.29  )
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

GPIO library now accepts fwnode as a firmware node,
so switch the driver to use it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 08cad14042e2..1fef8a38f574 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -21,6 +21,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
@@ -787,18 +788,13 @@ static int armada_37xx_gpiochip_register(struct platform_device *pdev,
 					struct armada_37xx_pinctrl *info)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
+	struct fwnode_handle *fwnode;
 	struct gpio_chip *gc;
-	int ret = -ENODEV;
+	int ret;
 
-	for_each_child_of_node(dev->of_node, np) {
-		if (of_find_property(np, "gpio-controller", NULL)) {
-			ret = 0;
-			break;
-		}
-	}
-	if (ret)
-		return ret;
+	fwnode = device_get_named_child_node(dev, "gpio-controller");
+	if (!fwnode)
+		return -ENODEV;
 
 	info->gpio_chip = armada_37xx_gpiolib_chip;
 
@@ -806,7 +802,7 @@ static int armada_37xx_gpiochip_register(struct platform_device *pdev,
 	gc->ngpio = info->data->nr_pins;
 	gc->parent = dev;
 	gc->base = -1;
-	gc->of_node = np;
+	gc->fwnode = fwnode;
 	gc->label = info->data->name;
 
 	ret = armada_37xx_irqchip_register(pdev, info);
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
