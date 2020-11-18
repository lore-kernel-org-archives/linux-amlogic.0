Return-Path: <SRS0=v4K1=EY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01902C5519F
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 19:14:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241B2221EB
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2020 19:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMtmQSo5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="F9ZAUTOX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241B2221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vI52tkp+yq2KWDSryR5iJxwdBcDtUGZ7XiGJ/fDJC+Q=; b=SMtmQSo5tL8k5aNWMgeZu/hUuC
	YynJs2PGfHarpCYDo6QiKMcVI6FTYGwP0hmx6EEGMpCsDjnADcBFndtRTiHp0Y8S2aFn7/1b81bE7
	LDH2LR09mXvCYYIS3EUE34H1Ep/3ut4Zo1Spi8JfKioPpLqpiZkuhGfAgU5e7537OUoI2pibQeYCR
	OF/QejMxEmDzuhM+gmALhUj/uL5JZJYwc9aTVl51DX89lglJzyH/3HFAK/hQq0/OaPHfa2W16ZCgc
	MxmuW0MFm4sH55K4oDovhgYjpiD5vZGlZZ6dKijp1x19ydw8v/J+DD7Z57belQDkCpl1OqqBGnzeY
	XTRc3zoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfSuC-000572-48; Wed, 18 Nov 2020 19:14:12 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfSu9-00056T-N2
 for linux-amlogic@lists.infradead.org; Wed, 18 Nov 2020 19:14:10 +0000
Received: by mail-pf1-x42c.google.com with SMTP id g7so2045796pfc.2
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2020 11:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CJbd6NAuK4zlk/2VM88Eb/il13eEuk+zcEVaHewqSOA=;
 b=F9ZAUTOXB4PvwjI5OKyGg9aSrohi4I8/hV+P3iJExjK+cAxhHmKbiJyRVIg2qq5fqF
 AX7usD46YBq3UKmjU9uUXTRoCM/FR+I+bMlAoxzjXzw51pVCsZ38lMtHV9K/fzsrhRvq
 Iw3ZUr79A9W46QqOF1FCnXCU0HGW6QkUBuIrsoh3SKHrTzH/A2cjhgNIFZXxVOydB91u
 A14pm/xinLXv+ojRxcFcIxEtlN+X2ZyKPHyRx+TGp8b1MHMB7mMLXM6IBVFZa910VUAz
 gYpasVSequJJUuMi8HaqCu4cHCQGGemfN4cChz+KkFA6YlAKDc6q+ktA/dtU3gBVK3gH
 KQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CJbd6NAuK4zlk/2VM88Eb/il13eEuk+zcEVaHewqSOA=;
 b=pyhywGNVhQi5bUSYRs8DvZzub6tlitHpDVyYJ1GW+jC/rwJUF1m/LaqfcRgocDjOAp
 MfWzXZmMt9G6rHl7I2Dv8oBgxGhs+igK8dng7W/VvquOlunHVQDVhbPfBXELya333NyJ
 s0FU2GKVQpQmOccmy3uqj1OQhiIR1YZ0OmWqSAPS7qxkoxgdOx2lNuIwDoxFghvI6fta
 7lDHEQ8X5Q95qT+AOJehifR9Db+zPcLc6iBun42Ts53qwfc4gyjwHVTGlK0RFfhHZa3m
 gKvV7SkScMILs4bIHgs9ZOupvbhsg78pY43o4IdG933glFdFTxkyqN0lLj1zjWPIY4po
 kVeA==
X-Gm-Message-State: AOAM532lGoyv4b7upJcpkjwrnobzaKRu2o2mGTZN8ijWYk1ttPWXvEn+
 LP+RXFidlRA5R0dQC5lFfl8XpgAncowO1p32FRU=
X-Google-Smtp-Source: ABdhPJw3+8pGchiHDqnb1N5QhGtCQEXmxn3y3LDsHnYAFSXPKbYqo2bW+rTiwVRpF9c/JSY6jz6u2Q==
X-Received: by 2002:a17:90a:9504:: with SMTP id t4mr535804pjo.82.1605726847179; 
 Wed, 18 Nov 2020 11:14:07 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id q18sm25665094pfs.150.2020.11.18.11.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 11:14:06 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Brunet?= <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2] clk: meson: enable building as modules
