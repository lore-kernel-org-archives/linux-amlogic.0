Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F5ECE7B14
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2024 13:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4hTWer321Jo3cri+wwlG4y0iF5PtXTphPQgDePlTyE=; b=Okhxgd6yxw8XWm
	mfTO3DPZZ2wDzmhPjaRAsbLIcyVDbZ+raVUCXtIjuTSgp3op5eVE0oCW+a7tGYSQDWZSOFY9uGRW7
	1xsNdHrh+KuHhnyEIfU6yMizLnGy/OLNrXAY0an1R/GAD2kyq+BClgZSrMdF+3q5u2dHLtYy7N7Gi
	BP192rjCgZT7/Fi5zGZwQGEVt603HPXELDYUf63S289AYIUnKkoL3YWQC3Vvy1ZiDZdd7tWUJyDAK
	A7+XHASsPTxdyTgTBHtuPSoQr6KrdH4SgOrRPFaMEdBS7sGrkRBRUtCx024kF+2fgR6XE0OPT2Ag1
	1LttnkYeMPAY6aDfIXYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZFv-0000000COEo-3Tym;
	Fri, 06 Sep 2024 13:44:07 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smZ7Y-0000000CMEU-2EAR
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Sep 2024 13:35:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-42c94e59b93so17276265e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Sep 2024 06:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725629726; x=1726234526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKMMJ9BB/WECkuysAuWF0PWUWeyazpVDPxUVb4YJ+No=;
        b=vA3HTcYxCQzCYBPjJj39DuqFToFp9+N+k2/MZ01aTs6smPwbovY+6h86bl+zXJIwnX
         Fa4HKl9qqQSrKX4OkWyWXR0VFezqQ8ZKOCIrIP2CYcmaEOm2gUCr2igCiozhXTDWlyyv
         y8H04E8ySEhpu0jAICIroRqGeoYm416HL21mAG5BWjCGp2xdEzp5IJ2T262dTMQIyH0f
         PiUYTA5ds++5hSwSQioh1y2EuV30GMVDuZb3IyM8Nd+FyZMzNrmHVMzAS08N+iBfuRwx
         mR50I7uLcJza2eSWuAURsDl5euXVoCcnH5LbhlpuEN3XfFAcfG0Up0oeW4taXZ0PvDmn
         3amQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725629726; x=1726234526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jKMMJ9BB/WECkuysAuWF0PWUWeyazpVDPxUVb4YJ+No=;
        b=pdgeesaeruztM2+wElSdpGMVWMnpISSyJoVxDMr5fwSw5+OERKPTQc5wesnpfkR795
         FxxNP5OFx3aqFYQvqa52RkeDKTf7LYO88myuICPNKBrOaA1Lsjr6SFMJ8cerrmuYOuMT
         rrrQIx5mzrUiieICFXQkZbsYAdh1WLh/gY03VGIITQwvh2UHOrYz77DzTaHfJRUg2ls2
         JIQaLTznEg+rSgOnfr6G/z1R2QSyPd4zL3vu1IkDanebwV2nnGGbHaYMO1tzWgaIRaY6
         cVqkZQsvFlAUNDpX8FyzdN1w3mEsbiyruyjHA3dvpJpSts3i/pJ24wHCMCoyutdUxOc+
         selQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2DvbzPo3MaL7ykeDKxd46vPBRVpslkOxdbJDVtUMnkVZTKX1uURfzdL4hUKSSUFGpzHzNhylNGmcfa4kH@lists.infradead.org
X-Gm-Message-State: AOJu0YwZanofge/HWZXVOh6GNw62qBUW6I2gqyhVVSmWaPuQTcTYMCCq
	1IcUKLd39FyeYOTw5o+PNuhaAKre9ruMf2xZOpbBjYOFY0ljXO4tI+l1xg+cbY4=
X-Google-Smtp-Source: AGHT+IGV6zV/WTaWuRrt0ffNBSswfD9eOdNjMdzrfqpP+uGnA+r/gDgGAHL0aVp2/ptE+weUTiXXhQ==
X-Received: by 2002:adf:a395:0:b0:374:adf1:9232 with SMTP id ffacd0b85a97d-378885f1a1bmr1615357f8f.19.1725629726006;
        Fri, 06 Sep 2024 06:35:26 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b0ad:b504:10d4:481d])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749eea60e2sm21684597f8f.62.2024.09.06.06.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 06:35:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 06 Sep 2024 15:34:53 +0200
