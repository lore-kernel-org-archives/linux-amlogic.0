Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF93C43334
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jun 2022 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xYPwBAXvh2vTnnWXM1AyIFwvU6qoApmhOKAxIhnhrGw=; b=vD3WpxCNMofIw/
	q5rtSvWRmIkd6TjwE0GlvaDfRls0F00aU1rP6VXIPQK+jZB40k6tCRdqWapJGwijyWwUvKj7qYCin
	6HsO+Fy6MtO63RQo2UP0Mclp0K8gbRAroswqpXHtbSHA2w7neF8HN/EKQAMO8vNO9rildpM/OuWxK
	1ojAmhzHfAom9PIM6Jad1FZ1V3onzXoqPYnF/XnnPXoFtkeGlK1903HPHjyX48NScMIpTQ3X8qXHE
	in0QqHA57GL1p4mE60CjdpoXoHxlPFb5at3Y8QOtd//etPYcRV/JtQkTG98kcku7JYDftd52+lsbr
	3Jyj6Crathvryf0G0AnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pi5-002UoF-3u; Thu, 16 Jun 2022 13:38:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1phY-002Uby-Iy
	for linux-amlogic@lists.infradead.org; Thu, 16 Jun 2022 13:38:28 +0000
Received: by mail-wr1-x42c.google.com with SMTP id n1so1676342wrg.12
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Jun 2022 06:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F/SPXYyJ9pOv+57/VRPyN+3QaTNRZ+8Q87oNWa1ed6U=;
        b=sZnvhiQPTbFhgH01BZXK9frx5kA9oJjPA7EMRswq3DvCa7aU2L5g/j16bM8oXtkyta
         +6FFNp85niS7md8GlEVv6dVl98KHd4ItmqnZyV5UZ21UaR5BSI2QdXVgdK4P7F9/05c0
         tz9W+4UPJzYD9RjCidvYnXljAXw39h2u+Vj86JfR+Vj/Jects2tXu53R5vpYJe1s4lkJ
         9/gCtdFoTGn1fpcZyy2sFS4ezcNNDRTrdnb3u8Scp7rv27YI5dnx1psDIityA7Qkd/VM
         L0ApCvLQWYvfmo5Xnk66wXKtIiFm1NUtKDIPDeBmdNlb33mfMSiHnd38NEKWn5KOTktH
         RwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F/SPXYyJ9pOv+57/VRPyN+3QaTNRZ+8Q87oNWa1ed6U=;
        b=ZsD6De4oPhILjdoHL+3/95mWniTNUABkprdnRj5s32PXfKFq60U8F8oVC6mYD4Jxu/
         4f8CwGpHJltFnNlBzl1Rmoz6Y9P/6DCkkoEsq9T6LOh5ow5WRh4NmT16InYbq8gAWpud
         R3KpjLvXHx0ZBl81O+oRrvIdF9YbhquMJ/WYV6Qq4ULrD18dA5JFs0KhBk5g9xdiPRJr
         uLuB/a4SXo92MyFpORLUa2BU06x5U0YqTdRwfkA5WerkSdxX1z3cu5aQn1fl+gnU8G7A
         kFeqKVa5f1UnlpyfZt52GZFZyjIDxUcL6vOuGAo8Fu2naGb6rGInxugykCIwnTDPhPXu
         NDVg==
X-Gm-Message-State: AJIora8nt2G0h1QiiGbepIg0t3Hi/hM50H0d9dkiViD2FRPLSBCU8i8p
	mrVtR/TnqB7WbBek9YLsg7rDHA==
X-Google-Smtp-Source: AGRyM1uzUj7FAN/10Bu3b+bPtVXXKsugwJewcCZ3H2BR0vg8eYeVP6T8bZOBrzVRTv2yR+QDna/jIA==
X-Received: by 2002:a5d:4d8f:0:b0:210:3e14:ff27 with SMTP id b15-20020a5d4d8f000000b002103e14ff27mr4601797wru.81.1655386701496;
        Thu, 16 Jun 2022 06:38:21 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:34f:da80:9c48:d9f8:5c33:3dd5])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d678c000000b0020c5253d90asm1935423wru.86.2022.06.16.06.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 06:38:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	vkoul@kernel.org
