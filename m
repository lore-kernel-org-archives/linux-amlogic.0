Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C65FC41513
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 16:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PFw26ihMqGCs4mHNoAP+KillZ9Dd5vI/kujPBAccK0=; b=TB2sXKe8fDOpis
	q6e37OitRLHlAR8qSnZ096RWrGK+UR+0rjIdwS68IEdqkmGFE58Z2LNdrGAvVoPuAeSD13LMc3sCd
	5QbjYRttJFQl+UkLDrE+CURdxSkqZ90eTiRsuIZbr6VuhILkcQ5xWjzymqO2Fe8PkYfZejpmFbtB+
	rJv5UDQ9OqGF5h3vvD0rhK0CGdPn00dwnvIdxHQXQkl2oW3z/MZW5reihfwXZY0dN387Mi22J6Uq3
	GceP8TwpObiRw1B2WqXhEfn2BNj6mafXJRmBTDtNuesXvq5gSlI7CErRK5q7Yc/kUE39w3xlTsn3M
	GaM9dvWBji+GBXlZCLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8c-0000000B8mB-1qGB;
	Wed, 10 Jul 2024 16:25:50 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8X-0000000B8gk-17qD
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 16:25:47 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-52e9c55febcso8544934e87.2
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720628743; x=1721233543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IARsI+FI+i+eKGJY1BDsgLjfmpMAYd8+oKcq4aFTD8I=;
        b=BJeLk/cly1mRu2mnVLHJQTUZ7SB9ecJKogp2CJ1ZhoHMKiXkntLV6mTB9Au/a0s8gX
         b0XgohOofsyv1rWHTn9SrUv/JVUki9Cl5W4CoFxXLuZWj9U7N5E7GeaQkr2jonta0N27
         RcpZdX+xcmb5i5WpKNXfclyH72CxuPgbCfPfn7H7DO0v/iASwph1zb25Bo5zSDzpwEhu
         T6Ev1bbrw3g3SkjlGlaqc3pdS/1AtHSEZ3M/Yg4pmA71HWUNeOlgmoIYFrOQlaGWYoy4
         9rBjb0w2EGhWelHTB3QoSV4vvF6v+7z8O55QqK93N5ybHOWzw27m6pE2XocY7MPNYZT7
         FHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720628743; x=1721233543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IARsI+FI+i+eKGJY1BDsgLjfmpMAYd8+oKcq4aFTD8I=;
        b=XrYKrX+Zrq9S5w5bXCDWONe8wDo0tGkq1WUkLb5fdNpydnK8BM0uLI1uRs19pbTZLM
         GV08UjkHcmfelVWvQNaKPhHTe/IvNz8UOKTyL3y78P27bwFd7LbhFhwxSARyyxqt4uag
         Phhm0bWUD1gONSotW1pH62/QbeSP2Li9zq//Fv1aGxbdWawZmciP20OTux4aMhSjD1eH
         EtTN5mka9ahjGZ0ETX8CjVXYAPOUWhB8ocpSPgpErHotaryxQZOyXFfx4TjsxmsA4/BH
         ak5f1fj6PRlD3w8cTEuYOjG/VkHr47WgCdoMlZgowtL69MPMV/eAAPfgvBQgj2WEXEYq
         MYTA==
X-Forwarded-Encrypted: i=1; AJvYcCX93oguA/kOhIoKp0mSaYgPHmQndDrVc/ffxyM7zuELHd1PapSc50VPrz6eOx2W/Bguwz7t2VChRnDqKsd3P4mU1nH1M1uuYdl037qnem+XZd4=
X-Gm-Message-State: AOJu0YylBPQrIuCOpLnPlLMD6aJjwZqWfpcDaxslqCxC+rlmo3Lx8DGJ
	HHxWfDR88eYLM91MI18CtUqPHJrkFhS4Lvu6/Npcq+a5zATXK/qczHzJ8gUiptI=
X-Google-Smtp-Source: AGHT+IEcUV9rflAISGdUtE/xqZPmuLeXR5bEfX8EcOnERF2wu0mjIsOgHuUUJqEcj4imHelJS6s1hg==
X-Received: by 2002:a05:6512:39c5:b0:52c:a465:c61f with SMTP id 2adb3069b0e04-52eb99d6e56mr3725342e87.56.1720628743099;
        Wed, 10 Jul 2024 09:25:43 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1c99:6356:8466:36cf])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4266f6e09e5sm88693815e9.5.2024.07.10.09.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 09:25:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 7/8] reset: amlogic: add auxiliary reset driver support
Date: Wed, 10 Jul 2024 18:25:16 +0200
Message-ID: <20240710162526.2341399-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240710162526.2341399-1-jbrunet@baylibre.com>
References: <20240710162526.2341399-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092545_510143_912DA357 
X-CRM114-Status: GOOD (  21.81  )
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

Add support for the reset controller present in the audio clock
controller of the g12 and sm1 SoC families, using the auxiliary bus.

This is expected to replace the driver currently present directly
within the related clock driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/Kconfig                       |   1 +
 drivers/reset/reset-meson.c                 | 121 +++++++++++++++++++-
 include/soc/amlogic/meson-auxiliary-reset.h |  23 ++++
 3 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7112f5932609..2a316c469bcc 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -134,6 +134,7 @@ config RESET_MCHP_SPARX5
 config RESET_MESON
 	tristate "Meson Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
