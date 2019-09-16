Return-Path: <SRS0=wpca=XL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E87C49ED7
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:52:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2069A214AF
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2019 12:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a8rVLGG9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KUcpVPrD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2069A214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Na5YXm+dAitCtV5vwgMIhhM9jYszSsdrvXb8zMMjo0k=; b=a8rVLGG9hnpblC
	1V0EtQZ9idEx8GWWPeuZbgyhIvGTAFG2UylPZitW+ITCjdHTVoQyL0h91yZjQM91J1SRzweONbKc8
	10teVbbpA5mmc+psgEhJz4ZcU+xVdZoPJaupc3FzA3W54PxbmA11K4WUNqh8FouXkfA0MneIgngYc
	whmQG2Ji3sFDBozQuv03H9NyeG++IjPv+FfjkCu+TKhL2lskHwfaTGYLAWmzFdto55fs6dxqvb1qy
	e9o+a2e7yFeGNrCoIIWXv2k6KgRWJSdFyDvaBWUipPva73jkf/ZovNw4z4CstNIZb6ANpISMQfVq6
	91Ve+dG/55xOFSBw6KDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9qU0-0003i6-Nz; Mon, 16 Sep 2019 12:51:56 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9qSb-0002o9-6E
 for linux-amlogic@lists.infradead.org; Mon, 16 Sep 2019 12:50:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id q14so38713545wrm.9
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2019 05:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l+Hjb1KZXu9Y+kfoSzj2+UuCM6t2hRuLtjmW3mDPljc=;
 b=KUcpVPrDi8HaBFJDSDar0cFx9ymhhGZ5WqfIzWJdIf8xz+ylf9qIUl9u++yqbV6aSA
 ZQNKyxh/EqwXceW6W8coRjudYwFXRsDpeNHA6fqzn9BxqmdTlVqKayFXbdQqDzawgI4d
 LepD21ZFu386GTyTW3I7aOaJon1cS6nh8K0UhE/6A0uBnmVRZeFIteeljbB5zIZkDOqt
 BEnBk0b1HmQuVCGSvew1pouuuFKx919qztABNpbZo6W396GzJyZo1KxwSKiGSueCr/UC
 VFaahvA/YssGc38soZ3xr0MLMxZ7SvDaSI/ahCuwWtD+v6dIfEQ6jitSaGfwiBoZohCi
 aHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l+Hjb1KZXu9Y+kfoSzj2+UuCM6t2hRuLtjmW3mDPljc=;
 b=Xl1nmxXxGltOVPfHJsPi23pzA7WKiNgx62KWJvIYwzAZMeZO4Cai3vB8R4GwiMjdYU
 EZez9btJu99kda1U4OT/NtintUZBjTYPl5+1tOwcWgjxm1KoGfOJg7CZP+KPyjVz9hyZ
 wFMmoRhvW6rrLc2eTjF4BPzmnxFsdkt9abvP3k7jTFsUYh04WsJLrVb8beBKfxe9s059
 5WtT6JhweLKWEFoPKTgHWh8NgfNrKS9B18lMaSsQfqkqK+znuD8J6IhVpxuftXMBuznN
 HWFZSCPsFp2FCpdiJNL2JJbcrpe8VvXQquHQg7+dK/KVZMhTwJP2TEESOwtM4GcnAV13
 2fhg==
X-Gm-Message-State: APjAAAVu8BXmkwRK6zmVpoA/0AHRx9egwA9m2BXQX4XG0+H8+bwgzN1j
 iQEhsJOrzh9ndsSwcFuryxOKFQ==
X-Google-Smtp-Source: APXvYqxwnkva6dHx+V5SOAT97517JhRt9Wr5dcN5qaTd/V2MxMj7/CjmemHmTPjBqBjwDNxDLI+kGw==
X-Received: by 2002:a5d:6088:: with SMTP id w8mr9806148wrt.31.1568638227671;
 Mon, 16 Sep 2019 05:50:27 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o12sm15109960wrm.23.2019.09.16.05.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 05:50:27 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, lorenzo.pieralisi@arm.com, kishon@ti.com,
 bhelgaas@google.com, andrew.murray@arm.com
