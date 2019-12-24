Return-Path: <SRS0=kiAd=2O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22BDBC2D0CF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 17:32:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED67220706
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 17:32:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jq37X+Y3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED67220706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2jTVWlxi0eAwEspAFDf+MO1bZOIlSqQbF0xcvK7umj4=; b=Jq37X+Y3DuMrwM
	xezRNBLzyw7wuv+4767N/+lV2zYZWazE9UelzcfDc8+4R0m7kn2iDik9+eI4zGnYNJQF2F5bZhb22
	iVg7K2lZZ5OSivMkDpD24xbr/u++0FiBf3Y/wvv5sXn5QI3Uv2axoVLUvBkwru2JUwUlFdeWWhB1t
	M2CoajgjIZ6teIhvkJufwa5Y1LIUg5dfDcRWx0eOYCMXYX+ldaBgO+YIDStJSjQJ7jbAxzcvy9mKs
	3CMsLwvO+lQrZgeu9eW+wPd2aMPhA/ASRhl2hAP+THIR2ivMnvjEw3o3fGaR1UM4qLuuqNRXRI4cY
	eEacLVDlDNLp1kBv/Q5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijo2Y-0000je-5f; Tue, 24 Dec 2019 17:32:14 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijo2V-0000in-Bt
 for linux-amlogic@lists.infradead.org; Tue, 24 Dec 2019 17:32:13 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 567DC20005;
 Tue, 24 Dec 2019 17:32:00 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@Amlogic.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Andrew Murray <andrew.murray@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/5] phy: amlogic: Add Amlogic AXG PCIE PHY Driver
Date: Tue, 24 Dec 2019 18:39:38 +0100
Message-Id: <20191224173942.18160-2-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191224173942.18160-1-repk@triplefau.lt>
References: <20191224173942.18160-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_093211_679279_AEE72943 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: linux-amlogic@lists.infradead.org, Remi Pommarel <repk@triplefau.lt>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the PCI PHY found in the Amlogic AXG SoC Family.

This PHY configures the PCIE_PHY registers as well as the HHI_MIPI_CNTL0
through syscon subsystem. This would allow to remove the mipi_enable
clock gating logic which was mistakenly added in the clock subsystem.

It also set a non documented band gap bit in those registers that makes
PCIE clock signal generation on AXG platforms reliable.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/phy/amlogic/Kconfig              |  11 ++
 drivers/phy/amlogic/Makefile             |   1 +
 drivers/phy/amlogic/phy-meson-axg-pcie.c | 185 +++++++++++++++++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 drivers/phy/amlogic/phy-meson-axg-pcie.c

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index af774ac2b934..a77848501d43 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -59,3 +59,14 @@ config PHY_MESON_G12A_USB3_PCIE
 	  Enable this to support the Meson USB3 + PCIE Combo PHY found
 	  in Meson G12A SoCs.
 	  If unsure, say N.
+
+config PHY_MESON_AXG_PCIE
+	tristate "Meson AXG PCIE PHY driver"
+	default ARCH_MESON
+	depends on OF && (ARCH_MESON || COMPILE_TEST)
+	select GENERIC_PHY
+	select MFD_SYSCON
+	select REGMAP_MMIO
+	help
+	  Enable this to support the Meson PCIE PHY found in AXG SoCs.
+	  If unsure, say N.
diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
index 11d1c42ac2be..0772e82fa1f8 100644
--- a/drivers/phy/amlogic/Makefile
+++ b/drivers/phy/amlogic/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PHY_MESON_GXL_USB2)	+= phy-meson-gxl-usb2.o
 obj-$(CONFIG_PHY_MESON_G12A_USB2)	+= phy-meson-g12a-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB3)	+= phy-meson-gxl-usb3.o
 obj-$(CONFIG_PHY_MESON_G12A_USB3_PCIE)	+= phy-meson-g12a-usb3-pcie.o
+obj-$(CONFIG_PHY_MESON_AXG_PCIE)	+= phy-meson-axg-pcie.o
diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
new file mode 100644
index 000000000000..06b5443fe3b3
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -0,0 +1,185 @@
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
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/bitfield.h>
+#include <dt-bindings/phy/phy.h>
+
+#define HHI_MIPI_CNTL0 0x00
+#define		HHI_MIPI_CNTL0_ENABLE		BIT(29)
+#define		HHI_MIPI_CNTL0_BANDGAP		BIT(26)
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
+	struct regmap *regmap_hhi;
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
+
+	regmap_update_bits(priv->regmap_hhi, HHI_MIPI_CNTL0,
+			   HHI_MIPI_CNTL0_BANDGAP, HHI_MIPI_CNTL0_BANDGAP);
+
+	regmap_update_bits(priv->regmap_hhi, HHI_MIPI_CNTL0,
+			   HHI_MIPI_CNTL0_ENABLE, HHI_MIPI_CNTL0_ENABLE);
+	return 0;
+}
+
+static int phy_axg_pcie_power_off(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+
+	regmap_update_bits(priv->regmap_hhi, HHI_MIPI_CNTL0,
+			   HHI_MIPI_CNTL0_ENABLE, 0);
+
+	regmap_update_bits(priv->regmap_hhi, HHI_MIPI_CNTL0,
+			   HHI_MIPI_CNTL0_BANDGAP, 0);
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
+	priv->regmap_hhi = syscon_regmap_lookup_by_phandle(np, "aml,hhi-gpr");
+	if (IS_ERR(priv->regmap_hhi))
+		return PTR_ERR(priv->regmap_hhi);
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
