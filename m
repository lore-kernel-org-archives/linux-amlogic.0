Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391ABC25B7B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97K1cgbXSEA9G2TnZ5fMPjYNqiyZHPRzeQ767KaHH7w=; b=C2n7wSRL8NSDNK
	C4XCbcmoYrYB4d93LCLQvGOXdqlNKIoHrdD6IvWXzxtnix1p+geyvSjfV87Is/iA+7Kpran25pGzr
	4vD24O8oqskDNrmD1K8rJ1ZQ9CzW2wXt9IJyOiTY2VJfICDGhcHWfNeTBUNlbLt16RmUx80ujAgnZ
	wZ6jrpSwRLOshkm92GbleoaDDliZPwW2Bzb4bYOktq4q76+plehS2LCDr49TXfbIe09X6QVqVimOy
	xUKa9t9LH84xiP34Rf0nouZ3drTXP9isohXIKmKPdTxEG2tEJ0c4XWQv6qwNIH+yRV/pNeTJKcya9
	xWlcED4Md1eCuwLZfZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cjK-00000005G0b-41kf;
	Thu, 16 May 2024 15:09:14 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cj2-00000005FoS-1FUM
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:09:07 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so8181071fa.0
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872134; x=1716476934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDg+S33WfMWdi2lheaCvuNpDqmP/KU8F5TNkAy677Bw=;
        b=sXiL0bFR3uSrqdZK8t3E3jSdaAbf+nYcJDuxqHhZeqIRcyEygcV+eJhVqEZyaIOIXf
         qEWOvjg2Do5taOY0StvjmdMVCCm48qT5VEqjZu42cnDHllM3P5514jnoH0pUbGPKUw92
         HbgN48lb2l62xLrWv2Mqf6hc2uAI2f65Vd9qySlAIK0F/t5OM40rRv8umDsZKUnvaM70
         jrWnEmbd6/gomZV47wtodU8CrjdPCDSpCv3gwvQSgGHXkz/FbEdzQFI2+Dwv5MX5/Y5Q
         iQ0nTi0/eKwcLka+oTjJ3/7tLGzPnyhrxD+yDHf3TM3QNMen4eDO41ekSD3Iu3YSeJPp
         zMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872134; x=1716476934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GDg+S33WfMWdi2lheaCvuNpDqmP/KU8F5TNkAy677Bw=;
        b=p+eUUN55Q+xwZS1EocLm/gBLHgssbknNObtdUPsOJYyjwHUfONPY8ZkAEFFS2oDBX6
         Sl/sSXgjSrcip4sioRCswftoT2YGiHiXTIJl8jSRuTdrwxlwQdDHLuJ/rvUpj6PFaaRp
         d4o7+5p0E5og0QKM3fuoIFGYQLcYxbkrd6ZY5Y+d/eJf4tS+8yrwcP7ZZQwz09ax/3Dp
         RemnU5+aD09Shs51bQqyWV4mBKQ8oWCu97RBGXbc7V5eA5ephDlvAmyb5B1v2QB47UQs
         y7/cGXMFz8VIxj5/plVpiVuy1yqW8FmJoajJN0F41qW23koBWHtQHBB0OIdWJ7MY9W2y
         DwBg==
X-Forwarded-Encrypted: i=1; AJvYcCXoK3sNTnlzXVTrSOzz9/KxrUpWjTMNbMMVgRmNRE2QR8UczCDRoKPESJTSdH7AVlX9lgNCuNj+Vghs+2/dKG5Sd4sRWppP43nLWx/wjoN+HSc=
X-Gm-Message-State: AOJu0Yx7Dpjm9XYdZbll+eOIXctin33iRKGsjkVYkwoEEGYl2RxXz5xt
	hqiTokCpbJ0MLdwx9S/tkEn1Hqzm0YYo4GpDhKY41KRukLv0FVLxbl01gekgGKE=
X-Google-Smtp-Source: AGHT+IF1dSFKKcicuWhPp02H8rzX/qoi5Hi1Gh7DCEthhD2sCLusrICLNxjBEsCmmaWZJsCyOMO6+g==
X-Received: by 2002:a2e:8688:0:b0:2e6:f1f6:7ddb with SMTP id 38308e7fff4ca-2e6f1f6809dmr39824751fa.3.1715872134123;
        Thu, 16 May 2024 08:08:54 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 7/9] reset: amlogic: add auxiliary reset driver support
Date: Thu, 16 May 2024 17:08:37 +0200
Message-ID: <20240516150842.705844-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080858_639470_4A437D7E 
X-CRM114-Status: GOOD (  18.98  )
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
 drivers/reset/Kconfig                         |  1 +
 drivers/reset/reset-meson.c                   | 46 ++++++++++++++++++-
 include/soc/amlogic/meson8b-auxiliary-reset.h | 17 +++++++
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 include/soc/amlogic/meson8b-auxiliary-reset.h

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 85b27c42cf65..4ceb4dc48fbc 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -134,6 +134,7 @@ config RESET_MCHP_SPARX5
 config RESET_MESON
 	tristate "Meson Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
+	depends on AUXILIARY_BUS
 	default ARCH_MESON
 	help
 	  This enables the reset driver for Amlogic Meson SoCs.
diff --git a/drivers/reset/reset-meson.c b/drivers/reset/reset-meson.c
index e34a10b15593..b5ddb85296ec 100644
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
@@ -16,6 +17,8 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <soc/amlogic/meson8b-auxiliary-reset.h>
+
 struct meson_reset_param {
 	const struct reset_control_ops *reset_ops;
 	unsigned int reset_num;
@@ -218,6 +221,47 @@ static struct platform_driver meson_reset_pltf_driver = {
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
+	struct meson8b_reset_adev *raux =
+		to_meson8b_reset_adev(adev);
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
+MODULE_DESCRIPTION("Amlogic Meson Reset driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/include/soc/amlogic/meson8b-auxiliary-reset.h b/include/soc/amlogic/meson8b-auxiliary-reset.h
new file mode 100644
index 000000000000..0a465deb4440
--- /dev/null
+++ b/include/soc/amlogic/meson8b-auxiliary-reset.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SOC_AMLOGIC_MESON8B_AUX_RESET_H
+#define __SOC_AMLOGIC_MESON8B_AUX_RESET_H
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/regmap.h>
+
+struct meson8b_reset_adev {
+	struct auxiliary_device adev;
+	struct regmap *map;
+};
+
+#define to_meson8b_reset_adev(_adev) \
+	container_of((_adev), struct meson8b_reset_adev, adev)
+
+#endif /* __SOC_AMLOGIC_MESON8B_AUX_RESET_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
