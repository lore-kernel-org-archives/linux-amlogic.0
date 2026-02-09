Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEE9EF071A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Feb 2026 05:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1YXCF++I//oih9j7/Zs+e+FXz+BgYs4Ugurdm9ObIF4=; b=MiWuix007Roe9T
	dONhZUZl2URg0zP7+vbTEv2l+CxWqdj33mwMBfPW15qGAuMDJNQmtw98rcWSndEUFjF15reBXqicL
	EPk8pcBx7Y7n1KmXpww9AfgGsbg31XNN8yO+GULQ5frEx+wjCAihbM5Oe1T20NFN4E5zdQdQrMUUi
	yUBY/oCPuH9BeUARud1p1brNybZY7a3ZkzenWpWGpeyJNx3pNY5wFo7HfVJT1JCTy3me457eWfLR5
	bxh6ewSJ0MvrjZ3Dv+u30EHX81ZgBQZmog9loqX1nn2gKNcMLVPaBMJgtv4RliSQHLFwxoVlwXbrE
	INiKFPdAzGpXTje1QPuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK95-0000000Erik-0Pao;
	Mon, 09 Feb 2026 05:49:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK90-0000000EreQ-3RTm
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Feb 2026 05:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC10344561;
	Mon,  9 Feb 2026 05:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE848C2BC86;
	Mon,  9 Feb 2026 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770616147;
	bh=kUXClErnxJfpoi63zJu/2VA2hevTyPYJHfWGKISrFnU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NN+YWyA+qIGY3YaUnRcbMBZCfreM3uyGRGVzJWOJOLke8MaQU7G7e+T5uL9NRI7vo
	 Bbim/pFLtK255n+2IYoQgyn4Gnka2o9JJSOWnX6o5WQcHErQ5z7+SQvkXprp47l7Bo
	 jQ+w4YIsXKQ1HZbKjIEx2YKF29bAWH0V+33ZnTB1fqfC+Z4ZvxgniUjsmPMz5E58re
	 2LElyuhcQLzjxnvN3Uko7GRTtpDtQOKM8j/WTTH31OdcUKl+Gw0jVWdNXzIW5pFEfT
	 Rug9hC2lRYLsox0eKHOoIRxgjPpg6+uKgN68NdJMf13XqxTLQ4m1PGJwOjN/DzRJ5x
	 RfMHQPMhbAPIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF661EF070F;
	Mon,  9 Feb 2026 05:49:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 09 Feb 2026 13:48:59 +0800
Subject: [PATCH 13/13] clk: amlogic: Add support for building as combined
 kernel module
MIME-Version: 1.0
Message-Id: <20260209-a9_clock_driver-v1-13-a9198dc03d2a@amlogic.com>
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
In-Reply-To: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770616143; l=9091;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=ynvp9MD3ylfPiIkBw4uhgEanUvmWd8JB/qKY9SExV8o=;
 b=rIp87sPNTmv1EeoL0cQLnHC8zFT5RmCyigPuTBsDnhU7tDl4Li/EvTduSqy0K5WyL9GGTe1oW
 aK55O13JSACD8zJ8hG8x6xnyqaQiH3n7skHbz/TXYWbP7LGwiio0m40
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_214910_949050_00A17329 
X-CRM114-Status: GOOD (  17.99  )
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
Reply-To: chuan.liu@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Some use cases require clock drivers to be built as kernel modules
and loaded using insmod after system initialization. This patch combines
multiple clock drivers into a single module to reduce system call
overhead caused by multiple insmod invocations during boot process.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/amlogic/Kconfig        | 17 ++++++------
 drivers/clk/amlogic/Makefile       |  1 +
 drivers/clk/amlogic/a9-misc-ccu.c  | 12 ++++++++-
 drivers/clk/amlogic/a9-model-ccu.c | 12 ++++++++-
 drivers/clk/amlogic/a9-pll.c       | 12 ++++++++-
 drivers/clk/amlogic/clk-module.c   | 42 ++++++++++++++++++++++++++++++
 drivers/clk/amlogic/clk-module.h   | 53 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 138 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/amlogic/Kconfig b/drivers/clk/amlogic/Kconfig
index 502aca5332bc..1b60725b80d8 100644
--- a/drivers/clk/amlogic/Kconfig
+++ b/drivers/clk/amlogic/Kconfig
@@ -9,7 +9,7 @@ config COMMON_CLK_AMLOGIC
 	help
 	  This driver provides the basic clock infrastructure for Amlogic SoCs,
 	  offering read and write interfaces for various clock control units.
-	  Select Y if your target SoC needs clock driver support.
+	  Select M or Y if your target SoC needs clock driver support.
 
 config COMMON_CLK_AMLOGIC_MISC
 	tristate "Amlogic Misc Clock Control Units"
