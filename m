Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188ACC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 20:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JWNRbKiRKJEOriqw5j6M2tF3ctOnHFuvbvjn4KeKAPc=; b=JLkFyFM9WZrJY9
	fgoUY7lBQkW6sjF9STuiD6Ee+dtERq5IxvXiPmsxK2GGJwCFunPprBtOWLIDJSA8nKhYrtREjktL9
	bysvNb2Eyn9I5novrc6WN1Q7LpjJX/R6zz3d3EJuIsoqw5iegLSnHZvemzcQaCmbf4GUCbetz0TKy
	mL6SWx5df7iedaqYEShz9/no34ZstvZ35t0eRbbPDH1rduoKPurwq8pfALXvWbTquOj/7inYVD6hJ
	Q8X4LxrYqjIQNEOGI7GYC1230ulqVLfZU+GIjibabVOJuHyhwXwKHoGvBu3651wEMnrJOt5MZe7Ep
	rmiRVu3h9wGwa/FNuLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXqB2-003BAI-6o; Fri, 25 Mar 2022 20:04:52 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXqAZ-003B1y-RG; Fri, 25 Mar 2022 20:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648238663; x=1679774663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+3cMN1f1lEcXuRBrNDyNybfnJAqjD8jUdUQVryZwyuU=;
 b=JNB9/rPiWkEYQlXLtLQHfpdOIetPuEWtWwudVR+xLaMLCVy4C/Q/2vmE
 kjcdQdug1cVTd4Ya8/d4Mb8k45OhKuJ6TUsl5DWWQmDGZA5VC5Qsxy0Db
 wqiZ9Fq4PSzpOaNK10/OpampnsP2kMETfHVKYDDCNg0EjdM4fk6e8ONFA
 wrzmqU9NyJ9XQqg/jl3TCfWlujA8mgPMquN3svGOuh3t+A7wGNjmuimQJ
 Fzswt6gvB139Gi56w0FH0mSa5UpHtnYjmDdygN0VTrpXK0+wC7L8iBTxn
 VCIOCWJX5FHTcmPrsksjFDa/4TAGdBZS7v8L2CFt/9GLPlDcVmwV7diFV g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="238647057"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="238647057"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="561956350"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 25 Mar 2022 13:04:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A508B314; Fri, 25 Mar 2022 22:04:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 5/5] pinctrl: armada-37xx: Replace custom code by
 gpiochip_count() call
Date: Fri, 25 Mar 2022 22:03:38 +0200
Message-Id: <20220325200338.54270-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_130423_938747_BA7AD206 
X-CRM114-Status: GOOD (  14.37  )
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

Since we have generic function to count GPIO controller nodes
under given device, there is no need to open code it. Replace
custom code by gpiochip_count() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 24 +++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 08cad14042e2..ba94125f6566 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -728,22 +728,18 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	struct gpio_irq_chip *girq = &gc->irq;
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
-	int ret = -ENODEV, i, nr_irq_parent;
+	unsigned int nr_child_nodes, i;
+	int ret;
 
 	/* Check if we have at least one gpio-controller child node */
-	for_each_child_of_node(dev->of_node, np) {
-		if (of_property_read_bool(np, "gpio-controller")) {
-			ret = 0;
-			break;
-		}
-	}
-	if (ret)
-		return dev_err_probe(dev, ret, "no gpio-controller child node\n");
+	nr_child_nodes = gpiochip_count(dev);
+	if (!nr_child_nodes)
+		return dev_err_probe(dev, -ENODEV, "no gpio-controller child node\n");
 
-	nr_irq_parent = of_irq_count(np);
 	spin_lock_init(&info->irq_lock);
 
-	if (!nr_irq_parent) {
+	nr_child_nodes = of_irq_count(np);
+	if (!nr_child_nodes) {
 		dev_err(dev, "invalid or no IRQ\n");
 		return 0;
 	}
@@ -766,11 +762,11 @@ static int armada_37xx_irqchip_register(struct platform_device *pdev,
 	 * controller. But we do not take advantage of this and use
 	 * the chained irq with all of them.
 	 */
-	girq->num_parents = nr_irq_parent;
-	girq->parents = devm_kcalloc(dev, nr_irq_parent, sizeof(*girq->parents), GFP_KERNEL);
+	girq->num_parents = nr_child_nodes;
+	girq->parents = devm_kcalloc(dev, nr_child_nodes, sizeof(*girq->parents), GFP_KERNEL);
 	if (!girq->parents)
 		return -ENOMEM;
-	for (i = 0; i < nr_irq_parent; i++) {
+	for (i = 0; i < nr_child_nodes; i++) {
 		int irq = irq_of_parse_and_map(np, i);
 
 		if (irq < 0)
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
