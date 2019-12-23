Return-Path: <SRS0=G+Cj=2N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51562C2D0D2
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Dec 2019 21:38:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2746620882
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Dec 2019 21:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qmcv1l9T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2746620882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvnbI575sm4A9ne8D6uk77kv391igm76ePKaq+y+3xE=; b=Qmcv1l9T9e2nPa
	uZn3ixN7sOYAY3gQ+v5DDQnN/+Sox+6bVWPF0Qk/4cMs/puiM6AVU2/QAjwVakgeOqt18GRZ5WgYK
	SO9CE7LwgFh0Rwf2X8bozzYlsfsuBZIc1my+/K9xSVR1goUQwGe6wApaH5luwSwhOPQ0/jsy/+Hs3
	36D40YvTg+xGJiKjezOuZ+dZWwze85o2aeQQgds0XvxdhSzwxmiBerNUtIuOj3md1/DHDwyWKMf6J
	9ls3PX1NMK0wnTOAvn7zqhp5m+u9AyHNjOQzWGfjX8/qGOO3r/eyk76yAYmvdeVM3OzQLtS+mvlOJ
	RRdgFNXruGY+p4/SXlpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijVPH-0006ty-0q; Mon, 23 Dec 2019 21:38:27 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijVPC-0006nC-IG
 for linux-amlogic@lists.infradead.org; Mon, 23 Dec 2019 21:38:24 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id AA18A20004;
 Mon, 23 Dec 2019 21:38:10 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@Amlogic.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Andrew Murray <andrew.murray@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/3] phy: amlogic: Add Amlogic AXG PCIE PHY Driver
Date: Mon, 23 Dec 2019 22:45:28 +0100
Message-Id: <20191223214529.20377-3-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191223214529.20377-1-repk@triplefau.lt>
References: <20191223214529.20377-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_133822_885818_0C3E5D23 
X-CRM114-Status: GOOD (  14.46  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Remi Pommarel <repk@triplefau.lt>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the PCI PHY found in the Amlogic AXG SoC Family.
This will allow to mutualize code in pci-meson.c between AXG and G12A
SoC.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/phy/amlogic/Kconfig              |  11 ++
 drivers/phy/amlogic/Makefile             |   1 +
 drivers/phy/amlogic/phy-meson-axg-pcie.c | 163 +++++++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 drivers/phy/amlogic/phy-meson-axg-pcie.c

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index 1eeb75d018e3..2a3935169ef4 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -60,6 +60,17 @@ config PHY_MESON_G12A_USB3_PCIE
 	  in Meson G12A SoCs.
 	  If unsure, say N.
 
+config PHY_MESON_AXG_PCIE
+	tristate "Meson AXG PCIE PHY driver"
+	default ARCH_MESON
+	depends on OF && (ARCH_MESON || COMPILE_TEST)
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  Enable this to support the Meson MIPI + PCIE PHY found
+	  in Meson AXG SoCs.
+	  If unsure, say N.
+
 config PHY_MESON_AXG_MIPI_PCIE
 	tristate "Meson AXG MIPI + PCIE PHY driver"
 	default ARCH_MESON
diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
index 2167330a0ae8..5fd3a6dca0a5 100644
--- a/drivers/phy/amlogic/Makefile
+++ b/drivers/phy/amlogic/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_PHY_MESON_GXL_USB2)	+= phy-meson-gxl-usb2.o
 obj-$(CONFIG_PHY_MESON_G12A_USB2)	+= phy-meson-g12a-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB3)	+= phy-meson-gxl-usb3.o
 obj-$(CONFIG_PHY_MESON_G12A_USB3_PCIE)	+= phy-meson-g12a-usb3-pcie.o
+obj-$(CONFIG_PHY_MESON_AXG_PCIE)	+= phy-meson-axg-pcie.o
 obj-$(CONFIG_PHY_MESON_AXG_MIPI_PCIE)	+= phy-meson-axg-mipi-pcie.o
diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
new file mode 100644
index 000000000000..559c42c1524d
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic AXG PCIE PHY driver
+ *
+ * Copyright (C) 2019 Remi Pommarel <repk@triplefau.lt>
+ */
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/platform_device.h>
+#include <linux/bitfield.h>
+#include <dt-bindings/phy/phy.h>
+
+#define MESON_PCIE_REG0 0x00
+#define		MESON_PCIE_COMMON_CLK	BIT(4)
+#define		MESON_PCIE_PORT_SEL	GENMASK(3, 2)
+#define		MESON_PCIE_CLK		BIT(1)
+#define		MESON_PCIE_POWERDOWN	BIT(0)
+
+#define MESON_PCIE_TWO_X1		FIELD_PREP(MESON_PCIE_PORT_SEL, 0x3)
+#define MESON_PCIE_COMMON_REF_CLK	FIELD_PREP(MESON_PCIE_COMMON_CLK, 0x1)
+#define MESON_PCIE_PHY_INIT		(MESON_PCIE_TWO_X1 |		\
+					 MESON_PCIE_COMMON_REF_CLK)
+#define MESON_PCIE_RESET_DELAY		500
+
+struct phy_axg_pcie_priv {
+	struct phy *phy;
+	struct regmap *regmap;
+	struct reset_control *reset;
+};
+
+static const struct regmap_config phy_axg_pcie_regmap_conf = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = MESON_PCIE_REG0,
+};
+
+static int phy_axg_pcie_power_on(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+
+	regmap_update_bits(priv->regmap, MESON_PCIE_REG0,
+			   MESON_PCIE_POWERDOWN, 0);
+	return 0;
+}
+
+static int phy_axg_pcie_power_off(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+
+	regmap_update_bits(priv->regmap, MESON_PCIE_REG0,
+			   MESON_PCIE_POWERDOWN, 1);
+	return 0;
+}
+
+static int phy_axg_pcie_init(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+
+	regmap_write(priv->regmap, MESON_PCIE_REG0, MESON_PCIE_PHY_INIT);
+	return reset_control_reset(priv->reset);
+}
+
+static int phy_axg_pcie_exit(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+
+	return reset_control_reset(priv->reset);
+}
+
+static int phy_axg_pcie_reset(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+	int ret = 0;
+
+	ret = reset_control_assert(priv->reset);
+	if (ret != 0)
+		goto out;
+	udelay(MESON_PCIE_RESET_DELAY);
+
+	ret = reset_control_deassert(priv->reset);
+	if (ret != 0)
+		goto out;
+	udelay(MESON_PCIE_RESET_DELAY);
+
+out:
+	return ret;
+}
+
+static const struct phy_ops phy_axg_pcie_ops = {
+	.init = phy_axg_pcie_init,
+	.exit = phy_axg_pcie_exit,
+	.power_on = phy_axg_pcie_power_on,
+	.power_off = phy_axg_pcie_power_off,
+	.reset = phy_axg_pcie_reset,
+	.owner = THIS_MODULE,
+};
+
+static int phy_axg_pcie_probe(struct platform_device *pdev)
+{
+	struct phy_provider *pphy;
+	struct device *dev = &pdev->dev;
+	struct phy_axg_pcie_priv *priv;
+	struct device_node *np = dev->of_node;
+	struct resource *res;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->phy = devm_phy_create(dev, np, &phy_axg_pcie_ops);
+	if (IS_ERR(priv->phy)) {
+		ret = PTR_ERR(priv->phy);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to create PHY\n");
+		return ret;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(dev, base,
+					     &phy_axg_pcie_regmap_conf);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->reset = devm_reset_control_array_get(dev, false, false);
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
+
+	phy_set_drvdata(priv->phy, priv);
+	dev_set_drvdata(dev, priv);
+	pphy = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(pphy);
+}
+
+static const struct of_device_id phy_axg_pcie_of_match[] = {
+	{
+		.compatible = "amlogic,axg-pcie-phy",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, phy_axg_pcie_of_match);
+
+static struct platform_driver phy_axg_pcie_driver = {
+	.probe = phy_axg_pcie_probe,
+	.driver = {
+		.name = "phy-axg-pcie",
+		.of_match_table = phy_axg_pcie_of_match,
+	},
+};
+module_platform_driver(phy_axg_pcie_driver);
+
+MODULE_AUTHOR("Remi Pommarel <repk@triplefau.lt>");
+MODULE_DESCRIPTION("Amlogic AXG PCIE PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
