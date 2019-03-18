Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B95AC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB5962070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJqZ/lWa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="NGSHf6Kq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB5962070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nl5FDIOmeMs9Vzr7Ax7ayhj2n4vCUR4xAxL/KlW1Xto=; b=GJqZ/lWaLTG4eI
	jcPrOS8Y2hXMvL7q9RQGqqeBP1IIslqNh6mwy+3lSGS1tyY6v/nkSoPOI0n8zxN6R8hw2Awyz2m3V
	DZw1yTAvRKsa5wUNj/z3yL/yIOeju3tshvm3yGW0uS/U3RPZALqS9WC8s1arrKJB/6hEy/V9uMS5a
	8LR0NxEtnZAekPiYLqA9mRlFjNUGH1Bd28zvrCB/anXTGkoacETZ5X50WxBgwi0cv1nu9N6a/278O
	B1+uX7VAb7IeFVEs0Q5ZjsJdkdWIL9Z+kt0YeFemi3t0aXFSdxfGx8qaqiGnKm9WQJ6tQ3wdyxaaa
	INUFC6+Py33YBzc8ShYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pQ7-0006ec-AN; Mon, 18 Mar 2019 10:23:03 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5pFU-0007Qo-9S
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:12:15 +0000
Received: by mail-wm1-x342.google.com with SMTP id z11so3824102wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VzCZxrCQhsV/HRmKyigFPxv9IdIgo4dwOemGdLKQpLM=;
 b=NGSHf6KqiEmFdmLtTRkvDEusXFGPvjplmUwV5qCCEdoYTChxup3Uk4PijWmBv7Ti1v
 QaJC7m9gdS1Q0Es99+lMA1tFRZSg1WZ/1KOuMa6PEJyg2FhaG13WZh5YPljVpoNzBCAE
 ZixNErWQP5GDjfbmbF+qQV/NNOw/crnrw3rr/lgQfNHODIL0EH5W1uwFM9BxyYEFzISb
 xmrrb/X805+hNBYumCddUOFPh/QGfyXiZsFXG0MI0HHYTRr4dL99h4dwP2ytwdy2ek0K
 jGcJNBJ8MuTsw7aRy1HeTckhoSfKrIKj3ltc5OGqlUoZSlE7z4jQGRuQTIY7EN6jKH80
 yNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VzCZxrCQhsV/HRmKyigFPxv9IdIgo4dwOemGdLKQpLM=;
 b=POuPdTTi2EH3f/Nqel8Af4zDrYsujko4zzSG6EQlJER/tgZdmETB3EECF5uWbygrYp
 y9u4iCSMk9OXIcuRwXfk/vMp0qsLFsebEkS6So1g5zgqsbuUgSUBlO3SggCCqWM39QkA
 hhHcsZzJtMlIgze6g8xJ/I7FOD6+Aav6E32BgzdjQEfbknQcqiu5C85VNmawtReV0rUr
 a6dBzmnsbIdw9rVMWB7rGwOJhD0N2gpmdwRcYz7onhvJeGdl3ww0beDDOPDx2Hvy19Jy
 A98J6hvmsuJkGxXk9V3OOaGXNxyxzL4z5GEM5exvRjnYkd4D0fl3hMTraVWNpJ1MTGZf
 Ijqw==
X-Gm-Message-State: APjAAAV0WVFgDwENDXvKrfZtkYP4capIUmFGhS4J1qrk38BURZovRXhg
 doEjAozY2A1HQZ9NLn14zkWeig==
X-Google-Smtp-Source: APXvYqx5ElhwstsdLaodZUvOPp1dG6ghBiy2BmyWq40chnh8B59x7Sa9SRVn00NXS0lOMtAzgQe2+A==
X-Received: by 2002:a1c:7903:: with SMTP id l3mr11151054wme.22.1552903922468; 
 Mon, 18 Mar 2019 03:12:02 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z8sm6697855wrl.59.2019.03.18.03.12.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:12:01 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com
Subject: [PATCH v3 6/8] phy: amlogic: Add Amlogic G12A USB3 + PCIE Combo PHY
 Driver
Date: Mon, 18 Mar 2019 11:11:51 +0100
Message-Id: <20190318101153.7531-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318101153.7531-1-narmstrong@baylibre.com>
References: <20190318101153.7531-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_031204_734506_B419878E 
X-CRM114-Status: GOOD (  19.77  )
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