Subject: [PATCH v2 3/6] PCI: amlogic: meson: Add support for G12A
Date: Mon, 16 Sep 2019 14:50:19 +0200
Message-Id: <20190916125022.10754-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190916125022.10754-1-narmstrong@baylibre.com>
References: <20190916125022.10754-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_055029_231037_DFD86103 
X-CRM114-Status: GOOD (  15.92  )
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
Cc: gouwa@khadas.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-pci@vger.kernel.org, nick@khadas.com, linux-kernel@vger.kernel.org,
 yue.wang@Amlogic.com, repk@triplefau.lt, maz@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the Amlogic G12A SoC using a separate shared PHY.

This adds support for fetching a PHY phandle and call the PHY init,
reset and power on/off calls instead of writing in the PHY register or
toggling the PHY reset line.

The MIPI clock and the PHY memory resource are only required for the
Amlogic AXG SoC PCIe PHY setup, thus these elements are ignored for
the Amlogic G12A having a separate shared PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/pci/controller/dwc/pci-meson.c | 128 ++++++++++++++++++++-----
 1 file changed, 105 insertions(+), 23 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index ab79990798f8..3772b02a5c55 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -16,6 +16,7 @@
 #include <linux/reset.h>
 #include <linux/resource.h>
 #include <linux/types.h>
+#include <linux/phy/phy.h>
 
 #include "pcie-designware.h"
 
@@ -96,12 +97,18 @@ struct meson_pcie_rc_reset {
 	struct reset_control *apb;
 };
 
