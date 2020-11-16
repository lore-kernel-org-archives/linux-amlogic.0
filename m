Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB66C5519F
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:17:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2472320B80
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 10:17:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="emxgKfLD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mBcrxZHq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2472320B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s1LVLa5fHVLyMvjXv9+OfmcdiDTYKZSZD9G16L+OfQM=; b=emxgKfLDzZzdLD6nLEgjC10UG
	o1RheWPlR84ge19/8fJ1XAq/W2zFZEb6QLAVQ1y0OpXqY7+FQkgECRvSb/AhtUyqFel2Z1JCSt5Jz
	pyT8DSV09fg9dif4ffh+HA2MYYPn2ynPrvH+woOhrMiXU8Q+7+o4huLOWd6fx8g2yS1p3fjhduYU/
	oGYQuKLlYiLFO8FKz3g7GkvhrY4z9umj4KwwEoCunxBMySm3HhZ1fYkldXydXYN25jxTvXbOaBxRf
	CP2n97gTSbFG9GQwmZO9xsQ0alGNGgnPRBrV4a/k8PAi/PT8pImoHJQi4A1jOoe6sYtlltum5BMNo
	fpQ+e2vhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kebZP-0000lQ-5J; Mon, 16 Nov 2020 10:17:11 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kebZA-0000g9-Kc
 for linux-amlogic@lists.infradead.org; Mon, 16 Nov 2020 10:16:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id k2so18085487wrx.2
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Nov 2020 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jqj+wd82SY1mEpUhzqHtNGeU29Us2O77ZilRz3fNJ3M=;
 b=mBcrxZHqzrVqiP8+Lkhkww3v1UytB3wXlBk1VdMRXuzXC/2SmgR9/bpvObG3xJRV9x
 lEUB7xQh0B3yOxPCCyHvxYbH0FJA4a/e/UBM4rNXlTXHXnOi4wwbGVuZlXqgI5azEKRB
 iVecSzVrlSD66rbcpBJEGDNSY/GV4XN+1ypYhI5JqaEyjeUwGkyqt0QXV/XJZdmuqr0N
 XnFPP/wD06fx77kquV9yqx5S6GMfS89SDrYW19WjY566VZ7QVulNg64Cncc/HGkaxA8E
 OdZUeVCTS/jLhOLz+tuflv+8uYrMnMY/nPvgFy1KljXrCVQZpJLJC7EjLlHebstGwQPp
 p00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jqj+wd82SY1mEpUhzqHtNGeU29Us2O77ZilRz3fNJ3M=;
 b=W1Aj4uVt8fpoiBM4YxVFYrJzL6Htc2qj7K1xM175NsCchzYlVm/DdqZ89lz8EqSLLT
 pc0BvBBsJRNhxcSm4pRF/0B3PxnArO6ppxf6Hbf9yBDgRtkVIM09AlotwQY3MxRau/wD
 XsUjZx8a1Q8WGwnb9sJ8NX+1mmhuvwSZnmECn3/hV+HkA2RLcSWUJuJwN31RG30Q0b54
 2MePRDz8tCx2mqwJE9VROXtMfvv/NoR6sOViLuNRkuSL1t9qixHgFwHN2riK+Jkgtx/6
 4cNg0Q8cnAeh0VJims0zGLtejlPZl9Tju7417vtz2bsEef+AYeNtgB58Kh7lLCZB+oXC
 2s8Q==
X-Gm-Message-State: AOAM531T5BGTn0zxdPbMJZqLQgMEqiS7zH6mc9p2rcnBxSzTu63bl2c4
 HG6f5AG2sDOSo8RNrfZmJ+hMLQ==
X-Google-Smtp-Source: ABdhPJzzVYdy8A+ndHtt4ursjCxT4/wyXBcOB3iw2mPmXmx/6Abv7v3El+Hq0/2lY54xhByb+FlFVQ==
X-Received: by 2002:adf:9163:: with SMTP id j90mr17650311wrj.323.1605521814940; 
 Mon, 16 Nov 2020 02:16:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:edb9:72a:9e35:6eb])
 by smtp.gmail.com with ESMTPSA id
 c17sm22265131wro.19.2020.11.16.02.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 02:16:54 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: devicetree@vger.kernel.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v3 3/3] phy: amlogic: phy-meson-axg-mipi-pcie-analog:
 add support for MIPI DSI analog
