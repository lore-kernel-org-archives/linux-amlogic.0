Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1531ECAAA1
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITQFdbnniICWZDz4sy5+YoHddz8ZDYKysOSLJmlu38U=; b=JCoB/oUH5BrO71
	RWNm07Y0GAW/YekrWK5twJuIrH1/GLSGrBPWX0EPmsuFPUoA2bwRL65SMrIvHQf3AUm8+VV2B6/bV
	VLQwLADnYEpp3Lb7gLI1WRXC4qFpyCr6LwfCwlgUnmTqKaE/37x8EauG+pMUHSoKlWwdepVMMUbmH
	Llppa0sTGU1kqGJ9qHax+ZE1EMt7J4ANlRw0FZQ3Q06SWxLeKm9lXlYLKFJN/jpYNhLwSvpJ1SJng
	hNRaAkTwdCXTx9gf7kbF0RkX3m1RgHg9x+fVMQEAV6xR7AVmJgTIXKNtFw+BS73I9BWYRq8FDYNfb
	WgkkjWPI1axMQjyGiThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXx2-00D5as-TH; Mon, 31 Oct 2022 16:47:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXwh-00D5TL-Ns
	for linux-amlogic@lists.infradead.org; Mon, 31 Oct 2022 16:47:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bs21so16822678wrb.4
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Oct 2022 09:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xErnWFgaDg+HEqwln9TpU02EEACDpfMaLjEESgcrepc=;
        b=DnnOoSoK2AhVhQBp/Ch2lYXVTR7ui4LvICzoHKNz4sAnqC0sYU/1QnVYTwh8lVheLa
         SOMreBchmy6gq5boDFswK5fLTpE3BIPhA4HE3oAYAe2EyroMSR0EQ9D023dGU+HlEPOn
         ascKLRTN+V0/2aMCpOO14noYbzT6jMaA2zsUs8oxtlUpZECLih0Nr8SixehhZYYcK9rK
         yaE3IeSeL43BFP7rY5YbrfwiCqpq3J7M6v51DUtrp1IloZgld2lAdAe5pa8xwwast+c5
         kBdTiyrvrAIlWOFwh+OrxbO0+vsGjC3cgWMD7HES4Qf2cvE+FkG8HmGTtvtdfRWMgIOZ
         uFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xErnWFgaDg+HEqwln9TpU02EEACDpfMaLjEESgcrepc=;
        b=fcUS8SzDF241J9AM5bcsY3i/H5PbDruqWfF0ueBd2XI7rgiMhUM1wdzYFdzQsAxB2i
         k/Xi+7qE9k/FybHL0FrK6x5AYGTca2X9aZZYjg4JK5h1Xko7W8lhMKKVR3G40v4Xe+lq
         fXHH/QVyQBF64yDcuzx/XqK5+jx0MNZiiodp8xjoCmAoqPjhem+vsSNezLVoKT3/rCO0
         NOL05Z6ZAQ58PPHHHOWFVOnQpe3C6sYT06yAgKE9USaK9YeW+Afi4H6rtugFOXknFfhf
         YEKvFtB8XoJMwhla1s187D1qMpA2qHz0CTzMe7s/YnOaPGUHGkyqsZw8HTJJzR5y6Il8
         sNTA==
X-Gm-Message-State: ACrzQf3lHYKlLLUSMhhx3CfMVtyyt5zfGeNzIyXGcZq8zXcsekz3IOTE
	TD/vwjt5NZYlkB/cow/JzBv3NQ==
X-Google-Smtp-Source: AMsMyM5duokxV3j72AD+s51mhGdvgvu5dn5e7ybRmwDvcGdv24bieBhGb5F6sULHYJrafLR9/yIy0g==
X-Received: by 2002:a5d:6e8e:0:b0:220:5fa1:d508 with SMTP id k14-20020a5d6e8e000000b002205fa1d508mr9151987wrz.337.1667234849903;
        Mon, 31 Oct 2022 09:47:29 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b003b4868eb71bsm7488871wmo.25.2022.10.31.09.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:47:29 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Oct 2022 17:47:26 +0100
