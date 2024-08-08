Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E122C52D73
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2024 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BTHorBtbyTpPxnGwpS+41DKXJFo4dxoswS0zhZXc4oA=; b=llyKC+fyIZhthX
	WLdMF/rLF22KjdsSSIV3qq/hP6fHQN7zwddEQWsttE4xmMmGObiuABFDao4x+4XGrqO575qx0GeJi
	W6VdFtgKp865/G3flVGgttMDku0vnyVbJHn7gLFQfuYxKFSipBWBzg2MYebBVztbVZ/ouRZRdU8aJ
	2BqX5lxU6u5lkpyT/v+9cHs3DixVOOSlzVr2+VWGId0wSfB+Z400szREz9QWQVSnDqXAS/qXAtPcA
	GJHN1t6saqUf+Sy04j8hAU7hnAlzOlZe9Y8m9g/N//Sdb3SRatcPaivNJKInq7sRZ69XWJsIGr30+
	JhG5yfT7Q8fFQKznkfvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NS-00000007tT6-2WMv;
	Thu, 08 Aug 2024 10:28:14 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc0NN-00000007tMV-1umQ
	for linux-amlogic@lists.infradead.org;
	Thu, 08 Aug 2024 10:28:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-368663d7f80so352453f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2024 03:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723112888; x=1723717688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHAo36qJMD+4wxk3g0lOFfwjuuv+/seGus04OZIl27g=;
        b=yYEoxrA8ilhs7NKa1kvjLNqhxN9ljM3c1/Og6HtwcFzka33e6HKilRn0z0hZx/EwPT
         09ZeM2faZlM6aw0Q47M2/MbbxaHISSsDqh+0JGXs401B3gJTOUPcGk+nYuzmDn+HPfXr
         u2kSjZpfxpg12lyDi/kXGvCafLwhpEDpmHVtY1ZddmTTDISZFFoHGdKiH1FNbI46J3GF
         9X38xS68AsTwTOWkoSd4NcLZNmor92KTmS2Too4Y6YTll0u1ha1u8kaZlMK4I11PALWS
         HWqDDMQOqpufZdo6x892auSuMTtAtL5M8DhffmUAM5L34w2bC3bv6edJLlOiT5Pzpp5k
         T+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723112888; x=1723717688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHAo36qJMD+4wxk3g0lOFfwjuuv+/seGus04OZIl27g=;
        b=r/xTvPEK2JCevE5Ukq+lizOV6QYrSW52qT44CK7TGfQxQWrEuP4MZw7Pei/uatUFSl
         EsebWfiX5gBu6FdABs/aiAx26lWao10U7jS2+gLSWhd8OkddKCZxsuEr0muK1jq7AC4v
         xwhVeoCugK5nEuh2II5zx1QhPi7OFYLXK+pcMUMnjsLWwnFE1X+RRF40PWHpUsoosKzm
         877UEscjQCHofY6Oj8/edutc5raAdC9fqQWT6S1yM69a36Qx+VIljoHxC71xa6a6NgbL
         O+9aGJAuePp4RPPzQO7CWFdfMYIbflFxcQ6W/MsZIIQD2Ga9dN6O8IJ8fM/G5APBRzr9
         jOow==
X-Forwarded-Encrypted: i=1; AJvYcCUR67zyyOcgmAcbN4lbhKz9+C3lx34toEl4NatTa28Of/II2L4jYE5YzVm69JVcuCYZS3RhsuDoBLgCu8m4FA+Ahp8NOyKXwD0ZxJ7nJcIBZ8c=
X-Gm-Message-State: AOJu0YyoTXgoZcQ5c8PFtTS9bTrOd8qfecLqZweGlN12Cyzy86JplaiF
	wNDrOVbxpx8Zpd7Szfd0UCkUgMXZoVkiRTroT4Q9m1cuiwk2j8QKWydKeQ4O0fU=
