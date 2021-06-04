Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A47FC4743D
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 19:05:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD1D601FA
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 19:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DD1D601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVsJM0CE2+ADGEZDZR9TGFT/2594NZYyfeFPI78SWvI=; b=WuIomG7+P3NWgd
	L/IK9g0N9XHLJ0Hg78Bq+PV4MM3vQ7KSGQN7zlVtA0t+Crv+OfCLijKX+7CXMJ2PD5n+PnAKDbcyA
	XsEDTuEbQhTHD/kMbhMTmtYUoe2Lf2Jc6Leq7e8bylPkGEhWXC5HVVGthM9QNpxF9NDkWE5B0H8LF
	NsZ35FXJDKGFCFOstfaqLl7XpR5pDyz69AqtMqhw1KBPaa7bfi7PQD5MD/g7jGZgG5Pnuhd0jAeO0
	O4s6KZIqA45lw7lvFyfT6r42OlMXwLzA221NB2q3fqXoYeQoCCnB4I+a2LZk6oZz8iVI1MdDZk2gY
	wBRRsTSbcEfebCCu9Meg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpF7w-00Evps-K9; Fri, 04 Jun 2021 19:05:04 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpF7r-00Evmv-Fn; Fri, 04 Jun 2021 19:05:03 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so6193476wmq.0; 
 Fri, 04 Jun 2021 12:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Twf9jLAwNkQLT/Ujy3oKloWts7LR/OdCMpxXY26zthg=;
 b=MP1bQU74xRmIPbbCW5IfT+gtc1NZbEbx9s8o/Qh6TED2ofeYU181cNMzQJKG7vAr2D
 CkfCrALUhSJuXNr2NpeMOCYqOu7yQzZ3FV3mVNu+smsnfyt9mUlkxhxmNA30estAfJur
 wOU6Z6m5uvF71GLaV9tm9FbPwDFAuOQ7NuMxrImxqpg+KL4C4z1J0aiwHg1EEFCQBPs+
 oIul4zenm0OZlgRuf98T5OCFRNi9Puy1qbMfd0A9DPbpoD7YKnE3x+kKVWS04FW07BG7
 zRNtwzSFrvQTQjfhIQNK2ifJv+Jbu0ueqJyhY6GckpNU5C47tvJTiSFemdkIV9mR7msf
 oD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Twf9jLAwNkQLT/Ujy3oKloWts7LR/OdCMpxXY26zthg=;
 b=jYEKwUwi6U1sXslbrcYjfp6eMz+V/pgJVo2fiMoQ5dQ2wEiWvdBgiZymMcNQJTZpR8
 FPo6nOl/TMbWDWswhT/2e4a+Wo3KyrPaB7N6VU7c/VkSdObSnoYprG/HrSwXGd2N2bv6
 CAsKonk/vybp1npP9FoU+SIi7i570toxA4ELmwu8bYdn/2dWQebjRZ2POkV2YLhRvetx
 RdAyD4kLD0B22REVco8osJ5FaBo9azCajW3I9mv/OAI7nW0vgUTmkrGBEtUqOin4eORR
 Gg1ka21SqjtLYT4OVF3Tt0y9zel8MvQ2ii6XSg0FQOMy+7HN69S1pFoNR5ESNMh/kcpX
 RI0g==
X-Gm-Message-State: AOAM5325POmr0Mfbd0JKAZ0+gAmQ1ByR0RStDkfoilnX9FsJ4os/J85E
 5SfK5UZb+7qEnEM7rO7Hz3b0e3A2dVDR2A==
X-Google-Smtp-Source: ABdhPJytzExsCF3VUCig9c0sedFUkKAZMizhqxJiYlsmCY4WJCwJJhIj+2PCmu37/Tn7SInLTg5y3Q==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr4973716wmk.25.1622833437623; 
 Fri, 04 Jun 2021 12:03:57 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137127c00f22f74fffe210725.dip0.t-ipconnect.de.
 [2003:f1:3712:7c00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id x10sm7576200wrt.65.2021.06.04.12.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 12:03:57 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc: kishon@ti.com, vkoul@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/2] phy: amlogic: Add a new driver for the HDMI TX PHY on
 Meson8/8b/8m2
Date: Fri,  4 Jun 2021 21:03:38 +0200
Message-Id: <20210604190338.2248295-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604190338.2248295-1-martin.blumenstingl@googlemail.com>
References: <20210604190338.2248295-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_120459_561302_48A23098 
X-CRM114-Status: GOOD (  24.48  )
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
 drivers/phy/amlogic/Kconfig              |  11 ++
 drivers/phy/amlogic/Makefile             |   1 +
 drivers/phy/amlogic/phy-meson8-hdmi-tx.c | 150 +++++++++++++++++++++++
 3 files changed, 162 insertions(+)
 create mode 100644 drivers/phy/amlogic/phy-meson8-hdmi-tx.c

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index db5d0cd757e3..e6c3a2a8b769 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -2,6 +2,17 @@
 #
 # Phy drivers for Amlogic platforms
 #
+config PHY_MESON8_HDMI_TX
+	tristate "Meson8, Meson8b and Meson8m2 HDMI TX PHY driver"
+	default ARCH_MESON
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
index 000000000000..8f13960a4492
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Meson8, Meson8b and Meson8m2 HDMI TX PHY.
+ *
+ * Copyright (C) 2020 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
+#include <linux/regmap.h>
+
+#define HHI_HDMI_PHY_CNTL0				0x3a0
+	#define HHI_HDMI_PHY_CNTL0_HDMI_CTL1		GENMASK(31, 16)
+	#define HHI_HDMI_PHY_CNTL0_HDMI_CTL0		GENMASK(15, 0)
+
+#define HHI_HDMI_PHY_CNTL1				0x3a4
+	#define HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE		BIT(1)
+	#define HHI_HDMI_PHY_CNTL1_SOFT_RESET		BIT(0)
+
+#define HHI_HDMI_PHY_CNTL2				0x3a8
+
+struct phy_meson8_hdmi_tx_priv {
+	struct regmap		*hhi;
+	struct clk		*tmds_clk;
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
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0,
+		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL1, 0x08c3) |
+		     FIELD_PREP(HHI_HDMI_PHY_CNTL0_HDMI_CTL0, hdmi_ctl0));
+
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, 0x00000000);
+
+	/* Reset three times, just like the vendor driver does */
+	for (i = 0; i < 3; i++) {
+		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1,
+			     HHI_HDMI_PHY_CNTL1_CLOCK_ENABLE |
+			     HHI_HDMI_PHY_CNTL1_SOFT_RESET);
+		usleep_range(1000, 2000);
+
+		regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1,
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
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL0,
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
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
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
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
