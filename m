Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A19C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B7724823
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tOo4Prm0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38B7724823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ULoiA2sz3IYysS1RpjmAIlayvFeU6MzfayhBXJ8Hh80=; b=tOo4Prm09Twc7QNlWgFFlYOJc
	HFTnJwizWgBDRvXmHnU/z0o9JCl3ZPc+BdhNj+4EIheCwc7w5ZeiBquXWJ9+GwZS/dHcjlBKef8NU
	G3dvsiYfjRcNyuuJpg9IImZuFTLyattTV/PFcJx1NHNoU9bw8oJq+BfbWk552y50D61LPMgOMhO2+
	6WC7F3Dfqphf0mbuAnCggnGOuALM9UM6sz3nCaSIku98w6N+TGMo/Fp682BdSb1JueMpnmvMU1bDq
	3z9nMNPayvBIO9sX1tjDa/aWwRQ1zMh3YkX7R8bU/E0O5yFKhpf623MZbFh+jRaTjzGkFFQapP34E
	NdgYU6xoA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsMK-0000ub-94; Wed, 28 Oct 2020 20:47:52 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsLi-0000gh-AC
 for linux-amlogic@lists.infradead.org; Wed, 28 Oct 2020 20:47:23 +0000
Received: by mail-oi1-f195.google.com with SMTP id w191so995016oif.2
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Oct 2020 13:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbZEc8Er93jk4a6ztZuKlxbcqfjO3bgt1UlkERsxFZs=;
 b=L/dwjwFB+MtCpTljbqS5HII94bS7lh+KW3E6uvTCrMCkUpe3/5SgR1q3dW0KfOYQE4
 EjsGDfCWkt7QyJ25eHraqqU+zI21l9IL+pFG81Q99se+bulWDOeM3W2znv5FfsRJn94d
 b+CtCUBF9F/5V5FJVRH6GBEMNVRcXxMTyGcCuV59EmzPgJWOLSkScHbNEKt+9snfyVqD
 zASeHALlxz1pJ8wTim9d5ExJdUxuuIOloR5KOToZNy9WqBMpGx2bVIFQilQJJ5HeysYF
 c8MWQcUdsssnWXuAdIBPKJsfjpwnBOyC3iDXthzIW8y82RH3k9dTb5Bpu7AQ9S66MVNt
 GvtQ==
X-Gm-Message-State: AOAM5323y6ArTrkhNKDJJyf7Yjlxhz7B+TWFrksv23pXkxE3jbD/nLnb
 R//iGSxLj2LLZvpei07y4g==
X-Google-Smtp-Source: ABdhPJy6x7S+eSVx9q7Igzxyr2K1XEbKHIhryPB4QHiwBFsbh27DOpX4yS0+Rq73HgdN+mL57gNq8A==
X-Received: by 2002:aca:5e03:: with SMTP id s3mr613140oib.125.1603918032930;
 Wed, 28 Oct 2020 13:47:12 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:47:12 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 09/13] PCI: dwc: Rework MSI initialization
Date: Wed, 28 Oct 2020 15:46:42 -0500
Message-Id: <20201028204646.356535-10-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_164715_149166_5EF24B5E 
X-CRM114-Status: GOOD (  23.19  )
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

There are 3 possible MSI implementations for the DWC host. The first is
using the built-in DWC MSI controller. The 2nd is a custom MSI
controller as part of the PCI host (keystone only). The 3rd is an
external MSI controller (typically GICv3 ITS). Currently, the last 2
are distinguished with a .msi_host_init() hook with the 3rd option using
an empty function. However we can detect the 3rd case with the presence
of 'msi-parent' or 'msi-map' properties, so let's do that instead and
remove the empty functions.

Cc: Murali Karicheri <m-karicheri2@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>
Cc: Mingkai Hu <mingkai.hu@nxp.com>
Cc: Roy Zang <roy.zang@nxp.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-keystone.c     |  9 -------
 drivers/pci/controller/dwc/pci-layerscape.c   | 25 -------------------
 .../pci/controller/dwc/pcie-designware-host.c | 20 +++++++++------
 drivers/pci/controller/dwc/pcie-designware.h  |  1 +
 drivers/pci/controller/dwc/pcie-intel-gw.c    |  9 -------
 5 files changed, 13 insertions(+), 51 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 9cf14f13798b..784385ae6074 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -272,14 +272,6 @@ static void ks_pcie_handle_legacy_irq(struct keystone_pcie *ks_pcie,
 	ks_pcie_app_writel(ks_pcie, IRQ_EOI, offset);
 }
 
