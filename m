Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7148DC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:13:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 402E22075C
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WwYIipgx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2Q4dkm2h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 402E22075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fehR68ODE+HPTw/rYxhEBj7h7aFaYaqi9O+Tc+tXPEQ=; b=WwYIipgxQ8M18R
	FVZPgu1zy9hOR4QIr9qgIW950YOh7YjcLP1XylonFu3YgWZoQb8nNskHQCMZNYpax/2Xm61oYc/lL
	EjvXhaLQZh6tPae3kdBTMEFgD8jcn04RpUBEs5tMT7AEa9Jh5zvstQjnQYRG/fzgVo65uNFF+paVi
	zX574bG36KzRaf/CN05NfCl0tNpy3upNs2POAt9OeC8/zX9H8C7YOXtjprLr4dOK1cFtNm0IiDbOs
	b5hvNhnpT0htzK1yYRMhJV4ZJ1JIQcitdxkklHajleXsOzcF4a0MWQL45L5l5SsKoD8RQJsoISc4R
	q/JcygKSjNq6bW1cuRoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pGc-0000Rn-5O; Mon, 18 Mar 2019 10:13:14 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5pFT-0007PY-5x
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:12:10 +0000
Received: by mail-wr1-x441.google.com with SMTP id w2so16282317wrt.11
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PmHU8/wzo4h/lgm25Z+ZOL+WNnm5SExdJffYJ54zESc=;
 b=2Q4dkm2h9cebY6wj/j5NQrjy/Gx+Na/pdfjSS6KsZ9wEOFTKyNAh29WOIkRiE5EHPz
 Ms5hbdamh1Vnr1LXrMR98IZpdxUmpTrrQXd9gD+rc/xMyWz+wuyRCQ1X8Eif/RjateHu
 mC6S1CZ7jgHDPpVJeO3oVQGPT6qjhiGc8Tz83C8d4ND3Et70SeLlb+bxdJ2Gfy2/TL1/
 RC1qtshCBEOJb/8ACGCxHyCsyE4cO26O2zikNIoLaRmUhsNaXcokJBmG0Vs5F4654Ywr
 VxcbO4VZy+qd+uziosc6G7lYQp6BkLHVbkLbwWDAhvnzqy3YmbMgX0Hh1tdyAlA7Pvsp
 6MKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PmHU8/wzo4h/lgm25Z+ZOL+WNnm5SExdJffYJ54zESc=;
 b=ZjiJvioR5nbP9Xhryq5SqTLYErQciAmNdF4rSGNcaarr37R8DO/14yqD/yaHyNxk3F
 M8UxLZZkXMXARcqqdbhKTtoL5cQSDLzmq4RWSSlYYHjkx5yylsMUXLkG4PoSsQr+w3Wh
 /pMf1Ny9HBnsc2HcxrKnOQEB9Sr6Eak3nLPp3gpg+d0X/PDJV/Unu51ns6UH/x8uI6xO
 vufA2oYCzAs0i6Okv0flZF6xMDfeZtg95dJpW47aaYQq3h+947QW86RVKat6KY43jx6d
 o+g6eDpOoTdiJ+XIE8h/r6ObJK2dGVi4jtcdjzxlcga0JcNgtoUhuVxlPH6kdB4lwJmF
 F5AA==
X-Gm-Message-State: APjAAAXwdYl1hh/EVLDIyCkqTgEZO1m5ROkIQxQyhGeYZFHXHABZVSVj
 dbtoHndE8zcYhuwGa7UjIFKb6w==
X-Google-Smtp-Source: APXvYqwrZ04cBGfYGPB4joKlzEV5Bg+50rtljtNWRJ+gbm2u7r52nX8dRd/z5afjTNHWMNAgTnhfdw==
X-Received: by 2002:adf:e58f:: with SMTP id l15mr11143795wrm.309.1552903921246; 
 Mon, 18 Mar 2019 03:12:01 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z8sm6697855wrl.59.2019.03.18.03.12.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:12:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH v3 5/8] phy: amlogic: add Amlogic G12A USB2 PHY Driver
Date: Mon, 18 Mar 2019 11:11:50 +0100
Message-Id: <20190318101153.7531-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318101153.7531-1-narmstrong@baylibre.com>
References: <20190318101153.7531-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_031203_615271_07C201FC 
X-CRM114-Status: GOOD (  16.88  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the USB2 PHY found in the Amlogic G12A SoC Family.

It supports Host and/or Peripheral mode, depending on it's position.
The first PHY is only used as Host, but the second supports Dual modes
defined by the USB Control Glue HW in front of the USB Controllers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/Kconfig               |  11 ++
 drivers/phy/amlogic/Makefile              |   1 +
 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 189 ++++++++++++++++++++++
 3 files changed, 201 insertions(+)
 create mode 100644 drivers/phy/amlogic/phy-meson-g12a-usb2.c

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index 23fe1cda2f70..560ff0f1ed4c 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -36,3 +36,14 @@ config PHY_MESON_GXL_USB3
 	  Enable this to support the Meson USB3 PHY and OTG detection
 	  IP block found in Meson GXL and GXM SoCs.
 	  If unsure, say N.
+
+config PHY_MESON_G12A_USB2
+	tristate "Meson G12A USB2 PHY driver"
+	default ARCH_MESON
+	depends on OF && (ARCH_MESON || COMPILE_TEST)
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  Enable this to support the Meson USB2 PHYs found in Meson
+	  G12A SoCs.
+	  If unsure, say N.
diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
index 4fd8848c194d..7d4d10f5a6b3 100644
--- a/drivers/phy/amlogic/Makefile
+++ b/drivers/phy/amlogic/Makefile
@@ -1,3 +1,4 @@
 obj-$(CONFIG_PHY_MESON8B_USB2)		+= phy-meson8b-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB2)	+= phy-meson-gxl-usb2.o
