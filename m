Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70366C54E94
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 17:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JU2UkzQJ+jJSOxubVU0hMplaF6BNcv6ors+VYyP2ME4=; b=4KmErHuSM5rDOP
	qem+blm7j1FkH87rrFmjcs+CqsxylRuQt/Wqb2LAkoyxpv0lyBtWsO2bH/TgNmc9sayDeHvwprfur
	c/rL/VoSkHK73L9KwOUojcRBzvi0F6UdbPlvb711RONwjN+aq2Zf5nMFXtBL77KQvFSCVYOKZ+RRG
	z34lEq2wd4PI+IG6CRiAJQN4uObj0pq0Zeeluxs0+mgMZhs4Gva+SI5WYwLGpzMiOEB/1urG53Gxc
	MP4sgvmPkie0Yl0Lh2WpmSGXBDTN6CAcimvByVFC+jyGijWD9eHQ0Xp5qoGLpQ+yOcLq8rWDpVLNp
	4aWEalGYwiK4YcbSD3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL5mf-00Byws-RK; Thu, 26 Jan 2023 17:11:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL5mc-00BywV-Jl
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 17:11:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q5so2505403wrv.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 09:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2pHKQJWH1KmYh2TGTU2wH9BfmH0u+CHZy41N/emBPgk=;
        b=w24l95Uz6BBmWmGf88j0Gi82dTVQBE+FS0LpyNo+Vt5fHlmZEKu3/cQuOx7+V2CnAV
         A6fNrol+i/YH+LKUsZU+E7qCRqio2lATUDapOCd/fk9/zFiXiXcAHApKgWy6ydP+ibNM
         TDKYTFd9WXvvgvYrqRNGAf9d3W7pVl8pBhwIiBtRcm9eFjkmNq620XBOVM0C29u+zHwc
         D0WEC/5JQ5d24OYtq4VTgEBKFiv1YBF4WeEd3mXxi6+qQHJkX0lAHYn2KGUaBuhdjUGS
         U8Pm9GM+wGxohk4CyWHKmanCLhtw+B6z/vXqNkwJzSsQpzLbQJKa/f3rOCfHYO0otHB3
         lzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pHKQJWH1KmYh2TGTU2wH9BfmH0u+CHZy41N/emBPgk=;
        b=b5O6LKfG4pDZv136sFUfnkxutPuaoYh9yiItWX4zMT+pvQq75w9Mg+8C5xWibaMbbW
         rPDF0IGhA4CN506HPScaRucMksC/Y7wA5xC2UFX/OAv3KLK4S66oF5JEeDKHkLi19rRr
         YsnWCq0nU5GPrhOuSvS86mtHxUfukJQnVxelWMK7AQUETyO5SQnIG3wyaQjptBYO6fdq
         aRj/4Hs7tA85NlThiL1ax/j2iZKPkPqXIsRdYhosjBkUTafPRql6Zbk4OaM6FSzQY6M8
         k2UQik8fYmd8eXKL/Dw3ZHCnL72kUTsUyFFIfe0OVSlczytFQliGeBIRKbo4eeBa322V
         uLkg==
X-Gm-Message-State: AFqh2kqrwM0c1nRDBKs21iYcrjHi7jFALPfL1fLQyxAo6pmKImPzVAjo
	FseuJvJDy3WyGXn+SRGnXpnViw==
X-Google-Smtp-Source: AMrXdXurdgjmMvj6kxwr5UCaP/4FD4WnkTDZtww2X0SCWt/zdnMlwB/liKai/m1BDKy/JKcJdXnTHg==
X-Received: by 2002:adf:df02:0:b0:2bd:db66:54eb with SMTP id y2-20020adfdf02000000b002bddb6654ebmr40272833wrl.20.1674753086710;
        Thu, 26 Jan 2023 09:11:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id f12-20020adfdb4c000000b002bfb1de74absm1903884wrj.114.2023.01.26.09.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:11:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 26 Jan 2023 18:11:21 +0100