@@ -17,8 +17,8 @@ config COMMON_CLK_AMLOGIC_MISC
 	help
 	  Supports non-standard module clock control units in Amlogic SoC clock
 	  trees, such as sc-ccu (for smart card controller) and ts-ccu (for
-	  temperature sensor). Select Y if the current SoC contains these module
-	  clock control units.
+	  temperature sensor). Select M or Y if the current SoC contains these
+	  module clock control units.
 
 config COMMON_CLK_AMLOGIC_MODEL
 	tristate "Amlogic Standardized Model Clock Control Units"
@@ -27,8 +27,8 @@ config COMMON_CLK_AMLOGIC_MODEL
 	  Supports standardized model clock control units commonly used in Amlogic
 	  SoC clock trees, such as composite-ccu, noglitch-ccu, and sysbus-ccu.
 	  Most peripheral clock controllers in Amlogic SoCs are composed of
-	  these models. Select Y if the current SoC contains these clock control
-	  unit models.
+	  these models. Select M or Y if the current SoC contains these clock
+	  control unit models.
 
 config COMMON_CLK_AMLOGIC_PLL
 	tristate "Amlogic PLL Controller"
@@ -36,8 +36,8 @@ config COMMON_CLK_AMLOGIC_PLL
 	help
 	  Supports PLL controller used in Amlogic SoCs. The PLL supports dynamic
 	  configuration of output clock frequency, enabling flexible frequency
-	  settings to provide clocks for other modules. Select Y if the current
-	  SoC contains PLLs.
+	  settings to provide clocks for other modules. Select M or Y if the
+	  current SoC contains PLLs.
 
 config COMMON_CLK_AMLOGIC_A9
 	tristate "Amlogic A9 Family Clock Controller"
@@ -48,4 +48,5 @@ config COMMON_CLK_AMLOGIC_A9
 	select COMMON_CLK_AMLOGIC_PLL
 	help
 	  Support for the clock controller present on the Amlogic A9 family
-	  SoCs. Select Y if A9 family SoC needs to support clock controller.
+	  SoCs. Select M or Y if A9 family SoC needs to support clock
+	  controller.
diff --git a/drivers/clk/amlogic/Makefile b/drivers/clk/amlogic/Makefile
index b174dce61ae9..2778d3859a5e 100644
--- a/drivers/clk/amlogic/Makefile
+++ b/drivers/clk/amlogic/Makefile
@@ -8,6 +8,7 @@ clk-amlogic-y += clk-composite.o
 clk-amlogic-y += clk-dualdiv.o
 clk-amlogic-y += clk-noglitch.o
 clk-amlogic-y += clk-pll.o
+clk-amlogic-y += clk-module.o
 
 ifneq ($(CONFIG_COMMON_CLK_AMLOGIC_MISC),)
 clk-amlogic-y += a9-misc-ccu.o
diff --git a/drivers/clk/amlogic/a9-misc-ccu.c b/drivers/clk/amlogic/a9-misc-ccu.c
index db130d84ccdd..6fd2c9ae3cd0 100644
--- a/drivers/clk/amlogic/a9-misc-ccu.c
+++ b/drivers/clk/amlogic/a9-misc-ccu.c
@@ -10,6 +10,7 @@
 #include "clk-basic.h"
 #include "clk-composite.h"
 #include "clk-dualdiv.h"
+#include "clk-module.h"
 #include "clk-noglitch.h"
 #include "clk-pll.h"
 
@@ -952,7 +953,16 @@ static struct platform_driver of_aml_clk_misc_driver = {
 		.of_match_table = of_aml_clk_misc_match_table,
 	},
 };
