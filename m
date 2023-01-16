Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B69C1C54EBE
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Jan 2023 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=olx5ZoYjTxIUPd6nDPRB+OUop40ZRTsQlPRzHQflNOo=; b=z7Oa+duRNbw12V
	Z0ldHOXdPZX2u8TBjsxljSYcr17cOCEih+DadhIgU0xtmK2EMmDy7OBTYRlLR3WFx1uJiVerOOXKX
	NmGuSOEF3CgOtpVQdKHh5gn9RuHo0Bl8mqNoYQ4GJwMdeFm/MpNir6WsSJv+dNDR+3FXaolia7dHp
	8dhDbeEfMv1kpYW46kH+1o6nmUTWPg+etLrir0wGvUx+p2SLRtqkY74YW3P9p/pTePSVejbsfSGah
	VBwkNAAfRdyfqpwMQN86NFMJfuuGmXcujHtcIaUDJGEuiWWBHzlyB0Zp0J6RffGg2gJ2Neqy88gJj
	oUm07s7j7U9qVDvpnytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLby-009J7s-1E; Mon, 16 Jan 2023 09:17:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHLbu-009J4d-3v
	for linux-amlogic@lists.infradead.org; Mon, 16 Jan 2023 09:16:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so18287645wma.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Jan 2023 01:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgMVlL2MF8oJlM5fHKB3o7u/n5s4tpW/nx3DYglTQ3w=;
        b=Lr4KnPV/ZIdVdUiIdzHEdrmaBFGlMJloHnaJrFmO/qO3VrpXI4HlI7LXFihXAyOiFt
         j0S0HNEvZc8XljiIxnte4D/7wNW6aT0pCuK3IuBSPOpcJYflJpJXHuZfJ9llVWviSmZ8
         Km5EQeN8BjjFJRcy4AaP3VryWUiUEx2j5pIkudJ/NK3QlS0QOivUoTfUh5XhWNtylr7p
         U68c68omVyvLRE97q4nsbw8KZWlUuwX0fZp7+sPDPk8lb800d3tH/nKWmT5F7UNbD7tg
         jGIY2PwRYdE28wRkg6y4eTdbGmlhqWk+GuiebLPxiLWx32Nt6Nb0n4D/TBmBZy49nyPR
         pyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgMVlL2MF8oJlM5fHKB3o7u/n5s4tpW/nx3DYglTQ3w=;
        b=q0W4dKStF2DhNDW3KJ698aSnfKfxMHaD0XubaleKdjwrR/zegbEu3SaeUPpCDQbWqQ
         fofHSokA7sPgtQzt7DRtUG+84scSf+USgp0+rntFpZ0aAuvobjPeB0w5x9UV6zogst65
         sdnxvc4AWnt+f7JwbviRDI7oY07iUSC8KqLSJzf2LkTLUeBLTuNxLn41zMMgO6D/TAEF
         Eoh1f2dgDstWhk8q8UL1m9GayHPDhLuNJITnO1UetYXITt1H9kMdc0ZddlJ/A9j5VSpb
         rKGzZSJnyoPWPSOV5w3eXDGgsW6nV7E5EeDaVpRfp3hvV2XTScuVSAufbPvHngDzzWaF
         59VQ==
X-Gm-Message-State: AFqh2krIIbeCDzIpJJHsmeljc6gOWu1R4NuKhrDOuDeNlUSpJH07D1qi
	zIhuYqUKcYqX74E8MOVttS3cIQ==
X-Google-Smtp-Source: AMrXdXvOiiNUcVFngBw4gAvrjG+E6mQhC5DXwRwZ8wY63DLaMVfmjULbmGpFfCrm6Ii7+EGmgSNykQ==
X-Received: by 2002:a05:600c:1e8c:b0:3d6:2952:679b with SMTP id be12-20020a05600c1e8c00b003d62952679bmr65977500wmb.34.1673860617638;
        Mon, 16 Jan 2023 01:16:57 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id h19-20020a05600c351300b003d9a86a13bfsm35923491wmq.28.2023.01.16.01.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 01:16:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Da Xue <da@lessconfused.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/2] net: mdio: add amlogic gxl mdio mux support
