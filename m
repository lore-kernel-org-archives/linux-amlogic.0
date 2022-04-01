Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32840C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Apr 2022 10:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lCINtCziMg6Zp97FQJOFYue+SbUmJpGo4kxlpJ1i/Rs=; b=KCVw8/F5RWnRZ/
	oUWjdo32r/nNeXO15quljYRuO9ZBPr98oNwWELAnGnq5JUemOEKQevTUohYbnFSkscmYDq3Lsq1Bw
	7uIL4ODjFEF/vhz6aSV/sXYW2HyOI9FCN46S8JFTHBsBArmn2fU6yV7q+RlmO4GZKy18Umu1fk6Jh
	HLI8HyDRECoAVqw+RX/ik17DmsP2dPWkeatJ3SdDteoQ92lvSPQrwzKEW4y0ctPTfZRzRPYB2mLQj
	DCkhvGpXdlOph0pKBQ0UAzverlyn5wn2AOaqX64WM/UOP+Sps40lIntAxeUBSbIDIlRrfI1rs8Tsj
	NoqvM5lpr546HR2WedtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naEez-005DmQ-T6; Fri, 01 Apr 2022 10:37:41 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naEdP-005Cjo-6m; Fri, 01 Apr 2022 10:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648809363; x=1680345363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KXLXc+19o0UubT6TkmoiDgHQv9YpGm9hY5Ydb16Dc5c=;
 b=Q7xcHaK1AjLpS9rJqh1lCwJxyINHWfi7Nu+tdNHIkh2tHW4YpQ2ztNqj
 Ny0VAA0Tmy3XV11ikNzgmYvMpxZC5fFshI+fp5UocGRdfO8Nt+z2gp431
 lEU5bLtn9xLCUED3MWTTMIqbwFLlrLXBBCd7ybmxDftA71Pf0FCiXT04x
 RnKksljUFAqsLMHxttWGHcC+cmbhA5UOm3BQS9oGhroNckJurczGY6Rzr
 3Frzy14VJXcBV6mlru+zRff6C1YKUplRKRTU7UqUF+eIoxIWU5bjrOHTo
 mek7rYQy7PH/S9zd3FfQLbLjfjc3Yp33bsZvQoFJnTjXaLXR85366ZXJf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10303"; a="240038623"
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="240038623"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2022 03:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,227,1643702400"; d="scan'208";a="521295008"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 01 Apr 2022 03:35:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3BFD26C0; Fri,  1 Apr 2022 13:36:06 +0300 (EEST)
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
Subject: [PATCH v4 13/13] pinctrl: armada-37xx: Reuse GPIO fwnode in
 armada_37xx_irqchip_register()
Date: Fri,  1 Apr 2022 13:36:04 +0300
Message-Id: <20220401103604.8705-14-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_033603_318101_A706E6AD 
X-CRM114-Status: GOOD (  14.27  )
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
index 1fef8a38f574..c0384661ea48 100644
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