Subject: [PATCH 2/4] power: reset: add Odroid Go Ultra poweroff driver
MIME-Version: 1.0
Message-Id: <20221031-b4-odroid-go-ultra-initial-v1-2-42e3dbea86d5@linaro.org>
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Sebastian Reichel <sre@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_094731_814573_69A224CC 
X-CRM114-Status: GOOD (  17.03  )
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

This implement this scheme, and overrides the PSCI pm_power_off.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/power/reset/Kconfig                    |   7 ++
 drivers/power/reset/Makefile                   |   1 +
 drivers/power/reset/odroid-go-ultra-poweroff.c | 122 +++++++++++++++++++++++++
 3 files changed, 130 insertions(+)

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
index 000000000000..89ae21790f65
--- /dev/null
+++ b/drivers/power/reset/odroid-go-ultra-poweroff.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2022 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/of_platform.h>
+#include <linux/mfd/rk808.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/i2c.h>
+
+static struct rk808 *rk817;
+static struct rk808 *rk818;
+
+static void odroid_go_ultra_do_poweroff(void)
+{
+	int ret;
+
+	BUG_ON(!rk817);
+	BUG_ON(!rk818);
+
+	/* RK817 */
+	ret = regmap_update_bits(rk817->regmap, RK817_SYS_CFG(3), DEV_OFF, DEV_OFF);
+	if (ret)
+		pr_err("%s: failed to poweroff rk817\n", __func__);
+
+	/* RK818 */
+	ret = regmap_update_bits(rk818->regmap, RK818_DEVCTRL_REG, DEV_OFF, DEV_OFF);
+	if (ret)
+		pr_err("%s: failed to poweroff rk817\n", __func__);
+
+	WARN_ON(1);
+}
+
+static int odroid_go_ultra_poweroff_get_pmic_drvdata(struct platform_device *pdev,
+						     const char *property,
+						     struct rk808 **pmic)
+{
+	struct device_node *pmic_node;
+	struct i2c_client *pmic_client;
+
+	pmic_node = of_parse_phandle(pdev->dev.of_node, property, 0);
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
+	int ret;
+
+	/* RK818 */
+	ret = odroid_go_ultra_poweroff_get_pmic_drvdata(pdev, "hardkernel,rk818-pmic", &rk818);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get rk818 mfd data (%d)\n", ret);
+		return ret;
+	}
+
+	/* RK817 */
+	ret = odroid_go_ultra_poweroff_get_pmic_drvdata(pdev, "hardkernel,rk817-pmic", &rk817);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get rk817 mfd data (%d)\n", ret);
+		return ret;
+	}
+
+	/* If a pm_power_off function has already been added, warn we're overriding */
+	if (pm_power_off != NULL)
+		dev_warn(&pdev->dev,
+			"%s: pm_power_off function already registered, overriding\n",
+		       __func__);
+
+	pm_power_off = odroid_go_ultra_do_poweroff;
+
+	return 0;
+}
+
+static int odroid_go_ultra_poweroff_remove(struct platform_device *pdev)
+{
+	if (pm_power_off == &odroid_go_ultra_do_poweroff)
+		pm_power_off = NULL;
+
+	rk817 = NULL;
+	rk818 = NULL;
+
+	return 0;
+}
+
+static const struct of_device_id of_odroid_go_ultra_poweroff_match[] = {
+	{ .compatible = "hardkernel,odroid-go-ultra-poweroff", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_odroid_go_ultra_poweroff_match);
+
+static struct platform_driver odroid_go_ultra_poweroff_driver = {
+	.probe = odroid_go_ultra_poweroff_probe,
+	.remove = odroid_go_ultra_poweroff_remove,
+	.driver = {
+		.name = "odroid-go-ultra-poweroff",
+		.of_match_table = of_odroid_go_ultra_poweroff_match,
+	},
+};
+
+module_platform_driver(odroid_go_ultra_poweroff_driver);
+
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_DESCRIPTION("Odroid Go Ultra poweroff driver");
+MODULE_LICENSE("GPL");

-- 
b4 0.10.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
