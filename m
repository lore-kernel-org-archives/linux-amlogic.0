Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA36C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:48:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6DA824823
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:48:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yw5XdzbF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6DA824823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uoVCxRaOHZEXJEO9mLJpGogOSPs4j9x4Yrukzu611a4=; b=yw5XdzbFx/6opdeBS4dRCxdbH
	CYTXFvpEOes5UodA3bJJg2Y3n67VcoVc8uHwhAH3u0cnhE3LCntw7RDJ+tyZEP3xKTFXjOiXC9eJY
	6jhwJMH9kTtsdU7BBXDSH4dn8od4qjlTpWrLfbsVrl69t0yk+5tzNwj9eNiX9xneqY9D4NFu6sGYs
	bpTlTxhwsoEF4AxFIAyvlNN27CLemqAlglL+bce7KKzS8aEPdrUumrqn0e7APeWeNC6P42CFtoJQa
	GuwwvrE47MzulKk6eVB53l8q2NGREIExTert0RdU1O3JBUR59Uq0qwAMZy2Iep7uO9eTLl4M3d4To
	qs8AeE5mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsMT-00010T-Bk; Wed, 28 Oct 2020 20:48:01 +0000
Received: from mail-oo1-f66.google.com ([209.85.161.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsLs-0000jp-F3
 for linux-amlogic@lists.infradead.org; Wed, 28 Oct 2020 20:47:35 +0000
Received: by mail-oo1-f66.google.com with SMTP id f1so214317oov.1
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Oct 2020 13:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jLtdQtf3WAcV9X++ahXRYw9T14oWIpf65Dsq+SFgKNI=;
 b=spjNzT+QoCJda5wI+lgmcMIGbkd1i6ikg7ktWDDs7GUay+qqtxyS1Y19gzkcW1oPLM
 8kP27yZWYtFmsluzhZOHfCiY+oaCCka7RSgH80qlEbIA62Cz2cQi4dsYbBfMrSpXL1LV
 7VDhQxx4yKhZrDugdicJ0Bd3KO5eMcHIb37rRNsPaMaO6YGgr+i4lat/NrCOnLZPC+p2
 u56l8Duy4Fot49/se4FhUknDLFUIT9C540EGzIrEbZt6HtuoV+IhwacpsKBsv711vdOr
 0xqFLUkYMLACp64rDKy/NIGJ6gQqF05ghxkaKHC0s0dOYX6GIWFNMC0fCvF0dK1F7Vq2
 OYmw==
X-Gm-Message-State: AOAM533ElCeYbPJp1nT5feFon7i6App7s7aLnOtqWssqgbG0ly6/c5iT
 MQ6pd3dgG1djCOeFiA1GqQ==
X-Google-Smtp-Source: ABdhPJxnNRS14MFRfXMOMoJpknKY2nesKkmauQwraiawQ+52twXO9gG8BZtOR7eF2YbXdQeyu9DH4Q==
X-Received: by 2002:a4a:b28b:: with SMTP id k11mr649619ooo.54.1603918043023;
 Wed, 28 Oct 2020 13:47:23 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:47:22 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 13/13] PCI: dwc: Remove unnecessary wrappers around
 dw_pcie_host_init()
Date: Wed, 28 Oct 2020 15:46:46 -0500
Message-Id: <20201028204646.356535-14-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_164724_660463_1A6FB25C 
X-CRM114-Status: GOOD (  20.71  )
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
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Many calls to dw_pcie_host_init() are in a wrapper function with
nothing else now. Let's remove the pointless extra layer.

Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>
Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jonathan Chocron <jonnyc@amazon.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@axis.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c       | 26 ++-------------------
 drivers/pci/controller/dwc/pci-keystone.c   | 19 +--------------
 drivers/pci/controller/dwc/pci-layerscape.c | 26 ++-------------------
 drivers/pci/controller/dwc/pci-meson.c      | 22 ++---------------
 drivers/pci/controller/dwc/pcie-al.c        | 20 ++--------------
 drivers/pci/controller/dwc/pcie-artpec6.c   | 23 +++---------------
 drivers/pci/controller/dwc/pcie-kirin.c     | 11 ++-------
 drivers/pci/controller/dwc/pcie-uniphier.c  | 23 +++---------------
 8 files changed, 17 insertions(+), 153 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 4ba0b1195ecf..73e5cfc0725a 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -842,25 +842,6 @@ static const struct dw_pcie_host_ops imx6_pcie_host_ops = {
 	.host_init = imx6_pcie_host_init,
 };
 
-static int imx6_add_pcie_port(struct imx6_pcie *imx6_pcie,
-			      struct platform_device *pdev)
-{
-	struct dw_pcie *pci = imx6_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	pp->ops = &imx6_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.start_link = imx6_pcie_start_link,
 };
@@ -1004,6 +985,7 @@ static int imx6_pcie_probe(struct platform_device *pdev)
 
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
+	pci->pp.ops = &imx6_pcie_host_ops;
 
 	imx6_pcie->pci = pci;
 	imx6_pcie->drvdata = of_device_get_match_data(dev);
@@ -1153,11 +1135,7 @@ static int imx6_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = imx6_add_pcie_port(imx6_pcie, pdev);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return dw_pcie_host_init(&pci->pp);
 }
 
 static void imx6_pcie_shutdown(struct platform_device *pdev)
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 5a4bcc2b1ddb..719756160821 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -844,23 +844,6 @@ static irqreturn_t ks_pcie_err_irq_handler(int irq, void *priv)
 	return ks_pcie_handle_error_irq(ks_pcie);
 }
 
