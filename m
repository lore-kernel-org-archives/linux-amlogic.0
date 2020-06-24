Return-Path: <SRS0=3F0F=AF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4238C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 16:16:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C515420899
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2020 16:16:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uB757G6f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hAijn9tr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C515420899
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mdKRl1GIBDPME+GcbdvTKp2SBo+G9OomwOLUfC0tg6A=; b=uB757G6fJXn6XfLwNq+rPkbVX
	PHF07xQZzOuUGXOf3ZMsAE2wMqibdhHPZZwDOYNf1O7mTiRiIIrc2rvfJtFPFmXU7PBusLkFu5kuv
	D2HZQL38Kcemt2MsLMrL+V7jvjy8l51VrGplnIbPW8z+s/PD4N55gg9L4FnghGnElz2bMt3mLqOxA
	MXqBokK39q4NdTUitGovtcasv2J0ne20UG6kqW1olT0yPsMELOP7dLXKSaQmHE3oUI/fEcwXrloYN
	mso7a1mvki50hp2ydw7tadVyBeNaziUPopIdR5/Jw4SMQ2r4QANoD72MU7QjDQ8e8DgbtdbjzMsYj
	1jOpFhZiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo83t-0002qB-3o; Wed, 24 Jun 2020 16:15:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo83i-0002n8-RJ
 for linux-amlogic@lists.infradead.org; Wed, 24 Jun 2020 16:15:38 +0000
Received: by mail-wm1-x341.google.com with SMTP id u26so4842067wmn.1
 for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2020 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i0KtkRN6SkhMzbNHsN7aB/oAr6hJXaOBssfXpSlZ3bo=;
 b=hAijn9trak1tV9zGu5s8r8sIHS4/1002P9VEeQEen7WNZ0Q2oDONSlMBRpnRSsJywS
 mMc1BAyHjGkKngMHmj6zMKf5P2fBl9WQzGEnXlEOa9kimCk5QlOrh+KUvZm4bAPz71tg
 nzhAAFRAixrAoK5AjDniBIXCeXLHGp2IbKePm8hzpbq4Wbmp0XFLOxHCfW4NU8JFkyya
 N+QHdUegs4bg4QMhOIA3t5rj+WJl2RQmbfS/Vf3A63hZkgX01VPjfdEiUzvmuVrNRxhp
 HgJjnk5UbB5z8PnbHvOHHqeIBYblxYRHmYr53lLtIUq2W94BBuRp5UTQ3V8rwEq5yyIE
 Xb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i0KtkRN6SkhMzbNHsN7aB/oAr6hJXaOBssfXpSlZ3bo=;
 b=RPni83m3xPCsTvUyCVgo9u7QnITWdsNDs/lpV5CPAA2pW+EnVaqyyjTF2cyviRJ8dx
 tor1u4Ddz1xQcYqesgojJN7LAdw3ajxOqnCPxWH0KXa6Bi9h+PZ6g21EBOrP16oHM1kc
 rCGDeGYJIlv2GDLB4x8kZPNu0iPlUKZChGC0XIJBJA2KOA85K/j8wbP+CBysGUA7siMI
 3IM6opGb4e36O0LpneVmtZ4sUARYzohNTd6MzQflXeb9CSg59DmaUYEM3Vam6waCnCLQ
 9+dRsg+MaIMjJzN8ZmSMu19pZy5iJOmFsitQ/myni8eg5106fsgIow6gRzL1E8KonYNz
 B87A==
X-Gm-Message-State: AOAM533FfAPApCKV4G9sTbPg+AqT4CHBL9Yh8bJsKBbw+sPQpwI760tj
 BR4/3Xsg/iyNXulYN+DoqXnwwkFV5WZhhg==
