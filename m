Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46119EDE99A
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Sep 2024 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sLSa+HwvXjok16Zjt2pu+hHWP55z8qNjMr2Ks5erHI=; b=yWYMWRx2lQqIs9
	k39TJjnumBP3vqEB8fA0ueZW52AaEy+Fd+YzCj+73/vbVn8pRUxJdlTLYoqrFk+2/VXgXcNbvxa/q
	X16TbnfnysGfFf6liJgH1Ljfas90ygEueZOIrZTS8c8uSaiCxi4MwV5MZHye1m5ps3z4/p/uQkFMz
	JNS7qalG/aLdeeDfhOEQargooQDAgvphV64yp6ZCmnGXTew/QYhZGKh6pMWybqSnCKn9v6S4mrcFU
	0NY2T3G1JOcdNtNZdeA6ZET6sGul+3HWZdapjuaPasA6XHEtyhAXGAnPjgdtoJwl+e7Hn+dS82rju
	pDSpGtUY9xwsLdog9mkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3xW-00000006Oij-3sGZ;
	Tue, 10 Sep 2024 16:43:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1so3nk-00000006LH7-1pJN
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Sep 2024 16:33:15 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42cc8782869so4782835e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Sep 2024 09:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725985990; x=1726590790; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdhmdJqA/EyjrFNuD6QzQPCe1kr/HLVNmesNpkTvFG8=;
        b=vPlR5+Qq8fa9Kl95vHaRxgcGGAHEQ0qkoF50xr6EuUFSiZi3Gr1mKp2rZtvWSwTaFd
         7iyxIORHtv/wupAuMOsB540gdsIHZUWTj3C5wrQbRpq1h9zZs9plXMEeuo/bnb/godvT
         IX0xr6Pu3XR50j+9Ud8WWda+JMI3g3GokfwgjQrOpEllT3TPPccEA6njKm8jiFJjiR3Y
         4Ig/lyy6+WxX5CJNbrxppQ7o84SFHVaFIc0a0LNpeotXuvU11WnOCZ2RyfdgKWd7Majj
         5HkD4Zsxct6eZYjE/rjy6bDKU1PZF0wcFGxAtF5NmPUOIQO3szlQJw+/hH0SyLn3/mhM
         dAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725985990; x=1726590790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdhmdJqA/EyjrFNuD6QzQPCe1kr/HLVNmesNpkTvFG8=;
        b=kuYY2MqJkgz3za1rTET1fyqEErtNdC6relQGQfFoCqkR224DxfLJVf5Svk6piifzgR
         s3ih79SLOwqTn/jRbjDNFt9i0NkGc+lD0PEqpun41X8N4N9ZlcWgGenw6lbTdU4tIket
         z6dBjV9FuM04xYFGBfTx6fCYgrFyl7j9oLpIlweOssf57EH8k6Gur4nxlLbP8AIgZKmG
         dhy4OKdH4X0TWKCkdHeotJrqsaI7Q5uW26hkkQxHoGKXPXQRqhS9NELHyPIrzbp1xEB1
         AjShLjIiKcTS/7UZCPgj4fV4MlqMEUb1aKUjLXOBwEqoF459grHj4wtei1vYv2D80Wwr
         DKCg==
X-Forwarded-Encrypted: i=1; AJvYcCUpzpXI+iGxggYozyWtg3tXeZT/w+nl2UIhjo1BIYRvd+Mvw91eFl8oSgufAd4b1mwtKuRFTHiF5fpdo1bS@lists.infradead.org
X-Gm-Message-State: AOJu0YyThnu/C+cZf0O3MyWPqgj+eIozVGWd/vFMhA2rPH3n34zVIfhC
	RiH20Uo9Bv3inTjFNZqJwsoYX3Ci85K1Uu2QnKA83wI/HR2ZLCxNISIbF9wbTEpaZW3u+BrheA0
	I