Date: Mon, 16 Nov 2020 11:16:47 +0100
Message-Id: <20201116101647.73448-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116101647.73448-1-narmstrong@baylibre.com>
References: <20201116101647.73448-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_051656_777346_DF457499 
X-CRM114-Status: GOOD (  23.50  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The AXG Analog MIPI-DSI PHY also provides functions to the PCIe PHY,
thus we need to have inclusive support for both interfaces at runtime.

This fixes the regmap get from parent node, removes cell param
to select a mode and implement runtime configuration & power on/off
for both functions since they are not exclusive.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/phy/amlogic/Kconfig                   |   1 +
 .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 204 ++++++++++++------
 2 files changed, 136 insertions(+), 69 deletions(-)

diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
index 99e8a4c7f1f3..db5d0cd757e3 100644
--- a/drivers/phy/amlogic/Kconfig
+++ b/drivers/phy/amlogic/Kconfig
@@ -66,6 +66,7 @@ config PHY_MESON_AXG_MIPI_PCIE_ANALOG
 	depends on OF && (ARCH_MESON || COMPILE_TEST)
 	select GENERIC_PHY
 	select REGMAP_MMIO
+	select GENERIC_PHY_MIPI_DPHY
 	help
 	  Enable this to support the Meson MIPI + PCIE analog PHY
 	  found in Meson AXG SoCs.
diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
index 1431cbf885e1..6eb21551bdd9 100644
--- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
+++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
@@ -4,9 +4,13 @@
  *
  * Copyright (C) 2019 Remi Pommarel <repk@triplefau.lt>
  */
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/regmap.h>
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/phy/phy.h>
 
@@ -14,10 +18,10 @@
 #define		HHI_MIPI_CNTL0_COMMON_BLOCK	GENMASK(31, 28)
 #define		HHI_MIPI_CNTL0_ENABLE		BIT(29)
 #define		HHI_MIPI_CNTL0_BANDGAP		BIT(26)
-#define		HHI_MIPI_CNTL0_DECODE_TO_RTERM	GENMASK(15, 12)
-#define		HHI_MIPI_CNTL0_OUTPUT_EN	BIT(3)
+#define		HHI_MIPI_CNTL0_DIF_REF_CTL1	GENMASK(25, 16)
+#define		HHI_MIPI_CNTL0_DIF_REF_CTL0	GENMASK(15, 0)
 
-#define HHI_MIPI_CNTL1 0x01
+#define HHI_MIPI_CNTL1 0x04
 #define		HHI_MIPI_CNTL1_CH0_CML_PDR_EN	BIT(12)
 #define		HHI_MIPI_CNTL1_LP_ABILITY	GENMASK(5, 4)
 #define		HHI_MIPI_CNTL1_LP_RESISTER	BIT(3)
@@ -25,100 +29,170 @@
 #define		HHI_MIPI_CNTL1_INPUT_SEL	BIT(1)
 #define		HHI_MIPI_CNTL1_PRBS7_EN		BIT(0)
 
-#define HHI_MIPI_CNTL2 0x02
+#define HHI_MIPI_CNTL2 0x08
 #define		HHI_MIPI_CNTL2_CH_PU		GENMASK(31, 25)
 #define		HHI_MIPI_CNTL2_CH_CTL		GENMASK(24, 19)
 #define		HHI_MIPI_CNTL2_CH0_DIGDR_EN	BIT(18)
 #define		HHI_MIPI_CNTL2_CH_DIGDR_EN	BIT(17)
 #define		HHI_MIPI_CNTL2_LPULPS_EN	BIT(16)
-#define		HHI_MIPI_CNTL2_CH_EN(n)		BIT(15 - (n))
+#define		HHI_MIPI_CNTL2_CH_EN		GENMASK(15, 11)
 #define		HHI_MIPI_CNTL2_CH0_LP_CTL	GENMASK(10, 1)
 
+#define DSI_LANE_0              (1 << 4)
+#define DSI_LANE_1              (1 << 3)
+#define DSI_LANE_CLK            (1 << 2)
+#define DSI_LANE_2              (1 << 1)
+#define DSI_LANE_3              (1 << 0)
+#define DSI_LANE_MASK		(0x1F)
+
 struct phy_axg_mipi_pcie_analog_priv {
 	struct phy *phy;
-	unsigned int mode;
 	struct regmap *regmap;
+	bool dsi_configured;
+	bool dsi_enabled;
+	bool powered;
+	struct phy_configure_opts_mipi_dphy config;
 };
 
-static const struct regmap_config phy_axg_mipi_pcie_analog_regmap_conf = {
-	.reg_bits = 8,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.max_register = HHI_MIPI_CNTL2,
-};
+static void phy_bandgap_enable(struct phy_axg_mipi_pcie_analog_priv *priv)
+{
+	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
+			HHI_MIPI_CNTL0_BANDGAP, HHI_MIPI_CNTL0_BANDGAP);
 
-static int phy_axg_mipi_pcie_analog_power_on(struct phy *phy)
+	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
+			HHI_MIPI_CNTL0_ENABLE, HHI_MIPI_CNTL0_ENABLE);
+}
+
+static void phy_bandgap_disable(struct phy_axg_mipi_pcie_analog_priv *priv)
 {
-	struct phy_axg_mipi_pcie_analog_priv *priv = phy_get_drvdata(phy);
+	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
+			HHI_MIPI_CNTL0_BANDGAP, 0);
+	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
+			HHI_MIPI_CNTL0_ENABLE, 0);
+}
 
