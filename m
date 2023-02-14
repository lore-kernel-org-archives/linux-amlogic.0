Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10823C61DA4
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Feb 2023 16:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u+gj2cxtahoMYaU4b0YEAVX2IPQW8rSvFdDX1ROPw0Y=; b=M09BNrq+d45icb
	xF13OlNp/lRjcnXPKufJElD26On81LAsBz59d9MxSu0C2TIFzkCi2yn+Ad08j/RurcmIPm+iUl2E7
	NweqYXDO+9a84+qYDq6ZUttIsGQfAiLSNWe0u5FiLvsMNieoGHByFu3/9p3rK2cUAuJxz87yB2dkH
	qOrdpmUurccEwiHM8+WADn1VSdVrOX0frlWYkGuiNtOaJ2GWwIaiOR2/d5ckb1qHSsnbj+EMmxLb2
	zuwaXk+OvJmiwTNyJRNRhZ1KMWIVtog5DMEyghXXZK11qMR5DlSO1cewuMDqYtAeo05CIyIAbuTD8
	nBPCigS3ddIdGcq8yt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRyMw-002sCu-KJ; Tue, 14 Feb 2023 16:41:26 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRyMt-002sBV-2D
	for linux-amlogic@lists.infradead.org; Tue, 14 Feb 2023 16:41:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso14113851wms.5
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Feb 2023 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=30SyWhHcXeQCmwLuKz2hroahSQOV1hg9TM2IX1B5XYM=;
        b=NLRoxDC/X3OQcw1AUFUitV0lw8OBtSVP028kbRsqfwUQNnGDGW4xMUewYmQl3vaRDW
         heYkrs9ziTDrKSntcIvDoEWhVySmf4AAHqeXLDjuPlHIVI2IGaVKQJPh/IWqggKHCihX
         xJXOnZYOz4Bko+li2gyxdQvuLs0SGH9TAxUA/I4Dgmsgmt7caQKPWeekQDEmwjZEO1yE
         aJ711SrbHJguyD7KtnJ9RNT7KgU0DCfsmTb5FpF8kwj4s+yaoLEf9Sh/6f8cMu59+gWf
         qFmWivGuqc+AZ1UL5CUOx97SHsdsZsDGFSjBqZsDdwfM7pQSH7JhAIJ8F5ib95PIyDRC
         j1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30SyWhHcXeQCmwLuKz2hroahSQOV1hg9TM2IX1B5XYM=;
        b=jzonC3NaAaMnKn4f3FYvd+cNZEWPuYrnbieyv3GRx+dlLt48cajHVeyts7/R0kIVIr
         9BM6klxx9KtgPmsuQGIFrKIng4lpFhYORrShdCWxs5NlPm7l6ffutnWzVJSd6yHWTHdw
         3xQwhLl6CNgbrGMGWe8Rc3dK9sCIHh48GYfoIMIifOEXDTFVCz57WdonQKAei+8YMD2L
         Rbq72FeDmbGwQJ810+SWYIsze90tF3SqspaqSZN9FsMnJHbT3FNlVQYlViN1wVDEKKxi
         5tmPUl0bPmZeCXs3ouc3tR72S0SMOsVwLDKmU/LoYZbOm+vtJruHaaXV2mCQRNv+eYZG
         10TA==
X-Gm-Message-State: AO0yUKW9LRera6IyeA0KcVjLNqK3YNy+ThpVV0RvAnEL8EY8goqgakBU
	/8Y8DBiHXqZcEuoAwSMfYc70aw==
X-Google-Smtp-Source: AK7set9tWFGWqjp93dl8Si0fD9QUPlDhi7r+5Dn5r8ciUlQO/1PqNvT//Wl+KhWphviMxSMdtOOhNQ==
X-Received: by 2002:a05:600c:448a:b0:3dc:5a13:c7d1 with SMTP id e10-20020a05600c448a00b003dc5a13c7d1mr2515688wmo.16.1676392881054;
        Tue, 14 Feb 2023 08:41:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a3-20020a05600c224300b003db01178b62sm20785505wmm.40.2023.02.14.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 08:41:20 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 14 Feb 2023 17:41:18 +0100
Subject: [PATCH v4] power: reset: add Odroid Go Ultra poweroff driver
MIME-Version: 1.0
Message-Id: <20230126-b4-odroid-go-ultra-poweroff-v4-1-979efb6eb3fb@linaro.org>
X-B4-Tracking: v=1; b=H4sIAK2562MC/5XOzQ6CMBAE4FcxPbsGWkD05HsYD9s/aEK6ZIuoM
 by7hZs3Pc4cvpm3SI6DS+K8ewt2c0iBYg7VfidMj7FzEGzOQhZSFaVsQFdAlilY6Ajuw8QIIz0
 ck/dgWm8NnpRXTossaEwONGM0fTbifRhyObLz4blNXm859yFNxK/twSzX9rexWUIJ2Jq6aJvGV
 2guQ4jIdCDuxArP6g9MZazAo7fK1qbS6gtbluUDaMYkFykBAAA=
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_084123_217960_0BB0969A 
X-CRM114-Status: GOOD (  21.74  )
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