+	select AUXILIARY_BUS
 	default ARCH_MESON
 	help
 	  This enables the reset driver for Amlogic Meson SoCs.
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index e34a10b15593..5cc767d50e8f 100644
--- a/drivers/reset/reset-meson.c
+++ b/drivers/reset/reset-meson.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2016 BayLibre, SAS.
  * Author: Neil Armstrong <narmstrong@baylibre.com>
  */
+#include <linux/auxiliary_bus.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -16,6 +17,10 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <soc/amlogic/meson-auxiliary-reset.h>
+
+static DEFINE_IDA(meson_rst_aux_ida);
+
 struct meson_reset_param {
 	const struct reset_control_ops *reset_ops;
 	unsigned int reset_num;
@@ -30,6 +35,14 @@ struct meson_reset {
 	struct regmap *map;
 };
 
+struct meson_reset_adev {
+	struct auxiliary_device adev;
+	struct regmap *map;
+};
+
+#define to_meson_reset_adev(_adev) \
+	container_of((_adev), struct meson_reset_adev, adev)
+
 static void meson_reset_offset_and_bit(struct meson_reset *data,
 				       unsigned long id,
 				       unsigned int *offset,
@@ -218,6 +231,112 @@ static struct platform_driver meson_reset_pltf_driver = {
 };
 module_platform_driver(meson_reset_pltf_driver);
 
-MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
+static const struct meson_reset_param meson_g12a_audio_param = {
+	.reset_ops	= &meson_reset_toggle_ops,
+	.reset_num	= 26,
+	.level_offset	= 0x24,
+};
+
+static const struct meson_reset_param meson_sm1_audio_param = {
+	.reset_ops	= &meson_reset_toggle_ops,
+	.reset_num	= 39,
+	.level_offset	= 0x28,
+};
+
+static const struct auxiliary_device_id meson_reset_aux_ids[] = {
+	{
+		.name = "axg-audio-clkc.rst-g12a",
+		.driver_data = (kernel_ulong_t)&meson_g12a_audio_param,
+	}, {
+		.name = "axg-audio-clkc.rst-sm1",
+		.driver_data = (kernel_ulong_t)&meson_sm1_audio_param,
+	},
+};
+MODULE_DEVICE_TABLE(auxiliary, meson_reset_aux_ids);
+
+static int meson_reset_aux_probe(struct auxiliary_device *adev,
+				 const struct auxiliary_device_id *id)
+{
+	const struct meson_reset_param *param =
+		(const struct meson_reset_param *)(id->driver_data);
+	struct meson_reset_adev *raux =
+		to_meson_reset_adev(adev);
+
+	return meson_reset_probe(&adev->dev, raux->map, param);
+}
+
+static struct auxiliary_driver meson_reset_aux_driver = {
+	.probe		= meson_reset_aux_probe,
+	.id_table	= meson_reset_aux_ids,
+};
+module_auxiliary_driver(meson_reset_aux_driver);
+
+static void meson_rst_aux_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct meson_reset_adev *raux =
+		to_meson_reset_adev(adev);
+
+	ida_free(&meson_rst_aux_ida, adev->id);
+	kfree(raux);
+}
+
+static void meson_rst_aux_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+int devm_meson_rst_aux_register(struct device *dev,
+				struct regmap *map,
+				const char *adev_name)
+{
+	struct meson_reset_adev *raux;
+	struct auxiliary_device *adev;
+	int ret;
+
+	raux = kzalloc(sizeof(*raux), GFP_KERNEL);
+	if (!raux)
+		return -ENOMEM;
+
+	ret = ida_alloc(&meson_rst_aux_ida, GFP_KERNEL);
+	if (ret < 0)
+		goto raux_free;
+
+	raux->map = map;
+
+	adev = &raux->adev;
+	adev->id = ret;
+	adev->name = adev_name;
+	adev->dev.parent = dev;
+	adev->dev.release = meson_rst_aux_release;
+	device_set_of_node_from_dev(&adev->dev, dev);
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto ida_free;
+
+	ret = __auxiliary_device_add(adev, dev->driver->name);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, meson_rst_aux_unregister_adev,
+					adev);
+
+ida_free:
+	ida_free(&meson_rst_aux_ida, adev->id);
+raux_free:
+	kfree(raux);
+	return ret;
+
+}
+EXPORT_SYMBOL_GPL(devm_meson_rst_aux_register);
+
+MODULE_DESCRIPTION("Amlogic Meson Reset driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/include/soc/amlogic/meson-auxiliary-reset.h b/include/soc/amlogic/meson-auxiliary-reset.h
new file mode 100644
index 000000000000..8fdb02b18d8c
--- /dev/null
+++ b/include/soc/amlogic/meson-auxiliary-reset.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SOC_AMLOGIC_MESON_AUX_RESET_H
+#define __SOC_AMLOGIC_MESON_AUX_RESET_H
+
+#include <linux/err.h>
+
+struct device;
+struct regmap;
+
+#ifdef CONFIG_RESET_MESON
+int devm_meson_rst_aux_register(struct device *dev,
+				struct regmap *map,
+				const char *adev_name);
+#else
+static inline int devm_meson_rst_aux_register(struct device *dev,
+					      struct regmap *map,
+					      const char *adev_name)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* __SOC_AMLOGIC_MESON8B_AUX_RESET_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