This adds support for the shared USB3 + PCIE PHY found in the
Amlogic G12A SoC Family.

It supports USB3 Host mode or PCIE 2.0 mode, depending on the layout of
the board.

Selection is done by the #phy-cells, making the mode static and exclusive.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/Kconfig                   |  11 +
 drivers/phy/amlogic/Makefile                  |   1 +
 .../phy/amlogic/phy-meson-g12a-usb3-pcie.c    | 413 ++++++++++++++++++
 3 files changed, 425 insertions(+)
 create mode 100644 drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index 560ff0f1ed4c..4c08c1ccdd04 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -47,3 +47,14 @@ config PHY_MESON_G12A_USB2
 	  Enable this to support the Meson USB2 PHYs found in Meson
 	  G12A SoCs.
 	  If unsure, say N.
+
+config PHY_MESON_G12A_USB3_PCIE
+	tristate "Meson G12A USB3+PCIE Combo PHY driver"
+	default ARCH_MESON
+	depends on OF && (ARCH_MESON || COMPILE_TEST)
+	select GENERIC_PHY
+	select REGMAP_MMIO
+	help
+	  Enable this to support the Meson USB3 + PCIE Combo PHY found
+	  in Meson G12A SoCs.
+	  If unsure, say N.
diff --git a/drivers/phy/amlogic/Makefile b/drivers/phy/amlogic/Makefile
index 7d4d10f5a6b3..fdd008e1b19b 100644
--- a/drivers/phy/amlogic/Makefile
+++ b/drivers/phy/amlogic/Makefile
@@ -2,3 +2,4 @@ obj-$(CONFIG_PHY_MESON8B_USB2)		+= phy-meson8b-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB2)	+= phy-meson-gxl-usb2.o
 obj-$(CONFIG_PHY_MESON_G12A_USB2)	+= phy-meson-g12a-usb2.o
 obj-$(CONFIG_PHY_MESON_GXL_USB3)	+= phy-meson-gxl-usb3.o
