Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8708EC388F7
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 21:13:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021CF20724
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 21:13:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LFmPJmBB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021CF20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2QabFHSGXfauKbY5Wf7RGYW2AOh/l5xWzSj+m23ehTM=; b=LFmPJmBBecDCLTqbt0HRkvdGC
	J8NAfXnbd9ecCSzI/CN64phzpodPwLvJMnO54LzTLJdAynuAoFfCJXWutzYK2xzCYvmMCwb/v+8ls
	axjLQyEUJz1NIjY5kXqnL6m2DBDKNbBwdBmmG8Z1wFrMJa+ztlVE+EAseaAJAhRjCYmIGdTGfWmWL
	vWyE+mBZlgF/nAQIb5fw+UhersNFQHSyLPO5s5xprEvSotGTGqOjDCBVeSy/vrseFithKit9N7vKv
	3OoKAfAIjrN7zCOkASjrllzZnAqZnAailN/IAQmt6s/U/gKNyI2YO/ctmp3eC9Y512XnR0H5W+uGi
	piLjV8C7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kamZ9-00081Q-4W; Thu, 05 Nov 2020 21:13:07 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kamYI-0007gx-Fb; Thu, 05 Nov 2020 21:12:17 +0000
Received: by mail-ot1-f65.google.com with SMTP id h62so2767080oth.9;
 Thu, 05 Nov 2020 13:12:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lnhMaY/Om8bkbXx5Q25npCa4me/sCmFqOfqZ2/6QdQo=;
 b=kRmuwhWBTv84129Gs/efGQoBsldtLm0BYw4UBsl6eLJU8eHz2e616QKpkHPx2WEPJS
 stxNA0wDlql+yCLZq1LWKHT8/WlW3JoYCXf5UZPx3SrEfC/tf3OUP1YEeHh2sFJJCtYD
 /zs8QjF8KyPiNlRg3edNl3HHpa93JyX2XMyvu4dsi6eXv7oqpPSrrsGqgKGTSwIHRO3v
 DGgG+0IVRS+O7vWOCHRVmMQx4hTreO2v89rvyNh5xvz6+NL2IXk0GEOTFW0tAZv/saPW
 uvQ0yBB72J2v+tM9o5vzoDiHaDd8qvwEeMGDJMQ/deAe6E9QfA0T52dbn4zQbM7X+D0i
 nl5Q==
X-Gm-Message-State: AOAM531+QQrzMWin/rlPNU1NfQ4Vf3a+HZ6wjC6M0zHS37Ld2NCh0mAt
 y7uGwTjqM+dhdLIwPkxdxg==
X-Google-Smtp-Source: ABdhPJwTVyUI98fP/uRAplOkV3HVRJldydQAdCJx8LRooqVWsI6RHiswK5cAKqhbh81rw+jirNZmjQ==
X-Received: by 2002:a05:6830:359:: with SMTP id
 h25mr2903256ote.184.1604610733868; 
 Thu, 05 Nov 2020 13:12:13 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id z19sm622549ooi.32.2020.11.05.13.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 13:12:13 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: 
Subject: [PATCH v2 08/16] PCI: dwc: Move MSI interrupt setup into DWC common
 code
Date: Thu,  5 Nov 2020 15:11:51 -0600
Message-Id: <20201105211159.1814485-9-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105211159.1814485-1-robh@kernel.org>
References: <20201105211159.1814485-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_161214_634810_9DED3629 
X-CRM114-Status: GOOD (  22.82  )
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
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 linux-tegra@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Xiaowei Song <songxiaowei@hisilicon.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, linux-samsung-soc@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andy Gross <agross@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Platforms using the built-in DWC MSI controller all have a dedicated
interrupt with "msi" name or at index 0, so let's move setting up the
interrupt to the common DWC code.

