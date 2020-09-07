Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3E7C433E2
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:35:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 752F7208C7
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 07:35:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VwzTjhmy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Zfur+lsu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 752F7208C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gYRJ1VISlkfWLEg7Pt2h4ZSJjR8yLDJpPbw8apMcJ4s=; b=VwzTjhmyIzTp8T7ZPVsjdPKnY
	8YNPKgNdKIhhIpD/e2ioAznhRQZu2hJoUuxIGwaa0CWVl0h9Hx87elPAm5CytLAS5JTmwCxJEdZBd
	MMZV4JA+ZUuGeDptDo9u7j4PT2HDiGojbG0WkGO9yKPiL1rWBMCZPCtkPtfoaZEtKYid7ABeCpGM0
	WF8pmfSVRcazEVaidluBka1/uHXiTOHiAy6iH8zXycHDdBb2HLO90ONz1UPF3hPjVvkPCd9RUx9TD
	pkinlXKs8tt+OhmmNtdolHLb/Af9N+8IvweboXIHE2agxwqOnit5dbZSsEkOSsPcO/kZw/r4bCAJS
	y8JL0vbYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBge-0001jM-G8; Mon, 07 Sep 2020 07:35:36 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBfJ-00010i-Iv
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 07:34:19 +0000
Received: by mail-wm1-x342.google.com with SMTP id a65so13329432wme.5
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 00:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZY9/vtbeQg63yuMK7FpENg//lQHDOvYzs9Cwbildo4=;
 b=Zfur+lsufx5IgGydbVVHXWIAP7eM8pRJkwOaUlcUfWKFyI/rHeSfoAjsT652I2QKfA
 3aTSYMon75FTVS9crPWKqiCFpkdljG90pGHZbkSRdNE5IU3+bArhX13wA+yzkiG1QWb+
 h37nRYcBAdzem/4pNgYRGzvyDJydqUJli+MUyypZBXhcRGOF/H9bRXFeM8a6znzcGGxE
 c4bE41v4LMxNvv8nqZ9MFh7FY9PsBTcSlDZb2v7ZwR9zhMmWFrz1w8K/Crbf47Hywy+u
 b54GmjT2tvOhLrrZXduFAmVOjsq8Y4Yr/jWOsd7NH8eBbJUAIgha0PoxuiT8HhBARZO8
 T6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZY9/vtbeQg63yuMK7FpENg//lQHDOvYzs9Cwbildo4=;
 b=V9v1duExxcD3XV86E7VCUeMzxea9BbmSQdCpJL84SqjsqydT1KwKmZJhm+ztcQrg3X
 hGgM3Eq0q4AN+JS85Dk/t+xLu0xncTJ4DA5gc8T/uasETBzofnSoK39wYc6RmwVG92jJ
 B1oZHEp2kDh2qxcDacFUcSwFVPQ6bdXj2aSi0OqDAHaeEUe90E+kbMlrggmohR7BIAD0
 4UXXWs9QQY5WaunpycxkOrexV8+dgyNl2Fu8v/pwYMujw1h6TOJNWqh+X7dIXZ02msOS
 sYR0avHav5ruHhaBQ3R8XhHPd4WNI6DLtouwo262d+XBrjVdcoVeCG419AyoMfzEC11z
 q7gA==
X-Gm-Message-State: AOAM533/C0238ifMGHiL87XwSAUNxCE1b78Zgya7lZFJZoMS4yFk3KpK
 gwbcZeMvbjvASkdxWzhbcxPi/g==
X-Google-Smtp-Source: ABdhPJwfJox625Vlg6qjQGnh0YucjOfMA/KIwWQDJkDOW2ewZD8Blee3DtjgX0EgPm3ddSBXEWsAhA==
X-Received: by 2002:a05:600c:2155:: with SMTP id
 v21mr20225044wml.118.1599464052120; 
 Mon, 07 Sep 2020 00:34:12 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id u66sm527689wme.1.2020.09.07.00.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 00:34:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com,
	repk@triplefau.lt
Subject: [PATCH 3/3] phy: amlogic: phy-meson-axg-mipi-pcie-analog: add support
 for MIPI DSI analog
Date: Mon,  7 Sep 2020 09:34:02 +0200
Message-Id: <20200907073402.26674-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200907073402.26674-1-narmstrong@baylibre.com>
References: <20200907073402.26674-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_033413_781518_A13C69F2 
X-CRM114-Status: GOOD (  23.34  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
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
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
