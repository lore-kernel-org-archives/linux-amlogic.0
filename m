Return-Path: <SRS0=W5Tv=B7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374E3C433E1
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:13:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E321420855
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2020 04:13:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zELjIXIL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QfrNyZSB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E321420855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gye4zryRi8sNycWqO1Pw35r21oqCE0gw94i4R0jJxnw=; b=zELjIXIL64PSzrrKmqI2LfypL
	bhIfjj/y9ZEiz7qepQ9CHM1VkDdloAM1yLSZveTY3nmHK3oVwasWuQY3HAuym8z8yMjzEfKaU0Dij
	4IYK5L2rm6FKw1sF94wssQAB540BNrZwCqrIYt9ijn84R059ASTzPS+aRRvSDRbiQxuW2+y/WDh2/
	KpYggAkokco1IAN2qCkWMKRpUHcv7+YV6UbVuz5mvL+rzfSPv0IglhCGWv31KgGO77Qj4mCnTBbJM
	rR5WWS5tXmdG4Ni98yXuxp7iI/rDQR/T40WbmJX2iotoB+QsJK7RomnQEzNwmCem3PYfqK2KxP5Ys
	ri9i0sMDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8yQB-0004Fu-C5; Fri, 21 Aug 2020 04:12:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8yOA-00034Q-6j; Fri, 21 Aug 2020 04:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=dNUyiy2kVu/ughaJBkWT5/klsWfmnY1eOnmRRwapWCs=; b=QfrNyZSBIn/v+3JVUSg55SDKXz
 TTctml7xJ8htYph7ID4kyHzZ6BLvaSIavWe54npnUMf013U2gxY685bYdqHpm/LQ32Kkw9mWN8p17
 0A/2IUHRoXIOBv3xJrqVCHBMmUZWnSARM/IBKd93oJgY03BE02RheIYavJsmLn9gmt3U76MWJZRru
 8Tnh5oWryEBshlpPRc51k9MAqiiWCtrtUa11lRkF+/LZ5myAtSxo+PT0wQjuwp4qRJSFignKh0wov
 f94mDnII9IUvX5arRW+n/dGfj0wlU+GLAHsR95fls4zociWRQAi+kgmA0FvH++kvvPz4khBOOu4FF
 1NRHyQ8w==;
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8y9e-0001I8-W1; Fri, 21 Aug 2020 03:55:54 +0000
Received: by mail-il1-f196.google.com with SMTP id k4so314468ilr.12;
 Thu, 20 Aug 2020 20:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dNUyiy2kVu/ughaJBkWT5/klsWfmnY1eOnmRRwapWCs=;
 b=ABAXNglv36ZwRyY4WY/AWVUPUfC2Mc0gY4hyhDoVb+/9hpPEqw+mMHxh0Zps7vUKSq
 xZ350B6O0jXj6UJ8nRitZQrYyI3nr+Gs7oMK21KjRjqnSe95csMqGh4QJ4x/kYdj8lzv
 xu4yM0eRseCgOO6Wjg8bnXR96HUpjlhAc8B10c9VMlBVdEYXy/rDgoahZc8tB53OIGsI
 iwpJpXNqha2y/f8MKLQrNYT3d2NtdHd3y8fD4lGgLvVXy/Cgl0F1XFaQ5IUR4Ayw+SCm
 MTgRfLOCU2CH5epJCgog5ewpd7JTZ+SNYRVoHuLWuhDtZhHJwbFN0hhY11b9RXKDmAbN
 ruVg==
X-Gm-Message-State: AOAM532D82fbXxij/Su3AQ8s6BfF0TA5E4/5Yw5fZPS5MEQUHwT1AVcd
 RdDA4bF+ahzh1iCFelwlHg==
X-Google-Smtp-Source: ABdhPJzMoV8+5/DEmM4lA3ju060HMjXV6nuKAO3ZvJwnkwzK6l/Wx4wtZJr53/FtUHv/jZc8Veb01w==
X-Received: by 2002:a92:c88f:: with SMTP id w15mr959860ilo.285.1597982149590; 
 Thu, 20 Aug 2020 20:55:49 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id 79sm413923ilc.9.2020.08.20.20.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 20:55:49 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v2 21/40] PCI: dwc: Check CONFIG_PCI_MSI inside
 dw_pcie_msi_init()
Date: Thu, 20 Aug 2020 21:54:01 -0600
Message-Id: <20200821035420.380495-22-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821035420.380495-1-robh@kernel.org>
References: <20200821035420.380495-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045551_272063_619C0E75 
X-CRM114-Status: GOOD (  15.87  )
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
 Jonathan Chocron <jonnyc@amazon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Marc Zyngier <maz@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Dilip Kota <eswara.kota@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Shawn Guo <shawn.guo@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Move the IS_ENABLED(CONFIG_PCI_MSI) check into dw_pcie_msi_init()
instead of duplicating it in all the drivers.