X-Google-Smtp-Source: AGHT+IFmqwaJ4o87yD8ryfkxnUfmJJm0YXqGEqbQfeRoZvj1W0kleGmTnVkbk+wyr5B0NIdesRL0ew==
X-Received: by 2002:adf:e80f:0:b0:368:7943:146f with SMTP id ffacd0b85a97d-36d27565ec6mr910185f8f.26.1723112887996;
        Thu, 08 Aug 2024 03:28:07 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:ae7:4e79:8821:15db])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36d27208c98sm1454596f8f.75.2024.08.08.03.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 03:28:07 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 9/9] reset: amlogic: add auxiliary reset driver support
Date: Thu,  8 Aug 2024 12:27:39 +0200
Message-ID: <20240808102742.4095904-10-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808102742.4095904-1-jbrunet@baylibre.com>
References: <20240808102742.4095904-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_032809_566530_B8FF9D20 
X-CRM114-Status: GOOD (  24.89  )
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
 drivers/reset/amlogic/Kconfig               |   8 ++
 drivers/reset/amlogic/Makefile              |   1 +
 drivers/reset/amlogic/reset-meson-aux.c     | 136 ++++++++++++++++++++
 drivers/reset/amlogic/reset-meson-core.c    |  25 +++-
 drivers/reset/amlogic/reset-meson-pltf.c    |   3 +
 drivers/reset/amlogic/reset-meson.h         |   4 +
 include/soc/amlogic/meson-auxiliary-reset.h |  23 ++++
 7 files changed, 198 insertions(+), 2 deletions(-)
 create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
 create mode 100644 include/soc/amlogic/meson-auxiliary-reset.h

diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
index 04c7be0f3165..ee1c7620a2b1 100644
--- a/drivers/reset/amlogic/Kconfig
+++ b/drivers/reset/amlogic/Kconfig
@@ -11,6 +11,14 @@ config RESET_MESON
 	help
 	  This enables the reset platform driver for Amlogic SoCs.
 
+config RESET_MESON_AUX
+	tristate "Meson Reset Platform Driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	select AUXILIARY_BUS
+	select RESET_MESON_CORE
+	help
+	  This enables the reset auxiliary driver for Amlogic SoCs.
+
 config RESET_MESON_AUDIO_ARB
 	tristate "Meson Audio Memory Arbiter Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
index 0f8f9121b566..5d53a4b11ed9 100644
--- a/drivers/reset/amlogic/Makefile
+++ b/drivers/reset/amlogic/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_RESET_MESON) += reset-meson-pltf.o
+obj-$(CONFIG_RESET_MESON_AUX) += reset-meson-aux.o
 obj-$(CONFIG_RESET_MESON_CORE) += reset-meson-core.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
diff --git a/drivers/reset/amlogic/reset-meson-aux.c b/drivers/reset/amlogic/reset-meson-aux.c
new file mode 100644
index 000000000000..caf26eb67c14
--- /dev/null
+++ b/drivers/reset/amlogic/reset-meson-aux.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Amlogic Meson Reset Auxiliary driver
+ *
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+
+#include "reset-meson.h"
+#include <soc/amlogic/meson-auxiliary-reset.h>
+
+static DEFINE_IDA(meson_rst_aux_ida);
+
+struct meson_reset_adev {
+	struct auxiliary_device adev;
+	struct regmap *map;
+};
+
+#define to_meson_reset_adev(_adev) \
+	container_of((_adev), struct meson_reset_adev, adev)
+
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
+	}, {}
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
+}
+EXPORT_SYMBOL_GPL(devm_meson_rst_aux_register);
+
+MODULE_DESCRIPTION("Amlogic Meson Reset Auxiliary driver");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(MESON_RESET);
diff --git a/drivers/reset/amlogic/reset-meson-core.c b/drivers/reset/amlogic/reset-meson-core.c
index ea4fc562f7e6..774902527d17 100644
--- a/drivers/reset/amlogic/reset-meson-core.c
+++ b/drivers/reset/amlogic/reset-meson-core.c
@@ -85,12 +85,33 @@ static int meson_reset_deassert(struct reset_controller_dev *rcdev,
 	return meson_reset_level(rcdev, id, false);
 }
 
