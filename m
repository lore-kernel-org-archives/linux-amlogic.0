Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F374CC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Mar 2022 20:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RE8zCZLgKwF87uvpXdUlVQgbbNmchUbfgZTpl/w1/CU=; b=koDRPKVF4NW11s
	DOdSzUPVQPezIJHMXqn5P6QSaD4vMG6Mz40J8RRYF3kOH4X54bsSr1aXiyT+wbUwD4TerImIkdPLX
	Rfn2K6MKciKtseGVC2DIZrr7P/ZOjWBHTyuHuvEOlXJ42vW1Jc5n1tgpTSHM6a5kMJuxJLtKEDmTC
	VKWTeZ0kpPCTaU27qhUssqRHTmMl5riMcbxXrChi/w9bcQTGSbCLChJqAh4MX8ox/+lzYbMi9nku8
	foacEUw2+X5SQimXnnNI2CnagxzC4VKyOu3DjCmNPW8p/4YjzX2xGEOyu/NlMmtfNIUIyVhyYNgHL
	wLeDs/DO3HgbUVDt1etQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXqB1-003B9u-DK; Fri, 25 Mar 2022 20:04:51 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXqAY-003B1Z-4e; Fri, 25 Mar 2022 20:04:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648238662; x=1679774662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5sK09O1uc6ZSl4vR7vWfGqwrFgZiRRMtY41JRk11RA8=;
 b=iwVe5zhsnNSJmy9rX0brR1JECtMhDqjk+7HBrQf6HYO3RRxJ/2EWfERP
 ccVlPye2g2y6iVzN8icod0CnM+m8uTQiS1iF/c6+EK+geNRKy761kR9Ib
 3ff1o/phvGJ3s0cGthIl2400VVFqkmZuKTQjUHYw9qQoK/Vi3btK7dk9g
 zfmqiEgIFAFZJCEf8ExescL+o+LTJEnpJiIzoJ2g20ND8r6K6I8jsbyXd
 7ZBdQOipPsfaJWEWB5XznLLRa9AUboj76Tqw8/3kgfE7Y8vCQUbL+ohKt
 VJS75cNxuYFMSukIyzuzmjiQBzLc7pS2Pq3ZCgrGNZGRebm/+v2SeMDuz A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="257537315"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="257537315"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:04:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="602159418"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 25 Mar 2022 13:04:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 98EFD217; Fri, 25 Mar 2022 22:04:30 +0200 (EET)
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
Subject: [PATCH v1 4/5] pinctrl: meson: Replace custom code by
 gpiochip_count() call
Date: Fri, 25 Mar 2022 22:03:37 +0200
Message-Id: <20220325200338.54270-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_130422_228685_F5372188 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/pinctrl/meson/pinctrl-meson.c | 28 ++++++++++++---------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 49851444a6e3..7db70d4e214a 100644
--- a/drivers/pinctrl/meson/pinctrl-meson.c
+++ b/drivers/pinctrl/meson/pinctrl-meson.c
@@ -49,6 +49,7 @@
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 
@@ -662,27 +663,22 @@ static struct regmap *meson_map_resource(struct meson_pinctrl *pc,
 	return devm_regmap_init_mmio(pc->dev, base, &meson_regmap_config);
 }
 
-static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc,
-				  struct device_node *node)
+static int meson_pinctrl_parse_dt(struct meson_pinctrl *pc)
 {
-	struct device_node *np, *gpio_np = NULL;
+	struct device_node *gpio_np;
+	unsigned int chips;
 
-	for_each_child_of_node(node, np) {
-		if (!of_find_property(np, "gpio-controller", NULL))
-			continue;
-		if (gpio_np) {
-			dev_err(pc->dev, "multiple gpio nodes\n");
-			of_node_put(np);
-			return -EINVAL;
-		}
-		gpio_np = np;
-	}
-
-	if (!gpio_np) {
+	chips = gpiochip_count(pc->dev);
+	if (!chips) {
 		dev_err(pc->dev, "no gpio node found\n");
 		return -EINVAL;
 	}
+	if (chips > 1) {
+		dev_err(pc->dev, "multiple gpio nodes\n");
+		return -EINVAL;
+	}
 
+	gpio_np = to_of_node(device_get_named_child_node(pc->dev, "gpio-controller"));
 	pc->of_node = gpio_np;
 
 	pc->reg_mux = meson_map_resource(pc, gpio_np, "mux");
@@ -751,7 +747,7 @@ int meson_pinctrl_probe(struct platform_device *pdev)
 	pc->dev = dev;
 	pc->data = (struct meson_pinctrl_data *) of_device_get_match_data(dev);
 
-	ret = meson_pinctrl_parse_dt(pc, dev->of_node);
+	ret = meson_pinctrl_parse_dt(pc);
 	if (ret)
 		return ret;
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
