Return-Path: <SRS0=bq/Q=ED=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D55C4363A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:48:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CE2B24823
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2020 20:48:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="md1VmCe6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CE2B24823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lInBDEZQQ3y7YDHXrfJY6Pq/bY8WsvQ6+pDccIIJ1C0=; b=md1VmCe63FETbJ3e4jNB/Uk7v
	vCqNtuaMjL0iAZ4Vy38zhkOBH0tdCO3eevSli1cT6SpvVXRrzLGW9Z3HNlz7OvU0SjI2j9uy/r1/6
	zo7e77MmNXs6xkLdoMvnuq8JbngAIFjGbnW89aSn/GrcqjkO3G5B5L5owqSXgHHqDxpjMuGccxSPD
	QTdO+FctfWnVCxHOm+kwAvGLfH3PGSeidNYhQEiqJ4Av3XwsbzTE4oiDNNLBlCzbO7wfO7ucylTse
	cNiIYxyPac52GPAbiXobVHueM9LvfsZSWvfPBlzFZi/w6fPFCTdGm6Q60Bgjo855GhpdGSie2w2Sv
	KqgXIaxEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXsMO-0000wc-G3; Wed, 28 Oct 2020 20:47:56 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXsLn-0000ic-Qt
 for linux-amlogic@lists.infradead.org; Wed, 28 Oct 2020 20:47:31 +0000
Received: by mail-ot1-f65.google.com with SMTP id m22so410987ots.4
 for <linux-amlogic@lists.infradead.org>; Wed, 28 Oct 2020 13:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4XkpBfVGL7XrEKDyAA/C46oOJNkiByh0tecVNjWZ6aA=;
 b=ASdXJMkraDj9KnCj+3MOaq+bsaHl/g9WO1aUmQ0ad3UVwjr8UVAxUh+ikiKrakOAho
 LfzB7wVs04/7gO6WPoo9+137fNXN667NkYMPD+SuAdU5XYXNZpYVdh3wR2IP64QOdiZ1
 mn9AJTDA2XsMjqzkDp2CmlDCf/Sd9jaA1+x9tcktc9uHZxnChtcVFwbpjqdCgk1CKay2
 B7oblmcgchxwyXM1BNJugze2uCTA1u6eGHJlHVB/lzd17ubyqgUnocbrWXMvv6Od3cjl
 qy3CuHxzKhYZqUd9slS/kKigqL3OFumrlIV7lGsesza2e6a/UoqlKbwHm8VWaMLLfMBj
 i4Jw==
X-Gm-Message-State: AOAM530JWN5t06C/JAsw3ri3L8C4WC3fuXGipxCW2dOqx3rHixDNB+CV
 QDaFAcnmqZFGdbUOZiAN7g==
X-Google-Smtp-Source: ABdhPJzIzmWWg20iJuPa9vvq48ZpazjFMwYkNbAfmht+TLICCFuKWPvn05OJglXIjHPgcyfcsQ1XUQ==
X-Received: by 2002:a9d:649:: with SMTP id 67mr829690otn.233.1603918037942;
 Wed, 28 Oct 2020 13:47:17 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id t17sm116123oor.3.2020.10.28.13.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 13:47:17 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 11/13] PCI: dwc: Move dw_pcie_msi_init() into core
Date: Wed, 28 Oct 2020 15:46:44 -0500
Message-Id: <20201028204646.356535-12-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028204646.356535-1-robh@kernel.org>
References: <20201028204646.356535-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_164720_061848_54746447 
X-CRM114-Status: GOOD (  21.20  )
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

