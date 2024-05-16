Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6BDC25B77
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2024 15:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sm27MZZfcVKLsNliEp7j1oq4GVwiEAgscXDzAo0alQM=; b=36MyATxapd40Of
	Q1SdTHNFy57F0CXnBobQzmVqI6FPzvMMbt+34VGwSUH1RYYD9nEKyMBPkVA0AmlKLR+moVSKM/b+e
	fjI+Qe9MjcgTsPgXaAw/GCBLDvSEibgp7IEGjpALDz3/X+XSG6z1J2pVz8lR6FzeTeo4/RKSV3m89
	4VvOeCdw39oRnbgBXdXfVcodfjN6IDawAJZPGmwSW9UJalQuh2Voosg+YY7RewnO8gI2nSO35Hbhn
	ZpJe8OXW89VciVdPsFuluTwehTxG5XTkWyyNWoqjrx8u7pAz1kVLBZLO4qmwR1mN06ACWNT2gp336
	W0ICZ3F1XTPnaKkBCGdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cjM-00000005G2H-0k8i;
	Thu, 16 May 2024 15:09:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7cj2-00000005Foo-0mQW
	for linux-amlogic@lists.infradead.org;
	Thu, 16 May 2024 15:09:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41fd5dc0480so51936695e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 16 May 2024 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872135; x=1716476935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puB+gD3ay9Sx041zZz0+FhSyarhWutAqTKpIgu3JFCo=;
        b=EkOXrOIZgaa+1ypcaBTA8T3CNGO+85upE+zKzZN27FKjRStmKEdHP4UxA7Do0Rc+R8
         cnaAt/eMQgDzqCWpPnuM/X5n3zyo3jPq+mZ7EngcdQw8tBHfzDpShIe4aTJChJj+C6bX
         ieyxqjt4b8cQTgnXGQqzFaK+e7BlEwMxZxAsA8jNnLhcph7TRrA2XJelkFBB2aIdrgD1
         hv/G3SmLVA42+3EtuXg5TQE3LfETm+MA9Ap03rVXYKG4azMDkC5gh9CxBO4daoHgtvtI
         2zKQiyvUz0FH7tfirV6DokHwrvCi1pbf8rGpWqeNIxRiQeEb6sfliqLoMpSoV6oHmGYZ
         al7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872135; x=1716476935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=puB+gD3ay9Sx041zZz0+FhSyarhWutAqTKpIgu3JFCo=;
        b=B8U5JjkFgGdP6bKs8HnuDt1iu8WDe8hxCFFb0gjMJk7z3liBolrXISkQX9ecV96bTl
         xvVjSvWy5IoJeoDFbuuEnhVOC6+rM1C4z6+usxUmbNPbjuPnFfCeWWGk/m/N8tjP6bBS
         7Wrpe39bDz+qNQxZ/BbPU9ZyMzN5zdfVpt3ElWiI141N8paRRnRQ+TxzRYGyML4Qolhh
         dRCYcnS0Vc22HmYuFVYPjow7l9TqmGDjTbXIdOQf8I58PDpI6hnOuHOibLmA4vQTvFVi
         +KR8KpiUcds/byVvmJr2M0Mk32ppXGKwqNrbd4dcD6hM0zMfKIthrhtNCELi4SYA9PU1
         3iig==
X-Forwarded-Encrypted: i=1; AJvYcCW7obR2HNbs3FfPOIFSmu0V/G7Myle6+nAme/LZPRS/RGT5Xm7gaO8OV0eSi9O0y2ypvTLR/C/2pswBqk6G4cdFdH1Bv7DadVR+zr4GsPfbE7o=
X-Gm-Message-State: AOJu0Yw+6FbvIEFrE9I8/O+0buIl7fxGS3ZiIWIKQ2zVcruHt3tuzZCQ
	MxadBU8/NjoTEiNul5jBIj93lyQiigUChLbND2OMWtNWKbUH9JYcHlqpbbUYv62ZYQ9hdSYoene
	n
X-Google-Smtp-Source: AGHT+IERIDiWGU6HrqYN8ZiuBsFdA4JZIIGZnn0g1+UjHbl3RAe6+oeD2WgCdEHGNIBGCjI44i0UXQ==
X-Received: by 2002:a05:600c:1383:b0:41c:2992:a3bd with SMTP id 5b1f17b1804b1-41feac5a45fmr141942315e9.27.1715872134895;
        Thu, 16 May 2024 08:08:54 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 8/9] clk: meson: add auxiliary reset helper driver
