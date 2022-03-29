Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545AFC433F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Mar 2022 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuuOh33GcvReagzcD6eWEGQjVQJs6+kJTe+BQeqiARM=; b=xQqCNrMftjXwRW
	i5v5zVVJavSVxCA6Fi3OHug9MhJ0wvAf7AzGVK+hgu6UwJs+IhAXZCjAUCs8ZKpScUSph/nWvbM3u
	r7KINoBMjsRzxanlDx/gbdE5vdkdJ3lZ17/kuykh284LNgystBNBE/UlDoecV9OkUOHA2IYYR1pWm
	9slfJOxSPFvkqB4DpamIeZ0+b3xZ24n580uUB3Dhm0/DeXZui1dDrXrj5uIRCPBAxcvpjhGV0kgih
	T1hyHl+5sMB3w/qT9FSwZ9gfZYJ5+Wt7RGNc/6o2v2f28ab5Ox8ixirG/IP2jpKCX7aLaFT8sGx3r
	nWtN/2G7/j0gE+sWDjOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZDpy-00ChV0-1r; Tue, 29 Mar 2022 15:32:50 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZDmg-00Cffp-Es; Tue, 29 Mar 2022 15:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648567766; x=1680103766;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V6EgMuAfMlvugHWmWhmQmXaLcJFbGhwYezlejNR0DR4=;
 b=jJpDG/HtigX9wlvPWyc8lMxqkfXe+x6nKDe/6T4JKP4p2E+3IlYcXBBv
 anR6hwvB4LiIluMmAiIMgZ2tUXs/op4H9ZTpYp51n4QBTtZDQXAp4A41M
 5qOcusacn/fiGA5SYGzahJgpih+da3Hwc2cTZuZPO/4EwWWu4P7cv/Okl
 Ycrjfb0va2t+Pc4D/COxYBT013ELyqTCLIoDtUyVvgfwYj5ETGQcP7Ez4
 +BoVer9t13zSdIHcrej33enakWsfB6W3Q8DtKt3iFaCQDJmR7wLf8Y+kG
 jzGlEF8YDYP1Ai4rNfl7c/M0EYMXvedY090NymtG60+gV244MPjw3mY6z Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="246767247"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="246767247"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 08:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="554297182"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 29 Mar 2022 08:29:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9704C47E; Tue, 29 Mar 2022 18:29:29 +0300 (EEST)
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
Subject: [PATCH v2 11/13] pinctrl: meson: Replace custom code by
 gpiochip_node_count() call
Date: Tue, 29 Mar 2022 18:29:24 +0300
Message-Id: <20220329152926.50958-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_082926_619862_2779813E 
X-CRM114-Status: GOOD (  15.14  )
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
under a given device, there is no need to open code it. Replace
custom code by gpiochip_node_count() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pinctrl/meson/pinctrl-meson.c | 28 ++++++++++++---------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
index 64da61ba2bb9..c7df4de77b07 100644
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
+	chips = gpiochip_node_count(pc->dev);
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