+struct meson_pcie_param {
+	bool has_shared_phy;
+};
+
 struct meson_pcie {
 	struct dw_pcie pci;
 	struct meson_pcie_mem_res mem_res;
 	struct meson_pcie_clk_res clk_res;
 	struct meson_pcie_rc_reset mrst;
 	struct gpio_desc *reset_gpio;
+	struct phy *phy;
+	const struct meson_pcie_param *param;
 };
 
 static struct reset_control *meson_pcie_get_reset(struct meson_pcie *mp,
@@ -123,10 +130,12 @@ static int meson_pcie_get_resets(struct meson_pcie *mp)
 {
 	struct meson_pcie_rc_reset *mrst = &mp->mrst;
 
-	mrst->phy = meson_pcie_get_reset(mp, "phy", PCIE_SHARED_RESET);
-	if (IS_ERR(mrst->phy))
-		return PTR_ERR(mrst->phy);
-	reset_control_deassert(mrst->phy);
+	if (!mp->param->has_shared_phy) {
+		mrst->phy = meson_pcie_get_reset(mp, "phy", PCIE_SHARED_RESET);
+		if (IS_ERR(mrst->phy))
+			return PTR_ERR(mrst->phy);
+		reset_control_deassert(mrst->phy);
+	}
 
 	mrst->port = meson_pcie_get_reset(mp, "port", PCIE_NORMAL_RESET);
 	if (IS_ERR(mrst->port))
@@ -180,27 +189,52 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
 	if (IS_ERR(mp->mem_res.cfg_base))
 		return PTR_ERR(mp->mem_res.cfg_base);
 
-	/* Meson SoC has two PCI controllers use same phy register*/
-	mp->mem_res.phy_base = meson_pcie_get_mem_shared(pdev, mp, "phy");
-	if (IS_ERR(mp->mem_res.phy_base))
-		return PTR_ERR(mp->mem_res.phy_base);
+	/* Meson AXG SoC has two PCI controllers use same phy register */
+	if (!mp->param->has_shared_phy) {
+		mp->mem_res.phy_base =
+			meson_pcie_get_mem_shared(pdev, mp, "phy");
+		if (IS_ERR(mp->mem_res.phy_base))
+			return PTR_ERR(mp->mem_res.phy_base);
+	}
 
 	return 0;
 }
 
-static void meson_pcie_power_on(struct meson_pcie *mp)
+static int meson_pcie_power_on(struct meson_pcie *mp)
 {
-	writel(MESON_PCIE_PHY_POWERUP, mp->mem_res.phy_base);
+	int ret = 0;
+
+	if (mp->param->has_shared_phy) {
+		ret = phy_init(mp->phy);
+		if (ret)
+			return ret;
+
+		ret = phy_power_on(mp->phy);
+		if (ret) {
+			phy_exit(mp->phy);
+			return ret;
+		}
+	} else
+		writel(MESON_PCIE_PHY_POWERUP, mp->mem_res.phy_base);
+
+	return 0;
 }
 
-static void meson_pcie_reset(struct meson_pcie *mp)
+static int meson_pcie_reset(struct meson_pcie *mp)
 {
 	struct meson_pcie_rc_reset *mrst = &mp->mrst;
-
-	reset_control_assert(mrst->phy);
-	udelay(PCIE_RESET_DELAY);
-	reset_control_deassert(mrst->phy);
-	udelay(PCIE_RESET_DELAY);
+	int ret = 0;
+
+	if (mp->param->has_shared_phy) {
+		ret = phy_reset(mp->phy);
+		if (ret)
+			return ret;
+	} else {
+		reset_control_assert(mrst->phy);
+		udelay(PCIE_RESET_DELAY);
+		reset_control_deassert(mrst->phy);
+		udelay(PCIE_RESET_DELAY);
+	}
 
 	reset_control_assert(mrst->port);
 	reset_control_assert(mrst->apb);
@@ -208,6 +242,8 @@ static void meson_pcie_reset(struct meson_pcie *mp)
 	reset_control_deassert(mrst->port);
 	reset_control_deassert(mrst->apb);
 	udelay(PCIE_RESET_DELAY);
+
+	return 0;
 }
 
 static inline struct clk *meson_pcie_probe_clock(struct device *dev,
@@ -250,9 +286,11 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
 	if (IS_ERR(res->port_clk))
 		return PTR_ERR(res->port_clk);
 
-	res->mipi_gate = meson_pcie_probe_clock(dev, "mipi", 0);
-	if (IS_ERR(res->mipi_gate))
-		return PTR_ERR(res->mipi_gate);
+	if (!mp->param->has_shared_phy) {
+		res->mipi_gate = meson_pcie_probe_clock(dev, "mipi", 0);
+		if (IS_ERR(res->mipi_gate))
+			return PTR_ERR(res->mipi_gate);
+	}
 
 	res->general_clk = meson_pcie_probe_clock(dev, "general", 0);
 	if (IS_ERR(res->general_clk))
@@ -524,6 +562,7 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 
 static int meson_pcie_probe(struct platform_device *pdev)
 {
+	const struct meson_pcie_param *match_data;
 	struct device *dev = &pdev->dev;
 	struct dw_pcie *pci;
 	struct meson_pcie *mp;
@@ -537,6 +576,19 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
 
+	match_data = of_device_get_match_data(dev);
+	if (!match_data) {
+		dev_err(dev, "failed to get match data\n");
+		return -ENODEV;
+	}
+	mp->param = match_data;
+
+	if (mp->param->has_shared_phy) {
+		mp->phy = devm_phy_get(dev, "pcie");
+		if (IS_ERR(mp->phy))
+			return PTR_ERR(mp->phy);
+	}
+
 	mp->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(mp->reset_gpio)) {
 		dev_err(dev, "get reset gpio failed\n");
@@ -555,13 +607,22 @@ static int meson_pcie_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	meson_pcie_power_on(mp);
-	meson_pcie_reset(mp);
+	ret = meson_pcie_power_on(mp);
+	if (ret) {
+		dev_err(dev, "phy power on failed, %d\n", ret);
+		return ret;
+	}
+
+	ret = meson_pcie_reset(mp);
+	if (ret) {
+		dev_err(dev, "reset failed, %d\n", ret);
+		goto err_phy;
+	}
 
 	ret = meson_pcie_probe_clocks(mp);
 	if (ret) {
 		dev_err(dev, "init clock resources failed, %d\n", ret);
-		return ret;
+		goto err_phy;
 	}
 
 	platform_set_drvdata(pdev, mp);
@@ -569,15 +630,36 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	ret = meson_add_pcie_port(mp, pdev);
 	if (ret < 0) {
 		dev_err(dev, "Add PCIe port failed, %d\n", ret);
-		return ret;
+		goto err_phy;
 	}
 
 	return 0;
+
+err_phy:
+	if (mp->param->has_shared_phy) {
+		phy_power_off(mp->phy);
+		phy_exit(mp->phy);
+	}
+
+	return ret;
 }
 
+static struct meson_pcie_param meson_pcie_axg_param = {
+	.has_shared_phy = false,
+};
+
+static struct meson_pcie_param meson_pcie_g12a_param = {
+	.has_shared_phy = true,
+};
+
 static const struct of_device_id meson_pcie_of_match[] = {
 	{
 		.compatible = "amlogic,axg-pcie",
+		.data = &meson_pcie_axg_param,
+	},
+	{
+		.compatible = "amlogic,g12a-pcie",
+		.data = &meson_pcie_g12a_param,
 	},
 	{},
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
