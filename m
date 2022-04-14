Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02EAC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Apr 2022 19:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ElXE1JMbCTwysnFP8pPP3NXqbmETQfiKMbxMWjJjjMA=; b=fT6ODYFOt0h13r
	GXXLMmaNhRHMdqgdfGe7I58IDAtRZ8wPCZ54CWwULbUS5hD1CQ0iTQHhIHmeBu6eyQQEPhNnxWxKs
	buYhXFYdZG0VIHvwRFsE5ahJuLfNYk85wdrf5dGr8XYAiZsnLf4jxJmhjXcTmtay32ypLImvXJQea
	l1ljaPdofkDIsdrSCkZ2Tbpa5vN3Hz8UQUBP03IrYiNXkswy08lHxACOPC99cXlNhnvh0c/t/AMgq
	VoEUSpGw838WdMY8Gbqrhg87z+vCFfZE6b9SxfHf9dE4fuwAZ4dO6Z8XCl7DiNzgskitxu3UmzEl1
	j1LKUl0lqtxnLw/wlg+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf4kq-006y4x-Um; Thu, 14 Apr 2022 19:03:44 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf4k1-006xZp-Bd; Thu, 14 Apr 2022 19:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962973; x=1681498973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4kQAdZbM0d9HyF5OdGeeBfcWXECLhEkSZzq2j0XSYdc=;
 b=CbuHZSISMCgSqPJOysyD9zG+42UfCLFmFUsgYPR2V1TdoDUWfLvbzd25
 S4tW9ujvzNEIGayIfaZ+maSf7tM0kTtFuXaw4InBEmOE02sYVGQRfYndE
 zRlR7EqvnTvQ+qhmEsBaA5h9wRdkTpEZjgHezbwlmfy3eUkx9gYjsgAcC
 fgQqhI+jRylGP0wuLTbAk7k++r5DNCBAmPi1g2auK6L0APKCQqaVYwct8
 i2Y8syhoqWSvzDhW8G0VeHAx25h+WqLLtKa4epJUMHv3IiYYszP4EoxJ4
 l2nYBIukaVBOOZ7TosDglca20IiJh3hFjdBYpteZxAxwzPiLQyAf1PlsL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349445612"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349445612"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 12:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="661484765"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 14 Apr 2022 12:02:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8350B1A1; Thu, 14 Apr 2022 22:02:43 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 3/6] pinctrl: armada-37xx: Reuse GPIO fwnode in
 armada_37xx_irqchip_register()
Date: Thu, 14 Apr 2022 22:02:39 +0300
Message-Id: <20220414190242.22178-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
References: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_120253_449405_E2DC3E06 
X-CRM114-Status: GOOD (  11.41  )
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

Since we have fwnode of the first found GPIO controller assigned to the
struct gpio_chip, we may reuse it in the armada_37xx_irqchip_register().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 110f70bce3fe..ef4118e49f16 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -727,23 +727,13 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	struct gpio_chip *gc = &info->gpio_chip;
 	struct irq_chip *irqchip = &info->irq_chip;
 	struct gpio_irq_chip *girq = &gc->irq;
+	struct device_node *np = to_of_node(gc->fwnode);
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
-	int ret = -ENODEV, i, nr_irq_parent;
-
-	/* Check if we have at least one gpio-controller child node */
-	for_each_child_of_node(dev->of_node, np) {
-		if (of_property_read_bool(np, "gpio-controller")) {
-			ret = 0;
-			break;
-		}
-	}
-	if (ret)
-		return dev_err_probe(dev, ret, "no gpio-controller child node\n");
+	unsigned int i, nr_irq_parent;
 
-	nr_irq_parent = of_irq_count(np);
 	spin_lock_init(&info->irq_lock);
 
+	nr_irq_parent = of_irq_count(np);
 	if (!nr_irq_parent) {
 		dev_err(dev, "invalid or no IRQ\n");
 		return 0;
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