-	/* MIPI not supported yet */
-	if (priv->mode != PHY_TYPE_PCIE)
-		return -EINVAL;
+static void phy_dsi_analog_enable(struct phy_axg_mipi_pcie_analog_priv *priv)
+{
+	u32 reg;
 
 	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
-			   HHI_MIPI_CNTL0_BANDGAP, HHI_MIPI_CNTL0_BANDGAP);
+			   HHI_MIPI_CNTL0_DIF_REF_CTL1,
+			   FIELD_PREP(HHI_MIPI_CNTL0_DIF_REF_CTL1, 0x1b8));
+	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
+			   BIT(31), BIT(31));
+	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
+			   HHI_MIPI_CNTL0_DIF_REF_CTL0,
+			   FIELD_PREP(HHI_MIPI_CNTL0_DIF_REF_CTL0, 0x8));
+
+	regmap_write(priv->regmap, HHI_MIPI_CNTL1, 0x001e);
+
+	regmap_write(priv->regmap, HHI_MIPI_CNTL2,
+		     (0x26e0 << 16) | (0x459 << 0));
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
+	priv->dsi_enabled = true;
+}
 
+static void phy_dsi_analog_disable(struct phy_axg_mipi_pcie_analog_priv *priv)
+{
 	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
-			   HHI_MIPI_CNTL0_ENABLE, HHI_MIPI_CNTL0_ENABLE);
-	return 0;
+			HHI_MIPI_CNTL0_DIF_REF_CTL1,
+			FIELD_PREP(HHI_MIPI_CNTL0_DIF_REF_CTL1, 0));
+	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0, BIT(31), 0);
+	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
+			HHI_MIPI_CNTL0_DIF_REF_CTL1, 0);
+
+	regmap_write(priv->regmap, HHI_MIPI_CNTL1, 0x6);
+
+	regmap_write(priv->regmap, HHI_MIPI_CNTL2, 0x00200000);
+
+	priv->dsi_enabled = false;
 }
 