-static int __init ks_pcie_add_pcie_port(struct keystone_pcie *ks_pcie,
-					struct platform_device *pdev)
-{
-	struct dw_pcie *pci = ks_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static void ks_pcie_am654_write_dbi2(struct dw_pcie *pci, void __iomem *base,
 				     u32 reg, size_t size, u32 val)
 {
@@ -1255,7 +1238,7 @@ static int __init ks_pcie_probe(struct platform_device *pdev)
 		}
 
 		pci->pp.ops = host_ops;
-		ret = ks_pcie_add_pcie_port(ks_pcie, pdev);
+		ret = dw_pcie_host_init(&pci->pp);
 		if (ret < 0)
 			goto err_get_sync;
 		break;
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 400ebbebd00f..44ad34cdc3bc 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -232,31 +232,12 @@ static const struct of_device_id ls_pcie_of_match[] = {
 	{ },
 };
 
-static int __init ls_add_pcie_port(struct ls_pcie *pcie)
-{
-	struct dw_pcie *pci = pcie->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = pci->dev;
-	int ret;
-
-	pp->ops = pcie->drvdata->ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static int __init ls_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dw_pcie *pci;
 	struct ls_pcie *pcie;
 	struct resource *dbi_base;
-	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -270,6 +251,7 @@ static int __init ls_pcie_probe(struct platform_device *pdev)
 
 	pci->dev = dev;
 	pci->ops = pcie->drvdata->dw_pcie_ops;
+	pci->pp.ops = pcie->drvdata->ops;
 
 	pcie->pci = pci;
 
@@ -285,11 +267,7 @@ static int __init ls_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
-	ret = ls_add_pcie_port(pcie);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return dw_pcie_host_init(&pci->pp);
 }
 
 static struct platform_driver ls_pcie_driver = {
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 04589f0decb2..686ded034f22 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -387,25 +387,6 @@ static const struct dw_pcie_host_ops meson_pcie_host_ops = {
 	.host_init = meson_pcie_host_init,
 };
 
-static int meson_add_pcie_port(struct meson_pcie *mp,
-			       struct platform_device *pdev)
-{
-	struct dw_pcie *pci = &mp->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	pp->ops = &meson_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct dw_pcie_ops dw_pcie_ops = {
 	.link_up = meson_pcie_link_up,
 	.start_link = meson_pcie_start_link,
@@ -425,6 +406,7 @@ static int meson_pcie_probe(struct platform_device *pdev)
 	pci = &mp->pci;
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
+	pci->pp.ops = &meson_pcie_host_ops;
 	pci->num_lanes = 1;
 
 	mp->phy = devm_phy_get(dev, "pcie");
@@ -471,7 +453,7 @@ static int meson_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mp);
 
-	ret = meson_add_pcie_port(mp, pdev);
+	ret = dw_pcie_host_init(&pci->pp);
 	if (ret < 0) {
 		dev_err(dev, "Add PCIe port failed, %d\n", ret);
 		goto err_phy;
diff --git a/drivers/pci/controller/dwc/pcie-al.c b/drivers/pci/controller/dwc/pcie-al.c
index d06866921187..7ac8a37d9ce0 100644
--- a/drivers/pci/controller/dwc/pcie-al.c
+++ b/drivers/pci/controller/dwc/pcie-al.c
@@ -322,23 +322,6 @@ static const struct dw_pcie_host_ops al_pcie_host_ops = {
 	.host_init = al_pcie_host_init,
 };
 
-static int al_add_pcie_port(struct pcie_port *pp,
-			    struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	pp->ops = &al_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static const struct dw_pcie_ops dw_pcie_ops = {
 };
 
@@ -360,6 +343,7 @@ static int al_pcie_probe(struct platform_device *pdev)
 
 	pci->dev = dev;
 	pci->ops = &dw_pcie_ops;
+	pci->pp.ops = &al_pcie_host_ops;
 
 	al_pcie->pci = pci;
 	al_pcie->dev = dev;
@@ -384,7 +368,7 @@ static int al_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, al_pcie);
 
-	return al_add_pcie_port(&pci->pp, pdev);
+	return dw_pcie_host_init(&pci->pp);
 }
 
 static const struct of_device_id al_pcie_of_match[] = {
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index fcba9915a606..597c282f586c 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -336,25 +336,6 @@ static const struct dw_pcie_host_ops artpec6_pcie_host_ops = {
 	.host_init = artpec6_pcie_host_init,
 };
 
-static int artpec6_add_pcie_port(struct artpec6_pcie *artpec6_pcie,
-				 struct platform_device *pdev)
-{
-	struct dw_pcie *pci = artpec6_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = pci->dev;
-	int ret;
-
-	pp->ops = &artpec6_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "failed to initialize host\n");
-		return ret;
-	}
-
-	return 0;
-}
-
 static void artpec6_pcie_ep_init(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -445,7 +426,9 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
 		if (!IS_ENABLED(CONFIG_PCIE_ARTPEC6_HOST))
 			return -ENODEV;
 
-		ret = artpec6_add_pcie_port(artpec6_pcie, pdev);
+		pci->pp.ops = &artpec6_pcie_host_ops;
+
+		ret = dw_pcie_host_init(&pci->pp);
 		if (ret < 0)
 			return ret;
 		break;
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index ac4bbdaf5324..026fd1e42a55 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -419,14 +419,6 @@ static const struct dw_pcie_host_ops kirin_pcie_host_ops = {
 	.host_init = kirin_pcie_host_init,
 };
 
-static int kirin_add_pcie_port(struct dw_pcie *pci,
-			       struct platform_device *pdev)
-{
-	pci->pp.ops = &kirin_pcie_host_ops;
-
-	return dw_pcie_host_init(&pci->pp);
-}
-
 static int kirin_pcie_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -449,6 +441,7 @@ static int kirin_pcie_probe(struct platform_device *pdev)
 
 	pci->dev = dev;
 	pci->ops = &kirin_dw_pcie_ops;
+	pci->pp.ops = &kirin_pcie_host_ops;
 	kirin_pcie->pci = pci;
 
 	ret = kirin_pcie_get_clk(kirin_pcie, pdev);
@@ -474,7 +467,7 @@ static int kirin_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, kirin_pcie);
 
-	return kirin_add_pcie_port(pci, pdev);
+	return dw_pcie_host_init(&pci->pp);
 }
 
 static const struct of_device_id kirin_pcie_match[] = {
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 2457e9dd098d..7e8bad326770 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -321,25 +321,6 @@ static const struct dw_pcie_host_ops uniphier_pcie_host_ops = {
 	.host_init = uniphier_pcie_host_init,
 };
 
-static int uniphier_add_pcie_port(struct uniphier_pcie_priv *priv,
-				  struct platform_device *pdev)
-{
-	struct dw_pcie *pci = &priv->pci;
-	struct pcie_port *pp = &pci->pp;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	pp->ops = &uniphier_pcie_host_ops;
-
-	ret = dw_pcie_host_init(pp);
-	if (ret) {
-		dev_err(dev, "Failed to initialize host (%d)\n", ret);
-		return ret;
-	}
-
-	return 0;
-}
-
 static int uniphier_pcie_host_enable(struct uniphier_pcie_priv *priv)
 {
 	int ret;
@@ -415,7 +396,9 @@ static int uniphier_pcie_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return uniphier_add_pcie_port(priv, pdev);
+	priv->pci.pp.ops = &uniphier_pcie_host_ops;
+
+	return dw_pcie_host_init(&priv->pci.pp);
 }
 
 static const struct of_device_id uniphier_pcie_match[] = {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