The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
to its two PMICs in order, this represents the poweroff scheme needed to complete
a clean poweroff of the system.

This implement this scheme by implementing a self registering driver to permit
using probe defer until both pmics are finally probed.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Previous submission was at [1], but I converted it to an independent
platform device with device auto registration to permit waiting for
both the PMICs drivers to probe.

[1] https://lore.kernel.org/all/20221031-b4-odroid-go-ultra-initial-v1-2-42e3dbea86d5@linaro.org/
---
Changes in v4:
- handle pmic struct device removal by devm_add_action_or_reset()
- add dependency on I2C for of_find_i2c_device_by_node() after kernel test robot reports
- Link to v3: https://lore.kernel.org/r/20230126-b4-odroid-go-ultra-poweroff-v3-1-0a7fd3d5c4b3@linaro.org

Changes in v3:
- Removed dependency with rk08
- Switched to storing struct device of pmics
- Fixed module init/exit
- Link to v2: https://lore.kernel.org/r/20230126-b4-odroid-go-ultra-poweroff-v2-1-a8c50866f4ac@linaro.org

Changes in v2:
- Switched to devm_register_sys_off_handler()
- Link to v1: https://lore.kernel.org/r/20221031-b4-odroid-go-ultra-initial-v1-2-42e3dbea86d5@linaro.org
---
 drivers/power/reset/Kconfig                    |   7 +
 drivers/power/reset/Makefile                   |   1 +
 drivers/power/reset/odroid-go-ultra-poweroff.c | 177 +++++++++++++++++++++++++
 3 files changed, 185 insertions(+)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index a8c46ba5878f..7059bd1f2ee7 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -141,6 +141,13 @@ config POWER_RESET_OCELOT_RESET
 	help
 	  This driver supports restart for Microsemi Ocelot SoC and similar.
 
+config POWER_RESET_ODROID_GO_ULTRA_POWEROFF
+	bool "Odroid Go Ultra power-off driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on I2C && OF
+	help
+	  This driver supports Power off for Odroid Go Ultra device.
+
 config POWER_RESET_OXNAS
 	bool "OXNAS SoC restart driver"
 	depends on ARCH_OXNAS
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 0a39424fc558..d763e6735ee3 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_POWER_RESET_MT6323) += mt6323-poweroff.o
 obj-$(CONFIG_POWER_RESET_OXNAS) += oxnas-restart.o
 obj-$(CONFIG_POWER_RESET_QCOM_PON) += qcom-pon.o
 obj-$(CONFIG_POWER_RESET_OCELOT_RESET) += ocelot-reset.o
+obj-$(CONFIG_POWER_RESET_ODROID_GO_ULTRA_POWEROFF) += odroid-go-ultra-poweroff.o
 obj-$(CONFIG_POWER_RESET_PIIX4_POWEROFF) += piix4-poweroff.o
 obj-$(CONFIG_POWER_RESET_LTC2952) += ltc2952-poweroff.o
 obj-$(CONFIG_POWER_RESET_QNAP) += qnap-poweroff.o