+obj-$(CONFIG_PHY_MESON_G12A_USB2)	+= phy-meson-g12a-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB3)	+= phy-meson-gxl-usb3.o
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
new file mode 100644
index 000000000000..9f35259f237f
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Meson G12A USB2 PHY driver
+ *
+ * Copyright (C) 2017 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ * Copyright (C) 2017 Amlogic, Inc. All rights reserved
+ * Copyright (C) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#define PHY_CTRL_R0						0x0
+#define PHY_CTRL_R1						0x4
+#define PHY_CTRL_R2						0x8
+#define PHY_CTRL_R3						0xc
+#define PHY_CTRL_R4						0x10
+#define PHY_CTRL_R5						0x14
+#define PHY_CTRL_R6						0x18
+#define PHY_CTRL_R7						0x1c
+#define PHY_CTRL_R8						0x20
+#define PHY_CTRL_R9						0x24
+#define PHY_CTRL_R10						0x28
+#define PHY_CTRL_R11						0x2c
+#define PHY_CTRL_R12						0x30
+#define PHY_CTRL_R13						0x34
+#define PHY_CTRL_R14						0x38
+#define PHY_CTRL_R15						0x3c
+#define PHY_CTRL_R16						0x40
+#define PHY_CTRL_R17						0x44
+#define PHY_CTRL_R18						0x48
+#define PHY_CTRL_R19						0x4c
+#define PHY_CTRL_R20						0x50
+#define PHY_CTRL_R21						0x54
+#define PHY_CTRL_R22						0x58
+#define PHY_CTRL_R23						0x5c
+
+#define RESET_COMPLETE_TIME					1000
+#define PLL_RESET_COMPLETE_TIME					100
+
+struct phy_meson_g12a_usb2_priv {
+	struct device		*dev;
+	struct regmap		*regmap;
+	struct clk		*clk;
+	struct reset_control	*reset;
+};
+
+static const struct regmap_config phy_meson_g12a_usb2_regmap_conf = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = PHY_CTRL_R23,
+};
+
+static int phy_meson_g12a_usb2_init(struct phy *phy)
+{
+	struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = reset_control_reset(priv->reset);
+	if (ret)
+		return ret;
+
+	udelay(RESET_COMPLETE_TIME);
+
+	/* usb2_otg_aca_en == 0 */
+	regmap_update_bits(priv->regmap, PHY_CTRL_R21, BIT(2), 0);
+
+	/* PLL Setup : 24MHz * 20 / 1 = 480MHz */
+	regmap_write(priv->regmap, PHY_CTRL_R16, 0x39400414);
+	regmap_write(priv->regmap, PHY_CTRL_R17, 0x927e0000);
+	regmap_write(priv->regmap, PHY_CTRL_R18, 0xac5f49e5);
+
+	udelay(PLL_RESET_COMPLETE_TIME);
+
+	/* UnReset PLL */
+	regmap_write(priv->regmap, PHY_CTRL_R16, 0x19400414);
+
+	/* PHY Tuning */
+	regmap_write(priv->regmap, PHY_CTRL_R20, 0xfe18);
+	regmap_write(priv->regmap, PHY_CTRL_R4, 0x8000fff);
+
+	/* Tuning Disconnect Threshold */
+	regmap_write(priv->regmap, PHY_CTRL_R3, 0x34);
+
+	/* Analog Settings */
+	regmap_write(priv->regmap, PHY_CTRL_R14, 0);
+	regmap_write(priv->regmap, PHY_CTRL_R13, 0x78000);
+
+	return 0;
+}
+
+static int phy_meson_g12a_usb2_exit(struct phy *phy)
+{
+	struct phy_meson_g12a_usb2_priv *priv = phy_get_drvdata(phy);
+
+	return reset_control_reset(priv->reset);
+}
+
+/* set_mode is not needed, mode setting is handled via the UTMI bus */
+static const struct phy_ops phy_meson_g12a_usb2_ops = {
+	.init		= phy_meson_g12a_usb2_init,
+	.exit		= phy_meson_g12a_usb2_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int phy_meson_g12a_usb2_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *phy_provider;
+	struct resource *res;
+	struct phy_meson_g12a_usb2_priv *priv;
+	struct phy *phy;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	platform_set_drvdata(pdev, priv);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(dev, base,
+					     &phy_meson_g12a_usb2_regmap_conf);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->clk = devm_clk_get(dev, "xtal");
+	if (IS_ERR(priv->clk))
+		return PTR_ERR(priv->clk);
+
+	priv->reset = devm_reset_control_get(dev, "phy");
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
+
+	ret = reset_control_deassert(priv->reset);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &phy_meson_g12a_usb2_ops);
+	if (IS_ERR(phy)) {
+		ret = PTR_ERR(phy);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to create PHY\n");
+
+		return ret;
+	}
+
+	phy_set_bus_width(phy, 8);
+	phy_set_drvdata(phy, priv);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id phy_meson_g12a_usb2_of_match[] = {
+	{ .compatible = "amlogic,g12a-usb2-phy", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, phy_meson_g12a_usb2_of_match);
+
+static struct platform_driver phy_meson_g12a_usb2_driver = {
+	.probe	= phy_meson_g12a_usb2_probe,
+	.driver	= {
+		.name		= "phy-meson-g12a-usb2",
+		.of_match_table	= phy_meson_g12a_usb2_of_match,
+	},
+};
+module_platform_driver(phy_meson_g12a_usb2_driver);
+
+MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_DESCRIPTION("Meson G12A USB2 PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