Date: Wed, 18 Nov 2020 11:14:05 -0800
Message-Id: <20201118191405.36798-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_141409_764104_3E1B3489 
X-CRM114-Status: GOOD (  15.19  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Make it possible to build all clk drivers as modules, but default
remains built-in.

No functional changes.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
v2: drop G12A Kconfig fix, separated out into separate patch

 drivers/clk/meson/Kconfig       | 6 +++---
 drivers/clk/meson/axg-aoclk.c   | 5 ++++-
 drivers/clk/meson/axg.c         | 5 ++++-
 drivers/clk/meson/g12a-aoclk.c  | 5 ++++-
 drivers/clk/meson/g12a.c        | 5 ++++-
 drivers/clk/meson/gxbb-aoclk.c  | 5 ++++-
 drivers/clk/meson/gxbb.c        | 5 ++++-
 drivers/clk/meson/meson-aoclk.c | 4 ++++
 drivers/clk/meson/meson-eeclk.c | 3 +++
 9 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 034da203e8e0..a3417f82aa84 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -58,7 +58,7 @@ config COMMON_CLK_MESON8B
 	  want peripherals and CPU frequency scaling to work.
 
 config COMMON_CLK_GXBB
-	bool "GXBB and GXL SoC clock controllers support"
+	tristate "GXBB and GXL SoC clock controllers support"
 	depends on ARM64
 	default y
 	select COMMON_CLK_MESON_REGMAP
@@ -74,7 +74,7 @@ config COMMON_CLK_GXBB
 	  Say Y if you want peripherals and CPU frequency scaling to work.
 
 config COMMON_CLK_AXG
-	bool "AXG SoC clock controllers support"
+	tristate "AXG SoC clock controllers support"
 	depends on ARM64
 	default y
 	select COMMON_CLK_MESON_REGMAP
@@ -100,7 +100,7 @@ config COMMON_CLK_AXG_AUDIO
 	  aka axg, Say Y if you want audio subsystem to work.
 
 config COMMON_CLK_G12A
-	bool "G12 and SM1 SoC clock controllers support"
+	tristate "G12 and SM1 SoC clock controllers support"
 	depends on ARM64
 	default y
 	select COMMON_CLK_MESON_REGMAP
diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index b488b40c9d0e..af6db437bcd8 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include "meson-aoclk.h"
 #include "axg-aoclk.h"
 
@@ -326,6 +327,7 @@ static const struct of_device_id axg_aoclkc_match_table[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, axg_aoclkc_match_table);
 
 static struct platform_driver axg_aoclkc_driver = {
 	.probe		= meson_aoclkc_probe,
@@ -335,4 +337,5 @@ static struct platform_driver axg_aoclkc_driver = {
 	},
 };
 
-builtin_platform_driver(axg_aoclkc_driver);
+module_platform_driver(axg_aoclkc_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 13fc0006f63d..7ca7ea7345e5 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/module.h>
 
 #include "clk-regmap.h"
 #include "clk-pll.h"
@@ -1354,6 +1355,7 @@ static const struct of_device_id clkc_match_table[] = {
 	{ .compatible = "amlogic,axg-clkc", .data = &axg_clkc_data },
 	{}
 };
+MODULE_DEVICE_TABLE(of, clkc_match_table);
 
 static struct platform_driver axg_driver = {
 	.probe		= meson_eeclkc_probe,
@@ -1363,4 +1365,5 @@ static struct platform_driver axg_driver = {
 	},
 };
 
-builtin_platform_driver(axg_driver);
+module_platform_driver(axg_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 62499563e4f5..b52990e574d2 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include "meson-aoclk.h"
 #include "g12a-aoclk.h"
 
@@ -461,6 +462,7 @@ static const struct of_device_id g12a_aoclkc_match_table[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, g12a_aoclkc_match_table);
 
 static struct platform_driver g12a_aoclkc_driver = {
 	.probe		= meson_aoclkc_probe,
@@ -470,4 +472,5 @@ static struct platform_driver g12a_aoclkc_driver = {
 	},
 };
 
-builtin_platform_driver(g12a_aoclkc_driver);
+module_platform_driver(g12a_aoclkc_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index b814d44917a5..66094bfec2cc 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -15,6 +15,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
+#include <linux/module.h>
 
 #include "clk-mpll.h"
 #include "clk-pll.h"
@@ -5370,6 +5371,7 @@ static const struct of_device_id clkc_match_table[] = {
 	},
 	{}
 };
+MODULE_DEVICE_TABLE(of, clkc_match_table);
 
 static struct platform_driver g12a_driver = {
 	.probe		= meson_g12a_probe,
@@ -5379,4 +5381,5 @@ static struct platform_driver g12a_driver = {
 	},
 };
 
-builtin_platform_driver(g12a_driver);
+module_platform_driver(g12a_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index e940861a396b..fce95cf89836 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -5,6 +5,7 @@
  */
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
+#include <linux/module.h>
 #include "meson-aoclk.h"
 #include "gxbb-aoclk.h"
 
@@ -287,6 +288,7 @@ static const struct of_device_id gxbb_aoclkc_match_table[] = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(of, gxbb_aoclkc_match_table);
 
 static struct platform_driver gxbb_aoclkc_driver = {
 	.probe		= meson_aoclkc_probe,
@@ -295,4 +297,5 @@ static struct platform_driver gxbb_aoclkc_driver = {
 		.of_match_table = gxbb_aoclkc_match_table,
 	},
 };
-builtin_platform_driver(gxbb_aoclkc_driver);
+module_platform_driver(gxbb_aoclkc_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 0a68af6eec3d..d6eed760327d 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/module.h>
 
 #include "gxbb.h"
 #include "clk-regmap.h"
@@ -3519,6 +3520,7 @@ static const struct of_device_id clkc_match_table[] = {
 	{ .compatible = "amlogic,gxl-clkc", .data = &gxl_clkc_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, clkc_match_table);
 
 static struct platform_driver gxbb_driver = {
 	.probe		= meson_eeclkc_probe,
@@ -3528,4 +3530,5 @@ static struct platform_driver gxbb_driver = {
 	},
 };
 
-builtin_platform_driver(gxbb_driver);
+module_platform_driver(gxbb_driver);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index bf8bea675d24..f0858fe789bc 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -14,6 +14,8 @@
 #include <linux/reset-controller.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
+#include <linux/module.h>
+
 #include <linux/slab.h>
 #include "meson-aoclk.h"
 
@@ -84,3 +86,5 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 		(void *) data->hw_data);
 }
+EXPORT_SYMBOL_GPL(meson_aoclkc_probe);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index a7cb1e7aedc4..8d5a5dab955a 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -9,6 +9,7 @@
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
+#include <linux/module.h>
 
 #include "clk-regmap.h"
 #include "meson-eeclk.h"
@@ -54,3 +55,5 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
 					   data->hw_onecell_data);
 }
+EXPORT_SYMBOL_GPL(meson_eeclkc_probe);
+MODULE_LICENSE("GPL v2");
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
