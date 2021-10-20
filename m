Return-Path: <SRS0=AMJk=PI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4271C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 19:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77260611C7
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Oct 2021 19:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77260611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZ1Age2yqYlNt10JK8P5CMBhX4jsP34r3urSdqPeNO8=; b=N3Ac/f66Ya9vhc
	MVOcp3s2y+VZ9iwH2ArDiU3HBl78fvji+pn/SIPZnFiZyw+wzTjZiIVrkA6tcTmTwFV/DaxWoIwPG
	MZKUzPPUYi/ZA7bZS867140M6BASnp9zchFNqOcWfpMv4v1gPo3JDe7XxBxqzqVnoghvqhCjqEWoa
	2ZMAj34b1YGo6bVQiIyIi9ciLoL4oMB5o8sm/428eZ/uOmu/+7cJw3irV7/z+eLwKVZkQDB2JAoNV
	wzV+POtGo3yUDw5cf9JCDX0xE9qT9vmjYLIGb0Wkch5TG/2jpakBrIl5V0LPaTkSsvxbog71xSIfX
	kqH3MGmFlngsyuwibhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdHcx-005heY-E7; Wed, 20 Oct 2021 19:51:55 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdHcZ-005hVg-Iv; Wed, 20 Oct 2021 19:51:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id i12so22602wrb.7;
 Wed, 20 Oct 2021 12:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N9trX6BUcNb0j2IVKNM+Xz6Qfq7brKDHnZXMGzRSkSA=;
 b=mnvqchSp+CCj4iMN0D8Oi+rdYe1Z2sFSIhdFBDL3xwtxSwhZEaEzZfko5GyaI3jkY+
 Ir9s3c5UijXmLDNdBOom1N95uo0ZpjTJWgB+X2yzpMB9HAO/Xr9ukKiJwj+pk5FFxX2n
 wx5yS514Bo2ks4KqT2Wz/1n+iYpdmbGS62VLohYF9hBjN7dVReF3EZDPeP2ZlETytn6U
 HiRoL6yMPlrQjV1ue9ESEVA6w+JBqIbkuipzSkqUaeQAa2DVOgz6eiqXprP5+1+qt9G+
 JTnirBTJLgIuznBPlohKFn3+gRrjO3Hpq5NjUDo3qn7BHgvFW3KAEHYL1ecT9zoWxVA0
 amsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N9trX6BUcNb0j2IVKNM+Xz6Qfq7brKDHnZXMGzRSkSA=;
 b=vOWj3K0PB7dLQXJxnIy3tr9kJyYpF8yRDVt4NuWXrZ4J8f9T1EaTkPw33h7ky+VQ9K
 D8QFFBX/QoWxtztM6jVQxH+ekjNgKyIIcPa9VQOteHoSHr3mW+51CwGLWMxCWymo1bPb
 RA6YvoXu+s/JeftenGG77uw4gpveW3aGogxr+/YJniPKcs9Zq2qH7WlQWU39MF3adz6g
 ewjGs2KCgFulQ/6CDmpJC9Fjk2fkVcHwzvfzNqHWcvZTp0D3hN6MfzRbaq/TAKxtBMvX
 bKVMXXxuqCcbj+NWK9Gc0GD+K9Pm3SZoudz0xE8ihlLfH4PAYLl1HTMxsCAh8SZ3Ts/O
 NPBA==
X-Gm-Message-State: AOAM530dDJIjjoodvugTdzjR6lxti6ijyypiiJsnBZk/wOxwZq8iDFP/
 oMmXJgGmRrm3QVh0ditp/VFx10BqKF4=
X-Google-Smtp-Source: ABdhPJxvbSbZ3lODadM+Se1fG2YW1EKusNJWgMmB6xKpOc5/J9LzV5h3eM5Wm5B6S22fBOlFPY1+Xw==
X-Received: by 2002:a05:6000:145:: with SMTP id
 r5mr1556083wrx.64.1634759489688; 
 Wed, 20 Oct 2021 12:51:29 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-b9f5-df00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:b9f5:df00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id f3sm2741310wml.11.2021.10.20.12.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 12:51:29 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kishon@ti.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 2/2] phy: amlogic: Add a new driver for the HDMI TX PHY on
 Meson8/8b/8m2
Date: Wed, 20 Oct 2021 21:51:07 +0200
Message-Id: <20211020195107.1564533-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020195107.1564533-1-martin.blumenstingl@googlemail.com>
References: <20211020195107.1564533-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_125131_658002_DFDB3484 
X-CRM114-Status: GOOD (  26.31  )
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
 drivers/phy/amlogic/phy-meson8-hdmi-tx.c | 160 +++++++++++++++++++++++
 3 files changed, 171 insertions(+)
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
index 000000000000..f9a6572c27d8
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson8-hdmi-tx.c
@@ -0,0 +1,160 @@
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
+/*
+ * Unfortunately there is no detailed documentation available for the
+ * HHI_HDMI_PHY_CNTL0 register. CTL0 and CTL1 is all we know about.
+ * Magic register values in the driver below are taken from the vendor
+ * BSP / kernel.
+ */
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
+	regmap_write(priv->hhi, HHI_HDMI_PHY_CNTL1, 0x0);
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
+	struct resource *res;
+	struct phy *phy;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
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
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
