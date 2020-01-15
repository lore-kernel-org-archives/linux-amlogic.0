Return-Path: <SRS0=Q90K=3E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F324C33CB1
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 12:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9459222C3
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Jan 2020 12:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M0lXFoDF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9459222C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUmHLxWB2DZan5wFvO5QmXJuqsdBbW9/5Xcuhd+qUSw=; b=M0lXFoDFa3441z
	iRCVEbtLrgdNpVEZVj6JLGI49+Li9vC6/sKk5PxRkjK0YYQa8vq6ZHSrSC/Qh1nWTQVQ0GPAv2ATk
	fmNdBBaNbwWLweOw1iztJbUM1OjqzkAP1TDn0ujPahyWCm/Q5MrsXl0bLBncT7XecQA4yOxyuYCCX
	sJK7Q4fGGozg+Ra5AIXr3+h5u8bXOr9b5l0DA+FPlLqur51PEdPJWVSM39j6ydogc+YSHJK/furOD
	WRpgoQahmVGOhhwCOrgZDji4WAtV+HI1+89nkYAhJ0ZZLJ4HlSvFanoU6d7N0mDL9qFxCyd77hkvl
	Nj7jg6TW+1CzC2+XDmUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irhhB-0008A8-7J; Wed, 15 Jan 2020 12:22:49 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irhh3-00084k-Ve
 for linux-amlogic@lists.infradead.org; Wed, 15 Jan 2020 12:22:46 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id F1928E0008;
 Wed, 15 Jan 2020 12:22:31 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 6/7] phy: amlogic: Add Amlogic AXG PCIE PHY Driver
Date: Wed, 15 Jan 2020 13:29:07 +0100
Message-Id: <20200115122908.16954-7-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115122908.16954-1-repk@triplefau.lt>
References: <20200115122908.16954-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_042242_290821_D683194C 
X-CRM114-Status: GOOD (  14.96  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
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
index 5c789d2973f9..a88e8591ee02 100644
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
index 000000000000..cdecfe6b3b1a
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic AXG PCIE PHY driver
+ *
+ * Copyright (C) 2020 Remi Pommarel <repk@triplefau.lt>
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
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
