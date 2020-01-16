Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E772C33CB1
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 11:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13DB32077B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 11:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DHdXyZ0f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NMyQ+S5z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13DB32077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZs8MA/bMu+xag3f1S1viskG3BJSZC0409lVKpUFFwE=; b=DHdXyZ0flFZxKu
	NqBZec55HflXVO3PiKPJohGRx3JIloUXpQUpYlc7QCNIRMO4L1IaTfeCIZPr/Wfsh3PWQDkM2Pt7X
	P+ygBxjFlVc++ZGvqTQlADJR90OdsqExU/7HBZoiC8aJ08rskv/sDyn1GHNIemMZ3/WPo8+C95yrI
	VDTNLAF98YYZ4EMpifmePhFVPVvUoouLlUqAmQs3f8kmA4MmagmAQqpKWtaL1sP+jBeNmB9bsS/s7
	/y36dLiGj5Yzjs7Ww+IAMxN0InF1bW8j1G3y6c3lTltiOc0TgL1U90B9BgHBRjjd++GbChFJ7aLgy
	O+JfGUrvgALiUVFNGjDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is33o-00074d-QL; Thu, 16 Jan 2020 11:11:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is33n-00072k-K5
 for linux-amlogic@bombadil.infradead.org; Thu, 16 Jan 2020 11:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uy9Ko9O50RRRI321pFAu7lGTNHQacF9TwezHaFe/Hgo=; b=NMyQ+S5ztHYQWdnSWGs1UftE4B
 rX2xd/OTYQgtVxe574d8pHkPQxGYhAmZQjcPeShnOFFcjJogxj2njshUJ3n08uiIIQb84HYVpq2Sp
 oa/kq34yP2GNyuEt7+JKTzjBE1z5hk4ljoRaSrTygRto8+YMKd/pn4fDEwKw6oQJnysyFzmNHZ8rW
 /3nqhPheZGhBtCJ2Z2JoovZ/jc9rAIGLMBhvQTCOm3WQCuTGYmTlDiBCD+QY5tcwRfJ/06KyJSGbK
 QtghUVi/HFsZkehg9F8Zk8539b+UD/O/QbNWPYJqQoRA310v6olYxQ0ItDz/tC8KlDayitpViY4a3
 CywYvE2w==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is346-0001FM-3U
 for linux-amlogic@lists.infradead.org; Thu, 16 Jan 2020 11:11:59 +0000
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5193C200004;
 Thu, 16 Jan 2020 11:10:56 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@Amlogic.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 6/7] phy: amlogic: Add Amlogic AXG PCIE PHY Driver
Date: Thu, 16 Jan 2020 12:18:49 +0100
Message-Id: <20200116111850.23690-7-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200116111850.23690-1-repk@triplefau.lt>
References: <20200116111850.23690-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_111154_188987_19579442 
X-CRM114-Status: GOOD (  19.06  )
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

This PHY can chain and use an optional analog PHY, which is used on
AXG platform to have reliable PCIe communication.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/phy/amlogic/Kconfig              |  11 ++
 drivers/phy/amlogic/Makefile             |   1 +
 drivers/phy/amlogic/phy-meson-axg-pcie.c | 192 +++++++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 drivers/phy/amlogic/phy-meson-axg-pcie.c

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index 8c9cf2403591..71801e30d601 100644
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
 config PHY_MESON_AXG_MIPI_PCIE_ANALOG
 	tristate "Meson AXG MIPI + PCIE analog PHY driver"
 	default ARCH_MESON
diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
index 0aecf92d796a..e2baa133f7af 100644
--- a/drivers/phy/amlogic/Makefile
+++ b/drivers/phy/amlogic/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_PHY_MESON_GXL_USB2)		+= phy-meson-gxl-usb2.o
 obj-$(CONFIG_PHY_MESON_G12A_USB2)		+= phy-meson-g12a-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB3)		+= phy-meson-gxl-usb3.o
 obj-$(CONFIG_PHY_MESON_G12A_USB3_PCIE)		+= phy-meson-g12a-usb3-pcie.o
+obj-$(CONFIG_PHY_MESON_AXG_PCIE)		+= phy-meson-axg-pcie.o
 obj-$(CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG)	+= phy-meson-axg-mipi-pcie-analog.o
diff --git a/drivers/phy/amlogic/phy-meson-axg-pcie.c b/drivers/phy/amlogic/phy-meson-axg-pcie.c
new file mode 100644
index 000000000000..0c5d0732cd1c
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson-axg-pcie.c
@@ -0,0 +1,192 @@
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
+	struct phy *analog;
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
+	int ret;
+
+	ret = phy_power_on(priv->analog);
+	if (ret != 0)
+		return ret;
+
+	regmap_update_bits(priv->regmap, MESON_PCIE_REG0,
+			   MESON_PCIE_POWERDOWN, 0);
+	return 0;
+}
+
+static int phy_axg_pcie_power_off(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = phy_power_off(priv->analog);
+	if (ret != 0)
+		return ret;
+
+	regmap_update_bits(priv->regmap, MESON_PCIE_REG0,
+			   MESON_PCIE_POWERDOWN, 1);
+	return 0;
+}
+
+static int phy_axg_pcie_init(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = phy_init(priv->analog);
+	if (ret != 0)
+		return ret;
+
+	regmap_write(priv->regmap, MESON_PCIE_REG0, MESON_PCIE_PHY_INIT);
+	return reset_control_reset(priv->reset);
+}
+
+static int phy_axg_pcie_exit(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = phy_exit(priv->analog);
+	if (ret != 0)
+		return ret;
+
+	return reset_control_reset(priv->reset);
+}
+
+static int phy_axg_pcie_reset(struct phy *phy)
+{
+	struct phy_axg_pcie_priv *priv = phy_get_drvdata(phy);
+	int ret = 0;
+
+	ret = phy_reset(priv->analog);
+	if (ret != 0)
+		goto out;
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
+	priv->analog = devm_phy_optional_get(dev, "analog");
+	if (IS_ERR(priv->analog))
+		return PTR_ERR(priv->analog);
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