-static const struct reset_control_ops meson_reset_ops = {
+static int meson_reset_level_toggle(struct reset_controller_dev *rcdev,
+				    unsigned long id)
+{
+	int ret;
+
+	ret = meson_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return meson_reset_deassert(rcdev, id);
+}
+
+const struct reset_control_ops meson_reset_ops = {
 	.reset		= meson_reset_reset,
 	.assert		= meson_reset_assert,
 	.deassert	= meson_reset_deassert,
 	.status		= meson_reset_status,
 };
+EXPORT_SYMBOL_NS_GPL(meson_reset_ops, MESON_RESET);
+
+const struct reset_control_ops meson_reset_toggle_ops = {
+	.reset		= meson_reset_level_toggle,
+	.assert		= meson_reset_assert,
+	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
+};
+EXPORT_SYMBOL_NS_GPL(meson_reset_toggle_ops, MESON_RESET);
 
 int meson_reset_probe(struct device *dev, struct regmap *map,
 		      const struct meson_reset_param *param)
@@ -105,7 +126,7 @@ int meson_reset_probe(struct device *dev, struct regmap *map,
 	data->map = map;
 	data->rcdev.owner = dev->driver->owner;
 	data->rcdev.nr_resets = param->reset_num;
-	data->rcdev.ops = &meson_reset_ops;
+	data->rcdev.ops = data->param->reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
 	return devm_reset_controller_register(dev, &data->rcdev);
diff --git a/drivers/reset/amlogic/reset-meson-pltf.c b/drivers/reset/amlogic/reset-meson-pltf.c
index 97e933b4aa34..2bc3ea42c6ec 100644
--- a/drivers/reset/amlogic/reset-meson-pltf.c
+++ b/drivers/reset/amlogic/reset-meson-pltf.c
@@ -16,6 +16,7 @@
 #include "reset-meson.h"
 
 static const struct meson_reset_param meson8b_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
@@ -23,6 +24,7 @@ static const struct meson_reset_param meson8b_param = {
 };
 
 static const struct meson_reset_param meson_a1_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
@@ -30,6 +32,7 @@ static const struct meson_reset_param meson_a1_param = {
 };
 
 static const struct meson_reset_param meson_s4_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
diff --git a/drivers/reset/amlogic/reset-meson.h b/drivers/reset/amlogic/reset-meson.h
index c2e8a5cf2e46..5ab2ac9ab2e5 100644
--- a/drivers/reset/amlogic/reset-meson.h
+++ b/drivers/reset/amlogic/reset-meson.h
@@ -12,6 +12,7 @@
 #include <linux/reset-controller.h>
 
 struct meson_reset_param {
+	const struct reset_control_ops *reset_ops;
 	unsigned int reset_num;
 	unsigned int reset_offset;
 	unsigned int level_offset;
@@ -21,4 +22,7 @@ struct meson_reset_param {
 int meson_reset_probe(struct device *dev, struct regmap *map,
 		      const struct meson_reset_param *param);
 
+extern const struct reset_control_ops meson_reset_ops;
+extern const struct reset_control_ops meson_reset_toggle_ops;
+
 #endif /* __MESON_RESET_CORE_H */
diff --git a/include/soc/amlogic/meson-auxiliary-reset.h b/include/soc/amlogic/meson-auxiliary-reset.h
new file mode 100644
index 000000000000..f70dd864ef6a
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
+#if IS_ENABLED(CONFIG_RESET_MESON_AUX)
+int devm_meson_rst_aux_register(struct device *dev,
+				struct regmap *map,
+				const char *adev_name);
+#else
+static inline int devm_meson_rst_aux_register(struct device *dev,
+					      struct regmap *map,
+					      const char *adev_name)
+{
+	return 0;
+}
+#endif
+
+#endif /* __SOC_AMLOGIC_MESON_AUX_RESET_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
