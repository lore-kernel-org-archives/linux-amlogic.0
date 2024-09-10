Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A5FEDE9A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggofjbHvmh4IlNTWdy8m7B0QsHZJe2zc3+BpX5XTgDA=; b=FBjn8teRBoTF6o
	ya0gSGZJeYU/ByP5Sh7YCEcRzlm7pBF+4weJJBtTyzfuMqzToEZ7Ccki7krMsU3wPgtmwSmZO2M4a
	eck2/b+KTNPG9W+hYUJ9B0vP++RxVZLFOxPFqqSqGIkPYCgPYNL2EYGtCWewLE061vYYBCMbCeH/e
	++thoHh0lEkogsklztB+tMRXmVWe9AR4/kQ9NszcFSsYupqa38CayMtzN39X9Ev0p/lG8LEUM4jmS
	APWHxedFQpKoqd+kwB1tMJ+Y+gR50BAqA+YId8edzCCo/DwF+TC3HuRAflY5NJZOo0baalEgkuQgl
	cYGjDKOu9uOg1+nlG5DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3xW-00000006Oi9-12xn;
	Tue, 10 Sep 2024 16:43:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3nk-00000006LHy-1eZS
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so9921665e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985991; x=1726590791; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiOqSLRv0cjYat8BpAAj37wTt3CDM1EXasAdqabdPNs=;
        b=1+FjZb4qANnPTCZhTIMEHs2JdOxp3wZwTdnymDxacNY1qITfsYl6bQtotI8XmtZttC
         8zZvDN11Q8O/FcEyE/8Ko6/NJhjfCf6B708hTzdWX8VUCuEiaYiZWOq0wyUbC+ns1G8b
         sT7qejJwB7y1rc8p9wM3jwnpaoF/IrgVaZV6LE7lW7/di299musz55M2jEydrYvyxIDo
         YLIiX/UXbQ9Em4YPFQghPAP9bzAmfXRc4wyMRNaCs80AhI1J8AkkbpH85fCcS8Ksr4/d
         STlgmw2koclP+2nQTmC+pDOTFlqiywIiAP+Q9KtUfzvVzI9+gpEK1V8lC6CvjVOZOFY9
         aQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985991; x=1726590791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiOqSLRv0cjYat8BpAAj37wTt3CDM1EXasAdqabdPNs=;
        b=HXRDeTM2if4tIwIW9IXJ6ZtFO2ICY0AtmP8jIZhbP6thZXTmZ3luYj+e4bxZUiHp0J
         1kb0yp/5UPS5LDfD+K5VHi81aOGEiKRk0MRo5MoOnLZZ/GwIaXHiyVxybxtg8sFHn7Hq
         VJbPqGY9dpYKTD8si3dabBfYdBcIiPY+as5Im4aF3Cl1o0NED3qWmATnIIyQ2VrzVkaC
         iLyDrKlcwYC3n60bWF4hC0wyadDg/q+qBFXsKn8GLHRSQLOlU0rOF0PnNy9xtVo/Il7c
         j2W1Rtr6W4kbC9Ee3VSsXTYIWNufPuegY51xV5kIeLotZwfeFyN3vPH7srLAKTmuiBPg
         j6Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUEFmI+Wy4I0ERvpOxsOcxtK5aNoG14KEBIA1V7lrzpp3iluGCnOE2h8aEzcmjzzwa6R3UJcOmwiRAvLNUo@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5DJHb7r5sssUfN5luo8HoEXWktnYPR4A8GGc72jBqcvBQU8T7
	4iiZHvUsoudkyJmmui8cVz7C09weU60eTtdUKIFIkALckyRS4Cesz42XBOada1U=
X-Google-Smtp-Source: AGHT+IHOckoxe0JL/4WHoUkDjjXjPPgihli3S39FifyWODZU6iQe3Mih7nuSpc8qwfgocD/VgC6ROQ==
X-Received: by 2002:adf:ebc2:0:b0:35f:d70:6193 with SMTP id ffacd0b85a97d-378b07f6d00mr146998f8f.41.1725985990749;
        Tue, 10 Sep 2024 09:33:10 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Sep 2024 18:32:51 +0200
Subject: [PATCH v5 9/9] reset: amlogic: add auxiliary reset driver support
MIME-Version: 1.0
Message-Id: <20240910-meson-rst-aux-v5-9-60be62635d3e@baylibre.com>
References: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
In-Reply-To: <20240910-meson-rst-aux-v5-0-60be62635d3e@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9862; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=u91lamdMkF92PpI/055SiMTUxxxWT4COkRvJ+pY0Iy8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS8bsGgOqSjd2mE4O60vlFbI+/HjwbMGSlHQ
 cvQmOJV9PWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0vAAKCRDm/A8cN/La
 hYdTD/4/1Pyh39PS/VeHZaFq6kuvxZkaQClJIh4OoHc57mBcfMPcf1hvW/npV/SEGYpRO+QCC5l
 psmjjow8oukt/0Gqafw/O2y+UrV95v/vlrKW30ZVAPU0a9B/GH61kIqoIrhO1VHu565zkwcabB9
 y1evOI7g3E4E1YE+ERDmFI9Too0kpwmOzF0aBS6qAl2XGVrav7fR4opr+rm2/moGQaHjSPSbD3A
 0CkOnpY4fK7hiP/ZZxDuL7Xp3Wr+kCPqm2b06TXosU4gtKl4jLMJfixSWkznmomYZz6eOpGoqxC
 X9Dcmdu0XWMDpSvJvMRIZXgZFtq8rizcBEpE96Iz46E7uXlVmUBo69LVAi1rKvyBSZn4y1a0g6W
 Tdy22/QeED8i53mrQzT1d0Zb3qyJktlv07mCXY3QIp28FFUQFlH41F9s9AhP0wA2byIcbHzClg1
 3a7FqNHBLOmw7wY6moZJ99E9uWwRsio38Nmj8Ru4f0MIYhJ1bpFnGvOokbbLvMdpDKWorxyntBh
 JciWq29e4F8L+LFS6OgqwljAhdrC0SgmIcwR5GUrWU014c9WViGRrkfDeXUB+N1j8nOttn5TuWv
 kzd8no1SMgIDmqBYXB8rqJGrO3LLK0vqAI9ptaERtmSOrEAyWxdp8UDSd3uSOXRkNai3iSNncRx
 APxrbVtg4gqptlA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093312_665987_9DB6478B 