diff --git a/drivers/power/reset/odroid-go-ultra-poweroff.c b/drivers/power/reset/odroid-go-ultra-poweroff.c
new file mode 100644
index 000000000000..f46271da4e8e
--- /dev/null
+++ b/drivers/power/reset/odroid-go-ultra-poweroff.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/of_platform.h>
+#include <linux/mfd/rk808.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+#include <linux/i2c.h>
+
+/*
+ * The Odroid Go Ultra has 2 PMICs:
+ * - RK818 (manages the battery and USB-C power supply)
+ * - RK817
+ * Both PMICs feeds power to the S922X SoC, so they must be powered-off in sequence.
+ * Vendor does power-off the RK817 first, then the RK818 so here we follow this sequence.
+ */
+
+struct odroid_go_ultra_poweroff_data {
+	struct device *dev;
+	struct device *rk817;
+	struct device *rk818;
+};
+
+static int odroid_go_ultra_poweroff_prepare(struct sys_off_data *data)
+{
+	struct odroid_go_ultra_poweroff_data *poweroff_data = data->cb_data;
+	struct regmap *rk817, *rk818;
+	int ret;
+
+	/* RK817 Regmap */
+	rk817 = dev_get_regmap(poweroff_data->rk817, NULL);
+	if (!rk817) {
+		dev_err(poweroff_data->dev, "failed to get rk817 regmap\n");
+		return notifier_from_errno(-EINVAL);
+	}
+
+	/* RK818 Regmap */
+	rk818 = dev_get_regmap(poweroff_data->rk818, NULL);
+	if (!rk818) {
+		dev_err(poweroff_data->dev, "failed to get rk818 regmap\n");
+		return notifier_from_errno(-EINVAL);
+	}
+
+	dev_info(poweroff_data->dev, "Setting PMICs for power off");
+
+	/* RK817 */
+	ret = regmap_update_bits(rk817, RK817_SYS_CFG(3), DEV_OFF, DEV_OFF);
+	if (ret) {
+		dev_err(poweroff_data->dev, "failed to poweroff rk817\n");
+		return notifier_from_errno(ret);
+	}
+
+	/* RK818 */
+	ret = regmap_update_bits(rk818, RK818_DEVCTRL_REG, DEV_OFF, DEV_OFF);
+	if (ret) {
+		dev_err(poweroff_data->dev, "failed to poweroff rk818\n");
+		return notifier_from_errno(ret);
+	}
+
+	return NOTIFY_OK;
+}
+
+static void odroid_go_ultra_poweroff_put_pmic_device(void *data)
+{
+	struct device *dev = data;
+
+	put_device(dev);
+}
+
+static int odroid_go_ultra_poweroff_get_pmic_device(struct device *dev, const char *compatible,
+						    struct device **pmic)
+{
+	struct device_node *pmic_node;
+	struct i2c_client *pmic_client;
+
+	pmic_node = of_find_compatible_node(NULL, NULL, compatible);
+	if (!pmic_node)
+		return -ENODEV;
+
+	pmic_client = of_find_i2c_device_by_node(pmic_node);
+	of_node_put(pmic_node);
+	if (!pmic_client)
+		return -EPROBE_DEFER;
+
+	*pmic = &pmic_client->dev;
+
+	return devm_add_action_or_reset(dev, odroid_go_ultra_poweroff_put_pmic_device, *pmic);
+}
+
+static int odroid_go_ultra_poweroff_probe(struct platform_device *pdev)
+{
+	struct odroid_go_ultra_poweroff_data *poweroff_data;
+	int ret;
+
+	poweroff_data = devm_kzalloc(&pdev->dev, sizeof(*poweroff_data), GFP_KERNEL);
+	if (!poweroff_data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, poweroff_data);
+
+	/* RK818 PMIC Device */
+	ret = odroid_go_ultra_poweroff_get_pmic_device(&pdev->dev, "rockchip,rk818",
+						       &poweroff_data->rk818);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to get rk818 mfd data\n");
+
+	/* RK817 PMIC Device */
+	ret = odroid_go_ultra_poweroff_get_pmic_device(&pdev->dev, "rockchip,rk817",
+						       &poweroff_data->rk817);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to get rk817 mfd data\n");
+
+	/* Register as SYS_OFF_MODE_POWER_OFF_PREPARE because regmap_update_bits may sleep */
+	ret = devm_register_sys_off_handler(&pdev->dev,
+					    SYS_OFF_MODE_POWER_OFF_PREPARE,
+					    SYS_OFF_PRIO_DEFAULT,
+					    odroid_go_ultra_poweroff_prepare,
+					    poweroff_data);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to register sys-off handler\n");
+
+	dev_info(&pdev->dev, "Registered Power-Off handler\n");
+
+	return 0;
+}
+static struct platform_device *pdev;
+
+static struct platform_driver odroid_go_ultra_poweroff_driver = {
+	.driver = {
+		.name	= "odroid-go-ultra-poweroff",
+	},
+	.probe = odroid_go_ultra_poweroff_probe,
+};
+
+static int __init odroid_go_ultra_poweroff_init(void)
+{
+	int ret;
+
+	/* Only create when running on the Odroid Go Ultra device */
+	if (!of_device_is_compatible(of_root, "hardkernel,odroid-go-ultra"))
+		return -ENODEV;
+
+	ret = platform_driver_register(&odroid_go_ultra_poweroff_driver);
+	if (ret)
+		return ret;
+
+	pdev = platform_device_register_resndata(NULL, "odroid-go-ultra-poweroff", -1,
+						 NULL, 0, NULL, 0);
+
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&odroid_go_ultra_poweroff_driver);
+		return PTR_ERR(pdev);
+	}
+
+	return 0;
+}
+
+static void __exit odroid_go_ultra_poweroff_exit(void)
+{
+	/* Only delete when running on the Odroid Go Ultra device */
+	if (!of_device_is_compatible(of_root, "hardkernel,odroid-go-ultra"))
+		return;
+
+	platform_device_unregister(pdev);
+	platform_driver_unregister(&odroid_go_ultra_poweroff_driver);
+}
+
+module_init(odroid_go_ultra_poweroff_init);
+module_exit(odroid_go_ultra_poweroff_exit);
+
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_DESCRIPTION("Odroid Go Ultra poweroff driver");
+MODULE_LICENSE("GPL");

---
base-commit: 38d2b86a665b5e86371a1a30228bce259aa6c101
change-id: 20230126-b4-odroid-go-ultra-poweroff-c8fdca93f3eb

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