-/*
- * Dummy function so that DW core doesn't configure MSI
- */
-static int ks_pcie_am654_msi_host_init(struct pcie_port *pp)
-{
-	return 0;
-}
-
 static void ks_pcie_enable_error_irq(struct keystone_pcie *ks_pcie)
 {
 	ks_pcie_app_writel(ks_pcie, ERR_IRQ_ENABLE_SET, ERR_IRQ_ALL);
@@ -854,7 +846,6 @@ static const struct dw_pcie_host_ops ks_pcie_host_ops = {
 
 static const struct dw_pcie_host_ops ks_pcie_am654_host_ops = {
 	.host_init = ks_pcie_host_init,
-	.msi_host_init = ks_pcie_am654_msi_host_init,
 };
 
 static irqreturn_t ks_pcie_err_irq_handler(int irq, void *priv)
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 53e56d54c482..0d84986c4c16 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -168,37 +168,12 @@ static int ls1021_pcie_host_init(struct pcie_port *pp)
 	return ls_pcie_host_init(pp);
 }
 
-static int ls_pcie_msi_host_init(struct pcie_port *pp)
-{
-	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
-	struct device *dev = pci->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *msi_node;
-
-	/*
-	 * The MSI domain is set by the generic of_msi_configure().  This
-	 * .msi_host_init() function keeps us from doing the default MSI
-	 * domain setup in dw_pcie_host_init() and also enforces the
-	 * requirement that "msi-parent" exists.
-	 */
-	msi_node = of_parse_phandle(np, "msi-parent", 0);
-	if (!msi_node) {
-		dev_err(dev, "failed to find msi-parent\n");
-		return -EINVAL;
-	}
-
-	of_node_put(msi_node);
-	return 0;
-}
-
 static const struct dw_pcie_host_ops ls1021_pcie_host_ops = {
 	.host_init = ls1021_pcie_host_init,
-	.msi_host_init = ls_pcie_msi_host_init,
 };
 
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
-	.msi_host_init = ls_pcie_msi_host_init,
 };
 
 static const struct dw_pcie_ops dw_ls1021_pcie_ops = {
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 0f77e4d4b385..6cebdd9bbd2e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -365,6 +365,10 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		pci->link_gen = of_pci_get_max_link_speed(np);
 
 	if (pci_msi_enabled()) {
+		pp->has_msi_ctrl = !(pp->ops->msi_host_init ||
+				     of_property_read_bool(np, "msi-parent") ||
+				     of_property_read_bool(np, "msi-map"));
+
 		if (!pp->num_vectors) {
 			pp->num_vectors = MSI_DEF_NUM_VECTORS;
 		} else if (pp->num_vectors > MAX_MSI_IRQS) {
@@ -372,7 +376,11 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			return -EINVAL;
 		}
 
-		if (!pp->ops->msi_host_init) {
+		if (pp->ops->msi_host_init) {
+			ret = pp->ops->msi_host_init(pp);
+			if (ret < 0)
+				return ret;
+		} else if (pp->has_msi_ctrl) {
 			if (!pp->msi_irq) {
 				pp->msi_irq = platform_get_irq_byname(pdev, "msi");
 				if (pp->msi_irq < 0) {
@@ -402,10 +410,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 				pp->msi_data = 0;
 				goto err_free_msi;
 			}
-		} else {
-			ret = pp->ops->msi_host_init(pp);
-			if (ret < 0)
-				return ret;
 		}
 	}
 
@@ -426,7 +430,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
 		return 0;
 
 err_free_msi:
-	if (pci_msi_enabled() && !pp->ops->msi_host_init)
+	if (pp->has_msi_ctrl)
 		dw_pcie_free_msi(pp);
 	return ret;
 }
@@ -436,7 +440,7 @@ void dw_pcie_host_deinit(struct pcie_port *pp)
 {
 	pci_stop_root_bus(pp->bridge->bus);
 	pci_remove_root_bus(pp->bridge->bus);
-	if (pci_msi_enabled() && !pp->ops->msi_host_init)
+	if (pp->has_msi_ctrl)
 		dw_pcie_free_msi(pp);
 }
 EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
@@ -544,7 +548,7 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 
 	dw_pcie_setup(pci);
 
-	if (pci_msi_enabled() && !pp->ops->msi_host_init) {
+	if (pp->has_msi_ctrl) {
 		num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
 
 		/* Initialize IRQ Status array */
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 96382dcb2859..5d374bab10d1 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -175,6 +175,7 @@ struct dw_pcie_host_ops {
 };
 
 struct pcie_port {
+	bool			has_msi_ctrl:1;
 	u64			cfg0_base;
 	void __iomem		*va_cfg0_base;
 	u32			cfg0_size;
diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index c562eb7454b1..292b9de86532 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -385,14 +385,6 @@ static int intel_pcie_rc_init(struct pcie_port *pp)
 	return intel_pcie_host_setup(lpp);
 }
 
-/*
- * Dummy function so that DW core doesn't configure MSI
- */
-static int intel_pcie_msi_init(struct pcie_port *pp)
-{
-	return 0;
-}
-
 static u64 intel_pcie_cpu_addr(struct dw_pcie *pcie, u64 cpu_addr)
 {
 	return cpu_addr + BUS_IATU_OFFSET;
@@ -404,7 +396,6 @@ static const struct dw_pcie_ops intel_pcie_ops = {
 
 static const struct dw_pcie_host_ops intel_pcie_dw_ops = {
 	.host_init =		intel_pcie_rc_init,
-	.msi_host_init =	intel_pcie_msi_init,
 };
 
 static const struct intel_pcie_soc pcie_data = {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
