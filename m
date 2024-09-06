Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEE5CE7B10
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HwP1IssJJt3h4UTCqFcWAQgAo2Hns15v+Vkl00QLVjg=; b=Qv4T8II/sbSzej
	9Asi1chdP/HliVJJlpE8hrxnQBs5iIp+4Y4WGim2iED+P7qKPKptEf2+d9f72ZCAqldHUgTccm9NM
	gDK7IcjoP+jrQuZxXp3L3zfV3v1SL76uF8GAvGtccpRzqdRZCQhWkqT9Sc+Utd7racSgLraB9/Ugk
	zJC8A6BrXOix6GBrXuznvGoY1FoVc8ePwHpNc6uqu1clw4J3/o8MZRhsdTcSwd0OiUM6C883ndOjT
	5xXbwmCJY59EZNYbfWe/2h5Mj6mQdwa7UzKvZju2NW1wEDShu/fuRhGThOw47uaAcNQQbWmPcHx4M
	e/qyY/nlMy1KlaSmFSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZFw-0000000COEv-0q1q;
	Fri, 06 Sep 2024 13:44:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7Z-0000000CMEp-13cx
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:31 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42c5347b2f7so16681925e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629727; x=1726234527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fQ+cdLJYbOn3NF5s//ezlsttCjL0fvaEZaJE8odEpo=;
        b=fkCraSdCMXsAExgvsW0r3ROgA5P584NnWh43bdO6SCGDOQhUsaFpo4tEE693Roupc8
         UNZ5loJf4IHtaQVnysPd2Orx9CY6LgWRIQoavOsC7Zt2wTnmMlHNxcOErAv517z8YjJj
         wF66ckC3oTkUINqYeOutYkdFr3nqKWaZyXSFyj5nWjRlAIwxFbyuwU57mySp3Q4D4+Ho
         Qb//Z2KFa4/Q64oPVHGnqW66XdepOn92N8DqxrIrErsvcxKe/HTd1V+haz1yQ8lDGJ5e
         vW0/VdNbPqSKXOecYCLX4d/QngJRyxfi/Z03Ry0ZvJ2BQkNwDwX0+FO5Wws9D23j1IqH
         vDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629727; x=1726234527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5fQ+cdLJYbOn3NF5s//ezlsttCjL0fvaEZaJE8odEpo=;
        b=TbnT23oqf6f2mO7o/Q8KhgRgMqLOUWGSJeQ8hF14SF+eHe8+T59X+nTEHKUhnq1iDz
         l+TpznwM1Qx2/IrzIZt+lPnYbo11bnhFl5QWXqLYyAK6jF7n4sGF4Rc4UUwdd2uBh+Mr
         Pq67YHYpXXlVsQsvCNsnBKZ20KdiCtsOqVK0E4J9l9v0jY4FNBgyOvkj2E87NPc2TShH
         TI1p1rRZ7ifbdNZejaRR74fkUfELA7exAckUitpLdma4QBfuSsCHchM7C+JugkKpqog/
         UzSXOoG+PoeqlPZ7kpPQkpKfXJTOb0O6cS9LG0HCENO0Js0uVzkVPlWOC1uFQd3tTwxx
         MqlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3sHpFazhMswo0Qit8Sp8kRIqcNR9yEBEGl9rb0dbSzd2Ouq0+dB+EiOonWIhxPIkViZLBNTSUZOZXxaJQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxzrZE+OaUDrUeH+f9aeuMDPgoCqlzC9gbGmJ9asro4Ssi7/WH4
	6Ic2AB7juvRrdzuBJzynnxyRlPHMHlzHmmsxzHYE9gxP0rZvIQZKonfvrsRlAD8=
X-Google-Smtp-Source: AGHT+IHmymTxLOs3PLKO0c6jWSVpOPktEs2qQjYl+O557HjFRG7O8Rjb+6CkqWWmmtxCWJdK5yFMkg==
X-Received: by 2002:a5d:5c88:0:b0:374:c8d1:70be with SMTP id ffacd0b85a97d-374c8d171c7mr10723438f8f.38.1725629726803;
        Fri, 06 Sep 2024 06:35:26 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 06 Sep 2024 15:34:54 +0200
Subject: [PATCH v4 9/9] reset: amlogic: add auxiliary reset driver support
MIME-Version: 1.0
Message-Id: <20240906-meson-rst-aux-v4-9-08824c3d108b@baylibre.com>
References: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
In-Reply-To: <20240906-meson-rst-aux-v4-0-08824c3d108b@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9860; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XLWvH9i6+Kiiy0dwA5ikE9sDbinj1MBPG77NiOiU0DA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wUVnaG4Noluao1RPwFCG8nJSg/MLQxRGJ+cl
 +kM2Q6CvHiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFFQAKCRDm/A8cN/La
 hWKAEACMfSqWEFrl9iF4MECgBdKRSQcUCnhQQll1l+KRJ1LEaOl+9R3JwC/Enr4fuBzdvMq5CLX
 ALYld5gdTC2zl44G0TO1qR28l3lhTXxktZ/IKzZWDqoLVl+IEH9SiKAHtBBkXL302IcTKVFMLsm
 zIJFOuTvLpaY4vVHv8X1kRtg6MbSXNTR5M3IkZF3kaA9HNL23p8G686VqPeQRukBqZpkXu1RsQv
 5SAsfVvrbZ9fKii/pSZ5rNs+dkTpI5DODllw4D3YKROqfxacVEo2Llv23u1mtK4AK+nK6VpQP/v
 aPDW7oK4MyeL0JWURpZDu5V0Qr5cWU6R2IPjEgLkE20vB67Q3ad4UpXWU7Q9yoaBKTZbt/DiDqN
 GiPyaAoqv15xkDx2z1RgEshsUVSCDPD5591Jvmx0q1cWYhlaIM6j58K6em0dvmVpMDN+x3ZBCPE
 yfKW4T5+TjeBuKVkyXdFkApCs4kpTsUiGEbyuhx5nL/2JPJMszTEMMcNeQ0XqKuQjWWqMcpL5Y+
 JBCzN27mEUefdEYVfaZVHX7TWlEsvUCcD8tBFEzAYHz7n+zx2QKF2gYlefttF2jVSYihMQ3ptdf
 /DmhPGaZxPxS0FrNtOPWEZXQDZxowyUSw6gno9hY3nk+vKz3H4HltKJV4HB+7dOAft3ptPwva5Z
 5XofjCd6Ucn3B7g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_063529_518501_DF2343D2 
X-CRM114-Status: GOOD (  23.83  )
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
index 1d77987088f4..e73ee5d63264 100644
--- a/drivers/reset/amlogic/Kconfig
+++ b/drivers/reset/amlogic/Kconfig
@@ -11,6 +11,14 @@ config RESET_MESON
 	help
 	  This enables the reset driver for Amlogic SoCs.
 
+config RESET_MESON_AUX
+	tristate "Meson Reset Auxiliary Driver"
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