Subject: [PATCH v4 8/9] reset: amlogic: split the device core and platform
 probe
MIME-Version: 1.0
Message-Id: <20240906-meson-rst-aux-v4-8-08824c3d108b@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11277; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=BE5kz+4uxHRB80G5vKRFxE31qcQuiKDy33BrekIRUq0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2wUUgJNt2+rEFoswms9TnCWD1oUqWy4jyl035
 jdYp/PEpQKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtsFFAAKCRDm/A8cN/La
 hbl4D/40yJVP8AcXu2tPLszmvcmib8sY3fWM3mceDx3OF7eM8J+oF/RPvXE4Oj3m5z8y7suWsGJ
 XAACVzUNvRpYV4s+BUAPw/7rnugBAdbi2JY7ifPksWoSVIdTwxI4Y39EnFVqs4NOGQsQChZvllr
 2qgRbwzUNZLJQw7MNCgTG7vX2f6o+ZPgQC4gRCYVNJzmEqeZC9OimwWa4tr7WmffsTEeNeSiMPR
 BTYZAqoNGepvHCFIP120x3IIaGp2VGldci3ulqJhRt4oWSWUQyPU9T0ZMwkjF36zKBuRzZw5wsZ
 Bh+rxedojqEg/bdl18SHaG+OVFQjMpnyr+lhoLas/6HHM5hL4okO85tFlCAxZOtXnNsHfypsV7V
 fmsbfxiq/LUO39+n4dm/xFwAM0Y4bPVUnvCcgwatko44e8TVAHUSYAUC3T7r9EBNFjB24rucAVX
 ejGs6SRspQjAcop0M0MeTl02CzhK2paBVJzefjQL4kl9EJnmHujn59GrhooUxTLRlcnU7Z07yT4
 WBj7MpFLIkGtJobzerSwE+V9i84elR/b8rTnaAEhqWzVFlQu4ONDwGEyrSD2Z7DTSOH72LOwOe9
 JW1xFXKJIPhI6rb3+XCtbmpGoB17lbs8Utpsm/8P3gZZmX0IJV2HSSQTNMmJKAr8UI/sA31lLE2
 +rG2bclA4dGtfRQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_063528_672153_0A31A7FC 
X-CRM114-Status: GOOD (  21.69  )
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
out the device coomon functions from the probe of the platform device.

The device core function will be common to both the platform and auxiliary
driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/amlogic/Kconfig              |   8 +-
 drivers/reset/amlogic/Makefile             |   1 +
 drivers/reset/amlogic/reset-meson-common.c | 121 ++++++++++++++++++++++++++++
 drivers/reset/amlogic/reset-meson.c        | 122 ++++-------------------------
 drivers/reset/amlogic/reset-meson.h        |  24 ++++++
 5 files changed, 168 insertions(+), 108 deletions(-)

diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
index 7ed9cf50f038..1d77987088f4 100644
--- a/drivers/reset/amlogic/Kconfig
+++ b/drivers/reset/amlogic/Kconfig
@@ -1,9 +1,15 @@
+config RESET_MESON_COMMON
+	tristate
+	select REGMAP
+
 config RESET_MESON
 	tristate "Meson Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	default ARCH_MESON
+	select REGMAP_MMIO
+	select RESET_MESON_COMMON
 	help
-	  This enables the reset driver for Amlogic Meson SoCs.
+	  This enables the reset driver for Amlogic SoCs.
 
 config RESET_MESON_AUDIO_ARB
 	tristate "Meson Audio Memory Arbiter Reset Driver"
