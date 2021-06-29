Return-Path: <SRS0=fP31=LX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F055C11F67
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 18:21:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4840E61DE4
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jun 2021 18:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4840E61DE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XzJmrtKOhfaA1gyceU3gyWReDlCHE9X3imMJnULBe44=; b=A/Nl+am66HBKX/
	L34sii9WT5HmcbWut3ZDmmeIRerTAccN3zeIW0hPI1+8AZH+uGXoDC1lCESd6I+37XBKvhd5Y+K92
	cQ/xBkGNRxAXF4t5H+zwy2l2qKV6vJrOM0ffgsRE5L7NktDTM7G+5iVvFX5RsyrJyVhuNB0DPHXH/
	p63tz6qrZy/heidZ6dCBBfMuJ9cYzpmKrwF21aIh/52TgvJQPHhMExgidf0U6wlq2ZYKJlj/35FjM
	4zczy3h3soRJuOwPM4v2zcpEMV7uTvbH1AlQCNKANQ17kLbVvQrMxIyU9v1XDAsG11YIeSToL6T+T
	KH+iNfJjpXjr7iyADKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyIML-00Bohr-5X; Tue, 29 Jun 2021 18:21:21 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyILx-00BoaL-Dz; Tue, 29 Jun 2021 18:20:59 +0000
Received: by mail-ed1-x532.google.com with SMTP id w17so17045075edd.10;
 Tue, 29 Jun 2021 11:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0zp9c8GYaiYKUAv6eUT71QHbk6kPshdSqicnQkyE6Q=;
 b=GrqadTrRLB1OVbXTgLZ0P82nA1TBRs/l2MN3GRvhnSYuPRq/H3zpCF1MRX7nxKN08V
 HhbFjFNMlAeFW+NSEsnSabrZVMfLa6p7urTMraGuxuabRcMLGmDKozGEEsPMJ9TR5TnZ
 +lNGazmW4Y/IkGfe4zIqhihhU7VU9khmzdJA7O+2bQNkjtvqjSTd+CulzsSBtLgANBye
 vfY6Pt8wtJdh6w7W0VzRMBFDFdaOZnaJOC7zx5qhPsb9PnTTu7K06EwKoqvupG8PATCs
 zsLdY60UccbpYwwPnHcOsXiQgCPWhHur4kVKl+oBokgegYtNFaQD/Rnv5jiqb9ySNwke
 QS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0zp9c8GYaiYKUAv6eUT71QHbk6kPshdSqicnQkyE6Q=;
 b=NYYTMnbs6yo+kvSBKj2ixNNZeNqp3573vFdZa5YNbO6ap/6ITea+GgothEHLweC3RA
 LUiF05A9yG+vRg6YbRivXAXtkTI5J5CF1ja/8Up6Q5olVNiuJbguDeh1Ul+28yM6TbPE
 sfR7VnUX2hXdQ+IuaCDY5t1CzW/W3C31QCcJet1eOHWsxA9XGfZ41fDCUOz0OmkI115p
 9SFDNQ/t1z196LHjZ/dluzy5/uonL9MwFTmLn8nqzE3opk1abIX+uVzrpYBAb2L7c+u5
 62aLYFiyw53PX2dlC4Bl9tgxk2qiT8zTB8olPpSj8YE1osNRPhUSICuNea5Py95tGqyl
 j5HA==
X-Gm-Message-State: AOAM531WZfKTN0IfaS+Wb2jU/XbHWa18rZ0mFrhmbmgA+Ib/wlI4cXH+
 MUoeAKmCksfSZ5U4pq59GVQ=
X-Google-Smtp-Source: ABdhPJxd3rITz9Rmq4AnFZFiP+aFgBj8RiN+lMf0hdEoCzeVQixzQC8yslUroVWHRPPIAnXyr1BYAg==
X-Received: by 2002:a50:f692:: with SMTP id d18mr41389020edn.202.1624990855557; 
 Tue, 29 Jun 2021 11:20:55 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c0d8-f500-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c0d8:f500:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id v5sm11565678edt.55.2021.06.29.11.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 11:20:54 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: kishon@ti.com, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 2/2] phy: amlogic: Add a new driver for the HDMI TX PHY on
 Meson8/8b/8m2
Date: Tue, 29 Jun 2021 20:20:47 +0200
Message-Id: <20210629182047.893415-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629182047.893415-1-martin.blumenstingl@googlemail.com>
References: <20210629182047.893415-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_112057_519108_CD0B5598 
X-CRM114-Status: GOOD (  25.66  )
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

Amlogic Meson8/8b/8m2 have a built-in HDMI PHY in the HHI register
region. Unfortunately only few register bits are documented. For
HHI_HDMI_PHY_CNTL0 the magic numbers are taken from the 3.10 vendor
kernel.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/Kconfig              |  10 ++
 drivers/phy/amlogic/Makefile             |   1 +
 drivers/phy/amlogic/phy-meson8-hdmi-tx.c | 162 +++++++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/phy/amlogic/phy-meson8-hdmi-tx.c

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index db5d0cd757e3..486ca23aba32 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -2,6 +2,16 @@
 #
 # Phy drivers for Amlogic platforms
 #
+config PHY_MESON8_HDMI_TX
+	tristate "Meson8, Meson8b and Meson8m2 HDMI TX PHY driver"
+	depends on (ARCH_MESON && ARM) || COMPILE_TEST
+	depends on OF
+	select MFD_SYSCON
+	help
+	  Enable this to support the HDMI TX PHYs found in Meson8,
+	  Meson8b and Meson8m2 SoCs.
+	  If unsure, say N.
+
 config PHY_MESON8B_USB2
 	tristate "Meson8, Meson8b, Meson8m2 and GXBB USB2 PHY driver"
 	default ARCH_MESON
diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
index 8fa07fbd0d92..c0886c850bb0 100644
--- a/drivers/phy/amlogic/Makefile
+++ b/drivers/phy/amlogic/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PHY_MESON8_HDMI_TX)		+= phy-meson8-hdmi-tx.o
 obj-$(CONFIG_PHY_MESON8B_USB2)			+= phy-meson8b-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB2)		+= phy-meson-gxl-usb2.o
 obj-$(CONFIG_PHY_MESON_G12A_USB2)		+= phy-meson-g12a-usb2.o
diff --git a/drivers/phy/amlogic/phy-meson8-hdmi-tx.c b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
new file mode 100644
index 000000000000..ba5a4de54811
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Meson8, Meson8b and Meson8m2 HDMI TX PHY.
+ *
+ * Copyright (C) 2021 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#define HHI_HDMI_PHY_CNTL0				0x0
+	#define HHI_HDMI_PHY_CNTL0_HDMI_CTL1		GENMASK(31, 16)
+	#define HHI_HDMI_PHY_CNTL0_HDMI_CTL0		GENMASK(15, 0)
+
+#define HHI_HDMI_PHY_CNTL1				0x4
+	#define HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE		BIT(1)
+	#define HHI_HDMI_PHY_CNTL1_SOFT_RESET		BIT(0)
+
+#define HHI_HDMI_PHY_CNTL2				0x8
+
+struct phy_meson8_hdmi_tx_priv {
+	struct regmap		*hhi;
+	struct clk		*tmds_clk;
+	unsigned int		reg_offset;
+};
+
+static int phy_meson8_hdmi_tx_init(struct phy *phy)
+{
+	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
+
+	return clk_prepare_enable(priv->tmds_clk);
+}
+
+static int phy_meson8_hdmi_tx_exit(struct phy *phy)
+{
+	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(priv->tmds_clk);
+
+	return 0;
+}
+
+static int phy_meson8_hdmi_tx_power_on(struct phy *phy)
+{
+	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
+	unsigned int i;
+	u16 hdmi_ctl0;
+
+	if (clk_get_rate(priv->tmds_clk) >= 2970UL * 1000 * 1000)
+		hdmi_ctl0 = 0x1e8b;
+	else
+		hdmi_ctl0 = 0x4d0b;
+
+	regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL0,
+		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL1, 0x08c3) |
+		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL0, hdmi_ctl0));
+
+	regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL1, 0x0);
+
+	/* Reset three times, just like the vendor driver does */
+	for (i = 0; i < 3; i++) {
+		regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL1,
+			     HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE |
+			     HHI_HDMI_PHY_CNTL1_SOFT_RESET);
+		usleep_range(1000, 2000);
+
+		regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL1,
+			     HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE);
+		usleep_range(1000, 2000);
+	}
+
+	return 0;
+}
+
+static int phy_meson8_hdmi_tx_power_off(struct phy *phy)
+{
+	struct phy_meson8_hdmi_tx_priv *priv = phy_get_drvdata(phy);
+
+	regmap_write(priv->hhi, priv->reg_offset + HHI_HDMI_PHY_CNTL0,
+		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL1, 0x0841) |
+		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL0, 0x8d00));
+
+	return 0;
+}
+
+static const struct phy_ops phy_meson8_hdmi_tx_ops = {
+	.init		= phy_meson8_hdmi_tx_init,
+	.exit		= phy_meson8_hdmi_tx_exit,
+	.power_on	= phy_meson8_hdmi_tx_power_on,
+	.power_off	= phy_meson8_hdmi_tx_power_off,
+	.owner		= THIS_MODULE,
+};
+
+static int phy_meson8_hdmi_tx_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct phy_meson8_hdmi_tx_priv *priv;
+	struct phy_provider *phy_provider;
+	struct phy *phy;
+	u32 reg[2];
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	ret = device_property_read_u32_array(&pdev->dev, "reg", reg,
+					     ARRAY_SIZE(reg));
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to parse the 'reg' property\n");
+
+	priv->reg_offset = reg[0];
+
+	priv->hhi = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(priv->hhi))
+		return PTR_ERR(priv->hhi);
+
+	priv->tmds_clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(priv->tmds_clk))
+		return PTR_ERR(priv->tmds_clk);
+
+	phy = devm_phy_create(&pdev->dev, np, &phy_meson8_hdmi_tx_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	phy_set_drvdata(phy, priv);
+
+	phy_provider = devm_of_phy_provider_register(&pdev->dev,
+						     of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id phy_meson8_hdmi_tx_of_match[] = {
+	{ .compatible = "amlogic,meson8-hdmi-tx-phy" },
+	{ .compatible = "amlogic,meson8b-hdmi-tx-phy" },
+	{ .compatible = "amlogic,meson8m2-hdmi-tx-phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, phy_meson8_hdmi_tx_of_match);
+
+static struct platform_driver phy_meson8_hdmi_tx_driver = {
+	.probe	= phy_meson8_hdmi_tx_probe,
+	.driver	= {
+		.name		= "phy-meson8-hdmi-tx",
+		.of_match_table	= phy_meson8_hdmi_tx_of_match,
+	},
+};
+module_platform_driver(phy_meson8_hdmi_tx_driver);
+
+MODULE_AUTHOR("Martin Blumenstingl <martin.blumenstingl@googlemail.com>");
+MODULE_DESCRIPTION("Meson8, Meson8b and Meson8m2 HDMI TX PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