+obj-$(CONFIG_PHY_MESON_G12A_USB3_PCIE)	+= phy-meson-g12a-usb3-pcie.o
diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
new file mode 100644
index 000000000000..6233a7979a93
--- /dev/null
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb3-pcie.c
@@ -0,0 +1,413 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Amlogic G12A USB3 + PCIE Combo PHY driver
+ *
+ * Copyright (C) 2017 Amlogic, Inc. All rights reserved
+ * Copyright (C) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/phy/phy.h>
+
+#define PHY_R0							0x00
+	#define PHY_R0_PCIE_POWER_STATE				GENMASK(4, 0)
+	#define PHY_R0_PCIE_USB3_SWITCH				GENMASK(6, 5)
+
+#define PHY_R1							0x04
+	#define PHY_R1_PHY_TX1_TERM_OFFSET			GENMASK(4, 0)
+	#define PHY_R1_PHY_TX0_TERM_OFFSET			GENMASK(9, 5)
+	#define PHY_R1_PHY_RX1_EQ				GENMASK(12, 10)
+	#define PHY_R1_PHY_RX0_EQ				GENMASK(15, 13)
+	#define PHY_R1_PHY_LOS_LEVEL				GENMASK(20, 16)
+	#define PHY_R1_PHY_LOS_BIAS				GENMASK(23, 21)
+	#define PHY_R1_PHY_REF_CLKDIV2				BIT(24)
+	#define PHY_R1_PHY_MPLL_MULTIPLIER			GENMASK(31, 25)
+
+#define PHY_R2							0x08
+	#define PHY_R2_PCS_TX_DEEMPH_GEN2_6DB			GENMASK(5, 0)
+	#define PHY_R2_PCS_TX_DEEMPH_GEN2_3P5DB			GENMASK(11, 6)
+	#define PHY_R2_PCS_TX_DEEMPH_GEN1			GENMASK(17, 12)
+	#define PHY_R2_PHY_TX_VBOOST_LVL			GENMASK(20, 18)
+
+#define PHY_R4							0x10
+	#define PHY_R4_PHY_CR_WRITE				BIT(0)
+	#define PHY_R4_PHY_CR_READ				BIT(1)
+	#define PHY_R4_PHY_CR_DATA_IN				GENMASK(17, 2)
+	#define PHY_R4_PHY_CR_CAP_DATA				BIT(18)
+	#define PHY_R4_PHY_CR_CAP_ADDR				BIT(19)
+
+#define PHY_R5							0x14
+	#define PHY_R5_PHY_CR_DATA_OUT				GENMASK(15, 0)
+	#define PHY_R5_PHY_CR_ACK				BIT(16)
+	#define PHY_R5_PHY_BS_OUT				BIT(17)
+
+struct phy_g12a_usb3_pcie_priv {
+	struct regmap		*regmap;
+	struct regmap		*regmap_cr;
+	struct clk		*clk_ref;
+	struct reset_control	*reset;
+	struct phy		*phy;
+	unsigned int		mode;
+};
+
+static const struct regmap_config phy_g12a_usb3_pcie_regmap_conf = {
+	.reg_bits = 8,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = PHY_R5,
+};
+
+static int phy_g12a_usb3_pcie_cr_bus_addr(struct phy_g12a_usb3_pcie_priv *priv,
+					  unsigned int addr)
+{
+	unsigned int val, reg;
+	int ret;
+
+	reg = FIELD_PREP(PHY_R4_PHY_CR_DATA_IN, addr);
+
+	regmap_write(priv->regmap, PHY_R4, reg);
+	regmap_write(priv->regmap, PHY_R4, reg);
+
+	regmap_write(priv->regmap, PHY_R4, reg | PHY_R4_PHY_CR_CAP_ADDR);
+
+	ret = regmap_read_poll_timeout(priv->regmap, PHY_R5, val,
+				       (val & PHY_R5_PHY_CR_ACK),
+				       5, 1000);
+	if (ret)
+		return ret;
+
+	regmap_write(priv->regmap, PHY_R4, reg);
+
+	ret = regmap_read_poll_timeout(priv->regmap, PHY_R5, val,
+				       !(val & PHY_R5_PHY_CR_ACK),
+				       5, 1000);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int phy_g12a_usb3_pcie_cr_bus_read(void *context, unsigned int addr,
+					  unsigned int *data)
+{
+	struct phy_g12a_usb3_pcie_priv *priv = context;
+	unsigned int val;
+	int ret;
+
+	ret = phy_g12a_usb3_pcie_cr_bus_addr(priv, addr);
+	if (ret)
+		return ret;
+
+	regmap_write(priv->regmap, PHY_R4, 0);
+	regmap_write(priv->regmap, PHY_R4, PHY_R4_PHY_CR_READ);
+
+	ret = regmap_read_poll_timeout(priv->regmap, PHY_R5, val,
+				       (val & PHY_R5_PHY_CR_ACK),
+				       5, 1000);
+	if (ret)
+		return ret;
+
+	*data = FIELD_GET(PHY_R5_PHY_CR_DATA_OUT, val);
+
+	regmap_write(priv->regmap, PHY_R4, 0);
+
+	ret = regmap_read_poll_timeout(priv->regmap, PHY_R5, val,
+				       !(val & PHY_R5_PHY_CR_ACK),
+				       5, 1000);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int phy_g12a_usb3_pcie_cr_bus_write(void *context, unsigned int addr,
+					   unsigned int data)
+{
+	struct phy_g12a_usb3_pcie_priv *priv = context;
+	unsigned int val, reg;
+	int ret;
+
+	ret = phy_g12a_usb3_pcie_cr_bus_addr(priv, addr);
+	if (ret)
+		return ret;
+
+	reg = FIELD_PREP(PHY_R4_PHY_CR_DATA_IN, data);
+
+	regmap_write(priv->regmap, PHY_R4, reg);
+	regmap_write(priv->regmap, PHY_R4, reg);
+
+	regmap_write(priv->regmap, PHY_R4, reg | PHY_R4_PHY_CR_CAP_DATA);
+
+	ret = regmap_read_poll_timeout(priv->regmap, PHY_R5, val,
+				       (val & PHY_R5_PHY_CR_ACK),
+				       5, 1000);
+	if (ret)
+		return ret;
+
+	regmap_write(priv->regmap, PHY_R4, reg);
+
+	ret = regmap_read_poll_timeout(priv->regmap, PHY_R5, val,
+				       (val & PHY_R5_PHY_CR_ACK) == 0,
+				       5, 1000);
+	if (ret)
+		return ret;
+
+	regmap_write(priv->regmap, PHY_R4, reg);
+
+	regmap_write(priv->regmap, PHY_R4, reg | PHY_R4_PHY_CR_WRITE);
+
+	ret = regmap_read_poll_timeout(priv->regmap, PHY_R5, val,
+				       (val & PHY_R5_PHY_CR_ACK),
+				       5, 1000);
+	if (ret)
+		return ret;
+
+	regmap_write(priv->regmap, PHY_R4, reg);
+
+	ret = regmap_read_poll_timeout(priv->regmap, PHY_R5, val,
+				       (val & PHY_R5_PHY_CR_ACK) == 0,
+				       5, 1000);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct regmap_config phy_g12a_usb3_pcie_cr_regmap_conf = {
+	.reg_bits = 16,
+	.val_bits = 16,
+	.reg_read = phy_g12a_usb3_pcie_cr_bus_read,
+	.reg_write = phy_g12a_usb3_pcie_cr_bus_write,
+	.max_register = 0xffff,
+	.fast_io = true,
+};
+
+static int phy_g12a_usb3_init(struct phy *phy)
+{
+	struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
+	int data, ret;
+
+	/* Switch PHY to USB3 */
+	/* TODO figure out how to handle when PCIe was set in the bootloader */
+	regmap_update_bits(priv->regmap, PHY_R0,
+			   PHY_R0_PCIE_USB3_SWITCH,
+			   PHY_R0_PCIE_USB3_SWITCH);
+
+	/*
+	 * WORKAROUND: There is SSPHY suspend bug due to
+	 * which USB enumerates
+	 * in HS mode instead of SS mode. Workaround it by asserting
+	 * LANE0.TX_ALT_BLOCK.EN_ALT_BUS to enable TX to use alt bus
+	 * mode
+	 */
+	ret = regmap_update_bits(priv->regmap_cr, 0x102d, BIT(7), BIT(7));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap_cr, 0x1010, 0xff0, 20);
+	if (ret)
+		return ret;
+
+	/*
+	 * Fix RX Equalization setting as follows
+	 * LANE0.RX_OVRD_IN_HI. RX_EQ_EN set to 0
+	 * LANE0.RX_OVRD_IN_HI.RX_EQ_EN_OVRD set to 1
+	 * LANE0.RX_OVRD_IN_HI.RX_EQ set to 3
+	 * LANE0.RX_OVRD_IN_HI.RX_EQ_OVRD set to 1
+	 */
+	ret = regmap_read(priv->regmap_cr, 0x1006, &data);
+	if (ret)
+		return ret;
+
+	data &= ~BIT(6);
+	data |= BIT(7);
+	data &= ~(0x7 << 8);
+	data |= (0x3 << 8);
+	data |= (1 << 11);
+	ret = regmap_write(priv->regmap_cr, 0x1006, data);
+	if (ret)
+		return ret;
+
+	/*
+	 * Set EQ and TX launch amplitudes as follows
+	 * LANE0.TX_OVRD_DRV_LO.PREEMPH set to 22
+	 * LANE0.TX_OVRD_DRV_LO.AMPLITUDE set to 127
+	 * LANE0.TX_OVRD_DRV_LO.EN set to 1.
+	 */
+	ret = regmap_read(priv->regmap_cr, 0x1002, &data);
+	if (ret)
+		return ret;
+
+	data &= ~0x3f80;
+	data |= (0x16 << 7);
+	data &= ~0x7f;
+	data |= (0x7f | BIT(14));
+	ret = regmap_write(priv->regmap_cr, 0x1002, data);
+	if (ret)
+		return ret;
+
+	/* MPLL_LOOP_CTL.PROP_CNTRL = 8 */
+	ret = regmap_update_bits(priv->regmap_cr, 0x30, 0xf << 4, 8 << 4);
+	if (ret)
+		return ret;
+
+	regmap_update_bits(priv->regmap, PHY_R2,
+			PHY_R2_PHY_TX_VBOOST_LVL,
+			FIELD_PREP(PHY_R2_PHY_TX_VBOOST_LVL, 0x4));
+
+	regmap_update_bits(priv->regmap, PHY_R1,
+			PHY_R1_PHY_LOS_BIAS | PHY_R1_PHY_LOS_LEVEL,
+			FIELD_PREP(PHY_R1_PHY_LOS_BIAS, 4) |
+			FIELD_PREP(PHY_R1_PHY_LOS_LEVEL, 9));
+
+	return 0;
+}
+
+static int phy_g12a_usb3_pcie_init(struct phy *phy)
+{
+	struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = reset_control_reset(priv->reset);
+	if (ret)
+		return ret;
+
+	if (priv->mode == PHY_TYPE_USB3)
+		return phy_g12a_usb3_init(phy);
+
+	/* Power UP PCIE */
+	/* TODO figure out when the bootloader has set USB3 mode before */
+	regmap_update_bits(priv->regmap, PHY_R0,
+			   PHY_R0_PCIE_POWER_STATE,
+			   FIELD_PREP(PHY_R0_PCIE_POWER_STATE, 0x1c));
+
+	return 0;
+}
+
+static int phy_g12a_usb3_pcie_exit(struct phy *phy)
+{
+	struct phy_g12a_usb3_pcie_priv *priv = phy_get_drvdata(phy);
+
+	return reset_control_reset(priv->reset);
+}
+
+static struct phy *phy_g12a_usb3_pcie_xlate(struct device *dev,
+					    struct of_phandle_args *args)
+{
+	struct phy_g12a_usb3_pcie_priv *priv = dev_get_drvdata(dev);
+	unsigned int mode;
+
+	if (args->args_count < 1) {
+		dev_err(dev, "invalid number of arguments\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	mode = args->args[0];
+
+	if (mode != PHY_TYPE_USB3 && mode != PHY_TYPE_PCIE) {
+		dev_err(dev, "invalid phy mode select argument\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	priv->mode = mode;
+
+	return priv->phy;
+}
+
+static const struct phy_ops phy_g12a_usb3_pcie_ops = {
+	.init		= phy_g12a_usb3_pcie_init,
+	.exit		= phy_g12a_usb3_pcie_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int phy_g12a_usb3_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct phy_g12a_usb3_pcie_priv *priv;
+	struct resource *res;
+	struct phy_provider *phy_provider;
+	void __iomem *base;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->regmap = devm_regmap_init_mmio(dev, base,
+					     &phy_g12a_usb3_pcie_regmap_conf);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->regmap_cr = devm_regmap_init(dev, NULL, priv,
+					   &phy_g12a_usb3_pcie_cr_regmap_conf);
+	if (IS_ERR(priv->regmap_cr))
+		return PTR_ERR(priv->regmap_cr);
+
+	priv->clk_ref = devm_clk_get(dev, "ref_clk");
+	if (IS_ERR(priv->clk_ref))
+		return PTR_ERR(priv->clk_ref);
+
+	ret = clk_prepare_enable(priv->clk_ref);
+	if (ret)
+		goto err_disable_clk_ref;
+
+	priv->reset = devm_reset_control_array_get(dev, false, false);
+	if (IS_ERR(priv->reset))
+		return PTR_ERR(priv->reset);
+
+	priv->phy = devm_phy_create(dev, np, &phy_g12a_usb3_pcie_ops);
+	if (IS_ERR(priv->phy)) {
+		ret = PTR_ERR(priv->phy);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "failed to create PHY\n");
+
+		return ret;
+	}
+
+	phy_set_drvdata(priv->phy, priv);
+	dev_set_drvdata(dev, priv);
+
+	phy_provider = devm_of_phy_provider_register(dev,
+						     phy_g12a_usb3_pcie_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+
+err_disable_clk_ref:
+	clk_disable_unprepare(priv->clk_ref);
+
+	return ret;
+}
+
+static const struct of_device_id phy_g12a_usb3_pcie_of_match[] = {
+	{ .compatible = "amlogic,g12a-usb3-pcie-phy", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, phy_g12a_usb3_pcie_of_match);
+
+static struct platform_driver phy_g12a_usb3_pcie_driver = {
+	.probe	= phy_g12a_usb3_pcie_probe,
+	.driver	= {
+		.name		= "phy-g12a-usb3-pcie",
+		.of_match_table	= phy_g12a_usb3_pcie_of_match,
+	},
+};
+module_platform_driver(phy_g12a_usb3_pcie_driver);
+
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_DESCRIPTION("Amlogic G12A USB3 + PCIE Combo PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