-static int phy_axg_mipi_pcie_analog_power_off(struct phy *phy)
+static int phy_axg_mipi_pcie_analog_configure(struct phy *phy,
+					      union phy_configure_opts *opts)
 {
 	struct phy_axg_mipi_pcie_analog_priv *priv = phy_get_drvdata(phy);
+	int ret;
 
-	/* MIPI not supported yet */
-	if (priv->mode != PHY_TYPE_PCIE)
-		return -EINVAL;
+	ret = phy_mipi_dphy_config_validate(&opts->mipi_dphy);
+	if (ret)
+		return ret;
+
+	memcpy(&priv->config, opts, sizeof(priv->config));
+
+	priv->dsi_configured = true;
+
+	/* If PHY was already powered on, setup the DSI analog part */
+	if (priv->powered) {
+		/* If reconfiguring, disable & reconfigure */
+		if (priv->dsi_enabled)
+			phy_dsi_analog_disable(priv);
+
+		usleep_range(100, 200);
+
+		phy_dsi_analog_enable(priv);
+	}
 
-	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
-			   HHI_MIPI_CNTL0_BANDGAP, 0);
-	regmap_update_bits(priv->regmap, HHI_MIPI_CNTL0,
-			   HHI_MIPI_CNTL0_ENABLE, 0);
 	return 0;
 }
 
-static int phy_axg_mipi_pcie_analog_init(struct phy *phy)
+static int phy_axg_mipi_pcie_analog_power_on(struct phy *phy)
 {
+	struct phy_axg_mipi_pcie_analog_priv *priv = phy_get_drvdata(phy);
+
+	phy_bandgap_enable(priv);
+
+	if (priv->dsi_configured)
+		phy_dsi_analog_enable(priv);
+
+	priv->powered = true;
+
 	return 0;
 }
 
-static int phy_axg_mipi_pcie_analog_exit(struct phy *phy)
+static int phy_axg_mipi_pcie_analog_power_off(struct phy *phy)
 {
+	struct phy_axg_mipi_pcie_analog_priv *priv = phy_get_drvdata(phy);
+
+	phy_bandgap_disable(priv);
+
+	if (priv->dsi_enabled)
+		phy_dsi_analog_disable(priv);
+
+	priv->powered = false;
+
 	return 0;
 }
 
 static const struct phy_ops phy_axg_mipi_pcie_analog_ops = {
-	.init = phy_axg_mipi_pcie_analog_init,
-	.exit = phy_axg_mipi_pcie_analog_exit,
+	.configure = phy_axg_mipi_pcie_analog_configure,
 	.power_on = phy_axg_mipi_pcie_analog_power_on,
 	.power_off = phy_axg_mipi_pcie_analog_power_off,
 	.owner = THIS_MODULE,
 };
 
-static struct phy *phy_axg_mipi_pcie_analog_xlate(struct device *dev,
-						  struct of_phandle_args *args)
-{
-	struct phy_axg_mipi_pcie_analog_priv *priv = dev_get_drvdata(dev);
-	unsigned int mode;
-
-	if (args->args_count != 1) {
-		dev_err(dev, "invalid number of arguments\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	mode = args->args[0];
-
-	/* MIPI mode is not supported yet */
-	if (mode != PHY_TYPE_PCIE) {
-		dev_err(dev, "invalid phy mode select argument\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	priv->mode = mode;
-	return priv->phy;
-}
-
 static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
 {
 	struct phy_provider *phy;
@@ -126,27 +200,20 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
 	struct phy_axg_mipi_pcie_analog_priv *priv;
 	struct device_node *np = dev->of_node;
 	struct regmap *map;
-	struct resource *res;
-	void __iomem *base;
 	int ret;
 
 	priv = devm_kmalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(base)) {
-		dev_err(dev, "failed to get regmap base\n");
-		return PTR_ERR(base);
-	}
-
-	map = devm_regmap_init_mmio(dev, base,
-				    &phy_axg_mipi_pcie_analog_regmap_conf);
+	/* Get the hhi system controller node */
+	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
 	if (IS_ERR(map)) {
-		dev_err(dev, "failed to get HHI regmap\n");
+		dev_err(dev,
+			"failed to get HHI regmap\n");
 		return PTR_ERR(map);
 	}
+
 	priv->regmap = map;
 
 	priv->phy = devm_phy_create(dev, np, &phy_axg_mipi_pcie_analog_ops);
@@ -160,8 +227,7 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
 	phy_set_drvdata(priv->phy, priv);
 	dev_set_drvdata(dev, priv);
 
-	phy = devm_of_phy_provider_register(dev,
-					    phy_axg_mipi_pcie_analog_xlate);
+	phy = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	return PTR_ERR_OR_ZERO(phy);
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
