Return-Path: <SRS0=oV4S=6F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD26FC54FC9
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:02:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 834E52071C
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Apr 2020 08:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j8158wl9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XvQH49c9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 834E52071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJQqPJWtHD9z/yspAxDeBnOsrIR1TyjLp/30aKnXVEY=; b=j8158wl9MHPQ85
	fwsTWjqgiOM1mU8g1S0Q4hXn0LLrvPQ9gz1ASPcSOggJ5H+nZQjDkNchyCHipZu1NW4lAjnoTCmdy
	ESUaM3SXgJ0/UWY2NiUWrpTZe7uIl42EdPuBvHzi2fnvJ741AiIs2TUOGfNyA4G60Ozi0LC5zU0E4
	CxBjUvD8BqkwfzG2KsAhJ3+EHkiEV/3IwweHs/XXR3K2UVZsaO3+f+FRWD8y4h7iDpgH0xOJvCiNY
	hzmRUMiflNsKZcFKh2JkK7UaeUcIouAKSghTxfhO5hr69op5YpuqamBtgaHidC7XL4oe93CP3pQ5W
	yYCAAIEpuPDqLptueLeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQnrV-0002Oz-6o; Tue, 21 Apr 2020 08:02:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQnqD-00019I-7g
 for linux-amlogic@lists.infradead.org; Tue, 21 Apr 2020 08:01:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id 188so2471084wmc.2
 for <linux-amlogic@lists.infradead.org>; Tue, 21 Apr 2020 01:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QFz1UvHaf/QwvjUq4hk9gw50wQAtgMfi03pcCrPMxNo=;
 b=XvQH49c9pFBXB3qYvYNT0CIcRCWl82CkItDkzQiHosZ5ZQq3KCoglWEUw6Zdrn4QNs
 mPJY8YFllOVEQdw8tGrk+DtWrSk4b6mO6VI2aLk/nE/HUD1B2e4+ogwFpoIR+xBZ7hV6
 QlwR0wKOiI1hkO3kUNyOW4YebTAv+U6SMEkdn1blLetMF8iyMoCqNq/fonMhp8BJNceQ
 SsFOtW5a8nghdMREXzTMLXVH7mv1IgeUIMb2eyoX0yXhyagQqoIyCmjobTRMmz/bpBRd
 KWnIhpVGJINBOeGz14jpT8qX7E+rfXNwziaCayzIphchzygTxhtqXNyiVvR55LTt/O3N
 Vpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QFz1UvHaf/QwvjUq4hk9gw50wQAtgMfi03pcCrPMxNo=;
 b=jK96ECD+nUuYLarJviv7ZekeQuK3ITeWOK0l4xcP8/qIp0LC50PFp4oUIcQZMN8gbN
 rd6n3Jt91Eq7Q3bx3q/NWz/yL110fst4evNnS2lqq3jDWwJKjKcWqz2bgtQVWtmJGeIC
 SqBA8+o2LCG7lLhvSispNAUCiZsKKlKQeZHoUUfi//OWphrTZGdbbUyXmCpMz6ltZvu4
 xLwrbz2slp9qfEspFpJpjqVOwFFh91b6yN172f2MrouNvu1MzsijX2qh4U24xwTVx3qa
 nfN/TkBJH6iUAZe6QzDc01lVLuaUxq1wa+UgIl+qPKw78st6m26divOf2HfE60JneVuq
 sSUg==
X-Gm-Message-State: AGi0PubDe/X1zmUNkiW7/yvt0DdyWCt1y1HRMPoMHkUX6svBlLOJIh7N
 iTbRvJxlndndyo1pA1AJ/XOtOw==
X-Google-Smtp-Source: APiQypL1PXqIzzVcGO5TnXV9TKqnzS1pDGnW/BLBAQOsbzCxixg5uCIe3U5SBR1IJu+LqSNOqTp2ZA==
X-Received: by 2002:a7b:c755:: with SMTP id w21mr3450621wmk.120.1587456071301; 
 Tue, 21 Apr 2020 01:01:11 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id
 x132sm2561552wmg.33.2020.04.21.01.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 01:01:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: lee.jones@linaro.org, jdelvare@suse.com, linux@roeck-us.net,
 srinivas.kandagatla@linaro.org
Subject: [RFC 3/8] hwmon: add support for the MCU controlled FAN on Khadas
 boards
Date: Tue, 21 Apr 2020 10:00:57 +0200
Message-Id: <20200421080102.22796-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200421080102.22796-1-narmstrong@baylibre.com>
References: <20200421080102.22796-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_010113_301089_EE4B2354 
X-CRM114-Status: GOOD (  16.91  )
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
Cc: linux-hwmon@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The new Khadas VIM2 and VIM3 boards controls the cooling fan via the
on-board microcontroller.

