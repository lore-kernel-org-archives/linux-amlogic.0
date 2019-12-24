Return-Path: <SRS0=kiAd=2O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41895C2D0CF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 17:32:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18AE320706
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 17:32:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bNPeWvbj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18AE320706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=triplefau.lt
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ywKe6oAQVzjxpCUZwr6pGbrE1hFFo/ZAe2rFtP8ggI=; b=bNPeWvbjjbyE4A
	pIXeh80WeQre923k19p2qXLqY/vsr9B02Me39RHw2bWrxEmch7OSIx3sVokkIy6Il4VrEFLSsNI8O
	k6G5+eSGIueZW8Lw//YYA5c0Zsj4M6LI6p+HX9mKIdOP+18PS8as6AY1TxdfoW2u2PtuLxbkqSiqv
	fjoAaAgYHR+xjVgW6EDitVBWRqbVV2h/to3UGvJzRLNSU1HKxXmiLG7Yi2r6FBMc54mZjLTDtKSh9
	iEJj+GOn8ShwFKef+OJ61e4vWsU17VcjKxdCvA26KNKaK2XvXsnaXGMOX3dTz10BeAAvUVidziNgZ
	xiwxUAxhvJEgkGrrrduw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijo2e-0000nr-RX; Tue, 24 Dec 2019 17:32:20 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijo2b-0000lG-Uy
 for linux-amlogic@lists.infradead.org; Tue, 24 Dec 2019 17:32:19 +0000
X-Originating-IP: 88.190.179.123
Received: from localhost (unknown [88.190.179.123])
 (Authenticated sender: repk@triplefau.lt)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 84B0EC0002;
 Tue, 24 Dec 2019 17:32:07 +0000 (UTC)
From: Remi Pommarel <repk@triplefau.lt>
To: Kishon Vijay Abraham I <kishon@ti.com>, Yue Wang <yue.wang@Amlogic.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Andrew Murray <andrew.murray@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 2/5] PCI: amlogic: Use AXG PCIE PHY
Date: Tue, 24 Dec 2019 18:39:39 +0100
Message-Id: <20191224173942.18160-3-repk@triplefau.lt>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191224173942.18160-1-repk@triplefau.lt>
References: <20191224173942.18160-1-repk@triplefau.lt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_093218_269570_81BBE2E2 
X-CRM114-Status: GOOD (  12.35  )
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

Now that PCIE PHY has been introduced for AXG, the whole has_shared_phy
logic can be mutualized between AXG and G12A platforms.

The new PHY also enable bang gap reference bit that allows relibable
communication on AXG platforms.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/pci/controller/dwc/pci-meson.c | 116 +++++--------------------
 1 file changed, 21 insertions(+), 95 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 3772b02a5c55..88ca8d48a879 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -66,7 +66,6 @@
 #define PORT_CLK_RATE			100000000UL
 #define MAX_PAYLOAD_SIZE		256
 #define MAX_READ_REQ_SIZE		256
-#define MESON_PCIE_PHY_POWERUP		0x1c
 #define PCIE_RESET_DELAY		500
 #define PCIE_SHARED_RESET		1
 #define PCIE_NORMAL_RESET		0
