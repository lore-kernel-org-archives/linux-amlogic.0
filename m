Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59865C3DA61
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Jul 2024 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zG1BjjvWWuc/TqMq4jI/oyyyFoqNs57YfLNCCFMiRCQ=; b=MjGXSz/3HNIqjg
	hSC8yTch78mN3Tjvsp7TIhV8cN7SFNBlPQtornhs4FmSq+fIgESZuLLPhSsQr+3BeszDHfHMZTMad
	coShv+BfHEu/hoQy1j5a2TX5TiG910irnUsIwVCa/AZ/zEM//BpVEAWgHgVuQBF6pqMPNBlt1Qfyq
	glj/bDJ/Nrhg42uenWdWfQxdsFcYjBQI/mu4xeS6kp6jVnJ0E6mF2BSnziVxXRt9kFlx0zBnIfReE
	rbuz8YAMKSvFsZl05k2adx+P4pF6WZZhRV11WHTGGj49aW6hDROGiVZgecYFJc4FzEqLrVFtwBCZD
	N1Xpq7J6+UzERvi/lnFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtx-0000000GdAG-2oW6;
	Thu, 18 Jul 2024 09:58:17 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUNtr-0000000Gd4I-09Df
	for linux-amlogic@lists.infradead.org;
	Thu, 18 Jul 2024 09:58:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3683329f787so385496f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Jul 2024 02:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721296690; x=1721901490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCH5u/ZQ46EyBFByLmOEPWmFGVlqJDI/+pS92Vu1GSk=;
        b=cay2IYhbzGxHctdOXshH/CsxXwpcswTb62G/v14J+D2he2m9LKj54d2FwiNgBQgXRt
         QfJwmcpCSp4pbVgvoN3DzHcgToe4scNa3D0BnXF6gmiaNs3T3NhxqfnsLgfDrafcUAue
         K4mOGcffszGUnd5zSmVQL+65T6lF5ETHR/WUmoSQdth8ksbChTQZqvuIyZ34tIB2/BZA
         CmGmVjug/7Eeooz6pjBnTVg80Usxkci0ifx8Rgs/hnE3h7hPIDsdmTGNFrF88hgR+r5k
         MLAwOnfvSRMrTDozQUeR2vsRzUP28tlXSR6BgBDy62AbUC23YcUptjKfZSITF16b86yR
         X7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721296690; x=1721901490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCH5u/ZQ46EyBFByLmOEPWmFGVlqJDI/+pS92Vu1GSk=;
        b=MGZB/NWVgiLurdYPNcrPofu5yaK1PIUSGVLNofALPg23wb4aw3Si7NHwVKc1pZSoKi
         UHO5Z6gD6YjJbuO6ST0dto1DPzU3EJnm0AbOXAclLCRrTi0J1nkMJJiQjJW/kKCwxMOn
         ba6Hj0BqnCXDHs2QAVnHu2YUlxdTXuNlgmaOWFtsJMAy4x2/2yl8KAP6vOlQhUfylpyS
         tLZkDyudhBq2ScP4NH+CZ9gllN8cPvSn0PXbpTMw+C7VOfoHfcygYLyyGvp3FmjJfZqp
         ClNq6cbd4sj1uJL4N1lkbZGZTSpjua3I4NGgfeRLv6PYPiE8VV7gp6uJX3BbIcUTtxXy
         39eA==
X-Forwarded-Encrypted: i=1; AJvYcCWNWCE1WMt3poTYUHkucnfoEEIcIO22HaVH9Fe6fQVHmesFmQom1rl8xnNn4sRbNVNvmx5JxVJY94Zjl8JLq53ZeS2lGJNwZEvm2x6kpo2C2HM=
X-Gm-Message-State: AOJu0YwUO0ZBltYCqpcIzakchYn3R14g+Jdfgvuj/jwnarJu+fPWVRRK
	+TeZMNtUkv9lXM6tY68g0yP/I2+hgVhj0I0m5SnngF35kTLliKh5APgNP++Y0js=
X-Google-Smtp-Source: AGHT+IGiRMLYPD8/mj2DdlgRkFnwPYEWEbXjTmQ5vs7sFEFj2QKW2f7+XfNNarH8pxk2uC5pHnAF9g==
X-Received: by 2002:a5d:5f49:0:b0:367:993e:8747 with SMTP id ffacd0b85a97d-36831654ae0mr3925223f8f.30.1721296689701;
        Thu, 18 Jul 2024 02:58:09 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:8d37:f44a:c212:e320])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3680dab3be3sm13837155f8f.24.2024.07.18.02.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 02:58:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 8/9] reset: amlogic: split the device core and platform probe