The host drivers which call dw_pcie_msi_init() are all the ones using
the built-in MSI controller, so let's move it into the common DWC code.

Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
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
Cc: linux-omap@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@axis.com
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/dwc/pci-dra7xx.c           |  2 --
 drivers/pci/controller/dwc/pci-exynos.c           |  4 ----
 drivers/pci/controller/dwc/pci-imx6.c             |  1 -
 drivers/pci/controller/dwc/pci-meson.c            |  1 -
 drivers/pci/controller/dwc/pcie-artpec6.c         |  1 -
 drivers/pci/controller/dwc/pcie-designware-host.c |  8 +++++---
 drivers/pci/controller/dwc/pcie-designware-plat.c |  1 -
 drivers/pci/controller/dwc/pcie-designware.h      | 10 ----------
 drivers/pci/controller/dwc/pcie-histb.c           |  2 --
 drivers/pci/controller/dwc/pcie-kirin.c           |  1 -
 drivers/pci/controller/dwc/pcie-qcom.c            |  2 --
 drivers/pci/controller/dwc/pcie-spear13xx.c       |  6 +-----
 drivers/pci/controller/dwc/pcie-tegra194.c        |  2 --
 drivers/pci/controller/dwc/pcie-uniphier.c        |  1 -
 14 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 054423d9646d..72a5a2bf933b 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -182,8 +182,6 @@ static int dra7xx_pcie_host_init(struct pcie_port *pp)
 	struct dra7xx_pcie *dra7xx = to_dra7xx_pcie(pci);
 
 	dw_pcie_setup_rc(pp);
-
-	dw_pcie_msi_init(pp);
 	dra7xx_pcie_enable_interrupts(dra7xx);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 6498b615c834..3939fe22e8a2 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -273,12 +273,8 @@ static irqreturn_t exynos_pcie_irq_handler(int irq, void *arg)
 
 static void exynos_pcie_msi_init(struct exynos_pcie *ep)
 {
-	struct dw_pcie *pci = ep->pci;
-	struct pcie_port *pp = &pci->pp;
 	u32 val;
 
-	dw_pcie_msi_init(pp);
-
 	/* enable MSI interrupt */
 	val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_IRQ_EN_LEVEL);
 	val |= IRQ_MSI_ENABLE;
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 20e249efb02c..c808b563486f 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -835,7 +835,6 @@ static int imx6_pcie_host_init(struct pcie_port *pp)
 	imx6_pcie_deassert_core_reset(imx6_pcie);
 	imx6_setup_phy_mpll(imx6_pcie);
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 41a3351b100b..2df0adcf0bf2 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -381,7 +381,6 @@ static int meson_pcie_host_init(struct pcie_port *pp)
 	meson_set_max_rd_req_size(mp, MAX_READ_REQ_SIZE);
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
index 8b3da3038ac3..7ee8f3c83f8f 100644
--- a/drivers/pci/controller/dwc/pcie-artpec6.c
+++ b/drivers/pci/controller/dwc/pcie-artpec6.c
@@ -329,7 +329,6 @@ static int artpec6_pcie_host_init(struct pcie_port *pp)
 	artpec6_pcie_deassert_core_reset(artpec6_pcie);
 	artpec6_pcie_wait_for_phy(artpec6_pcie);
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index f5f9d4e58aa3..025514e00a42 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -256,7 +256,7 @@ int dw_pcie_allocate_domains(struct pcie_port *pp)
 	return 0;
 }
 
-void dw_pcie_free_msi(struct pcie_port *pp)
+static void dw_pcie_free_msi(struct pcie_port *pp)
 {
 	if (pp->msi_irq) {
 		irq_set_chained_handler(pp->msi_irq, NULL);
@@ -275,12 +275,12 @@ void dw_pcie_free_msi(struct pcie_port *pp)
 	}
 }
 
-void dw_pcie_msi_init(struct pcie_port *pp)
+static void dw_pcie_msi_init(struct pcie_port *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	u64 msi_target = (u64)pp->msi_data;
 
-	if (!IS_ENABLED(CONFIG_PCI_MSI))
+	if (!pci_msi_enabled() || !pp->has_msi_ctrl)
 		return;
 
 	/* Program the msi_data */
@@ -423,6 +423,8 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			goto err_free_msi;
 	}
 