@@ -81,26 +80,19 @@ enum pcie_data_rate {
 struct meson_pcie_mem_res {
 	void __iomem *elbi_base;
 	void __iomem *cfg_base;
-	void __iomem *phy_base;
 };
 
 struct meson_pcie_clk_res {
 	struct clk *clk;
-	struct clk *mipi_gate;
 	struct clk *port_clk;
 	struct clk *general_clk;
 };
 
 struct meson_pcie_rc_reset {
-	struct reset_control *phy;
 	struct reset_control *port;
 	struct reset_control *apb;
 };
 
-struct meson_pcie_param {
-	bool has_shared_phy;
-};
-
 struct meson_pcie {
 	struct dw_pcie pci;
 	struct meson_pcie_mem_res mem_res;
@@ -108,7 +100,6 @@ struct meson_pcie {
 	struct meson_pcie_rc_reset mrst;
 	struct gpio_desc *reset_gpio;
 	struct phy *phy;
-	const struct meson_pcie_param *param;
 };
 
 static struct reset_control *meson_pcie_get_reset(struct meson_pcie *mp,
@@ -130,13 +121,6 @@ static int meson_pcie_get_resets(struct meson_pcie *mp)
 {
 	struct meson_pcie_rc_reset *mrst = &mp->mrst;
 
-	if (!mp->param->has_shared_phy) {
-		mrst->phy = meson_pcie_get_reset(mp, "phy", PCIE_SHARED_RESET);
-		if (IS_ERR(mrst->phy))
-			return PTR_ERR(mrst->phy);
-		reset_control_deassert(mrst->phy);
-	}
-
 	mrst->port = meson_pcie_get_reset(mp, "port", PCIE_NORMAL_RESET);
 	if (IS_ERR(mrst->port))
 		return PTR_ERR(mrst->port);
@@ -162,22 +146,6 @@ static void __iomem *meson_pcie_get_mem(struct platform_device *pdev,
 	return devm_ioremap_resource(dev, res);
 }
 
-static void __iomem *meson_pcie_get_mem_shared(struct platform_device *pdev,
-					       struct meson_pcie *mp,
-					       const char *id)
-{
-	struct device *dev = mp->pci.dev;
-	struct resource *res;
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, id);
-	if (!res) {
-		dev_err(dev, "No REG resource %s\n", id);
-		return ERR_PTR(-ENXIO);
-	}
-
-	return devm_ioremap(dev, res->start, resource_size(res));
-}
-
 static int meson_pcie_get_mems(struct platform_device *pdev,
 			       struct meson_pcie *mp)
 {
@@ -189,14 +157,6 @@ static int meson_pcie_get_mems(struct platform_device *pdev,
 	if (IS_ERR(mp->mem_res.cfg_base))
 		return PTR_ERR(mp->mem_res.cfg_base);
 
-	/* Meson AXG SoC has two PCI controllers use same phy register */
-	if (!mp->param->has_shared_phy) {
-		mp->mem_res.phy_base =
-			meson_pcie_get_mem_shared(pdev, mp, "phy");
-		if (IS_ERR(mp->mem_res.phy_base))
-			return PTR_ERR(mp->mem_res.phy_base);
-	}
-
 	return 0;
 }
 
@@ -204,37 +164,33 @@ static int meson_pcie_power_on(struct meson_pcie *mp)
 {
 	int ret = 0;
 
-	if (mp->param->has_shared_phy) {
-		ret = phy_init(mp->phy);
-		if (ret)
-			return ret;
+	ret = phy_init(mp->phy);
+	if (ret)
+		return ret;
 
-		ret = phy_power_on(mp->phy);
-		if (ret) {
-			phy_exit(mp->phy);
-			return ret;
-		}
-	} else
-		writel(MESON_PCIE_PHY_POWERUP, mp->mem_res.phy_base);
+	ret = phy_power_on(mp->phy);
+	if (ret) {
+		phy_exit(mp->phy);
+		return ret;
+	}
 
 	return 0;
 }
 
+static void meson_pcie_power_off(struct meson_pcie *mp)
+{
+	phy_power_off(mp->phy);
+	phy_exit(mp->phy);
+}
+
 static int meson_pcie_reset(struct meson_pcie *mp)
 {
 	struct meson_pcie_rc_reset *mrst = &mp->mrst;
 	int ret = 0;
 
-	if (mp->param->has_shared_phy) {
-		ret = phy_reset(mp->phy);
-		if (ret)
-			return ret;
-	} else {
-		reset_control_assert(mrst->phy);
-		udelay(PCIE_RESET_DELAY);
-		reset_control_deassert(mrst->phy);
-		udelay(PCIE_RESET_DELAY);
-	}
+	ret = phy_reset(mp->phy);
+	if (ret)
+		return ret;
 
 	reset_control_assert(mrst->port);
 	reset_control_assert(mrst->apb);
@@ -286,12 +242,6 @@ static int meson_pcie_probe_clocks(struct meson_pcie *mp)
 	if (IS_ERR(res->port_clk))
 		return PTR_ERR(res->port_clk);
 
-	if (!mp->param->has_shared_phy) {
-		res->mipi_gate = meson_pcie_probe_clock(dev, "mipi", 0);
-		if (IS_ERR(res->mipi_gate))
-			return PTR_ERR(res->mipi_gate);
-	}
-
 	res->general_clk = meson_pcie_probe_clock(dev, "general", 0);
 	if (IS_ERR(res->general_clk))
 		return PTR_ERR(res->general_clk);
@@ -562,7 +512,6 @@ static const struct dw_pcie_ops dw_pcie_ops = {
 
 static int meson_pcie_probe(struct platform_device *pdev)
 {
-	const struct meson_pcie_param *match_data;
 	struct device *dev = &pdev->dev;
 	struct dw_pcie *pci;
 	struct meson_pcie *mp;
@@ -576,18 +525,9 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
 
-	match_data = of_device_get_match_data(dev);
-	if (!match_data) {
-		dev_err(dev, "failed to get match data\n");
-		return -ENODEV;
-	}
-	mp->param = match_data;
-
-	if (mp->param->has_shared_phy) {
-		mp->phy = devm_phy_get(dev, "pcie");
-		if (IS_ERR(mp->phy))
-			return PTR_ERR(mp->phy);
-	}
+	mp->phy = devm_phy_get(dev, "pcie");
+	if (IS_ERR(mp->phy))
+		return PTR_ERR(mp->phy);
 
 	mp->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(mp->reset_gpio)) {
@@ -636,30 +576,16 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	return 0;
 
 err_phy:
-	if (mp->param->has_shared_phy) {
-		phy_power_off(mp->phy);
-		phy_exit(mp->phy);
-	}
-
+	meson_pcie_power_off(mp);
 	return ret;
 }
 
-static struct meson_pcie_param meson_pcie_axg_param = {
-	.has_shared_phy = false,
-};
-
-static struct meson_pcie_param meson_pcie_g12a_param = {
-	.has_shared_phy = true,
-};
-
 static const struct of_device_id meson_pcie_of_match[] = {
 	{
 		.compatible = "amlogic,axg-pcie",
-		.data = &meson_pcie_axg_param,
 	},
 	{
 		.compatible = "amlogic,g12a-pcie",
-		.data = &meson_pcie_g12a_param,
 	},
 	{},
 };
-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