X-Google-Smtp-Source: ABdhPJyQorCk33Dq8SCjQKSB7vqQBzlENSxcMcC42KDUjfhBkwAWX0rELxyJ6tIzYNbE33vELMOLlA==
X-Received: by 2002:a1c:544f:: with SMTP id p15mr18416407wmi.84.1593015333772; 
 Wed, 24 Jun 2020 09:15:33 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:89ac:d9e8:f44c:b137])
 by smtp.gmail.com with ESMTPSA id t15sm8716207wmj.14.2020.06.24.09.15.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 09:15:32 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: lee.jones@linaro.org
Subject: [PATCH v5 1/2] thermal: add support for the MCU controlled FAN on
 Khadas boards
Date: Wed, 24 Jun 2020 18:15:27 +0200
Message-Id: <20200624161528.12664-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200624161528.12664-1-narmstrong@baylibre.com>
References: <20200624161528.12664-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: amit.kucheria@verdurent.com, daniel.lezcano@linaro.org,
 linux-pm@vger.kernel.org, khilman@baylibre.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Amit Kucheria <amit.kucheria@linaro.org>, linux-amlogic@lists.infradead.org,
 rui.zhang@intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The new Khadas VIM2 and VIM3 boards controls the cooling fan via the
on-board microcontroller.

This implements the FAN control as thermal devices and as cell of the Khadas
MCU MFD driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>
---
Hi Daniel,

Is it ok Lee applies this patch via the MFD tree since it depends on
the linux/mfd/khadas-mcu.h header ?

Thanks,
Neil

 drivers/thermal/Kconfig          |  11 +++
 drivers/thermal/Makefile         |   1 +
 drivers/thermal/khadas_mcu_fan.c | 162 +++++++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)
 create mode 100644 drivers/thermal/khadas_mcu_fan.c

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 3eb2348e5242..0125561488c9 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -500,4 +500,15 @@ config SPRD_THERMAL
 	help
 	  Support for the Spreadtrum thermal sensor driver in the Linux thermal
 	  framework.
+
+config KHADAS_MCU_FAN_THERMAL
+	tristate "Khadas MCU controller FAN cooling support"
+	depends on OF || COMPILE_TEST
+	depends on MFD_KHADAS_MCU
+	select MFD_CORE
+	select REGMAP
+	help
+	  If you say yes here you get support for the FAN controlled
+	  by the Microcontroller found on the Khadas VIM boards.
+
 endif
diff --git a/drivers/thermal/Makefile b/drivers/thermal/Makefile
index 0c8b84a09b9a..4b6aabaa7e31 100644
--- a/drivers/thermal/Makefile
+++ b/drivers/thermal/Makefile
@@ -61,3 +61,4 @@ obj-$(CONFIG_ZX2967_THERMAL)	+= zx2967_thermal.o
 obj-$(CONFIG_UNIPHIER_THERMAL)	+= uniphier_thermal.o
 obj-$(CONFIG_AMLOGIC_THERMAL)     += amlogic_thermal.o
 obj-$(CONFIG_SPRD_THERMAL)	+= sprd_thermal.o