+	dw_pcie_msi_init(pp);
+
 	if (!dw_pcie_link_up(pci) && pci->ops->start_link) {
 		ret = pci->ops->start_link(pci);
 		if (ret)
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index adebcaeb1a6c..dec24e595c3e 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -36,7 +36,6 @@ static const struct of_device_id dw_plat_pcie_of_match[];
 static int dw_plat_pcie_host_init(struct pcie_port *pp)
 {
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 5d374bab10d1..57326aebc6e1 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -363,8 +363,6 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
 
 #ifdef CONFIG_PCIE_DW_HOST
 irqreturn_t dw_handle_msi_irq(struct pcie_port *pp);
-void dw_pcie_msi_init(struct pcie_port *pp);
-void dw_pcie_free_msi(struct pcie_port *pp);
 void dw_pcie_setup_rc(struct pcie_port *pp);
 int dw_pcie_host_init(struct pcie_port *pp);
 void dw_pcie_host_deinit(struct pcie_port *pp);
@@ -377,14 +375,6 @@ static inline irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
 	return IRQ_NONE;
 }
 
-static inline void dw_pcie_msi_init(struct pcie_port *pp)
-{
-}
-
-static inline void dw_pcie_free_msi(struct pcie_port *pp)
-{
-}
-
 static inline void dw_pcie_setup_rc(struct pcie_port *pp)
 {
 }
diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
index ece544165059..210777c793ea 100644
--- a/drivers/pci/controller/dwc/pcie-histb.c
+++ b/drivers/pci/controller/dwc/pcie-histb.c
@@ -199,8 +199,6 @@ static int histb_pcie_host_init(struct pcie_port *pp)
 	/* setup root complex */
 	dw_pcie_setup_rc(pp);
 
-	dw_pcie_msi_init(pp);
-
 	return 0;
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/controller/dwc/pcie-kirin.c
index 675b4d8392d3..f84ac1b36b2c 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -406,7 +406,6 @@ static int kirin_pcie_host_init(struct pcie_port *pp)
 	pp->bridge->ops = &kirin_pci_ops;
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8eb8ac2fb270..eb107179d544 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1281,8 +1281,6 @@ static int qcom_pcie_host_init(struct pcie_port *pp)
 	}
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
-
 	qcom_ep_reset_deassert(pcie);
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-spear13xx.c b/drivers/pci/controller/dwc/pcie-spear13xx.c
index ebbaa06fc8ab..31475e4493a7 100644
--- a/drivers/pci/controller/dwc/pcie-spear13xx.c
+++ b/drivers/pci/controller/dwc/pcie-spear13xx.c
@@ -102,16 +102,12 @@ static irqreturn_t spear13xx_pcie_irq_handler(int irq, void *arg)
 
 static void spear13xx_pcie_enable_interrupts(struct spear13xx_pcie *spear13xx_pcie)
 {
-	struct dw_pcie *pci = spear13xx_pcie->pci;
-	struct pcie_port *pp = &pci->pp;
 	struct pcie_app_reg *app_reg = spear13xx_pcie->app_base;
 
 	/* Enable MSI interrupt */
-	if (IS_ENABLED(CONFIG_PCI_MSI)) {
-		dw_pcie_msi_init(pp);
+	if (IS_ENABLED(CONFIG_PCI_MSI))
 		writel(readl(&app_reg->int_mask) |
 				MSI_CTRL_INT, &app_reg->int_mask);
-	}
 }
 
 static int spear13xx_pcie_link_up(struct dw_pcie *pci)
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index f7d7b002a06d..84f3e0bb4c7a 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -765,8 +765,6 @@ static void tegra_pcie_enable_msi_interrupts(struct pcie_port *pp)
 	struct tegra_pcie_dw *pcie = to_tegra_pcie(pci);
 	u32 val;
 
-	dw_pcie_msi_init(pp);
-
 	/* Enable MSI interrupt generation */
 	val = appl_readl(pcie, APPL_INTR_EN_L0_0);
 	val |= APPL_INTR_EN_L0_0_SYS_MSI_INTR_EN;
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index f4b776e231d6..e6616408a29c 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -315,7 +315,6 @@ static int uniphier_pcie_host_init(struct pcie_port *pp)
 	uniphier_pcie_irq_enable(priv);
 
 	dw_pcie_setup_rc(pp);
-	dw_pcie_msi_init(pp);
 
 	return 0;
 }
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