Cc: linux-phy@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v4 2/2] phy: amlogic: Add G12A Analog MIPI D-PHY driver
Date: Thu, 16 Jun 2022 15:38:11 +0200
Message-Id: <20220616133811.1674777-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220616133811.1674777-1-narmstrong@baylibre.com>
References: <20220616133811.1674777-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_063824_756430_527FB881 
X-CRM114-Status: GOOD (  20.27  )
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

The Amlogic G12A SoCs embeds an Analog MIPI D-PHY used to communicate with DSI
panels.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/phy/amlogic/Kconfig                   |  12 ++
 drivers/phy/amlogic/Makefile                  |   1 +
 .../amlogic/phy-meson-g12a-mipi-dphy-analog.c | 177 ++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index 486ca23aba32..e4d1170efd54 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -59,6 +59,18 @@ config PHY_MESON_G12A_USB3_PCIE
 	  in Meson G12A SoCs.
 	  If unsure, say N.
 
+config PHY_MESON_G12A_MIPI_DPHY_ANALOG
+	tristate "Meson G12A MIPI Analog DPHY driver"
+	default ARCH_MESON
+	depends on OF && (ARCH_MESON || COMPILE_TEST)
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	select GENERIC_PHY_MIPI_DPHY
+	help
+	  Enable this to support the Meson MIPI Analog DPHY found in Meson G12A
+	  SoCs.
+	  If unsure, say N.
+
 config PHY_MESON_AXG_PCIE
 	tristate "Meson AXG PCIE PHY driver"
 	default ARCH_MESON
diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
index c0886c850bb0..91e3b9790c03 100644
--- a/drivers/phy/amlogic/Makefile
+++ b/drivers/phy/amlogic/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_PHY_MESON8B_USB2)			+= phy-meson8b-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB2)		+= phy-meson-gxl-usb2.o
 obj-$(CONFIG_PHY_MESON_G12A_USB2)		+= phy-meson-g12a-usb2.o
 obj-$(CONFIG_PHY_MESON_G12A_USB3_PCIE)		+= phy-meson-g12a-usb3-pcie.o
+obj-$(CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG)	+= phy-meson-g12a-mipi-dphy-analog.o
 obj-$(CONFIG_PHY_MESON_AXG_PCIE)		+= phy-meson-axg-pcie.o
 obj-$(CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG)	+= phy-meson-axg-mipi-pcie-analog.o
 obj-$(CONFIG_PHY_MESON_AXG_MIPI_DPHY)		+= phy-meson-axg-mipi-dphy.o