Subject: [PATCH v2] power: reset: add Odroid Go Ultra poweroff driver
MIME-Version: 1.0
Message-Id: <20230126-b4-odroid-go-ultra-poweroff-v2-1-a8c50866f4ac@linaro.org>
X-B4-Tracking: v=1; b=H4sIADi00mMC/x2NQQrCMBAAv1L27EJNRNSviIdNsmkXQrZsbBVK/
 27wOHOY2aGxCTd4DDsYb9JEawd3GiDOVCdGSZ3Bjc6PZ3fFcEFNppJwUlzL2wgX/bBpzhhvOUW
 6++w5QC8EaozBqMa5N+paSpeLcZbvf/l8HccPSlXVYYIAAAA=
To: Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_091130_759543_B313107B 
X-CRM114-Status: GOOD (  20.17  )
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
Changes in v2:
- Switched to devm_register_sys_off_handler()
- Link to v1: https://lore.kernel.org/r/20221031-b4-odroid-go-ultra-initial-v1-2-42e3dbea86d5@linaro.org
---
 drivers/power/reset/Kconfig                    |   7 ++
 drivers/power/reset/Makefile                   |   1 +
 drivers/power/reset/odroid-go-ultra-poweroff.c | 151 +++++++++++++++++++++++++
 3 files changed, 159 insertions(+)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index a8c46ba5878f..26860c2e05a9 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -141,6 +141,13 @@ config POWER_RESET_OCELOT_RESET
 	help
 	  This driver supports restart for Microsemi Ocelot SoC and similar.
 
+config POWER_RESET_ODROID_GO_ULTRA_POWEROFF
+	bool "Odroid Go Ultra power-off driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on MFD_RK808
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
index 000000000000..51f54e65c927
--- /dev/null
+++ b/drivers/power/reset/odroid-go-ultra-poweroff.c
@@ -0,0 +1,151 @@
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
+	struct rk808 *rk817;
+	struct rk808 *rk818;
+};
+
+static int odroid_go_ultra_poweroff_prepare(struct sys_off_data *data)
+{
+	struct odroid_go_ultra_poweroff_data *poweroff_data = data->cb_data;
+	int ret;
+
+	dev_info(poweroff_data->dev, "Setting PMICs for power off");
+
+	/* RK817 */
+	ret = regmap_update_bits(poweroff_data->rk817->regmap, RK817_SYS_CFG(3), DEV_OFF, DEV_OFF);
+	if (ret) {
+		dev_err(poweroff_data->dev, "failed to poweroff rk817\n");
+		return notifier_from_errno(ret);
+	}
+
+	/* RK818 */
+	ret = regmap_update_bits(poweroff_data->rk818->regmap, RK818_DEVCTRL_REG, DEV_OFF, DEV_OFF);
+	if (ret) {
+		dev_err(poweroff_data->dev, "failed to poweroff rk818\n");
+		return notifier_from_errno(ret);
+	}
+
+	return NOTIFY_OK;
+}
+
+static int odroid_go_ultra_poweroff_get_pmic_drvdata(const char *compatible, struct rk808 **pmic)
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
+	*pmic = i2c_get_clientdata(pmic_client);
+
+	put_device(&pmic_client->dev);
+
+	if (!*pmic)
+		return -EPROBE_DEFER;
+
+	return 0;
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
+	/* RK818 */
+	ret = odroid_go_ultra_poweroff_get_pmic_drvdata("rockchip,rk818",
+							&poweroff_data->rk818);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to get rk818 mfd data\n");
+
+	/* RK817 */
+	ret = odroid_go_ultra_poweroff_get_pmic_drvdata("rockchip,rk817",
+							&poweroff_data->rk817);
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
+
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
+	return PTR_ERR_OR_ZERO(pdev);
+}
+
+static void __exit odroid_go_ultra_poweroff_exit(void)
+{
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
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230126-b4-odroid-go-ultra-poweroff-c8fdca93f3eb

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