spear13xx and dra7xx are the 2 oddballs with muxed interrupts, so
we need to prevent configuring the MSI interrupt by setting msi_irq
to negative.

Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Pratyush Anand <pratyush.anand@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@axis.com
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Acked-by: Jingoo Han <jingoohan1@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Make get_irq optional to avoid error message
---
 drivers/pci/controller/dwc/pci-dra7xx.c       |  3 +++
 drivers/pci/controller/dwc/pci-exynos.c       |  6 -----
 drivers/pci/controller/dwc/pci-imx6.c         |  6 -----
 drivers/pci/controller/dwc/pci-meson.c        |  6 -----
 drivers/pci/controller/dwc/pcie-artpec6.c     |  6 -----
 .../pci/controller/dwc/pcie-designware-host.c | 11 +++++++++-
 .../pci/controller/dwc/pcie-designware-plat.c |  6 -----
 drivers/pci/controller/dwc/pcie-histb.c       |  6 -----
 drivers/pci/controller/dwc/pcie-kirin.c       | 22 -------------------
 drivers/pci/controller/dwc/pcie-qcom.c        |  8 -------
 drivers/pci/controller/dwc/pcie-spear13xx.c   |  1 +
 drivers/pci/controller/dwc/pcie-tegra194.c    |  8 -------
 drivers/pci/controller/dwc/pcie-uniphier.c    |  6 -----
 13 files changed, 14 insertions(+), 81 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 4d0c35a4aa59..6b75c68dddb5 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -489,6 +489,9 @@ static int __init dra7xx_add_pcie_port(struct dra7xx_pcie *dra7xx,
 	if (pp->irq < 0)
 		return pp->irq;
 
+	/* MSI IRQ is muxed */
+	pp->msi_irq = -ENODEV;
+
 	ret = dra7xx_pcie_init_irq_domain(pp);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 242683cde04a..7734394953e5 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -415,12 +415,6 @@ static int __init exynos_add_pcie_port(struct exynos_pcie *ep,
 		return ret;
 	}
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq(pdev, 0);
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->ops = &exynos_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 5cf1ef12fb9b..95e7cf06863d 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -853,12 +853,6 @@ static int imx6_add_pcie_port(struct imx6_pcie *imx6_pcie,
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->ops = &imx6_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 1913dc2c8fa0..10d65b3093e4 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -405,12 +405,6 @@ static int meson_add_pcie_port(struct meson_pcie *mp,
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq(pdev, 0);
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->ops = &meson_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 52ad7909cd0c..a5239a58cee0 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -348,12 +348,6 @@ static int artpec6_add_pcie_port(struct artpec6_pcie *artpec6_pcie,
 	struct device *dev = pci->dev;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->ops = &artpec6_pcie_host_ops;
 
 	ret = dw_pcie_host_init(pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 1bd6a9762426..95deef0eaadf 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -373,13 +373,22 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		}
 
 		if (!pp->ops->msi_host_init) {
+			if (!pp->msi_irq) {
+				pp->msi_irq = platform_get_irq_byname_optional(pdev, "msi");
+				if (pp->msi_irq < 0) {
+					pp->msi_irq = platform_get_irq(pdev, 0);
+					if (pp->msi_irq < 0)
+						return pp->msi_irq;
+				}
+			}
+
 			pp->msi_irq_chip = &dw_pci_msi_bottom_irq_chip;
 
 			ret = dw_pcie_allocate_domains(pp);
 			if (ret)
 				return ret;
 
-			if (pp->msi_irq)
+			if (pp->msi_irq > 0)
 				irq_set_chained_handler_and_data(pp->msi_irq,
 							    dw_chained_msi_isr,
 							    pp);
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 13fede1d4157..3da38ac6a87a 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -116,12 +116,6 @@ static int dw_plat_add_pcie_port(struct dw_plat_pcie *dw_plat_pcie,
 	if (pp->irq < 0)
 		return pp->irq;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq(pdev, 0);
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	pp->num_vectors = MAX_MSI_IRQS;
 	pp->ops = &dw_plat_pcie_host_ops;
 
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index afc1abbe49aa..777e24902afb 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -400,12 +400,6 @@ static int histb_pcie_probe(struct platform_device *pdev)
 		return PTR_ERR(hipcie->bus_reset);
 	}
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	hipcie->phy = devm_phy_get(dev, "phy");
 	if (IS_ERR(hipcie->phy)) {
 		dev_info(dev, "no pcie-phy found\n");
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 3042a23cf09a..ba03dbca7885 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -439,31 +439,9 @@ static const struct dw_pcie_host_ops kirin_pcie_host_ops = {
 	.host_init = kirin_pcie_host_init,
 };
 
-static int kirin_pcie_add_msi(struct dw_pcie *pci,
-				struct platform_device *pdev)
-{
-	int irq;
-
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		irq = platform_get_irq(pdev, 0);
-		if (irq < 0)
-			return irq;
-
-		pci->pp.msi_irq = irq;
-	}
-
-	return 0;
-}
-
 static int kirin_add_pcie_port(struct dw_pcie *pci,
 			       struct platform_device *pdev)
 {
-	int ret;
-
-	ret = kirin_pcie_add_msi(pci, pdev);
-	if (ret)
-		return ret;
-
 	pci->pp.ops = &kirin_pcie_host_ops;
 
 	return dw_pcie_host_init(&pci->pp);
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 3b4f70b9f3f0..7ac08f0cae17 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1424,14 +1424,6 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 
 	pp->ops = &qcom_pcie_dw_ops;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0) {
-			ret = pp->msi_irq;
-			goto err_pm_runtime_put;
-		}
-	}
-
 	ret = phy_init(pcie->phy);
 	if (ret) {
 		pm_runtime_disable(&pdev->dev);
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index 1ed7e3501ff1..800c34a60a33 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -185,6 +185,7 @@ static int spear13xx_add_pcie_port(struct spear13xx_pcie *spear13xx_pcie,
 	}
 
 	pp->ops = &spear13xx_pcie_host_ops;
+	pp->msi_irq = -ENODEV;
 
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 5e2841f58700..77fc3ba3dec1 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1554,14 +1554,6 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
 	char *name;
 	int ret;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = of_irq_get_byname(dev->of_node, "msi");
-		if (!pp->msi_irq) {
-			dev_err(dev, "Failed to get MSI interrupt\n");
-			return -ENODEV;
-		}
-	}
-
 	pm_runtime_enable(dev);
 
 	ret = pm_runtime_get_sync(dev);
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 33130fb4af90..6198bd106b8a 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -341,12 +341,6 @@ static int uniphier_add_pcie_port(struct uniphier_pcie_priv *priv,
 
 	pp->ops = &uniphier_pcie_host_ops;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		pp->msi_irq = platform_get_irq_byname(pdev, "msi");
-		if (pp->msi_irq < 0)
-			return pp->msi_irq;
-	}
-
 	ret = dw_pcie_host_init(pp);
 	if (ret) {
 		dev_err(dev, "Failed to initialize host (%d)\n", ret);
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