diff --git a/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c b/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
new file mode 100644
index 000000000000..adfcca38a952
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson-g12a-mipi-dphy-analog.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Meson G12A MIPI DSI Analog PHY
+ *
+ * Copyright (C) 2018 Amlogic, Inc. All rights reserved
+ * Copyright (C) 2020 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/phy/phy.h>
+
+#define HHI_MIPI_CNTL0 0x00
+#define		HHI_MIPI_CNTL0_DIF_REF_CTL1	GENMASK(31, 16)
+#define		HHI_MIPI_CNTL0_DIF_REF_CTL0	GENMASK(15, 0)
+
+#define HHI_MIPI_CNTL1 0x04
+#define		HHI_MIPI_CNTL1_BANDGAP		BIT(16)
+#define		HHI_MIPI_CNTL2_DIF_REF_CTL2	GENMASK(15, 0)
+
+#define HHI_MIPI_CNTL2 0x08
+#define		HHI_MIPI_CNTL2_DIF_TX_CTL1	GENMASK(31, 16)
+#define		HHI_MIPI_CNTL2_CH_EN		GENMASK(15, 11)
+#define		HHI_MIPI_CNTL2_DIF_TX_CTL0	GENMASK(10, 0)
+
+#define DSI_LANE_0				BIT(4)
+#define DSI_LANE_1				BIT(3)
+#define DSI_LANE_CLK				BIT(2)
+#define DSI_LANE_2				BIT(1)
+#define DSI_LANE_3				BIT(0)
+
+struct phy_g12a_mipi_dphy_analog_priv {
+	struct phy *phy;
+	struct regmap *regmap;
+	struct phy_configure_opts_mipi_dphy config;
+};
+
+static int phy_g12a_mipi_dphy_analog_configure(struct phy *phy,
+					       union phy_configure_opts *opts)
+{
+	struct phy_g12a_mipi_dphy_analog_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = phy_mipi_dphy_config_validate(&opts->mipi_dphy);
+	if (ret)
+		return ret;
+
+	memcpy(&priv->config, opts, sizeof(priv->config));
+
+	return 0;
+}
+
+static int phy_g12a_mipi_dphy_analog_power_on(struct phy *phy)
+{
+	struct phy_g12a_mipi_dphy_analog_priv *priv = phy_get_drvdata(phy);
+	unsigned int reg;
+
+	regmap_write(priv->regmap, HHI_MIPI_CNTL0,
+		     FIELD_PREP(HHI_MIPI_CNTL0_DIF_REF_CTL0, 0x8) |
+		     FIELD_PREP(HHI_MIPI_CNTL0_DIF_REF_CTL1, 0xa487));
+
+	regmap_write(priv->regmap, HHI_MIPI_CNTL1,
+		     FIELD_PREP(HHI_MIPI_CNTL2_DIF_REF_CTL2, 0x2e) |
+		     HHI_MIPI_CNTL1_BANDGAP);
+
+	regmap_write(priv->regmap, HHI_MIPI_CNTL2,
+		     FIELD_PREP(HHI_MIPI_CNTL2_DIF_TX_CTL0, 0x459) |
+		     FIELD_PREP(HHI_MIPI_CNTL2_DIF_TX_CTL1, 0x2680));
+
+	reg = DSI_LANE_CLK;
+	switch (priv->config.lanes) {
+	case 4:
+		reg |= DSI_LANE_3;
+		fallthrough;
+	case 3:
+		reg |= DSI_LANE_2;
+		fallthrough;
+	case 2:
+		reg |= DSI_LANE_1;
+		fallthrough;
+	case 1:
+		reg |= DSI_LANE_0;
+		break;
+	default:
+		reg = 0;
+	}
+
+	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL2,
+			   HHI_MIPI_CNTL2_CH_EN,
+			   FIELD_PREP(HHI_MIPI_CNTL2_CH_EN, reg));
+
+	return 0;
+}
+
+static int phy_g12a_mipi_dphy_analog_power_off(struct phy *phy)
+{
+	struct phy_g12a_mipi_dphy_analog_priv *priv = phy_get_drvdata(phy);
+
+	regmap_write(priv->regmap, HHI_MIPI_CNTL0, 0);
+	regmap_write(priv->regmap, HHI_MIPI_CNTL1, 0);
+	regmap_write(priv->regmap, HHI_MIPI_CNTL2, 0);
+
+	return 0;
+}
+
+static const struct phy_ops phy_g12a_mipi_dphy_analog_ops = {
+	.configure = phy_g12a_mipi_dphy_analog_configure,
+	.power_on = phy_g12a_mipi_dphy_analog_power_on,
+	.power_off = phy_g12a_mipi_dphy_analog_power_off,
+	.owner = THIS_MODULE,
+};
+
+static int phy_g12a_mipi_dphy_analog_probe(struct platform_device *pdev)
+{
+	struct phy_provider *phy;
+	struct device *dev = &pdev->dev;
+	struct phy_g12a_mipi_dphy_analog_priv *priv;
+	struct device_node *np = dev->of_node;
+	struct regmap *map;
+	int ret;
+
+	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* Get the hhi system controller node */
+	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
+	if (IS_ERR(map)) {
+		dev_err(dev,
+			"failed to get HHI regmap\n");
+		return PTR_ERR(map);
+	}
+
+	priv->regmap = map;
+
+	priv->phy = devm_phy_create(dev, np, &phy_g12a_mipi_dphy_analog_ops);
+	if (IS_ERR(priv->phy)) {
+		ret = PTR_ERR(priv->phy);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to create PHY\n");
+		return ret;
+	}
+
+	phy_set_drvdata(priv->phy, priv);
+	dev_set_drvdata(dev, priv);
+
+	phy = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy);
+}
+
+static const struct of_device_id phy_g12a_mipi_dphy_analog_of_match[] = {
+	{
+		.compatible = "amlogic,g12a-mipi-dphy-analog",
+	},
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, phy_g12a_mipi_dphy_analog_of_match);
+
+static struct platform_driver phy_g12a_mipi_dphy_analog_driver = {
+	.probe = phy_g12a_mipi_dphy_analog_probe,
+	.driver = {
+		.name = "phy-meson-g12a-mipi-dphy-analog",
+		.of_match_table = phy_g12a_mipi_dphy_analog_of_match,
+	},
+};
+module_platform_driver(phy_g12a_mipi_dphy_analog_driver);
+
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_DESCRIPTION("Meson G12A MIPI Analog D-PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