Date: Mon, 16 Jan 2023 10:16:36 +0100
Message-Id: <20230116091637.272923-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116091637.272923-1-jbrunet@baylibre.com>
References: <20230116091637.272923-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_011658_240538_12170233 
X-CRM114-Status: GOOD (  21.77  )
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

Add support for the mdio mux and internal phy glue of the GXL SoC
family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/mdio/Kconfig              |  11 ++
 drivers/net/mdio/Makefile             |   1 +
 drivers/net/mdio/mdio-mux-meson-gxl.c | 160 ++++++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 drivers/net/mdio/mdio-mux-meson-gxl.c

diff --git a/drivers/net/mdio/Kconfig b/drivers/net/mdio/Kconfig
index bfa16826a6e1..80f3e10b1be1 100644
--- a/drivers/net/mdio/Kconfig
+++ b/drivers/net/mdio/Kconfig
@@ -215,6 +215,17 @@ config MDIO_BUS_MUX_MESON_G12A
 	  the amlogic g12a SoC. The multiplexers connects either the external
 	  or the internal MDIO bus to the parent bus.
 
+config MDIO_BUS_MUX_MESON_GXL
+	tristate "Amlogic GXL based MDIO bus multiplexer"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on OF_MDIO && HAS_IOMEM && COMMON_CLK
+	select MDIO_BUS_MUX
+	default m if ARCH_MESON
+	help
+	  This module provides a driver for the MDIO multiplexer/glue of
+	  the amlogic gxl SoC. The multiplexers connects either the external
+	  or the internal MDIO bus to the parent bus.
+
 config MDIO_BUS_MUX_BCM6368
 	tristate "Broadcom BCM6368 MDIO bus multiplexers"
 	depends on OF && OF_MDIO && (BMIPS_GENERIC || COMPILE_TEST)
diff --git a/drivers/net/mdio/Makefile b/drivers/net/mdio/Makefile
index 15f8dc4042ce..7d4cb4c11e4e 100644
--- a/drivers/net/mdio/Makefile
+++ b/drivers/net/mdio/Makefile
@@ -28,5 +28,6 @@ obj-$(CONFIG_MDIO_BUS_MUX_BCM6368)	+= mdio-mux-bcm6368.o
 obj-$(CONFIG_MDIO_BUS_MUX_BCM_IPROC)	+= mdio-mux-bcm-iproc.o
 obj-$(CONFIG_MDIO_BUS_MUX_GPIO)		+= mdio-mux-gpio.o
 obj-$(CONFIG_MDIO_BUS_MUX_MESON_G12A)	+= mdio-mux-meson-g12a.o
+obj-$(CONFIG_MDIO_BUS_MUX_MESON_GXL)	+= mdio-mux-meson-gxl.o
 obj-$(CONFIG_MDIO_BUS_MUX_MMIOREG) 	+= mdio-mux-mmioreg.o
 obj-$(CONFIG_MDIO_BUS_MUX_MULTIPLEXER) 	+= mdio-mux-multiplexer.o
diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c b/drivers/net/mdio/mdio-mux-meson-gxl.c
new file mode 100644
index 000000000000..205095d845ea
--- /dev/null
+++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2022 Baylibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mdio-mux.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define ETH_REG2		0x0
+#define  REG2_PHYID		GENMASK(21, 0)
+#define   EPHY_GXL_ID		0x110181
+#define  REG2_LEDACT		GENMASK(23, 22)
+#define  REG2_LEDLINK		GENMASK(25, 24)
+#define  REG2_DIV4SEL		BIT(27)
+#define  REG2_ADCBYPASS		BIT(30)
+#define  REG2_CLKINSEL		BIT(31)
+#define ETH_REG3		0x4
+#define  REG3_ENH		BIT(3)
+#define  REG3_CFGMODE		GENMASK(6, 4)
+#define  REG3_AUTOMDIX		BIT(7)
+#define  REG3_PHYADDR		GENMASK(12, 8)
+#define  REG3_PWRUPRST		BIT(21)
+#define  REG3_PWRDOWN		BIT(22)
+#define  REG3_LEDPOL		BIT(23)
+#define  REG3_PHYMDI		BIT(26)
+#define  REG3_CLKINEN		BIT(29)
+#define  REG3_PHYIP		BIT(30)
+#define  REG3_PHYEN		BIT(31)
+#define ETH_REG4		0x8
+#define  REG4_PWRUPRSTSIG	BIT(0)
+
+#define MESON_GXL_MDIO_EXTERNAL_ID 0
+#define MESON_GXL_MDIO_INTERNAL_ID 1
+
+struct gxl_mdio_mux {
+	void __iomem *regs;
+	void *mux_handle;
+};
+
+static int gxl_enable_internal_mdio(struct gxl_mdio_mux *priv)
+{
+	u32 val;
+
+ 	/* Setup the internal phy */
+	val = (REG3_ENH |
+	       FIELD_PREP(REG3_CFGMODE, 0x7) |
+	       REG3_AUTOMDIX |
+	       FIELD_PREP(REG3_PHYADDR, 8) |
+	       REG3_LEDPOL |
+	       REG3_PHYMDI |
+	       REG3_CLKINEN |
+	       REG3_PHYIP);
+
+	writel_relaxed(REG4_PWRUPRSTSIG, priv->regs + ETH_REG4);
+	writel_relaxed(val, priv->regs + ETH_REG3);
+	mdelay(10);
+
+	/* Set the internal phy id */
+	writel_relaxed(FIELD_PREP(REG2_PHYID, 0x110181),
+		       priv->regs + ETH_REG2);
+
+	/* Enable the internal phy */
+	val |= REG3_PHYEN;
+	writel_relaxed(val, priv->regs + ETH_REG3);
+	writel_relaxed(0, priv->regs + ETH_REG4);
+
+	/* The phy needs a bit of time to come up */
+	mdelay(10);
+
+	return 0;
+}
+
+static int gxl_enable_external_mdio(struct gxl_mdio_mux *priv)
+{
+ 	/* Reset the mdio bus mux to the external phy */
+	writel_relaxed(0, priv->regs + ETH_REG3);
+
+	return 0;
+}
+
+static int gxl_mdio_switch_fn(int current_child, int desired_child,
+			       void *data)
+{
+	struct gxl_mdio_mux *priv = dev_get_drvdata(data);
+
+	if (current_child == desired_child)
+		return 0;
+
+	switch (desired_child) {
+	case MESON_GXL_MDIO_EXTERNAL_ID:
+		return gxl_enable_external_mdio(priv);
+	case MESON_GXL_MDIO_INTERNAL_ID:
+		return gxl_enable_internal_mdio(priv);
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct of_device_id gxl_mdio_mux_match[] = {
+	{ .compatible = "amlogic,gxl-mdio-mux", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, gxl_mdio_mux_match);
+
+
+static int gxl_mdio_mux_probe(struct platform_device *pdev){
+	struct device *dev = &pdev->dev;
+	struct clk *rclk;
+	struct gxl_mdio_mux *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, priv);
+
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->regs))
+		return PTR_ERR(priv->regs);
+
+	rclk = devm_clk_get_enabled(dev, "ref");
+	if (IS_ERR(rclk))
+		return dev_err_probe(dev, PTR_ERR(rclk),
+				     "failed to get reference clock\n");
+
+	ret = mdio_mux_init(dev, dev->of_node, gxl_mdio_switch_fn,
+			    &priv->mux_handle, dev, NULL);
+	if (ret)
+		dev_err_probe(dev, ret, "mdio multiplexer init failed\n");
+
+	return ret;
+}
+
+static int gxl_mdio_mux_remove(struct platform_device *pdev)
+{
+	struct gxl_mdio_mux *priv = platform_get_drvdata(pdev);
+
+	mdio_mux_uninit(priv->mux_handle);
+
+	return 0;
+}
+
+static struct platform_driver gxl_mdio_mux_driver = {
+	.probe		= gxl_mdio_mux_probe,
+	.remove		= gxl_mdio_mux_remove,
+	.driver		= {
+		.name	= "gxl-mdio-mux",
+		.of_match_table = gxl_mdio_mux_match,
+	},
+};
+module_platform_driver(gxl_mdio_mux_driver);
+
+MODULE_DESCRIPTION("Amlogic GXL MDIO multiplexer driver");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