This implements the FAN control as HWMON devices as cell of the Khadas
MCU MFD driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/hwmon/Kconfig          |   9 ++
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/khadas-mcu-fan.c | 230 +++++++++++++++++++++++++++++++++
 3 files changed, 240 insertions(+)
 create mode 100644 drivers/hwmon/khadas-mcu-fan.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 4c62f900bf7e..7f63ff7bb732 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1997,6 +1997,15 @@ config SENSORS_XGENE
 	  If you say yes here you get support for the temperature
 	  and power sensors for APM X-Gene SoC.
 
+config SENSORS_KHADAS_MCU_FAN
+	tristate "Khadas MCU controller FAN driver"
+	depends on OF || COMPILE_TEST
+	select MFD_CORE
+	select REGMAP
+	help
+	  If you say yes here you get support for the FAN controlled
+	  by the Microcontroller found on the Khadas VIM boards.
+
 if ACPI
 
 comment "ACPI drivers"
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index b0b9c8e57176..20db40f6d57f 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -185,6 +185,7 @@ obj-$(CONFIG_SENSORS_W83L786NG)	+= w83l786ng.o
 obj-$(CONFIG_SENSORS_WM831X)	+= wm831x-hwmon.o
 obj-$(CONFIG_SENSORS_WM8350)	+= wm8350-hwmon.o
 obj-$(CONFIG_SENSORS_XGENE)	+= xgene-hwmon.o
+obj-$(CONFIG_SENSORS_KHADAS_MCU_FAN)	+= khadas-mcu-fan.o
 
 obj-$(CONFIG_SENSORS_OCC)	+= occ/
 obj-$(CONFIG_PMBUS)		+= pmbus/
diff --git a/drivers/hwmon/khadas-mcu-fan.c b/drivers/hwmon/khadas-mcu-fan.c
new file mode 100644
index 000000000000..dd92b2bcb7e3
--- /dev/null
+++ b/drivers/hwmon/khadas-mcu-fan.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Khadas MCU Controlled FAN driver
+ *
+ * Copyright (C) 2020 BayLibre SAS
+ * Author(s): Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
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
+	ret = regmap_write(ctx->mcu->map, KHADAS_MCU_CMD_FAN_STATUS_CTRL_REG,
+			   level);
+	if (ret)
+		return ret;
+
+	ctx->level = level;
+
+	return 0;
+}
+
+static ssize_t level_store(struct device *dev, struct device_attribute *attr,
+			   const char *buf, size_t count)
+{
+	struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
+	unsigned long level;
+	int ret;
+
+	if (kstrtoul(buf, 10, &level) || level > MAX_LEVEL)
+		return -EINVAL;
+
+	ret = khadas_mcu_fan_set_level(ctx, level);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
+static ssize_t level_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct khadas_mcu_fan_ctx *ctx = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", ctx->level);
+}
+
+static SENSOR_DEVICE_ATTR_RW(level1, level, 0);
+
+static struct attribute *khadas_mcu_fan_attrs[] = {
+	&sensor_dev_attr_level1.dev_attr.attr,
+	NULL,
+};
+
+static const struct attribute_group khadas_mcu_fan_group = {
+	.attrs = khadas_mcu_fan_attrs,
+};
+
+static const struct attribute_group *khadas_mcu_fan_groups[] = {
+	&khadas_mcu_fan_group,
+	NULL,
+};
+
+/* thermal cooling device callbacks */
+static int khadas_mcu_fan_get_max_state(struct thermal_cooling_device *cdev,
+					unsigned long *state)
+{
+	struct khadas_mcu_fan_ctx *ctx = cdev->devdata;
+
+	if (!ctx)
+		return -EINVAL;
+
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
+	if (!ctx)
+		return -EINVAL;
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
+	if (!ctx || (state > MAX_LEVEL))
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
+	struct device *hwmon;
+	int ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	ctx->mcu = mcu;
+	platform_set_drvdata(pdev, ctx);
+
+	hwmon = devm_hwmon_device_register_with_groups(dev, "khadas-mcu-fan",
+						       ctx,
+						       khadas_mcu_fan_groups);
+	if (IS_ERR(hwmon)) {
+		dev_err(dev, "Failed to register hwmon device\n");
+		return PTR_ERR(hwmon);
+	}
+
+	if (IS_ENABLED(CONFIG_THERMAL)) {
+		cdev = devm_thermal_of_cooling_device_register(dev->parent,
+			dev->parent->of_node, "khadas-mcu-fan", ctx,
+			&khadas_mcu_fan_cooling_ops);
+		if (IS_ERR(cdev)) {
+			ret = PTR_ERR(cdev);
+			dev_err(dev,
+				"Failed to register khadas-mcu-fan as cooling device: %d\n",
+				ret);
+			return ret;
+		}
+		ctx->cdev = cdev;
+		thermal_cdev_update(cdev);
+	}
+
+	return 0;
+}
+
+static int khadas_mcu_fan_disable(struct device *dev)
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
+static void khadas_mcu_fan_shutdown(struct platform_device *pdev)
+{
+	khadas_mcu_fan_disable(&pdev->dev);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int khadas_mcu_fan_suspend(struct device *dev)
+{
+	return khadas_mcu_fan_disable(dev);
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