Date: Thu, 16 May 2024 17:08:38 +0200
Message-ID: <20240516150842.705844-9-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240516150842.705844-1-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_080858_649041_80C92B24 
X-CRM114-Status: GOOD (  16.23  )
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

Add an helper module to register auxiliary reset drivers from
Amlogic clock controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig             |  5 ++
 drivers/clk/meson/Makefile            |  1 +
 drivers/clk/meson/meson-clk-rst-aux.c | 84 +++++++++++++++++++++++++++
 drivers/clk/meson/meson-clk-rst-aux.h | 14 +++++
 4 files changed, 104 insertions(+)
 create mode 100644 drivers/clk/meson/meson-clk-rst-aux.c
 create mode 100644 drivers/clk/meson/meson-clk-rst-aux.h

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 59a40a49f8e1..6905aa2f080c 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -37,6 +37,11 @@ config COMMON_CLK_MESON_VCLK
 config COMMON_CLK_MESON_CLKC_UTILS
 	tristate
 
+config COMMON_CLK_MESON_CLK_RST_AUX
+	depends on REGMAP && AUXILIARY_BUS
+	imply RESET_MESON
+	tristate
+
 config COMMON_CLK_MESON_AO_CLKC
 	tristate
 	select COMMON_CLK_MESON_REGMAP
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 9ba43fe7a07a..2926a04b6c33 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -2,6 +2,7 @@
 # Amlogic clock drivers
 
 obj-$(CONFIG_COMMON_CLK_MESON_CLKC_UTILS) += meson-clkc-utils.o
+obj-$(CONFIG_COMMON_CLK_MESON_CLK_RST_AUX) += meson-clk-rst-aux.o
 obj-$(CONFIG_COMMON_CLK_MESON_AO_CLKC) += meson-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON_CPU_DYNDIV) += clk-cpu-dyndiv.o
 obj-$(CONFIG_COMMON_CLK_MESON_DUALDIV) += clk-dualdiv.o
diff --git a/drivers/clk/meson/meson-clk-rst-aux.c b/drivers/clk/meson/meson-clk-rst-aux.c
new file mode 100644
index 000000000000..a7cf3c39828c
--- /dev/null
+++ b/drivers/clk/meson/meson-clk-rst-aux.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2024 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/auxiliary_bus.h>
+#include <linux/idr.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include <soc/amlogic/meson8b-auxiliary-reset.h>
+
+#include "meson-clk-rst-aux.h"
+
+static DEFINE_IDA(meson_clk_rst_aux_ida);
+
+static void meson_clk_rst_aux_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct meson8b_reset_adev *raux =
+		to_meson8b_reset_adev(adev);
+
+	ida_free(&meson_clk_rst_aux_ida, adev->id);
+	kfree(raux);
+}
+
+static void meson_clk_rst_aux_unregister_adev(void *_adev)
+{
+	struct auxiliary_device *adev = _adev;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+int devm_meson_clk_rst_aux_register(struct device *dev,
+				    struct regmap *map,
+				    const char *adev_name)
+{
+	struct meson8b_reset_adev *raux;
+	struct auxiliary_device *adev;
+	int ret;
+
+	raux = kzalloc(sizeof(*raux), GFP_KERNEL);
+	if (!raux)
+		return -ENOMEM;
+
+	ret = ida_alloc(&meson_clk_rst_aux_ida, GFP_KERNEL);
+	if (ret < 0)
+		goto raux_free;
+
+	raux->map = map;
+
+	adev = &raux->adev;
+	adev->id = ret;
+	adev->name = adev_name;
+	adev->dev.parent = dev;
+	adev->dev.release = meson_clk_rst_aux_release;
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
+	return devm_add_action_or_reset(dev, meson_clk_rst_aux_unregister_adev,
+					adev);
+
+ida_free:
+	ida_free(&meson_clk_rst_aux_ida, adev->id);
+raux_free:
+	kfree(raux);
+	return ret;
+
+}
+EXPORT_SYMBOL_GPL(devm_meson_clk_rst_aux_register);
+
+MODULE_DESCRIPTION("Amlogic auxiliary reset helper for clock");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/meson/meson-clk-rst-aux.h b/drivers/clk/meson/meson-clk-rst-aux.h
new file mode 100644
index 000000000000..386a55a36cd9
--- /dev/null
+++ b/drivers/clk/meson/meson-clk-rst-aux.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2024 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef __MESON_CLK_RST_AUX_H
+#define __MESON_CLK_RST_AUX_H
+
+int devm_meson_clk_rst_aux_register(struct device *dev,
+				    struct regmap *map,
+				    const char *adev_name);
+
+#endif /* __MESON_CLK_RST_AUX_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