+obj-$(CONFIG_KHADAS_MCU_FAN_THERMAL)	+= khadas_mcu_fan.o
diff --git a/drivers/thermal/khadas_mcu_fan.c b/drivers/thermal/khadas_mcu_fan.c
new file mode 100644
index 000000000000..9eadd2d6413e
--- /dev/null
+++ b/drivers/thermal/khadas_mcu_fan.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Khadas MCU Controlled FAN driver
+ *
+ * Copyright (C) 2020 BayLibre SAS
+ * Author(s): Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/khadas-mcu.h>
+#include <linux/regmap.h>
+#include <linux/sysfs.h>
+#include <linux/thermal.h>
+
+#define MAX_LEVEL 3
+
+struct khadas_mcu_fan_ctx {
+	struct khadas_mcu *mcu;
+	unsigned int level;
+	struct thermal_cooling_device *cdev;
+};
+
+static int khadas_mcu_fan_set_level(struct khadas_mcu_fan_ctx *ctx,
+				    unsigned int level)
+{
+	int ret;
+
+	ret = regmap_write(ctx->mcu->regmap, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
+			   level);
+	if (ret)
+		return ret;
+
+	ctx->level = level;
+
+	return 0;
+}
+
+static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
+					unsigned long *state)
+{
+	*state = MAX_LEVEL;
+
+	return 0;
+}
+
+static int khadas_mcu_fan_get_cur_state(struct thermal_cooling_device *cdev,
+					unsigned long *state)
+{
+	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
+
+	*state = ctx->level;
+
+	return 0;
+}
+
+static int
+khadas_mcu_fan_set_cur_state(struct thermal_cooling_device *cdev,
+			     unsigned long state)
+{
+	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
+
+	if (state > MAX_LEVEL)
+		return -EINVAL;
+
+	if (state == ctx->level)
+		return 0;
+
+	return khadas_mcu_fan_set_level(ctx, state);
+}
+
+static const struct thermal_cooling_device_ops khadas_mcu_fan_cooling_ops = {
+	.get_max_state = khadas_mcu_fan_get_max_state,
+	.get_cur_state = khadas_mcu_fan_get_cur_state,
+	.set_cur_state = khadas_mcu_fan_set_cur_state,
+};
+
+static int khadas_mcu_fan_probe(struct platform_device *pdev)
+{
+	struct khadas_mcu *mcu = dev_get_drvdata(pdev->dev.parent);
+	struct thermal_cooling_device *cdev;
+	struct device *dev = &pdev->dev;
+	struct khadas_mcu_fan_ctx *ctx;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	ctx->mcu = mcu;
+	platform_set_drvdata(pdev, ctx);
+
+	cdev = devm_thermal_of_cooling_device_register(dev->parent,
+			dev->parent->of_node, "khadas-mcu-fan", ctx,
+			&khadas_mcu_fan_cooling_ops);
+	if (IS_ERR(cdev)) {
+		ret = PTR_ERR(cdev);
+		dev_err(dev, "Failed to register khadas-mcu-fan as cooling device: %d\n",
+			ret);
+		return ret;
+	}
+	ctx->cdev = cdev;
+	thermal_cdev_update(cdev);
+
+	return 0;
+}
+
+static void khadas_mcu_fan_shutdown(struct platform_device *pdev)
+{
+	struct khadas_mcu_fan_ctx *ctx = platform_get_drvdata(pdev);
+
+	khadas_mcu_fan_set_level(ctx, 0);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int khadas_mcu_fan_suspend(struct device *dev)
+{
+	struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
+	unsigned int level_save = ctx->level;
+	int ret;
+
+	ret = khadas_mcu_fan_set_level(ctx, 0);
+	if (ret)
+		return ret;
+
+	ctx->level = level_save;
+
+	return 0;
+}
+
+static int khadas_mcu_fan_resume(struct device *dev)
+{
+	struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
+
+	return khadas_mcu_fan_set_level(ctx, ctx->level);
+}
+#endif
+
+static SIMPLE_DEV_PM_OPS(khadas_mcu_fan_pm, khadas_mcu_fan_suspend,
+			 khadas_mcu_fan_resume);
+
+static const struct platform_device_id khadas_mcu_fan_id_table[] = {
+	{ .name = "khadas-mcu-fan-ctrl", },
+	{},
+};
+MODULE_DEVICE_TABLE(platform, khadas_mcu_fan_id_table);
+
+static struct platform_driver khadas_mcu_fan_driver = {
+	.probe		= khadas_mcu_fan_probe,
+	.shutdown	= khadas_mcu_fan_shutdown,
+	.driver	= {
+		.name		= "khadas-mcu-fan-ctrl",
+		.pm		= &khadas_mcu_fan_pm,
+	},
+	.id_table	= khadas_mcu_fan_id_table,
+};
+
+module_platform_driver(khadas_mcu_fan_driver);
+
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_DESCRIPTION("Khadas MCU FAN driver");
+MODULE_LICENSE("GPL");
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