Date: Thu, 18 Jul 2024 11:57:52 +0200
Message-ID: <20240718095755.3511992-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718095755.3511992-1-jbrunet@baylibre.com>
References: <20240718095755.3511992-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_025811_288859_025A9A74 
X-CRM114-Status: GOOD (  23.24  )
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

To prepare the addition of the auxiliary device support, split
out the device core function from the probe of the platform device.

The device core function will be common to both the platform and auxiliary
driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/amlogic/Kconfig                 |  10 +-
 drivers/reset/amlogic/Makefile                |   3 +-
 .../{reset-meson.c => reset-meson-core.c}     | 101 +++---------------
 drivers/reset/amlogic/reset-meson-pltf.c      |  92 ++++++++++++++++
 drivers/reset/amlogic/reset-meson.h           |  24 +++++
 5 files changed, 143 insertions(+), 87 deletions(-)
 rename drivers/reset/amlogic/{reset-meson.c => reset-meson-core.c} (51%)
 create mode 100644 drivers/reset/amlogic/reset-meson-pltf.c
 create mode 100644 drivers/reset/amlogic/reset-meson.h

diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
index 7ed9cf50f038..04c7be0f3165 100644
--- a/drivers/reset/amlogic/Kconfig
+++ b/drivers/reset/amlogic/Kconfig
@@ -1,9 +1,15 @@
+config RESET_MESON_CORE
+	tristate
+	select REGMAP
+
 config RESET_MESON
-	tristate "Meson Reset Driver"
+	tristate "Meson Reset Platform Driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	default ARCH_MESON
+	select REGMAP_MMIO
+	select RESET_MESON_CORE
 	help
-	  This enables the reset driver for Amlogic Meson SoCs.
+	  This enables the reset platform driver for Amlogic SoCs.
 
 config RESET_MESON_AUDIO_ARB
 	tristate "Meson Audio Memory Arbiter Reset Driver"
diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
index 55509fc78513..0f8f9121b566 100644
--- a/drivers/reset/amlogic/Makefile
+++ b/drivers/reset/amlogic/Makefile
@@ -1,2 +1,3 @@
-obj-$(CONFIG_RESET_MESON) += reset-meson.o
+obj-$(CONFIG_RESET_MESON) += reset-meson-pltf.o
+obj-$(CONFIG_RESET_MESON_CORE) += reset-meson-core.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson-core.c
similarity index 51%
rename from drivers/reset/amlogic/reset-meson.c
rename to drivers/reset/amlogic/reset-meson-core.c
index b3ef1a1c7cf9..5e23f3212e6d 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson-core.c
@@ -1,27 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
 /*
- * Amlogic Meson Reset Controller driver
+ * Amlogic Meson Reset core functions
  *
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/of.h>
+
+#include <linux/device.h>
 #include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
-#include <linux/slab.h>
-#include <linux/types.h>
-
-struct meson_reset_param {
-	unsigned int reset_num;
-	unsigned int reset_offset;
-	unsigned int level_offset;
-	bool level_low_reset;
-};
+
+#include "reset-meson.h"
 
 struct meson_reset {
 	const struct meson_reset_param *param;
@@ -103,84 +93,27 @@ static const struct reset_control_ops meson_reset_ops = {
 	.status		= meson_reset_status,
 };
 
-static const struct meson_reset_param meson8b_param = {
-	.reset_num	= 256,
-	.reset_offset	= 0x0,
-	.level_offset	= 0x7c,
-	.level_low_reset = true,
-};
-
-static const struct meson_reset_param meson_a1_param = {
-	.reset_num	= 96,
-	.reset_offset	= 0x0,
-	.level_offset	= 0x40,
-	.level_low_reset = true,
-};
-
-static const struct meson_reset_param meson_s4_param = {
-	.reset_num	= 192,
-	.reset_offset	= 0x0,
-	.level_offset	= 0x40,
-	.level_low_reset = true,
-};
-
-static const struct of_device_id meson_reset_dt_ids[] = {
-	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
-	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
-	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
-	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
-	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
-	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
-	 { /* sentinel */ },
-};
-MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
-
-static const struct regmap_config regmap_config = {
-	.reg_bits   = 32,
-	.val_bits   = 32,
-	.reg_stride = 4,
-};
-
-static int meson_reset_probe(struct platform_device *pdev)
+int meson_reset_probe(struct device *dev, struct regmap *map,
+		      const struct meson_reset_param *param)
 {
-	struct device *dev = &pdev->dev;
 	struct meson_reset *data;
-	void __iomem *base;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	data->param = device_get_match_data(dev);
-	if (!data->param)
-		return -ENODEV;
-
-	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
-	if (IS_ERR(data->map))
-		return dev_err_probe(dev, PTR_ERR(data->map),
-				     "can't init regmap mmio region\n");
-
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reset_num;
+	data->param = param;
+	data->map = map;
+	data->rcdev.owner = dev->driver->owner;
+	data->rcdev.nr_resets = param->reset_num;
 	data->rcdev.ops = &meson_reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
+EXPORT_SYMBOL_NS_GPL(meson_reset_probe, MESON_RESET);
 
-static struct platform_driver meson_reset_driver = {
-	.probe	= meson_reset_probe,
-	.driver = {
-		.name		= "meson_reset",
-		.of_match_table	= meson_reset_dt_ids,
-	},
-};
-module_platform_driver(meson_reset_driver);
-
-MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
+MODULE_DESCRIPTION("Amlogic Meson Reset Core function");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
-MODULE_LICENSE("Dual BSD/GPL");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_IMPORT_NS(MESON_RESET);
diff --git a/drivers/reset/amlogic/reset-meson-pltf.c b/drivers/reset/amlogic/reset-meson-pltf.c
new file mode 100644
index 000000000000..97e933b4aa34
--- /dev/null
+++ b/drivers/reset/amlogic/reset-meson-pltf.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Amlogic Meson Reset platform driver
+ *
+ * Copyright (c) 2016 BayLibre, SAS.
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include "reset-meson.h"
+
+static const struct meson_reset_param meson8b_param = {
+	.reset_num	= 256,
+	.reset_offset	= 0x0,
+	.level_offset	= 0x7c,
+	.level_low_reset = true,
+};
+
+static const struct meson_reset_param meson_a1_param = {
+	.reset_num	= 96,
+	.reset_offset	= 0x0,
+	.level_offset	= 0x40,
+	.level_low_reset = true,
+};
+
+static const struct meson_reset_param meson_s4_param = {
+	.reset_num	= 192,
+	.reset_offset	= 0x0,
+	.level_offset	= 0x40,
+	.level_low_reset = true,
+};
+
+static const struct of_device_id meson_reset_dt_ids[] = {
+	 { .compatible = "amlogic,meson8b-reset",    .data = &meson8b_param},
+	 { .compatible = "amlogic,meson-gxbb-reset", .data = &meson8b_param},
+	 { .compatible = "amlogic,meson-axg-reset",  .data = &meson8b_param},
+	 { .compatible = "amlogic,meson-a1-reset",   .data = &meson_a1_param},
+	 { .compatible = "amlogic,meson-s4-reset",   .data = &meson_s4_param},
+	 { .compatible = "amlogic,c3-reset",   .data = &meson_s4_param},
+	 { /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, meson_reset_dt_ids);
+
+static const struct regmap_config regmap_config = {
+	.reg_bits   = 32,
+	.val_bits   = 32,
+	.reg_stride = 4,
+};
+
+static int meson_reset_pltf_probe(struct platform_device *pdev)
+{
+	const struct meson_reset_param *param;
+	struct device *dev = &pdev->dev;
+	struct regmap *map;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	param = device_get_match_data(dev);
+	if (!param)
+		return -ENODEV;
+
+	map = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map),
+				     "can't init regmap mmio region\n");
+
+	return meson_reset_probe(dev, map, param);
+}
+
+static struct platform_driver meson_reset_pltf_driver = {
+	.probe	= meson_reset_pltf_probe,
+	.driver = {
+		.name		= "meson_reset",
+		.of_match_table	= meson_reset_dt_ids,
+	},
+};
+module_platform_driver(meson_reset_pltf_driver);
+
+MODULE_DESCRIPTION("Amlogic Meson Reset Platform Controller driver");
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(MESON_RESET);
diff --git a/drivers/reset/amlogic/reset-meson.h b/drivers/reset/amlogic/reset-meson.h
new file mode 100644
index 000000000000..c2e8a5cf2e46
--- /dev/null
+++ b/drivers/reset/amlogic/reset-meson.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef __MESON_RESET_CORE_H
+#define __MESON_RESET_CORE_H
+
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+struct meson_reset_param {
+	unsigned int reset_num;
+	unsigned int reset_offset;
+	unsigned int level_offset;
+	bool level_low_reset;
+};
+
+int meson_reset_probe(struct device *dev, struct regmap *map,
+		      const struct meson_reset_param *param);
+
+#endif /* __MESON_RESET_CORE_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