-module_platform_driver(of_aml_clk_misc_driver);
+
+int __init aml_clk_misc_driver_init(void)
+{
+	return platform_driver_register(&of_aml_clk_misc_driver);
+}
+
+void __exit aml_clk_misc_driver_exit(void)
+{
+	platform_driver_unregister(&of_aml_clk_misc_driver);
+}
 
 MODULE_DESCRIPTION("Amlogic A9 Misc Clock Control Units Driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
diff --git a/drivers/clk/amlogic/a9-model-ccu.c b/drivers/clk/amlogic/a9-model-ccu.c
index 5d5bf1538f73..58babd42aca3 100644
--- a/drivers/clk/amlogic/a9-model-ccu.c
+++ b/drivers/clk/amlogic/a9-model-ccu.c
@@ -9,6 +9,7 @@
 #include "clk.h"
 #include "clk-basic.h"
 #include "clk-composite.h"
+#include "clk-module.h"
 #include "clk-noglitch.h"
 
 /*
@@ -457,7 +458,16 @@ static struct platform_driver of_aml_clk_model_driver = {
 		.of_match_table = of_aml_clk_model_match_table,
 	},
 };
-module_platform_driver(of_aml_clk_model_driver);
+
+int __init aml_clk_model_driver_init(void)
+{
+	return platform_driver_register(&of_aml_clk_model_driver);
+}
+
+void __exit aml_clk_model_driver_exit(void)
+{
+	platform_driver_unregister(&of_aml_clk_model_driver);
+}
 
 MODULE_DESCRIPTION("Amlogic A9 Standardized Model Clock Control Units Driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
diff --git a/drivers/clk/amlogic/a9-pll.c b/drivers/clk/amlogic/a9-pll.c
index c4c695caa8ed..fe2a77382509 100644
--- a/drivers/clk/amlogic/a9-pll.c
+++ b/drivers/clk/amlogic/a9-pll.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 
 #include "clk.h"
+#include "clk-module.h"
 #include "clk-pll.h"
 
 static const struct aml_pll_data a9_mclk_pll_data = {
@@ -138,7 +139,16 @@ static struct platform_driver of_aml_clk_pll_driver = {
 		.of_match_table = of_aml_clk_pll_match_table,
 	},
 };
-module_platform_driver(of_aml_clk_pll_driver);
+
+int __init aml_pll_driver_init(void)
+{
+	return platform_driver_register(&of_aml_clk_pll_driver);
+}
+
+void __exit aml_pll_driver_exit(void)
+{
+	platform_driver_unregister(&of_aml_clk_pll_driver);
+}
 
 MODULE_DESCRIPTION("Amlogic A9 PLL Controllers Driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
diff --git a/drivers/clk/amlogic/clk-module.c b/drivers/clk/amlogic/clk-module.c
new file mode 100644
index 000000000000..506926c1f908
--- /dev/null
+++ b/drivers/clk/amlogic/clk-module.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (c) 2026 Amlogic, Inc. All rights reserved
+ */
+
+#include <linux/module.h>
+
+#include "clk-module.h"
+
+static int __init aml_clk_driver_init(void)
+{
+	int ret;
+
+	ret = aml_pll_driver_init();
+	if (ret)
+		return ret;
+
+	ret = aml_clk_model_driver_init();
+	if (ret)
+		return ret;
+
+	ret = aml_clk_misc_driver_init();
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void __exit aml_clk_driver_exit(void)
+{
+	aml_clk_misc_driver_exit();
+	aml_clk_model_driver_exit();
+	aml_pll_driver_exit();
+}
+
+module_init(aml_clk_driver_init);
+module_exit(aml_clk_driver_exit);
+
+MODULE_DESCRIPTION("Amlogic Clock Controllers Driver Register");
+MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CLK_AMLOGIC");
diff --git a/drivers/clk/amlogic/clk-module.h b/drivers/clk/amlogic/clk-module.h
new file mode 100644
index 000000000000..6091a50803df
--- /dev/null
+++ b/drivers/clk/amlogic/clk-module.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2026 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __AML_CLK_MODULE_H
+#define __AML_CLK_MODULE_H
+
+#include <linux/kconfig.h>
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_AMLOGIC_PLL)
+extern int aml_pll_driver_init(void);
+extern void aml_pll_driver_exit(void);
+#else /* CONFIG_COMMON_CLK_AMLOGIC_PLL */
+static inline int aml_pll_driver_init(void)
+{
+	return 0;
+}
+
+static inline void aml_pll_driver_exit(void)
+{
+}
+#endif /* CONFIG_COMMON_CLK_AMLOGIC_PLL */
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_AMLOGIC_MODEL)
+extern int aml_clk_model_driver_init(void);
+extern void aml_clk_model_driver_exit(void);
+#else /* CONFIG_COMMON_CLK_AMLOGIC_MODEL */
+static inline int aml_clk_model_driver_init(void)
+{
+	return 0;
+}
+
+static inline void aml_clk_model_driver_exit(void)
+{
+}
+#endif /* CONFIG_COMMON_CLK_AMLOGIC_MODEL */
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_AMLOGIC_MISC)
+extern int aml_clk_misc_driver_init(void);
+extern void aml_clk_misc_driver_exit(void);
+#else /* CONFIG_COMMON_CLK_AMLOGIC_MISC */
+static inline int aml_clk_misc_driver_init(void)
+{
+	return 0;
+}
+
+static inline void aml_clk_misc_driver_exit(void)
+{
+}
+#endif /* CONFIG_COMMON_CLK_AMLOGIC_MISC */
+
+#endif /* __AML_CLK_MODULE_H */

-- 
2.42.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