X-CRM114-Status: GOOD (  23.97  )
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
 drivers/reset/amlogic/Kconfig              |   8 ++
 drivers/reset/amlogic/Makefile             |   1 +
 drivers/reset/amlogic/reset-meson-aux.c    | 136 +++++++++++++++++++++++++++++
 drivers/reset/amlogic/reset-meson-common.c |  25 +++++-
 drivers/reset/amlogic/reset-meson.c        |   3 +
 drivers/reset/amlogic/reset-meson.h        |   4 +
 include/soc/amlogic/reset-meson-aux.h      |  23 +++++
 7 files changed, 198 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
index 1d77987088f4..3bee9fd60269 100644
--- a/drivers/reset/amlogic/Kconfig
+++ b/drivers/reset/amlogic/Kconfig
@@ -11,6 +11,14 @@ config RESET_MESON
 	help
 	  This enables the reset driver for Amlogic SoCs.
 
+config RESET_MESON_AUX
+	tristate "Meson Reset Auxiliary Driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	select AUXILIARY_BUS
+	select RESET_MESON_COMMON
+	help
+	  This enables the reset auxiliary driver for Amlogic SoCs.
+
 config RESET_MESON_AUDIO_ARB
 	tristate "Meson Audio Memory Arbiter Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
index 74aaa2fb5e13..ca99a691282c 100644
--- a/drivers/reset/amlogic/Makefile
+++ b/drivers/reset/amlogic/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
+obj-$(CONFIG_RESET_MESON_AUX) += reset-meson-aux.o
 obj-$(CONFIG_RESET_MESON_COMMON) += reset-meson-common.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
diff --git a/drivers/reset/amlogic/reset-meson-aux.c b/drivers/reset/amlogic/reset-meson-aux.c
new file mode 100644
index 000000000000..dd8453001db9
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
+#include <soc/amlogic/reset-meson-aux.h>
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
+	return meson_reset_controller_register(&adev->dev, raux->map, param);
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
diff --git a/drivers/reset/amlogic/reset-meson-common.c b/drivers/reset/amlogic/reset-meson-common.c
index d57544801ae9..a7b1b250a64d 100644
--- a/drivers/reset/amlogic/reset-meson-common.c
+++ b/drivers/reset/amlogic/reset-meson-common.c
@@ -87,12 +87,33 @@ static int meson_reset_deassert(struct reset_controller_dev *rcdev,
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
 
 int meson_reset_controller_register(struct device *dev, struct regmap *map,
 				    const struct meson_reset_param *param)
@@ -107,7 +128,7 @@ int meson_reset_controller_register(struct device *dev, struct regmap *map,
 	data->map = map;
 	data->rcdev.owner = dev->driver->owner;
 	data->rcdev.nr_resets = param->reset_num;
-	data->rcdev.ops = &meson_reset_ops;
+	data->rcdev.ops = data->param->reset_ops;
 	data->rcdev.of_node = dev->of_node;
 
 	return devm_reset_controller_register(dev, &data->rcdev);
diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
index feb19bf6da77..6ae4ed6b7f8b 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson.c
@@ -18,6 +18,7 @@
 #include "reset-meson.h"
 
 static const struct meson_reset_param meson8b_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 256,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x7c,
@@ -25,6 +26,7 @@ static const struct meson_reset_param meson8b_param = {
 };
 
 static const struct meson_reset_param meson_a1_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 96,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
@@ -32,6 +34,7 @@ static const struct meson_reset_param meson_a1_param = {
 };
 
 static const struct meson_reset_param meson_s4_param = {
+	.reset_ops	= &meson_reset_ops,
 	.reset_num	= 192,
 	.reset_offset	= 0x0,
 	.level_offset	= 0x40,
diff --git a/drivers/reset/amlogic/reset-meson.h b/drivers/reset/amlogic/reset-meson.h
index 4e1dbd7569c5..2051e126dc3a 100644
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
 int meson_reset_controller_register(struct device *dev, struct regmap *map,
 				    const struct meson_reset_param *param);
 
+extern const struct reset_control_ops meson_reset_ops;
+extern const struct reset_control_ops meson_reset_toggle_ops;
+
 #endif /* __MESON_RESET_H */
diff --git a/include/soc/amlogic/reset-meson-aux.h b/include/soc/amlogic/reset-meson-aux.h
new file mode 100644
index 000000000000..d8a15d48c984
--- /dev/null
+++ b/include/soc/amlogic/reset-meson-aux.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SOC_RESET_MESON_AUX_H
+#define __SOC_RESET_MESON_AUX_H
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
+#endif /* __SOC_RESET_MESON_AUX_H */

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