Cc: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Yue Wang <yue.wang@Amlogic.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Xiaowei Song <songxiaowei@hisilicon.com>
Cc: Binghui Wang <wangbinghui@hisilicon.com>
Cc: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@axis.com
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-imx6.c             |  4 +---
 drivers/pci/controller/dwc/pci-meson.c            |  8 +-------
 drivers/pci/controller/dwc/pcie-artpec6.c         | 11 +----------
 drivers/pci/controller/dwc/pcie-designware-host.c |  3 +++
 drivers/pci/controller/dwc/pcie-designware-plat.c |  4 +---
 drivers/pci/controller/dwc/pcie-histb.c           |  4 +---
 drivers/pci/controller/dwc/pcie-kirin.c           |  4 +---
 drivers/pci/controller/dwc/pcie-qcom.c            |  4 +---
 drivers/pci/controller/dwc/pcie-uniphier.c        |  3 +--
 9 files changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 90df28c7cb0c..68a09680e728 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -847,9 +847,7 @@ static int imx6_pcie_host_init(struct pcie_port *pp)
 	imx6_setup_phy_mpll(imx6_pcie);
 	dw_pcie_setup_rc(pp);
 	imx6_pcie_establish_link(imx6_pcie);
-
-	if (IS_ENABLED(CONFIG_PCI_MSI))
-		dw_pcie_msi_init(pp);
+	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index f4d822190359..67ca73528aad 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -377,12 +377,6 @@ static int meson_pcie_establish_link(struct meson_pcie *mp)
 	return dw_pcie_wait_for_link(pci);
 }
 
-static void meson_pcie_enable_interrupts(struct meson_pcie *mp)
-{
-	if (IS_ENABLED(CONFIG_PCI_MSI))
-		dw_pcie_msi_init(&mp->pci.pp);
-}
-
 static int meson_pcie_rd_own_conf(struct pci_bus *bus, u32 devfn,
 				  int where, int size, u32 *val)
 {
@@ -466,7 +460,7 @@ static int meson_pcie_host_init(struct pcie_port *pp)
 	if (ret)
 		return ret;
 
-	meson_pcie_enable_interrupts(mp);
+	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 97d50bb50f06..86f4d66d8587 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -346,15 +346,6 @@ static void artpec6_pcie_deassert_core_reset(struct artpec6_pcie *artpec6_pcie)
 	usleep_range(100, 200);
 }
 
-static void artpec6_pcie_enable_interrupts(struct artpec6_pcie *artpec6_pcie)
-{
-	struct dw_pcie *pci = artpec6_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
-
-	if (IS_ENABLED(CONFIG_PCI_MSI))
-		dw_pcie_msi_init(pp);
-}
-
 static int artpec6_pcie_host_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -368,7 +359,7 @@ static int artpec6_pcie_host_init(struct pcie_port *pp)
 	dw_pcie_setup_rc(pp);
 	artpec6_pcie_establish_link(pci);
 	dw_pcie_wait_for_link(pci);
-	artpec6_pcie_enable_interrupts(artpec6_pcie);
+	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 06f6cbefeb95..1c750659aef8 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -276,6 +276,9 @@ void dw_pcie_msi_init(struct pcie_port *pp)
 	struct device *dev = pci->dev;
 	u64 msi_target;
 
+	if (!IS_ENABLED(CONFIG_PCI_MSI))
+		return;
+
 	pp->msi_page = alloc_page(GFP_KERNEL);
 	pp->msi_data = dma_map_page(dev, pp->msi_page, 0, PAGE_SIZE,
 				    DMA_FROM_DEVICE);
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index 712456f6ce36..e3e300669ed5 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -39,9 +39,7 @@ static int dw_plat_pcie_host_init(struct pcie_port *pp)
 
 	dw_pcie_setup_rc(pp);
 	dw_pcie_wait_for_link(pci);
-
-	if (IS_ENABLED(CONFIG_PCI_MSI))
-		dw_pcie_msi_init(pp);
+	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index af1deae2b15d..afc1abbe49aa 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -202,9 +202,7 @@ static int histb_pcie_host_init(struct pcie_port *pp)
 	pp->bridge->ops = &histb_pci_ops;
 
 	histb_pcie_establish_link(pp);
-
-	if (IS_ENABLED(CONFIG_PCI_MSI))
-		dw_pcie_msi_init(pp);
+	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 8a01ab0a4a65..6f01ae013326 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -429,9 +429,7 @@ static int kirin_pcie_host_init(struct pcie_port *pp)
 	pp->bridge->ops = &kirin_pci_ops;
 
 	kirin_pcie_establish_link(pp);
-
-	if (IS_ENABLED(CONFIG_PCI_MSI))
-		dw_pcie_msi_init(pp);
+	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 3aac77a295ba..fe7fc2ccd76d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1280,9 +1280,7 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
 	}
 
 	dw_pcie_setup_rc(pp);
-
-	if (IS_ENABLED(CONFIG_PCI_MSI))
-		dw_pcie_msi_init(pp);
+	dw_pcie_msi_init(pp);
 
 	qcom_ep_reset_deassert(pcie);
 
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 3a7f403b57b8..48176265c867 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -322,8 +322,7 @@ static int uniphier_pcie_host_init(struct pcie_port *pp)
 	if (ret)
 		return ret;
 
-	if (IS_ENABLED(CONFIG_PCI_MSI))
-		dw_pcie_msi_init(pp);
+	dw_pcie_msi_init(pp);
 
 	return 0;
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