diff --git a/drivers/reset/amlogic/Makefile b/drivers/reset/amlogic/Makefile
index 55509fc78513..74aaa2fb5e13 100644
--- a/drivers/reset/amlogic/Makefile
+++ b/drivers/reset/amlogic/Makefile
@@ -1,2 +1,3 @@
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
+obj-$(CONFIG_RESET_MESON_COMMON) += reset-meson-common.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
diff --git a/drivers/reset/amlogic/reset-meson-common.c b/drivers/reset/amlogic/reset-meson-common.c
new file mode 100644
index 000000000000..d57544801ae9
--- /dev/null
+++ b/drivers/reset/amlogic/reset-meson-common.c
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Amlogic Meson Reset core functions
+ *
+ * Copyright (c) 2016-2024 BayLibre, SAS.
+ * Authors: Neil Armstrong <narmstrong@baylibre.com>
+ *          Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+#include "reset-meson.h"
+
+struct meson_reset {
+	const struct meson_reset_param *param;
+	struct reset_controller_dev rcdev;
+	struct regmap *map;
+};
+
+static void meson_reset_offset_and_bit(struct meson_reset *data,
+				       unsigned long id,
+				       unsigned int *offset,
+				       unsigned int *bit)
+{
+	unsigned int stride = regmap_get_reg_stride(data->map);
+
+	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
+	*bit = id % (stride * BITS_PER_BYTE);
+}
+
+static int meson_reset_reset(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	struct meson_reset *data =
+		container_of(rcdev, struct meson_reset, rcdev);
+	unsigned int offset, bit;
+
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->reset_offset;
+
+	return regmap_write(data->map, offset, BIT(bit));
+}
+
+static int meson_reset_level(struct reset_controller_dev *rcdev,
+			    unsigned long id, bool assert)
+{
+	struct meson_reset *data =
+		container_of(rcdev, struct meson_reset, rcdev);
+	unsigned int offset, bit;
+
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->level_offset;
+	assert ^= data->param->level_low_reset;
+
+	return regmap_update_bits(data->map, offset,
+				  BIT(bit), assert ? BIT(bit) : 0);
+}
+
+static int meson_reset_status(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct meson_reset *data =
+		container_of(rcdev, struct meson_reset, rcdev);
+	unsigned int val, offset, bit;
+
+	meson_reset_offset_and_bit(data, id, &offset, &bit);
+	offset += data->param->level_offset;
+
+	regmap_read(data->map, offset, &val);
+	val = !!(BIT(bit) & val);
+
+	return val ^ data->param->level_low_reset;
+}
+
+static int meson_reset_assert(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	return meson_reset_level(rcdev, id, true);
+}
+
+static int meson_reset_deassert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	return meson_reset_level(rcdev, id, false);
+}
+
+static const struct reset_control_ops meson_reset_ops = {
+	.reset		= meson_reset_reset,
+	.assert		= meson_reset_assert,
+	.deassert	= meson_reset_deassert,
+	.status		= meson_reset_status,
+};
+
+int meson_reset_controller_register(struct device *dev, struct regmap *map,
+				    const struct meson_reset_param *param)
+{
+	struct meson_reset *data;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->param = param;
+	data->map = map;
+	data->rcdev.owner = dev->driver->owner;
+	data->rcdev.nr_resets = param->reset_num;
+	data->rcdev.ops = &meson_reset_ops;
+	data->rcdev.of_node = dev->of_node;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+EXPORT_SYMBOL_NS_GPL(meson_reset_controller_register, MESON_RESET);
+
+MODULE_DESCRIPTION("Amlogic Meson Reset Core function");
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(MESON_RESET);
diff --git a/drivers/reset/amlogic/reset-meson.c b/drivers/reset/amlogic/reset-meson.c
index af690d3012ec..feb19bf6da77 100644
--- a/drivers/reset/amlogic/reset-meson.c
+++ b/drivers/reset/amlogic/reset-meson.c
@@ -2,106 +2,20 @@
 /*
  * Amlogic Meson Reset Controller driver
  *
- * Copyright (c) 2016 BayLibre, SAS.
- * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2016-2024 BayLibre, SAS.
+ * Authors: Neil Armstrong <narmstrong@baylibre.com>
+ *          Jerome Brunet <jbrunet@baylibre.com>
  */
+
 #include <linux/err.h>
-#include <linux/init.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
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
-
-struct meson_reset {
-	const struct meson_reset_param *param;
-	struct reset_controller_dev rcdev;
-	struct regmap *map;
-};
-
-static void meson_reset_offset_and_bit(struct meson_reset *data,
-				       unsigned long id,
-				       unsigned int *offset,
-				       unsigned int *bit)
-{
-	unsigned int stride = regmap_get_reg_stride(data->map);
-
-	*offset = (id / (stride * BITS_PER_BYTE)) * stride;
-	*bit = id % (stride * BITS_PER_BYTE);
-}
-
-static int meson_reset_reset(struct reset_controller_dev *rcdev,
-			     unsigned long id)
-{
-	struct meson_reset *data =
-		container_of(rcdev, struct meson_reset, rcdev);
-	unsigned int offset, bit;
-
-	meson_reset_offset_and_bit(data, id, &offset, &bit);
-	offset += data->param->reset_offset;
-
-	return regmap_write(data->map, offset, BIT(bit));
-}
-
-static int meson_reset_level(struct reset_controller_dev *rcdev,
-			    unsigned long id, bool assert)
-{
-	struct meson_reset *data =
-		container_of(rcdev, struct meson_reset, rcdev);
-	unsigned int offset, bit;
-
-	meson_reset_offset_and_bit(data, id, &offset, &bit);
-	offset += data->param->level_offset;
-	assert ^= data->param->level_low_reset;
 
-	return regmap_update_bits(data->map, offset,
-				  BIT(bit), assert ? BIT(bit) : 0);
-}
-
-static int meson_reset_status(struct reset_controller_dev *rcdev,
-			      unsigned long id)
-{
-	struct meson_reset *data =
-		container_of(rcdev, struct meson_reset, rcdev);
-	unsigned int val, offset, bit;
-
-	meson_reset_offset_and_bit(data, id, &offset, &bit);
-	offset += data->param->level_offset;
-
-	regmap_read(data->map, offset, &val);
-	val = !!(BIT(bit) & val);
-
-	return val ^ data->param->level_low_reset;
-}
-
-static int meson_reset_assert(struct reset_controller_dev *rcdev,
-			      unsigned long id)
-{
-	return meson_reset_level(rcdev, id, true);
-}
-
-static int meson_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return meson_reset_level(rcdev, id, false);
-}
-
-static const struct reset_control_ops meson_reset_ops = {
-	.reset		= meson_reset_reset,
-	.assert		= meson_reset_assert,
-	.deassert	= meson_reset_deassert,
-	.status		= meson_reset_status,
-};
+#include "reset-meson.h"
 
 static const struct meson_reset_param meson8b_param = {
 	.reset_num	= 256,
@@ -151,33 +65,25 @@ static const struct regmap_config regmap_config = {
 
 static int meson_reset_probe(struct platform_device *pdev)
 {
+	const struct meson_reset_param *param;
 	struct device *dev = &pdev->dev;
-	struct meson_reset *data;
+	struct regmap *map;
 	void __iomem *base;
 
-	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	data->param = device_get_match_data(dev);
-	if (!data->param)
+	param = device_get_match_data(dev);
+	if (!param)
 		return -ENODEV;
 
-	data->map = devm_regmap_init_mmio(dev, base, &regmap_config);
-	if (IS_ERR(data->map))
-		return dev_err_probe(dev, PTR_ERR(data->map),
+	map = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map),
 				     "can't init regmap mmio region\n");
 
-	data->rcdev.owner = THIS_MODULE;
-	data->rcdev.nr_resets = data->param->reset_num;
-	data->rcdev.ops = &meson_reset_ops;
-	data->rcdev.of_node = dev->of_node;
-
-	return devm_reset_controller_register(dev, &data->rcdev);
+	return meson_reset_controller_register(dev, map, param);
 }
 
 static struct platform_driver meson_reset_driver = {
@@ -191,4 +97,6 @@ module_platform_driver(meson_reset_driver);
 
 MODULE_DESCRIPTION("Amlogic Meson Reset Controller driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(MESON_RESET);
diff --git a/drivers/reset/amlogic/reset-meson.h b/drivers/reset/amlogic/reset-meson.h
new file mode 100644
index 000000000000..4e1dbd7569c5
--- /dev/null
+++ b/drivers/reset/amlogic/reset-meson.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef __MESON_RESET_H
+#define __MESON_RESET_H
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
+int meson_reset_controller_register(struct device *dev, struct regmap *map,
+				    const struct meson_reset_param *param);
+
+#endif /* __MESON_RESET_H */

-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