X-Google-Smtp-Source: AGHT+IG0AbAhGMFiLKIpKgecMzRUKowqar+Tq4u+vnpZI/+6Lvxx9Ij6skVPyUAN8aUk/W1kE7M6Sw==
X-Received: by 2002:a05:600c:1549:b0:42c:acb0:dda5 with SMTP id 5b1f17b1804b1-42ccd30c286mr2390415e9.1.1725985989916;
        Tue, 10 Sep 2024 09:33:09 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ba7:bfe4:fea9:65b])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42cc1375189sm25076025e9.1.2024.09.10.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 09:33:09 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 10 Sep 2024 18:32:50 +0200
Subject: [PATCH v5 8/9] reset: amlogic: split the device core and platform
 probe
MIME-Version: 1.0
Message-Id: <20240910-meson-rst-aux-v5-8-60be62635d3e@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11278; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Y2iBifCKerss9PeXY+mNFJFaOt4z3yePdb10uNuG3wQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm4HS7BE55V32yPq8m1dzSvsGLZUB5NTINws7JD
 Duz7ppsnL+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZuB0uwAKCRDm/A8cN/La
 hRWQD/9Rht4NZSryoBK6rvt/1gkE8AYg4yXpm4IX/vV9md2JzoEStF9v1pRbXvCmI8FGebY0sHA
 VOcf5+0MXKveEbIXwDa+b2bDasYnxOSAyi4EyidTUitXP525Qhwxb9/mBeZ9r2y0S1fXv1fUlnv
 Q77zf+NtCsXsE+creuzdjSPLa8VQxI28vr+6XpIOIXo4PfkRu1FcMO2UB/r+JG1MTFSvVVAfFIL
 jdj9pOGJBB6JtTsp8N0zvqY04+a2Rln+OGo8RmoRWSRmAF9iQiY49UNR0QbpLEbyokncf4YjW1H
 gEwBTC5BbidnQehnJouioBfHVi0Hi1aMffgNklJmX1ZiZPuydfEQeKCG3w6/RzZS0KFjI/SAaJw
 bfTQ3/t+w9Rv1xTvyX5LggLyf5aeRQ7uF//lQVEVZR8+sqUtgaZ5ao2bLPrWIUqOBgpopb/R42i
 WzXHFSVZJFhgNf47tSRs3Z8JQtadzlHN2LYM7MdVFVN7Xw5BtQkolJsQLduCfNwTlJImUM9Bbri
 h8A/D6Ebm+CZLvq8vGI5ig9hVF0YUER9q7x0aKbWQfgRIu0JpmDtqDFUQvAEKhKjw2q4zhmgZ1T
 ycGkKj6JWb1aSalcGkNk6kC1FQADmp2KRz0FBG+GMd1Zt/shZ4Qfa9+KDVd3ElGRV304T5cvX25
 qCroFfMuPIAkE1w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_093312_536812_C088D58A 
X-CRM114-Status: GOOD (  21.95  )
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
 drivers/reset/amlogic/Kconfig              |   7 +-
 drivers/reset/amlogic/Makefile             |   1 +
 drivers/reset/amlogic/reset-meson-common.c | 121 ++++++++++++++++++++++++++++
 drivers/reset/amlogic/reset-meson.c        | 122 ++++-------------------------
 drivers/reset/amlogic/reset-meson.h        |  24 ++++++
 5 files changed, 167 insertions(+), 108 deletions(-)

diff --git a/drivers/reset/amlogic/Kconfig b/drivers/reset/amlogic/Kconfig
index 532e6a4f7865..1d77987088f4 100644
--- a/drivers/reset/amlogic/Kconfig
+++ b/drivers/reset/amlogic/Kconfig
@@ -1,10 +1,15 @@
+config RESET_MESON_COMMON
+	tristate
+	select REGMAP
+
 config RESET_MESON
 	tristate "Meson Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
 	default ARCH_MESON
 	select REGMAP_MMIO
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
